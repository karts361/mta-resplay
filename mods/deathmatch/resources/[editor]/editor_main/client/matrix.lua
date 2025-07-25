--[[
	matrix v 0.2.8

	Lua 5.1 compatible

	'matrix' provides a good selection of matrix functions.

	With simple matrices this script is quite useful, though for more
	exact calculations, one would probably use a program like Matlab instead.
	Matrices of size 100x100 can still be handled very well.
	The error for the determinant and the inverted matrix is around 10^-9
 	with a 100x100 matrix and an element range from -100 to 100.

 	Characteristics:

	- functions called via matrix.<function> should be able to handle
	  any table matrix of structure t[i][j] = value
	- can handle a type of complex matrix
	- can handle symbolic matrices.(Symbolic matrices cannot be
	  used with complex matrices.)
	- arithmetic functions do not change the matrix itself
	  but build and return a new matrix
	- functions are intended to be light on checks
	  since one gets a Lua error on incorrect use anyways
	- uses mainly Gauss-Jordan elimination
	- for Lua tables optimised determinant calculation(fast)
		but not invoking any checks for special types of matrices
	- vectors can be set up via vec1 = matrix{{ 1,2,3 }}^'T' or matrix{1,2,3}
	- vectors can be multiplied scalar via num = vec1^'T' * vec2
		where num will be a matrix with the result in mtx[1][1],
		or use num = vec1:scalar(vec2), where num is a number

	Sites:
		http://luaforge.net/projects/LuaMatrix
		http://lua-users.org/wiki/SimpleMatrix

	Licensed under the same terms as Lua itself.

	Developers:
		Michael Lutz(chillcode)
		David Manura http://lua-users.org/wiki/DavidManura

	MODIFIED TO SUIT THE MTA SCRIPTING SYSTEM
]]--

--////////////
--// matrix //
--////////////

matrix = {}

-- access to the metatable we set at the end of the file
local matrix_meta = {}

-- access to the symbolic metatable
local symbol_meta = {}; symbol_meta.__index = symbol_meta
-- set up a symbol type
local function newsymbol(o)
	return setmetatable({tostring(o)}, symbol_meta)
end

--/////////////////////////////
--// Get 'new' matrix object //
--/////////////////////////////

--// matrix:new(rows [, comlumns [, value]])
-- if rows is a table then sets rows as matrix
-- if rows is a table of structure {1,2,3} then it sets it as a vector matrix
-- if rows and columns are given and are numbers, returns a matrix with size rowsxcolumns
-- if num is given then returns a matrix with given size and all values set to num
-- if rows is given as number and columns is "I", will return an identity matrix of size rowsxrows
function matrix:new(rows, columns, value)
	-- check for given matrix
	if type(rows) == "table" then
		-- check for vector
		if type(rows[1]) ~= "table" then -- expect a vector
			return setmetatable({{rows[1]},{rows[2]},{rows[3]}},matrix_meta)
		end
		return setmetatable(rows,matrix_meta)
	end
	-- get matrix table
	local mtx = {}
	local value = value or 0
	-- build identity matrix of given rows
	if columns == "I" then
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,rows do
				if i == j then
					mtx[i][j] = 1
				else
					mtx[i][j] = 0
				end
			end
		end
	-- build new matrix
	else
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,columns do
				mtx[i][j] = value
			end
		end
	end
	-- return matrix with shared metatable
	return setmetatable(mtx,matrix_meta)
end

--// matrix(rows [, comlumns [, value]])
-- set __call behaviour of matrix
-- for matrix(...) as matrix.new(...)
setmetatable(matrix, { __call = function(...) return matrix.new(...) end })


-- functions are designed to be light on checks
-- so we get Lua errors instead on wrong input
-- matrix.<functions> should handle any table of structure t[i][j] = value
-- we always return a matrix with scripts metatable
-- cause its faster than setmetatable(mtx, getmetatable(input matrix))

--///////////////////////////////
--// matrix 'matrix' functions //
--///////////////////////////////

--// for real, complx and symbolic matrices //--

-- note: real and complex matrices may be added, subtracted, etc.
--		real and symbolic matrices may also be added, subtracted, etc.
--		but one should avoid using symbolic matrices with complex ones
--		since it is not clear which metatable then is used

