local resplay = nil
local actions = {}
local playerDimensions = {}
local playerSkins = {}
local dimensionMin = 50000
local dimensionMax = 60000
local missionElements = {}
local clientSeats = {}
local tutorialElements = {}
local clientSkins = { 40, 57, 147, 228, 91 }
local clientTriggers = {}
local clientMeals = {
	{ 2353, "салат, тортилья и газировка" },
	{ 2354, "салат, десерт и газировка" },
	{ 2355, "салат и газировка" },
	{ 2219, "салат, пицца, картофель и газировка" },
	{ 2353, "салат, тортилья и газировка" }
}
local clientOrders = {}
local clientQueue = {}
local givenMeals = {}
local botTexts = {
	["hello"] = { "Здравствуйте", "Приветствую", "Доброго вам дня", "Добрый день" },
	["thankyou"] = { "Спасибо", "Благодарю", "Большое спасибо", "Благодарствую" },
	["order"] = { "Мой заказ - %s", "У меня будут %s", "Для меня - %s" }
}
local animTimers = {}

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
	
	if not (tutorialLoadActionsData() and tutorialLoadMapData()) then
		cancelEvent()
		return nil
	end
end

function tutorialLoadActionsData()
	actions["Клиент - Взять заказ"] = exports.resplay:createAction("Клиент - Взять заказ", getResourceName(resource), 2, "tutorialTakeOrder", nil, true, false, false)
	
	if not actions["Клиент - Взять заказ"] then
		return false
	end
	actions["Поднос - Взять"] = exports.resplay:createAction("Поднос - Взять", getResourceName(resource), 2, "tutorialTakeMeal", nil, true, false, false)
	
	if not actions["Поднос - Взять"] then
		return false
	end
	actions["Клиент - Подать заказ"] = exports.resplay:createAction("Клиент - Подать заказ", getResourceName(resource), 2, "tutorialGiveMeal", nil, true, false, false)
	
	if not actions["Клиент - Подать заказ"] then
		return false
	end
	
	return true
end

function tutorialLoadMapData()
	local xml = xmlLoadFile(":mis_tutorial/tutorial.xml")
	
	if not xml then
		outputServerLog("No xml file")
		return false
	end
	
	local elementNodes = xmlNodeGetChildren(xml)
	local elemId, elemArray
	
	for _,elemNode in ipairs(elementNodes) do
		elemId = xmlNodeGetAttribute(elemNode, "id")
		if elemId then
			missionElements[elemId] = xmlNodeGetAttributes(elemNode)
			missionElements[elemId]["id"] = xmlNodeGetName(elemNode)
		end
	end
	
	xmlUnloadFile(xml)
	
	local objInfo = missionElements["removeTables"]
	
	if objInfo then
		removeWorldModel(tonumber(objInfo["model"]),
						  tonumber(objInfo["radius"]),
						  tonumber(objInfo["posX"]),
						  tonumber(objInfo["posY"]),
						  tonumber(objInfo["posZ"]), 1)
	end
	
	for elemId,elemInfo in pairs(missionElements) do
		if(elemInfo["id"] == "pathpoint") then
			exports.ai:addBotPathPoint(elemId, tonumber(elemInfo["posX"]), tonumber(elemInfo["posY"]), tonumber(elemInfo["posZ"]))
		end
	end
	
	for elemId,elemInfo in pairs(missionElements) do
		if(elemInfo["id"] == "pathpoint") then
			
			for elemTo in string.gmatch(elemInfo["neighbors"], "[^,]+") do
				if(string.len(elemTo) > 0) then
					exports.ai:addBotPathLink(elemId, elemTo)
				end
			end
		end
	end
	return true
end

