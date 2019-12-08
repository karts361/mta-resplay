-- RESPLAY AIRPORT SCRIPT by Ilya1337, D.D.M. 29.01.19

-- Место появления самолета
local airls1 = {1236.1834716797, -2589.4313964844, 81.634742736816} 

-- Сюда смотрит камера
local airls2 = {1634.9403076172, -2589.4313964844, 15.947296142578}

-- Координаты камеры, сюда летит самолет
local airls3 = {1753.9670410156, -2589.4313964844, 15.947296142578}
local airlv1 = {1478.0646972656, 1103.9533691406, 25.083503723145}
local airlv2 = {1478.0646972656, 1287.1165771484, 12.50409412384}
local airlv3 = {1478.0646972656, 1476.8316650391, 12.50409412384}
local airsf1 = {-1053.0810546875, 436.2646484375, 39.420928955078}
local airsf2 = {-1224.2940673828, 268.34460449219, 16.001026153564}
local airsf3 = {-1450.7772216797, 41.665950775146, 16.387564659119}

--Цены на перелеты
local lsPrice = 500
local sfPrice = 650
local lvPrice = 800

--Эвенты со стороны сервера
addEvent("lsHit", true)
addEvent("sfHit", true)
addEvent("lvHit", true)

-- Перемещение завершено
function sfDone()
	outputChatBox("Welcome to San Fierro!")
	destroyElement(plane)
	triggerServerEvent("sfDone", localPlayer)
end

function lsDone()
	outputChatBox("Welcome to Los Santos!")
	destroyElement(plane)
	triggerServerEvent("lsDone", localPlayer)
end

function lvDone()
	outputChatBox("Welcome to Las Venturas!")
	destroyElement(plane)
	triggerServerEvent("lvDone", localPlayer)
end

function flightScene(button, state)
	if button == "left" and state == "up" then
		local cityName = guiGridListGetItemText(cityList, guiGridListGetSelectedItem(cityList), 1)

		if not cityName then
			return outputChatBox("Fly to")
		end
		
		local playerMoney = getPlayerMoney(localPlayer)
		
		if cityName == "San Fierro" then
			if playerMoney < sfPrice then
				return outputChatBox("You haven't got enough money to do that")
			end
			
			setCameraMatrix(airsf3[1], airsf3[2], airsf3[3], airsf2[1], airsf2[2], airsf2[3])
			plane = createObject(1681, airsf1[1], airsf1[2], airsf1[3], 0, 0, 135)
			moveObject(plane, 5000, airsf3[1], airsf3[2], airsf3[3])
			setTimer(sfDone, 5000, 1)

		elseif cityName == "Los Santos" then
			if playerMoney < lsPrice then
				return outputChatBox("You haven't got enough money to do that")
			end
			
			setCameraMatrix(airls3[1], airls3[2], airls3[3], airls2[1], airls2[2], airls2[3])
			plane = createObject(1681, airls1[1], airls1[2], airls1[3], 0, 0, 270)
			moveObject(plane, 5000, airls3[1], airls3[2], airls3[3])
			setTimer(lsDone, 5000, 1)

		elseif cityName == "Las Venturas" then
			
			if playerMoney < lvPrice then
				return outputChatBox("You haven't got enough money to do that")
			end
			
			setCameraMatrix(airlv3[1], airlv3[2], airlv3[3], airlv2[1], airlv2[2], airlv2[3])
			plane = createObject(1681, airlv1[1], airlv1[2], airlv1[3])
			moveObject(plane, 5000, airlv3[1], airlv3[2], airlv3[3])
			setTimer(lvDone, 5000, 1)

		end
		
		guiSetVisible(airWindow, false)
		showCursor(false)

	end
end

-- Отображение диалогового окна
function createAirportWindow()
	airWindow = guiCreateWindow(0.375, 0.275, 0.25, 0.35, "Fly to", true)
	cityList = guiCreateGridList(0,0.1 , 0.9, 0.75, true, airWindow)
	guiGridListAddColumn(cityList, "City", 0.65)
	guiGridListAddColumn(cityList, "Price", 0.15)
	airBtn = guiCreateButton(0.175, 0.9, 0.15, 0.1, "OK", true, airWindow)
	closeBtn = guiCreateButton(0.675, 0.9, 0.15, 0.1, "Cancel", true, airWindow)
	guiSetVisible(airWindow, false)
	addEventHandler("onClientGUIClick", airBtn, flightScene)
	addEventHandler("onClientGUIClick", closeBtn, function(button,state)

		if button == "left" and state == "up" then
			guiSetVisible(airWindow, false)
			showCursor(false)
		end

	end)
end

addEventHandler("onClientResourceStart", resourceRoot, createAirportWindow)

-- Создание диалогового окна
 function showAirportWindow(city)	
	-- Очищаем лист
	guiGridListClear(cityList) 

	-- Добавляем строки для выбора городов
	if city == "Las Venturas" then
		guiGridListAddRow(cityList, "San Fierro", sfPrice) 
		guiGridListAddRow(cityList, "Los Santos", lsPrice)

	elseif city == "San Fierro" then
		guiGridListAddRow(cityList, "Las Venturas", lvPrice)
		guiGridListAddRow(cityList, "Los Santos", lsPrice)

	elseif city == "Los Santos" then
		guiGridListAddRow(cityList, "Las Venturas", lvPrice)
		guiGridListAddRow(cityList, "San Fierro", sfPrice)

	end
	
	guiSetVisible(airWindow, true)
	showCursor(true)
end

-- Пользователь наступил на маркер
addEventHandler("lvHit", localPlayer, function()
	showAirportWindow("Las Venturas")
end)

addEventHandler("sfHit", localPlayer, function()
	showAirportWindow("San Fierro")
end)

addEventHandler("lsHit", localPlayer, function()
	showAirportWindow("Los Santos")
end)
