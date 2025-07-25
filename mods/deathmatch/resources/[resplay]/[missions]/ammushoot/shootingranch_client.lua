local gWindow = {}
local gGrid = {}
local gColumn = {}
local gButton = {}

local lp = getLocalPlayer ()

local screenwidth, screenheight = guiGetScreenSize ()

function createTargetToShoot ( x, y, z, rx, ry, r, int, dim, points )

	local frame = createObject ( 1587, -321.51257324219, 826.03668212891, 17.146434783936 )
	
	setElementData ( frame, "x", x )
	setElementData ( frame, "y", y )
	setElementData ( frame, "z", z )
	
	local part1 = createObject ( 1592, -321.49752807617, 826.03112792969, 17.175880432129 )
	local part2 = createObject ( 1591, -321.52035522461, 826.03167724609, 17.175880432129 )
	local part3 = createObject ( 1590, -321.52151489258, 826.03161621094, 17.154172897339 )
	local part4 = createObject ( 1589, -321.49887084961, 826.03137207031, 17.155172348022 )
	local part5 = createObject ( 1588, -321.51440429688, 826.03332519531, 17.134246826172 )
	
	attachElementsInCorrectWay ( part1, frame )
	attachElementsInCorrectWay ( part2, frame )
	attachElementsInCorrectWay ( part3, frame )
	attachElementsInCorrectWay ( part4, frame )
	attachElementsInCorrectWay ( part5, frame )
	
	setElementInterior ( frame, int )
	setElementInterior ( part1, int )
	setElementInterior ( part2, int )
	setElementInterior ( part3, int )
	setElementInterior ( part4, int )
	setElementInterior ( part5, int )
	
	setElementDimension ( frame, dim )
	setElementDimension ( part1, dim )
	setElementDimension ( part2, dim )
	setElementDimension ( part3, dim )
	setElementDimension ( part4, dim )
	setElementDimension ( part5, dim )
	
	setElementPosition ( frame, x, y, z )
	setElementRotation ( frame, rx, ry, r )
	
	setElementData ( part1, "shootingRanchItem", frame )
	setElementData ( part2, "shootingRanchItem", frame )
	setElementData ( part3, "shootingRanchItem", frame )
	setElementData ( part4, "shootingRanchItem", frame )
	setElementData ( part5, "shootingRanchItem", frame )
	
	setElementParent ( part1, frame )
	setElementParent ( part2, frame )
	setElementParent ( part3, frame )
	setElementParent ( part4, frame )
	setElementParent ( part5, frame )
	
	setElementData ( frame, "elements", 5 )
	
	shootingRangeTargets[frame] = true
	
	return frame
end

function moveTarget ( target, x2, y2 )

	local x1, y1, z1 = getElementPosition ( target )
	local z2 = z1
	
	setElementData ( target, "x1", x1 )
	setElementData ( target, "y1", y1 )
	setElementData ( target, "z1", z1 )
	setElementData ( target, "x2", x2 )
	setElementData ( target, "y2", y2 )
	
	moveObject ( target, 10000, x2, y2, z2 )
	setTimer (
		function ( element, x1, y1, z1 )
			if isElement ( element ) then
				moveObject ( element, 10000, x1, y1, z1 )
			end
		end,
	10000, 1, target, x1, y1, z1 )
	
	_G[tostring ( target ).."Timer"] = setTimer ( 
		function ( element )
			if not isElement ( element ) then
				killTimer ( _G[tostring ( element ).."Timer"] )
			elseif not getElementData ( element, "flipping" ) then
				local x1, y1, z1 = getElementData ( element, "x1" ), getElementData ( element, "y1" ), getElementData ( element, "z1" )
				local x2, y2 = getElementData ( element, "x2" ), getElementData ( element, "y2" )
				local z2 = z1
				moveObject ( element, 10000, x2, y2, z2 )
				setTimer (
					function ( element, x1, y1, z1 )
						if isElement ( element ) then
							moveObject ( element, 10000, x1, y1, z1 )
						end
					end,
				10000, 1, element, x1, y1, z1 )
			end
		end,
	20000, -1, target )
end

