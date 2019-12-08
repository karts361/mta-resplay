local predefinedHandling = {
	[604] = {
		["engineAcceleration"] = 200,
		["suspensionLowerLimit"] = -0.3,
		["maxVelocity"] = 300
	}
}

-- USEFUL

function updateVehicleHandling()
	for i, v in pairs(predefinedHandling) do
		if i then
			
			for handling, value in pairs(v) do
				if not setModelHandling(i, handling, value) then
					outputDebugString("* Predefined handling \"" .. tostring(handling) .. "\" for vehicle model \"" .. tostring(i) .. "\" could not be set to \"" .. tostring(value) .. "\"")
				end
			end
		end
	end

	for _, v in ipairs(getElementsByType("vehicle")) do
		if v and predefinedHandling[getElementModel(v)] then
			for k, vl in pairs(predefinedHandling[getElementModel(v)]) do
				setVehicleHandling(v, k, vl)
			end
			outputDebugString("* Handling updated for vehicle model " .. tostring(getElementModel(v))) -- INFO STRING
		end

		if getElementData(v, "engineBoost") then
			carTuneBoost(v, getElementData(v, "engineBoost"), 0)
		end
	end
end

-- EVENTS

function addVehicleHandling()
	updateVehicleHandling()
end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), addVehicleHandling)
addEventHandler("onVehicleRespawn", root, addVehicleHandling)

function resetVehicleHandling()
	for model in pairs(predefinedHandling) do
		if model then
			for k in pairs(getOriginalHandling(model)) do
				setModelHandling(model, k, nil)
			end
		end
	end

	for _, v in ipairs(getElementsByType("vehicle")) do
		if v then
			local model = getElementModel(v)
			if predefinedHandling[model] then
				for k, h in pairs(getOriginalHandling(model)) do
					setVehicleHandling(v, k, h)
				end
			end
		end
	end

	outputDebugString("* Vehicle handlings reseted successfully")
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), resetVehicleHandling)

-- CORE

function carTuneBoost(car, boostLevel, price)
	if(dbExec(db, "UPDATE cars SET engineBoost = ? WHERE id = ?", boostLevel, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Форсирование(уровень " .. tostring(boostLevel) .. ")", true)
		setElementData(car, "engineBoost", boostLevel)
		local accelMult

		if(boostLevel == 1) then
			accelMult = 1.1

		elseif(boostLevel == 2) then
			accelMult = 1.25

		elseif(boostLevel == 3) then
			accelMult = 11.5
		end

		local vehModel = getElementModel(car)
		local pvehHandling = getOriginalHandling(vehModel)

		if predefinedHandling[vehModel] and predefinedHandling[vehModel]["engineAcceleration"] and predefinedHandling[vehModel]["maxVelocity"] then
			outputDebugString("* Vehicle model " .. vehModel .. " is already has handling settings", 2) -- INFO STRING

		else
			setVehicleHandling(car, "engineAcceleration", pvehHandling["engineAcceleration"]*accelMult)
			setVehicleHandling(car, "maxVelocity", pvehHandling["maxVelocity"]*accelMult)
			takeMoney(source, price)
			local upgradeId = getVehicleUpgradeOnSlot(car, 8)

			if(upgradeId > 0) then
				removeVehicleUpgrade(car, upgradeId)
				addVehicleUpgrade(car, upgradeId)
			end

			upgradeId = getVehicleUpgradeOnSlot(car, 9)

			if(upgradeId > 0) then
				removeVehicleUpgrade(car, upgradeId)
				addVehicleUpgrade(car, upgradeId)
			end
		end
	end
end