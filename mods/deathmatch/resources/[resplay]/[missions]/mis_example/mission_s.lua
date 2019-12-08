local resplayRes
-- Здесь объявляем все переменные миссии

-- Инициализация ресурса(см. документацию к событию onResourceStart)
function missionInit(res)
	if(res ~= resourceRoot) then
		return nil
	end
	resplayRes = getResourceFromName("resplay")
	
	if not resplayRes then
		cancelEvent()
		return nil
	end
	
	local resplayState = getResourceState(resplayRes)
	
	if(resplayState == "loaded") or (resplayState == "stopping") or (resplayState == "failed to load") then
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