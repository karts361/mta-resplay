-- Создал список оружия под этим названием.
WeaponID = {
	[35] = true,
	--[36] = true,
}

--Настройки для РПГ(камеры)
addEventHandler('onPlayerWeaponSwitch', getRootElement(),
	function(previousWeaponID, currentWeaponID)

		if(WeaponID[currentWeaponID]) then -- Если оружее из списка в руках
			toggleControl(source, 'fire', false) -- Выключает возможность стрелять
			toggleControl(source, 'action', false) -- Выключает возможность стрелять когда нажимаешь Tab

		else -- Если сменил оружее
			toggleControl(source, 'fire', true) -- Включает возможность стрелять
			toggleControl(source, 'action', true) -- Включает возможность стрелять когда нажимаешь Tab
		end
	end
)

-- Настройки РПГ, теперь мы с РПГ можем прыграть
setWeaponProperty(35, "pro", "flags", 0x000200, false)
setWeaponProperty(35, "std", "flags", 0x000200, false)
setWeaponProperty(35, "poor", "flags", 0x000200, false)
setWeaponProperty(36, "pro", "flags", 0x000200, false)
setWeaponProperty(36, "std", "flags", 0x000200, false)
setWeaponProperty(36, "poor", "flags", 0x000200, false)

-- Скрипт был создан Юрием Лудановым.(Ники : White_Boy, Richard_Maconne, Clint_Coblstone)
-- Для проекта "Resplay"