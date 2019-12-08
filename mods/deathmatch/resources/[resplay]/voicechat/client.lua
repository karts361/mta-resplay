local maxdistance = 40
local checktime = 500
local hearThroughWall = true

addEventHandler("onClientResourceStart", resourceRoot, function()
	setTimer(function()
		if isElement(localPlayer) then
			local x1, y1, z1, distance
			local x2, y2, z2 = getElementPosition(localPlayer)
			local int2 = getElementInterior(localPlayer)
			local dim2 = getElementDimension(localPlayer)
			local players = getElementsByType("player")
			for _,thePlayer in ipairs(players) do
				if isElement(thePlayer) and (thePlayer ~= localPlayer) then
					if (getElementInterior(thePlayer) == int2) and (getElementDimension(thePlayer) == dim2) then
						x1, y1, z1 = getElementPosition(thePlayer)
						distance = getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
						if(distance <= maxdistance) then
							if not hearThroughWall then
								local hit = processLineOfSight(	x1, y1, z1+0.5,
																x2, y2, z2+0.5,
																true,
																false, 
																false, 
																true, 
																false, 
																true, 
																true)
								if hit then
									exports.voice:setPlayerMuted(thePlayer, true)
								else
									exports.voice:setPlayerMuted(thePlayer, false)
								end
							else
								exports.voice:setPlayerMuted(thePlayer, false)
							end
						else
							exports.voice:setPlayerMuted(thePlayer, true)
						end
					else
						exports.voice:setPlayerMuted(thePlayer, true)
					end
				end
			end
		end
	end, checktime, 0)
end)