function startShootingRanchTest_func ()

	shootingRangeTargets = {}
	
	setWalkable ( false )
	toggleControl ( "fire", false )
	toggleControl ( "aim_weapon", false )
	setControlState ( "aim_weapon", true )
	
	local dim = getElementDimension ( lp )
	
	-- Close
	local target1 = createTargetToShoot ( 290, -140.5 + 1.74, 1004.180480957 + 2.04, 90, 0, 270, 7, dim, 0 )
	-- Middle
	local target2 = createTargetToShoot ( 286, -129.5 + 1.74, 1004.180480957 + 2.04, 90, 0, 270, 7, dim, 0 )
	-- Wide
	local target3 = createTargetToShoot ( 274, -140.5 + 1.74, 1004.8396606445 + 2.04, 90, 0, 270, 7, dim, 0 )
	setElementData ( target1, "ty", -129.5 )
	setElementData ( target2, "ty", -140.5 )
	setElementData ( target3, "ty", -129.5 )
	
	totalShootingRangeHitTargets = 0
	totalShootingRangeShots = 0
	
	targetMoveTime = 2000
	flapTarget ( target1, false, targetMoveTime )
	flapTarget ( target2, false, targetMoveTime )
	flapTarget ( target3, false, targetMoveTime )
	targetMoveTime = 2100
	
	setTimer ( moveTarget, targetMoveTime, 1, target1, 290, -129.5 )
	setTimer ( moveTarget, targetMoveTime + 500, 1, target2, 286, -140.5 )
	setTimer ( moveTarget, targetMoveTime + 1000, 1, target3, 274, -129.5 )
	
	addEventHandler ( "onClientPlayerWeaponFire", lp, shootingRanchTargetHit )
	
	shootingRanchCountdountVal = "3"
	shootingRanchCountdountR = 200
	shootingRanchCountdountG = 0
	shootingRanchCountdountB = 0
	setTimer (
		function ()
			shootingRanchCountdountVal = "2"
			playSoundFrontEnd ( 43 )
		end,
	1000, 1 )
	setTimer (
		function ()
			shootingRanchCountdountVal = "1"
			playSoundFrontEnd ( 43 )
		end,
	2000, 1 )
	setTimer (
		function ()
			shootingRanchCountdountVal = "Начали!"
			playSoundFrontEnd ( 45 )
			shootingRanchCountdountR = 0
			shootingRanchCountdountG = 200
			
			toggleControl ( "fire", true )
			
			setTimer ( 
				function ()
					removeEventHandler ( "onClientRender", getRootElement(), shootingRanchCountdown_render )
				end,
			1000, 1 )
			
			shootingRanchTimeLeftVal = 600
			shootingRanchTimeLeft = "60.0"
			addEventHandler ( "onClientRender", getRootElement(), shootingRanchDraw_render )
			setTimer (
				function ()
					if shootingRanchTimeLeft == "0.0" then
						setControlState ( "fire", false )
						toggleControl ( "fire", false )
						for key, index in pairs ( shootingRangeTargets ) do
							if isElement ( key ) then
								if not getElementData ( key, "flipping" ) then
									flapTarget ( key, true, 2000 )
								end
							end
						end
						setTimer ( endShootingRanchTest_func, 3000, 1 )
					else
						shootingRanchTimeLeftVal = shootingRanchTimeLeftVal - 1
						local secs = math.floor ( shootingRanchTimeLeftVal / 10 )
						local ms = shootingRanchTimeLeftVal - secs * 10
						shootingRanchTimeLeft = secs.."."..ms
					end
				end,
			100, 601 )
		end,
	3000, 1 )
	
	addEventHandler ( "onClientRender", getRootElement(), shootingRanchCountdown_render )
end
addEvent ( "startShootingRanchTest", true )
addEventHandler ( "startShootingRanchTest", getRootElement(), startShootingRanchTest_func )

function endShootingRanchTest_func ()

	setControlState ( "aim_weapon", false )
	toggleControl ( "aim_weapon", true )
	removeEventHandler ( "onClientRender", getRootElement(), shootingRanchDraw_render )
	for key, index in pairs ( shootingRangeTargets ) do
		if isElement ( key ) then
			destroyElement ( key )
		end
		shootingRangeTargets[key] = nil
	end
	
	local percent = tostring ( math.floor ( totalShootingRangeHitTargets / totalShootingRangeShots * 1000 ) / 10 )
	percent = string.sub ( percent, 1, 4 )
	
	outputChatBox ( generateTimeString2()..totalShootingRangeShots.." патронов было отстрелено", 125, 0, 0 )
	outputChatBox ( generateTimeString2()..totalShootingRangeHitTargets.." патронов поразили цели", 0, 125, 0 )
	--outputChatBox ( percent.." percent of the fired shots have hit the targets!", 200, 200, 0 )
	
	setWalkable ( true )
	
	toggleControl ( "fire", true )
	
	removeEventHandler ( "onClientPlayerWeaponFire", lp, shootingRanchTargetHit )
	triggerServerEvent ( "endShootingRanchTest", lp, percent, totalShootingRangeHitTargets )
end

function generateTimeString2()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

function shootingRanchTargetHit ( weapon, _, _, _, _, _, element )

	if element then
		local frame = getElementData ( element, "shootingRanchItem" )
		if frame then
			setElementData ( frame, "elements", getElementData ( frame, "elements" ) - 1 )
			setElementData ( element, "shootingRanchItem", false )
			totalShootingRangeHitTargets = totalShootingRangeHitTargets + 1
			
			if getElementData ( frame, "elements" ) == 0 then
				local x, y, z = getElementData ( frame, "x" ), getElementData ( frame, "y" ), getElementData ( frame, "z" )
				
				local ty = getElementData ( frame, "ty" )
				local dim = getElementDimension ( lp )
				local newTarget = createTargetToShoot ( x, y, z, 90, 0, 270, 7, dim, 0 )
				local targetMoveTime = 2000
				flapTarget ( newTarget, false, targetMoveTime )
				setTimer ( moveTarget, targetMoveTime, 1, newTarget, x, ty )
				setElementData ( newTarget, "ty", ty )
				
				flapTarget ( frame, true, 1000 )
				setTimer ( destroyElement, 1000, 1, frame )
				playSoundFrontEnd ( 101 )
			end
		end
	end
	totalShootingRangeShots = totalShootingRangeShots + 1