function missionStart(plr)
	if not isElement(plr) then
		return nil
	end
	
	tutorialSetPlayerInvincible(plr, true)
	setPlayerHudComponentVisible(plr, "ammo", false)
	setPlayerHudComponentVisible(plr, "armour", false)
	setPlayerHudComponentVisible(plr, "breath", false)
	setPlayerHudComponentVisible(plr, "clock", false)
	setPlayerHudComponentVisible(plr, "health", false)
	setPlayerHudComponentVisible(plr, "money", false)
	setPlayerHudComponentVisible(plr, "weapon", false)
	setPlayerHudComponentVisible(plr, "wanted", false)
	
	local spawnInfo = missionElements["spawn"]
	local cameraPos = missionElements["campos1"]
	local cameraLook = missionElements["camlook1"]
	
	if not spawnInfo then
		cancelEvent()
		return nil
	end
	
	tutorialFadeCamera(plr, false, 0)
	local dimension = dimensionMin
	
	while playerDimensions[dimension] and(dimension < dimensionMax) do
		dimension = dimension + 1
	end
	
	playerDimensions[dimension] = plr
	playerSkins[plr] = getElementModel(plr)
	spawnPlayer(plr, tonumber(spawnInfo["posX"]), tonumber(spawnInfo["posY"]), tonumber(spawnInfo["posZ"]), tonumber(spawnInfo["rotZ"]), tonumber(spawnInfo["model"]), tonumber(spawnInfo["interior"]), dimension)
	setElementFrozen(plr, true)
	setCameraInterior(plr, tonumber(spawnInfo["interior"]))
	setCameraMatrix(plr, tonumber(cameraPos["posX"]), tonumber(cameraPos["posY"]), tonumber(cameraPos["posZ"]), tonumber(cameraLook["posX"]), tonumber(cameraLook["posY"]), tonumber(cameraLook["posZ"]))
	setTimer(tutorialIntroShowPlace, 1500, 1, plr, dimension)
	setTimer(tutorialFadeCamera, 10000, 1, plr, true, 1)
	setTimer(tutorialMoveCamera, 10500, 1, plr, 1, 2, 5000, "InOutQuad", "Вы - официант в ресторане города Liberty City. Сегодня ваш последний рабочий день.")
	setTimer(tutorialMoveCamera, 16500, 1, plr, 3, 4, 5000, "InOutQuad", "Завершите обслуживание оставшихся в ресторане клиентов.")
	setTimer(tutorialMoveCamera, 23500, 1, plr, 5, 5, 0, "Linear", "Если возникнут трудности - подойдите к вашему боссу, стоящему на кухне.")
	--setTimer(tutorialMoveCamera, 26000, 1, plr, 6, 6, 0, "Linear", "Если возникнут трудности - подойдите к вашему боссу, стоящему на кухне.")
	setTimer(tutorialStart, 28500, 1, plr)
end

function tutorialSetPlayerInvincible(plr, bInv)
	if bInv then
		addEventHandler("onPlayerWasted", plr, tutorialProcPlayerInvincible, false)
	else
		removeEventHandler("onPlayerWasted", plr, tutorialProcPlayerInvincible)
	end
	triggerClientEvent(plr, "onPlayerSetInvincible", resourceRoot, plr, bInv)
end

function tutorialProcPlayerInvincible()
	cancelEvent()
end

function tutorialFadeCamera(plr, fadeIn, fadeTime)
	if not isElement(plr) then
		return nil
	end
	fadeCamera(plr, fadeIn, fadeTime)
end

function tutorialStart(plr)
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

function tutorialIntroShowPlace(plr, dimension)
	if not isElement(plr) then
		return nil
	end
	
	tutorialElements[plr] = {}
	givenMeals[plr] = 0
	local objIndex = 1
	local objInfo = missionElements["client1"]
	local plrInfo
	exports.resplay:toggleResplayMessages(plr, false)
	exports.resplay:showPlace(plr, "Liberty City, Ресторан Marco's Bistro", 1993, 12, 1)
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
	addEventHandler("onColShapeHit", trigger, tutorialTipFromBoss, false)
	clientTriggers[trigger] = { plr, plrInfo }
	table.insert(tutorialElements[plr], plrInfo)
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
	table.insert(tutorialElements[plr], plrInfo)
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
	table.insert(tutorialElements[plr], plrInfo)
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
	tutorialSpawnClient(plr)
end

function tutorialMoveCamera(plr, camIdFrom, camIdTo, camMoveTime, moveFunc, messageText)
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

function tutorialSpawnClient(plr)
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
	addEventHandler("onColShapeHit", trigger, tutorialTakeClient, false)
	clientTriggers[trigger] = bot
	table.insert(tutorialElements[plr], bot)
	table.insert(tutorialElements[plr], trigger)
	return true
