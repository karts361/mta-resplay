local sx, sy = guiGetScreenSize()
local time = 0

setTimer(function()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getVehicleController(vehicle) == localPlayer then
		local newX, newY, newZ = getElementPosition(vehicle)
		if oldX and oldY and oldZ then
			local curentDistance = getDistanceBetweenPoints3D(oldX, oldY, oldZ, newX, newY, newZ)
			if curentDistance >= 1 then
				local coef = 1
				local _, _, _, _, _, _, _, _, surface = processLineOfSight(newX, newY, newZ, newX, newY, newZ - 5, true, false, false, true)
				if surface then
					if surface ~= 0 and surface ~= 1 and surface ~= 4 then
						coef = dirtCoef
					end
				end
				local curentDirt = getElementData(vehicle, "vehicle:dirt") or 0
				local oldDistance = getElementData(vehicle, "vehicle:distance") or 0
				local totalDistance = oldDistance + curentDistance * coef
				setElementData(vehicle, "vehicle:distance", totalDistance)
				for i = 1, #dirtLevel do
					if totalDistance > dirtLevel[i][1] then
						if curentDirt ~= dirtLevel[i][2] then
							setElementData(vehicle, "vehicle:dirt", dirtLevel[i][2])
						end
						break
					end
				end
			end
		end
		oldX, oldY, oldZ = newX, newY, newZ
	end
end, (updateTime * 1000), 0)

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		for _, v in ipairs(getElementsByType("vehicle", getRootElement(), true)) do
			addDirt(v)
		end
		for i, c in ipairs(clearStation) do
			clearStationList[i] = createMarker(c[1], c[2], c[3], "corona", 1.5, 25, 255, 25, 50)
			createObject(objectId1, c[1], c[2], c[3] + 0.4, 0, 0, c[4])
		end
	end
)

addEventHandler("onClientElementDataChange", getRootElement(),
	function(theKey)
		if getElementType(source) == "vehicle" and isElementStreamedIn(source) then
			if theKey == "vehicle:dirt" then
				addDirt(source)
			end
		end
	end
)

addEventHandler("onClientElementStreamIn", getRootElement(),
	function()
		if getElementType(source) == "vehicle" and isElementStreamedIn(source) then
			addDirt(source)
		end
	end
)

addEventHandler("onClientElementStreamOut", getRootElement(),
	function()
		if getElementType(source) == "vehicle" then
			removeDirt(source)
		end
	end
)

addEventHandler("onClientVehicleStartEnter", getRootElement(),
	function(player)
		if player == localPlayer then
			if startX and startY and startZ then
				cancelEvent()
			end
		end
	end
)

addEventHandler("onClientMarkerHit", getRootElement(),
	function(player)
		if player == localPlayer then
			for _, c in ipairs(clearStationList) do
				if source == c then
					if startX and startY and startZ then
						destroyObj()
					else
						startX, startY, startZ = getElementPosition(source)
						addEventHandler("onClientRender", getRootElement(), renderObjects)
					end
					break
				end
			end
		end
	end
)

function keyStateDown(vehicle)
	if (time + (cleartTime * 1000)) < getTickCount() then
		time = getTickCount()
		local curentDirt = getElementData(vehicle, "vehicle:dirt") or 0
		if curentDirt > 0 then
			local curentDirt = getElementData(vehicle, "vehicle:dirt") or 0
			local curentDirt = curentDirt - 1
			setElementData(vehicle, "vehicle:dirt", curentDirt)
			for i = 1, #dirtLevel do
				if dirtLevel[i][2] == curentDirt then
					setElementData(vehicle, "vehicle:distance", dirtLevel[i][1])
				end
			end
		end
		triggerServerEvent("dirt:takemoney", localPlayer, money)
	end
end

function addDirt(element)
	local curentDirt = getElementData(element, "vehicle:dirt") or 0
	if curentDirt >= 0 then
		if not dirtShaderVehicle[element] then
			dirtShaderVehicle[element] = dxCreateShader("files/paintjob.fx", 0, 0, false, "vehicle")
		end
		if dirtTextureVehicle[element] then
			destroyElement(dirtTextureVehicle[element])
		end
		dirtTextureVehicle[element] = dxCreateTexture("files/"..curentDirt..".png")
		if dirtShaderVehicle[element] and dirtTextureVehicle[element] then
			dxSetShaderValue(dirtShaderVehicle[element], "paintjobTexture", dirtTextureVehicle[element])
			for i = 1, #textureName do
				engineApplyShaderToWorldTexture(dirtShaderVehicle[element], textureName[i], element)
			end
		end
	end
