local resplay = nil
local actions = {}
local playerDimensions = {}
local dimensionMin = 50000
local dimensionMax = 60000
local missionElements = {}
local ammututElements = {}
-- Здесь объявляем все переменные миссии

-- Инициализация ресурса(см. документацию к событию onResourceStart)
function missionInit(res)
	resplay = getResourceFromName("resplay")
	
	if not resplay then
		cancelEvent()
		outputServerLog("No resplay")
		return nil
	end
	
	local resplayState = getResourceState(resplay)
	
	if(resplayState == "loaded") or (resplayState == "stopping") or (resplayState == "failed to load") then
		cancelEvent()
		outputServerLog("No state")
		return nil
	end
	
	if not (ammututLoadActionsData() and ammututLoadMapData()) then
		cancelEvent()
		return nil
	end
	-- Здесь прописываем всё, что дополнительно необходимо при инициализации ресурса
end

-- Запуск миссии для игрока.
-- Параметры:	plr - Игрок.
function missionStart(plr)
	-- Здесь прописываем запуск миссии
	-- Обращаться к данной функции из этого ресурса НЕЛЬЗЯ.
	-- Вместо этого используйте triggerEvent("onMissionStart", resplayRes, plr, getResourceName(getThisResource()))
	if not isElement(plr) then
		return nil
	end
	
	ammututSetPlayerInvincible(plr, true)
	
	local spawnInfo = missionElements["spawn"]
	local cameraPos = missionElements["campos1"]
	local cameraLook = missionElements["camlook1"]
	
	if not spawnInfo then
		cancelEvent()
		return nil
	end
	
	ammututFadeCamera(plr, false, 0)
	local dimension = dimensionMin
	
	while playerDimensions[dimension] and(dimension < dimensionMax) do
		dimension = dimension + 1
	end
	
	playerDimensions[dimension] = plr
	spawnPlayer(plr, tonumber(spawnInfo["posX"]), tonumber(spawnInfo["posY"]), tonumber(spawnInfo["posZ"]), tonumber(spawnInfo["rotZ"]), tonumber(spawnInfo["model"]), tonumber(spawnInfo["interior"]), dimension)
	setElementFrozen(plr, true)
	setCameraInterior(plr, tonumber(spawnInfo["interior"]))
	setCameraMatrix(plr, tonumber(cameraPos["posX"]), tonumber(cameraPos["posY"]), tonumber(cameraPos["posZ"]), tonumber(cameraLook["posX"]), tonumber(cameraLook["posY"]), tonumber(cameraLook["posZ"]))
	setTimer(ammututIntroShowPlace, 1500, 1, plr, dimension)
	setTimer(ammututFadeCamera, 10000, 1, plr, true, 1)
	setTimer(ammututMoveCamera, 10500, 1, plr, 1, 2, 5000, "InOutQuad", "Вы - Прошли тест для получения лицензии.")
	setTimer(ammututMoveCamera, 16500, 1, plr, 3, 4, 5000, "InOutQuad", "Теперь вам осталось попрактиковаться стрельбе на мишенях.")
	setTimer(ammututMoveCamera, 23500, 1, plr, 5, 5, 0, "Linear", "После практики вы сможете получить лицензию.")
	setTimer(ammututStart, 28500, 1, plr)
end

function ammututSetPlayerInvincible(plr, bInv)
	if bInv then
		addEventHandler("onPlayerWasted", plr, ammututProcPlayerInvincible, false)
	else
		removeEventHandler("onPlayerWasted", plr, ammututProcPlayerInvincible)
	end
	triggerClientEvent(plr, "onPlayerSetInvincible", resourceRoot, plr, bInv)
end

function ammututProcPlayerInvincible()
	cancelEvent()
end

function ammututFadeCamera(plr, fadeIn, fadeTime)
	if not isElement(plr) then
		return nil
	end
	fadeCamera(plr, fadeIn, fadeTime)
end

function ammututStart(plr)
	if not isElement(plr) then
		return nil
	end
	
	setCameraTarget(plr, plr)
	setElementFrozen(plr, false)
	toggleAllControls(plr, true, true, true)
	toggleControl(plr, "jump", false)
	toggleControl(plr, "fire", false)
	toggleControl(plr, "sprint", false)
	toggleControl(plr, "crouch", false)
end