end

function tutorialTakeClient(hitElem, matchingDim)
	if not matchingDim then
		return nil
	end
	
	local dim = getElementDimension(hitElem)
	
	if not (playerDimensions[dim] and(playerDimensions[dim] == hitElem)) then
		return nil
	end
	
	local bot = clientTriggers[source]
	
	if not bot then
		return nil
	end
	
	local seat
	
	for i=1,#clientSeats[hitElem] do
		if(clientSeats[hitElem][i]["seater"] == bot) then
			seat = clientSeats[hitElem][i]
			break
		end
	end
	
	if not seat then
		return nil
	end
	
	clientTriggers[source] = nil
	destroyElement(source)
	exports.ai:setBotTargetElement(bot, hitElem)
	exports.ai:setBotTask(bot, "followElement")
	local trigger = createColSphere(seat["x"], seat["y"], seat["z"], 2.0)
	local marker = createMarker(seat["x"], seat["y"], seat["z"]+2.0, "arrow", 1.0, 255, 255, 0, 255, hitElem)
	table.insert(tutorialElements[hitElem], trigger)
	table.insert(tutorialElements[hitElem], marker)
	setElementDimension(trigger, dim)
	setElementInterior(trigger, 1)
	setElementDimension(marker, dim)
	setElementInterior(marker, 1)
	addEventHandler("onColShapeHit", trigger, tutorialGiveSeatToClient, false)
	clientTriggers[trigger] = { bot, hitElem, marker }
	exports.ai:botTalk(bot, botTexts["hello"][math.random(#botTexts["hello"])], hitElem)
	exports.resplay:playerShowMessage(hitElem, "Проводите клиента до обозначенного желтой стрелкой столика.", resourceRoot)
end

function tutorialTipFromBoss(hitElem, matchingDim)
	
	if not matchingDim then
		return nil
	end
	
	local plr = clientTriggers[source][1]
	
	if(plr ~= hitElem) then
		return nil
	end
	
	local bot = clientTriggers[source][2]
	destroyElement(source)
	exports.ai:botTalk(bot, "Сегодня твой последний рабочий день. Поднимись в зал и обслужи последних за сегодня клиентов. Они уже ждут тебя у входа. Подойди к ним и рассади за столики. Также следи за появляющимися внизу экрана сообщениями.", plr)
end

function tutorialGiveSeatToClient(hitElem, matchingDim)
	if not matchingDim then
		return nil
	end
	
	if(clientTriggers[source][1] ~= hitElem) then
		return nil
	end
	
	local plr = clientTriggers[source][2]
	local seat
	
	for i=1,#clientSeats[plr] do
		if(clientSeats[plr][i]["seater"] == hitElem) then
			seat = clientSeats[plr][i]
			break
		end
	end
	
	if not seat then
		return nil
	end
	
	local dim = getElementDimension(hitElem)
	
	destroyElement(clientTriggers[source][3])
	clientTriggers[source] = nil
	destroyElement(source)
	exports.ai:setBotTargetPosition(hitElem, seat["x"], seat["y"], seat["z"], seat["r"])
	exports.ai:setBotTask(hitElem, "sitDown")
	exports.resplay:attachActionToElement(actions["Клиент - Взять заказ"], hitElem)
	exports.ai:botTalk(hitElem, botTexts["thankyou"][math.random(#botTexts["thankyou"])], plr)
	
	if tutorialSpawnClient(plr) then
		exports.resplay:playerShowMessage(plr, "Подойдите к следующему клиенту, который ждет вас у входа.", resourceRoot)
	
	else
		exports.resplay:playerShowMessage(plr, "Теперь подойдите к клиенту и воспользуйтесь меню действий(клавиша K) для того, чтобы взять заказ.", resourceRoot)
	end
end

function missionFinish(plr, reason)
	if not isElement(plr) then
		return nil
	end
	
	for dim,dimPlr in pairs(playerDimensions) do
		if(dimPlr == plr) then
			playerDimensions[dim] = nil
		end
	end
	
	for _,elem in ipairs(tutorialElements[plr]) do
		if isElement(elem) then
			destroyElement(elem)
		end
	end
	
	tutorialElements[plr] = nil
	
	if isTimer(animTimers[plr]) then
		killTimer(animTimers[plr])
		animTimers[plr] = nil
	end
	
	clientOrders[plr] = nil
	clientQueue[plr] = nil
	clientSeats[plr] = nil
	setPlayerHudComponentVisible(plr, "ammo", true)
	setPlayerHudComponentVisible(plr, "armour", true)
	setPlayerHudComponentVisible(plr, "breath", true)
	setPlayerHudComponentVisible(plr, "clock", true)
	setPlayerHudComponentVisible(plr, "health", true)
	setPlayerHudComponentVisible(plr, "money", true)
	setPlayerHudComponentVisible(plr, "weapon", true)
	setPlayerHudComponentVisible(plr, "wanted", true)
	toggleAllControls(plr, true, true, true)
	toggleControl(plr, "jump", true)
	toggleControl(plr, "fire", true)
	toggleControl(plr, "sprint", true)
	toggleControl(plr, "crouch", true)
	tutorialSetPlayerInvincible(plr, false)
	triggerClientEvent(plr, "onWeatherSnow", getResourceRootElement(resplay), false)
	triggerClientEvent(plr, "onClientRemoveElements", resourceRoot)
	setElementModel(plr, playerSkins[plr])
	playerSkins[plr] = nil
end

function tutorialTakeOrder(plr, bot)
	local seatIndex
	
	for i=1,#clientSeats[plr] do
		if(clientSeats[plr][i]["seater"] == bot) then
			seatIndex = i
			break
		end
	end
	
	if not seatIndex then
		return nil
	end
	--[[
	local newOrder = clientMeals[seatIndex]
	if not newOrder then
		return nil
	end
	if not clientOrders[plr] then
		clientOrders[plr] = {}
	end
	table.insert(newOrder, seatIndex)
	table.insert(newOrder, nil)
	]]
	
	if not clientOrders[plr] then
		clientOrders[plr] = {}
	end
	
	local newOrder = {}
	newOrder[1] = clientMeals[seatIndex][1]
	newOrder[2] = clientMeals[seatIndex][2]
	newOrder[3] = seatIndex
	table.insert(clientOrders[plr], newOrder)
	exports.resplay:detachActionFromElement(actions["Клиент - Взять заказ"], bot)
	exports.ai:botTalk(bot, string.format(botTexts["order"][math.random(#botTexts["order"])], newOrder[2]), plr)
	--exports.resplay:playerShowMessage(plr, "Заказ клиента #"..tostring(seatIndex).." - "..newOrder[2]..".", resourceRoot)
	
	if not clientQueue[plr] then
		clientQueue[plr] = {}
	end
	
	if(#clientOrders[plr] == 1) then
		tutorialSpawnMeal(plr, seatIndex)
	
	else
		table.insert(clientQueue[plr], seatIndex)
	end
end

function tutorialSpawnMeal(plr, seatIndex)
	if not clientOrders[plr] then
		return nil
	end
	
	local objInfo = missionElements["meal"]
	
	if not objInfo then
		return nil
	end
	
	local curOrder
	
	for oid,order in pairs(clientOrders[plr]) do
		if order[3] == seatIndex then
			curOrder = oid
			break
		end
	end
	
	if not curOrder then
		return nil
	end
	
	local meal = createObject(clientOrders[plr][curOrder][1],
							   tonumber(objInfo["posX"]   ),
							   tonumber(objInfo["posY"]   ),
							   tonumber(objInfo["posZ"]   ),
							   tonumber(objInfo["rotX"]   ),
							   tonumber(objInfo["rotY"]   ),
							   tonumber(objInfo["rotZ"]   ))
	if not meal then
		return nil
	end
	
	table.insert(tutorialElements[plr], meal)
	setElementInterior(meal, 1)
	setElementDimension(meal, getElementDimension(plr))
	exports.resplay:attachActionToElement(actions["Поднос - Взять"], meal)
	clientOrders[plr][curOrder][4] = meal
	exports.resplay:playerShowMessage(plr, "На кухне готов заказ #"..tostring(givenMeals[plr] + 1)..". Вы можете его забрать, нажав клавишу K.", resourceRoot)
end

function tutorialTakeMeal(plr, meal)
	if not clientOrders[plr] then
		outputChatBox("ERROR: Стек заказов пуст. Передайте данную информацию администрации и перезайдите на сервер.", plr)
		return nil
	end
	--[[
	local curOrder
	for i=1,#clientOrders[plr] do
		if clientOrders[plr][i][4] == meal then
			curOrder = i
			break
		end
	end]]
	
	local curOrder = 1
	
	if not curOrder then
		outputServerLog("Player's order was not found("..getPlayerName(plr)..", "..tostring(plr)..").")
		outputServerLog("clientOrders: "..toJSON(clientOrders[plr]))
		outputServerLog("meal: "..tostring(meal))
		outputServerLog("clientQueue: "..toJSON(clientQueue[plr]))
		outputServerLog("clientSeats: "..toJSON(clientSeats[plr]))
		outputChatBox("ERROR: Заказ не был найден. Передайте данную информацию администрации и перезайдите на сервер.", plr)
		return nil
	end
	
	local bot = clientSeats[plr][clientOrders[plr][curOrder][3]]["seater"]
	
	if not bot then
		outputChatBox("ERROR: Бот не был найден. Передайте данную информацию администрации и перезайдите на сервер.", plr)
		return nil
	end
	
	exports.resplay:detachActionFromElement(actions["Поднос - Взять"], meal)
	setPedAnimation(plr, "CARRY", "crry_prtial", 0, false, true, true)
	animTimers[plr] = setTimer(setPedAnimation, 1000, 0, plr, "CARRY", "crry_prtial", 0, false, true, true)
	exports.resplay:attachActionToElement(actions["Клиент - Подать заказ"], bot)
	exports.bone_attach:attachElementToBone(meal, plr, 12, -0.1, 0.1, 0, 160, 125, 55)
end

function tutorialGiveMeal(plr, bot)
	if not clientOrders[plr] then
		return nil
	end
	
	local seatIndex
	
	for i=1,#clientSeats[plr] do
		if(clientSeats[plr][i]["seater"] == bot) then
			seatIndex = i
			break
		end
	end
	
	if not seatIndex then
		return nil
	end
	
	local curOrder
	
	for oid,order in pairs(clientOrders[plr]) do
		if order[3] == seatIndex then
			curOrder = oid
			break
		end
	end
	
	if not curOrder then
		return nil
	end
	
	local meal = clientOrders[plr][curOrder][4]
	
	if not meal then
		return nil
	end
	
	exports.bone_attach:detachElementFromBone(meal)
	killTimer(animTimers[plr])
	animTimers[plr] = nil
	setPedAnimation(plr, "CARRY", "putdwn05", -1, false, true, false, false)
	local seatInfo = missionElements["client"..tostring(seatIndex)]
	local mealInfo = missionElements["meal"]
	table.remove(clientOrders[plr], curOrder)
	givenMeals[plr] = givenMeals[plr] + 1
	exports.resplay:detachActionFromElement(actions["Клиент - Подать заказ"], bot)
	exports.ai:botTalk(bot, botTexts["thankyou"][math.random(#botTexts["thankyou"])], plr)
	setElementPosition(meal, tonumber(seatInfo["posX"]), tonumber(seatInfo["posY"]), tonumber(seatInfo["posZ"]) - 0.9)
	setElementRotation(meal, tonumber(mealInfo["rotX"]), tonumber(mealInfo["rotY"]), tonumber(seatInfo["rotZ"]) - 108.183)
	
	if(#clientQueue[plr] > 0) then
		seatIndex = clientQueue[plr][1]
		table.remove(clientQueue[plr], 1)
		tutorialSpawnMeal(plr, seatIndex)
	
	elseif(givenMeals[plr] >= #clientMeals) then
		tutorialSpawnTaxi(plr)
	
	else
		exports.resplay:playerShowMessage(plr, "Возьмите заказ у следующего клиента.", resourceRoot)
	end
end

function tutorialSpawnTaxi(plr)
	local dim = getElementDimension(plr)
	local objInfo = missionElements["taxi"]
	local taxi = createVehicle(tonumber(objInfo["model"]),
								tonumber(objInfo["posX"] ),
								tonumber(objInfo["posY"] ),
								tonumber(objInfo["posZ"] ),
								tonumber(objInfo["rotX"] ),
								tonumber(objInfo["rotY"] ),
								tonumber(objInfo["rotZ"] ))
	setElementDimension(taxi, dim)
	setElementInterior(taxi, 1)
	local bot = createPed(222, 0, 0, 0)
	setElementDimension(bot, dim)
	setElementInterior(bot, 1)
	warpPedIntoVehicle(bot, taxi)
	setElementFrozen(taxi, true)
	table.insert(tutorialElements[plr], taxi)
	table.insert(tutorialElements[plr], bot)
	addEventHandler("onVehicleDamage", taxi, vehicleGodMode, false)
	addEventHandler("onElementDestroy", taxi, vehicleNoGodMode, false)
	addEventHandler("onVehicleStartEnter", taxi, taxiStartEnter, false)
	addEventHandler("onVehicleEnter", taxi, taxiEnter, false)
	triggerClientEvent(plr, "onWeatherSnow", getResourceRootElement(resplay), true)
	exports.resplay:playerShowMessage(plr, "Все посетители обслужены. На заднем дворе вас ждет такси. Попасть туда вы сможете через кухню.", resourceRoot)
end

function vehicleGodMode()
	fixVehicle(source)
end

function vehicleNoGodMode()
	removeEventHandler("onVehicleDamage", source, vehicleGodMode)
	removeEventHandler("onElementDestroy", source, vehicleNoGodMode)
end

function taxiStartEnter(plr, seat)
	if(seat == 0) then
		cancelEvent()
	end
end

function taxiEnter(plr, seat)
	if(seat == 0) then
		cancelEvent()
		return nil
	end
	
	toggleAllControls(plr, false, true, true)
	tutorialFadeCamera(plr, false, 3)
	setTimer(tutorialOutroShowPlace, 3050, 1, plr)
end

function tutorialOutroShowPlace(plr)
	if not isElement(plr) then
		return nil
	end
	
	local realTime = getRealTime()
	triggerClientEvent(plr, "onWeatherSnow", getResourceRootElement(resplay), false)
	exports.resplay:showPlace(plr, "Где-то в штате San Andreas...", 1994, realTime.month+1, realTime.monthday)
	setTimer(tutorialOutroSpawn, 7500, 1, plr)
end

function tutorialOutroSpawn(plr)
	if not isElement(plr) then
		return nil
	end
	removePedFromVehicle(plr)
	
	local spx, spy, spz, spangle, spint, spdim = exports.resplay:playerGetDefaultSpawn(plr)
	setElementInterior(plr, spint)
	setElementDimension(plr, spdim)
	setElementPosition(plr, spx, spy, spz)
	setElementRotation(plr, 0.0, 0.0, spangle)
	setCameraTarget(plr)
	exports.resplay:elementSetGhostMode(plr, 3000)
	setTimer(tutorialOutroFinish, 1000, 1, plr)
	triggerEvent("onMissionFinish", getResourceRootElement(resplay), plr, getResourceName(resource))
end

function tutorialOutroFinish(plr)
	if not isElement(plr) then
		return nil
	end
	
	tutorialFadeCamera(plr, true, 1)
	toggleAllControls(plr, true, true, true)
	exports.resplay:toggleResplayMessages(plr, true)
	exports.resplay:playerShowMessage(plr, "Добро пожаловать в штат San Andreas. Начните свою игру с поиска работы в коммунальных службах или на ферме. Ботов со значком 'i' можно ударить, тем самым вы получите подсказку.", resourceRoot)

	setTimer(chooseSkin, 1000, 1, plr)
end

function chooseSkin(plr)
	exports.resplay:toggleSkinChooser(plr)
end

addEvent("onMissionStart")
addEvent("onMissionFinish")
addEventHandler("onResourceStart", resourceRoot, missionInit, false)
addEventHandler("onMissionStart", resourceRoot, missionStart, false)
addEventHandler("onMissionFinish", resourceRoot, missionFinish, false)