end

function removeDirt(element)
	if dirtShaderVehicle[element] then
		for i = 1, #textureName do
			engineRemoveShaderFromWorldTexture(dirtShaderVehicle[element], textureName[i], element)
		end
		destroyElement(dirtShaderVehicle[element])
		dirtShaderVehicle[element] = nil
	end
	if dirtTextureVehicle[element] then
		destroyElement(dirtTextureVehicle[element])
		dirtTextureVehicle[element] = nil
	end
end

function renderObjects()
	if startX and startY and startZ then
		local stopX, stopY, stopZ = getPedBonePosition(localPlayer, 25)
		local dist = getDistanceBetweenPoints3D(startX, startY, startZ, stopX, stopY, stopZ)
		if dist < maxDistance then
			renderDetail(stopX, stopY, stopZ, startX, startY, startZ, dist)
			local _, _, stopRZ = getElementRotation(localPlayer)
			if isElement(object) then
				setElementPosition(object, stopX, stopY, stopZ)
				setElementRotation(object, 90, 0, stopRZ - 170)
			else
				object = createObject(objectId2, stopX, stopY, stopZ, 90, 0, stopRZ - 170)
				setElementCollisionsEnabled(object, false)
				setObjectScale(object, 0.14)
			end
			if getPedControlState(localPlayer, "fire") and getPlayerMoney(localPlayer) >= money then
				local endX, endY, endZ = point3(localPlayer, 3)
				local _, _, _, _, element = processLineOfSight(stopX, stopY, stopZ, endX, endY, endZ - 0.25)
				if element and getElementType(element) == "vehicle" then
					if not chek then
						chek = true
						time = getTickCount()
					end
					local x1, y1 = getElementPosition(localPlayer)
					local x2, y2 = getElementPosition(element)
					local rot = point2(x1, y1, x2, y2)
					if stopRZ < (rot + 40) and stopRZ > (rot - 40) then
						keyStateDown(element)
					end
				else
					dxDrawText("Перед вами нет автомобилей", 0, 0, sx, sy, tocolor(255, 0, 0, 255), 1, "default-bold", "center", "center")
				end
				if isElement(effect) then
					setElementPosition(effect, stopX, stopY, stopZ)
					setElementRotation(effect, 90, 0, -stopRZ - 10)
				else
					effect = createEffect("extinguisher", 90, 0, -stopRZ - 10)
					setEffectSpeed(effect, 4)
				end
				local block = getPedAnimation(localPlayer)
				if not block or block ~= "graffiti" then
					setPedAnimation(localPlayer, "graffiti", "spraycan_fire", -1, true, false, false)
				end
			else
				setPedAnimation(localPlayer)
				chek = false
				if isElement(effect) then
					destroyElement(effect)
				end
			end
		else
			destroyObj()
		end
	end
end

function destroyObj()
	removeEventHandler("onClientRender", getRootElement(), renderObjects)
	startX, startY, startZ = false, false, false
	setPedAnimation(localPlayer)
	chek = false
	if isElement(effect) then
		destroyElement(effect)
	end
	if isElement(object) then
		destroyElement(object)
	end
end

function poin1(x1, y1, x2, y2, distance)
	local x = x2 + (distance * (math.sin(math.atan2(x1 - x2, y1 - y2))))
    local y = y2 + (distance * (math.cos(math.atan2(x1 - x2, y1 - y2))))
	return x, y
end

function point2(x1, y1, x2, y2)
	local t = -math.deg(math.atan2(x2 - x1 , y2 - y1))
	if t < 0 then t = t + 360 end
	return t
end

function point3(element, distance)
    local x, y, z = getElementPosition(element)
    local rx, ry, rz = getElementRotation(element)
    local x = x + (distance * (math.sin(math.rad(-rz))))
    local y = y + (distance * (math.cos(math.rad(-rz))))
	return x, y, z
end