function ammututIntroShowPlace(plr, dimension)
	if not isElement(plr) then
		return nil
	end
	
	ammututElements[plr] = {}
	givenMeals[plr] = 0
	local objIndex = 1
	local objInfo = missionElements["client1"]
	local plrInfo
	realTime = getRealTime()
	exports.resplay:toggleResplayMessages(plr, false)
	exports.resplay:showPlace(plr, "Ammu nation Shooting Range, Los Santos, San Andreas", 1994, realTime.month+1, realTime.monthday)
	clientSeats[plr] = {}
	
	while objInfo do
		plrInfo = {}
		plrInfo["x"] = tonumber(objInfo["posX"])
		plrInfo["y"] = tonumber(objInfo["posY"])
		plrInfo["z"] = tonumber(objInfo["posZ"]) - 0.72
		plrInfo["r"] = tonumber(objInfo["rotZ"])
		plrInfo["seater"] = nil
		table.insert(clientSeats[plr], plrInfo)
		objIndex = objIndex + 1
		objInfo = missionElements["client"..tostring(objIndex)]
	end
	
	objIndex = 1
	objInfo = missionElements["randomveh1"]
	
	while objInfo do
		triggerClientEvent(plr, "onClientCreateVehicle", resourceRoot, tonumber(objInfo["model"]),
																		tonumber(objInfo["posX"] ),
																		tonumber(objInfo["posY"] ),
																		tonumber(objInfo["posZ"] ),
																		tonumber(objInfo["rotX"] ),
																		tonumber(objInfo["rotY"] ),
																		tonumber(objInfo["rotZ"] ), dimension)
		objIndex = objIndex + 1
		objInfo = missionElements["randomveh"..tostring(objIndex)]
	end
	
	objInfo = missionElements["boss"]
	plrInfo = exports.ai:createBot(tonumber(objInfo["model"]),
									tonumber(objInfo["posX"] ),
									tonumber(objInfo["posY"] ),
									tonumber(objInfo["posZ"] ),
									tonumber(objInfo["rotZ"] ),
									exports.ai:getFlagsForBot(true, false))
	setElementInterior(plrInfo, 1)
	setElementDimension(plrInfo, dimension)
	setElementFrozen(plrInfo, true)
	
	local trigger = createColSphere(tonumber(objInfo["posX"] ), tonumber(objInfo["posY"] ), tonumber(objInfo["posZ"] ), 3)
	setElementDimension(trigger, dimension)
	setElementInterior(trigger, 1)
	addEventHandler("onColShapeHit", trigger, ammututTipFromBoss, false)
	clientTriggers[trigger] = { plr, plrInfo }
	table.insert(ammututElements[plr], plrInfo)
	objInfo = missionElements["cook"]
	plrInfo = exports.ai:createBot(tonumber(objInfo["model"]),
								    tonumber(objInfo["posX"] ),
								    tonumber(objInfo["posY"] ),
								    tonumber(objInfo["posZ"] ),
								    tonumber(objInfo["rotZ"] ),
								    exports.ai:getFlagsForBot(true, false))
	setElementInterior(plrInfo, 1)
	setElementDimension(plrInfo, dimension)
	setElementFrozen(plrInfo, true)
	setPedAnimation(plrInfo, "fat", "fatidle_csaw", -1, true, false, false, false, 0)
	table.insert(ammututElements[plr], plrInfo)
	objInfo = missionElements["security1"]
	triggerClientEvent(plr, "onClientCreatePed", resourceRoot, tonumber(objInfo["model"]),
																tonumber(objInfo["posX"] ),
																tonumber(objInfo["posY"] ),
																tonumber(objInfo["posZ"] ),
																tonumber(objInfo["rotZ"] ), dimension)
	objInfo = missionElements["security2"]
	triggerClientEvent(plr, "onClientCreatePed", resourceRoot, tonumber(objInfo["model"]),
																tonumber(objInfo["posX"] ),
																tonumber(objInfo["posY"] ),
																tonumber(objInfo["posZ"] ),
																tonumber(objInfo["rotZ"] ), dimension)
	objInfo = missionElements["barman"]
	plrInfo = exports.ai:createBot(tonumber(objInfo["model"]),
								    tonumber(objInfo["posX"] ),
								    tonumber(objInfo["posY"] ),
								    tonumber(objInfo["posZ"] ),
								    tonumber(objInfo["rotZ"] ),
								    exports.ai:getFlagsForBot(true, false))
	setElementInterior(plrInfo, 1)
	setElementDimension(plrInfo, dimension)
	setElementFrozen(plrInfo, true)
	setPedAnimation(plrInfo, "bar", "barserve_loop", -1, true, false, false, false, 0)
	table.insert(ammututElements[plr], plrInfo)
	objInfo = missionElements["table1"]
	objIndex = 1
	
	while objInfo do
		triggerClientEvent(plr, "onClientCreateObject", resourceRoot, tonumber(objInfo["model"]),
																	   tonumber(objInfo["posX"] ),
																	   tonumber(objInfo["posY"] ),
																	   tonumber(objInfo["posZ"] ),
																	   tonumber(objInfo["rotX"] ),
																	   tonumber(objInfo["rotY"] ),
																	   tonumber(objInfo["rotZ"] ), dimension)
		objIndex = objIndex + 1
		objInfo = missionElements["table"..tostring(objIndex)]
	end
	toggleAllControls(plr, false, true, true)
	ammututSpawnClient(plr)