--// matrix.add(m1, m2)
-- Add 2 matrices; m2 may be of bigger size than m1
function matrix.add(m1, m2)
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] + m2[i][j]
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.sub(m1 ,m2)
-- Subtract 2 matrices; m2 may be of bigger size than m1
function matrix.sub(m1, m2)
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] - m2[i][j]
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.mul(m1, m2)
-- Multiply 2 matrices; m1 columns must be equal to m2 rows
-- e.g. #m1[1] == #m2
function matrix.mul(m1, m2)
	-- multiply rows with columns
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m2[1] do
			local num = m1[i][1] * m2[1][j]
			for n = 2,#m1[1] do
				num = num + m1[i][n] * m2[n][j]
			end
			mtx[i][j] = num
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--//  matrix.div(m1, m2)
-- Divide 2 matrices; m1 columns must be equal to m2 rows
-- m2 must be square, to be inverted,
-- if that fails returns the rank of m2 as second argument
-- e.g. #m1[1] == #m2; #m2 == #m2[1]
function matrix.div(m1, m2)
	local rank; m2,rank = matrix.invert(m2)
	if not m2 then return m2, rank end -- singular
	return matrix.mul(m1, m2)
end

--// matrix.mulnum(m1, num)
-- Multiply matrix with a number
-- num may be of type 'number','complex number' or 'string'
-- strings get converted to complex number, if that fails then to symbol
function matrix.mulnum(m1, num)
	if type(num) == "string" then
		num = complex.to(num) or newsymbol(num)
	end
	local mtx = {}
	-- multiply elements with number
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] * num
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.divnum(m1, num)
-- Divide matrix by a number
-- num may be of type 'number','complex number' or 'string'
-- strings get converted to complex number, if that fails then to symbol
function matrix.divnum(m1, num)
	if type(num) == "string" then
		num = complex.to(num) or newsymbol(num)
	end
	local mtx = {}
	-- divide elements by number
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] / num
		end
	end
	return setmetatable(mtx, matrix_meta)
end


--// for real and complex matrices only //--

