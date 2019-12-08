-- RESPLAY AIRPORT SCRIPT by Ilya1337, D.D.M. 29.01.19
local spawnX, spawnY, spawnZ = -1544.0, -440.0, 6.0
local lvX, lvY, lvZ =  1673.0, 1447.5, 9.8
local sfX, sfY, sfZ =  -1380.0, -353.0, 13.1
local lsX, lsY, lsZ = 1730.2, -2335.0, 12.5
local markerRadius = 1.5

--Цены на перелеты
local lsPrice = 500
local sfPrice = 650
local lvPrice = 800

function joinHandler()
	
end

-- Для теста
--addEventHandler("onPlayerJoin", getRootElement(), joinHandler) 

-- Пользователь наступил на маркер
function lvHit(hitElem, matchDimension)
	if matchDimension then
		triggerClientEvent("lvHit", hitElem)
	end
	
	return true
end

function sfHit(hitElem, matchDimension)
	if matchDimension then
		triggerClientEvent("sfHit", hitElem)
	end
	return true
end

function lsHit(hitElem, matchDimension)
	if matchDimension then
		triggerClientEvent("lsHit", hitElem)
	end
	
	return true
end

addEventHandler("onResourceStart", getRootElement(), function(res) -- Когда стартанул ресурс
	local thisres = getResourceRootElement(getThisResource())
	if not res == thisres then
		return -- Отсеиваем чужие ресурсы
	end

	-- Создаем маркеры, эвенты прикосновения с ними
	-- LV Аэропорт
	local markerlv = createMarker(lvX, lvY, lvZ, "cylinder", markerRadius, 255, 0, 0, 32)
	addEventHandler("onMarkerHit", markerlv, lvHit)

	-- SF Аэропорт
	local markersf = createMarker(sfX, sfY, sfZ, "cylinder", markerRadius, 255, 0, 0, 32)
	addEventHandler("onMarkerHit", markersf, sfHit)

	-- LS Аэропорт
	local markerls = createMarker(lsX, lsY, lsZ, "cylinder", markerRadius, 255, 0, 0, 32)
	addEventHandler("onMarkerHit", markerls, lsHit)
	
	--Добавляем надписи
	exports.resplay:pickupSetText(markerlv, "Терминал", 255, 0, 0)
	exports.resplay:pickupSetText(markersf, "Терминал", 255, 0, 0)
	exports.resplay:pickupSetText(markerls, "Терминал", 255, 0, 0)
end)

addEvent("sfDone", true)
addEvent("lvDone", true)
addEvent("lsDone", true)

addEventHandler("sfDone", getRootElement(), function()
	exports.resplay:playerTakeMoney(source, sfPrice)
	setElementPosition(source, sfX - 5.0, sfY, sfZ + 1.0)
	fadeCamera(source, true, 1000)
	setCameraTarget(source, source)
end)

addEventHandler("lvDone", getRootElement(), function()
	exports.resplay:playerTakeMoney(source, lvPrice) 
	setElementPosition(source, lvX + 5.0, lvY, lvZ + 1.0)
	fadeCamera(source, true, 1000)
	setCameraTarget(source, source)
end)

addEventHandler("lsDone", getRootElement(), function()
	exports.resplay:playerTakeMoney(source, lsPrice)
	setElementPosition(source, lsX, lsY + 5.0, lsZ + 1.0)
	fadeCamera(source, true, 1000)
	setCameraTarget(source, source)
end)