end

function ammututMoveCamera(plr, camIdFrom, camIdTo, camMoveTime, moveFunc, messageText)
	if not isElement(plr) then
		return nil
	end
	
	local cameraPos1 = missionElements["campos"..tostring(camIdFrom)]
	local cameraLook1 = missionElements["camlook"..tostring(camIdFrom)]
	local cameraPos2 = missionElements["campos"..tostring(camIdTo)]
	local cameraLook2 = missionElements["camlook"..tostring(camIdTo)]
	
	exports.resplay:moveCamera(plr, tonumber(cameraPos1["posX"]), tonumber(cameraPos1["posY"]), tonumber(cameraPos1["posZ"]),
									 tonumber(cameraLook1["posX"]), tonumber(cameraLook1["posY"]), tonumber(cameraLook1["posZ"]),
									 tonumber(cameraPos2["posX"]), tonumber(cameraPos2["posY"]), tonumber(cameraPos2["posZ"]),
									 tonumber(cameraLook2["posX"]), tonumber(cameraLook2["posY"]), tonumber(cameraLook2["posZ"]), camMoveTime, moveFunc)
	
	if messageText then
		exports.resplay:playerShowMessage(plr, messageText, resourceRoot)
	end
end

function ammututSpawnClient(plr)
	local dimension = getElementDimension(plr)
	local spawn = missionElements["clientspawn"]
	local seat
	
	for i=1,#clientSeats[plr] do
		if not clientSeats[plr][i]["seater"] then
			seat = i
			break
		end
	end
	
	if not seat then
		return false
	end
	
	local skin = clientSkins[((seat - 1) % #clientSkins) + 1]
	local bx, by, bz = tonumber(spawn["posX"]), tonumber(spawn["posY"]), tonumber(spawn["posZ"])
	local bot = exports.ai:createBot(skin, bx, by, bz, tonumber(spawn["rotZ"]), exports.ai:getFlagsForBot(true, true))
	
	setElementDimension(bot, dimension)
	setElementInterior(bot, 1)
	clientSeats[plr][seat]["seater"] = bot
	local trigger = createColSphere(bx, by, bz, 1)
	setElementDimension(trigger, dimension)
	setElementInterior(trigger, 1)
	addEventHandler("onColShapeHit", trigger, ammututTakeClient, false)
	clientTriggers[trigger] = bot
	table.insert(ammututElements[plr], bot)
	table.insert(ammututElements[plr], trigger)
	return true
end

-- Завершение миссии для игрока:
-- Параметры:	plr - Игрок
--				reason - Причина завершения(nil при успешном завершении)
function missionFinish(plr, reason)
	-- Здесь прописываем завершение миссии
	-- Обращаться к данной функции из этого ресурса НЕЛЬЗЯ.
	-- Вместо этого используйте triggerEvent("onMissionFinish", resplayRes, plr, getResourceName(getThisResource()), reason)
end

addEvent("onMissionStart")
addEvent("onMissionFinish")
addEventHandler("onResourceStart", root, missionInit, false)
addEventHandler("onMissionStart", resourceRoot, missionStart, false)
addEventHandler("onMissionFinish", resourceRoot, missionFinish, false)