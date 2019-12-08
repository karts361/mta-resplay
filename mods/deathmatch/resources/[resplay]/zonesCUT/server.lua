-- Format is: {x = 0, y = 0, z = 0, width = 0, depth = 0, height = 0},
local greenzones = {
	{x = 1718.86548, y = -1951.56067, z = 12, width = 92.7, depth = 76.5, height = 20},
	{x = -1465.46533, y = -353.81912, z = 8, width = 85, depth = 85, height = 30}, -- Groove Street
	{x = 1681.44971, y = 1367.20203, z = 9, width = 36, depth = 150, height = 10}, -- LV Pirate ship
}

function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

-- Initialize all zones on resource start
local z = {}
function initGreenzones()
	if greenzones and #greenzones ~= 0 then
		for _,v in ipairs(greenzones) do
			if v then
				if v.x and v.y and v.z and v.width and v.depth and v.height then
					local c = createColCuboid(v.x, v.y, v.z, v.width, v.depth, v.height)
					local rarea = createRadarArea(v.x, v.y, v.width, v.depth, 0, 255, 0, 150)
					setElementParent(rarea, c)
					if c then
						z[c] = true
						
						for _,p in ipairs(getElementsWithinColShape(c, "player")) do
							setElementData(p, "greenzone", true)
						end
						
						addEventHandler("onElementDestroy", c,
							function()
								if z[source] then
									z[source] = nil
								end
							end
						)
						
						addEventHandler("onColShapeHit", c,
							function(h, d)
								if h and d and isElement(h) and getElementType(h) == "player" then
									if getElementData(h, "colShapeFix_OUT") then
										removeElementData(h, "colShapeFix_OUT")
										return
									end

									if getElementData(h, "greenzone") then
										setElementData(h, "colShapeFix_IN", true)
									else
										setElementData(h, "greenzone", true)
										toggleControl(h, "fire", false)
										toggleControl(h, "aim_weapon", false)
										toggleControl(h, "vehicle_fire", false)
										toggleControl(h, "vehicle_secondary_fire", false)
										outputChatBox(generateTimeString().."Resplay: Вы вошли в зелёную зону", h, 0, 220, 0)
										triggerClientEvent(h,"onEnterGreenzone",h)
									end
								end
							end
						)
						
						addEventHandler("onColShapeHit", c,
							function(h, d)
								if h and d and isElement(h) and getElementType(h) == "vehicle" then
									setElementData(h, "greenzoneveh",true)
								end
							end
						)
						
						addEventHandler("onColShapeLeave", c,
							function(h, d)
								if h and d and isElement(h) and getElementType(h) == "player" then
									if getElementData(h, "colShapeFix_IN") then
										removeElementData(h, "colShapeFix_IN")
										return
									end

									if getElementData(h, "greenzone") then
										removeElementData(h, "greenzone")
										toggleControl(h, "fire", true)
										toggleControl(h, "aim_weapon", true)
										toggleControl(h, "vehicle_fire", true)
										toggleControl(h, "vehicle_secondary_fire", true)
										outputChatBox(generateTimeString().."Resplay: Вы покинули зелёную зону", h, 220, 220, 0)
										triggerClientEvent(h,"onLeaveGreenzone",h)
									else
										setElementData(h, "colShapeFix_OUT", true)
									end
								end
						    end
					   )
					   
					   addEventHandler("onColShapeLeave", c,
							function(h, d)
								if h and d and isElement(h) and getElementType(h) == "vehicle" then
									setTimer(removeElementData, 350, 1, h, "greenzoneveh")
								end
							end
						)
					end
				end
			end
		end
	end
end

addEventHandler("onResourceStart", resourceRoot, initGreenzones)

function resetGreenzoneData()
	for _,p in ipairs(getElementsByType("player")) do
		if isElement(p) then
			removeElementData(p, "greenzone")
		end	
	end
end

addEventHandler("onResourceStop", resourceRoot, resetGreenzoneData)