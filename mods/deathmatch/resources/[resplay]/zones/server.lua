-- Скрипт создан White Boy

--Как всё работает, увы пока не знаю как делать список из объектов, так что, если делаем ЗЗ для нового места, то 
-- копируем Local LsSpawn, меняем харка,название и копируем функции Enter и Exit
-- вставляем и изменяем название территории в addEventHandler на своё новое которое вы указали в новом Local
-- Не знаю как по другому объяснить ибо сонный.

-- Создаем коллизию на кординатах, название не менять.
--createColCuboid(координаты x, координаты y, координаты z, ширина, глубина(длина), высота)
local LsSpawn = createColCuboid(1663.95264, -2339.629, 12, 40.7, 25.5, 20) --LS
local SfSpawn = createColSphere(-1407.8697509766, -292.74862670898, 13, 27) -- SF
local LvSpawn = createColCuboid(1681.2352294922, 1432.7353515625, 9, 20, 30, 8) -- LV

-- Функция если игрок в зоне
function Enter(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", false)
			toggleControl(thePlayer, "action", false)
			toggleControl(thePlayer, "vehicle_fire", false)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true)
			toggleControl(thePlayer, "aim_weapon", true) 

			triggerClientEvent(thePlayer, "enableGodMode", thePlayer)
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, true)				
	end
end

addEventHandler("onColShapeHit", LsSpawn, Enter)

-- Функция на уход с территории
function Exit(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", true)
			toggleControl(thePlayer, "action", true)
			toggleControl(thePlayer, "vehicle_fire", true)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true) 
			toggleControl(thePlayer, "aim_weapon", true)
			
			triggerClientEvent(thePlayer, "disableGodMode", thePlayer)
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, false)				
	end
end
		
addEventHandler("onColShapeLeave", LsSpawn, Exit)

-- Для СФ
function Enter(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", false)
			toggleControl(thePlayer, "action", false)
			toggleControl(thePlayer, "vehicle_fire", false)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true)
			toggleControl(thePlayer, "aim_weapon", true)
			
			triggerClientEvent(thePlayer, "enableGodMode", thePlayer)     
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, true)				
	end
end

addEventHandler("onColShapeHit", SfSpawn, Enter)

-- Функция на уход с территории
function Exit(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", true)
			toggleControl(thePlayer, "action", true)
			toggleControl(thePlayer, "vehicle_fire", true)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true) 
			toggleControl(thePlayer, "aim_weapon", true)
			--replaceWeaponTextures(false)
			
			triggerClientEvent(thePlayer, "disableGodMode", thePlayer)
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, false)				
	end
end

addEventHandler("onColShapeLeave", SfSpawn, Exit)

-- Для ЛВ
function Enter(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", false)
			toggleControl(thePlayer, "action", false)
			toggleControl(thePlayer, "vehicle_fire", false)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true)
			toggleControl(thePlayer, "aim_weapon", true)

			triggerClientEvent(thePlayer, "enableGodMode", thePlayer)
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, true)				
	end
end

addEventHandler("onColShapeHit", LvSpawn, Enter)

-- Функция на уход с территории
function Exit(thePlayer, matchingDimension)
	if(getElementType(thePlayer) == "player") then
			toggleControl(thePlayer, "fire", true)
			toggleControl(thePlayer, "action", true)
			toggleControl(thePlayer, "vehicle_fire", true)
			toggleControl(thePlayer, "next_weapon", true) 
			toggleControl(thePlayer, "previous_weapon", true) 
			toggleControl(thePlayer, "aim_weapon", true)
			
			triggerClientEvent(thePlayer, "disableGodMode", thePlayer)
			--triggerClientEvent(thePlayer, "onEnableGreenZone", thePlayer, false)				
	end
end
		
addEventHandler("onColShapeLeave", LvSpawn, Exit)