end

function flapTarget ( target, up, time )

	if not time then
		time = 1000
	end
	setElementData ( target, "flipping", true )
	local x, y, z = getElementPosition ( target )
	if up then
		moveObject ( target, time, x + 1.74, y, z + 2.04, 90, 0, 0 )
	else
		moveObject ( target, time, x - 1.74, y, z - 2.04, -90, 0, 0 )
	end
	setTimer ( setElementData, time, 1, target, "flipping", false )
end

function shootingRanchCountdown_render ()

	dxDrawText(shootingRanchCountdountVal,2,2,screenwidth+2,screenheight+2,tocolor(0,0,0,255),3,"pricedown","center","center",false,false,true)
	dxDrawText(shootingRanchCountdountVal,0,0,screenwidth,screenheight,tocolor(shootingRanchCountdountR,shootingRanchCountdountG,shootingRanchCountdountB,255),3,"pricedown","center","center",false,false,true)
end
function shootingRanchDraw_render ()

	dxDrawText ( shootingRanchTimeLeft.." осталось времени.", screenwidth / 2 - 614 / 2, 0, 614, 49, tocolor(255,255,255,255), 2.5, "sans", "left", "top", false, false, false )
end

function showShootingRangeSelection_func ()
    showCursor(true)
	if isElement ( gWindow["shootingRange"] ) then
		guiSetVisible ( gWindow["shootingRange"], true )
	else
		gWindow["shootingRange"] = guiCreateWindow(screenwidth/2-251/2,screenheight/2-178/2,251,178,"Выберите желаемое оружие",false)
		guiSetAlpha(gWindow["shootingRange"],1)
		
		gGrid["shootingRange"] = guiCreateGridList(12,29,143,138,false,gWindow["shootingRange"])
		guiGridListSetSelectionMode(gGrid["shootingRange"],0)
		guiSetAlpha(gGrid["shootingRange"],1)
		
		gColumn["shootingRange"] = guiGridListAddColumn(gGrid["shootingRange"],"Weapon",0.8)
		
		gButton["shootingRangeTest"] = guiCreateButton(167,39,72,45,"Начать",false,gWindow["shootingRange"])
		guiSetAlpha(gButton["shootingRangeTest"],1)
		guiSetFont(gButton["shootingRangeTest"],"default-bold-small")
		--gButton["shootingRangeClose"] = guiCreateButton(167,107,72,45,"Close",false,gWindow["shootingRange"])
		guiSetAlpha(gButton["shootingRangeClose"],1)
		guiSetFont(gButton["shootingRangeClose"],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["shootingRangeClose"],
			function ()
				guiSetVisible ( gWindow["shootingRange"], false )
				showCursor ( false )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["shootingRangeTest"],
			function ()
				local row = guiGridListGetSelectedItem ( gGrid["shootingRange"] )
				local gun = guiGridListGetItemText ( gGrid["shootingRange"], row, gColumn["shootingRange"] )
				local id = shootingRangeGunIDs[gun]
				
				guiSetVisible ( gWindow["shootingRange"], false )
				showCursor ( false )
				
				if tonumber ( id ) then
					triggerServerEvent ( "startShootingRanch", lp, gun )
				end
			end,
		false )
		
		for key, index in pairs ( shootingRangeGuns["name"] ) do
			local name = shootingRangeGuns["name"][key]
			local id = shootingRangeGuns["id"][key]
			local row = guiGridListAddRow ( gGrid["shootingRange"] )
			guiGridListSetItemText ( gGrid["shootingRange"], row, gColumn["shootingRange"], name, false, false )
		end
	end
end
addEvent ( "showShootingRangeSelection", true )
addEventHandler ( "showShootingRangeSelection", root, showShootingRangeSelection_func )
--addCommandHandler("ranch", showShootingRangeSelection_func, false, false)

function setWalkable ( boolean )

	toggleControl ( "jump", boolean )
	
	toggleControl ( "left", boolean )
	toggleControl ( "right", boolean )
	toggleControl ( "forwards", boolean )
	toggleControl ( "backwards", boolean )
end

function attachElementsInCorrectWay ( element1, element2 )

	local x1, y1, z1 = getElementPosition ( element1 )
	local x2, y2, z2 = getElementPosition ( element2 )
	attachElements ( element1, element2, x1-x2, y1-y2, z1-z2 )
end