--// matrix.pow(m1, num)
-- Power of matrix; mtx^(num)
-- num is an integer and may be negative
-- m1 has to be square
-- if num is negative and inverting m1 fails
-- returns the rank of matrix m1 as second argument
function matrix.pow(m1, num)
	assert(num == math.floor(num), "exponent not an integer")
	if num == 0 then
		return matrix:new(#m1,"I")
	end
	if num < 0 then
		local rank; m1,rank = matrix.invert(m1)
      if not m1 then return m1, rank end -- singular
		num = -num
	end
	local mtx = matrix.copy(m1)
	for i = 2,num	do
		mtx = matrix.mul(mtx,m1)
	end
	return mtx
end

--// matrix.det(m1)
-- Calculate the determinant of a matrix
-- m1 needs to be square
-- Can calc the det for symbolic matrices up to 3x3 too
-- The function to calculate matrices bigger 3x3
-- is quite fast and for matrices of medium size ~(100x100)
-- and average values quite accurate
-- here we try to get the nearest element to |1|,(smallest pivot element)
-- os that usually we have |mtx[i][j]/subdet| > 1 or mtx[i][j];
-- with complex matrices we use the complex.abs function to check if it is bigger or smaller
local fiszerocomplex = function(cx) return complex.is(cx,0,0) end
local fiszeronumber = function(num) return num == 0 end
function matrix.det(m1)

	-- check if matrix is quadratic
	assert(#m1 == #m1[1], "matrix not square")

	local size = #m1

	if size == 1 then
		return m1[1][1]
	end

	if size == 2 then
		return m1[1][1]*m1[2][2] - m1[2][1]*m1[1][2]
	end

	if size == 3 then
		return(m1[1][1]*m1[2][2]*m1[3][3] + m1[1][2]*m1[2][3]*m1[3][1] + m1[1][3]*m1[2][1]*m1[3][2]
			- m1[1][3]*m1[2][2]*m1[3][1] - m1[1][1]*m1[2][3]*m1[3][2] - m1[1][2]*m1[2][1]*m1[3][3])
	end

	--// no symbolic matrix supported below here

	local fiszero, abs
	if matrix.type(m1) == "complex" then
		fiszero = fiszerocomplex
		abs = complex.mulconjugate
	else
		fiszero = fiszeronumber
		abs = math.abs
	end

	--// matrix is bigger than 3x3
	-- get determinant
	-- using Gauss elimination and Laplace
	-- start eliminating from below better for removals
	-- get copy of matrix, set initial determinant
	local mtx = matrix.copy(m1)
	local det = 1
	-- get det up to the last element
	for j = 1,#mtx[1] do
		-- get smallest element so that |factor| > 1
		-- and set it as last element
		local rows = #mtx
		local subdet,xrow
		for i = 1,rows do
			-- get element
			local e = mtx[i][j]
			-- if no subdet has been found
			if not subdet then
				-- check if element it is not zero
				if not fiszero(e) then
					-- use element as new subdet
					subdet,xrow = e,i
				end
			-- check for elements nearest to 1 or -1
			elseif(not fiszero(e)) and math.abs(abs(e)-1) < math.abs(abs(subdet)-1) then
				subdet,xrow = e,i
			end
		end
		-- only cary on if subdet is found
		if subdet then
			-- check if xrow is the last row,
			-- else switch lines and multiply det by -1
			if xrow ~= rows then
				mtx[rows],mtx[xrow] = mtx[xrow],mtx[rows]
				det = -det
			end
			-- traverse all fields setting element to zero
			-- we don't set to zero cause we don't use that column anymore then anyways
			for i = 1,rows-1 do
				-- factor is the dividor of the first element
				-- if element is not already zero
				if not fiszero(mtx[i][j]) then
					local factor = mtx[i][j]/subdet
					-- update all remaining fields of the matrix, with value from xrow
					for n = j+1,#mtx[1] do
						mtx[i][n] = mtx[i][n] - factor * mtx[rows][n]
					end
				end
			end
			-- update determinant and remove row
			if math.fmod(rows,2) == 0 then
				det = -det
			end
			det = det * subdet
			table.remove(mtx)
		else
			-- break here table det is 0
			return det * 0
		end
	end
	-- det ready to return
	return det
end

--// matrix.dogauss(mtx)
-- Gauss elimination, Gauss-Jordan Method
-- this function changes the matrix itself
-- returns on success: true,
-- returns on failure: false,'rank of matrix'

-- locals
-- checking here for the nearest element to 1 or -1;(smallest pivot element)
-- this way the factor of the evolving number division should be > 1 or the divided number itself,
-- what gives better results
local setelementtosmallest = function(mtx,i,j,fiszero,fisone,abs)
	-- check if element is one
	if fisone(mtx[i][j]) then return true end
	-- check for lowest value
	local _ilow
	for _i = i,#mtx do
		local e = mtx[_i][j]
		if fisone(e) then
			break
		end
		if not _ilow then
			if not fiszero(e) then
				_ilow = _i
			end
		elseif(not fiszero(e)) and math.abs(abs(e)-1) < math.abs(abs(mtx[_ilow][j])-1) then
			_ilow = _i
		end
	end
	if _ilow then
		-- switch lines if not input line
		-- legal operation
		if _ilow ~= i then
			mtx[i],mtx[_ilow] = mtx[_ilow],mtx[i]
		end
		return true
	end
end
local cxfiszero = function(cx) return complex.is(cx,0,0) end
local cxfsetzero = function(mtx,i,j) complex.set(mtx[i][j],0,0) end
local cxfisone = function(cx) return complex.abs(cx) == 1 end
local cxfsetone = function(mtx,i,j) complex.set(mtx[i][j],1,0) end
local numfiszero = function(num) return num == 0 end
local numfsetzero = function(mtx,i,j) mtx[i][j] = 0 end
local numfisone = function(num) return math.abs(num) == 1 end
local numfsetone = function(mtx,i,j) mtx[i][j] = 1 end
-- note: in --// ... //-- we have a way that does no divison,
-- however with big number and matrices we get problems since we do no reducing
function matrix.dogauss(mtx)
	local fiszero,fsetzero,fisone,fsetone,abs
	if matrix.type(mtx) == "complex" then
		fiszero = cxfiszero
		fsetzero = cxfsetzero
		fisone = cxfisone
		fsetone = cxfsetone
		abs = complex.mulconjugate
	else
		fiszero = numfiszero
		fsetzero = numfsetzero
		fisone = numfisone
		fsetone = numfsetone
		abs = math.abs
	end
	local rows,columns = #mtx,#mtx[1]
	-- stairs left -> right
	for j = 1,rows do
		-- check if element can be setted to one
		if setelementtosmallest(mtx,j,j,fiszero,fisone,abs) then
			-- start parsing rows
			for i = j+1,rows do
				-- check if element is not already zero
				if not fiszero(mtx[i][j]) then
					-- we may add x*otherline row, to set element to zero
					-- tozero - x*mtx[j][j] = 0; x = tozero/mtx[j][j]
					local factor = mtx[i][j]/mtx[j][j]
					--// this should not be used although it does no division,
					-- yet with big matrices(since we do no reducing and other things)
					-- we get too big numbers
					--local factor1,factor2 = mtx[i][j],mtx[j][j] //--
					fsetzero(mtx,i,j)
					for _j = j+1,columns do
						--// mtx[i][_j] = mtx[i][_j] * factor2 - factor1 * mtx[j][_j] //--
						mtx[i][_j] = mtx[i][_j] - factor * mtx[j][_j]
					end
				end
			end
		else
			-- return false and the rank of the matrix
			return false,j-1
		end
	end
	-- stairs right <- left
	for j = rows,1,-1 do
		-- set element to one
		-- do division here
		local div = mtx[j][j]
		for _j = j+1,columns do
			mtx[j][_j] = mtx[j][_j] / div
		end
		-- start parsing rows
		for i = j-1,1,-1 do
			-- check if element is not already zero
			if not fiszero(mtx[i][j]) then
				local factor = mtx[i][j]
				for _j = j+1,columns do
					mtx[i][_j] = mtx[i][_j] - factor * mtx[j][_j]
				end
				fsetzero(mtx,i,j)
			end
		end
		fsetone(mtx,j,j)
	end
	return true
end

--// matrix.invert(m1)
-- Get the inverted matrix or m1
-- matrix must be square and not singular
-- on success: returns inverted matrix
-- on failure: returns nil,'rank of matrix'
function matrix.invert(m1)
	assert(#m1 == #m1[1], "matrix not square")
	local mtx = matrix.copy(m1)
	local ident = setmetatable({},matrix_meta)
	if matrix.type(mtx) == "complex" then
		for i = 1,#m1 do
			ident[i] = {}
			for j = 1,#m1 do
				if i == j then
					ident[i][j] = complex.new(1,0)
				else
					ident[i][j] = complex.new(0,0)
				end
			end
		end
	else
		for i = 1,#m1 do
			ident[i] = {}
			for j = 1,#m1 do
				if i == j then
					ident[i][j] = 1
				else
					ident[i][j] = 0
				end
			end
		end
	end
	mtx = matrix.concath(mtx,ident)
	local done,rank = matrix.dogauss(mtx)
	if done then
		return matrix.subm(mtx, 1,(#mtx[1]/2)+1,#mtx,#mtx[1])
	else
		return nil,rank
	end
end

--// matrix.sqrt(m1 [,iters])
-- calculate the square root of a matrix using "DenmanBeavers square root iteration"
-- condition: matrix rows == matrix columns; must have a invers matrix and a square root
-- if called without additional arguments, the function finds the first nearest square root to
-- input matrix, there are others but the error between them is very small
-- if called with agument iters, the function will return the matrix by number of iterations
-- the script returns:
--		as first argument, matrix^.5
--		as second argument, matrix^-.5
--		as third argument, the average error between(matrix^.5)^2-inputmatrix
-- you have to determin for yourself if the result is sufficent enough for you
-- local average error
local function get_abs_avg(m1, m2)
	local dist = 0
	local abs = matrix.type(m1) == "complex" and complex.abs or math.abs
	for i=1,#m1 do
		for j=1,#m1[1] do
			dist = dist + abs(m1[i][j]-m2[i][j])
		end
	end
	-- norm by numbers of entries
	return dist/ (#m1*2)
end
-- square root function
function matrix.sqrt(m1, iters)
	assert(#m1 == #m1[1], "matrix not square")
	local iters = iters or math.huge
	local y = matrix.copy(m1)
	local z = matrix(#y, 'I')
	local dist = math.huge
	-- iterate, and get the average error
	for n=1,iters do
		local lasty,lastz = y,z
		-- calc square root
		-- y, z = (1/2)* (y + z^-1),(1/2)* (z + y^-1)
		y, z = matrix.divnum((matrix.add(y,matrix.invert(z))),2),
				matrix.divnum((matrix.add(z,matrix.invert(y))),2)
		local dist1 = get_abs_avg(y,lasty)
		if iters == math.huge then
			if dist1 >= dist then
				return lasty,lastz,get_abs_avg(matrix.mul(lasty,lasty),m1)
			end
		end
		dist = dist1
	end
	return y,z,get_abs_avg(matrix.mul(y,y),m1)
end

--// matrix.root(m1, root [,iters])
-- calculate any root of a matrix
-- source: http://www.dm.unipi.it/~cortona04/slides/bruno.pdf
-- m1 and root have to be given;(m1 = matrix, root = number)
-- conditions same as matrix.sqrt
-- returns same values as matrix.sqrt
function matrix.root(m1, root, iters)
	assert(#m1 == #m1[1], "matrix not square")
	local iters = iters or math.huge
	local mx = matrix.copy(m1)
	local my = matrix.mul(mx:invert(),mx:pow(root-1))
	local dist = math.huge
	-- iterate, and get the average error
	for n=1,iters do
		local lastx,lasty = mx,my
		-- calc root of matrix
		--mx,my = ((p-1)*mx + my^-1)/p,
		--	((((p-1)*my + mx^-1)/p)*my^-1)^(p-2) *
		--	((p-1)*my + mx^-1)/p
		mx,my = mx:mulnum(root-1):add(my:invert()):divnum(root),
			my:mulnum(root-1):add(mx:invert()):divnum(root)
				:mul(my:invert():pow(root-2)):mul(my:mulnum(root-1)
				:add(mx:invert())):divnum(root)
		local dist1 = get_abs_avg(mx,lastx)
		if iters == math.huge then
			if dist1 >= dist then
				return lastx,lasty,get_abs_avg(matrix.pow(lastx,root),m1)
			end
		end
		dist = dist1
	end
	return mx,my,get_abs_avg(matrix.pow(mx,root),m1)
end


--// Norm functions //--

--// matrix.normf(mtx)
-- calculates the Frobenius norm of the matrix.
--   ||mtx||_F = sqrt(SUM_{i,j} |a_{i,j}|^2)
-- http://en.wikipedia.org/wiki/Frobenius_norm#Frobenius_norm
function matrix.normf(mtx)
	local mtype = matrix.type(mtx)
	local result = 0
	for i = 1,#mtx do
	for j = 1,#mtx[1] do
		local e = mtx[i][j]
		if mtype ~= "number" then e = e:abs() end
		result = result + e^2
	end
	end
	local sqrt = (type(result) == "number") and math.sqrt or result.sqrt
	return sqrt(result)
end

--// matrix.normmax(mtx)
-- calculates the max norm of the matrix.
--   ||mtx||_{max} = max{|a_{i,j}|}
-- Does not work with symbolic matrices
-- http://en.wikipedia.org/wiki/Frobenius_norm#Max_norm
function matrix.normmax(mtx)
	local abs = (matrix.type(mtx) == "number") and math.abs or mtx[1][1].abs
	local result = 0
	for i = 1,#mtx do
	for j = 1,#mtx[1] do
		local e = abs(mtx[i][j])
		if e > result then result = e end
	end
	end
	return result
end


--// only for number and complex type //--
-- Functions changing the matrix itself

--// matrix.round(mtx [, idp])
-- perform round on elements
local numround = function(num,mult)
	return math.floor(num * mult + 0.5) / mult
end
local tround = function(t,mult)
	for i,v in ipairs(t) do
		t[i] = math.floor(v * mult + 0.5) / mult
	end
	return t
end
function matrix.round(mtx, idp)
	local mult = 10^(idp or 0)
	local fround = matrix.type(mtx) == "number" and numound or tround
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = fround(mtx[i][j],mult)
		end
	end
	return mtx
end

--// matrix.random(mtx [,start] [, stop] [, idip])
-- fillmatrix with random values
local numfill = function(_,start,stop,idp)
	return math.random(start,stop) / idp
end
local tfill = function(t,start,stop,idp)
	for i in ipairs(t) do
		t[i] = math.random(start,stop) / idp
	end
	return t
end
function matrix.random(mtx,start,stop,idp)
	local start,stop,idp = start or -10,stop or 10,idp or 1
	local ffill = matrix.type(mtx) == "number" and numfill or tfill
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = ffill(mtx[i][j], start, stop, idp)
		end
	end
	return mtx
end


--//////////////////////////////
--// Object Utility Functions //
--//////////////////////////////

--// for all types and matrices //--

--// matrix.type(mtx)
-- get type of matrix, normal/complex/symbol or tensor
function matrix.type(mtx)
	if type(mtx[1][1]) == "table" then
		if complex.type(mtx[1][1]) then
			return "complex"
		end
		if getmetatable(mtx[1][1]) == symbol_meta then
			return "symbol"
		end
		return "tensor"
	end
	return "number"
end

-- local functions to copy matrix values
local num_copy = function(num)
	return num
end
local t_copy = function(t)
	local newt = setmetatable({}, getmetatable(t))
	for i,v in ipairs(t) do
		newt[i] = v
	end
	return newt
end

--// matrix.copy(m1)
-- Copy a matrix
-- simple copy, one can write other functions oneself
function matrix.copy(m1)
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1[1] do
		mtx[i] = {}
		for j = 1,#m1 do
			mtx[i][j] = docopy(m1[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.transpose(m1)
-- Transpose a matrix
-- switch rows and columns
function matrix.transpose(m1)
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1[1] do
		mtx[i] = {}
		for j = 1,#m1 do
			mtx[i][j] = docopy(m1[j][i])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.subm(m1, i1, j1, i2, j2)
-- Submatrix out of a matrix
-- input: i1,j1,i2,j2
-- i1,j1 are the start element
-- i2,j2 are the end element
-- condition: i1,j1,i2,j2 are elements of the matrix
function matrix.subm(m1,i1,j1,i2,j2)
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	local mtx = {}
	for i = i1,i2 do
		local _i = i-i1+1
		mtx[_i] = {}
		for j = j1,j2 do
			local _j = j-j1+1
			mtx[_i][_j] = docopy(m1[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.concath(m1, m2)
-- Concatenate 2 matrices, horizontal
-- will return m1m2; rows have to be the same
-- e.g.: #m1 == #m2
function matrix.concath(m1,m2)
	assert(#m1 == #m2, "matrix size mismatch")
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	local mtx = {}
	local offset = #m1[1]
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,offset do
			mtx[i][j] = docopy(m1[i][j])
		end
		for j = 1,#m2[1] do
			mtx[i][j+offset] = docopy(m2[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.concatv(m1, m2)
-- Concatenate 2 matrices, vertical
-- will return	m1
--					m2
-- columns have to be the same; e.g.: #m1[1] == #m2[1]
function matrix.concatv(m1,m2)
	assert(#m1[1] == #m2[1], "matrix size mismatch")
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = docopy(m1[i][j])
		end
	end
	local offset = #mtx
	for i = 1,#m2 do
		local _i = i + offset
		mtx[_i] = {}
		for j = 1,#m2[1] do
			mtx[_i][j] = docopy(m2[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.rotl(m1)
-- Rotate Left, 90 degrees
function matrix.rotl(m1)
	local mtx = matrix:new(#m1[1],#m1)
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			mtx[#m1[1]-j+1][i] = docopy(m1[i][j])
		end
	end
	return mtx
end

--// matrix.rotr(m1)
-- Rotate Right, 90 degrees
function matrix.rotr(m1)
	local mtx = matrix:new(#m1[1],#m1)
	local docopy = matrix.type(m1) == "number" and num_copy or t_copy
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			mtx[j][#m1-i+1] = docopy(m1[i][j])
		end
	end
	return mtx
end

-- local get_elemnts in string
local get_tstr = function(t)
	return "["..table.concat(t,",").."]"
end
local get_str = function(e)
	return tostring(e)
end
-- local get_elemnts in string and formated
local getf_tstr = function(t,fstr)
	local tval = {}
	for i,v in ipairs(t) do
		tval[i] = string.format(fstr,v)
	end
	return "["..table.concat(tval,",").."]"
end
local getf_cxstr = function(e,fstr)
	return complex.tostring(e,fstr)
end
local getf_symstr = function(e,fstr)
	return string.format(fstr,e[1])
end
local getf_str = function(e,fstr)
	return string.format(fstr,e)
end

--// matrix.tostring(mtx, formatstr)
-- tostring function
function matrix.tostring(mtx, formatstr)
	local ts = {}
	local getstr
	if formatstr then -- get str formatted
		local mtype = matrix.type(mtx)
		if mtype == "tensor" then getstr = getf_tstr
		elseif mtype == "complex" then getstr = getf_cxstr
		elseif mtype == "symbol" then getstr = getf_symstr
		else getstr = getf_str end
		-- iteratr
		for i = 1,#mtx do
			local tstr = {}
			for j = 1,#mtx[1] do
				tstr[j] = getstr(mtx[i][j],formatstr)
			end
			ts[i] = table.concat(tstr, "\t")
		end
	else
		getstr = matrix.type(mtx) == "tensor" and get_tstr or get_str
		for i = 1,#mtx do
			local tstr = {}
			for j = 1,#mtx[1] do
				tstr[j] = getstr(mtx[i][j])
			end
			ts[i] = table.concat(tstr, "\t")
		end
	end
	return table.concat(ts, "\n")
end

--// matrix.print(mtx [, formatstr])
-- print out the matrix, just calls tostring
function matrix.print(...)
	print(matrix.tostring(...))
end

--// matrix.latex(mtx [, align])
-- LaTeX output
function matrix.latex(mtx, align)
	-- align : option to align the elements
	--		c = center; l = left; r = right
	--		\usepackage{dcolumn}; D{.}{,}{-1}; aligns number by . replaces it with ,
	local align = align or "c"
	local str = "$\\left(\\begin{array}{"..string.rep(align, #mtx[1]).."}\n"
	local getstr = matrix.type(mtx) == "tensor" and get_tstr or get_str
	for i = 1,#mtx do
		str = str.."\t"..getstr(mtx[i][1])
		for j = 2,#mtx[1] do
			str = str.." & "..getstr(mtx[i][j])
		end
		-- close line
		if i == #mtx then
			str = str.."\n"
		else
			str = str.." \\\\\n"
		end
	end
	return str.."\\end{array} \\right)$"
end


--// Functions not changing the matrix

--// matrix.rows(mtx)
-- return number of rows
function matrix.rows(mtx)
	return #mtx
end

--// matrix.columns(mtx)
-- return number of columns
function matrix.columns(mtx)
	return #mtx[1]
end

--//  matrix.size(mtx)
-- get matrix size as string rows,columns
function matrix.size(mtx)
	if matrix.type(mtx) == "tensor" then
		return #mtx,#mtx[1],#mtx[1][1]
	end
	return #mtx,#mtx[1]
end

--// matrix.getelement(mtx, i, j)
-- return specific element(row,column)
-- returns element on success and nil on failure
function matrix.getelement(mtx,i,j)
	if mtx[i] and mtx[i][j] then
		return mtx[i][j]
	end
end

--// matrix.setelement(mtx, i, j, value)
-- set an element(i, j, value)
-- returns 1 on success and nil on failure
function matrix.setelement(mtx,i,j,value)
	if matrix.getelement(mtx,i,j) then
		-- check if value type is number
		mtx[i][j] = value
		return 1
	end
end

--// matrix.ipairs(mtx)
-- iteration, same for complex
function matrix.ipairs(mtx)
	local i,j,rows,columns = 1,0,#mtx,#mtx[1]
	local function iter()
		j = j + 1
		if j > columns then -- return first element from next row
			i,j = i + 1,1
		end
		if i <= rows then
			return i,j
		end
	end
	return iter
end

--///////////////////////////////
--// matrix 'vector' functions //
--///////////////////////////////

-- a vector is defined as a 3x1 matrix
-- get a vector; vec = matrix{{ 1,2,3 }}^'T'

--// matrix.scalar(m1, m2)
-- returns the Scalar Product of two 3x1 matrices(vectors)
function matrix.scalar(m1, m2)
	return m1[1][1]*m2[1][1] + m1[2][1]*m2[2][1] +  m1[3][1]*m2[3][1]
end

--// matrix.cross(m1, m2)
-- returns the Cross Product of two 3x1 matrices(vectors)
function matrix.cross(m1, m2)
	local mtx = {}
	mtx[1] = { m1[2][1]*m2[3][1] - m1[3][1]*m2[2][1] }
	mtx[2] = { m1[3][1]*m2[1][1] - m1[1][1]*m2[3][1] }
	mtx[3] = { m1[1][1]*m2[2][1] - m1[2][1]*m2[1][1] }
	return setmetatable(mtx, matrix_meta)
end

--// matrix.len(m1)
-- returns the Length of a 3x1 matrix(vector)
function matrix.len(m1)
	return math.sqrt(m1[1][1]^2 + m1[2][1]^2 + m1[3][1]^2)
end

--////////////////////////////////
--// matrix 'complex' functions //
--////////////////////////////////

--// matrix.tocomplex(mtx)
-- we set now all elements to a complex number
-- also set the metatable
function matrix.tocomplex(mtx)
	assert(matrix.type(mtx) == "number", "matrix not of type 'number'")
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = complex.to(mtx[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.remcomplex(mtx)
-- set the matrix elements to a number or complex number string
function matrix.remcomplex(mtx)
	assert(matrix.type(mtx) == "complex", "matrix not of type 'complex'")
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = complex.tostring(mtx[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.conjugate(m1)
-- get the conjugate complex matrix
function matrix.conjugate(m1)
	assert(matrix.type(m1) == "complex", "matrix not of type 'complex'")
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = complex.conjugate(m1[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--/////////////////////////////////
--// matrix 'symbol' functions //
--/////////////////////////////////

--// matrix.tosymbol(mtx)
-- set the matrix elements to symbolic values
function matrix.tosymbol(mtx)
	assert(matrix.type(mtx) ~= "tensor", "cannot convert type 'tensor' to 'symbol'")
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = newsymbol(mtx[i][j])
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.gsub(m1, from, to)
-- perform gsub on all elements
function matrix.gsub(m1,from,to)
	assert(matrix.type(m1) == "symbol", "matrix not of type 'symbol'")
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = newsymbol(string.gsub(m1[i][j][1],from,to))
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.replace(m1, ...)
-- replace one letter by something else
-- replace("a",4,"b",7, ...) will replace a with 4 and b with 7
function matrix.replace(m1,...)
	assert(matrix.type(m1) == "symbol", "matrix not of type 'symbol'")
	local tosub,args = {},{...}
	for i = 1,#args,2 do
		tosub[args[i]] = args[i+1]
	end
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = newsymbol(string.gsub(m1[i][j][1], "%a", function(a) return tosub[a] or a end))
		end
	end
	return setmetatable(mtx, matrix_meta)
end

--// matrix.solve(m1)
-- solve; tries to solve a symbolic matrix to a number
function matrix.solve(m1)
	assert(matrix.type(m1) == "symbol", "matrix not of type 'symbol'")
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = tonumber(loadstring("return "..m1[i][j][1])())
		end
	end
	return setmetatable(mtx, matrix_meta)
end

function symbol_meta.__add(a,b)
	return newsymbol(a .. "+" .. b)
end

function symbol_meta.__sub(a,b)
	return newsymbol(a .. "-" .. b)
end

function symbol_meta.__mul(a,b)
	return newsymbol("(" .. a .. ")* (" .. b .. ")")
end

function symbol_meta.__div(a,b)
	return newsymbol("(" .. a .. ")/ (" .. b .. ")")
end

function symbol_meta.__pow(a,b)
	return newsymbol("(" .. a .. ")^(" .. b .. ")")
end

function symbol_meta.__eq(a,b)
	return a[1] == b[1]
end

function symbol_meta.__tostring(a)
	return a[1]
end

function symbol_meta.__concat(a,b)
	return tostring(a) .. tostring(b)
end

function symbol_meta.abs(a)
	return newsymbol("(" .. a[1] .. "):abs()")
end

function symbol_meta.sqrt(a)
	return newsymbol("(" .. a[1] .. "):sqrt()")
end

--////////////////////////--
--// METATABLE HANDLING //--
--////////////////////////--

--// MetaTable
-- as we declaired on top of the page
-- local/shared metatable
-- matrix_meta

-- note '...' is always faster than 'arg1,arg2,...' if it can be used

-- Set add "+" behaviour
matrix_meta.__add = function(...)
	return matrix.add(...)
end

-- Set subtract "-" behaviour
matrix_meta.__sub = function(...)
	return matrix.sub(...)
end

-- Set multiply "*" behaviour
matrix_meta.__mul = function(m1,m2)
	if getmetatable(m1) ~= matrix_meta then
		return matrix.mulnum(m2,m1)
	elseif getmetatable(m2) ~= matrix_meta then
		return matrix.mulnum(m1,m2)
	end
	return matrix.mul(m1,m2)
end

-- Set division "/" behaviour
matrix_meta.__div = function(m1,m2)
	if getmetatable(m1) ~= matrix_meta then
		return matrix.mulnum(matrix.invert(m2),m1)
	elseif getmetatable(m2) ~= matrix_meta then
		return matrix.divnum(m1,m2)
	end
	return matrix.div(m1,m2)
end

-- Set unary minus "-" behavior
matrix_meta.__unm = function(mtx)
	return matrix.mulnum(mtx,-1)
end

-- Set power "^" behaviour
-- if opt is any integer number will do mtx^opt
--  (returning nil if answer doesn't exist)
-- if opt is 'T' then it will return the transpose matrix
-- only for complex:
--    if opt is '*' then it returns the complex conjugate matrix
	local option = {
		-- only for complex
		["*"] = function(m1) return matrix.conjugate(m1) end,
		-- for both
		["T"] = function(m1) return matrix.transpose(m1) end,
	}
matrix_meta.__pow = function(m1, opt)
	return option[opt] and option[opt](m1) or matrix.pow(m1,opt)
end

-- Set equal "==" behaviour
matrix_meta.__eq = function(m1, m2)
	-- check same type
	if matrix.type(m1) ~= matrix.type(m2) then
		return false
	end
	-- check same size
	if #m1 ~= #m2 or #m1[1] ~= #m2[1] then
		return false
	end
	-- check normal,complex and symbolic
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			if m1[i][j] ~= m2[i][j] then
				return false
			end
		end
	end
	return true
end

-- Set tostring "tostring(mtx)" behaviour
matrix_meta.__tostring = function(...)
	return matrix.tostring(...)
end

-- set __call "mtx([formatstr])" behaviour, mtx [, formatstr]
matrix_meta.__call = function(...)
	matrix.print(...)
end

--// __index handling
matrix_meta.__index = {}
for k,v in pairs(matrix) do
	matrix_meta.__index[k] = v
end

--///////////////--
--// chillcode //--
--///////////////--
