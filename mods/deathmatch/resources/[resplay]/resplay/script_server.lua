db = nil
dbq = nil
dbqueryresult = nil

playerLastInfo = {}

outsideSpawnsArray = {
	{ 1751.436, -1949.659, 13.54, 358.767, 0, 0 },
	{ -1422.5, -288.5, 14.1, 135.0, 0, 0 },
	{ 1689.9, 1447.7, 10.8, 270.0, 0, 0 }
}
outsideSpawnsCur = 1
outsideSpawnsIter = 0

respawnPositions = {}

greenZones = {}
greenZonesRadius = 20.0

loginTimers = {}

-- HANDLING

local predefinedHandling = {
	[604] = {
        ["mass"] = 2200.0,
        ["turnMass"] = 4000,
        ["dragCoeff"] = 2.0,
        ["centerOfMass"] = { [1]=0, [2]=0.1, [3]=-0.2 },
        ["percentSubmerged"] = 85,
        ["tractionMultiplier"] = 0.7,
        ["tractionLoss"] = 0.9,
        ["tractionBias"] = 0.5,
        ["numberOfGears"] = 5,
        ["maxVelocity"] = 200.0,
        ["engineAcceleration"] = 13.2,
        ["engineInertia"] = 5.0,
        ["driveType"] = "awd",
        ["engineType"] = "petrol",
        ["brakeDeceleration"] = 11.0,
        ["brakeBias"] = 0.45,
        ["ABS"] = true,
        ["steeringLock"] =  30.0,
        ["suspensionForceLevel"] = 1.2,
        ["suspensionDamping"] = 0.12,
        ["suspensionHighSpeedDamping"] = 0.0,
        ["suspensionUpperLimit"] = 0.28,
        ["suspensionLowerLimit"] = -0.35,
        ["suspensionFrontRearBias"] = 0.5,
        ["suspensionAntiDiveMultiplier"] = 0.4,
        ["collisionDamageMultiplier"] = 0.7,
        ["modelFlags"] = 0x40002800,
        ["handlingFlags"] = 0x8800,
	},
	[466] = {
        ["mass"] = 2200.0,
        ["turnMass"] = 4000,
        ["dragCoeff"] = 2.0,
        ["centerOfMass"] = { [1]=0, [2]=0.1, [3]=-0.2 },
        ["percentSubmerged"] = 85,
        ["tractionMultiplier"] = 0.7,
        ["tractionLoss"] = 0.9,
        ["tractionBias"] = 0.5,
        ["numberOfGears"] = 5,
        ["maxVelocity"] = 200.0,
        ["engineAcceleration"] = 13.2,
        ["engineInertia"] = 5.0,
        ["driveType"] = "awd",
        ["engineType"] = "petrol",
        ["brakeDeceleration"] = 11.0,
        ["brakeBias"] = 0.45,
        ["ABS"] = true,
        ["steeringLock"] =  30.0,
        ["suspensionForceLevel"] = 1.2,
        ["suspensionDamping"] = 0.12,
        ["suspensionHighSpeedDamping"] = 0.0,
        ["suspensionUpperLimit"] = 0.28,
        ["suspensionLowerLimit"] = -0.35,
        ["suspensionFrontRearBias"] = 0.5,
        ["suspensionAntiDiveMultiplier"] = 0.4,
        ["collisionDamageMultiplier"] = 0.7,
        ["modelFlags"] = 0x40002800,
        ["handlingFlags"] = 0x8800,
	},
	[528] = { -- FBI cheetah handling
        ["mass"] = 2200.0,
        ["turnMass"] = 4000,
        ["dragCoeff"] = 2.0,
        ["centerOfMass"] = { [1]=0, [2]=0.1, [3]=-0.2 },
        ["percentSubmerged"] = 85,
        ["tractionMultiplier"] = 0.7,
        ["tractionLoss"] = 0.9,
        ["tractionBias"] = 0.5,
        ["numberOfGears"] = 5,
        ["maxVelocity"] = 200.0,
        ["engineAcceleration"] = 13.2,
        ["engineInertia"] = 5.0,
        ["driveType"] = "awd",
        ["engineType"] = "petrol",
        ["brakeDeceleration"] = 11.0,
        ["brakeBias"] = 0.45,
        ["ABS"] = true,
        ["steeringLock"] =  30.0,
        ["suspensionForceLevel"] = 1.2,
        ["suspensionDamping"] = 0.12,
        ["suspensionHighSpeedDamping"] = 0.0,
        ["suspensionUpperLimit"] = 0.28,
        ["suspensionLowerLimit"] = -0.35,
        ["suspensionFrontRearBias"] = 0.5,
        ["suspensionAntiDiveMultiplier"] = 0.4,
        ["collisionDamageMultiplier"] = 0.7,
        ["modelFlags"] = 0x40002800,
        ["handlingFlags"] = 0x8800,
	},
	[598] = {
        ["mass"] = 2200.0,
        ["turnMass"] = 4000,
        ["dragCoeff"] = 2.0,
        ["centerOfMass"] = { [1]=0, [2]=0.1, [3]=-0.2 },
        ["percentSubmerged"] = 85,
        ["tractionMultiplier"] = 0.7,
        ["tractionLoss"] = 0.9,
        ["tractionBias"] = 0.5,
        ["numberOfGears"] = 5,
        ["maxVelocity"] = 220.0,
        ["engineAcceleration"] = 16.2,
        ["engineInertia"] = 5.0,
        ["driveType"] = "awd",
        ["engineType"] = "petrol",
        ["brakeDeceleration"] = 11.0,
        ["brakeBias"] = 0.45,
        ["ABS"] = true,
        ["steeringLock"] =  30.0,
        ["suspensionForceLevel"] = 1.2,
        ["suspensionDamping"] = 0.12,
        ["suspensionHighSpeedDamping"] = 0.0,
        ["suspensionUpperLimit"] = 0.28,
        ["suspensionLowerLimit"] = -0.35,
        ["suspensionFrontRearBias"] = 0.5,
        ["suspensionAntiDiveMultiplier"] = 0.4,
        ["collisionDamageMultiplier"] = 0.15,
        ["modelFlags"] = 0x40002800,
        ["handlingFlags"] = 0x8800,
	},
	[413] = {
        ["mass"] = 5500.0,
        ["turnMass"] = 14000,
        ["dragCoeff"] = 2.5,
        ["centerOfMass"] = { [1]=0, [2]=0.1, [3]=-0.3 },
        ["percentSubmerged"] = 85,
        ["tractionMultiplier"] = 0.7,
        ["tractionLoss"] = 0.6,
        ["tractionBias"] = 0.44,
        ["numberOfGears"] = 4,
        ["maxVelocity"] = 105.0,
        ["engineAcceleration"] = 25.0,
        ["engineInertia"] = 27.0,
        ["driveType"] = "awd",
        ["engineType"] = "diesel",
        ["brakeDeceleration"] = 6.6,
        ["brakeBias"] = 0.5,
        ["ABS"] = true,
        ["steeringLock"] =  30.0,
        ["suspensionForceLevel"] = 0.5,
        ["suspensionDamping"] = 0.08,
        ["suspensionHighSpeedDamping"] = 1.0,
        ["suspensionUpperLimit"] = 0.3,
        ["suspensionLowerLimit"] = -0.18,
        ["suspensionFrontRearBias"] = 0.5,
        ["suspensionAntiDiveMultiplier"] = 0.3,
        ["collisionDamageMultiplier"] = 0.06,
        ["modelFlags"] = 0x4009,
        ["handlingFlags"] = 0x1000001,
        ["animGroup"] = 13,
	},
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

housesInteriors = {
	{ 422.273, 2536.5, 1010.0, 10, {} },
	{ 2282.91, -1140.29, 2050.7, 11, {} },
	{ 2217.54, -1076.29, 2050.4, 1, {} },
	{ 2237.59, -1080.87, 2048.9, 2, {} },
	{ 2233.8, -1115.36, 2050.7, 5, {} },
	{ 2308.79, -1212.88, 2048.85, 6, {} },
	{ 2196.79, -1204.35, 2048.9, 6, {} },
	{ 2270.39, -1210.45, 2047.4, 10, {} },
	{ 140.18, 1366.58, 2083.8, 5, {} },
	{ 1260.58, -785.31, 2091.8, 5, {} },
	{ 2807.62, -1174.1, 2025.38, 8, {} },
	{ 2496.05, -1692.73, 2014.55, 3, {} },
	{ 2317.82, -1026.75, 2049.91, 9, {} },
	{ 2468.5, -1698.2, 2014.2, 2, {} },
	{ 244.1, 304.9, 1999.8, 1, {} },
	{ 2524.7, -1679.4, 2016.2, 1, {} },
	{ 318.7, 1115.4, 2084.6, 5, {} },
	{ 2542.3, -1304.2, 2025.8, 2, {} }
}
housesFrozenObjs = {
	[1504]=true,
	[977]=true,
	[1535]=true,
	[1496]=true,
	[1569]=true,
	[1567]=true,
	[1506]=true,
	[1507]=true,
	[1340]=true,
	[3059]=true
}

houses = {}
houseOwners = {}
interiors = {}
playersInsideHouses = {}

workGroups = { 2, 4, 5, 7, 8, 9, 11, 16, 17, 18 }

-- playerGroups[type_id][race][gender][skin_id], pryklad - playerGroups[1][4][1][1] - гражданин-азиат-мужчина-скин_1
playerGroups = {
	{ "Гражданин", {
			-- men, woman
			{{23, 26, 34, 37, 45, 72, 96, 97, 100, 101, 188, 206, 217, 240, 241, 242}, {93, 138, 140,192, 251}}, -- white
			{{7, 18, 19, 20, 21, 22, 25, 66, 67, 142, 143, 249}, {12, 13, 40, 69, 139, 238}}, -- black
			{{47, 48, 98}, {41, 55, 211}}, -- latino
			{{59, 60, 170, 187, 210}, {224, 226}} -- asian
		}
 	},
	{ "Полицейский", {
			{{280, 281}, {145}}, -- white
			{{265, 284}, {38}}, -- black
			{{267}, {39}}, -- latino
			{{266}, {31}} -- asian
		}
 	},
	{ "Пожарный", {
		-- не отсортированы
			{{277, 278, 279}, {277, 278, 279}}, -- white
			{{277, 278, 279}, {277, 278, 279}}, -- black
			{{277, 278, 279}, {277, 278, 279}}, -- latino
			{{277, 278, 279}, {277, 278, 279}} -- asian
		}
 	}, -- unused (неиспользуемый статус)
	{ "Медик", {
			{{276}, {276}}, -- white
			{{274}, {274}}, -- black
			{{275}, {275}}, -- latino
			{{276}, {276}} -- asian
		}
 	},
	{ "Военный", {
			{{287}, {191}}, -- white
			{{287}, {191}}, -- black
			{{287}, {191}}, -- latino
			{{287}, {191}} -- asian
		}
	},
	{ "Спортсмен", {
		-- не отсортированы
			{{18, 45, 51, 52, 154, 96, 97, 99}, {18, 45, 51, 52, 154, 96, 97, 99}}, -- white
			{{18, 45, 51, 52, 154, 96, 97, 99}, {18, 45, 51, 52, 154, 96, 97, 99}}, -- black
			{{18, 45, 51, 52, 154, 96, 97, 99}, {18, 45, 51, 52, 154, 96, 97, 99}}, -- latino
			{{18, 45, 51, 52, 154, 96, 97, 99}, {18, 45, 51, 52, 154, 96, 97, 99}} -- asian
		}
	}, -- unused (неиспользуемый статус)
	{ "Пилот", {
			{{61}, {61}}, -- white
			{{253}, {253}}, -- black
			{{61}, {61}}, -- latino
			{{61}, {61}} -- asian
		}
	},
	{ "Фермер", {
			{{133, 161, 202, 206}, {157, 198, 201}}, -- white
			{{134, 136}, {10}}, -- black
			{{133, 161, 202, 206}, {131}}, -- latino
			{{133, 161, 202, 206}, {131}} -- asian
		}
	},
	{ "Водитель", {
			{{133, 161, 202, 206}, {157, 198, 201}}, -- white
			{{134, 136}, {190}}, -- black
			{{133, 161, 202, 206}, {131}}, -- latino
			{{133, 161, 202, 206}, {131}} -- asian
		}
	},
	{ "Бандит", {
			{{29, 111, 112, 124, 125, 126, 127}, {192}}, -- white
			{{28, 101, 102, 103, 104, 105, 106, 107}, {195}}, -- black
			{{30, 108, 109, 110, 114, 115, 116}, {298}}, -- latino
			{{117, 118, 120, 121, 122, 123}, {169}} -- asian
		}
	},
	{ "Коммунальные службы", {
			{{27}, {151}}, -- white
			{{16}, {218}}, -- black
			{{144}, {9}}, -- latino
			{{309}, {56}} -- asian
		}
	},
	{ "Бомж", {
			{{78, 137, 135, 239, 162}, {199}}, -- white
			{{79, 230}, {195}}, -- black
			{{200}, {199}}, -- latino
			{{132}, {199}} -- asian
		}
	},
	{ "Бизнесмен", {
			{{111, 147}, {141}}, -- white
			{{296}, {148, 219}}, -- black
			{{185, 223}, {150}}, -- latino
			{{228, 249, 186}, {263}} -- asian
		}
	},
	{ "Спецназ", {
		{{285}, {285}}, -- white
		{{285}, {285}}, -- black
		{{285}, {285}}, -- latino
		{{285}, {285}} -- asian
	}
	}, --unused (неиспользуемый статус, скин спецназовца есть пока что у полицейского статуса)
	{ "Администрация", {
			{{295}, {91}}, -- white
			{{17}, {190}}, -- black
			{{113}, {91}}, -- latino
			{{294}, {91}} -- asian
		}
	},
	{ "Продавец", {
			{{155, 167}, {205}}, -- white
			{{168}, {304}}, -- black
			{{113}, {205}}, -- latino
			{{229}, {205}} -- asian
		}
	},
	{ "ФБР", {
			{{286, 165}, {286, 165}}, -- white
			{{166}, {166}}, -- black
			{{163}, {163}}, -- latino
			{{294}, {294}} -- asian
		}
	},
	{ "СМИ", {
			{{303}, {216}}, -- white
			{{24}, {215}}, -- black
			{{46}, {216}}, -- latino
			{{120}, {216}} -- asian
		}
	}
}

playerGroupSkills = {
	[2] = {
		[22] = { 250, "25% выносливости" },
		[160] = { 100, "10% опыта вождения" }
	},
	[4] = {
		[160] = { 100, "10% опыта вождения" }
	},
	[5] = {
		[22] = { 500, "50% выносливости" },
		[160] = { 400, "40% опыта вождения" }
	},
	[7] = {
		[169] = { 350, "35% опыта управления самолетами и вертолетами" }
	},
	[9] = {
		[160] = { 350, "35% опыта вождения" }
	},
	[17] = {
		[22] = { 500, "50% выносливости" },
		[160] = { 400, "40% опыта вождения" }
	},
	[18] = {
		[160] = { 100, "10% опыта вождения" }
	}
}
playerSkillsBuffer = {}
-----------------Требования на работу--------------------------
playerGroupRPLevels = {
	{ 0.0, 1.0 },
	{ -1.0, 1.0 },
	{ 0.25, 1.0 },
	{ -1.0, 1.0 },
	{ -1.0, 1.0 },
	{ 0.0, 0.5 },
	{ 0.25, 0.35 },
	{ -1.0, 0.0 },
	{ 0.03, 0.08 },
	{ -1.0, 0.0 },
	{ 0.0, 0.7 },
	{ 0.0, 1.0 },
	{ 0.0, 1.0 },
	{ 10.0, 10.0 },
	{ -1.0, 1.0 },
	{ 0.0, 0.25 }
}
workStartMarkers = {}

HealthMarkers = {}

housePickupModelAvailable = 1273
housePickupModelNotAvailable = 1272

availableActions = {
	"Дом - Купить",
	"Дом - Продать",
	"Бизнес - Купить",
	"Бизнес - Продать",
	"Debug - Телепорт",
	"Debug - Спаун транспорта",
	"Работа - Начать",
	"Службы - Заказать эвакуатор",
	"Работа - Заправить",
	"Работа - Ремонт",
	"Транспорт - Купить",
	"Транспорт - Спаун",
	"Транспорт - Продать",
	"Дом - Войти",
	"Предмет - Подобрать",
	"Заправка - Купить канистру",
	"Аммуниция - Войти",
	"Здание - Войти в ",
	"Гонка - Принять участие",
	"Магнитола - Выключить",
	"Магнитола - Сменить трек",
	"Работа - Начать карьеру ",
	"Работа - Бросить карьеру ",
	"Работа - Принять ближайший вызов",
	"Службы - Вызвать полицию",
	"Службы - Вызвать скорую помощь",
	"СМИ - Обратиться",
	"Работа - Вылечить игрока ",
	"Дом - Сделать точкой старта",
	"Колесо обозрения - Прокатиться",
	"Колесо обозрения - Покинуть",
	"Цена за голову - Назначить",
	"Банда - Создать",
	"Банда - Расформировать",
	"Банда - Пригласить игрока",
	"Банда - Принять приглашение",
	"Банда - Отклонить приглашение",
	"Банда - Исключить игрока",
	"Банда - Вызвать подмогу",
	"Банда - Покинуть банду",
	"Бизнес - Забрать выручку",
	"Букмекерская контора - Войти",
	"Рэкет - Начать",
	"Военный груз - Украсть",
	"Военный груз - Вернуть ящик",
	"Выдача снаряжения - Получить",
	"Больница - Вылечиться",
	"Букмекерская контора - Купить лотерейный билет",
	"Работа - Найти заказ",
	"Туториал -",
	"Работа - Установить тариф",
	"Службы - Заказать такси",
	"Модерация - Кикнуть игрока",
	"Модерация - Забанить игрока",
	"Игрок - Дать денег игроку",
	"Модерация - Пожаловаться на игрока",
	"Полиция - Откуп",
	"Бой лоурайдеров - Начать",
	"Бой лоурайдеров - Покинуть",
	"Транспорт - Открыть багажник",
	"Транспорт - Закрыть багажник",
	"Транспорт - Взять из багажника",
	"Работа - Вызвать подкрепление",
	"Работа - Просмотреть доступные карьеры",
	"Модерация - Создать гонку",
	"Игрок - Применить анимацию",
	"Игрок - Остановить анимацию",
	"RC - Уничтожить",
	"Продажа еды - Купить",
	"Дерби - Участвовать",
	"Модерация - Задать вопрос",
	"Модерация - Просмотреть вопросы от игроков",
	"Бой лоурайдеров - Сделать ставку на",
	"Работа - Найти ближайшего преступника",
	"Транспорт - Отключить летающее авто",
	"Транспорт - Включить летающее авто",
	"Джетпак - Надеть",
	"Джетпак - Снять",
	"Игрок - Выбрать анимацию ходьбы",
	"Игрок - Выбрать анимацию борьбы",
	"Донат - Активация",
	"GPS - Включить/выключить",
	"Клан - Создать ($100000)",
	"База - Информация",
	"Клан - Открыть меню клана",
	"Клан - Принять приглашение(пропадёт уважение государства)",
	"База - Открыть/закрыть ворота",
	"База - Взять деньги со склада",
	"База - Внести деньги на склад",
	"База - Положить текущее оружие на склад",
	"База - Взять c базы",
	"База - Купить автомобиль для базы",
	"База - Апгрейд автомобилей на базе",
	"База - Взять с базы",
	"База - Включить генератор",
	"База - Выключить генератор",
	"База - Включить тревогу",
	"База - Выключить тревогу",
	"База - Начать захват",
	"База - Восстановить генератор",
	"База - Улучшить склад",
	"Модерация - Лог событий за определенную дату",
	"Модерация - Лог последних 100 событий",
	"Задание - Пройти опрос за вознаграждение",
	"Предмет - Выкинуть текущее оружие",
	"Предмет - Подобрать ",
	"Модерация - Просмотреть жалобы на игроков",
	"Транспорт - Тюнинг",
	"Цена за голову - Найти ближайшую жертву",
	"Безопасность - Присоединить аккаунт к данному устройству",
	"Безопасность - Отсоединить аккаунт от устройства",
	"Модерация - Проверить присоединенное устроиство аккаунта",
	"Тригер - Открыть/Закрыть",
	"Игрок - Задать лицо персонажа",
	"Игрок - Очистить лицо персонажа",
	"Работа - Предложить оплатить штраф игроку ",
	"Мероприятие - Создать",
	"Мероприятие - Открыть меню",
	"Мероприятие - Начать приём участников",
	"Мероприятие - Старт",
	"Мероприятие - Рестарт",
	"Мероприятие - Закончить",
	"Мероприятие - Присоединиться к ",
	"Мероприятие - Сменить скин ",
	"Фракция - Открыть меню",
	"Фракция - Назначить лидера",
	"Транспорт - Продать игроку",
	"Дом - Продать игроку",
	"Работа - Установить уровень розыска",
	"Ограбление - Украсть ",
	"Ограбление - Обыскать ",
	"Модерация - Удалить аккаунты по с/н",
	"Модерация - Разбанить игрока",
	"Игрок - Обыскать игрока ",
	"Игрок - Стать бандитом (Пропадёт уважение государства)",
	"Тревога - Включить",
	"Тревога - Выключить"
}
defaultActions = {}
availableJobs = {
	"Вывоз мусора",
	"Мойка дорог",
	"Газонокосилка",
	"Эвакуатор",
	"Перевозка грузов",
	"Скорая помощь",
	"Сбор зерна",
	"Вспахивание поля",
	"Перевозка генерала",
	"Такси",
	"Продажа еды"
}
jobWorkers = {}
jobCollectedItems = {}
jobVehicles = {
	[408] = 1,
	[574] = 2,
	[572] = 3,
	[525] = 4,
--	[416] = 6,
	[532] = 7,
	[531] = 8,
	[420] = 10,
	[438] = 10,
	[588] = 11,
	[448] = 11,
--	[490] = 17
}
jobCoroutine = nil
jobRenderedServices = {}
jobServiceLimits = {
	[2] = 2,
	[4] = 1,
	[5] = 2,
	[9] = 2,
	[11] = 2,
	[16] = 2
}
errorStr_incorrectParams = "Неправильно введены данные"
errorStr_dbError = "Ошибка базы данных"

jobCpFixCoords = {
	{ 2107, -2012.3, 12.5 },
	{ -2109.9885, -260.62097, 34.35871 },
	{ 1461.728, 931.17407, 10.22827 },
	{ 1452.5066, 930.375, 10.29505 },
	{ 1424.8016, 930.76019, 10.26286 }
}
jobCpFinishCoords = {
	{ 2106.7, -2064.3999, 13.6 },
	{ -2167.4993, -214.52258, 34.35871 },
	{ 1384.528, 944.76178, 10.81298 }
}
jobCpFix = {}
jobCpFinish = {}

-- Мусоровоз(переменные)
jobTrashmasterStartTime = 120000
jobTrashmasterIncTime = 10000
jobTrashmasterMaxFillness = 100
jobTrashmasterIncMoney = 3
jobTrashmasterMoneyForBlowedCar = 2000
jobTrashmasterMoneyForLeftCar = 100
jobTrashmasterUnloadCycle = 5
jobTrashmasterTimeBackToVeh = 60000
jobTrashmasterCpCoords = {}
jobTrashmasterCarCoords = {}
jobTrashmasterCars = {}
jobTrashmasterCps = {}
jobTrashmasterCpBlips = {}
jobTrashmasterVehMarker = nil

-- Мойка дорог(переменные)
jobWashroadsStartTime = 120000
jobWashroadsIncTime = 15000
jobWashroadsIncMoneyPerCp = 5
jobWashroadsMoneyForBlowedCar = 2000
jobWashroadsMoneyForLeftCar = 100
jobWashroadsTimeBackToVeh = 60000
jobWashroadsCarCoords = {}
jobWashroadsCars = {}
jobWashroadsCpCoords = {}
jobWashroadsCps = {}
jobWashroadsCpBlips = {}

-- Газонокосилка(переменные)
jobLawnmowMoneyForGrass = 1
jobLawnmowMoneyForLeftCar = 100
jobLawnmowMoneyForBlowedCar = 2000
jobLawnmowLawnCoords = {}
jobLawnmowLawns = {}
jobLawnmowLawnsInProcess = {}
jobLawnmowNeedToResetProgress = true
jobLawnmowCars = {}

-- Эвакуатор(переменные)
jobEvacuatorMoneyForLeftCar = 100
jobEvacuatorMoneyForBlowedCar = 2000
jobEvacuatorMoneyForFakeOrder = 100
jobEvacuatorPriceFill = 400
jobEvacuatorPriceFix = 250
jobEvacuatorCars = {}
jobEvacuatorOrders = {}

-- Перевозка грузов(переменные)
jobTruckerMoneyForLeftCar = 1000
jobTruckerMoneyForBlowedCar = 2000
jobTruckerTimeBackToVeh = 120000
jobTruckerSpawnIndex = 1
jobTruckerCarSpawnPoints = {}
jobTruckerTrucks = {}
jobTruckerAvailableTrucks = {}

-- Продажа авто(переменные)
carSellCoroutine = nil
carSellSQLIds = {}
carSellShops = {}
carSellCarArrays = {
	["car"] = { 604, 404, 482, 401, 419, 410, 502, 585, 409, 411, 429, 534, 492, 566, 540, 421, 480, 562, 529, 567, 550, 565, 467, 426, 547, 405, 415, 479, 474, 589, 527, 559, 560, 518, 496, 576, 561, 506, 602, 533, 439, 580, 558, 600, 412, 517, 477, 549, 575, 491, 536, 402, 542, 603, 451, 475, 541, 543, 546, 551, 436, 445, 458, 507, 516, 526, 545, 555, 587, 434, 535, 494, 483 },
	["off-road"] = { 568, 573, 424, 495, 500, 579, 400, 444, 489, 554, 556, 508 },
	["bicycle"] = { 481, 509, 510 },
	["motorcycle"] = { 581, 521, 462, 463, 461, 522, 468, 586, 471 },
	["boat"] = { 473, 493, 484, 453, 452, 446, 454, 539 },
	["heli"] = { 469, 487 },
	["plane"] = { 593, 519, 513 }
}
carSellBuySpawns = {}
carSellSellCps = {}
carSellCarSpawnPoints = {}
carSellAvailableCars = {}
carSellColorNames = {
	"Черный", "Белый", "Голубой", "Красный", "Темно-серый", "Фиолетовый", "Оранжевый", "Голубой",
	"Серебрянный", "Серый", "Синий", "Серый", "Серо-зеленый", "Серый", "Серебрянный", "Серый", "Зеленый",
	"Красный", "Малиновый", "Серый", "Синий", "Бледно-красный", "Темно-красный", "Серый", "Темно-серый",
	"Темно-серый", "Серебрянный", "Серо-коричневый", "Синий", "Серый", "Коричневый", "Коричневый", "Голубой", "Серый",
	"Серый", "Серо-коричневый", "Темно-серый", "Темно-зеленый", "Бледно-зеленый", "Серый", "Темно-коричневый",
	"Кофейный", "Красный", "Темно-красный", "Темно-зеленый", "Темно-красный", "Кофейный", "Кофейный", "Кофейный",
	"Серебрянный", "Серый", "Темно-зеленый", "Серый", "Темно-синий", "Темно-синий", "Коричневый", "Серебрянный",
	"Кофейный", "Темно-красный", "Голубой", "Серый", "Кофейный", "Темно-красный", "Серебрянный", "Серебрянный",
	"Кофейный", "Темно-коричневый", "Голубой", "Кофейный", "Бледно-розовый", "Красный", "Голубой", "Серый",
	"Кофейный", "Темно-красный", "Темно-серый", "Серый", "Кофейный", "Красный", "Синий", "Темно-красный",
	"Кофейный", "Красный", "Темно-зеленый", "Темно-коричневый", "Темно-розовый", "Зеленый", "Синий", "Темно-красный",
	"Кофейный", "Серебрянный", "Темно-синий", "Серый", "Голубой", "Синий", "Синий", "Серебрянный", "Голубой",
	"Серый", "Кофейный", "Голубой", "Темно-синий", "Кофейный", "Синий", "Кофейный", "Серый", "Синий",
	"Кофейный", "Синий", "Серый", "Коричневый", "Серый", "Синий", "Темно-коричневый", "Бледно-зеленый",
	"Темно-красный", "Синий", "Темно-красный", "Серебрянный", "Серый", "Кофейный", "Темно-красный", "Серый",
	"Коричневый", "Темно-красный", "Синий", "Розовый"
}
carSellPrices = { -- Авто: 3000-3000000; Велосипеды: 750-2000; Мото: 2500-1000000
	[593]=25000,
	[519]=2000000,
	[460]=40000,
	[513]=35000,
	[469]=50000,
	[409]=1700000,
	[502]=2100000,
	[473]=3500,
    [482]=170000,
	[493]=400000,
	[484]=20000,
	[453]=12000,
	[452]=75000,
	[446]=1000000,
	[454]=30000,
	[404]=3000,
	[401]=6000,
	[400]=6000,
	[419]=5000,
	[410]=4000,
	[585]=5000,
	--[466]=700000,
	[411]=3000000,
	[429]=1000000,
	[534]=15000,
	[492]=5000,
	[566]=6000,
	[540]=8000,
	[421]=15000,
	[480]=1500000,
	[562]=1000000,
	[529]=7500,
	[567]=15000,
	[550]=8000,
	[579]=100000,
	[565]=30000,
	[467]=7000,
	[426]=6000,
	[547]=8000,
	[405]=25000,
	[489]=25000,
	[415]=1000000,
	[535]=20000,
	[479]=5500,
	[474]=10000,
	[589]=10000,
	[527]=8000,
	[559]=350000,
	[560]=500000,
	[518]=10000,
	[496]=15000,
	[576]=15000,
	[561]=15000,
	[506]=250000,
	[602]=100000,
	[533]=50000,
	[439]=12000,
	[580]=100000,
	[558]=400000,
	[600]=8000,
	[412]=15000,
	[517]=7000,
	[555]=100000,
	[477]=500000,
	[549]=3500,
	[575]=80000,
	[491]=8000,
	[536]=15000,
	[402]=1000000,
	[542]=4000,
	[603]=500000,
	[451]=2000000,
	[475]=500000,
	[541]=2500000,
	[481]=750,
	[509]=500,
	[510]=1000,
	[581]=50000,
	[521]=45000,
	[462]=2500,
	[463]=30000,
	[461]=50000,
	[522]=500000,
	[468]=40000,
	[586]=30000,
	[546]=25000,
	[543]=8000,
	[545]=120000,
	[551]=30000,
	[554]=40000,
	[568]=400000,
	[573]=1000000,
	[587]=900000,
	[424]=400000,
	[434]=800000,
	[436]=4000,
	[445]=10000,
	[458]=25000,
	[495]=600000,
	[500]=35000,
	[507]=15000,
	[516]=10000,
	[526]=70000,
	[444]=1000000,
	[604]=2000000,
	[494]=2800000,
	[539]=500000,
	[471]=120000,
	[483]=250000,
	[508]=1000000,
	[556]=3000000,
	[487]=350000
}

carTuneCps = {}
carTuneDimensions = {}
carTuneSlotNames = { "Капот", "Охлаждение", "Спойлер", "Боковые юбки", "Передний кенгурятник",
"Задний кенгурятник", "Фары", "Крыша", "Закись азота", "Гидравлика", "Музыка", "???", "Колеса", "Выхлоп",
"Передний бампер", "Задний бампер", "Другое" }
carTunePrices = { 250, 250, 250, 250, 150, 150, 80, 500, 200, 500, 1000, 150, 150, 200, 250, 250,
250, 500, 300, 300, 300, 300, 300, 250, 200, 1000, 500, 500, 300, 300, 500, 500, 80, 80, 300, 80, 500,
300, 80, 500, 500, 500, 500, 300, 300, 300, 300, 500, 500, 250, 250, 500, 500, 80, 80, 80, 500, 500,
250, 300, 250, 80, 500, 500, 300, 300, 300, 80, 80, 500, 500, 500, 500, 1000, 1000, 1000, 1000, 1000,
1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 100, 1500, 80, 300, 500, 80, 300, 500, 500, 500, 1000,
1000, 1000, 500, 1000, 500, 500, 80, 300, 300, 500, 500, 500, 1000, 1000, 100, 100, 300, 300, 1000,
1000, 1000, 500, 500, 500, 500, 500, 1000, 500, 1000, 300, 300, 80, 300, 80, 80, 300, 500, 500, 300,
300, 500, 250, 250, 1000, 1000, 200, 200, 200, 200, 250, 250, 1000, 1000, 1000, 1000, 1000, 1000, 1000,
1000, 1000, 1000, 250, 1000, 1000, 1000, 250, 250, 250, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000,
1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000,
1000, 1000, 1000, 1000 }
carTuneColorPrice = 100
carTuneDimensionId = 1

--colorNamesJSON = '[[{"x":93,"y":138,"z":168,"label":"Air Force blue"},{"x":240,"y":248,"z":255,"label":"Alice blue"},{"x":227,"y":38,"z":54,"label":"Alizarin crimson"},{"x":239,"y":222,"z":205,"label":"Almond"},{"x":229,"y":43,"z":80,"label":"Amaranth"},{"x":255,"y":191,"z":0,"label":"Amber"},{"x":255,"y":126,"z":0,"label":"Amber"},{"x":255,"y":3,"z":62,"label":"American rose"},{"x":153,"y":102,"z":204,"label":"Amethyst"},{"x":164,"y":198,"z":57,"label":"Android Green"},{"x":242,"y":243,"z":244,"label":"Anti-flash white"},{"x":205,"y":149,"z":117,"label":"Antique brass"},{"x":145,"y":92,"z":131,"label":"Antique fuchsia"},{"x":250,"y":235,"z":215,"label":"Antique white"},{"x":141,"y":182,"z":0,"label":"Apple green"},{"x":251,"y":206,"z":177,"label":"Apricot"},{"x":0,"y":255,"z":255,"label":"Aqua"},{"x":127,"y":255,"z":212,"label":"Aquamarine"},{"x":75,"y":83,"z":32,"label":"Army green"},{"x":233,"y":214,"z":107,"label":"Arylide yellow"},{"x":178,"y":190,"z":181,"label":"Ash grey"},{"x":135,"y":169,"z":107,"label":"Asparagus"},{"x":255,"y":153,"z":102,"label":"Atomic tangerine"},{"x":165,"y":42,"z":42,"label":"Auburn"},{"x":253,"y":238,"z":0,"label":"Aureolin"},{"x":110,"y":127,"z":128,"label":"AuroMetalSaurus"},{"x":255,"y":32,"z":82,"label":"Awesome"},{"x":0,"y":127,"z":255,"label":"Azure"},{"x":240,"y":255,"z":255,"label":"Azure mist/web"},{"x":137,"y":207,"z":240,"label":"Baby blue"},{"x":161,"y":202,"z":241,"label":"Baby blue eyes"},{"x":244,"y":194,"z":194,"label":"Baby pink"},{"x":33,"y":171,"z":205,"label":"Ball Blue"},{"x":250,"y":231,"z":181,"label":"Banana Mania"},{"x":255,"y":225,"z":53,"label":"Banana yellow"},{"x":132,"y":132,"z":130,"label":"Battleship grey"},{"x":152,"y":119,"z":123,"label":"Bazaar"},{"x":188,"y":212,"z":230,"label":"Beau blue"},{"x":159,"y":129,"z":112,"label":"Beaver"},{"x":245,"y":245,"z":220,"label":"Beige"},{"x":255,"y":228,"z":196,"label":"Bisque"},{"x":61,"y":43,"z":31,"label":"Bistre"},{"x":254,"y":111,"z":94,"label":"Bittersweet"},{"x":0,"y":0,"z":0,"label":"Black"},{"x":255,"y":235,"z":205,"label":"Blanched Almond"},{"x":49,"y":140,"z":231,"label":"Bleu de France"},{"x":172,"y":229,"z":238,"label":"Blizzard Blue"},{"x":250,"y":240,"z":190,"label":"Blond"},{"x":0,"y":0,"z":255,"label":"Blue"},{"x":0,"y":147,"z":175,"label":"Blue"},{"x":0,"y":135,"z":189,"label":"Blue"},{"x":51,"y":51,"z":153,"label":"Blue"},{"x":2,"y":71,"z":254,"label":"Blue"},{"x":162,"y":162,"z":208,"label":"Blue Bell"},{"x":102,"y":153,"z":204,"label":"Blue Gray"},{"x":13,"y":152,"z":186,"label":"Blue-green"},{"x":138,"y":43,"z":226,"label":"Blue-violet"},{"x":222,"y":93,"z":131,"label":"Blush"},{"x":121,"y":68,"z":59,"label":"Bole"},{"x":0,"y":149,"z":182,"label":"Bondi blue"},{"x":204,"y":0,"z":0,"label":"Boston University Red"},{"x":135,"y":50,"z":96,"label":"Boysenberry"},{"x":0,"y":112,"z":255,"label":"Brandeis blue"},{"x":181,"y":166,"z":66,"label":"Brass"},{"x":203,"y":65,"z":84,"label":"Brick red"},{"x":29,"y":172,"z":214,"label":"Bright cerulean"},{"x":102,"y":255,"z":0,"label":"Bright green"},{"x":191,"y":148,"z":228,"label":"Bright lavender"},{"x":195,"y":33,"z":72,"label":"Bright maroon"},{"x":255,"y":0,"z":127,"label":"Bright pink"},{"x":8,"y":232,"z":222,"label":"Bright turquoise"},{"x":209,"y":159,"z":232,"label":"Bright ube"},{"x":244,"y":187,"z":255,"label":"Brilliant lavender"},{"x":255,"y":85,"z":163,"label":"Brilliant rose"},{"x":251,"y":96,"z":127,"label":"Brink pink"},{"x":0,"y":66,"z":37,"label":"British racing green"},{"x":205,"y":127,"z":50,"label":"Bronze"},{"x":150,"y":75,"z":0,"label":"Brown"},{"x":165,"y":42,"z":42,"label":"Brown"},{"x":255,"y":193,"z":204,"label":"Bubble gum"},{"x":231,"y":254,"z":255,"label":"Bubbles"},{"x":240,"y":220,"z":130,"label":"Buff"},{"x":72,"y":6,"z":7,"label":"Bulgarian rose"},{"x":128,"y":0,"z":32,"label":"Burgundy"},{"x":222,"y":184,"z":135,"label":"Burlywood"},{"x":204,"y":85,"z":0,"label":"Burnt orange"},{"x":233,"y":116,"z":81,"label":"Burnt sienna"},{"x":138,"y":51,"z":36,"label":"Burnt umber"},{"x":189,"y":51,"z":164,"label":"Byzantine"},{"x":112,"y":41,"z":99,"label":"Byzantium"},{"x":83,"y":104,"z":114,"label":"Cadet"},{"x":95,"y":158,"z":160,"label":"Cadet blue"},{"x":145,"y":163,"z":176,"label":"Cadet grey"},{"x":0,"y":107,"z":60,"label":"Cadmium green"},{"x":237,"y":135,"z":45,"label":"Cadmium orange"},{"x":227,"y":0,"z":34,"label":"Cadmium red"},{"x":255,"y":246,"z":0,"label":"Cadmium yellow"},{"x":166,"y":123,"z":91,"label":"CafÃ© au lait"},{"x":75,"y":54,"z":33,"label":"CafÃ© noir"},{"x":30,"y":77,"z":43,"label":"Cal Poly Pomona green"},{"x":163,"y":193,"z":173,"label":"Cambridge Blue"},{"x":193,"y":154,"z":107,"label":"Camel"},{"x":120,"y":134,"z":107,"label":"Camouflage green"},{"x":255,"y":239,"z":0,"label":"Canary yellow"},{"x":255,"y":8,"z":0,"label":"Candy apple red"},{"x":228,"y":113,"z":122,"label":"Candy pink"},{"x":0,"y":191,"z":255,"label":"Capri"},{"x":89,"y":39,"z":32,"label":"Caput mortuum"},{"x":196,"y":30,"z":58,"label":"Cardinal"},{"x":0,"y":204,"z":153,"label":"Caribbean green"},{"x":255,"y":0,"z":64,"label":"Carmine"},{"x":235,"y":76,"z":66,"label":"Carmine pink"},{"x":255,"y":0,"z":56,"label":"Carmine red"},{"x":255,"y":166,"z":201,"label":"Carnation pink"},{"x":179,"y":27,"z":27,"label":"Carnelian"},{"x":153,"y":186,"z":221,"label":"Carolina blue"},{"x":237,"y":145,"z":33,"label":"Carrot orange"},{"x":172,"y":225,"z":175,"label":"Celadon"},{"x":178,"y":255,"z":255,"label":"Celeste"},{"x":73,"y":151,"z":208,"label":"Celestial blue"},{"x":222,"y":49,"z":99,"label":"Cerise"},{"x":236,"y":59,"z":131,"label":"Cerise pink"},{"x":0,"y":123,"z":167,"label":"Cerulean"},{"x":42,"y":82,"z":190,"label":"Cerulean blue"},{"x":0,"y":122,"z":165,"label":"CG Blue"},{"x":224,"y":60,"z":49,"label":"CG Red"},{"x":160,"y":120,"z":90,"label":"Chamoisee"},{"x":250,"y":214,"z":165,"label":"Champagne"},{"x":54,"y":69,"z":79,"label":"Charcoal"},{"x":223,"y":255,"z":0,"label":"Chartreuse"},{"x":127,"y":255,"z":0,"label":"Chartreuse"},{"x":255,"y":183,"z":197,"label":"Cherry blossom pink"},{"x":205,"y":92,"z":92,"label":"Chestnut"},{"x":123,"y":63,"z":0,"label":"Chocolate"},{"x":210,"y":105,"z":30,"label":"Chocolate"},{"x":255,"y":167,"z":0,"label":"Chrome yellow"},{"x":152,"y":129,"z":123,"label":"Cinereous"},{"x":227,"y":66,"z":52,"label":"Cinnabar"},{"x":210,"y":105,"z":30,"label":"Cinnamon"},{"x":228,"y":208,"z":10,"label":"Citrine"},{"x":251,"y":204,"z":231,"label":"Classic rose"},{"x":0,"y":71,"z":171,"label":"Cobalt"},{"x":210,"y":105,"z":30,"label":"Cocoa brown"},{"x":111,"y":78,"z":55,"label":"Coffee"},{"x":155,"y":221,"z":255,"label":"Columbia blue"},{"x":0,"y":46,"z":99,"label":"Cool black"},{"x":140,"y":146,"z":172,"label":"Cool grey"},{"x":184,"y":115,"z":51,"label":"Copper"},{"x":153,"y":102,"z":102,"label":"Copper rose"},{"x":255,"y":56,"z":0,"label":"Coquelicot"},{"x":255,"y":127,"z":80,"label":"Coral"},{"x":248,"y":131,"z":121,"label":"Coral pink"},{"x":255,"y":64,"z":64,"label":"Coral red"},{"x":137,"y":63,"z":69,"label":"Cordovan"},{"x":251,"y":236,"z":93,"label":"Corn"},{"x":179,"y":27,"z":27,"label":"Cornell Red"},{"x":100,"y":149,"z":237,"label":"Cornflower blue"},{"x":255,"y":248,"z":220,"label":"Cornsilk"},{"x":255,"y":248,"z":231,"label":"Cosmic latte"},{"x":255,"y":188,"z":217,"label":"Cotton candy"},{"x":255,"y":253,"z":208,"label":"Cream"},{"x":220,"y":20,"z":60,"label":"Crimson"},{"x":190,"y":0,"z":50,"label":"Crimson glory"},{"x":0,"y":255,"z":255,"label":"Cyan"},{"x":0,"y":183,"z":235,"label":"Cyan"},{"x":255,"y":255,"z":49,"label":"Daffodil"},{"x":240,"y":225,"z":48,"label":"Dandelion"},{"x":0,"y":0,"z":139,"label":"Dark blue"},{"x":101,"y":67,"z":33,"label":"Dark brown"},{"x":93,"y":57,"z":84,"label":"Dark byzantium"},{"x":164,"y":0,"z":0,"label":"Dark candy apple red"},{"x":8,"y":69,"z":126,"label":"Dark cerulean"},{"x":152,"y":105,"z":96,"label":"Dark chestnut"},{"x":205,"y":91,"z":69,"label":"Dark coral"},{"x":0,"y":139,"z":139,"label":"Dark cyan"},{"x":83,"y":104,"z":120,"label":"Dark electric blue"},{"x":184,"y":134,"z":11,"label":"Dark goldenrod"},{"x":169,"y":169,"z":169,"label":"Dark gray"},{"x":1,"y":50,"z":32,"label":"Dark green"},{"x":26,"y":36,"z":33,"label":"Dark jungle green"},{"x":189,"y":183,"z":107,"label":"Dark khaki"},{"x":72,"y":60,"z":50,"label":"Dark lava"},{"x":115,"y":79,"z":150,"label":"Dark lavender"},{"x":139,"y":0,"z":139,"label":"Dark magenta"},{"x":0,"y":51,"z":102,"label":"Dark midnight blue"},{"x":85,"y":107,"z":47,"label":"Dark olive green"},{"x":255,"y":140,"z":0,"label":"Dark orange"},{"x":153,"y":50,"z":204,"label":"Dark orchid"},{"x":119,"y":158,"z":203,"label":"Dark pastel blue"},{"x":3,"y":192,"z":60,"label":"Dark pastel green"},{"x":150,"y":111,"z":214,"label":"Dark pastel purple"},{"x":194,"y":59,"z":34,"label":"Dark pastel red"},{"x":231,"y":84,"z":128,"label":"Dark pink"},{"x":0,"y":51,"z":153,"label":"Dark powder blue"},{"x":135,"y":38,"z":87,"label":"Dark raspberry"},{"x":139,"y":0,"z":0,"label":"Dark red"},{"x":233,"y":150,"z":122,"label":"Dark salmon"},{"x":86,"y":3,"z":25,"label":"Dark scarlet"},{"x":143,"y":188,"z":143,"label":"Dark sea green"},{"x":60,"y":20,"z":20,"label":"Dark sienna"},{"x":72,"y":61,"z":139,"label":"Dark slate blue"},{"x":47,"y":79,"z":79,"label":"Dark slate gray"},{"x":23,"y":114,"z":69,"label":"Dark spring green"},{"x":145,"y":129,"z":81,"label":"Dark tan"},{"x":255,"y":168,"z":18,"label":"Dark tangerine"},{"x":72,"y":60,"z":50,"label":"Dark taupe"},{"x":204,"y":78,"z":92,"label":"Dark terra cotta"},{"x":0,"y":206,"z":209,"label":"Dark turquoise"},{"x":148,"y":0,"z":211,"label":"Dark violet"},{"x":0,"y":105,"z":62,"label":"Dartmouth green"},{"x":85,"y":85,"z":85,"label":"Davys grey"},{"x":215,"y":10,"z":83,"label":"Debian red"},{"x":169,"y":32,"z":62,"label":"Deep carmine"},{"x":239,"y":48,"z":56,"label":"Deep carmine pink"},{"x":233,"y":105,"z":44,"label":"Deep carrot orange"},{"x":218,"y":50,"z":135,"label":"Deep cerise"},{"x":250,"y":214,"z":165,"label":"Deep champagne"},{"x":185,"y":78,"z":72,"label":"Deep chestnut"},{"x":112,"y":66,"z":65,"label":"Deep coffee"},{"x":193,"y":84,"z":193,"label":"Deep fuchsia"},{"x":0,"y":75,"z":73,"label":"Deep jungle green"},{"x":153,"y":85,"z":187,"label":"Deep lilac"},{"x":204,"y":0,"z":204,"label":"Deep magenta"},{"x":255,"y":203,"z":164,"label":"Deep peach"},{"x":255,"y":20,"z":147,"label":"Deep pink"},{"x":255,"y":153,"z":51,"label":"Deep saffron"},{"x":0,"y":191,"z":255,"label":"Deep sky blue"},{"x":21,"y":96,"z":189,"label":"Denim"},{"x":193,"y":154,"z":107,"label":"Desert"},{"x":237,"y":201,"z":175,"label":"Desert sand"},{"x":105,"y":105,"z":105,"label":"Dim gray"},{"x":30,"y":144,"z":255,"label":"Dodger blue"},{"x":215,"y":24,"z":104,"label":"Dogwood rose"},{"x":133,"y":187,"z":101,"label":"Dollar bill"},{"x":150,"y":113,"z":23,"label":"Drab"},{"x":0,"y":0,"z":156,"label":"Duke blue"},{"x":225,"y":169,"z":95,"label":"Earth yellow"},{"x":194,"y":178,"z":128,"label":"Ecru"},{"x":97,"y":64,"z":81,"label":"Eggplant"},{"x":240,"y":234,"z":214,"label":"Eggshell"},{"x":16,"y":52,"z":166,"label":"Egyptian blue"},{"x":125,"y":249,"z":255,"label":"Electric blue"},{"x":255,"y":0,"z":63,"label":"Electric crimson"},{"x":0,"y":255,"z":255,"label":"Electric cyan"},{"x":0,"y":255,"z":0,"label":"Electric green"},{"x":111,"y":0,"z":255,"label":"Electric indigo"},{"x":244,"y":187,"z":255,"label":"Electric lavender"},{"x":204,"y":255,"z":0,"label":"Electric lime"},{"x":191,"y":0,"z":255,"label":"Electric purple"},{"x":63,"y":0,"z":255,"label":"Electric ultramarine"},{"x":143,"y":0,"z":255,"label":"Electric violet"},{"x":255,"y":255,"z":0,"label":"Electric yellow"},{"x":80,"y":200,"z":120,"label":"Emerald"},{"x":150,"y":200,"z":162,"label":"Eton blue"},{"x":193,"y":154,"z":107,"label":"Fallow"},{"x":128,"y":24,"z":24,"label":"Falu red"},{"x":181,"y":51,"z":137,"label":"Fandango"},{"x":244,"y":0,"z":161,"label":"Fashion fuchsia"},{"x":229,"y":170,"z":112,"label":"Fawn"},{"x":77,"y":93,"z":83,"label":"Feldgrau"},{"x":79,"y":121,"z":66,"label":"Fern green"},{"x":255,"y":40,"z":0,"label":"Ferrari Red"},{"x":108,"y":84,"z":30,"label":"Field drab"},{"x":178,"y":34,"z":34,"label":"Firebrick"},{"x":206,"y":32,"z":41,"label":"Fire engine red"},{"x":226,"y":88,"z":34,"label":"Flame"},{"x":252,"y":142,"z":172,"label":"Flamingo pink"},{"x":247,"y":233,"z":142,"label":"Flavescent"},{"x":238,"y":220,"z":130,"label":"Flax"},{"x":255,"y":250,"z":240,"label":"Floral white"},{"x":255,"y":191,"z":0,"label":"Fluorescent orange"},{"x":255,"y":20,"z":147,"label":"Fluorescent pink"},{"x":204,"y":255,"z":0,"label":"Fluorescent yellow"},{"x":255,"y":0,"z":79,"label":"Folly"},{"x":1,"y":68,"z":33,"label":"Forest green"},{"x":34,"y":139,"z":34,"label":"Forest green"},{"x":166,"y":123,"z":91,"label":"French beige"},{"x":0,"y":114,"z":187,"label":"French blue"},{"x":134,"y":96,"z":142,"label":"French lilac"},{"x":246,"y":74,"z":138,"label":"French rose"},{"x":255,"y":0,"z":255,"label":"Fuchsia"},{"x":255,"y":119,"z":255,"label":"Fuchsia pink"},{"x":228,"y":132,"z":0,"label":"Fulvous"},{"x":204,"y":102,"z":102,"label":"Fuzzy Wuzzy"},{"x":220,"y":220,"z":220,"label":"Gainsboro"},{"x":228,"y":155,"z":15,"label":"Gamboge"},{"x":248,"y":248,"z":255,"label":"Ghost white"},{"x":176,"y":101,"z":0,"label":"Ginger"},{"x":96,"y":130,"z":182,"label":"Glaucous"},{"x":230,"y":232,"z":250,"label":"Glitter"},{"x":212,"y":175,"z":55,"label":"Gold"},{"x":255,"y":215,"z":0,"label":"Gold"},{"x":153,"y":101,"z":21,"label":"Golden brown"},{"x":252,"y":194,"z":0,"label":"Golden poppy"},{"x":255,"y":223,"z":0,"label":"Golden yellow"},{"x":218,"y":165,"z":32,"label":"Goldenrod"},{"x":168,"y":228,"z":160,"label":"Granny Smith Apple"},{"x":128,"y":128,"z":128,"label":"Gray"},{"x":127,"y":127,"z":127,"label":"Gray"},{"x":190,"y":190,"z":190,"label":"Gray"},{"x":70,"y":89,"z":69,"label":"Gray-asparagus"},{"x":0,"y":255,"z":0,"label":"Green"},{"x":0,"y":128,"z":0,"label":"Green"},{"x":0,"y":168,"z":119,"label":"Green"},{"x":0,"y":159,"z":107,"label":"Green"},{"x":0,"y":165,"z":80,"label":"Green"},{"x":102,"y":176,"z":50,"label":"Green"},{"x":173,"y":255,"z":47,"label":"Green-yellow"},{"x":169,"y":154,"z":134,"label":"Grullo"},{"x":0,"y":255,"z":127,"label":"Guppie green"},{"x":102,"y":56,"z":84,"label":"Halaya ube"},{"x":68,"y":108,"z":207,"label":"Han blue"},{"x":82,"y":24,"z":250,"label":"Han purple"},{"x":233,"y":214,"z":107,"label":"Hansa yellow"},{"x":63,"y":255,"z":0,"label":"Harlequin"},{"x":201,"y":0,"z":22,"label":"Harvard crimson"},{"x":218,"y":145,"z":0,"label":"Harvest Gold"},{"x":128,"y":128,"z":0,"label":"Heart Gold"},{"x":223,"y":115,"z":255,"label":"Heliotrope"},{"x":244,"y":0,"z":161,"label":"Hollywood cerise"},{"x":240,"y":255,"z":240,"label":"Honeydew"},{"x":0,"y":112,"z":0,"label":"Hookers green"},{"x":255,"y":29,"z":206,"label":"Hot magenta"},{"x":255,"y":105,"z":180,"label":"Hot pink"},{"x":53,"y":94,"z":59,"label":"Hunter green"},{"x":252,"y":247,"z":94,"label":"Icterine"},{"x":178,"y":236,"z":93,"label":"Inchworm"},{"x":19,"y":136,"z":8,"label":"India green"},{"x":205,"y":92,"z":92,"label":"Indian red"},{"x":227,"y":168,"z":87,"label":"Indian yellow"},{"x":0,"y":65,"z":106,"label":"Indigo"},{"x":75,"y":0,"z":130,"label":"Indigo"},{"x":0,"y":47,"z":167,"label":"International Klein Blue"},{"x":255,"y":79,"z":0,"label":"International orange"},{"x":90,"y":79,"z":207,"label":"Iris"},{"x":244,"y":240,"z":236,"label":"Isabelline"},{"x":0,"y":144,"z":0,"label":"Islamic green"},{"x":255,"y":255,"z":240,"label":"Ivory"},{"x":0,"y":168,"z":107,"label":"Jade"},{"x":248,"y":222,"z":126,"label":"Jasmine"},{"x":215,"y":59,"z":62,"label":"Jasper"},{"x":165,"y":11,"z":94,"label":"Jazzberry jam"},{"x":250,"y":218,"z":94,"label":"Jonquil"},{"x":189,"y":218,"z":87,"label":"June bud"},{"x":41,"y":171,"z":135,"label":"Jungle green"},{"x":76,"y":187,"z":23,"label":"Kelly green"},{"x":195,"y":176,"z":145,"label":"Khaki"},{"x":240,"y":230,"z":140,"label":"Khaki"},{"x":232,"y":0,"z":13,"label":"KU Crimson"},{"x":8,"y":120,"z":48,"label":"La Salle Green"},{"x":214,"y":202,"z":221,"label":"Languid lavender"},{"x":38,"y":97,"z":156,"label":"Lapis lazuli"},{"x":254,"y":254,"z":34,"label":"Laser Lemon"},{"x":169,"y":186,"z":157,"label":"Laurel green"},{"x":207,"y":16,"z":32,"label":"Lava"},{"x":181,"y":126,"z":220,"label":"Lavender"},{"x":230,"y":230,"z":250,"label":"Lavender"},{"x":204,"y":204,"z":255,"label":"Lavender blue"},{"x":255,"y":240,"z":245,"label":"Lavender blush"},{"x":196,"y":195,"z":208,"label":"Lavender gray"},{"x":148,"y":87,"z":235,"label":"Lavender indigo"},{"x":238,"y":130,"z":238,"label":"Lavender magenta"},{"x":230,"y":230,"z":250,"label":"Lavender mist"},{"x":251,"y":174,"z":210,"label":"Lavender pink"},{"x":150,"y":123,"z":182,"label":"Lavender purple"},{"x":251,"y":160,"z":227,"label":"Lavender rose"},{"x":124,"y":252,"z":0,"label":"Lawn green"},{"x":255,"y":247,"z":0,"label":"Lemon"},{"x":255,"y":250,"z":205,"label":"Lemon chiffon"},{"x":253,"y":213,"z":177,"label":"Light apricot"},{"x":173,"y":216,"z":230,"label":"Light blue"},{"x":181,"y":101,"z":29,"label":"Light brown"},{"x":230,"y":103,"z":113,"label":"Light carmine pink"},{"x":240,"y":128,"z":128,"label":"Light coral"},{"x":147,"y":204,"z":234,"label":"Light cornflower blue"},{"x":245,"y":105,"z":145,"label":"Light Crimson"},{"x":224,"y":255,"z":255,"label":"Light cyan"},{"x":249,"y":132,"z":239,"label":"Light fuchsia pink"},{"x":250,"y":250,"z":210,"label":"Light goldenrod yellow"},{"x":211,"y":211,"z":211,"label":"Light gray"},{"x":144,"y":238,"z":144,"label":"Light green"},{"x":240,"y":230,"z":140,"label":"Light khaki"},{"x":177,"y":156,"z":217,"label":"Light pastel purple"},{"x":255,"y":182,"z":193,"label":"Light pink"},{"x":255,"y":160,"z":122,"label":"Light salmon"},{"x":255,"y":153,"z":153,"label":"Light salmon pink"},{"x":32,"y":178,"z":170,"label":"Light sea green"},{"x":135,"y":206,"z":250,"label":"Light sky blue"},{"x":119,"y":136,"z":153,"label":"Light slate gray"},{"x":179,"y":139,"z":109,"label":"Light taupe"},{"x":230,"y":143,"z":172,"label":"Light Thulian pink"},{"x":255,"y":255,"z":237,"label":"Light yellow"},{"x":200,"y":162,"z":200,"label":"Lilac"},{"x":191,"y":255,"z":0,"label":"Lime"},{"x":0,"y":255,"z":0,"label":"Lime"},{"x":50,"y":205,"z":50,"label":"Lime green"},{"x":25,"y":89,"z":5,"label":"Lincoln green"},{"x":250,"y":240,"z":230,"label":"Linen"},{"x":193,"y":154,"z":107,"label":"Lion"},{"x":83,"y":75,"z":79,"label":"Liver"},{"x":230,"y":32,"z":32,"label":"Lust"},{"x":255,"y":0,"z":255,"label":"Magenta"},{"x":202,"y":31,"z":123,"label":"Magenta"},{"x":255,"y":0,"z":144,"label":"Magenta"},{"x":170,"y":240,"z":209,"label":"Magic mint"},{"x":248,"y":244,"z":255,"label":"Magnolia"},{"x":192,"y":64,"z":0,"label":"Mahogany"},{"x":251,"y":236,"z":93,"label":"Maize"},{"x":96,"y":80,"z":220,"label":"Majorelle Blue"},{"x":11,"y":218,"z":81,"label":"Malachite"},{"x":151,"y":154,"z":170,"label":"Manatee"},{"x":255,"y":130,"z":67,"label":"Mango Tango"},{"x":116,"y":195,"z":101,"label":"Mantis"},{"x":128,"y":0,"z":0,"label":"Maroon"},{"x":176,"y":48,"z":96,"label":"Maroon"},{"x":224,"y":176,"z":255,"label":"Mauve"},{"x":145,"y":95,"z":109,"label":"Mauve taupe"},{"x":239,"y":152,"z":170,"label":"Mauvelous"},{"x":115,"y":194,"z":251,"label":"Maya blue"},{"x":229,"y":183,"z":59,"label":"Meat brown"},{"x":102,"y":221,"z":170,"label":"Medium aquamarine"},{"x":0,"y":0,"z":205,"label":"Medium blue"},{"x":226,"y":6,"z":44,"label":"Medium candy apple red"},{"x":175,"y":64,"z":53,"label":"Medium carmine"},{"x":243,"y":229,"z":171,"label":"Medium champagne"},{"x":3,"y":80,"z":150,"label":"Medium electric blue"},{"x":28,"y":53,"z":45,"label":"Medium jungle green"},{"x":221,"y":160,"z":221,"label":"Medium lavender magenta"},{"x":186,"y":85,"z":211,"label":"Medium orchid"},{"x":0,"y":103,"z":165,"label":"Medium Persian blue"},{"x":147,"y":112,"z":219,"label":"Medium purple"},{"x":187,"y":51,"z":133,"label":"Medium red-violet"},{"x":60,"y":179,"z":113,"label":"Medium sea green"},{"x":123,"y":104,"z":238,"label":"Medium slate blue"},{"x":201,"y":220,"z":135,"label":"Medium spring bud"},{"x":0,"y":250,"z":154,"label":"Medium spring green"},{"x":103,"y":76,"z":71,"label":"Medium taupe"},{"x":0,"y":84,"z":180,"label":"Medium teal blue"},{"x":72,"y":209,"z":204,"label":"Medium turquoise"},{"x":199,"y":21,"z":133,"label":"Medium violet-red"},{"x":253,"y":188,"z":180,"label":"Melon"},{"x":25,"y":25,"z":112,"label":"Midnight blue"},{"x":0,"y":73,"z":83,"label":"Midnight green"},{"x":255,"y":196,"z":12,"label":"Mikado yellow"},{"x":62,"y":180,"z":137,"label":"Mint"},{"x":245,"y":255,"z":250,"label":"Mint cream"},{"x":152,"y":255,"z":152,"label":"Mint green"},{"x":255,"y":228,"z":225,"label":"Misty rose"},{"x":250,"y":235,"z":215,"label":"Moccasin"},{"x":150,"y":113,"z":23,"label":"Mode beige"},{"x":115,"y":169,"z":194,"label":"Moonstone blue"},{"x":174,"y":12,"z":0,"label":"Mordant red 19"},{"x":173,"y":223,"z":173,"label":"Moss green"},{"x":48,"y":186,"z":143,"label":"Mountain Meadow"},{"x":153,"y":122,"z":141,"label":"Mountbatten pink"},{"x":197,"y":75,"z":140,"label":"Mulberry"},{"x":242,"y":243,"z":244,"label":"Munsell"},{"x":255,"y":219,"z":88,"label":"Mustard"},{"x":33,"y":66,"z":30,"label":"Myrtle"},{"x":24,"y":69,"z":59,"label":"MSU Green"},{"x":246,"y":173,"z":198,"label":"Nadeshiko pink"},{"x":42,"y":128,"z":0,"label":"Napier green"},{"x":250,"y":218,"z":94,"label":"Naples yellow"},{"x":255,"y":222,"z":173,"label":"Navajo white"},{"x":0,"y":0,"z":128,"label":"Navy blue"},{"x":255,"y":163,"z":67,"label":"Neon Carrot"},{"x":254,"y":89,"z":194,"label":"Neon fuchsia"},{"x":57,"y":255,"z":20,"label":"Neon green"},{"x":164,"y":221,"z":237,"label":"Non-photo blue"},{"x":5,"y":144,"z":51,"label":"North Texas Green"},{"x":0,"y":119,"z":190,"label":"Ocean Boat Blue"},{"x":204,"y":119,"z":34,"label":"Ochre"},{"x":0,"y":128,"z":0,"label":"Office green"},{"x":207,"y":181,"z":59,"label":"Old gold"},{"x":253,"y":245,"z":230,"label":"Old lace"},{"x":121,"y":104,"z":120,"label":"Old lavender"},{"x":103,"y":49,"z":71,"label":"Old mauve"},{"x":192,"y":128,"z":129,"label":"Old rose"},{"x":128,"y":128,"z":0,"label":"Olive"},{"x":107,"y":142,"z":35,"label":"Olive Drab"},{"x":60,"y":52,"z":31,"label":"Olive Drab #7"},{"x":154,"y":185,"z":115,"label":"Olivine"},{"x":15,"y":15,"z":15,"label":"Onyx"},{"x":183,"y":132,"z":167,"label":"Opera mauve"},{"x":255,"y":127,"z":0,"label":"Orange"},{"x":251,"y":153,"z":2,"label":"Orange"},{"x":255,"y":165,"z":0,"label":"Orange"},{"x":255,"y":159,"z":0,"label":"Orange peel"},{"x":255,"y":69,"z":0,"label":"Orange-red"},{"x":218,"y":112,"z":214,"label":"Orchid"},{"x":101,"y":67,"z":33,"label":"Otter brown"},{"x":65,"y":74,"z":76,"label":"Outer Space"},{"x":255,"y":110,"z":74,"label":"Outrageous Orange"},{"x":0,"y":33,"z":71,"label":"Oxford Blue"},{"x":153,"y":0,"z":0,"label":"OU Crimson Red"},{"x":0,"y":102,"z":0,"label":"Pakistan green"},{"x":39,"y":59,"z":226,"label":"Palatinate blue"},{"x":104,"y":40,"z":96,"label":"Palatinate purple"},{"x":188,"y":212,"z":230,"label":"Pale aqua"},{"x":175,"y":238,"z":238,"label":"Pale blue"},{"x":152,"y":118,"z":84,"label":"Pale brown"},{"x":175,"y":64,"z":53,"label":"Pale carmine"},{"x":155,"y":196,"z":226,"label":"Pale cerulean"},{"x":221,"y":173,"z":175,"label":"Pale chestnut"},{"x":218,"y":138,"z":103,"label":"Pale copper"},{"x":171,"y":205,"z":239,"label":"Pale cornflower blue"},{"x":230,"y":190,"z":138,"label":"Pale gold"},{"x":238,"y":232,"z":170,"label":"Pale goldenrod"},{"x":152,"y":251,"z":152,"label":"Pale green"},{"x":220,"y":208,"z":255,"label":"Pale lavender"},{"x":249,"y":132,"z":229,"label":"Pale magenta"},{"x":250,"y":218,"z":221,"label":"Pale pink"},{"x":221,"y":160,"z":221,"label":"Pale plum"},{"x":219,"y":112,"z":147,"label":"Pale red-violet"},{"x":150,"y":222,"z":209,"label":"Pale robin egg blue"},{"x":201,"y":192,"z":187,"label":"Pale silver"},{"x":236,"y":235,"z":189,"label":"Pale spring bud"},{"x":188,"y":152,"z":126,"label":"Pale taupe"},{"x":219,"y":112,"z":147,"label":"Pale violet-red"},{"x":120,"y":24,"z":74,"label":"Pansy purple"},{"x":255,"y":239,"z":213,"label":"Papaya whip"},{"x":80,"y":200,"z":120,"label":"Paris Green"},{"x":174,"y":198,"z":207,"label":"Pastel blue"},{"x":131,"y":105,"z":83,"label":"Pastel brown"},{"x":207,"y":207,"z":196,"label":"Pastel gray"},{"x":119,"y":221,"z":119,"label":"Pastel green"},{"x":244,"y":154,"z":194,"label":"Pastel magenta"},{"x":255,"y":179,"z":71,"label":"Pastel orange"},{"x":255,"y":209,"z":220,"label":"Pastel pink"},{"x":179,"y":158,"z":181,"label":"Pastel purple"},{"x":255,"y":105,"z":97,"label":"Pastel red"},{"x":203,"y":153,"z":201,"label":"Pastel violet"},{"x":253,"y":253,"z":150,"label":"Pastel yellow"},{"x":128,"y":0,"z":128,"label":"Patriarch"},{"x":64,"y":64,"z":79,"label":"Paynes grey"},{"x":255,"y":229,"z":180,"label":"Peach"},{"x":255,"y":204,"z":153,"label":"Peach-orange"},{"x":255,"y":218,"z":185,"label":"Peach puff"},{"x":250,"y":223,"z":173,"label":"Peach-yellow"},{"x":209,"y":226,"z":49,"label":"Pear"},{"x":234,"y":224,"z":200,"label":"Pearl"},{"x":136,"y":216,"z":192,"label":"Pearl Aqua"},{"x":230,"y":226,"z":0,"label":"Peridot"},{"x":204,"y":204,"z":255,"label":"Periwinkle"},{"x":28,"y":57,"z":187,"label":"Persian blue"},{"x":0,"y":166,"z":147,"label":"Persian green"},{"x":50,"y":18,"z":122,"label":"Persian indigo"},{"x":217,"y":144,"z":88,"label":"Persian orange"},{"x":247,"y":127,"z":190,"label":"Persian pink"},{"x":112,"y":28,"z":28,"label":"Persian plum"},{"x":204,"y":51,"z":51,"label":"Persian red"},{"x":254,"y":40,"z":162,"label":"Persian rose"},{"x":223,"y":0,"z":255,"label":"Phlox"},{"x":0,"y":15,"z":137,"label":"Phthalo blue"},{"x":18,"y":53,"z":36,"label":"Phthalo green"},{"x":253,"y":221,"z":230,"label":"Piggy pink"},{"x":1,"y":121,"z":111,"label":"Pine green"},{"x":255,"y":192,"z":203,"label":"Pink"},{"x":255,"y":153,"z":102,"label":"Pink-orange"},{"x":231,"y":172,"z":207,"label":"Pink pearl"},{"x":247,"y":143,"z":167,"label":"Pink Sherbet"},{"x":147,"y":197,"z":114,"label":"Pistachio"},{"x":229,"y":228,"z":226,"label":"Platinum"},{"x":142,"y":69,"z":133,"label":"Plum"},{"x":221,"y":160,"z":221,"label":"Plum"},{"x":255,"y":90,"z":54,"label":"Portland Orange"},{"x":176,"y":224,"z":230,"label":"Powder blue"},{"x":255,"y":143,"z":0,"label":"Princeton orange"},{"x":112,"y":28,"z":28,"label":"Prune"},{"x":0,"y":49,"z":83,"label":"Prussian blue"},{"x":223,"y":0,"z":255,"label":"Psychedelic purple"},{"x":204,"y":136,"z":153,"label":"Puce"},{"x":255,"y":117,"z":24,"label":"Pumpkin"},{"x":128,"y":0,"z":128,"label":"Purple"},{"x":159,"y":0,"z":197,"label":"Purple"},{"x":160,"y":32,"z":240,"label":"Purple"},{"x":105,"y":53,"z":156,"label":"Purple Heart"},{"x":150,"y":120,"z":182,"label":"Purple mountain majesty"},{"x":254,"y":78,"z":218,"label":"Purple pizzazz"},{"x":80,"y":64,"z":77,"label":"Purple taupe"},{"x":81,"y":72,"z":79,"label":"Quartz"},{"x":255,"y":53,"z":94,"label":"Radical Red"},{"x":227,"y":11,"z":93,"label":"Raspberry"},{"x":145,"y":95,"z":109,"label":"Raspberry glace"},{"x":226,"y":80,"z":152,"label":"Raspberry pink"},{"x":179,"y":68,"z":108,"label":"Raspberry rose"},{"x":130,"y":102,"z":68,"label":"Raw umber"},{"x":255,"y":51,"z":204,"label":"Razzle dazzle rose"},{"x":227,"y":37,"z":107,"label":"Razzmatazz"},{"x":255,"y":0,"z":0,"label":"Red"},{"x":242,"y":0,"z":60,"label":"Red"},{"x":196,"y":2,"z":51,"label":"Red"},{"x":237,"y":28,"z":36,"label":"Red"},{"x":254,"y":39,"z":18,"label":"Red"},{"x":165,"y":42,"z":42,"label":"Red-brown"},{"x":199,"y":21,"z":133,"label":"Red-violet"},{"x":171,"y":78,"z":82,"label":"Redwood"},{"x":0,"y":64,"z":64,"label":"Rich black"},{"x":241,"y":167,"z":254,"label":"Rich brilliant lavender"},{"x":215,"y":0,"z":64,"label":"Rich carmine"},{"x":8,"y":146,"z":208,"label":"Rich electric blue"},{"x":167,"y":107,"z":207,"label":"Rich lavender"},{"x":182,"y":102,"z":210,"label":"Rich lilac"},{"x":176,"y":48,"z":96,"label":"Rich maroon"},{"x":65,"y":72,"z":51,"label":"Rifle green"},{"x":0,"y":204,"z":204,"label":"Robin egg blue"},{"x":255,"y":0,"z":127,"label":"Rose"},{"x":249,"y":66,"z":158,"label":"Rose bonbon"},{"x":103,"y":72,"z":70,"label":"Rose ebony"},{"x":183,"y":110,"z":121,"label":"Rose gold"},{"x":227,"y":38,"z":54,"label":"Rose madder"},{"x":255,"y":102,"z":204,"label":"Rose pink"},{"x":170,"y":152,"z":169,"label":"Rose quartz"},{"x":144,"y":93,"z":93,"label":"Rose taupe"},{"x":171,"y":78,"z":82,"label":"Rose vale"},{"x":101,"y":0,"z":11,"label":"Rosewood"},{"x":212,"y":0,"z":0,"label":"Rosso corsa"},{"x":188,"y":143,"z":143,"label":"Rosy brown"},{"x":0,"y":56,"z":168,"label":"Royal azure"},{"x":0,"y":35,"z":102,"label":"Royal blue"},{"x":65,"y":105,"z":225,"label":"Royal blue"},{"x":202,"y":44,"z":146,"label":"Royal fuchsia"},{"x":120,"y":81,"z":169,"label":"Royal purple"},{"x":224,"y":17,"z":95,"label":"Ruby"},{"x":255,"y":0,"z":40,"label":"Ruddy"},{"x":187,"y":101,"z":40,"label":"Ruddy brown"},{"x":225,"y":142,"z":150,"label":"Ruddy pink"},{"x":168,"y":28,"z":7,"label":"Rufous"},{"x":128,"y":70,"z":27,"label":"Russet"},{"x":183,"y":65,"z":14,"label":"Rust"},{"x":0,"y":86,"z":63,"label":"Sacramento State green"},{"x":139,"y":69,"z":19,"label":"Saddle brown"},{"x":255,"y":103,"z":0,"label":"Safety orange"},{"x":244,"y":196,"z":48,"label":"Saffron"},{"x":35,"y":41,"z":122,"label":"St. Patricks blue"},{"x":255,"y":140,"z":105,"label":"Salmon"},{"x":255,"y":145,"z":164,"label":"Salmon pink"},{"x":194,"y":178,"z":128,"label":"Sand"},{"x":150,"y":113,"z":23,"label":"Sand dune"},{"x":236,"y":213,"z":64,"label":"Sandstorm"},{"x":244,"y":164,"z":96,"label":"Sandy brown"},{"x":150,"y":113,"z":23,"label":"Sandy taupe"},{"x":80,"y":125,"z":42,"label":"Sap green"},{"x":15,"y":82,"z":186,"label":"Sapphire"},{"x":203,"y":161,"z":53,"label":"Satin sheen gold"},{"x":255,"y":36,"z":0,"label":"Scarlet"},{"x":255,"y":36,"z":0,"label":"Scarlet"},{"x":255,"y":216,"z":0,"label":"School bus yellow"},{"x":118,"y":255,"z":122,"label":"Screamin Green"},{"x":46,"y":139,"z":87,"label":"Sea green"},{"x":50,"y":20,"z":20,"label":"Seal brown"},{"x":255,"y":245,"z":238,"label":"Seashell"},{"x":255,"y":186,"z":0,"label":"Selective yellow"},{"x":112,"y":66,"z":20,"label":"Sepia"},{"x":138,"y":121,"z":93,"label":"Shadow"},{"x":0,"y":158,"z":96,"label":"Shamrock green"},{"x":252,"y":15,"z":192,"label":"Shocking pink"},{"x":136,"y":45,"z":23,"label":"Sienna"},{"x":192,"y":192,"z":192,"label":"Silver"},{"x":203,"y":65,"z":11,"label":"Sinopia"},{"x":0,"y":116,"z":116,"label":"Skobeloff"},{"x":135,"y":206,"z":235,"label":"Sky blue"},{"x":207,"y":113,"z":175,"label":"Sky magenta"},{"x":106,"y":90,"z":205,"label":"Slate blue"},{"x":112,"y":128,"z":144,"label":"Slate gray"},{"x":0,"y":51,"z":153,"label":"Smalt"},{"x":147,"y":61,"z":65,"label":"Smokey topaz"},{"x":16,"y":12,"z":8,"label":"Smoky black"},{"x":255,"y":250,"z":250,"label":"Snow"},{"x":15,"y":192,"z":252,"label":"Spiro Disco Ball"},{"x":254,"y":253,"z":255,"label":"Splashed white"},{"x":167,"y":252,"z":0,"label":"Spring bud"},{"x":0,"y":255,"z":127,"label":"Spring green"},{"x":70,"y":130,"z":180,"label":"Steel blue"},{"x":250,"y":218,"z":94,"label":"Stil de grain yellow"},{"x":153,"y":0,"z":0,"label":"Stizza"},{"x":228,"y":217,"z":111,"label":"Straw"},{"x":255,"y":204,"z":51,"label":"Sunglow"},{"x":250,"y":214,"z":165,"label":"Sunset"},{"x":210,"y":180,"z":140,"label":"Tan"},{"x":249,"y":77,"z":0,"label":"Tangelo"},{"x":242,"y":133,"z":0,"label":"Tangerine"},{"x":255,"y":204,"z":0,"label":"Tangerine yellow"},{"x":72,"y":60,"z":50,"label":"Taupe"},{"x":139,"y":133,"z":137,"label":"Taupe gray"},{"x":208,"y":240,"z":192,"label":"Tea green"},{"x":248,"y":131,"z":121,"label":"Tea rose"},{"x":244,"y":194,"z":194,"label":"Tea rose"},{"x":0,"y":128,"z":128,"label":"Teal"},{"x":54,"y":117,"z":136,"label":"Teal blue"},{"x":0,"y":109,"z":91,"label":"Teal green"},{"x":226,"y":114,"z":91,"label":"Terra cotta"},{"x":216,"y":191,"z":216,"label":"Thistle"},{"x":222,"y":111,"z":161,"label":"Thulian pink"},{"x":252,"y":137,"z":172,"label":"Tickle Me Pink"},{"x":10,"y":186,"z":181,"label":"Tiffany Blue"},{"x":224,"y":141,"z":60,"label":"Tigers eye"},{"x":219,"y":215,"z":210,"label":"Timberwolf"},{"x":238,"y":230,"z":0,"label":"Titanium yellow"},{"x":255,"y":99,"z":71,"label":"Tomato"},{"x":116,"y":108,"z":192,"label":"Toolbox"},{"x":255,"y":200,"z":124,"label":"Topaz"},{"x":253,"y":14,"z":53,"label":"Tractor red"},{"x":128,"y":128,"z":128,"label":"Trolley Grey"},{"x":0,"y":117,"z":94,"label":"Tropical rain forest"},{"x":0,"y":115,"z":207,"label":"True Blue"},{"x":65,"y":125,"z":193,"label":"Tufts Blue"},{"x":222,"y":170,"z":136,"label":"Tumbleweed"},{"x":181,"y":114,"z":129,"label":"Turkish rose"},{"x":48,"y":213,"z":200,"label":"Turquoise"},{"x":0,"y":255,"z":239,"label":"Turquoise blue"},{"x":160,"y":214,"z":180,"label":"Turquoise green"},{"x":102,"y":66,"z":77,"label":"Tuscan red"},{"x":138,"y":73,"z":107,"label":"Twilight lavender"},{"x":102,"y":2,"z":60,"label":"Tyrian purple"},{"x":0,"y":51,"z":170,"label":"UA blue"},{"x":217,"y":0,"z":76,"label":"UA red"},{"x":136,"y":120,"z":195,"label":"Ube"},{"x":83,"y":104,"z":149,"label":"UCLA Blue"},{"x":255,"y":179,"z":0,"label":"UCLA Gold"},{"x":60,"y":208,"z":112,"label":"UFO Green"},{"x":18,"y":10,"z":143,"label":"Ultramarine"},{"x":65,"y":102,"z":245,"label":"Ultramarine blue"},{"x":255,"y":111,"z":255,"label":"Ultra pink"},{"x":99,"y":81,"z":71,"label":"Umber"},{"x":91,"y":146,"z":229,"label":"United Nations blue"},{"x":183,"y":135,"z":39,"label":"University of California Gold"},{"x":255,"y":255,"z":102,"label":"Unmellow Yellow"},{"x":1,"y":68,"z":33,"label":"UP Forest green"},{"x":123,"y":17,"z":19,"label":"UP Maroon"},{"x":174,"y":32,"z":41,"label":"Upsdell red"},{"x":225,"y":173,"z":33,"label":"Urobilin"},{"x":153,"y":0,"z":0,"label":"USC Cardinal"},{"x":255,"y":204,"z":0,"label":"USC Gold"},{"x":211,"y":0,"z":63,"label":"Utah Crimson"},{"x":243,"y":229,"z":171,"label":"Vanilla"},{"x":197,"y":179,"z":88,"label":"Vegas gold"},{"x":200,"y":8,"z":21,"label":"Venetian red"},{"x":67,"y":179,"z":174,"label":"Verdigris"},{"x":227,"y":66,"z":52,"label":"Vermilion"},{"x":160,"y":32,"z":240,"label":"Veronica"},{"x":143,"y":0,"z":255,"label":"Violet"},{"x":127,"y":0,"z":255,"label":"Violet"},{"x":134,"y":1,"z":175,"label":"Violet"},{"x":238,"y":130,"z":238,"label":"Violet"},{"x":64,"y":130,"z":109,"label":"Viridian"},{"x":146,"y":39,"z":36,"label":"Vivid auburn"},{"x":159,"y":29,"z":53,"label":"Vivid burgundy"},{"x":218,"y":29,"z":129,"label":"Vivid cerise"},{"x":255,"y":160,"z":137,"label":"Vivid tangerine"},{"x":159,"y":0,"z":255,"label":"Vivid violet"},{"x":0,"y":66,"z":66,"label":"Warm black"},{"x":100,"y":84,"z":82,"label":"Wenge"},{"x":245,"y":222,"z":179,"label":"Wheat"},{"x":255,"y":255,"z":255,"label":"White"},{"x":245,"y":245,"z":245,"label":"White smoke"},{"x":162,"y":173,"z":208,"label":"Wild blue yonder"},{"x":255,"y":67,"z":164,"label":"Wild Strawberry"},{"x":252,"y":108,"z":133,"label":"Wild Watermelon"},{"x":114,"y":47,"z":55,"label":"Wine"},{"x":201,"y":160,"z":220,"label":"Wisteria"},{"x":115,"y":134,"z":120,"label":"Xanadu"},{"x":15,"y":77,"z":146,"label":"Yale Blue"},{"x":255,"y":255,"z":0,"label":"Yellow"},{"x":239,"y":204,"z":0,"label":"Yellow"},{"x":255,"y":211,"z":0,"label":"Yellow"},{"x":255,"y":239,"z":0,"label":"Yellow"},{"x":254,"y":254,"z":51,"label":"Yellow"},{"x":154,"y":205,"z":50,"label":"Yellow-green"},{"x":255,"y":174,"z":66,"label":"Yellow Orange"},{"x":0,"y":20,"z":168,"label":"Zaffre"},{"x":44,"y":22,"z":8,"label":"Zinnwaldite brown"}]]'
colorNamesJSON = '[[{"hex":"2a77a1","label":"Голубой"},{"hex":"840410","label":"Красный"},{"hex":"263739","label":"Серый"},{"hex":"86446e","label":"Фиолетовый"},{"hex":"d78e10","label":"Желтый"},{"hex":"4c75b7","label":"Синий"},{"hex":"bdbec6","label":"Серебрянный"},{"hex":"5e7072","label":"Серый"},{"hex":"46597a","label":"Синий"},{"hex":"656a79","label":"Серый"},{"hex":"5d7e8d","label":"Серо-зеленый"},{"hex":"58595a","label":"Темно-серый"},{"hex":"d6dad6","label":"Белый"},{"hex":"9ca1a3","label":"Серый"},{"hex":"335f3f","label":"Зеленый"},{"hex":"730e1a","label":"Темно-красный"},{"hex":"7b0a2a","label":"Фиолетовый"},{"hex":"9f9d94","label":"Серый"},{"hex":"3b4e78","label":"Синий"},{"hex":"732e3e","label":"Бордовый"},{"hex":"691e3b","label":"Фиолетовый"},{"hex":"96918c","label":"Серый"},{"hex":"515459","label":"Темно-серый"},{"hex":"3f3e45","label":"Темно-серый"},{"hex":"a5a9a7","label":"Серый"},{"hex":"635c5a","label":"Темно-серый"},{"hex":"3d4a68","label":"Темно-синий"},{"hex":"979592","label":"Серый"},{"hex":"421f21","label":"Коричневый"},{"hex":"5f272b","label":"Коричневый"},{"hex":"8494ab","label":"Голубой"},{"hex":"767b7c","label":"Серый"},{"hex":"646464","label":"Серый"},{"hex":"5a5752","label":"Темно-серый"},{"hex":"252527","label":"Черный"},{"hex":"2d3a35","label":"Темно-зеленый"},{"hex":"93a396","label":"Светло-зеленый"},{"hex":"6d7a88","label":"Серый"},{"hex":"221918","label":"Черный"},{"hex":"6f675f","label":"Бежевый"},{"hex":"7c1c2a","label":"Бордовый"},{"hex":"5f0a15","label":"Темно-красный"},{"hex":"193826","label":"Темно-зеленый"},{"hex":"5d1b20","label":"Бордовый"},{"hex":"9d9872","label":"Бежевый"},{"hex":"7a7560","label":"Бежевый"},{"hex":"989586","label":"Серый"},{"hex":"adb0b0","label":"Серый"},{"hex":"848988","label":"Серый"},{"hex":"304f45","label":"Темно-зеленый"},{"hex":"4d6268","label":"Серо-зеленый"},{"hex":"162248","label":"Темно-синий"},{"hex":"272f4b","label":"Темно-синий"},{"hex":"7d6256","label":"Коричневый"},{"hex":"9ea4ab","label":"Серебрянный"},{"hex":"9c8d71","label":"Бежевый"},{"hex":"6d1822","label":"Темно-красный"},{"hex":"4e6881","label":"Серо-синий"},{"hex":"9c9c98","label":"Серый"},{"hex":"917347","label":"Коричневый"},{"hex":"661c26","label":"Бордовый"},{"hex":"949d9f","label":"Серый"},{"hex":"a4a7a5","label":"Серый"},{"hex":"8e8c46","label":"Желто-зеленый"},{"hex":"341a1e","label":"Серо-коричневый"},{"hex":"6a7a8c","label":"Серо-синий"},{"hex":"aaad8e","label":"Бежевый"},{"hex":"ab988f","label":"Бежевый"},{"hex":"851f2e","label":"Бордовый"},{"hex":"6f8297","label":"Серо-синий"},{"hex":"585853","label":"Серый"},{"hex":"9aa790","label":"Бледно-зеленый"},{"hex":"601a23","label":"Темно-красный"},{"hex":"20202c","label":"Темно-серый"},{"hex":"a4a096","label":"Светло-бежевый"},{"hex":"aa9d84","label":"Бежевый"},{"hex":"78222b","label":"Бордовый"},{"hex":"0e316d","label":"Синий"},{"hex":"722a3f","label":"Темно-красный"},{"hex":"7b715e","label":"Бежевый"},{"hex":"741d28","label":"Темно-красный"},{"hex":"1e2e32","label":"Темно-зеленый"},{"hex":"4d322f","label":"Темно-коричневый"},{"hex":"7c1b44","label":"Фиолетовый"},{"hex":"2e5b20","label":"Зеленый"},{"hex":"395a83","label":"Синий"},{"hex":"6d2837","label":"Темно-красный"},{"hex":"a7a28f","label":"Бежевый"},{"hex":"afb1b1","label":"Серебрянный"},{"hex":"364155","label":"Темно-синий"},{"hex":"6d6c6e","label":"Серый"},{"hex":"0f6a89","label":"Зелено-синий"},{"hex":"204b6b","label":"Темно-синий"},{"hex":"2b3e57","label":"Темно-синий"},{"hex":"9b9f9d","label":"Серый"},{"hex":"6c8495","label":"Серо-синий"},{"hex":"4d5d60","label":"Серый"},{"hex":"ae9b7f","label":"Бежевый"},{"hex":"406c8f","label":"Синий"},{"hex":"1f253b","label":"Темно-синий"},{"hex":"ab9276","label":"Бежевый"},{"hex":"134573","label":"Темно-синий"},{"hex":"96816c","label":"Бежевый"},{"hex":"64686a","label":"Серый"},{"hex":"105082","label":"Синий"},{"hex":"a19983","label":"Бежевый"},{"hex":"385694","label":"Синий"},{"hex":"525661","label":"Серый"},{"hex":"7F6956","label":"Коричневый"},{"hex":"8c929a","label":"Серый"},{"hex":"596e87","label":"Серо-синий"},{"hex":"473532","label":"Темно-коричневый"},{"hex":"44624f","label":"Зеленый"},{"hex":"730a27","label":"Вишневый"},{"hex":"223457","label":"Темно-синий"},{"hex":"640d1b","label":"Темно-красный"},{"hex":"a3adc6","label":"Серебрянный"},{"hex":"695853","label":"Темно-коричневый"},{"hex":"9b8b80","label":"Бежевый"},{"hex":"620b1c","label":"Темно-красный"},{"hex":"5b5d5e","label":"Серый"},{"hex":"624428","label":"Коричневый"},{"hex":"731827","label":"Бордовый"},{"hex":"1b376d","label":"Синий"},{"hex":"ec6aae","label":"Розовый"},{"hex":"cc6633","label":"Серебристо-светло оранжевый"},{"hex":"000000","label":"Черный"},{"hex":"ffffff","label":"Белый"},{"hex":"00111b","label":"Серебристо-чёрный"},{"hex":"edf5f6","label":"Белая двухслойная"},{"hex":"ffff33","label":"Ярко-жёлтый"},{"hex":"0a7679","label":"Серебристый сине-зелёный"},{"hex":"665739","label":"Серебристо-коричневый"},{"hex":"336600","label":"Оливково-зелёный"},{"hex":"eeeeee","label":"Серебристый"},{"hex":"ffffff","label":"Белый металлик"},{"hex":"858585","label":"Серебристый светло-серый"},{"hex":"008060","label":"Ярко-зелёный"},{"hex":"32011f","label":"Серебристый фиолетовый"},{"hex":"002200","label":"Серебристо-тёмно-зелёный"},{"hex":"3a5e74","label":"Голубой"},{"hex":"2f0000","label":"Тёмно-вишнёвый"},{"hex":"efcd94","label":"Серебристо-бежевый"},{"hex":"d3671f","label":"Серебристый оранжевый"},{"hex":"ece8b7","label":"Серебристо-зелёный"},{"hex":"000000","label":"Тёмно-сине-зелёный"},{"hex":"486c95","label":"Светло-синий"},{"hex":"cccccc","label":"Светло-серый"},{"hex":"72b8b8","label":"Серебристо-зелёно-голубой"},{"hex":"EEE4AC","label":"Бежевый"},{"hex":"000000","label":"Серо-чёрный"},{"hex":"300e1d","label":"Тёмно-фиолетовый"},{"hex":"093e5e","label":"Тёмно-сине-зелёный"},{"hex":"078d51","label":"Зелёный"},{"hex":"dcddcd","label":"Бежевый"},{"hex":"eaebde","label":"Бежевый"},{"hex":"F8F9FA","label":"Белый"},{"hex":"f8eff0","label":"Белый"},{"hex":"00974b","label":"Серебристо-зелёный"},{"hex":"3F434D","label":"Серебристо-тёмно серый"},{"hex":"516371","label":"Серебристо-серо-синий"},{"hex":"84bdb4","label":"Зелёно-голубой"},{"hex":"796745","label":"Бежево-коричневый"},{"hex":"561919","label":"Красный металлик"},{"hex":"fbf1d0","label":"Металлик серо-бежевый"},{"hex":"12294b","label":"Серо-фиолетовый"},{"hex":"707561","label":"Серо-зелёный"},{"hex":"5a0107","label":"Тёмно-красный"},{"hex":"373737","label":"Тёмно-серый"},{"hex":"ae0000","label":"Серебристый ярко-красный"},{"hex":"800040","label":"Тёмно-бордовый"},{"hex":"640032","label":"Тёмно-серебристо-красный"},{"hex":"448486","label":"Серо-зелёный"},{"hex":"27004f","label":"Тёмно-фиолетовый"},{"hex":"bac7c2","label":"Серо-голубой"},{"hex":"b3faff","label":"Голубой"},{"hex":"800000","label":"Тёмно-бордовый"},{"hex":"031E36","label":"Серо-синий"},{"hex":"773c3c","label":"Серебристо-серо-коричневый"},{"hex":"c86829","label":"Оранжево-коричневый"},{"hex":"003B62","label":"Синий"},{"hex":"f9f8bb","label":"Серебристо-жёлтый"},{"hex":"66cccc","label":"Серебристо-молочно-зелёный"},{"hex":"f3f3cf","label":"Бело-жёлтый"},{"hex":"c0c0c0","label":"Серебристо-бело-молочный"},{"hex":"4b4d64","label":"Серо-синий"},{"hex":"ffc100","label":"Ярко-жёлтый"},{"hex":"669966","label":"Зелёный"},{"hex":"d3cdb6","label":"Бежево-сиреневый"},{"hex":"009933","label":"Зелёный"},{"hex":"003c00","label":"Тёмно-зелёный"},{"hex":"003c00","label":"Тёмно-зелёный"},{"hex":"e9d28a","label":"Бежево-золотистый"},{"hex":"a6a600","label":"Серебристо-жёлто-зелёный"},{"hex":"d3cdb9","label":"Золотисто-бежевый"},{"hex":"2c3c26","label":"Золотистый тёмно-зелёный"},{"hex":"353313","label":"Золотистый тёмно-зелёный"},{"hex":"1e9324","label":"Серебристо-ярко-зелёный"},{"hex":"522d64","label":"Тёмно-филетовый"},{"hex":"366d6d","label":"Серебристо-зелёный"},{"hex":"000642","label":"Тёмно-синий"},{"hex":"200f33","label":"Фиолетовый"},{"hex":"4a0001","label":"Красный"},{"hex":"510724","label":"Тёмно-вишнёвый"},{"hex":"006600","label":"Тёмно-зелёный"},{"hex":"c50707","label":"Ярко-красный"},{"hex":"970100","label":"Золотисто-красный"},{"hex":"003955","label":"Тёмно-сине-зелёный"},{"hex":"d0aa9b","label":"Светлый серо-бежевый"},{"hex":"b90000","label":"Ярко-красный"},{"hex":"b90000","label":"Красный"},{"hex":"808080","label":"Тёмно-серый"},{"hex":"384f2f","label":"Серо-зелёный"},{"hex":"2c3c26","label":"Тёмно-зелёный"},{"hex":"6D7148","label":"Золотисто-оливковый"},{"hex":"7e013d","label":"Серебристый тёмно-красный"},{"hex":"8A6749","label":"Золотисто-коричневый"},{"hex":"200204","label":"Коричневый"},{"hex":"373b2c","label":"Серебристый болотно-зелёный"},{"hex":"101419","label":"Чёрный"},{"hex":"880f24","label":"Серебристо-вишнёвый"},{"hex":"640032","label":"Вишнёвый"},{"hex":"bebebe","label":"Светло-серый"},{"hex":"bf311a","label":"Красный"},{"hex":"331159","label":"Серебристо-фиолетовый"},{"hex":"886542","label":"Серебристо-коричневый"},{"hex":"002e3b","label":"Серебристо-синий"},{"hex":"e1ecfd","label":"Серебристо-голубой"},{"hex":"0b083f","label":"Фиолетово-синий"},{"hex":"001522","label":"Серебристый тёмно-синий"},{"hex":"0067ce","label":"Синий"},{"hex":"00a653","label":"Зелёный"},{"hex":"DFE7E8","label":"Белый"},{"hex":"e5eaff","label":"Голубой"},{"hex":"bdd0e4","label":"Светло-голубой"},{"hex":"103661","label":"Тёмно-синий"},{"hex":"580062","label":"Серебристо-ярко-фиолетовый"},{"hex":"D35F11","label":"Оранжевый"},{"hex":"2e0203","label":"Серебристый тёмно-бордовый"},{"hex":"ff0000","label":"Красный металлик"},{"hex":"0d3e8b","label":"Голубой"},{"hex":"f4bf06","label":"Желто-золотой"},{"hex":"006c6c","label":"Зелёный"},{"hex":"004f95","label":"Серебристо-тёмно-синий"},{"hex":"e8d2de","label":"Серебристо-бежево-розовый"},{"hex":"cfcfc7","label":"Серебристый-желто-зелёный"},{"hex":"373737","label":"Серебристо-серо-графитовый"},{"hex":"606060","label":"Серебристый стальной"},{"hex":"3d4274","label":"Ярко-синий"},{"hex":"0c2717","label":"Тёмно-зелёный"},{"hex":"790079","label":"Ярко-фиолетовый"},{"hex":"103835","label":"Сине-зелёный"},{"hex":"0e2a77","label":"Мускари"},{"hex":"ccce9b","label":"Серебристо-серо-золотистый"},{"hex":"f1a301","label":"Жёлтый"},{"hex":"002d00","label":"Тёмно-зелёный"},{"hex":"ccce9b","label":"Серебристо-серо-бежевый"},{"hex":"658b89","label":"Серебристо-тёмно-серо-синий"},{"hex":"162219","label":"Тёмно-зелёный"},{"hex":"d3cdb6","label":"Серебристый-бежевый"},{"hex":"a4b6b9","label":"Серебристо-серо-голубоватый"},{"hex":"023C41","label":"Сине-зелёный"},{"hex":"476d85","label":"Серо-синий"},{"hex":"1c3937","label":"Тёмно-серо-зелёный"},{"hex":"00008c","label":"Тёмно-синий"},{"hex":"afb086","label":"Золотисто-зелёный"},{"hex":"594b0c","label":"Желто-зелёный"},{"hex":"325aa5","label":"Ярко-синий"},{"hex":"c9cacf","label":"Серебристо-голубоватый"},{"hex":"666666","label":"Средне-стальной"},{"hex":"dedfbb","label":"Серебристо-бежевый"},{"hex":"6cc9ad","label":"Зелено-голубой"},{"hex":"54573c","label":"Серебристо-серо-зеленоватый"},{"hex":"970000","label":"Серебристо-красно-оранжевый"},{"hex":"142A6E","label":"Тёмно-синий"},{"hex":"3d8d87","label":"Серо-зеленоватый"},{"hex":"522929","label":"Красно-коричневый"},{"hex":"015255","label":"Зелено-синий"},{"hex":"DFDCD9","label":"Серебристо-бежевый"},{"hex":"524938","label":"Серо-коричневый"},{"hex":"4C031F","label":"Тёмно-вишнёвый металлик"},{"hex":"0b083f","label":"Тёмно-синий"},{"hex":"fefe4d","label":"Ярко-жёлтый"},{"hex":"8e8a6f","label":"Серебристо-серо-зелёный"},{"hex":"0b083f","label":"Серебристо-тёмно-синий"},{"hex":"ffffc1","label":"Серебристо-бежевый"},{"hex":"f2b258","label":"Светло-жёлтый"},{"hex":"004f95","label":"Серебристо-ярко-синий"},{"hex":"004f95","label":"Серебристо-тёмно-синий"},{"hex":"ff0000","label":"Ярко-красный"},{"hex":"330066","label":"Сине-фиолетовый"},{"hex":"d2ccb7","label":"Серебристо-бледно-серый"},{"hex":"522929","label":"Тёмно-коричневый"},{"hex":"000000","label":"Тёмно-зелёный"},{"hex":"970000","label":"Тёмно-красный"},{"hex":"7e0004","label":"Красный"},{"hex":"0073a4","label":"Тёмно-голубой"},{"hex":"afb086","label":"Салатовый"},{"hex":"0033ff","label":"Ярко-синий"},{"hex":"693623","label":"Бежево-красный"},{"hex":"363b5b","label":"Серебристый сине-фиолетовый"},{"hex":"e9d1af","label":"Светло-бежевый"},{"hex":"eeeeee","label":"Светло-серый"},{"hex":"d5d3ae","label":"Серебристый-зеленовато-серый"},{"hex":"cccccc","label":"Серебристый"},{"hex":"b38c61","label":"Серо-бежевый"},{"hex":"cccccc","label":"Серо-белый"},{"hex":"abc4c5","label":"Серо-голубой"},{"hex":"99af96","label":"Серо-зелёный"},{"hex":"858585","label":"Серый серебристый"},{"hex":"c4b5ab","label":"Серо-бежевый"},{"hex":"3d4274","label":"Тёмно-синий"},{"hex":"000066","label":"Синий"},{"hex":"ddbbff","label":"Светло-фиолетовый"},{"hex":"658b89","label":"Серо-синий"},{"hex":"325aa5","label":"Серебристо-ярко-синий"},{"hex":"f6d1a4","label":"Сливочно-белый"},{"hex":"fffff0","label":"Бежево-жёлтый"},{"hex":"D0D8E2","label":"Серебристый"},{"hex":"F8FCFD","label":"Снежно-белый"},{"hex":"57594E","label":"Серебристо-серый"},{"hex":"220000","label":"Тёмно коричневый"},{"hex":"1c3937","label":"Серебристо-серо-зеленоватый"},{"hex":"614925","label":"Серебристый коричнево-зелёный"},{"hex":"e2e3d5","label":"Светло-серый"},{"hex":"BFBEBD","label":"Серый"},{"hex":"a71122","label":"Красный"},{"hex":"990000","label":"Серебристо-красный"},{"hex":"999999","label":"Серебристо-зеленоватый"},{"hex":"a49e77","label":"Тёмно-бежевый"},{"hex":"4b2525","label":"Тёмно-коричневый"},{"hex":"797979","label":"Тёмно-серый"},{"hex":"000066","label":"Тёмно-синий"},{"hex":"000066","label":"Оттенок тёмно-синего"},{"hex":"002e3b","label":"Сине-зелёный"},{"hex":"C04914","label":"Оранжевый"},{"hex":"970000","label":"Ярко-красный"},{"hex":"003333","label":"Чёрный"},{"hex":"a4b5ca","label":"Серебристо-сиреневый"},{"hex":"880f24","label":"Тёмно-вишнёво-малиновый"},{"hex":"008080","label":"Цвет морской волны"},{"hex":"003333","label":"Тёмно-зелёный"},{"hex":"f2d48b","label":"Светло-жёлтый"},{"hex":"574868","label":"Серебристый тёмно-фиолетовый"},{"hex":"660033","label":"Тёмно-алый"},{"hex":"000066","label":"Тёмно-синий"},{"hex":"161313","label":"Чёрный"},{"hex":"040001","label":"Чёрный"},{"hex":"000000","label":"Чёрный"},{"hex":"373737","label":"Серебристо-серо-графитовый"},{"hex":"615652","label":"Серебристо-коричневый"},{"hex":"161313","label":"Чёрный"},{"hex":"71191b","label":"Тёмно-коричневый"},{"hex":"3a454b","label":"Тёмно-серый"},{"hex":"afa38f","label":"Серо-бежевый"},{"hex":"9abeb7","label":"Серебристо-голубоватый"},{"hex":"4A0206","label":"Тёмно-вишнёвый"}]]'
colorNames = nil

forbiddenWeapons = {
	[1]=true,
	[4]=true,
	[36]=true,
	[37]=true
}

ammuInts = {
	-- intid, exitx, exity, exitz, exitangle, sellx, selly, sellz, sellangle
	{ 1, 285.5, -41.0, 1001.5, 0.0, 295.0, -40.2, 1001.5, 0.0 },
	{ 6, 296.8, -111.3, 1001.5, 0.0, 290.3, -111.4, 1001.5, 0.0 },
	{ 4, 286.8, -85.7, 1001.5, 0.0, 295.9, -82.6, 1001.5, 0.0 },
	{ 6, 316.4, -169.4, 999.6, 0.0, 312.2, -167.9, 999.6, 0.0 },
	{ 7, 315.8, -142.8, 999.6, 0.0, 308.1, -143.1, 999.6, 0.0 }
}
ammuBusinessPrice = 500000
ammuShops = {}
ammuWeapons = {
	{
		{ 1242, 1242, 100, 50 },
		--{ 1, 331, 1, 10 },
		{ 5, 336, 1, 95 },
		{ 41, 365, 500, 75 },
		{ 22, 346, 17, 120 },
		{ 23, 347, 17, 120 },
		{ 24, 348, 7, 265 },
		{ 25, 349, 5, 800 },
		{ 29, 353, 30, 700 },		
		{ 44, 368, 1, 500 }	,	
	},
	{
		{ 28, 352, 50, 300 },
		{ 16, 342, 1, 100 },
	},
	{
		{ 30, 355, 30, 2200 },
		{ 31, 356, 50, 2750 },
		{ 34, 358, 5, 2100 },
		{ 17, 343, 1, 350 },
	},
	{
		{ 27, 351, 7, 2000 },
		{ 26, 350, 4, 600 },
	},
	{
		{ 38, 362, 100, 4000 },
	--},
	--{
		--{ 35, 359, 1, 2500 },
		--{ 36, 360, 1, 5000 }	
	}
}
-----типы интерьеров-----
eatTypes = {
	{ 10, "Бургер Шот", 10, 363.7, -74.6, 1001.5, 315.0, 375.7, -65.8, 1001.5, 180.0, { 3, 1 }, 205, 600000 },
	{ 14, "Клакин Белл", 9, 365.2, -10.9, 1001.9, 0.0, 367.5, -4.4, 1001.9, 180.0, { 5, 1 }, 167, 600000 },
	{ 17, "Ринг Донатс", 17, 377.2, -193.0, 1000.6, 0.0, 380.8, -189.2, 1000.6, 180.0, { 9, 1 }, 168, 600000 },
	{ 29, "Вел Стакед Пицца Ко.", 5, 372.5, -133.3, 1001.5, 0.0, 374.3, -117.3, 1001.5, 180.0, { 4, 1 }, 155, 600000 },
	{ 49, "Бар", 11, 501.9, -68.4, 998.8, 180.0, 494.9, -77.5, 998.8, 0.0, { 6, 1 }, 211, 400000 },
	{ 49, "Бар", 17, 493.4, -24.2, 1000.7, 0.0, 501.7, -20.5, 1000.7, 90.0, { 6, 1 }, 211, 400000 },
	{ 52, "Магазин 24/7", 6, -27.3, -57.5, 1003.5, 0.0, -22.6, -57.2, 1003.5, 0.0, { 1, 409, 406, 443, 441, 442, 414, 446, 16 }, 36, 500000 }, -- 1
	{ 52, "Магазин 24/7", 18, -31.0, -91.5, 1003.5, 0.0, -26.9, -91.8, 1003.5, 0.0, { 1, 409, 406, 443, 441, 442, 414, 446, 16 }, 36, 500000 }, -- 2
	{ 52, "Магазин 24/7", 4, -27.3, -30.6, 1003.5, 0.0, -29.6, -30.7, 1003.5, 0.0, { 1, 409, 406, 443, 441, 442, 414, 446, 16 }, 36, 500000 }, -- 3
	{ 50, "Столовая", 4, 459.1, -88.5, 999.6, 90.0, 450.1, -82.2, 999.6, 180.0, { 9, 4, 6, 1 }, 129, 300000 },
	{ 47, "Магазин RC Zero", 6, -2240.1, 128.3, 1035.4, 270.0, -2235.4, 128.5, 1035.4, 0.0, { 12, 13, 14, 15 }, 306, 250000 },
	{ 49, "Клуб Jizzy's", 3, -2636.7, 1403.3, 906.5, 0.0, -2655.8, 1406.9, 906.3, 230.0, { 6, 1 }, 211, 600000 },
	{ 49, "Бар Lil Probe Inn", 18, -228.8, 1401.1, 27.8, 270.0, -223.4, 1405.9, 27.8, 90.0, { 6, 1 }, 157, 150000 },
	{ 30, "LSPD HQ", 6, 246.8, 63.0, 1003.6, 0.0, 233.6, 65.1, 1005.0, 270.0, { }, 286, 0 },
	{ 30, "SFPD HQ", 10, 246.5, 108.2, 1003.2, 0.0, 248.8, 110.5, 1012.6, 0.0, { }, 286, 0 },
	{ 30, "Федеральное Бюрю Расследований", 3, 238.7, 139.5, 1003.0, 0.0, 242.2, 158.8, 1012.2, 0.0, { }, 286, 0 },
	{ 30, "Штаб пригородного PD", 5, 322.3, 303, 999.1, 0.0, 317.3, 318, 1004.1, 0.0, { }, 286, 0 },
	{ 22, "Больница LS", 18, 1536.33, -17.02, 1075.2, 270.0, 426.1, 171.1, 1030.8, 270.0, { }, 286, 0 },
	{ 22, "Больница SF", 19, 1536.33, -17.02, 1075.2, 270.0, 426.1, 171.1, 1030.8, 270.0, { }, 286, 0 },
	{ 22, "Больница LV", 20, 1536.33, -17.02, 1075.2, 270.0, 426.1, 171.1, 1030.8, 270.0, { }, 286, 0 },
	{ 22, "Пригородная больница", 21, 1536.33, -17.02, 1075.2, 270.0, 426.1, 171.1, 1030.8, 270.0, { }, 286, 0 },
	{ 52, "Магазин мебели", 18, -25.89125, -31.97294, 1008.6308, 0.0, -32.71419, -30.01737, 1008.6308, 0.0, { }, 222, 1400000 },
	{ 52, "Магазин мебели", 18, -1893.0399, 83.00336, 1086.2915, 0.0, -1885.8531, 83.60645, 1086.2915, 90.0, { }, 98, 1700000 },
	{ 52, "Магазин мебели", 18, 206.14, -112.94174, 1008.9375, 0.0, 206.196, -102.1666, 1009.0625, 180.0, { }, 32, 1000000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 23, 900000 },
	{ 52, "Магазин мебели", 18, 206.14, -112.94174, 1008.9375, 0.0, 206.196, -102.1666, 1009.0625, 180.0, { }, 32, 950000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 100, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 170, 1000000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 210, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 60, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 93, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 37, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 170, 1500000 },
	{ 52, "Магазин мебели", 18, 952.1723, -2.3534, 1008.3425, 270.0, 961.27936, -3.31315, 1008.3425, 90.0, { }, 60, 1500000 },
	{ 52, "Магазин мебели", 18, -1893.0399, 83.00336, 1086.2915, 0.0, -1885.8531, 83.60645, 1086.2915, 90.0, { }, 17, 2000000 },
	{ 52, "Магазин мебели", 18, -25.89125, -31.97294, 1008.6308, 0.0, -32.71419, -30.01737, 1008.6308, 0.0, { }, 91, 2000000 },
    { 36, "Tv_news", 1, 1419.4, 3.9, 1001.5, 0.0, 242.2, 158.8, 1012.2, 0.0, { }, 286, 0 }
}
-----спаун фракций-----
eatLocations = {}
eatFractions = {
	[14] = 1,
	[15] = 2,
	[16] = 3,
	[17] = 4,
	[18] = 5,
	[19] = 6,
	[20] = 7,
	[21] = 8,
    [37] = 9
}

uniqueJumpMoney = 250

raceCounter = 1
raceInfo = {}
availableRace = nil
raceUpdateInfoTimer = nil
raceBlip = nil
timeBetweenRaces = 60000
raceInfoCoroutine = nil
racersCoroutine = nil

repairGarages = {}
repairPrice = 100

boomboxMusic = {
	{ "Radio Los Santos", 51, 58, 65, 72, 79, 86, 92, 98, 104, 109, 116, 123, 130, 135, 142, 148 },
	{ "Playback FM", 47, 54, 61, 68, 75, 82, 89, 96, 103, 110, 117, 124 },
	{ "K-Rose", 51, 58, 65, 72, 79, 86, 93, 100, 107, 114, 121, 128, 135, 142, 149 },
	{ "K-DST", 44, 51, 58, 65, 72, 78, 85, 92, 101, 108, 115, 122, 129, 136, 143, 150 },
	{ "Bounce FM", 61, 68, 75, 82, 89, 96, 103, 110, 117, 124, 131, 138, 145, 152, 159, 166, 173 },
	{ "SF-UR", 36, 41, 46, 51, 56, 61, 66, 71, 76, 81, 86, 91, 96, 101, 106, 111 },
	{ "Radio X", 47, 54, 61, 68, 75, 82, 89, 96, 103, 110, 117, 124, 131, 138, 145 },
	{ "CSR 103.9", 40, 47, 54, 61, 68, 75, 82, 89, 96, 103, 110, 117, 124 },
	{ "K-Jah West", 53, 60, 67, 74, 81, 88, 95, 102, 109, 116, 123, 130, 136, 143, 150, 157 },
	{ "Master Sounds 98.3", 56, 63, 70, 77, 84, 91, 98, 104, 111, 118, 125, 132, 137, 140, 146, 153, 159, 164 }
}
boomboxArray = {}
boomboxUpdatePrev = 0

weatherSequence = {
	{ 10, 1200000 },
	{ 12, 2400000 },
	--{ 16, 300000 },
	{ 9, 180000 },
	{ 0, 2400000 },
	{ 17, 2400000 }
}
weatherCurId = 1

wantedKillPrices = { 200, 400, 600, 750, 900, 1050 }
wantedTimers = {}
wantedCooldowns = {}

jobAmbulanceCars = {}
jobAmbulancePriceForHP = 200
jobAmbulanceMoneyForBlowedCar = 2000
jobAmbulanceMoneyForLeftCar = 100
jobAmbulanceFinish = {}

jobFarmFields = {}
jobFarmMoneyForBlowedCar = 2000
jobFarmMoneyForLeftCar = 100
jobFarmTimeBackToVeh = 60000
jobFarmMoneyForField = 30

extraObjs = {}
removeObjs = {}

--otbMachineMdl = 2754
otbInts = {
	{ 834.2, 7.4, 1004.2, 90.0, 3, {
		{ 834.3, 6.1, 1004.1, 0, 0, 0 },
		{ 834.3, 4.8, 1004.1, 0, 0, 0 },
		{ 834.3, 3.5, 1004.1, 0, 0, 0 },
		{ 834.3, 2.2, 1004.1, 0, 0, 0 },
		{ 834.3, 0.9, 1004.1, 0, 0, 0 },
		{ 831.1, -1.0, 1004.1, 0, 0, 270 },
		{ 829.8, -1.0, 1004.1, 0, 0, 270 },
		{ 828.5, -1.0, 1004.1, 0, 0, 270 },
		{ 827.2, -1.0, 1004.1, 0, 0, 270 },
		{ 825.9, -1.0, 1004.1, 0, 0, 270 }
		}, 822.3, 1.9, 1003.2
	},
	{ -2158.7, 642.5, 1052.4, 180.0, 1, {
		{ -2171.1, 642.5, 1052.3, 0, 0, 180 },
		{ -2171.1, 643.4, 1052.3, 0, 0, 180 },
		{ -2171.1, 644.3, 1052.3, 0, 0, 180 },
		{ -2170.3, 646.8, 1057.5, 0, 0, 90 },
		{ -2162.6, 646.9, 1057.5, 0, 0, 90 }
		}, -2161.2, 640.7, 1051.4
	}
}
otbLocations = {}
otbTickets = {}
otbPrice = 100
otbFund = 0

ferrisWheelCabins = {
	{ nil, 1, nil },
	{ nil, 3, nil },
	{ nil, 5, nil },
	{ nil, 7, nil },
	{ nil, 9, nil },
	{ nil, 11, nil },
	{ nil, 13, nil },
	{ nil, 15, nil },
	{ nil, 17, nil },
	{ nil, 19, nil }
}
ferrisWheelPath = {
	{ 389.8, -2028.5, 8.8 },
	{ 389.8, -2025.0, 9.3 },
	{ 389.8, -2021.6, 11.0 },
	{ 389.8, -2019.0, 13.6 },
	{ 389.8, -2017.3, 16.9 },
	{ 389.8, -2016.8, 20.5 },
	{ 389.8, -2017.3, 24.0 },
	{ 389.8, -2019.0, 27.4 },
	{ 389.8, -2021.6, 29.8 },
	{ 389.8, -2025.0, 31.6 },
	{ 389.8, -2028.5, 32.2 },
	{ 389.8, -2032.0, 31.6 },
	{ 389.8, -2035.5, 29.8 },
	{ 389.8, -2038.1, 27.4 },
	{ 389.8, -2039.8, 24.0 },
	{ 389.8, -2040.3, 20.5 },
	{ 389.8, -2039.8, 16.9 },
	{ 389.8, -2038.1, 13.6 },
	{ 389.8, -2035.5, 11.0 },
	{ 389.8, -2031.1, 9.3 }
}
ferrisWheelMoveTime = 4000
ferrisWheelPrice = 5
ferrisWheelExit = { 387.0, -2028.5, 7.8, 90.0 }
ferrisWheelSeat = { -0.5, 0.0, 0.0, 90.0 }

outsideFoodSellers = {}

inventoryDroppedItems = {}
inventoryItemNames = {
	{ "Газировка Sprunk", 10, 2601 },
	{ "Канистра с топливом", 90, 1650 },
	{ "Бургер", 20, 2703 },
	{ "Пицца", 25, 2702 },
	{ "Тортилья", 25, 2769 },
	{ "Пиво", 10, 1544 },
	{ "Магнитола", 100, 2102 },
	{ "Здоровье", 200, 1240 },
	{ "Пончик", 20, 2218 },
	{ "Коробка с оружием", 200, 1558 },
	{ "Орешки", 5, 2060 },
	{ "RC Вертолёт", 200, 1558 },
	{ "RC Автомобиль", 200, 1558 },
	{ "RC Танк", 200, 1558 },
	{ "RC Самолёт", 200, 1558 },
	{ "Набор отмычек", 100, 2040 },
	{ "Ворованная игровая приставка", 50, 1719 },
	{ "Ворованный телевизор", 30, 1748 },
	{ "Ворованный телевизор", 45, 1749 },
	{ "Ворованная магнитола", 45, 2102 },
	{ "Ворованный телевизор", 45, 1752 },
	{ "Ворованная игровая приставка", 50, 1719 },
	{ "Ворованная магнитола", 75, 2103 },
	{ "Ворованный компьютер", 120, 2190 },
	{ "Ворованный телевизор", 200, 1792 },
	{ "Ворованный телефон", 200, 2967 },
	{ "Ворованный видеомагнитофон", 120, 1783 },
	{ "Ворованный телевизор", 100, 1518 },
	{ "Ворованный телевизор", 350, 1786 },
	{ "Ворованный телефон", 175, 2966 },
	{ "Ворованная магнитола", 150, 2226 },
	{ "Ворованная игровая приставка", 300, 2028 },
	{ "Ворованная аудиосистема", 300, 1809 },
	{ "Ворованный телевизор", 150, 1791 },
	{ "Ворованный видеомагнитофон", 130, 1785 },
	{ "Ворованный телевизор", 200, 2316 },
	{ "Ворованный телевизор", 120, 1781 },
	{ "Ворованный видеомагнитофон", 140, 1788 },
	{ "Ворованный видеомагнитофон", 200, 1782 },
	{ "Ворованный сейф", 500, 19618 },
	{ "Доска для серфинга", 100, 2404 },
	{ "Доска для серфинга", 110, 2405 },
	{ "Доска для серфинга", 105, 2406 },
	{ "Доска для серфинга", 115, 2410 },
	{ "Голова Оленя", 50, 1736 },
	{ "Каска", 10, 2053 },
	{ "Каска", 10, 2052 },
	{ "Пепельница", 2, 1510 },
	{ "Ковер-тигр", 25, 1828 },
	{ "Баскетбольная корзина", 55, 3497 },
	{ "Картина 'Сан Андреас'", 10, 2258 },
	{ "Картина 'Грузовой док'", 10, 2267 },
	{ "Картина 'Безумие'", 10, 2283 },
	{ "Картина 'Общее начало'", 10, 2254 },
	{ "Картина 'Пальмы'", 10, 2256 },
	{ "Картина 'Кенди'", 100, 2255 },
	{ "Картина 'Колор'", 50, 2257 },
	{ "Баскетбольный мяч", 25, 2114 },
	{ "Коврик коричневый", 13, 2847 },
	{ "Коврик зеленый", 13, 2841 },
	{ "Коврик бордовый", 13, 2842 },
	{ "Коврик квадратный песочный", 13, 2836 },
	{ "Коврик круглый песочный", 13, 2835 },
	{ "Коврик грязно-коричневый", 13, 2834 },
	{ "Коврик с орнаментом", 13, 2833 },
	{ "Мячик для гольфа", 5, 1974 },
	{ "Флаг USA", 1, 11245 },
	{ "Флаг USA двойной", 2, 2614 },
	{ "Ваза", 5, 14705 },
	{ "Модель кораблика", 7, 2484 },
	{ "Доска", 500, 3077 },
	{ "Телевизор LD FATRON 190", 900, 1792 },
	{ "Телевизор LD FATRON 80", 400, 1791 },
	{ "Телевизор LD FATRON 133", 550, 1752 },
	{ "Телевизор LD FATRON 600", 2000, 1786 },
	{ "Телевизор SUNNY WISTRON 10", 200, 1748 },
	{ "Телевизор SUNNY WISTRON 13", 200, 1747 },
	{ "Телевизор MISUSISI OR 806", 340, 1749 },
	{ "Телевизор MISUSISI OR 50", 100, 1781 },
	{ "Parasanic MEGA D22", 450, 1790 },
	{ "Sunny ES100", 550, 1788 },
	{ "LD EVO 51", 300, 1787 },
	{ "Sunny ES410", 600, 1782 },
	{ "Приставка Pipboy", 500, 1719 },
	{ "Приставка Super Playboy", 500, 1718 },
	{ "Приставка Cjd 500", 1000, 2028 },
	{ "Компьютер", 1500, 2190 },
	{ "Радио Shark GF90", 250, 2102 },
	{ "Радио Boomster OVB", 300, 2103 },
	{ "Радио Boomster HOM", 600, 2226 },
	{ "Радио Sunny Liberty CD", 1000, 1839 },
	{ "Радио Hilips DOF33", 700, 2101 },
	{ "Радио Sunny Mix3D", 800, 1783 },
	{ "Радио Sunny Platinum", 900, 1785 },
	{ "Радио Sunny BigStation", 2000, 2099 },
	{ "Колонка Hilips", 100, 1840 },
	{ "Колонка Sunny BigTech", 300, 2232 },
	{ "Колонка Sunny MedTech", 200, 2229 },
	{ "Колонка Shark Midi100", 100, 2231 },
	{ "Колонка Shark Midi120", 100, 2230 },
	{ "Ванна Fletis Ultra", 300, 2526 },
	{ "Ванна Fletis Norma", 200, 2519 },
	{ "Ванна Fletis Omega", 400, 2522 },
	{ "Кабинка Fletis Nigma", 340, 2517 },
	{ "Кабинка Fletis Dix", 100, 2527 },
	{ "Раковина", 30, 2518 },
	{ "Сейф", 1000, 2332 },
	{ "Стиральная машинка", 450, 1208 },
	{ "Микроволновка", 150, 2149 },
	{ "Водяной куллер черный", 500, 2002 },
	{ "Водяной куллер белый", 500, 1808 },
	{ "Стойка низкая тип С", 100, 18092 },
	{ "Стойка высокая тип С", 1000, 18070 },
	{ "Столик бордовый", 200, 1737 },
	{ "Обеденный стол", 2000, 2357 },
	{ "Столик коричневый", 200, 2119 },
	{ "Стол журнальный тип О", 400, 2111 },
	{ "Стол обеденный складной", 500, 2117 },
	{ "Стол журнальный", 400, 2112 },
	{ "Стол мраморный", 3000, 2118 },
	{ "Столик коричневый гладкий", 200, 2110 },
	{ "Кухонная стойка, центр, черный", 500, 2439 },
	{ "Столик овальный коричневый", 110, 2080 },
	{ "Кухонная стойка, центр, белый", 500, 2435 },
	{ "Кухонная стойка, угол, белый", 500, 2434 },
	{ "Кухонная стойка, угол, хром", 500, 2423 },
	{ "Кухонная стойка, центр, хром", 500, 2424 },
	{ "Кухонная стойка, угол, черный", 500, 2440 },
	{ "Витрина", 700, 2433 },
	{ "Кухонная стойка, центр, камень", 500, 2441 },
	{ "Кухонная стойка, угол, камень", 500, 2442 },
	{ "Кухонная стойка, центр, камень", 500, 2444 },
	{ "Столик стеклянный", 400, 2024 },
	{ "Кухонная стойка, центр, плитка", 500, 2455 },
	{ "ТВ стол из фанеры", 230, 2321 },
	{ "Обеденный столик из фанеры", 310, 2115 },
	{ "Обеденный стол из фанеры", 350, 2116 },
	{ "Итальянский секретер", 500, 2078 },
	{ "Тв стол из дуба", 400, 2084 },
	{ "Кухонная стойка, витрина, красный", 1000, 2449 },
	{ "Кухонная стойка, центр, красный", 500, 2446 },
	{ "Стол из фанеры круглый", 300, 2109 },
	{ "Тв столик из дуба", 450, 2315 },
	{ "Квадратный столик", 240, 1823 },
	{ "Длинный Тв стол", 410, 2311 },
	{ "Кухонная стойка, середина, камень", 500, 2445 },
	{ "Стол D-образный", 310, 2081 },
	{ "Столик со стеклянной вставкой", 245, 2083 },
	{ "Кофейный столик", 320, 1820 },
	{ "Кухонная стойка, середина, красный", 500, 2447 },
	{ "Кухонная стойка, витрина, красный", 500, 2448 },
	{ "Кухонная стойка, угол, красный", 500, 2450 },
	{ "Круглый столик со стеклом", 435, 1822 },
	{ "Квадратная Тв тумба", 360, 2082 },
	{ "Пеленальный столик", 80, 1821 },
	{ "Массивный Тв стол", 500, 2235 },
	{ "Круглый каменный стол", 1300, 2030 },
	{ "Обеденный дубовый столик", 560, 2032 },
	{ "Складной овальный стол", 350, 2031 },
	{ "Классический стол", 750, 2205 },
	{ "Классический стол большой", 1000, 2206 },
	{ "Кофейный столик", 560, 2236 },
	{ "Дубовый кофейный столик", 320, 2234 },
	{ "Масивный стол", 1300, 2029 },
	{ "Кухоный уголок", 4000, 14720 },
	{ "Кухонная стойка, угол, плитка", 500, 2454 },
	{ "Круглый стол", 430, 2699 },
	{ "Кухонная стойка, раздача, плитка", 500, 2457 },
	{ "Стол круглый деревянный", 380, 1819 },
	{ "Круглый сегментный стол", 600, 1815 },
	{ "Кофейный стол", 755, 1433 },
	{ "Обеденный сосновый стол", 430, 1516 },
	{ "Барная стойка", 4000, 2208 },
	{ "Сосновая стойка", 300, 1416 },
	{ "Бильярдный стол", 10000, 2964 },
	{ "Хай фай столик", 300, 2346 },
	{ "Офисный стол", 900, 2173 },
	{ "Ресепшн", 6000, 2207 },
	{ "Круглый стеклянный столик", 2000, 1827 },
	{ "Холодильник средний", 470, 2147 },
	{ "Холодильник большой", 2000, 1780 },
	{ "Холодильник спранк", 1500, 2443 },
	{ "Кровать одноместная", 150, 1771 },
	{ "Матрас", 100, 14861 },
	{ "Белая кровать", 340, 14866 },
	{ "Лава лампа", 150, 2238 },
	{ "Ночник напольный", 150, 2108 },
	{ "Ночник многонаправленный", 170, 2072 },
	{ "Торшер", 130, 2069 },
	{ "Офисный шкафчик", 100, 2066 },
	{ "Офисный шкафчик зеленый", 100, 2067 },
	{ "Офисный шкафчик двойной", 180, 2007 },
	{ "Стеллаж", 400, 2063 },
	{ "Офисный шкафчик металлик", 100, 2000 },
	{ "Офисный шкаф", 1200, 2204 },
	{ "Офисный стеллажик", 450, 2191 },
	{ "Верстак", 3000, 936 },
	{ "Верстак открытый", 3000, 937 },
	{ "Книжный шкаф", 500, 1742 },
	{ "Организация", 500, 2609 },
	{ "Организация большая", 500, 2610 },
	{ "Диван кож.зам.", 230, 1713 },
	{ "Элитная кровать", 5000, 14446 },
	{ "Бежевый диван", 550, 1712 },
	{ "Бежевый диван", 550, 1728 },
	{ "Бежевый диван большой", 1200, 1710 },
	{ "Кожаный диван", 780, 1753 },
	{ "Стул", 120, 2309 },
	{ "Стул готический", 670, 2124 },
	{ "Диван в клеточку", 300, 1768 },
	{ "Диван коричневый", 410, 1757 },
	{ "Кресло качалка", 340, 2096 },
	{ "Красный барный стул", 150, 1805 },
	{ "Кожаный барный стул", 300, 1716 },
	{ "Сетчатый диван", 550, 1764 },
	{ "Офисный стул", 270, 1721 },
	{ "Кресло бежевое", 200, 1729 },
	{ "Квадратное кресло", 240, 1727 },
	{ "Садовый стул", 20, 1810 },
	{ "Стриптиз стул", 550, 2723 },
	{ "Дубовый стул", 600, 2120 },
	{ "Дубовый стул высокий", 650, 1739 },
	{ "Бабушкино кресло", 110, 1735 },
	{ "Бурый диван", 390, 1756 },
	{ "Садовый диван", 455, 1763 },
	{ "Ресторанный стул", 120, 1720 },
	{ "Рабочий стул без ручек", 230, 1663 },
	{ "Рабочий стул", 230, 1715 },
	{ "Большой бурый диван", 710, 1761 },
	{ "Синий рабочий стул", 230, 1806 },
	{ "Темно-синий рабочий стул", 230, 2356 },
	{ "Стриптиз стул со спинкой", 550, 2724 },
	{ "Бордовый стул", 320, 1811 },
	{ "Офисное кресло", 600, 1724 },
	{ "Гостевой диван", 10000, 1709 },
	{ "Семейный набор", 730, 1825 },
	{ "Серый диван", 660, 1760 },
	{ "Офисное коричневое кресло", 600, 1705 },
	{ "Элитное кресло", 750, 1704 },
	{ "Стул руководителя", 1300, 1714 },
	{ "Красный низкий барный стул", 300, 2125 },
	{ "Диван из автомобиля", 3400, 1707 },
	{ "Красный обеденный стул", 150, 2121 },
	{ "Бордовое кресло", 200, 1711 },
	{ "Кабинетное кресло", 500, 1708 },
	{ "Бордовый диван", 350, 1706 },
	{ "Кожанный пуфик", 240, 1746 },
	{ "Дедушкино кресло", 100, 1765 },
	{ "Кабинетный диван", 1000, 1703 },
	{ "Бурый диван", 600, 1702 },
	{ "Кожаный диван центр", 1000, 1754 },
	{ "Кожаный диван угол", 1000, 2292 },
	{ "Биван", 300, 2295 },
	{ "Хромакей", 4000, 1610 },
	{ "Холодильник", 3000, 1990 },
	{ "Дешевая двухместная кровать", 700, 1794 },
	{ "Дорогая ортопедическая кровать", 2000, 1795 },
	{ "Дешевая одноместная кровать", 500, 1796 },
	{ "Дорогая двухместная кровать", 2000, 1797 },
	{ "Средняя ортопедическая кровать", 1600, 1798 },
	{ "Средняя кровать двухместная", 1200, 1799 },
	{ "Железная двухместная кровать", 3000, 1801 },
	{ "Средняя девичья кровать", 1100, 1802 },
	{ "Средняя девичья кровать + навес", 1300, 1803 },
	{ "Кровать + шкаф", 2000, 2301 },
	{ "Кровать из массива", 3000, 2302 }
}
inventoryFurnitureItems = {
	[41]=true, [42]=true, [43]=true, [44]=true, [45]=true, [46]=true, [47]=true, [48]=true, [49]=true, [50]=true, [51]=true, [52]=true, [53]=true, [54]=true, [55]=true, [56]=true, [57]=true,
	[58]=true, [59]=true, [60]=true, [61]=true, [62]=true, [63]=true, [64]=true, [65]=true, [66]=true, [67]=true, [68]=true, [69]=true, [70]=true, [71]=true, [72]=true, [73]=true, [74]=true,
	[75]=true, [76]=true, [77]=true, [78]=true, [79]=true, [80]=true, [81]=true, [82]=true, [83]=true, [84]=true, [85]=true, [86]=true, [87]=true, [88]=true, [89]=true, [90]=true, [91]=true,
	[92]=true, [93]=true, [94]=true, [95]=true, [96]=true, [97]=true, [98]=true, [99]=true, [100]=true, [101]=true, [102]=true, [103]=true, [104]=true, [105]=true, [106]=true, [107]=true,
	[108]=true, [109]=true, [110]=true, [111]=true, [112]=true, [113]=true, [114]=true, [115]=true, [116]=true, [117]=true, [118]=true, [119]=true, [120]=true, [121]=true, [122]=true, [123]=true,
	[124]=true, [125]=true, [126]=true, [127]=true, [128]=true, [129]=true, [130]=true, [131]=true, [132]=true, [133]=true, [134]=true, [135]=true, [136]=true, [137]=true, [138]=true, [139]=true,
	[140]=true, [141]=true, [142]=true, [143]=true, [144]=true, [145]=true, [146]=true, [147]=true, [148]=true, [149]=true, [150]=true, [151]=true, [152]=true, [153]=true, [154]=true, [155]=true,
	[156]=true, [157]=true, [158]=true, [159]=true, [160]=true, [161]=true, [162]=true, [163]=true, [164]=true, [165]=true, [166]=true, [167]=true, [168]=true, [169]=true, [170]=true, [171]=true,
	[172]=true, [173]=true, [174]=true, [175]=true, [176]=true, [177]=true, [178]=true, [179]=true, [180]=true, [181]=true, [182]=true, [183]=true, [184]=true, [185]=true, [186]=true, [187]=true,
	[188]=true, [189]=true, [190]=true, [191]=true, [192]=true, [193]=true, [194]=true, [195]=true, [196]=true, [197]=true, [198]=true, [199]=true, [200]=true, [201]=true, [202]=true, [203]=true,
	[204]=true, [205]=true, [206]=true, [207]=true, [208]=true, [209]=true, [210]=true, [211]=true, [212]=true, [213]=true, [214]=true, [215]=true, [216]=true, [217]=true, [218]=true, [219]=true,
	[220]=true, [221]=true, [222]=true, [223]=true, [224]=true, [225]=true, [226]=true, [227]=true, [228]=true, [229]=true, [230]=true, [231]=true, [232]=true, [233]=true, [234]=true, [235]=true,
	[236]=true, [237]=true, [238]=true, [239]=true, [240]=true, [241]=true, [242]=true, [243]=true, [244]=true, [245]=true, [246]=true, [247]=true, [248]=true, [249]=true, [250]=true, [251]=true,
	[252]=true, [253]=true, [254]=true, [255]=true, [256]=true, [257]=true, [258]=true, [259]=true, [260]=true, [261]=true, [262]=true, [263]=true, [264]=true, [265]=true, [266]=true
}
inventoryOnlyForHouse = {
	[41]=true, [42]=true, [43]=true, [44]=true, [45]=true, [46]=true, [47]=true, [48]=true, [49]=true, [50]=true, [51]=true, [52]=true, [53]=true, [54]=true, [55]=true, [56]=true, [57]=true,
	[58]=true, [59]=true, [60]=true, [61]=true, [62]=true, [63]=true, [64]=true, [65]=true, [66]=true, [67]=true, [68]=true, [69]=true, [70]=true, [71]=true, [72]=true, [73]=true, [74]=true,
	[75]=true, [76]=true, [77]=true, [78]=true, [79]=true, [80]=true, [81]=true, [82]=true, [83]=true, [84]=true, [85]=true, [86]=true, [87]=true, [88]=true, [89]=true, [90]=true, [91]=true,
	[92]=true, [93]=true, [94]=true, [95]=true, [96]=true, [97]=true, [98]=true, [99]=true, [100]=true, [101]=true, [102]=true, [103]=true, [104]=true, [105]=true, [106]=true, [107]=true,
	[108]=true, [109]=true, [110]=true, [111]=true, [112]=true, [113]=true, [114]=true, [115]=true, [116]=true, [117]=true, [118]=true, [119]=true, [120]=true, [121]=true, [122]=true, [123]=true,
	[124]=true, [125]=true, [126]=true, [127]=true, [128]=true, [129]=true, [130]=true, [131]=true, [132]=true, [133]=true, [134]=true, [135]=true, [136]=true, [137]=true, [138]=true, [139]=true,
	[140]=true, [141]=true, [142]=true, [143]=true, [144]=true, [145]=true, [146]=true, [147]=true, [148]=true, [149]=true, [150]=true, [151]=true, [152]=true, [153]=true, [154]=true, [155]=true,
	[156]=true, [157]=true, [158]=true, [159]=true, [160]=true, [161]=true, [162]=true, [163]=true, [164]=true, [165]=true, [166]=true, [167]=true, [168]=true, [169]=true, [170]=true, [171]=true,
	[172]=true, [173]=true, [174]=true, [175]=true, [176]=true, [177]=true, [178]=true, [179]=true, [180]=true, [181]=true, [182]=true, [183]=true, [184]=true, [185]=true, [186]=true, [187]=true,
	[188]=true, [189]=true, [190]=true, [191]=true, [192]=true, [193]=true, [194]=true, [195]=true, [196]=true, [197]=true, [198]=true, [199]=true, [200]=true, [201]=true, [202]=true, [203]=true,
	[204]=true, [205]=true, [206]=true, [207]=true, [208]=true, [209]=true, [210]=true, [211]=true, [212]=true, [213]=true, [214]=true, [215]=true, [216]=true, [217]=true, [218]=true, [219]=true,
	[220]=true, [221]=true, [222]=true, [223]=true, [224]=true, [225]=true, [226]=true, [227]=true, [228]=true, [229]=true, [230]=true, [231]=true, [232]=true, [233]=true, [234]=true, [235]=true,
	[236]=true, [237]=true, [238]=true, [239]=true, [240]=true, [241]=true, [242]=true, [243]=true, [244]=true, [245]=true, [246]=true, [247]=true, [248]=true, [249]=true, [250]=true, [251]=true,
	[252]=true, [253]=true, [254]=true, [255]=true, [256]=true, [257]=true, [258]=true, [259]=true, [260]=true, [261]=true, [262]=true, [263]=true, [264]=true, [265]=true, [266]=true
}
playersSelectedFurniture = {}
spawnedFurniture = {}
inventoryIllegalItems = {
	[16]=true, [17]=true, [18]=true, [19]=true, [20]=true, [21]=true, [22]=true, [23]=true, [24]=true, [25]=true, [26]=true, [27]=true, [28]=true, [29]=true, [30]=true, [31]=true, [32]=true,
	[33]=true, [34]=true, [35]=true, [36]=true, [37]=true, [38]=true, [39]=true, [40]=true
}
inventorySellableOnly = {}
inventoryCarTrunkSlots = 18
inventoryCarTempTrunks = {}

gangsterKillOrders = {}
gangsterKillOrderRandoms = {}
gangsterKillOrderRandomTimer = nil
gangs = {}
gangInvites = {}

vehCommonSpawnPos = {}
vehCommonSpawnPrice = 50

extraVehCoords = {}

weaponIssuances = {}
weaponIssuanceDelay = 300000
weaponIssuancePlrs = {}

militaryBases = {}
militaryBasesCoroutine = nil
militaryCargoInfo = {
-- x, y, z, objmdl, objstartx, objstarty, objstartz, objendx, objendy, objendz, objangx, objangy, objangz, targetx, targety, targetz, markerstart, markertarget, bliptarget, objboxes, amount, curamount
--[[{ 2195.2, -2231.9, 12.5, 3630, 2190.5, -2227.2, 15.7, 2186.3, -2223.1, 15.7, 0, 0, 315, 2220.6299, -2261.6357, 12.52969, nil, nil, nil, nil, 100, 100 },
	{ 2202.4, -2224.6, 12.5, 3630, 2197.8, -2219.9, 15.7, 2193.4, -2215.5, 15.7, 0, 0, 315, 2220.6299, -2261.6357, 12.52969, nil, nil, nil, nil, 100, 100 },
	{ 2210.0, -2217.4, 12.5, 3630, 2205.4, -2212.7, 15.7, 2201.3, -2208.6, 15.7, 0, 0, 315, 2220.6299, -2261.6357, 12.52969, nil, nil, nil, nil, 100, 100 },
	{ 2217.4, -2210.8, 12.5, 3630, 2212.8, -2206.2, 15.7, 2208.5, -2201.9, 15.7, 0, 0, 315, 2220.6299, -2261.6357, 12.52969, nil, nil, nil, nil, 100, 100 },
	{ -1256.3112, 475.98285, 6.0, 3630, -1250.7, 475.89001, 9.44141, -1242.6913, 475.89999, 9.44141, 0, 0, 359, -1422.93005, 457.23004, 6.18750, nil, nil, nil, nil, 100, 100 },
	{ -1256.9425, 465.79022, 6.0, 3630, -1250.7, 465.60001, 9.44141, -1242.74, 465.60001, 9.44141, 0, 0, 359, -1677.2137, 314.91092, 6.2259, nil, nil, nil, nil, 100, 100 },
	{ -1256.8892, 455.32153, 6.0, 3630, -1251.3, 455.20001, 9.44141, -1243.2, 455.20001, 9.44141, 0, 0, 359, -1341.14136, 479.03494, 6.18750, nil, nil, nil, nil, 100, 100 },
	{ -1257.7164, 445.53012, 6.0, 3630, -1251.9, 445.39999, 9.44141, -1243.8, 445.2002, 9.44141, 0, 0, 359, -1472.29053, 456.18945, 6.18092, nil, nil, nil, nil, 100, 100 },
	{ 2532.95, 2824.2292, 9.85871, 3630, 2533.4399, 2829.8999, 13.07422, 2533.4399, 2838.0979, 13.07422, 0, 0, 90, 2555.9124, 2832.9031, 9.85871, nil, nil, nil, nil, 100, 100 },
	{ 2523.4539, 2824.8352, 9.85871, 3630, 2523.6877, 2830.5, 13.07422, 2523.6877, 2838.6699, 13.07422, 0, 0, 90, 2561.3809, 2836.1475, 9.85871, nil, nil, nil, nil, 100, 100 },
	{ 2513.0239, 2825.5061, 9.85871, 3630, 2513.2, 2830.7, 13.074, 2513.2, 2838.9299, 13.074, 0, 0, 90, 2596.1665, 2837.4253, 9.85871, nil, nil, nil, nil, 100, 100 },
	{ 2502.769, 2825.2637, 9.85871, 3630, 2502.8999, 2830.7, 13.07422, 2502.8999, 2838.8701, 13.074, 0, 0, 90, 2605.3159, 2815.7761, 9.85871, nil, nil, nil, nil, 100, 100 },]]
	{ 128.88379, 1828.498, 16.68645, 3630, 122.85479, 1828.7064, 19.63325, 114.81762, 1828.7347, 19.63325, 0.0, 0.0, 0.0, 223.48767, 1857.8835, 12.18536, nil, nil, nil, nil, 50, 50 },
	{ 128.9375, 1838.8955, 16.67902, 3630, 122.85479, 1839.0209, 19.63325, 114.81762, 1839.0439, 19.63325, 0.0, 0.0, 0.0, 219.46149, 1858.0796, 12.18536, nil, nil, nil, nil, 50, 50 },
	{ 129.5127, 1849.6445, 16.72245, 3630, 123.15479, 1849.522, 19.63325, 115.09262, 1849.4971, 19.63325, 0.0, 0.0, 0.0, 213.86130, 1859.12939, 12.14063, nil, nil, nil, nil, 35, 35 },
	{ 129.64989, 1859.4392, 16.80385, 3630, 123.75479, 1859.2814, 19.63325, 115.64262, 1859.4252, 19.63325, 0.0, 0.0, 0.0, 213.86130, 1859.12939, 13.14063, nil, nil, nil, nil, 45, 45 },
	{ 251.47885, 1861.223, 7.79621, 3630, 248.43359, 1864.3647, 8.95043, 238.91553, 1864.3652, 8.95043, 0.0, 0.0, 0.0, 299.40863, 1815.5027, 3.74934, nil, nil, nil, nil, 60, 60 },
	{ 251.8856, 1870.5547, 7.79621, 3630, 248.43318, 1867.4259, 8.92543, 238.89931, 1867.4258, 8.92543, 0.0, 0.0, 0.0, 299.40863, 1815.5027, 3.74934, nil, nil, nil, nil, 60, 60 }
}
militaryCargoBoxes = {}
militaryGeneralInfo = {}
militaryGeneralCarMdl = 470
militaryGeneralPedMdl = 312
militaryGeneralInfoId = 0
militaryGeneralCar = nil
militaryGeneralPed = nil
militaryGeneralPedBlip = nil
militaryGeneralTargetMarker = nil
militaryGeneralTargetBlip = nil
militaryGeneralArrived = false
militaryGeneralTimeBetween = 300000

weaponsInBox = {
	{ 22, 17, "пистолет и одну обойму" },
	{ 23, 17, "пистолет с глушителем и одну обойму" },
	{ 24, 7, "Desert Eagle и одну обойму" },
	{ 25, 10, "ружье и десять патронов" },
	{ 26, 10, "обрез и десять патронов" },
	{ 27, 7, "SPAS-12 и одну обойму" },
	{ 28, 50, "Uzi и одну обойму" },
	{ 29, 30, "MP5 и одну обойму" },
	{ 32, 50, "TEC-9 и одну обойму" },
	{ 30, 30, "AK-47 и одну обойму" },
	{ 31, 50, "M4 и одну обойму" },
	{ 34, 5, "снайперскую винтовку и пять патронов" },
	{ 38, 25, "пулемёт и двадцать пять патронов" },
	{ 16, 2, "две гранаты" }
}

hospitalHealthPrice = 1000

tutorialArray = {}
tutorialPositions = {}
tutorialImages = {
	["Введение"] =			{ "tutorial1.png" },
	["Ком. службы"] =		{ "tutorial2.png" },
	["Автосалон"] =			{ "tutorial3.png" },
	["Военная база"] =		{ "tutorial4.png" },
	["Заправка"] =			{ "tutorial5.png" },
	["Полиция"] =			{ "tutorial6.png" },
	["Тюнинг"] =			{ "tutorial7.png" },
	["Водитель"] =			{ "tutorial8.png" },
	["Аммуниция"] =			{ "tutorial9.png" },
	["Колесо обозрения"] = 	{ "tutorial10.png" },
	["Ферма"] =				{ "tutorial11.png" },
	["Больница"] =			{ "tutorial12.png" }
}
tutorialMdl = 211

jobTaxiCars = {}
jobTaxiPriceLimits = { 10, 1000 }
jobTaxiCpsFinish = {}
jobTaxiMoneyForBlowedCar = 2000
jobTaxiMoneyForLeftCar = 100
jobTaxiLocations = {}

referrerMoney = 50000
referrerRespect = 0.1

respectMult = 1.0

clanCreatePrice = 100000

buyoutPrice = 100

fuelRandomLevelMin = 90
fuelRandomLevelMax = 100
fuelPrice = 400
fuelStations = {}
fuelCoroutine = nil

luckyPhoneModel = 1216
luckyPhoneCoords = {}
luckyPhoneCurrent = 0
luckyPhoneRingCycleTimer = nil
luckyPhoneNextTimer = nil
luckyPhoneMoneyMin = 100
luckyPhoneMoneyMax = 500
luckyPhoneCoroutine = nil

lowriderPrice = 1000
lowriderMarkers = {}
lowriderMusic = {
	-- musicId, musicLen, movements(moveId, time)
	{ 6, 205,
		{
		{ 1, 4.12 },
		{ 2, 8.46 },
		{ 1, 12.84 },
		{ 2, 14.97 },
		{ 3, 17.10 },
		{ 4, 19.27 },
		{ 1, 21.45 },
		{ 1, 22.49 },
		{ 1, 23.60 },
		{ 1, 24.71 },
		{ 2, 25.78 },
		{ 2, 26.80 },
		{ 2, 27.94 },
		{ 2, 29.00 },
		{ 3, 30.05 },
		{ 4, 32.25 },
		{ 3, 34.45 },
		{ 4, 36.65 },
		{ 1, 38.83 },
		{ 2, 39.69 },
		{ 1, 40.94 },
		{ 2, 41.87 },
		{ 3, 43.00 },
		{ 4, 43.96 },
		{ 3, 45.31 },
		{ 4, 46.20 },
		{ 1, 47.38 },
		{ 1, 48.56 },
		{ 1, 49.67 },
		{ 1, 50.83 },
		{ 2, 51.85 },
		{ 2, 52.87 },
		{ 2, 53.87 },
		{ 2, 54.94 },
		{ 3, 56.18 },
		{ 3, 57.23 },
		{ 3, 58.25 },
		{ 3, 59.34 },
		{ 4, 60.47 },
		{ 3, 61.29 },
		{ 4, 62.63 },
		{ 3, 63.40 },
		{ 4, 64.74 },
		{ 3, 65.60 },
		{ 4, 66.98 },
		{ 3, 67.85 },
		{ 1, 69.07 },
		{ 2, 70.23 },
		{ 1, 71.34 },
		{ 3, 72.34 },
		{ 4, 72.85 },
		{ 3, 73.43 },
		{ 1, 74.54 },
		{ 1, 75.65 },
		{ 1, 76.71 },
		{ 1, 77.80 },
		{ 2, 78.87 },
		{ 1, 79.94 },
		{ 3, 80.98 },
		{ 4, 81.47 },
		{ 3, 81.98 },
		{ 1, 83.05 },
		{ 1, 84.18 },
		{ 1, 85.29 },
		{ 1, 86.45 },
		{ 2, 87.51 },
		{ 2, 88.58 },
		{ 2, 89.67 },
		{ 2, 90.74 },
		{ 3, 91.83 },
		{ 3, 92.94 },
		{ 3, 94.09 },
		{ 3, 95.25 },
		{ 4, 96.47 },
		{ 4, 97.74 },
		{ 4, 99.00 },
		{ 1, 100.09 },
		{ 1, 101.25 },
		{ 1, 102.36 },
		{ 1, 103.54 },
		{ 1, 104.63 },
		{ 1, 105.87 },
		{ 2, 107.05 },
		{ 2, 108.14 },
		{ 2, 109.25 },
		{ 2, 110.29 },
		{ 2, 111.43 },
		{ 2, 112.47 },
		{ 3, 113.51 },
		{ 3, 114.69 },
		{ 3, 115.74 },
		{ 3, 116.83 },
		{ 4, 117.94 },
		{ 4, 118.98 },
		{ 4, 120.02 },
		{ 4, 121.02 },
		{ 1, 122.33 },
		{ 2, 123.33 },
		{ 3, 124.36 },
		{ 4, 124.87 },
		{ 3, 125.40 },
		{ 1, 126.65 },
		{ 1, 127.76 },
		{ 1, 128.80 },
		{ 1, 129.88 },
		{ 2, 130.88 },
		{ 1, 131.97 },
		{ 2, 133.03 },
		{ 3, 134.08 },
		{ 3, 135.19 },
		{ 3, 136.26 },
		{ 3, 137.37 },
		{ 4, 138.48 },
		{ 4, 139.61 },
		{ 4, 140.68 },
		{ 4, 141.83 },
		{ 1, 142.81 },
		{ 2, 147.10 },
		{ 1, 151.46 },
		{ 2, 153.46 },
		{ 1, 155.83 },
		{ 2, 157.88 },
		{ 4, 160.12 },
		{ 3, 161.17 },
		{ 4, 162.28 },
		{ 3, 163.34 },
		{ 1, 164.48 },
		{ 2, 165.50 },
		{ 1, 166.61 },
		{ 2, 167.70 },
		{ 4, 168.74 },
		{ 4, 169.74 },
		{ 3, 170.81 },
		{ 3, 171.90 },
		{ 1, 173.03 },
		{ 1, 174.08 },
		{ 2, 175.12 },
		{ 2, 176.26 },
		{ 4, 177.37 },
		{ 3, 178.48 },
		{ 4, 179.59 },
		{ 3, 180.66 },
		{ 1, 181.79 },
		{ 2, 182.81 },
		{ 1, 183.97 },
		{ 4, 184.88 },
		{ 3, 185.46 },
		{ 4, 185.97 },
		{ 1, 187.10 },
		{ 1, 188.19 },
		{ 1, 189.21 },
		{ 4, 190.37 },
		{ 3, 191.46 },
		{ 4, 192.52 },
		{ 1, 193.63 },
		{ 2, 194.17 },
		{ 1, 194.66 },
		{ 4, 195.72 },
		{ 3, 196.86 },
		{ 4, 198.01 },
		{ 1, 199.10 }
		}
	}
}

nearbyPlayersRadius = 3.0
nearbyPickupsRadius = 2.0
nearbyVehiclesRadius = 4.0

heaverCargoPrice = 15
heaverTakeMarkers = {}
heaverDeliverMarkers = {}
heaverCoroutine = nil

animList = {
	{ "Facepalm", "MISC", "plyr_shkhead", false, false, true, false },
	{ "Fuck you", "ped", "fucku", false, false, true, false },
	{ "Оглядеться", "ped", "roadcross", true, false, true, false },
	{ "Победный танец", "benchpress", "gym_bp_celebrate", false, false, true, false },
	{ "Прилечь на землю", "BEACH", "Lay_Bac_Loop", true, false, true, false },
	{ "Присесть на землю", "BEACH", "ParkSit_M_loop", true, false, true, false },
	{ "Руки вверх", "ped", "handsup", false, true, true, true },
	{ "Сидеть", "ped", "SEAT_idle", true, false, true, false },
	{ "Скрестить руки", "DEALER", "DEALER_IDLE", true, false, true, false },
	{ "Сложить руки", "COP_AMBIENT", "Coplook_loop", true, false, true, false },
	{ "Стоять на руках", "DAM_JUMP", "DAM_Dive_Loop", true, false, true, false },
	{ "Танец 1", "DANCING", "dance_loop", true, false, true, false },
	{ "Танец 2", "DANCING", "DAN_Loop_A", true, false, true, false },
	{ "Танец 3", "DANCING", "DAN_Left_A", true, false, true, false },
	{ "Танец 4", "DANCING", "DAN_Down_A", true, false, true, false },
	{ "Танец 5", "DANCING", "dnce_M_a", true, false, true, false },
	{ "Танец 6", "DANCING", "dnce_M_b", true, false, true, false },
	{ "Танец 7", "DANCING", "dnce_M_d", true, false, true, false }
}

bots = {}

jobFoodTypes = {
	[588]={1,3,5},
	[448]={1,4}
}
jobFoodClientInfo = {}
jobFoodAvailableCars = {}
jobFoodFinishMarkers = {}
jobFoodMoneyForBlowedCar = 2000
jobFoodMoneyForLeftCar = 100

derbyArenas = {
	-- vehid, interior, camx, camy, camz, lookx, looky, lookz, positions
	{ 504, 15, -1529.2, 978.3, 1048.9, -1370.7, 967.3, 1024.5, 
		{
		{ -1485.8, 952.1, 1036.8, 330.0 },
		{ -1502.7, 966.2, 1037.1, 310.0 },
		{ -1512.1, 984.2, 1037.4, 290.0 },
		{ -1512.9, 1004.1, 1037.7, 260.0 },
		{ -1504.6, 1022.8, 1038.0, 240.0 },
		{ -1486.7, 1038.9, 1038.3, 220.0 },
		{ -1465.7, 1049.1, 1038.4, 200.0 },
		{ -1441.7, 1054.7, 1038.5, 180.0 },
		{ -1418.7, 1056.2, 1038.4, 180.0 },
		{ -1395.5, 1056.0, 1038.4, 180.0 },
		{ -1373.2, 1056.0, 1038.4, 180.0 },
		{ -1351.6, 1054.1, 1038.3, 180.0 },
		{ -1328.3, 1046.9, 1038.1, 160.0 },
		{ -1306.8, 1034.9, 1037.9, 140.0 },
		{ -1290.9, 1019.3, 1037.6, 120.0 },
		{ -1283.6, 997.5, 1037.2, 90.0 },
		{ -1288.9, 976.3, 1036.9, 70.0 },
		{ -1303.3, 958.7, 1036.6, 40.0 },
		{ -1323.6, 946.0, 1036.4, 20.0 },
		{ -1347.4, 938.0, 1036.3, 10.0 }
		}, "стадион Los Santos"
	},
	{ 504, 15, -1529.2, 978.3, 1048.9, -1370.7, 967.3, 1024.5, 
		{
		{ -1485.8, 952.1, 1036.8, 330.0 },
		{ -1502.7, 966.2, 1037.1, 310.0 },
		{ -1512.1, 984.2, 1037.4, 290.0 },
		{ -1512.9, 1004.1, 1037.7, 260.0 },
		{ -1504.6, 1022.8, 1038.0, 240.0 },
		{ -1486.7, 1038.9, 1038.3, 220.0 },
		{ -1465.7, 1049.1, 1038.4, 200.0 },
		{ -1441.7, 1054.7, 1038.5, 180.0 },
		{ -1418.7, 1056.2, 1038.4, 180.0 },
		{ -1395.5, 1056.0, 1038.4, 180.0 },
		{ -1373.2, 1056.0, 1038.4, 180.0 },
		{ -1351.6, 1054.1, 1038.3, 180.0 },
		{ -1328.3, 1046.9, 1038.1, 160.0 },
		{ -1306.8, 1034.9, 1037.9, 140.0 },
		{ -1290.9, 1019.3, 1037.6, 120.0 },
		{ -1283.6, 997.5, 1037.2, 90.0 },
		{ -1288.9, 976.3, 1036.9, 70.0 },
		{ -1303.3, 958.7, 1036.6, 40.0 },
		{ -1323.6, 946.0, 1036.4, 20.0 },
		{ -1347.4, 938.0, 1036.3, 10.0 }
		}, "стадион San Fierro"
	}
}
derbyObjDef = {
	--{ 3062, 0, 2.75, 0, 0, 90, 0 },
	--{ 2937, -0.575, -3.349609375, 0.050000008195639, 15, 0, 0 },
	--{ 2937, 0.575, -3.349609375, 0.050000008195639, 15, 0, 0 }
}
derbyStartMarkers = {}
derbyCurrentInfo = {}
derbyStartTime = 120000
derbyPrice = 100
derbyLobbyCoroutine = nil

vehiclesOnWork = {}

trainVehicles = {
	-- route, vehmdl, trailermdl, chainmin, chainmax, startmin, startmax, pointspertrain
	--{ 1, 538, 570, 3, 4, 190, 200, 300 },
	--{ 2, 449, 449, 1, 1, 1, 10, 55 }
}
trainElements = {}
trainRoutes = {
	{
		{ 1694.2791,-1953.6406,14.8756,269.9379,true },
		{ 1543.2188,-1953.7222,14.8756,270.0363,false },
		{ 1487.1676,-1953.8058,14.8756,270.3948,false },
		{ 1448.7401,-1953.6755,14.7552,268.2394,false },
		{ 1394.4469,-1946.9991,11.9917,256.7606,false },
		{ 1350.7844,-1932.1606,6.3980,245.7466,false },
		{ 1296.8345,-1891.1736,-0.3408,224.5610,false },
		{ 1240.7106,-1829.2979,-2.2474,221.1531,false },
		{ 1145.1826,-1718.5925,-2.9915,220.7255,false },
		{ 1066.9226,-1628.3174,-2.3421,221.0755,false },
		{ 972.8044,-1523.8232,-1.0160,222.9767,false },
		{ 917.4668,-1465.6433,-0.4296,224.1127,false },
		{ 788.7173,-1343.2085,-0.1244,227.8619,true },
		{ 711.3243,-1277.5291,1.3596,231.2830,false },
		{ 616.1962,-1206.1997,5.1177,235.3512,false },
		{ 559.9456,-1169.0601,7.9711,237.6910,false },
		{ 461.5966,-1114.1108,13.1583,243.4349,false },
		{ 359.2351,-1070.1331,18.1151,249.8437,false },
		{ 256.1987,-1039.6335,21.7373,257.2398,false },
		{ 166.0981,-1023.7988,23.3403,263.7133,false },
		{ 96.2585,-1018.6285,23.3332,268.9474,false },
		{ 42.5864,-1018.0067,22.5530,269.9523,false },
		{ -19.8332,-1017.9902,21.8951,270.6093,false },
		{ -83.2839,-1018.0012,17.6665,270.0087,false },
		{ -152.4753,-1027.2534,12.6099,285.3831,false },
		{ -236.1247,-1068.9053,18.7499,310.5402,false },
		{ -294.3044,-1144.5366,31.2661,323.7861,false },
		{ -344.4513,-1210.6698,40.6207,321.2972,false },
		{ -375.8392,-1239.0549,42.8321,299.7999,false },
		{ -417.6344,-1254.5703,43.4144,281.0728,false },
		{ -472.0118,-1252.2623,43.3756,251.4700,false },
		{ -514.3601,-1225.5146,43.3756,232.6321,false },
		{ -561.1024,-1188.8242,43.3756,230.5717,false },
		{ -611.0304,-1148.9928,43.9572,235.3444,false },
		{ -670.2212,-1122.7411,50.8223,259.2798,false },
		{ -736.2664,-1131.0977,61.8572,295.0620,false },
		{ -786.3564,-1166.6064,65.5977,316.3260,false },
		{ -812.0806,-1210.4122,70.4826,340.6379,false },
		{ -824.0588,-1260.9780,76.5413,350.5378,false },
		{ -832.6078,-1322.3623,83.9834,352.8750,false },
		{ -840.6372,-1375.9817,90.1973,349.2151,false },
		{ -856.0842,-1431.1039,95.7563,337.3858,false },
		{ -885.0907,-1472.8082,97.6852,310.0098,false },
		{ -933.3417,-1493.7727,93.4486,281.3285,false },
		{ -1013.4156,-1501.5217,79.7865,273.3968,false },
		{ -1086.6320,-1509.3064,63.4741,280.3531,false },
		{ -1164.1753,-1517.9910,44.6017,269.9366,false },
		{ -1246.3853,-1514.4727,30.1610,266.0938,false },
		{ -1375.7361,-1509.3759,24.7101,269.1232,false },
		{ -1504.6846,-1503.9885,20.4080,264.6850,false },
		{ -1627.5490,-1482.6914,15.9274,253.8565,false },
		{ -1743.0953,-1420.7114,15.2506,229.3071,false },
		{ -1833.2235,-1320.8562,15.2506,216.4038,false },
		{ -1945.0581,-1132.7080,17.0377,201.9309,false },
		{ -1974.9197,-1013.4581,24.5638,186.1460,false },
		{ -1978.6467,-896.9524,27.0006,179.5834,false },
		{ -1978.3750,-810.7460,27.0006,180.0000,false },
		{ -1978.9072,-701.5751,27.0006,180.5702,false },
		{ -1979.9938,-590.8164,27.2161,180.4450,false },
		{ -1979.4430,-508.4512,27.0006,177.7072,false },
		{ -1966.4063,-364.2598,27.0006,176.5295,false },
		{ -1955.5393,-266.7832,27.0006,170.9761,false },
		{ -1946.0769,-185.7734,27.0006,175.4355,false },
		{ -1944.4548,-74.6797,27.0006,180.0743,false },
		{ -1940.4080,199.2373,26.9390,173.7302,true },
		{ -1934.2751,237.4275,25.0846,167.7028,false },
		{ -1917.6323,279.3301,20.0448,144.0929,false },
		{ -1896.1042,302.5190,15.6487,130.4186,false },
		{ -1866.5762,323.2766,10.4395,123.5257,false },
		{ -1841.7755,339.8370,5.9944,123.5666,false },
		{ -1811.9851,359.8417,2.1797,124.5596,false },
		{ -1777.7487,383.7973,2.8313,125.1746,false },
		{ -1725.2295,421.7170,8.6150,126.3506,false },
		{ -1678.6359,455.5345,16.5949,126.1083,false },
		{ -1609.7384,505.6323,28.7062,125.8583,false },
		{ -1563.3328,539.2389,34.7120,125.9283,false },
		{ -1466.0413,609.9244,35.8756,126.0274,false },
		{ -1378.9746,673.1921,35.8756,126.0017,false },
		{ -1312.5718,721.4402,35.8756,126.0020,false },
		{ -1232.2400,779.7847,35.8756,125.9863,false },
		{ -1133.3538,851.5935,35.8756,125.9864,false },
		{ -1085.7319,886.1777,35.8756,125.9994,false },
		{ -830.3331,1072.0383,35.8094,125.9186,false },
		{ -781.1683,1107.5305,35.0240,125.8112,false },
		{ -718.8929,1149.0265,32.4244,119.7122,false },
		{ -676.7347,1169.3397,30.3386,110.0888,false },
		{ -625.7629,1182.1814,28.7199,102.0834,false },
		{ -565.4479,1195.1208,28.5465,102.0585,false },
		{ -482.4834,1212.6667,30.6091,102.0576,false },
		{ -383.9251,1234.3503,32.1027,102.1583,false },
		{ -265.7422,1263.7856,29.8787,102.1066,false },
		{ -188.1475,1277.8368,25.1686,98.7218,false },
		{ -114.3345,1286.9465,20.8200,96.0187,false },
		{ -28.5076,1293.2708,19.3828,91.4148,false },
		{ 74.0373,1287.2559,20.9679,80.1614,false },
		{ 140.8305,1269.4291,23.7091,70.5213,false },
		{ 219.6705,1236.9644,24.1256,69.0662,false },
		{ 328.7584,1208.6641,23.6912,81.9593,false },
		{ 449.5394,1211.7250,17.8049,102.0653,false },
		{ 483.4584,1221.3062,15.9105,110.0090,false },
		{ 531.8599,1244.7070,13.9239,119.5954,false },
		{ 572.6262,1267.9640,13.2868,119.7895,false },
		{ 651.1829,1314.5798,13.1256,123.3014,false },
		{ 688.6764,1341.9451,13.1256,129.6317,false },
		{ 714.8054,1370.4871,13.0417,148.8038,false },
		{ 727.1124,1398.3247,12.9202,162.6457,false },
		{ 737.6373,1449.9697,12.3519,173.0064,false },
		{ 741.4199,1494.0159,11.6389,176.8882,false },
		{ 743.3623,1597.2207,9.5495,179.9098,false },
		{ 742.8890,1696.2893,7.7974,180.3027,false },
		{ 742.1779,1828.3392,6.9654,180.4495,false },
		{ 741.4952,1915.4022,7.4205,180.4492,false },
		{ 739.8486,2075.7144,11.1770,180.9016,false },
		{ 738.1759,2188.0273,17.7691,181.7391,false },
		{ 727.8569,2305.6182,20.1645,184.6346,false },
		{ 728.0056,2412.4119,21.1703,173.6756,false },
		{ 732.4308,2442.6731,21.4947,169.5977,false },
		{ 767.6235,2539.1147,22.0976,156.0539,false },
		{ 799.8361,2606.8193,22.1256,153.2155,false },
		{ 826.7221,2658.8208,22.1256,151.9287,false },
		{ 861.4639,2706.8459,22.0490,138.7546,false },
		{ 938.2002,2756.7666,20.1657,99.6326,false },
		{ 1013.4432,2754.5554,17.1876,75.0653,false },
		{ 1051.8960,2736.8232,16.2182,58.3516,false },
		{ 1095.5023,2703.4839,15.2143,52.4919,false },
		{ 1140.2068,2668.3584,14.0819,52.6728,false },
		{ 1184.7334,2641.6323,13.0180,67.3819,false },
		{ 1217.9913,2632.9897,12.2703,84.7432,false },
		{ 1241.3491,2632.2500,12.1256,90.0000,false },
		{ 1473.0040,2632.2500,12.1256,90.0009,true },
		{ 1595.9814,2632.2500,12.1256,90.0000,false },
		{ 1634.9739,2636.5559,12.1256,92.3873,false },
		{ 1666.9009,2640.5576,12.1256,101.4838,false },
		{ 1719.4801,2655.3313,12.1256,108.7210,false },
		{ 1792.2864,2680.6812,12.1256,107.5666,false },
		{ 1854.4786,2693.6624,12.1256,93.2625,false },
		{ 1940.4397,2694.1250,12.1256,90.0000,false },
		{ 2021.9325,2694.1250,12.1401,90.0009,false },
		{ 2092.3394,2694.1250,12.3437,90.0000,false },
		{ 2165.5020,2691.7827,12.1256,78.3823,false },
		{ 2293.7192,2690.1250,12.1256,90.0000,false },
		{ 2382.9739,2690.1250,12.1256,90.0000,false },
		{ 2442.3862,2689.6206,12.1256,86.4174,false },
		{ 2486.6880,2674.1787,12.1256,55.5839,false },
		{ 2516.9268,2642.7778,12.1256,34.1015,false },
		{ 2546.4548,2567.1372,12.1256,9.4188,false },
		{ 2549.1411,2481.1826,12.1256,3.3157,false },
		{ 2552.6516,2423.3386,11.5591,359.8131,false },
		{ 2552.7500,2335.8359,5.6214,0.0000,false },
		{ 2555.0278,2296.8740,4.5813,8.5659,false },
		{ 2564.9343,2262.4819,3.8016,23.3484,false },
		{ 2587.4590,2226.7964,2.1520,40.1782,false },
		{ 2641.8306,2181.8926,-0.5578,56.1349,false },
		{ 2704.6626,2138.9453,-0.4533,52.3680,false },
		{ 2774.1021,2043.2212,4.5284,17.2025,false },
		{ 2784.6294,1975.4050,5.8355,1.7419,false },
		{ 2780.8750,1727.0773,12.1256,0.0000,true },
		{ 2783.6426,1644.6016,12.1256,18.1857,false },
		{ 2815.5410,1601.3870,12.1256,40.1670,false },
		{ 2844.9521,1558.6180,12.1256,26.3363,false },
		{ 2860.7732,1512.9565,12.1256,12.3459,false },
		{ 2864.7500,1472.7441,12.1256,0.0000,false },
		{ 2864.7500,1251.5686,12.1256,0.0000,true },
		{ 2863.9490,1222.0085,12.0684,354.3881,false },
		{ 2849.1470,1174.7693,12.0262,336.7330,false },
		{ 2817.2800,1111.7878,12.1256,330.2982,false },
		{ 2786.0632,1065.6378,13.0166,323.5099,false },
		{ 2767.3589,1033.7664,12.4562,342.3843,false },
		{ 2764.7500,975.0050,12.2506,0.0000,false },
		{ 2764.7500,892.1857,12.2506,0.0000,false },
		{ 2764.7500,759.9576,12.2506,0.0000,false },
		{ 2765.0457,616.3180,10.9199,0.1331,false },
		{ 2765.1616,318.3055,9.3228,0.1532,false },
		{ 2776.6877,252.0182,10.5974,20.0245,false },
		{ 2803.9312,173.3053,17.0803,17.5336,false },
		{ 2820.2710,106.9270,25.9627,8.6958,false },
		{ 2827.6794,-5.5819,31.3579,0.2455,false },
		{ 2820.6985,-133.1276,34.0881,339.8239,false },
		{ 2772.5762,-232.1407,24.3388,332.2608,false },
		{ 2739.3652,-276.2520,19.1030,296.4071,false },
		{ 2671.3518,-293.3972,15.7848,276.0862,false },
		{ 2537.9548,-283.4330,17.4162,262.3541,false },
		{ 2449.5625,-273.6509,19.5459,266.0643,false },
		{ 2250.4243,-346.8468,42.1669,290.0160,false },
		{ 2090.2041,-360.7834,62.6473,283.1908,false },
		{ 2012.4482,-546.1286,73.6134,32.4241,false },
		{ 2158.6641,-675.5604,52.8490,53.1301,false },
		{ 2283.7810,-873.6805,29.3344,2.6024,false },
		{ 2284.8750,-970.3503,28.1648,0.0000,false },
		{ 2284.8750,-1078.1285,28.3732,0.0009,false },
		{ 2284.8750,-1196.0308,26.6162,0.0000,false },
		{ 2283.1001,-1428.4043,25.2120,354.7069,false },
		{ 2236.6423,-1578.2732,19.5691,337.5341,false },
		{ 2215.6067,-1631.0627,17.0494,342.0198,false },
		{ 2198.8687,-1715.3762,14.8434,357.8149,false },
		{ 2198.6250,-1793.6846,14.8735,0.0000,false },
		{ 2198.6846,-1897.9702,15.1256,0.4225,false },
		{ 2154.8101,-1952.7281,15.1256,277.2738,false },
		{ 2100.6055,-1953.7500,15.1256,270.0000,false },
		{ 2040.2671,-1953.7500,15.1256,270.0000,false },
		{ 1951.6719,-1953.7500,15.0545,270.0000,false },
		{ 1900.6563,-1953.7500,15.1256,270.0000,false }
	},
	{
		{ -2265.0581,527.9678,34.9066,180.3010,true },
		{ -2267.0984,512.5225,34.7498,149.3239,false },
		{ -2279.5259,508.4362,34.7407,88.1015,false },
		{ -2313.1782,508.4811,32.6946,90.2333,false },
		{ -2359.5867,508.4946,29.1922,90.7839,false },
		{ -2368.9836,497.3732,29.6575,204.3149,false },
		{ -2355.2510,473.9119,30.3860,213.3216,false },
		{ -2316.6851,427.2902,34.7082,222.8189,false },
		{ -2273.3096,384.2819,34.1273,224.6743,false },
		{ -2254.6941,350.1685,32.7442,194.4391,false },
		{ -2251.6094,309.7397,34.8950,180.2096,false },
		{ -2251.6877,195.3397,34.8990,179.6038,false },
		{ -2251.7000,128.8629,34.8989,179.3383,true },
		{ -2253.8801,35.5451,34.8989,177.7829,false },
		{ -2256.1643,-59.0600,34.8990,179.2395,false },
		{ -2244.6753,-69.9421,34.9010,269.6390,false },
		{ -2177.2788,-70.3684,34.8990,269.6362,false },
		{ -2166.7937,-60.2136,34.8990,1.9906,false },
		{ -2167.0310,19.5618,34.8990,359.7838,false },
		{ -2154.9692,30.9976,34.8989,269.3515,false },
		{ -2039.4027,30.6849,34.8989,270.5603,false },
		{ -2015.8708,28.6844,32.5635,268.9476,false },
		{ -2006.5294,39.1167,32.3683,5.6438,false },
		{ -2006.3242,82.5576,27.2653,359.5096,false },
		{ -2006.5294,122.6947,27.2661,359.9373,false },
		{ -2006.7810,169.8751,27.2661,359.9256,true },
		{ -2006.3799,218.3348,27.3253,359.3422,false },
		{ -2003.6786,309.4407,34.6974,359.3848,false },
		{ -2004.0588,531.9494,34.7345,2.2248,false },
		{ -2001.2225,554.8347,34.7427,2.0925,false },
		{ -1998.8236,600.3096,34.7459,317.0739,false },
		{ -1990.0704,603.3956,34.7476,266.0866,false },
		{ -1926.6464,603.2603,34.7471,269.7628,false },
		{ -1884.6232,603.6719,34.7427,270.4125,false },
		{ -1802.8206,603.1974,34.3164,269.8653,false },
		{ -1746.6425,603.0662,24.5132,269.8516,false },
		{ -1733.0431,605.9640,24.4693,289.2858,false },
		{ -1721.7313,613.7571,24.4655,315.1400,false },
		{ -1714.3319,623.7473,24.4614,331.5250,false },
		{ -1711.8121,636.6095,24.4615,354.0617,false },
		{ -1711.7439,718.7028,24.4651,356.3728,false },
		{ -1700.7588,728.3370,24.3513,270.8891,false },
		{ -1640.8422,729.0236,14.2282,270.7816,false },
		{ -1621.9852,728.8625,14.1283,269.5514,false },
		{ -1578.7484,728.9432,7.1061,270.3205,false },
		{ -1555.5084,728.9760,6.7661,271.6584,false },
		{ -1544.5298,741.1289,6.7588,356.8006,false },
		{ -1535.2461,831.0377,6.7661,354.0173,false },
		{ -1554.5692,849.0602,6.7661,89.3218,false },
		{ -1625.8021,849.0693,7.2719,88.9712,false },
		{ -1677.0024,849.0575,24.4616,89.9973,false },
		{ -1729.6853,849.0728,24.4614,91.0982,false },
		{ -1765.5272,848.7965,24.4614,88.9699,true },
		{ -1805.9410,848.8857,24.5192,90.0901,false },
		{ -1850.6902,848.8127,34.7764,90.0887,false },
		{ -1909.0378,848.9353,34.7460,87.7066,false },
		{ -1972.6494,849.0251,44.9989,89.3020,false },
		{ -1989.3213,848.9572,45.0240,89.5629,false },
		{ -2001.6747,863.9585,45.0239,1.1540,false },
		{ -2002.0430,905.2873,45.0305,0.5234,false },
		{ -1988.3060,920.9753,45.0241,269.3149,false },
		{ -1972.1000,920.7822,44.9838,269.3163,false },
		{ -1909.3129,921.3041,34.7421,269.9446,false },
		{ -1855.1714,921.2524,34.7308,269.9447,false },
		{ -1816.1143,921.2158,24.5001,269.9388,false },
		{ -1780.4517,921.1797,24.4732,269.9406,false },
		{ -1735.9850,921.1343,24.4693,269.9406,true },
		{ -1664.4413,921.0605,24.4154,269.9406,false },
		{ -1615.0138,921.0112,7.2844,269.9382,false },
		{ -1537.8405,920.9307,6.7669,269.9419,false },
		{ -1528.1429,932.1646,6.7661,358.9273,false },
		{ -1534.8059,959.4367,6.7700,24.7043,false },
		{ -1556.5515,991.7336,6.7680,40.4440,false },
		{ -1581.4890,1024.4268,6.7661,25.7928,false },
		{ -1584.1587,1039.3999,6.7661,0.3578,false },
		{ -1584.3741,1157.3306,6.7746,0.1778,false },
		{ -1589.1344,1186.2632,6.7700,12.8489,false },
		{ -1608.8907,1221.0717,6.7661,40.0901,false },
		{ -1657.6198,1270.6442,6.7661,45.9184,false },
		{ -1693.7949,1306.9324,6.7661,44.7748,false },
		{ -1717.7255,1331.4230,6.7661,42.9256,true },
		{ -1739.3715,1352.0433,6.7661,46.6090,false },
		{ -1766.2998,1369.5570,6.7661,58.2306,false },
		{ -1789.6631,1378.1213,6.7661,80.7445,false },
		{ -1810.8490,1380.8221,6.7701,91.9917,false },
		{ -1835.5562,1376.7408,6.7661,105.4243,false },
		{ -1857.1674,1367.8810,6.7661,117.1814,false },
		{ -1874.9124,1353.5626,6.7661,132.1362,false },
		{ -1906.4778,1323.3754,6.7662,128.4775,false },
		{ -1932.2567,1310.1703,6.7661,95.1663,false },
		{ -1955.4321,1308.1923,6.7661,91.4343,false },
		{ -2008.6638,1308.2731,6.7661,88.2681,false },
		{ -2038.1747,1308.8784,6.9146,90.1525,false },
		{ -2053.1919,1291.7511,6.8877,145.8474,false },
		{ -2071.1008,1275.8553,9.5481,116.6955,false },
		{ -2085.7417,1274.4056,13.2046,91.1793,false },
		{ -2248.7112,1272.0918,40.7245,108.6834,false },
		{ -2270.7493,1251.6725,43.6025,153.8231,false },
		{ -2273.5168,1233.0244,46.3451,178.0604,false },
		{ -2266.7285,1198.7550,54.4750,192.8977,false },
		{ -2264.5955,1162.7566,55.8395,179.0921,false },
		{ -2264.9526,1100.9342,79.5832,179.9628,false },
		{ -2264.9917,1045.5576,83.4186,179.9620,false },
		{ -2264.9414,1011.9961,83.2617,179.2316,false },
		{ -2264.9312,965.8226,66.6383,179.3321,false },
		{ -2264.8499,863.7382,66.1676,179.5697,false },
		{ -2264.7822,816.4328,49.0827,179.7811,false },
		{ -2264.7654,640.4459,49.0024,179.8651,false },
		{ -2264.9229,575.6392,34.7444,179.8728,false }
	}
}
trainSpeedFast = 0.3
trainSpeedSlow = 0.1
trainMsPerCycle = 1000
trainMsStop = 20000
trainTickLast = -1
trainCoroutine = nil

thinkContentImgDrink = "images/think_drink.dds"
thinkContentImgFood = "images/think_food.dds"

loadedFaces = {}

webSiteHost = "http://ossmana3.bget.ru/mta/"
webAccountsTmp = {}

clanBaseConstructionTime = 120000
clanBaseSizes = {
	{ 16096, "очень маленькая", 0.0, -3.1, 0.0, -1.9, 5000 },
	{ 12925, "маленькая", -1.9, -7.8, 0.0, 0.0, 10000 },
	{ 10847, "средняя", 4.5, -11.8, -5.8, -6.4, 20000 },
	{ 13190, "большая", 1.8, -11.1, 0.9, -3.8, 40000 },
	{ 9260, "очень большая", 3.3, 10.1, -23.2, -5.2, 80000 }
}
clanBaseCars = { 492, 567, 405, 579 }
clanBases = {}
clanBaseCaptures = {}
clanBaseCaptureMinPlr = 3
clanBaseCaptureTimeSec = 300
clanBaseBusinesses = {}

queryQuestions = {
	{
		"Что бы вы больше хотели видеть в следующих обновлениях сервера?", 31, 1, 2017,
		{
			"Триатлон",
			"Функционал для домов",
			"Баскетбол",
			"Миссии и задания"
		}
	},
	{
		"От кого вы узнали о проекте Resplay?", 25, 2, 2018,
		{
			"Азот",
			"Брулёв",
			"FoxToUp",
			"Реактивный Гташник",
			"Milky",
			"От своего друга/знакомого",
			"Другое",
			"Дядябой",
			"Dimkfedorov",
			"Mishanya Channel",
			"Саня ГТАшник"
		}
	},
	{
		"От кого вы узнали о проекте Resplay?", 30, 4, 2018,
		{
			"Азот",
			"H1kH",
			"Андрюха Киевский",
			"Реактивный Гташник",
			"ZacK",
			"Линкер",
			"От своего друга/знакомого",
			"Другое"
		}
	}
}
queryMoneyForAnswer = 300
queryPeds = {
	{ 1808.3, -1911.8, 13.6, 90.0, nil },
	{ -1445.2, -275.5, 14.1, 205.0, nil },
	{ 1691.2, 1464.6, 10.8, 135.0, nil }
}

weaponsDropped = {}

reportsArray = {}
reportsCounter = 0

questionsArray = {}
questionsCounter = 0

groupVehicles = {
	[408] = { 11, 15 },
	[574] = { 11, 15 },
	[572] = { 11, 15 },
	[525] = { 11, 15  },
	[416] = { 4, 15 },
	[563] = { 4, 15 },
	[427] = { 2, 14, 17, 15 },
	[528] = { 2, 14, 17, 15 },
	[523] = { 2, 14, 17, 15 },
	[596] = { 2, 14, 17, 15 },
	[597] = { 2, 14, 17, 15 },
	[598] = { 2, 14, 17, 15 },
	[599] = { 2, 14, 17, 15 },
	[601] = { 2, 14, 17, 15 },
	[497] = { 2, 14, 17, 15 },
	[447] = { 2, 14, 17, 15 },
	[430] = { 2, 14, 17, 15 },
	[407] = { 3 },
	[544] = { 3 },
	[433] = { 5, 15 },
	[530] = { 5, 15 },
	[470] = { 5, 15 },
	[432] = { 5, 15 },
	[595] = { 5, 15 },
	[425] = { 5, 15 },
	[425] = { 5, 15 },
	[520] = { 5, 15 },
	[548] = { 5, 15 },
	[531] = { 8 },
	[532] = { 8 },
	[515] = { 9 },
	[459] = { 9 },
	[524] = { 9 },
	[499] = { 9 },
	[498] = { 9 },
	[414] = { 9 },
	[455] = { 9 },
	[428] = { 9 },
	[420] = { 9 },
	[438] = { 9 },
    [440] = { 9 },
	[553] = { 7 },
	[588] = { 16 },
	[448] = { 16 },
	[417] = { 7 },
	[413] = { 5, 15 },
	[490] = { 17, 15 },
    [488] = { 18, 15 },
	[582] = { 18, 15 }
}

pickupTextArray = {}

thinkBubbleLastTime = {}

payoutGroups = {
	[2] = { 90, 5 }, -- ПД
	[4] = { 70, 5 }, -- Медики
	[5] = { 90, 5 }, -- Вояки
	[17] = { 100, 5 }, -- ФБР
	[18] = { 100, 5 } -- СМИ
}

---выплаты\зарплаты----

payoutMults = { 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2 }
payoutTimers = {}
payoutAdminPerQuestion = 200

--чаты фракций-----
playerTeamChats = {
	[2] = { 2, 5, 15, 14, 17 },
	[4] = { 4, 15 },
	[5] = { 2, 5, 15, 14, 17 },
	[14] = { 2, 5, 14, 15, 17 },
	[15] = { 2, 4, 5, 15, 17, 18 },
	[17] = { 2, 5, 14, 15, 17 },
	[18] = { 18, 15 }
}

groupGateObjs = {}
groupGateControls = {}

killsWithoutReason = {}

weaponSlotLimits = {
	[0] = 200,
	[1] = 200,
	[2] = 1500,
	[3] = 80,
	[4] = 1500,
	[5] = 600,
	[6] = 50,
	[7] = 1000,
	[8] = 25,
	[9] = 1500,
	[10] = 200,
	[11] = 200,
	[12] = 200,
	[16] = 1
}

gangsterStealHouses = {}
gangsterStealPlayers = {}
gangsterStealProcTime = 1000
gangsterStealObjs = {}
gangsterStealContainers = {}
gangsterStealBots = {}
gangsterStealIdObjs = {
	[17]=true,
	[18]=true,
	[19]=true,
	[20]=true,
	[21]=true,
	[22]=true,
	[23]=true,
	[24]=true,
	[25]=true,
	[26]=true,
	[27]=true,
	[28]=true,
	[29]=true,
	[30]=true,
	[31]=true,
	[32]=true,
	[33]=true,
	[34]=true,
	[35]=true,
	[36]=true,
	[37]=true,
	[38]=true,
	[39]=true,
	[40]=true
}
gangsterStealIdContainers = {
	[2140]="шкаф",
	[1417]="шкаф",
	[2173]="ящики",
	[2025]="шкаф",
	[2200]="шкаф",
	[2576]="шкаф",
	[2204]="шкаф",
	[2306]="ящики",
	[2329]="ящики",
	[2328]="ящики",
	[1743]="ящики",
	[2206]="ящики",
	[2414]="ящики",
	[2021]="ящики",
	[2145]="шкаф",
	[1741]="ящики",
	[2166]="ящики"
}
gangsterStealCars = {}
gangsterStealCarPool = {}
gangsterStealCarEvacMarkers = {
	{ 1598.9, -1618.1, 12.4, nil, nil },
	{ -1634.4, 663.0, 7.2, nil, nil },
	{ 2256.3, 2444.9, 10, nil, nil }
}
gangsterStealCarSellMarkers = {
	{ 2735.9, -2554.5, 12.5, nil, nil, {} },
	{ -1713.5, 5.2, 2.4, nil, nil, {} },
	{ 1663.7, 709.6, 9.7, nil, nil, {} },
	{ 1643.2957, -1525.0303, 12.55945, nil, nil, {} },
    { 2200.5608, 2789.0969, 9.82031, nil, nil, {} },
    { -66.30653, -1120.9662, 0.07813, nil, nil, {} },
    { -1613.1677, 1285.3623, 6.18501, nil, nil, {} },
    { -2287.1643, 2283.3533, 3.97049, nil, nil, {} },
    { -386.28546, 2230.105, 41.35412, nil, nil, {} },
    { 1032.1553, 2343.542, 9.82031, nil, nil, {} },
    { 166.45851, -46.45441, 0.57813, nil, nil, {} },
    { -110.78185, 1128.4633, 18.74219, nil, nil, {} },
	{ 2735.0508, -2000.9172, 12.55469, nil, nil, {} }
}

criminalActivityZoneNum = 256
criminalActivityCrimesToActivate = 3
criminalActivityResetTime = 360000
criminalActivityProcTimeStep = 1000
criminalActivityZones = {}

specialEventSavePoints = {}

missions = {}

objsForSale = {}

commandSpam = {}

specStates = {}

fractionsOrig = {
	{ "Полицейский департамент San Andreas", 2 },
	{ "Полиция SF", 2 },
	{ "ФБР", 17 },
	{ "Пригородная полиция", 2 },
	{ "Медицинский департамент San Andreas", 4 },
	{ "Больница SF", 4 },
	{ "Больница LV", 4 },
	{ "Пригородная больница", 4 },
	{ "Национальная гвардия", 5 },
	{ "Армия SF", 5 },
	{ "Армия LV", 5 },
	{ "Армия Зона 69", 5 },
	{ "Полиция LS", 2 },
	{ "Полиция LV", 2 },
	{ "Больница LS", 2 },
	{ "СМИ", 18 }
}
fractions = {}
--------------требования на фракцию---------------
fractionGroupRPLevels = {
	[2] = 0.15,
	[4] = 0.05,
	[5] = 0.05,
	[17] = 0.3,
	[18] = 0.25
}

playerMoneySent = {}

vehicleNames = {
	--[411] = "SuperInfernus",
	--[400] = "MegaLandstalker",
	[604] = "Polaris V8",
	[466] = "Polaris_Turbo",
	[494] = "Deluxo",
	[528] = "FBI Cheetah",
	[469] = "Chopper",
	[556] = "Hellraiser"
}

_get_vehicle_name_from_model = getVehicleNameFromModel
function getVehicleNameFromModel(mdl)
	if mdl and vehicleNames[mdl] then
		return vehicleNames[mdl]
	else
		return _get_vehicle_name_from_model(mdl)
	end
end

_get_vehicle_name = getVehicleName
function getVehicleName(theVehicle)
	if not isElement(theVehicle) then
		return false
	end
	
	local mdl = getElementModel(theVehicle)
	mdl = getVehicleNameFromModel(mdl)
	
	if string.len(mdl) <= 0 then
		return false
	end
	
	return mdl
end

function resplayAddBan(banType, banKey, respPlayerName, reason, seconds)
	local xmlBanlist = xmlLoadFile("banlist.xml")
	
	if not xmlBanlist then
		xmlBanlist = xmlCreateFile("banlist.xml", "banlist")
		if not xmlBanlist then
			return false
		end
	end
	
	local curBans = xmlNodeGetChildren(xmlBanlist)
	local curTime = getRealTime().timestamp
	local banName, unbanTime
	
	for _,ban in ipairs(curBans) do
		banName = xmlNodeGetAttribute(ban, banType)
		unbanTime = xmlNodeGetAttribute(ban, "unban")
		
		if banName and(string.lower(banName) == string.lower(banKey)) and((not unbanTime) or (tonumber(unbanTime) > curTime)) then
			xmlUnloadFile(xmlBanlist)
			return false
		end
		
	end
	
	local newBan = xmlCreateChild(xmlBanlist, "ban")
	xmlNodeSetAttribute(newBan, banType, tostring(banKey))
	xmlNodeSetAttribute(newBan, "admin", tostring(respPlayerName))
	xmlNodeSetAttribute(newBan, "reason", tostring(reason))
	xmlNodeSetAttribute(newBan, "time", tostring(curTime))
	
	if(seconds > 0) then
		xmlNodeSetAttribute(newBan, "unban", tostring(curTime+seconds))
	end
	
	xmlSaveFile(xmlBanlist)
	xmlUnloadFile(xmlBanlist)
	local plr
	
	if(banType == "serial") then
		local allPlayers = getElementsByType("player")
		
		for _,curPlr in ipairs(allPlayers) do
			if banKey == getPlayerSerial(curPlr) then
				plr = curPlr
				break
			end
		end
		
	elseif(banType == "ip") then
		local allPlayers = getElementsByType("player")
		
		for _,curPlr in ipairs(allPlayers) do
			if banKey == getPlayerIP(curPlr) then
				plr = curPlr
				break
			end
		end
		
	
	else
		plr = getPlayerFromName(banKey)
	end
	
	if plr then
		kickPlayer(plr, respPlayerName, "Бан по причине '"..reason.."'")
	end
	
	if(seconds > 0) then
		addNewEventToLog(banKey, "Аккаунты - Бан("..string.upper(banType)..") - От "..tostring(respPlayerName).." на "..tostring(seconds).." секунд", true)
	
	else
		addNewEventToLog(banKey, "Аккаунты - Бан("..string.upper(banType)..") - От "..tostring(respPlayerName).." бессрочно", true)
	end
	
	return true
end

function resplayGetBan(banType, banKey)
	local xmlBanlist = xmlLoadFile("banlist.xml")
	
	if not xmlBanlist then
		return
	end
	
	local curBans = xmlNodeGetChildren(xmlBanlist)
	local banName, unbanTime
	
	for _,ban in ipairs(curBans) do
		banName = xmlNodeGetAttribute(ban, banType)
		unbanTime = xmlNodeGetAttribute(ban, "unban")
		
		if banName and(string.lower(banName) == string.lower(banKey)) and((not unbanTime) or (tonumber(unbanTime) > getRealTime().timestamp))  then
			local banInfo1, banInfo2, banInfo3, banInfo4 = xmlNodeGetAttribute(ban, "admin"), xmlNodeGetAttribute(ban, "reason"), xmlNodeGetAttribute(ban, "time"), xmlNodeGetAttribute(ban, "unban")
			xmlUnloadFile(xmlBanlist)
			return banInfo1, banInfo2, banInfo3, banInfo4
		end
		
	end
	
	xmlUnloadFile(xmlBanlist)
	return
end

function resplayGetAllBans(banType, banKey)
	local xmlBanlist = xmlLoadFile("banlist.xml")
	
	if not xmlBanlist then
		return {}
	end
	
	local curBans = xmlNodeGetChildren(xmlBanlist)
	local banName
	local banList = {}
	
	for _,ban in ipairs(curBans) do
		banName = xmlNodeGetAttribute(ban, banType)
		
		if banName and(string.lower(banName) == string.lower(banKey)) then
			local banTime = xmlNodeGetAttribute(ban, "unban")
			
			if banTime then
				banTime = tonumber(banTime) - tonumber(xmlNodeGetAttribute(ban, "time"))
				banTime = "на "..getTimeString(banTime*1000, "v", true)
			else
				banTime = "бессрочно"
			end
			
			local banAdmin = xmlNodeGetAttribute(ban, "admin")
			local banReason = xmlNodeGetAttribute(ban, "reason")
			table.insert(banList, banKey.." от "..banAdmin.." по причине '"..banReason.."' "..banTime)
		end
		
	end
	
	xmlUnloadFile(xmlBanlist)
	return banList
end

function resplayDelBan(banType, banKey, respPlayerName)
	local xmlBanlist = xmlLoadFile("banlist.xml")
	
	if not xmlBanlist then
		return false
	end
	
	local curBans = xmlNodeGetChildren(xmlBanlist)
	local curTime = getRealTime().timestamp
	local banName, unbanTime
	
	for _,ban in ipairs(curBans) do
		banName = xmlNodeGetAttribute(ban, banType)
		unbanTime = xmlNodeGetAttribute(ban, "unban")
		
		if banName and(string.lower(banName) == string.lower(banKey)) and((not unbanTime) or (tonumber(unbanTime) > curTime)) then
			xmlNodeSetAttribute(ban, "unban", tostring(curTime))
			addNewEventToLog(banKey, "Аккаунты - Досрочный разбан("..string.upper(banType)..") - От "..tostring(respPlayerName), true)
			xmlSaveFile(xmlBanlist)
			xmlUnloadFile(xmlBanlist)
			return true
		end
		
	end
	
	xmlUnloadFile(xmlBanlist)
	return false
end

_set_vehicle_engine_state = setVehicleEngineState
function setVehicleEngineState(veh, state)
	if isElement(veh) then
		local curState = getVehicleEngineState(veh)
		
		if(curState ~= state) then
			_set_vehicle_engine_state(veh, state)
		end
		
	end
end

_give_weapon = giveWeapon
function giveWeapon(thePlayer, weapon, ammo, setAsCurrent, skipSync)
	
	if forbiddenWeapons[weapon] then
		return true
	end
	local myAmmo = 30
	local mySetAsCurrent = false
	
	if ammo then
		myAmmo = ammo
	end
	
	if setAsCurrent then
		mySetAsCurrent = setAsCurrent
	end
	
	local weapSlot = getSlotFromWeapon(weapon)
	_give_weapon(thePlayer, weapon, myAmmo, mySetAsCurrent)
	local weapAmmo = getPedTotalAmmo(thePlayer, weapSlot)
	
	if(weaponSlotLimits[weapSlot] < weapAmmo) then
		takeWeapon(thePlayer, weapon, myAmmo)
		
		if not skipSync then
			syncClientWeaponData(thePlayer)
		end
		
		return false
	
	else
		if not skipSync then
			syncClientWeaponData(thePlayer)
		end
		
		return true
	end
	
end

_coroutine_resume = coroutine.resume
function coroutine.resume(...)
	local state,result = _coroutine_resume(...)
	
	if not state then
		outputDebugString(tostring(result), 1)	-- Output error message
	end
	
	return state,result
end

function getPlayerDefaultSpawn(plr)
	local shash = getHash(getPlayerName(plr))
	local spawnId = 0
	
	repeat
		local dbq = dbQuery(db, "SELECT city FROM users WHERE name=?", shash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		spawnId = dbqueryresult[1]["city"]
	end
	
	if(spawnId <= 0) then
		_, _, _, _, _, _, spawnId = getOutsideSpawn(spawnId)
		setOutsideSpawn(plr, spawnId)
	end
	
	return getOutsideSpawn(spawnId)
end

function getOutsideSpawn(curSpawnId)
	local spawnId
	
	if(curSpawnId > 0) then
		spawnId = curSpawnId
	
	else
		local playersPerSpawn = tonumber(get("playersPerSpawn"))
		
		if not playersPerSpawn then
			playersPerSpawn = 20
		
		else
			playersPerSpawn = math.max(1, math.floor(playersPerSpawn))
		end
		
		spawnId = outsideSpawnsCur
		
		if(outsideSpawnsIter >(playersPerSpawn-2)) then
			if(outsideSpawnsCur < table.getn(outsideSpawnsArray)) then
				outsideSpawnsCur = outsideSpawnsCur+1
			else
				outsideSpawnsCur = 1
			end
			
			outsideSpawnsIter = 0
		
		else
			outsideSpawnsIter = outsideSpawnsIter+1
		end
		
	end
	
	return outsideSpawnsArray[spawnId][1], outsideSpawnsArray[spawnId][2], outsideSpawnsArray[spawnId][3], outsideSpawnsArray[spawnId][4], outsideSpawnsArray[spawnId][5], outsideSpawnsArray[spawnId][6], spawnId
end

function setOutsideSpawn(plr, spawnid)
	if isElement(plr) then
		local pHash = getHash(getPlayerName(plr))
		return dbExec(db, "UPDATE users SET city=? WHERE name=?", spawnid, pHash)
	end
	
	return false
end

function getSectorByPoint(x, y)
	return math.floor((math.min(math.max(y, -3000.0), 3000.0)+3000.0)/300.0)*20+math.floor((math.min(math.max(x, -3000.0), 3000.0)+3000.0)/300.0)
end

function getColorName(r, g, b)
	local clrIdx = 0
	local clrDist = nil
	local curDist
	
	for i,clrname in ipairs(colorNames) do
		local cr = tonumber("0x"..string.sub(clrname["hex"], 1, 2))
		local cg = tonumber("0x"..string.sub(clrname["hex"], 3, 4))
		local cb = tonumber("0x"..string.sub(clrname["hex"], 5, 6))
		curDist = getDistanceBetweenPoints3D(cr, cg, cb, r, g, b)
		if(not clrDist) or (curDist < clrDist) then
			clrDist = curDist
			clrIdx = i
		end
	end
	
	return colorNames[clrIdx]["label"]
end

function isLeapYear(year)
    if year then year = math.floor(year)
    
	else year = getRealTime().year + 1900 end
    
	return((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

function getTimestamp(year, month, day, hour, minute, second)
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second
    
	for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
    
	for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    
	timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second
	timestamp = timestamp - 3600
   
    if datetime.isdst then timestamp = timestamp - 3600 end
    
	return timestamp
end

function derbyInit()
	for i,derby in ipairs(derbyStartMarkers) do
		-- arena, started, players, lobbyTimer, prize
		derbyCurrentInfo[i] = { derby[5], false, {}, nil, 0 }
	end
	setTimer(derbyLobbyUpdate, 1000, 0)
end

function derbyAddBet(derbyid, plr)
	addNewEventToLog(getPlayerName(plr), "Дерби - Установка ставки - ID "..tostring(derbyid), true)
	takeMoney(plr, derbyPrice)
	derbyCurrentInfo[derbyid][5] = derbyCurrentInfo[derbyid][5]+derbyPrice
end

function derbyRemoveBet(derbyid, plr)
	addNewEventToLog(getPlayerName(plr), "Дерби - Снятие ставки - ID "..tostring(derbyid), true)
	giveMoney(plr, derbyPrice)
	derbyCurrentInfo[derbyid][5] = derbyCurrentInfo[derbyid][5]-derbyPrice
end

function derbyWinBet(derbyid, plr)
	local winAmount = derbyCurrentInfo[derbyid][5]
	addNewEventToLog(getPlayerName(plr), "Дерби - Победа - ID "..tostring(derbyid), true)
	giveMoney(plr, winAmount)
	derbyCurrentInfo[derbyid][5] = 0
	triggerClientEvent(plr, "onServerMsgAdd", plr, string.format("Вы выиграли $%d в дерби.", winAmount))
end

function derbyNewPlayer(derbyid, plr)
	if not derbyCurrentInfo[derbyid][2] then
		if isPlayerBusy(plr) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете участвовать в дерби, пока не закончите остальные дела.")
		else
			local arenaInfo = derbyArenas[derbyCurrentInfo[derbyid][1]]
			
			if(table.getn(arenaInfo[9]) > table.getn(derbyCurrentInfo[derbyid][3])) then
				if(getMoney(plr) >= derbyPrice) then
					addNewEventToLog(getPlayerName(plr), "Дерби - Вступление - ID "..tostring(derbyid), true)
					derbyAddBet(derbyid, plr)
					table.insert(derbyCurrentInfo[derbyid][3], plr)
					addEventHandler("onPlayerQuit", plr, derbyPlayerLose, false)
					addEventHandler("onPlayerWasted", plr, derbyPlayerLose, false)
					addEventHandler("onDerbyLose", plr, derbyPlayerLose, false)
					local curPlayerCount = table.getn(derbyCurrentInfo[derbyid][3])
					
					if(table.getn(arenaInfo[9]) > curPlayerCount) then
						if(curPlayerCount == 1) then
							derbyCurrentInfo[derbyid][4] = setTimer(derbyStart, derbyStartTime, 1, derbyid)
							triggerClientEvent(getElementsByType("player"), "onServerMsgAdd", plr, "Началась регистрация на дерби. Место - "..arenaInfo[10]..". Старт через "..getTimeString(derbyStartTime, "v")..". Макс. кол-во участников - "..tostring(table.getn(arenaInfo[9]))..".")
						end
						local timeLeft = getTimerDetails(derbyCurrentInfo[derbyid][4])
						triggerClientEvent(plr, "onDerbyEnter", plr, { derbyCurrentInfo[derbyid][3], timeLeft })
						setCameraMatrix(plr, arenaInfo[3], arenaInfo[4], arenaInfo[5], arenaInfo[6], arenaInfo[7], arenaInfo[8])
						setElementInterior(plr, arenaInfo[2])
						setElementDimension(plr, derbyid)
						setElementPosition(plr, arenaInfo[3], arenaInfo[4], arenaInfo[5]+2.0)
						setElementFrozen(plr, true)
						toggleAllControls(plr, false, true, false)
					else
						derbyStart(derbyid)
					end
					
				else
					triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас недостаточно денег.")
				end
				
			end
		end
	end
end

function derbyPlayerLose()
	for derbyid,info in ipairs(derbyCurrentInfo) do
		for _,plr in ipairs(info[3]) do
			if(plr == source) then
				derbyRemovePlayer(derbyid, plr)
				
				if info[2] then
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы проиграли.")
					addNewEventToLog(getPlayerName(plr), "Дерби - Проигрыш - ID "..tostring(derbyid), true)
					
					if(table.getn(info[3]) == 1) then
						derbyRemovePlayer(derbyid, info[3][1])
					end
				end
				
			end
		end
	end
end

function derbyLobbyUpdate()
	if not derbyLobbyCoroutine then
		derbyLobbyCoroutine = coroutine.create(derbyLobbyUpdateCoroutine)
	end
	coroutine.resume(derbyLobbyCoroutine)
end

function derbyLobbyUpdateCoroutine()
	local timeLeft
	while true do
		for _,derby in ipairs(derbyCurrentInfo) do
			if(not derby[2]) and isTimer(derby[4]) then
				timeLeft = getTimerDetails(derby[4])
				
				for _,plr in ipairs(derby[3]) do
					triggerClientEvent(plr, "onDerbyLobbyUpdate", plr, { derby[3], timeLeft })
				end
				
			end
		end
		coroutine.yield()
	end
end

function derbyRemovePlayer(derbyid, plr)
	for i,racer in ipairs(derbyCurrentInfo[derbyid][3]) do
		if(racer == plr) then
			table.remove(derbyCurrentInfo[derbyid][3], i)
			removeEventHandler("onPlayerQuit", plr, derbyPlayerLose)
			removeEventHandler("onPlayerWasted", plr, derbyPlayerLose)
			removeEventHandler("onDerbyLose", plr, derbyPlayerLose)
			triggerClientEvent(plr, "onDerbyLeave", plr)
			local curPlayerCount = table.getn(derbyCurrentInfo[derbyid][3])
			
			if derbyCurrentInfo[derbyid][2] then
				local veh = getPedOccupiedVehicle(plr)
				
				if veh then
					local vx, vy, vz = getElementPosition(veh)
					createExplosion(vx, vy, vz, 11, plr)
					destroyElement(veh)
				end
				
				if(curPlayerCount == 0) then
					derbyFinish(derbyid, plr)
				end
			
			else
				derbyRemoveBet(derbyid, plr)
				
				if(curPlayerCount == 0) then
					if isTimer(derbyCurrentInfo[derbyid][4]) then
						killTimer(derbyCurrentInfo[derbyid][4])
					end
				end
				
			end
			
			toggleAllControls(plr, true, true, false)
			toggleControl(plr, "enter_exit", true)
			removePedFromVehicle(plr)
			setElementPosition(plr, derbyStartMarkers[derbyid][1], derbyStartMarkers[derbyid][2], derbyStartMarkers[derbyid][3]+1.0)
			setElementInterior(plr, 0)
			setElementDimension(plr, 0)
			setElementFrozen(plr, false)
			setCameraTarget(plr)
			break
		end
	end
end

function derbyStart(derbyid)
	if not derbyCurrentInfo[derbyid][2] then
		if(table.getn(derbyCurrentInfo[derbyid][3]) > 1) then
			derbyCurrentInfo[derbyid][2] = true
			setElementVisibleTo(derbyStartMarkers[derbyid][4], root, true)
			setElementVisibleTo(derbyStartMarkers[derbyid][4], root, false)
			local arenaInfo = derbyArenas[derbyCurrentInfo[derbyid][1]]
			local arenaPosition, veh
			local derbyVehicles = {}
			
			for i,plr in ipairs(derbyCurrentInfo[derbyid][3]) do
				triggerClientEvent(plr, "onDerbyStart", plr)
				arenaPosition = arenaInfo[9][i]
				toggleAllControls(plr, true, true, false)
				toggleControl(plr, "enter_exit", false)
				veh = createVehicle(arenaInfo[1], arenaPosition[1], arenaPosition[2], arenaPosition[3], 0, 0, arenaPosition[4])
				table.insert(derbyVehicles, veh)
				setElementInterior(veh, arenaInfo[2])
				setElementDimension(veh, derbyid)
				setElementFrozen(veh, true)
				setElementData(veh, "explodable", true)
				setElementInterior(plr, arenaInfo[2])
				setElementDimension(plr, derbyid)
				setElementFrozen(plr, false)
				warpPedIntoVehicle(plr, veh)
				addEventHandler("onVehicleDamage", veh, derbyVehicleDamage, false)
				setCameraTarget(plr)
				addNewEventToLog(getPlayerName(plr), "Дерби - Старт - ID "..tostring(derbyid), true)
			end
			
			--triggerClientEvent(derbyCurrentInfo[derbyid][3], "onAttachCarObjects", resourceRoot, derbyVehicles, derbyObjDef)
		else
			for i,plr in ipairs(derbyCurrentInfo[derbyid][3]) do
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Недостаточно игроков для старта дерби.")
				triggerEvent("onDerbyExit", plr)
			end
		end
	end
end

function derbyVehicleDamage(loss)
	local hp = getElementHealth(source)-loss
	
	if(hp < 250.0) then
		local plr = getVehicleOccupant(source)
		if plr then
			triggerEvent("onDerbyLose", plr)
		end
	end
end

function derbyGo()
	local veh = getPedOccupiedVehicle(source)
	
	if veh then
		setElementFrozen(veh, false)
	end
end

function derbyFinish(derbyid, winner)
	if derbyCurrentInfo[derbyid][2] then
		derbyCurrentInfo[derbyid][2] = false
		setElementVisibleTo(derbyStartMarkers[derbyid][4], root, true)
		
		for _,plr in ipairs(derbyCurrentInfo[derbyid][3]) do
			derbyRemovePlayer(derbyid, plr)
		end
		
		if isElement(winner) then
			triggerClientEvent(winner, "onDerbyWin", winner)
			derbyWinBet(derbyid, winner)
		end
	end
end

function isPlayerBusy(plr)
	for mId,mInfo in pairs(missions) do
		if mInfo["players"][plr] then
			return true
		end
	end
	
	if gangsterStealPlayers[plr] then
		return true
	end
	
	local cargo = getElementData(plr, "heaverCargo")
	
	if cargo then
		return true
	end
	
	local rc = getElementData(plr, "RC")
	
	if rc then
		return true
	end
	
	local jetpack = doesPedHaveJetPack(plr)
	
	if jetpack then
		return true
	end
	
	local lowrider = getElementData(plr, "lowrider")
	
	if lowrider then
		return true
	end
	
	for _,derby in ipairs(derbyCurrentInfo) do
		for _,racer in ipairs(derby[3]) do
			if(racer == plr) then
				return true
			end
		end
	end
	
	if availableRace then
		for _,racer in ipairs(availableRace[4]) do
			if(racer[1] == plr) then
				return true
			end
		end
	end
	
	for _,work in ipairs(jobWorkers) do
		for _,worker in ipairs(work) do
			if(worker[1] == plr) then
				return true
			end
		end
	end
	
	for _,cabin in ipairs(ferrisWheelCabins) do
		if(cabin[3] == plr) then
			return true
		end
	end
	
	return false
end

function heaverTakeCargo(plr, matchingDim)
	if matchingDim and(getElementType(plr) == "player") then
		if(not isPedInVehicle(plr)) and(getElementHealth(plr) > 0.0) then
			local cargo = getElementData(plr, "heaverCargo")
			
			if not cargo then
				if isPlayerBusy(plr) then
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы должны закончить остальные дела, прежде чем начать носить груз.")
				
				else
					jetpackOff(plr)
					cargo = createObject(2969, 0, 0, 0)
					setElementData(plr, "heaverCargo", cargo)
					setElementInterior(cargo, getElementInterior(plr))
					setElementDimension(cargo, getElementDimension(plr))
					setPedAnimation(plr, "CARRY", "liftup", -1, false, true, false, false)
					toggleControl(plr, "fire", false)
					toggleControl(plr, "crouch", false)
					toggleControl(plr, "jump", false)
					toggleControl(plr, "sprint", false)
					toggleControl(plr, "next_weapon", false)
					toggleControl(plr, "previous_weapon", false)
					toggleControl(plr, "enter_exit", false)
					setPedWeaponSlot(plr, 0)
					exports.bone_attach:attachElementToBone(cargo, plr, 12, 0.1, 0.1, 0, 270, 0, 0)
					
					for _,takeInfo in ipairs(heaverTakeMarkers) do
						setElementVisibleTo(takeInfo[4], plr, false)
					end
					
					for _,deliverInfo in ipairs(heaverDeliverMarkers) do
						setElementVisibleTo(deliverInfo[4], plr, true)
						setElementVisibleTo(deliverInfo[5], plr, true)
					end
					
					addNewEventToLog(getPlayerName(plr), "Разгрузка ящиков - Взял ящик - nil", true)
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Несите груз до ближайшей зеленой точки на радаре.")
				end
			end
			
		end
	end
end

function heaverProcess()
	if not heaverCoroutine then
		heaverCoroutine = coroutine.create(heaverProcessCoroutine)
	end
	coroutine.resume(heaverCoroutine)
end

function heaverProcessCoroutine()
	local players, cargo
	
	while true do
		players = getElementsByType("player")
		
		for _,plr in ipairs(players) do
			cargo = getElementData(plr, "heaverCargo")
			
			if cargo and(getElementHealth(plr) > 0.0) and(isPedOnGround(plr)) then
				if isPedInVehicle(plr) then
					heaverDestroyCargo(plr, cargo, false)
				else
					setPedAnimation(plr, "CARRY", "crry_prtial", 0, false, true, true)
				end
				
			elseif cargo and isElementInWater(plr) then
				heaverDestroyCargo(plr, cargo, false)
			end
		end
		coroutine.yield()
	end
end

function heaverDestroyCargo(plr, cargo, success)
	if cargo and isElement(cargo) then
		addNewEventToLog(getPlayerName(plr), "Разгрузка ящиков - Положил ящик - nil", success)
		setElementData(plr, "heaverCargo", nil)
		destroyElement(cargo)
		
		for _,deliverInfo in ipairs(heaverDeliverMarkers) do
			setElementVisibleTo(deliverInfo[4], plr, false)
			setElementVisibleTo(deliverInfo[5], plr, false)
		end
		
		for _,takeInfo in ipairs(heaverTakeMarkers) do
			setElementVisibleTo(takeInfo[4], plr, true)
		end
		
		if success then
			giveMoney(plr, heaverCargoPrice)
		end
		
		toggleControl(plr, "fire", true)
		toggleControl(plr, "crouch", true)
		toggleControl(plr, "jump", true)
		toggleControl(plr, "sprint", true)
		toggleControl(plr, "next_weapon", true)
		toggleControl(plr, "previous_weapon", true)
		toggleControl(plr, "enter_exit", true)
	end
end

function heaverDropCargo()
	setPedAnimation(source, "CARRY", "putdwn", -1, false, true, false, false)
	heaverDestroyCargo(source, getElementData(source, "heaverCargo"), false)
end

function heaverDeliverCargo(plr, matchingDim)
	if matchingDim and(getElementType(plr) == "player") then
		if(not isPedInVehicle(plr)) and(getElementHealth(plr) > 0.0) then
			local cargo = getElementData(plr, "heaverCargo")
			
			if cargo then
				setPedAnimation(plr, "CARRY", "putdwn", -1, false, true, false, false)
				heaverDestroyCargo(plr, cargo, true)
			end
		end
	end
end

function getNearbyElementsByType(plr, elemType, radius)
	if isElement(plr) then
		local players = getElementsByType(elemType)
		local px, py, pz = getElementPosition(plr)
		local pint = getElementInterior(plr)
		local pdim = getElementDimension(plr)
		local clearElements = {}
		
		for _,ePlr in ipairs(players) do
			if(ePlr ~= plr) and(getElementInterior(ePlr) == pint) and(getElementDimension(ePlr) == pdim)
			
			and(getDistanceBetweenPoints3D(px, py, pz, getElementPosition(ePlr)) < radius) then
				table.insert(clearElements, ePlr)
			end
			
		end
		
		return clearElements
	end
	
	return {}
end

function checkOldAccounts()
	dbQuery(checkOldAccounts2, db, "SELECT name,lastLogin FROM users")
end

function checkOldAccounts2(dbq)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	local curTime = getRealTime()
	curTime = curTime.timestamp
	local namesToDel = {}
	local lastLogin
	
	for _,line in ipairs(dbqueryresult) do
		if((curTime-line["lastLogin"]) > 15552000) then
			table.insert(namesToDel, line["name"])
		end
	end
	
	--dbQuery(checkOldAccounts3, {namesToDel}, db, "SELECT id,leader FROM gangs")
	dbQuery(checkOldAccounts4, {namesToDel}, db, "SELECT friend FROM friends")
end

function checkOldAccounts3(dbq, namesToDel)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	for _,nameToDel in ipairs(namesToDel) do
		for _,line in ipairs(dbqueryresult) do
			if(line["leader"] == nameToDel) then
				gangDestroy(line["id"])
				break
			end
		end
		
		addNewEventToLog(nameToDel, "Аккаунты - Удаление - Мёртвый аккаунт", dbExec(db, "DELETE FROM users WHERE name=?", namesToDel[i]))
	end
	
	dbQuery(checkOldAccounts4, {namesToDel}, db, "SELECT friend FROM friends")
end

function checkOldAccounts4(dbq, namesToDel)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	for _,nameToDel in ipairs(namesToDel) do
		for _,line in ipairs(dbqueryresult) do
			if(getHash(line["friend"]) == nameToDel) then
				triggerClientEvent(getElementsByType("player"), "onFriendDel", resourceRoot, line["friend"])
				dbExec(db, "DELETE FROM friends WHERE friend=?", line["friend"])
				break
			end
		end
	end
	
	loadHouses()
end

taxiCoroutine = nil

function jobTaxiSendClientInfo()
	if not taxiCoroutine then
		taxiCoroutine = coroutine.create(jobTaxiSendClientInfoCoroutine)
	end
	coroutine.resume(taxiCoroutine)
end

function jobTaxiSendClientInfoCoroutine()
	local taxiCars = {}
	
	while true do
		for _,worker in ipairs(jobWorkers[10]) do
			table.insert(taxiCars, { worker[3], worker[5] })
		end
		triggerClientEvent(getElementsByType("player"), "onPlayerTaxiCarsUpdate", resourceRoot, taxiCars)
		taxiCars = {}
		coroutine.yield()
	end
end

function jobTaxiSetTariff(tid, newTariff)
	local tariff = math.ceil(newTariff)
	local worker = jobWorkers[10][tid]
	
	if worker then
		if(tariff > jobTaxiPriceLimits[2]) or (tariff < jobTaxiPriceLimits[1]) then
			triggerClientEvent(worker[1], "onServerMsgAdd", worker[1], string.format("Тариф вашего такси не может быть больше $%d или меньше $%d.", jobTaxiPriceLimits[2], jobTaxiPriceLimits[1]))
		
		elseif worker[4] then
			triggerClientEvent(worker[1], "onServerMsgAdd", worker[1], "Вы не можете установить новый тариф, пока выполняете заказ.")
		
		else
			worker[5] = tariff
			addNewEventToLog(getPlayerName(worker[1]), "Такси - Установка тарифа - $"..tostring(tariff), true)
			triggerClientEvent(worker[1], "onServerMsgAdd", worker[1], string.format("Ваш новый тариф - $%d за поездку.", tariff))
		end
		
	end
end

function jobTaxiOnWasted()
	addNewEventToLog(getPlayerName(source), "Такси - Завершение - Погиб", true)
	removeWorker(10, source, 2)
end

function jobTaxiBlowedUp()
	for _,worker in ipairs(jobWorkers[10]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Такси - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobTaxiMoneyForBlowedCar)
			removeWorker(10, worker[1], 4)
		end
	end		
end

function jobTaxiLeftVehicle()
	takeMoney(source, jobTaxiMoneyForLeftCar)
	addNewEventToLog(getPlayerName(source), "Такси - Завершение - Покинул транспорт", true)
	removeWorker(10, source, 3)
end

function jobTaxiNowInVehicle(state)
	jobTaxiSetState(source, state)
end

function jobTaxiSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[10]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then 
					for _,cp in ipairs(jobTaxiCpsFinish) do
						setElementVisibleTo(cp[4], worker, true)
					end
				
				elseif(state == 3) then
					for _,cp in ipairs(jobTaxiCpsFinish) do
						setElementVisibleTo(cp[4], worker, false)
					end
				end
				
				jobWorkers[10][i][2] = state
				break
			end
		end		
	end		
end

function jobTaxiOrder(orderer, place)
	addNewEventToLog(getPlayerName(orderer), "Такси - Вызов - "..place, true)
	local taxiMsg = string.format(generateTimeString().."[Такси] %s вызывает такси. Местоположение: %s.", getPlayerName(orderer), place)
	local ox,oy,oz = getElementPosition(orderer)
	local tx,ty,tz,tint,tdim
	local taxiCount = 0
	
	for _,worker in ipairs(jobWorkers[10]) do
		tx,ty,tz = getElementPosition(worker[1])
		tint = getElementInterior(worker[1])
		tdim = getElementDimension(worker[1])
		
		if(getDistanceBetweenPoints3D(ox,oy,oz,tx,ty,tz) < 2400) and(tdim == getElementDimension(orderer)) and(tint == getElementInterior(orderer)) then
			outputChatBox(taxiMsg, worker[1], 255, 255, 0, false)
			triggerClientEvent(worker[1], "onTaxiOrderCreate", worker[1], ox, oy, oz)
			taxiCount = taxiCount+1
		end
	end
	
	if(taxiCount > 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, string.format("Ваш заказ такси разослан %d таксистам.", taxiCount))
	
	elseif(taxiCount == 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Ваш заказ такси разослан 1 таксисту.")
	
	else
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Такси поблизости отсутствует.")
	end
end

function jobTaxiNewClient(client, seat)
	if(seat == 1) then
		local tid = nil
		
		for i,worker in ipairs(jobWorkers[10]) do
			if(source == worker[3]) then
				if not worker[4] then
					tid = i
				end
				break
			end
		end
		
		if tid then
			local cmoney = getMoney(client)
			
			if(cmoney < jobWorkers[10][tid][5]) then
				jobTaxiDeclineClient(client)
				triggerClientEvent(client, "onServerMsgAdd", source, string.format("У вас недостаточно денег. Тариф этого такси - $%d за поездку.", jobWorkers[10][tid][5]))
			else
				triggerClientEvent(client, "onTaxiUse", source)
			end
			
		end
		
	end
end

function jobTaxiCountPrice()
	for i,worker in ipairs(jobWorkers[10]) do
		if worker[4] then
			
		end
	end
end

function jobTaxiAcceptClient(client, destx, desty, destz)
	local tid = nil
	
	for i,worker in ipairs(jobWorkers[10]) do
		if(source == worker[3]) then
			if not worker[4] then
				tid = i
			end
			break
		end
		
	end
	
	if tid then
		jobWorkers[10][tid][4] = client
		triggerClientEvent(client, "onServerMsgAdd", source, string.format("Вы воспользовались такси. Тариф этого такси - $%d за поездку.", jobWorkers[10][tid][5]))
		setVehicleTaxiLightOn(jobWorkers[10][tid][3], false)
		addEventHandler("onVehicleExit", jobWorkers[10][tid][3], jobTaxiFinishClient)
		
		if destx then
			triggerClientEvent(jobWorkers[10][tid][1], "onTaxiCreateMarker", client, destx, desty, destz)
		end
		
	end
end

function jobTaxiDeclineClient(client)
	if(isPedInVehicle(client)) then
		local cx, cy, cz = getElementPosition(client)
		removePedFromVehicle(client)
		setElementPosition(client, cx, cy, cz+1.0)
	end
end

function jobTaxiFinishClient(client)
	for key,worker in ipairs(jobWorkers[10]) do
		if(worker[4] == client) then
			jobTaxiRemoveClient(key, true)
			break
		end
	end
end

function jobTaxiRemoveClient(tid, success)
	local client = jobWorkers[10][tid][4]
	if client then
		addNewEventToLog(getPlayerName(client), "Такси - Использование - "..getPlayerName(jobWorkers[10][tid][1]), success)
		addNewEventToLog(getPlayerName(jobWorkers[10][tid][1]), "Такси - Перевозка - "..getPlayerName(client), success)
		removeEventHandler("onVehicleExit", jobWorkers[10][tid][3], jobTaxiFinishClient)
		
		if isPedInVehicle(client) then
			local cx, cy, cz = getElementPosition(jobWorkers[10][tid][3])
			removePedFromVehicle(client)
			setElementPosition(client, cx, cy, cz+1.0)
		end
		
		if success then
			local serviceId = getElementData(jobWorkers[10][tid][1], "usergroup")
			
			if serviceId and serviceRegister(client, jobWorkers[10][tid][1], serviceId) then
				local respect = getElementData(jobWorkers[10][tid][1], "respect")
				respectSet(jobWorkers[10][tid][1], respect+0.000006, -1.0, 0.55, true)
			end
			
			local price = jobWorkers[10][tid][5]
			giveMoney(jobWorkers[10][tid][1], price)
			takeMoney(client, price)
			triggerClientEvent(client, "onServerMsgAdd", client, string.format("Вами было уплачено $%d за поездку.", price))
		end
		
		jobWorkers[10][tid][4] = nil
		triggerClientEvent(jobWorkers[10][tid][1], "onTaxiRemoveMarker", client, destx, desty, destz)
		triggerClientEvent(client, "onTaxiRemoveMarker", client, destx, desty, destz)
		setVehicleTaxiLightOn(jobWorkers[10][tid][3], true)
	end
end

function botCorrectRotation()
	if not botCoroutine then
		botCoroutine = coroutine.create(botCorrectRotationCoroutine)
	end
	coroutine.resume(botCoroutine)
end

function botCorrectRotationCoroutine()
	while true do
		--[[
		local bot
		for i,botobj in ipairs(botObjs) do
			botsCounter = botsCounter+1
			if(botsCounter > 50) then
				coroutine.yield()
				botsCounter = 0
			end
			bot = bots[math.ceil(i/table.getn(eatLocations))]
			setElementRotation(botobj, 0, 0, bot[5], "default", true)
			setPedAnimation(botobj, bot[6], bot[7], -1, true, false, false, false)
		end
		]]
		
		for _,tut in ipairs(tutorialPositions) do
			setElementRotation(tut[6], 0, 0, tut[5], "default", true)
			setPedAnimation(tut[6], "KISSING", "gfwave2", -1, true, false, false, false)
		end
		
		for _,que in ipairs(queryPeds) do
			setElementRotation(que[5], 0, 0, que[4], "default", true)
			setPedAnimation(que[5], "CASINO", "cards_loop", -1, true, false, false, false)
		end
		coroutine.yield()
	end
end

local debugLawnmows = {}

function debugLawnmowsInit()
	for i=1,table.getn(jobLawnmowLawnCoords) do
		for i2=1,table.getn(jobLawnmowLawnCoords[i][4]) do
			triggerClientEvent("onLawnmowDebugNew", root, jobLawnmowLawnCoords[i][4][i2][1], jobLawnmowLawnCoords[i][4][i2][2], jobLawnmowLawnCoords[i][4][i2][3], i, i2)
		end
	end
end

function militaryGeneralNew()
	if(militaryGeneralInfoId == 0) then
		local i = math.random(table.getn(militaryGeneralInfo))
		militaryGeneralInfoId = i
		militaryGeneralCar = createVehicle(militaryGeneralCarMdl, militaryGeneralInfo[i][1], militaryGeneralInfo[i][2], militaryGeneralInfo[i][3], militaryGeneralInfo[i][4], militaryGeneralInfo[i][5], militaryGeneralInfo[i][6])
		setElementFrozen(militaryGeneralCar, true)
		setElementData(militaryGeneralCar, "explodable", true)
		setVehicleDamageProof(militaryGeneralCar, true)
		addEventHandler("onVehicleEnter", militaryGeneralCar, militaryGeneralCarEnter)
		militaryGeneralPed = createPed(militaryGeneralPedMdl, 0, 0, 0, 0, false)
		setElementData(militaryGeneralPed, "godmode", true)
		warpPedIntoVehicle(militaryGeneralPed, militaryGeneralCar, 3)
		militaryGeneralPedBlip = createBlip(0, 0, 0, 60, 2, 255, 255, 255, 255, 32766)
		attachElements(militaryGeneralPedBlip, militaryGeneralCar)
		setElementVisibleTo(militaryGeneralPedBlip, root, false)
	end
end

function militaryGeneralCarEnter(plr, seat)
	if(seat == 0) then
		addWorker(9, plr)
	end
end

function militaryGeneralDead()
	for _,worker in ipairs(jobWorkers[9]) do
		if(worker[3] == source) then
			local cx, cy, cz = getElementPosition(source)
			local curCol = createColSphere(cx, cy, cz, 150)
			local allPlayers = getElementsWithinColShape(curCol)
			local gangsters = {}
			destroyElement(curCol)
			curCol = nil
			local pGrp
			
			for _,plr in ipairs(allPlayers) do
				pGrp = getElementData(plr, "usergroup")
				
				if(pGrp == 10) then
					table.insert(gangsters, plr)
				end
			end
			
			pGrp = nil
			allPlayers = nil
			triggerClientEvent(gangsters, "onServerMsgAdd", resourceRoot, "Деньги за генерала появились на месте взрыва его машины.")
			setTimer(createMoney, 1000, 1, cx, cy, cz, 2000, 1210)
			addNewEventToLog(getPlayerName(worker[1]), "Военный - Перевозка генерала - Взрыв транспорта", true)
			removeWorker(9, worker[1], 4)
			
			break
		end
	end
end

function militaryGeneralWasted()
	addNewEventToLog(getPlayerName(source), "Военный - Перевозка генерала - Погиб", true)
	removeWorker(9, source, 2)
end

function militaryGeneralLeftVehicle()
	takeMoney(source, 100)
	addNewEventToLog(getPlayerName(source), "Военный - Перевозка генерала - Покинул транспорт", true)
	removeWorker(9, source, 3)	
end

function militaryGeneralNowInVehicle(state)
	militaryGeneralSetState(source, state)
end

function militaryGeneralTimesup(plr)
	if(source == resourceRoot) and(plr == client) then
		militaryGeneralArrive(plr, false)
	end
end

function militaryGeneralSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[9]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					setElementVisibleTo(militaryGeneralTargetMarker, worker, true)
					setElementVisibleTo(militaryGeneralTargetBlip, worker, true)
				
				elseif(state == 3) then
					setElementVisibleTo(militaryGeneralTargetMarker, worker, false)
					setElementVisibleTo(militaryGeneralTargetBlip, worker, false)
				end
				
				jobWorkers[9][i][2] = state
				break
			end
		end	
	end	
end

function militaryGeneralArrive(plr, success)
	local i = militaryGeneralInfoId
	triggerClientEvent(plr, "onMilitaryGeneralArrive", plr)
	setElementPosition(militaryGeneralTargetMarker, militaryGeneralInfo[i][1], militaryGeneralInfo[i][2], militaryGeneralInfo[i][3]-1.0)
	setElementPosition(militaryGeneralTargetBlip, militaryGeneralInfo[i][1], militaryGeneralInfo[i][2], militaryGeneralInfo[i][3]-1.0)
	setMarkerSize(militaryGeneralTargetMarker, 5.0)
	militaryGeneralArrived = true
	addNewEventToLog(getPlayerName(plr), "Военный - Перевозка генерала - Высадка", success)
	
	if success then
		destroyElement(militaryGeneralPedBlip)
		destroyElement(militaryGeneralPed)
		militaryGeneralPedBlip = nil
		militaryGeneralPed = nil
	end
	
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Верните автомобиль на базу.")
end

function militaryGeneralFinish(plr, success)
	addNewEventToLog(getPlayerName(plr), "Военный - Перевозка генерала - Завершение", success)
	
	if success then
		giveMoney(plr, 2000)
		local respect = getElementData(plr, "respect")
		respectSet(plr, respect+0.000027, -1.0, 1.0, true)
		removeWorker(9, plr, 1)
	
	else
		removeWorker(9, plr, 5)
	end
end

function militaryCargoGetBoxCount(infoId)
	return militaryCargoInfo[infoId][22]
end

function militaryCargoGetBoxMax(infoId)
	return militaryCargoInfo[infoId][21]
end

function militaryCargoUpdateBoxCount(infoId, delta)
	local newNum = math.min(militaryCargoInfo[infoId][21], math.max(0, militaryCargoInfo[infoId][22]+delta))
	local boxesObj = militaryCargoInfo[infoId][20]
	local boxesVisible = (newNum > 0)
	
	if boxesVisible then
		local sx,sy,sz = militaryCargoInfo[infoId][5],militaryCargoInfo[infoId][6],militaryCargoInfo[infoId][7]
		local ex,ey,ez = militaryCargoInfo[infoId][8],militaryCargoInfo[infoId][9],militaryCargoInfo[infoId][10]
		local mult = newNum/militaryCargoInfo[infoId][21]
		setElementPosition(boxesObj, ex+ (sx-ex)*mult, ey+ (sy-ey)*mult, ez+ (sz-ez)*mult)
		setElementAlpha(boxesObj, 255)
	
	else
		setElementAlpha(boxesObj, 0)
	end
	
	militaryCargoInfo[infoId][22] = newNum
	setElementCollisionsEnabled(boxesObj, boxesVisible)
end

function militaryCargoTake(hitElem)
	if(getElementType(hitElem) == "vehicle") and(getElementModel(hitElem) == 530) then
		if not militaryCargoBoxes[hitElem] then
			local driver = getVehicleController(hitElem)
			
			if driver then
				local driverGrp = getElementData(driver, "usergroup")
				
				if driverGrp and(driverGrp == 5) then
					local cargoInfoId
					
					for i,cargo in ipairs(militaryCargoInfo) do
						if(cargo[17] == source) then
							cargoInfoId = i
							break
						end
					end
					
					if(militaryCargoGetBoxCount(cargoInfoId) > 0) then
						local cargo = militaryCargoInfo[cargoInfoId]
						setElementData(hitElem, "cargoSrc", cargoInfoId, false)
						militaryCargoBoxes[hitElem] = createObject(1558, 0, 0, 0)
						setElementCollisionsEnabled(militaryCargoBoxes[hitElem], false)
						addEventHandler("onVehicleExplode", hitElem, militaryCargoExplodeExit)
						addEventHandler("onVehicleExit", hitElem, militaryCargoExplodeExit)
						setElementVisibleTo(cargo[18], driver, true)
						setElementVisibleTo(cargo[19], driver, true)
						triggerClientEvent(getElementsByType("player"), "onMilitaryCargoUpdate", driver, militaryCargoBoxes)
						militaryCargoUpdateBoxCount(cargoInfoId, -1)
						addNewEventToLog(getPlayerName(driver), "Военный - Груз - Подбор", true)
					
					else
						triggerClientEvent(driver, "onServerMsgAdd", driver, "Груз кончился.")
					end
				end
			end
		end
	end
end

function militaryCargoExplodeExit(driver)
	if driver then
		local cargoInfoId = getElementData(source, "cargoSrc")
		
		if cargoInfoId then
			local cargo = militaryCargoInfo[cargoInfoId]
			setElementVisibleTo(cargo[18], driver, false)
			setElementVisibleTo(cargo[19], driver, false)
		end
		addNewEventToLog(getPlayerName(driver), "Военный - Груз - Взрыв", true)
	end
	
	local dx, dy, dz = getElementPosition(source)
	militaryCargoRemove(source)
	inventoryCreateDroppedItem(1558, source, dx, dy, dz, 10)
	triggerClientEvent(getElementsByType("player"), "onMilitaryCargoUpdate", resourceRoot, militaryCargoBoxes)
end

function militaryCargoRemove(hitElem)
	removeEventHandler("onVehicleExplode", hitElem, militaryCargoExplodeExit)
	removeEventHandler("onVehicleExit", hitElem, militaryCargoExplodeExit)
	local driver = getVehicleController(hitElem)
	
	if driver then
		local cargoInfoId = getElementData(hitElem, "cargoSrc")
		
		if cargoInfoId then
			local cargo = militaryCargoInfo[cargoInfoId]
			setElementVisibleTo(cargo[18], driver, false)
			setElementVisibleTo(cargo[19], driver, false)
		end
	end
	
	destroyElement(militaryCargoBoxes[hitElem])
	militaryCargoBoxes[hitElem] = nil
	removeElementData(hitElem, "cargoSrc")
end

function militaryCargoDeliver(hitElem)
	if militaryCargoBoxes[hitElem] then
		local driver = getVehicleController(hitElem)
		
		if driver and isElementVisibleTo(source, driver) then
			addNewEventToLog(getPlayerName(driver), "Военный - Груз - Разгрузка", true)
			militaryCargoRemove(hitElem)
			giveMoney(driver, 35)
			local respect = getElementData(driver, "respect")
			respectSet(driver, respect+0.0000035, -1.0, 1.0, true)
			triggerClientEvent(getElementsByType("player"), "onMilitaryCargoUpdate", driver, militaryCargoBoxes)
		end
	end
end

function militaryBasesProcess()
	if not militaryBasesCoroutine then
		militaryBasesCoroutine = coroutine.create(militaryBasesProcessCoroutine)
	end
	coroutine.resume(militaryBasesCoroutine)
end

function militaryBasesProcessCoroutine()
	local playersInZone, playerGrp, enableAlarm, cityName
	while true do
		
		for i=1,table.getn(militaryBases) do
			playersInZone = getElementsWithinColShape(militaryBases[i][11], "player")
			enableAlarm = false
			
			for _,playerInZone in ipairs(playersInZone) do
				playerGrp = getElementData(playerInZone, "usergroup")
				
				if not (playerGrp and((playerGrp == 5) or (playerGrp == 2) or (playerGrp == 14) or (playerGrp == 17) or isAdmin(playerInZone) or isModerator(playerInZone))) then
					local _,_,zCoord = getElementPosition(playerInZone)
					
					if(zCoord >= militaryBases[i][9]) and(zCoord <= militaryBases[i][10]) then
						enableAlarm = true
						
						if getElementData(playerInZone, "RC") then
							rcDestroy(playerInZone)
							enableAlarm = false
						
						elseif not militaryBases[i][12] then
							cityName = getCityNameFromId(i)
							addNewEventToLog(getPlayerName(playerInZone), "Военная база - Проникновение - "..cityName, true)
							criminalActivityRegisterCrime(criminalActivityGetPlayerZoneIndex(playerInZone))
							wantedLevelInc(playerInZone)
							--triggerClientEvent(playerInZone, "onServerMsgAdd", playerInZone, "Вас объявили в розыск за проникновение на военную базу.")
						end
					end
				end
				
			end
			--militaryBaseAlarm(i, enableAlarm) -- Тревога на базе
		end
		coroutine.yield()
	end
end

function militaryBasesFixVeh(hitElem)
	if(getElementType(hitElem) == "vehicle") then
		local driver = getVehicleController(hitElem)
		if driver then
			local driverGrp = getElementData(driver, "usergroup")
			
			if driverGrp and(driverGrp == 5) then
				fixVehicle(hitElem)
				addNewEventToLog(getPlayerName(driver), "Военная база - Починка транспорта - nil", true)
				setElementData(hitElem, "fuelLevel", 1.0)
				local cx, cy, cz = getElementPosition(hitElem)
				local curCol = createColSphere(cx, cy, cz, 150)
				triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onServerPlaySFX3D", driver, "script", 150, 0, 0, 0, 0, false, 100, hitElem)
				destroyElement(curCol)
			end
			
		end
	end
end

function militaryBaseAlarm(baseid, enabled)
	if not (militaryBases[baseid][12] == enabled) then
		militaryBases[baseid][12] = enabled
	end
	local ax, ay, az = (militaryBases[baseid][3]+militaryBases[baseid][5])/2.0,(militaryBases[baseid][4]+militaryBases[baseid][6])/2.0,(militaryBases[baseid][9]+militaryBases[baseid][10])/2.0
	triggerClientEvent(getElementsByType("player"), "onMilitaryBaseAlarm", resourceRoot, baseid, enabled, ax, ay, az)
end

function getCityNameFromId(cityid)
	if(cityid == 1) then
		return "Los Santos"
	
	elseif(cityid == 2) then
		return "San Fierro"
	
	elseif(cityid == 3) then
		return "Las Venturas"
	end
	
	return "Город неизвестен"
end

function setPickupText(pup, text, r, g, b)
	local pupinfo = { text, r, g, b }
	pickupTextArray[pup] = pupinfo
	triggerClientEvent(getElementsByType("player"), "onPickupTextUpdate", resourceRoot, pup, pupinfo)
end

function removePickupText(pup)
	pickupTextArray[pup] = nil
	triggerClientEvent(getElementsByType("player"), "onPickupTextUpdate", resourceRoot, pup, nil)
end

function createMoney(x, y, z, amount, mdl)
	local moneyPickupMdl
	
	if mdl then
		moneyPickupMdl = mdl
	else
		moneyPickupMdl = 1212
	end
	
	local money = createPickup(x, y, z, 3, moneyPickupMdl, 60000, amount)
	setElementData(money, "moneyAmount", amount, false)
	setPickupText(money, "$"..tostring(amount), 18, 130, 46)
	addEventHandler("onPickupUse", money, moneyPickedUp)
	return money
end

function moneyPickedUp(plr)
	giveMoney(plr, getElementData(source, "moneyAmount"))
	removeEventHandler("onPickupUse", source, moneyPickedUp)
	destroyElement(source)
end

function otbRespawnMachines()
	for key,otbLocation in ipairs(otbLocations) do
		
		for _,otb in ipairs(otbLocation[7]) do
			if(isElement(otb)) then
				destroyElement(otb)
			end
		end
		
		otbLocations[key][7] = {}
		local otbId = otbLocation[1]
		
		for i2=1,table.getn(otbInts[otbId][6]) do
			table.insert(otbLocation[7], createObject(2754, otbInts[otbId][6][i2][1], otbInts[otbId][6][i2][2], otbInts[otbId][6][i2][3], otbInts[otbId][6][i2][4], otbInts[otbId][6][i2][5], otbInts[otbId][6][i2][6]))
			setElementInterior(otbLocation[7][i2], otbInts[otbId][5])
			setElementDimension(otbLocation[7][i2], key)
		end
		
	end
end

function otbPreStart()
	triggerClientEvent(getElementsByType("player"), "onServerMsgAdd", resourceRoot, "Лотерея '50 к 1' начнется через два игровых часа. Вы можете купить билет в букмекерской конторе.")
end

function otbStart()
	local winNum = math.random(50)
	local winSum = math.floor(otbFund*0.9)
	
	for key,plr in pairs(otbTickets) do
		if isElement(plr) then
			if(key == winNum) then
				addNewEventToLog(getPlayerName(plr), "Букмекерская контора - Выигрыш - $"..tostring(winSum), true)
				triggerClientEvent(plr, "onServerMsgAdd", plr, string.format("Вы выиграли в лотерее. Ваш выигрыш составил $%d.", winSum))
				triggerClientEvent(plr, "onOtbWin", plr)
				giveMoney(plr, winSum)
			
			else
				addNewEventToLog(getPlayerName(plr), "Букмекерская контора - Проигрыш - nil", true)
				triggerClientEvent(plr, "onServerMsgAdd", plr, string.format("Лотерея разыграна. Выигрышный номер - %d.", winNum))
			end
			
		end
	end
	
	otbTickets = {}
	otbFund = 0
	setTimer(otbPreStart, 1320000, 1)
	setTimer(otbStart, 1440000, 1)
end

function gangsterKillOrderNew(killPlr, killPrice, killOrderer)
	local kName = getPlayerName(killPlr)
	
	if gangsterKillOrders[kName] then
		gangsterKillOrders[kName] = gangsterKillOrders[kName]+killPrice
	else
		gangsterKillOrders[kName] = killPrice
	end
	
	if isElement(killOrderer) then
		takeMoney(killOrderer, killPrice)
		addNewEventToLog(getPlayerName(killOrderer), "Цена за голову - Назначение - $"..tostring(killPrice).." за "..getPlayerName(killPlr), true)
		addNewEventToLog(getPlayerName(killPlr), "Цена за голову - Получение - $"..tostring(killPrice).." от "..getPlayerName(killOrderer), true)
		triggerClientEvent(killOrderer, "onServerMsgAdd", killOrderer, string.format("Вы назначили цену $%d за голову игрока %s. Текущая цена - $%d.", killPrice, kName, gangsterKillOrders[kName]))
		triggerClientEvent(killPlr, "onServerMsgAdd", killPlr, string.format("Игрок назначил за вашу голову награду $%d. Текущая цена - $%d.", killPrice, gangsterKillOrders[kName]))
	
	else
		addNewEventToLog(getPlayerName(killPlr), "Цена за голову - Получение - $"..tostring(killPrice).." от анонима", true)
		triggerClientEvent(killPlr, "onServerMsgAdd", killPlr, string.format("Неизвестный человек назначил за вашу голову награду $%d. Текущая цена - $%d.", killPrice, gangsterKillOrders[kName]))
	end
	
	if isTimer(gangsterKillOrderRandomTimer) then
		killTimer(gangsterKillOrderRandomTimer)
	end
	
	gangsterKillOrderRandomTimer = setTimer(gangsterKillOrderRandomProc, 720000, 0)
end

function gangsterKillOrderRandomSort(a, b)
	local bgngstr = (getElementData(b, "usergroup") == 10)
	
	if((getElementData(a, "usergroup") == 10) ~= bgngstr) then
		return bgngstr
	
	else
		return getPlayerMoney(a) > getPlayerMoney(b)
	end
	
end

function gangsterKillOrderRandomProc()
	local players = getElementsByType("player")
	if(table.getn(players) >= 20) then
		local pName, pRespect, pUserGrp
		--table.sort(players, gangsterKillOrderRandomSort)
		
		for _,plr in ipairs(players) do
			pUserGrp = getElementData(plr, "usergroup")
			
			if pUserGrp and(getElementData(plr, "usergroup") == 10) then
				pRespect = (getElementData(plr, "respect"))
				
				if getElementData(plr, "spawned") and(getPlayerMoney(plr) >= 5000) and((pRespect >= 0.05) or (pRespect <= -0.0001)) then
					pName = getPlayerName(plr)
					
					if not gangsterKillOrderRandoms[pName] then
						gangsterKillOrderNew(plr, math.random(2, 10)*100)
						gangsterKillOrderRandoms[pName] = true
						break
					end
					
				end
				
			end
			
		end
		
	end
end

function ferrisWheelMove()
	local targetPointId
	
	for i,cabin in ipairs(ferrisWheelCabins) do
		targetPointId = cabin[2]+1
		
		if(targetPointId > table.getn(ferrisWheelPath)) then
			targetPointId = 1
		end
		
		ferrisWheelCabins[i][2] = targetPointId
		moveObject(cabin[1], ferrisWheelMoveTime, ferrisWheelPath[targetPointId][1], ferrisWheelPath[targetPointId][2], ferrisWheelPath[targetPointId][3])
	end
	
	setTimer(ferrisWheelMove, ferrisWheelMoveTime, 1)
end

function saveHouseSet(plr, hid)
	local sHash = getHash(getPlayerName(plr))
	addNewEventToLog(sHash, "Дом - Назначение стартовой точки - ID "..tostring(hid), true)
	
	if(dbExec(db, "UPDATE users SET houseid=? WHERE name=?", hid, sHash)) then
		if not (hid == 0) then
			local hx, hy, hz = getElementPosition(houses[hid][4])
			triggerClientEvent(plr, "onSaveHouseSet", plr, hx, hy, hz)
		
		else
			triggerClientEvent(plr, "onSaveHouseDestroy", plr)
		end
	end
end

function ferrisWheelNewPlayer(plr, seatId)
	if ferrisWheelCabins[seatId][3] then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "К сожалению, эта кабинка занята.")
	else
		if(getMoney(plr) < ferrisWheelPrice) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас недостаточно денег.")
		
		else
			if isPlayerBusy(plr) then
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы должны закончить остальные дела, прежде чем сможете воспользоваться колесом обозрения.")
			
			else
				ferrisWheelCabins[seatId][3] = plr
				attachActionToSelf(defaultActions[31], plr)
				addNewEventToLog(getPlayerName(plr), "Колесо обозрения - Посадка - Кабина "..tostring(seatId), true)
				takeMoney(plr, ferrisWheelPrice)
				attachElements(plr, ferrisWheelCabins[seatId][1], ferrisWheelSeat[1], ferrisWheelSeat[2], ferrisWheelSeat[3], 0.0, 0.0, ferrisWheelSeat[4])
				toggleAllControls(plr, false, true, false)
				triggerClientEvent(plr, "onFerrisWheelEnter", plr, ferrisWheelCabins[seatId][1])
			end
			
		end
		
	end
end

function ferrisWheelRemovePlayer(plr)
	for i,cabin in ipairs(ferrisWheelCabins) do
		if(cabin[3] == plr) then
			detachElements(plr, cabin[1])
			detachActionFromSelf(defaultActions[31], plr)
			toggleAllControls(plr, true, true, false)
			setElementPosition(plr, ferrisWheelExit[1], ferrisWheelExit[2], ferrisWheelExit[3])
			setElementRotation(plr, 0.0, 0.0, ferrisWheelExit[4])
			triggerClientEvent(plr, "onFerrisWheelExit", plr)
			ferrisWheelCabins[i][3] = nil
			addNewEventToLog(getPlayerName(plr), "Колесо обозрения - Высадка - Кабина "..tostring(i), true)
			break
		end
	end
end

function saveHouseGet(plr)
	local sHash = getHash(getPlayerName(plr))
	
	repeat
		dbq = dbQuery(db, "SELECT houseid FROM users WHERE name=?", sHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	return dbqueryresult[1]["houseid"]
end

function jobFarmSpawnNextVeh(curVehModel, fieldIndex)
	--if not (isElement(jobFarmFields[fieldIndex][7])) then
		local spawnModel, trailerModel, decreaseZCoord
		
		if(curVehModel == 532) then
			spawnModel = 531
			trailerModel = 610
			decreaseZCoord = 1.2
		
		else
			spawnModel = 532
			trailerModel = 0
			decreaseZCoord = 0
		end
		
		jobFarmFields[fieldIndex][7] = createVehicle(spawnModel, jobFarmFields[fieldIndex][1], jobFarmFields[fieldIndex][2], jobFarmFields[fieldIndex][3]-decreaseZCoord, jobFarmFields[fieldIndex][4], jobFarmFields[fieldIndex][5], jobFarmFields[fieldIndex][6])
		attachActionToElement(defaultActions[7], jobFarmFields[fieldIndex][7])
		setVehicleDamageProof(jobFarmFields[fieldIndex][7], true)
		setElementFrozen(jobFarmFields[fieldIndex][7], true)
		
		if(trailerModel > 0) then	
			local trailer = createVehicle(trailerModel, jobFarmFields[fieldIndex][1], jobFarmFields[fieldIndex][2], jobFarmFields[fieldIndex][3], jobFarmFields[fieldIndex][4], jobFarmFields[fieldIndex][5], jobFarmFields[fieldIndex][6])
			--attachTrailerToVehicle(jobFarmFields[fieldIndex][7], trailer)
			attachElements(trailer, jobFarmFields[fieldIndex][7], -0.0107421875, -2.6123046875, -0.6234302520752, 0, 0, 180)
			setVehicleDamageProof(trailer, true)
			--setElementFrozen(trailer, true)
		end
	--end
end

function jobFarm2OnWasted()
	addNewEventToLog(getPlayerName(source), "Ферма - Вспахивание - Погиб", true)
	removeWorker(8, source, 2)
end

function jobFarm2BlowedUp()
	for _,worker in ipairs(jobWorkers[8]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Ферма - Вспахивание - Взрыв транспорта", true)
			takeMoney(worker[1], jobFarmMoneyForBlowedCar)
			removeWorker(8, worker[1], 4)
		end
	end	
end

function jobFarmEnterCp(hitElem)
	if isElement(hitElem) and isElementVisibleTo(source, hitElem) then
		local hitVeh
		
		for jobId=7,8 do
			for i,worker in ipairs(jobWorkers[jobId]) do
				hitVeh = getPedOccupiedVehicle(worker[1])
				
				if(hitElem == worker[1]) and(hitVeh == worker[3]) then
					local fieldIndex = worker[4]
					local cpIndex = worker[5]
					triggerClientEvent(worker[1], "onJobFarmEnterCp", worker[1])
					
					if(cpIndex == 1) then
						jobFarmFields[fieldIndex][7] = nil
						jobFarmSpawnNextVeh(getElementModel(hitVeh), fieldIndex)
					end
					
					cpIndex = cpIndex+1
					
					if(cpIndex > table.getn(jobFarmFields[fieldIndex][8])) then
						local jobName
						
						if(jobId == 7) then
							jobName = "Сбор урожая"
						else
							jobName = "Вспахивание"
						end
						
						addNewEventToLog(getPlayerName(worker[1]), "Ферма - "..jobName.." - Завершение", true)
						removeWorker(jobId, hitElem, 1)
						local respect = getElementData(hitElem, "respect")
						respectSet(hitElem, respect+0.000004, -1.0, 0.05, true)
						giveMoney(hitElem, jobFarmMoneyForField)
					
					else
						setElementVisibleTo(source, hitElem, false)
						jobWorkers[jobId][i][5] = cpIndex
						setElementVisibleTo(jobFarmFields[fieldIndex][8][cpIndex][4], hitElem, true)
					end
					
					break
				end
			end
		end
	end
end

function jobFarmOnWasted()
	addNewEventToLog(getPlayerName(source), "Ферма - Сбор урожая - Погиб", true)
	removeWorker(7, source, 2)
end

function jobFarmBlowedUp()
	for _,worker in ipairs(jobWorkers[7]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Ферма - Сбор урожая - Взрыв транспорта", true)
			takeMoney(worker[1], jobFarmMoneyForBlowedCar)
			removeWorker(7, worker[1], 4)
		end
	end	
end

function jobFarmLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Ферма - Сбор урожая - Покинул транспорт", true)
	takeMoney(source, jobFarmMoneyForLeftCar)
	removeWorker(7, source, 3)
end

function jobFarmNowInVehicle(state)
	jobFarmSetState(source, state)
end

function jobFarm2LeftVehicle()
	addNewEventToLog(getPlayerName(source), "Ферма - Вспахивание - Покинул транспорт", true)
	takeMoney(source, jobFarmMoneyForLeftCar)
	removeWorker(8, source, 3)
end

function jobFarm2NowInVehicle(state)
	jobFarm2SetState(source, 0)
end

function jobFarm2SetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[8]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, true)
				
				elseif(state == 1) then
					setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, false)
				
				elseif(state == 3) then
					setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, false)
				end
				
				jobWorkers[8][i][2] = state
				break
			end
		end	
	end
end

function jobFarmSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[7]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, true)
				
				elseif(state == 3) then
					setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, false)
				end
				
				jobWorkers[7][i][2] = state
				break
			end
		end
	end
end

function getVehiclePrice(vehMdl)
	local price = carSellPrices[vehMdl]
	if price then
		return price
	else
		return 0
	end
end

function jobAmbulanceNewOrder(orderer)
	addNewEventToLog(getPlayerName(orderer), "Скорая помощь - Вызов - nil", true)
	local ambMsg = string.format(generateTimeString().."[Скорая помощь] ДИСПЕТЧЕР: #FFFFFF%s вызывает скорую помощь. Местоположение обозначено на карте.", getPlayerName(orderer))
	local ox,oy,oz = getElementPosition(orderer)
	local ax,ay,az,agrp
	local ambCount = 0
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		agrp = getElementData(plr, "usergroup")
		
		if agrp and(agrp == 4) and(getElementInterior(plr) == 0) and(getElementDimension(plr) == 0) then
			ax,ay,az = getElementPosition(plr)
			
			if(getDistanceBetweenPoints3D(ox,oy,oz,ax,ay,az) < 2400) then
				outputChatBox(ambMsg, plr, 147, 255, 255, true)
				triggerClientEvent(plr, "onAmbOrderCreate", orderer, ox, oy, oz)
				ambCount = ambCount+1
			end
			
		end
	end
	
	--for _,worker in ipairs(jobWorkers[6]) do
		--ax,ay,az = getElementPosition(worker[1])
		--aint = getElementInterior(worker[1])
		--adim = getElementDimension(worker[1])
		--if(getDistanceBetweenPoints3D(ox,oy,oz,ax,ay,az) < 1200) and(adim == getElementDimension(orderer)) and(aint == getElementInterior(orderer)) then
			--outputChatBox(ambMsg, worker[1], 147, 255, 255, false)
			--triggerClientEvent(worker[1], "onAmbOrderCreate", worker[1], ox, oy, oz)
			--ambCount = ambCount+1
		--end
	--end
	
	if(ambCount > 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, string.format("Ваш заказ скорой помощи разослан %d врачам.", ambCount))
	
	elseif(ambCount == 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Ваш заказ скорой помощи разослан 1 врачу.")
	
	else
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Врачи поблизости отсутствуют.")
	end
end

function jobAmbulanceRequest(ambPlr, orderer)
	triggerClientEvent(orderer, "onAmbulanceRequest", ambPlr, jobAmbulancePriceForHP)
	triggerClientEvent(ambPlr, "onServerMsgAdd", ambPlr, string.format("Вы предложили лечение игроку %s.", getPlayerName(orderer)))
end

function jobAmbulanceAccept(ambPlr)
	if isElement(ambPlr) then
		if(getMoney(source) >= jobAmbulancePriceForHP) then
			local serviceId = getElementData(ambPlr, "usergroup")
			
			if serviceId and serviceRegister(source, ambPlr, serviceId) then
				local respect = getElementData(ambPlr, "respect")
				respectSet(ambPlr, respect+0.000005, -1.0, 1.0, true)
			end
			
			takeMoney(source, jobAmbulancePriceForHP)
			giveMoney(ambPlr, jobAmbulancePriceForHP)
			setElementHealth(source, 250)
			addNewEventToLog(getPlayerName(ambPlr), "Скорая помощь - Лечение для игрока - "..getPlayerName(source), true)
			addNewEventToLog(getPlayerName(source), "Скорая помощь - Лечение от игрока - "..getPlayerName(ambPlr), true)
			triggerClientEvent(ambPlr, "onServerMsgAdd", ambPlr, string.format("Вы вылечили игрока %s.", getPlayerName(source)))
			triggerEvent("onPlayerChat", ambPlr, "вылечил игрока "..getPlayerName(source), 1)
		
		else
			triggerEvent("onJobAmbulanceDecline", source, ambPlr)
			triggerClientEvent(source, "onServerMsgAdd", source, "У вас недостаточно денег.")
		end
		
	end
end

function jobAmbulanceDecline(ambPlr)
	if isElement(ambPlr) then
		triggerEvent("onPlayerChat", source, "отказался от лечения", 1)
		triggerClientEvent(ambPlr, "onServerMsgAdd", ambPlr, string.format("Игрок %s отказался от лечения.", getPlayerName(source)))
	end
end

function jobAmbulanceOnWasted()
	addNewEventToLog(getPlayerName(source), "Скорая помощь - Завершение - Погиб", true)
	removeWorker(6, source, 2)
end

function jobAmbulanceBlowedUp()
	for _,worker in ipairs(jobWorkers[6]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Скорая помощь - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobAmbulanceMoneyForBlowedCar)
			removeWorker(6, worker[1], 4)
		end
	end	
end

function jobAmbulanceEnterVehicle(thePlayer)
	for _,worker in ipairs(jobWorkers[6]) do
		if(worker[1] == thePlayer) then
			if not (source == worker[3]) then
				addNewEventToLog(getPlayerName(thePlayer), "Скорая помощь - Завершение - Покинул транспорт", true)
				takeMoney(thePlayer, jobAmbulanceMoneyForLeftCar)
				removeWorker(6, thePlayer, 3)
			end
		end
	end
end

--Логин в админку чтобы сразу появлялась
--[[
function isAdmin(plr)
	--if not isGuestAccount(getPlayerAccount(plr)) then
		--local accountname = "user."..getAccountName(getPlayerAccount(plr))
		local accountname = "user."..getPlayerName(plr)
		if isObjectInACLGroup(accountname, aclGetGroup("Admin")) then
			return true
		end
	--end
	return false
end

function isModerator(plr)
	--if not isGuestAccount(getPlayerAccount(plr)) then
		--local accountname = "user."..getAccountName(getPlayerAccount(plr))
		local accountname = "user."..getPlayerName(plr)
		if isObjectInACLGroup(accountname, aclGetGroup("Moderator")) then
			return true
		end
	--end
	return false
end

function isHelper(plr)
	--if not isGuestAccount(getPlayerAccount(plr)) then
		--local accountname = "user."..getAccountName(getPlayerAccount(plr))
		local accountname = "user."..getPlayerName(plr)
		if isObjectInACLGroup(accountname, aclGetGroup("Helper")) then
			return true
		end
	--end
	return false
end]]

--В логин в админку через /login
function isAdmin(plr)
	if not isGuestAccount(getPlayerAccount(plr)) then
		local accountname = "user."..getAccountName(getPlayerAccount(plr))
		--local accountname = "user."..getPlayerName(plr)
		
		if isObjectInACLGroup(accountname, aclGetGroup("Admin")) then
			return true
		end
		
	end
	return false
end

function isModerator(plr)
	if not isGuestAccount(getPlayerAccount(plr)) then
		local accountname = "user."..getAccountName(getPlayerAccount(plr))
		--local accountname = "user."..getPlayerName(plr)
		
		if isObjectInACLGroup(accountname, aclGetGroup("Moderator")) then
			return true
		end
		
	end
	return false
end

function isHelper(plr)
	if not isGuestAccount(getPlayerAccount(plr)) then
		local accountname = "user."..getAccountName(getPlayerAccount(plr))
		--local accountname = "user."..getPlayerName(plr)
		
		if isObjectInACLGroup(accountname, aclGetGroup("Helper")) then
			return true
		end
		
	end
	return false
end

function groupCommonGet(plr)
	if isAdmin(plr) or isModerator(plr) then
		return 15
	end
	
	local moneyAmount = getMoney(plr)
	
	if(moneyAmount < 0) then
		return 12
	
	else
		local respect = getElementData(plr, "respect")
		
		if(respect < 0.0) then
			return 10
		else
			if(moneyAmount < 1000000) then
				return 1
			
			else
				return 13
			end
		end
	end
end

function weatherSwitch()
	if(weatherCurId >= table.getn(weatherSequence)) then
		weatherCurId = 1
	
	else
		weatherCurId = weatherCurId+1
	end
	
	weatherUpdate()
end

function weatherUpdate()
	setWeatherBlended(weatherSequence[weatherCurId][1])
	setTimer(weatherSwitch, weatherSequence[weatherCurId][2], 1)
end

function boomboxUpdate()
	local curTick = getTickCount()
	
	if(boomboxUpdatePrev <= 0) then
		boomboxUpdatePrev = curTick
	end
	
	local boomboxUpdateDelta = (curTick-boomboxUpdatePrev)/1000
	boomboxUpdatePrev = curTick
	local dim, intr
	
	for i=1,table.getn(boomboxArray) do
		if(isPedInVehicle(boomboxArray[i][1])) then
			boomboxRemove(boomboxArray[i][1])
		else
			boomboxArray[i][5] = boomboxArray[i][5]+boomboxUpdateDelta
			dim = getElementDimension(boomboxArray[i][1])
			intr = getElementInterior(boomboxArray[i][1])
			
			if not (dim == getElementDimension(boomboxArray[i][2])) then
				setElementDimension(boomboxArray[i][2], dim)
			end
			
			
			if not (intr == getElementInterior(boomboxArray[i][2])) then
				setElementInterior(boomboxArray[i][2], intr)
			end
		end
	end
	triggerClientEvent(getElementsByType("player"), "onBoomboxUpdate", resourceRoot, boomboxArray)
end

function boomboxAdd(playa)
	if not getElementData(playa, "boombox") then
		addNewEventToLog(getPlayerName(playa), "Бумбокс - Включение - nil", true)
		local boombox = createObject(2102, 0, 0, 0, 0, 0, 0)
		setElementData(playa, "boombox", true)
		setElementInterior(boombox, getElementInterior(playa))
		setElementDimension(boombox, getElementDimension(playa))
		exports.bone_attach:attachElementToBone(boombox, playa, 12, 0, 0, 0.4, 0, 180, 0)
		local radioid = math.random(table.getn(boomboxMusic))
		local sradio = boomboxMusic[radioid][1]
		local sid = boomboxMusic[radioid][math.random(table.getn(boomboxMusic[radioid])-1)+1]
		table.insert(boomboxArray, { playa, boombox, sradio, sid, 0 })
		boomboxUpdate()
		return true
	end
	return false
end

function boomboxSwitch(playa)
	if getElementData(playa, "boombox") then
		for i,boombox in ipairs(boomboxArray) do
			if(boombox[1] == playa) then
				addNewEventToLog(getPlayerName(playa), "Бумбокс - Смена трека - nil", true)
				local radioid = math.random(table.getn(boomboxMusic))
				local sradio = boomboxMusic[radioid][1]
				local sid = boomboxMusic[radioid][math.random(table.getn(boomboxMusic[radioid])-1)+1]
				boomboxArray[i][3] = sradio
				boomboxArray[i][4] = sid
				boomboxArray[i][5] = 0
				triggerClientEvent(getElementsByType("player"), "onBoomboxSwitch", playa, sradio, sid)
				boomboxUpdate()
				break
			end
		end
	end
end

function boomboxRemove(playa)
	if getElementData(playa, "boombox") then
		for i,boombox in ipairs(boomboxArray) do
			if(boombox[1] == playa) then
				addNewEventToLog(getPlayerName(playa), "Бумбокс - Выключение - nil", true)
				local slotId = inventoryCheckForSlot(playa, 7)
				
				if not ((slotId) and(inventoryNewItem(playa, 7, slotId))) then
					local dropx, dropy, dropz = getElementPosition(playa)
					inventoryCreateDroppedItem(inventoryItemNames[7][3], playa, dropx, dropy, dropz, 7)
				end
				
				triggerClientEvent(getElementsByType("player"), "onBoomboxRemove", playa, boombox[2])
				destroyElement(boombox[2])
				table.remove(boomboxArray, i)
				setElementData(playa, "boombox", false)
				boomboxUpdate()
				break
			end
		end
	end
end

function repairMarkerHit(hitElem, dim)
	if dim and(getElementType(hitElem) == "vehicle") then
		local vehType = getVehicleType(hitElem)
		
		if(vehType == "Automobile") or (vehType == "Bike") or (vehType == "Monster Truck") or (vehType == "Quad") then
			local driver = getVehicleOccupant(hitElem)
			
			if driver then
				local hp = getElementData(hitElem, "hp")
				local curHealth = getElementHealth(hitElem)
				if not hp then
					hp = 1000.0
				end
				
				if(hp - curHealth) < 100 then
					triggerClientEvent(driver, "onServerMsgAdd", driver, "Повреждения незначительные, поэтому вы починили ваше транспортное средство бесплатно.")
				
				elseif getMoney(driver) < repairPrice then
					triggerClientEvent(driver, "onServerMsgAdd", driver, string.format("Вам необходимо $%d, чтобы починить транспортное средство в этом гараже.", repairPrice))
					return
				
				else
					takeMoney(driver, repairPrice)
					triggerClientEvent(driver, "onServerMsgAdd", driver, string.format("Вы починили ваше транспортное средство за $%d.", repairPrice))
				end
				
				addNewEventToLog(getPlayerName(driver), "Починка транспорта - Ремонт - "..getVehicleName(hitElem), true)
				fixVehicle(hitElem)
				setElementHealth(hitElem, hp)
				local cx, cy, cz = getElementPosition(hitElem)
				local curCol = createColSphere(cx, cy, cz, 150)
				triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onServerPlaySFX3D", driver, "script", 150, 0, 0, 0, 0, false, 100, hitElem)
				destroyElement(curCol)
			end
		end
	end
end

function raceCreate(raceId)
	if not availableRace then
		availableRace = { raceId, false, setTimer(raceDestroy, raceInfo[raceId][9], 1), {}, createMarker(raceInfo[raceId][15], raceInfo[raceId][16], raceInfo[raceId][17], "checkpoint", raceInfo[raceId][18], 255, 0, 0, 128), setTimer(raceUpdateInfo, 1000, 0) }
		attachActionToElement(defaultActions[19], availableRace[5])
		raceBlip = createBlip(raceInfo[raceId][15], raceInfo[raceId][16], raceInfo[raceId][17], 33, 2, 255, 255, 255, 255, 32000)
		setMarkerIcon(availableRace[5], "finish")
		local vehTypeName
		
		if(raceInfo[raceId][11] == 0) then
			vehTypeName = "автомобиль"
		
		elseif(raceInfo[raceId][11] == 1) then
			vehTypeName = "мотоцикл"
		
		elseif(raceInfo[raceId][11] == 2) then
			vehTypeName = "велосипед"
		
		elseif(raceInfo[raceId][11] == 3) then
			vehTypeName = "вертолёт"
		
		elseif(raceInfo[raceId][11] == 4) then
			vehTypeName = "лодка"
		
		elseif(raceInfo[raceId][11] == 5) then
			vehTypeName = "самолёт"
		
		else
			vehTypeName = "неизвестно"
		end
		
		triggerClientEvent(getElementsByType("player"), "onServerMsgAdd", resourceRoot, "Через "..getTimeString(raceInfo[raceId][9], "v").." начнется гонка. Количество участников - "..tostring(table.getn(raceInfo[raceId][19]))..". Тип транспорта - "..vehTypeName..". Старт отмечен на радаре иконкой кубка.")
	end
end

function raceUpdateInfo()
	if not raceInfoCoroutine then
		raceInfoCoroutine = coroutine.create(raceUpdateInfoCoroutine)
	end
	
	coroutine.resume(raceInfoCoroutine)
end

function raceUpdateInfoCoroutine()
	local info
	
	while true do
		info = raceInfoForClient()
		
		for _,racer in ipairs(availableRace[4]) do
			triggerClientEvent(racer[1], "onRaceUpdateInfo", racer[1], info)
		end
		
		coroutine.yield()
	end
end

function raceInfoForClient()
	if availableRace and isTimer(availableRace[3]) then
		local timeLeft = getTimerDetails(availableRace[3])
		return { availableRace[1], timeLeft, availableRace[4], availableRace[2], raceInfo[availableRace[1]][8], availableRace[8] }
	end
	return false
end

function racerFinish(i)
	local racer = availableRace[4][i]
	table.insert(availableRace[8], racer)
	local place = table.getn(availableRace[8])
	addNewEventToLog(getPlayerName(racer[1]), "Гонка - Финиш - ID "..tostring(availableRace[1])..", Место "..tostring(place), true)
	local finishMsg = string.format("Вы заняли %d-е место.", place)
	local prize = 0
	
	if(place >= 1) and(place <= 3) then
		prize = raceInfo[availableRace[1]][11+place]
	end
	
	if(prize > 0) then
		finishMsg = finishMsg..string.format(" Ваш выигрыш составил $%d.", prize)
		giveMoney(racer[1], prize)
	end
	
	triggerClientEvent(racer[1], "onServerMsgAdd", racer[1], finishMsg)
	triggerClientEvent(racer[1], "onRaceExit", racer[1])
	raceRemoveRacer(i)
end

function raceMarkerHit(hitElem)
	for i,racer in ipairs(availableRace[4]) do
		if(hitElem == racer[2]) and(source == availableRace[5][racer[3]]) and(getVehicleOccupant(racer[2]) == racer[1]) then
			local _,_,pz = getElementPosition(racer[2])
			local _,_,cz = getElementPosition(source)
			
			if(math.abs(pz-cz) <= 5) then
				local raceId = availableRace[1]
				setElementVisibleTo(availableRace[5][racer[3]], racer[1], false)
				local attachedElem = getAttachedElements(availableRace[5][racer[3]])
				
				if(table.getn(attachedElem) > 0) then
					setElementVisibleTo(attachedElem[1], racer[1], false)
				end
				
				triggerClientEvent(racer[1], "onJobFarmEnterCp", racer[1])
				
				if(table.getn(raceInfo[raceId][20]) == racer[3]) then
					availableRace[4][i][3] = 1
					availableRace[4][i][4] = racer[4]+1
					
					if(raceInfo[raceId][8] < racer[4]) then
						availableRace[4][i][3] = 0
					end
					
				else
					availableRace[4][i][3] = racer[3]+1
				end
				
				if(racer[3] > 0) then
					setElementVisibleTo(availableRace[5][racer[3]], racer[1], true)
					attachedElem = getAttachedElements(availableRace[5][racer[3]])
					
					if(table.getn(attachedElem) > 0) then
						setElementVisibleTo(attachedElem[1], racer[1], true)
					end
					
				else
					racerFinish(i)
				end
				
				break
			end
			
		end
	end
end

function raceCount(countVal)
	for _,racer in ipairs(availableRace[4]) do
		if(countVal == 0) then
			setElementFrozen(racer[1], false)
			setElementFrozen(racer[2], false)	
		end
		
		triggerClientEvent(racer[1], "onRaceStart", racer[1], countVal)
	end
end

function raceDisqualify()
	for _,racer in ipairs(availableRace[4]) do
		if(source == racer[1]) or (source == racer[2]) then
			addNewEventToLog(getPlayerName(racer[1]), "Гонка - Дисквалификация - ID "..tostring(availableRace[1]), true)
			triggerClientEvent(racer[1], "onRaceExit", racer[1])
			break
		end
	end
end

function raceNewRacer(racer)
	if availableRace then
		if(isPedInVehicle(racer)) and(getPedOccupiedVehicleSeat(racer) == 0) then
			if isPlayerBusy(racer) then
				triggerClientEvent(racer, "onServerMsgAdd", racer, "Закончите остальные дела, прежде чем участвовать в гонке.")
			
			else
				local raceVeh = getPedOccupiedVehicle(racer)
				local raceVehType = getVehicleType(raceVeh)
				local raceId = availableRace[1]
				local owner = getElementData(raceVeh, "owner")
				
				if racer and owner and(getHash(getPlayerName(racer)) == owner) and(getElementHealth(racer) > 0)
				
				and(((raceInfo[raceId][11] == 0) and(raceVehType == "Automobile")) or ((raceInfo[availableRace[1]][11] == 1) and(raceVehType == "Bike")) or ((raceInfo[availableRace[1]][11] == 2) and(raceVehType == "BMX"))
				
				or((raceInfo[availableRace[1]][11] == 3) and(raceVehType == "Helicopter")) or ((raceInfo[availableRace[1]][11] == 4) and(raceVehType == "Boat")) or ((raceInfo[availableRace[1]][11] == 5) and(raceVehType == "Plane"))) then
					addNewEventToLog(getPlayerName(racer), "Гонка - Регистрация - ID "..tostring(availableRace[1])..", Транспорт "..getVehicleName(raceVeh), true)
					table.insert(availableRace[4], { racer, raceVeh, 1, 1 })
					addEventHandler("onVehicleExplode", raceVeh, raceDisqualify)
					--addEventHandler("onVehicleExit", raceVeh, raceDisqualify)
					addEventHandler("onPlayerWasted", racer, raceDisqualify)
					local occupants = getVehicleOccupants(raceVeh)
					
					for seat,occupant in pairs(occupants) do
						removePedFromVehicle(occupant)
					end
					
					setElementInterior(racer, raceInfo[raceId][7])
					setElementInterior(raceVeh, raceInfo[raceId][7])
					setElementDimension(racer, 1)
					setElementDimension(raceVeh, 1)
					
					for i,curRacer in ipairs(availableRace[4]) do
						setElementPosition(curRacer[2], raceInfo[raceId][19][i][1], raceInfo[raceId][19][i][2], raceInfo[raceId][19][i][3])
						setElementRotation(curRacer[2], raceInfo[raceId][19][i][4], raceInfo[raceId][19][i][5], raceInfo[raceId][19][i][6])
					end
					
					setElementFrozen(raceVeh, true)
					setElementFrozen(racer, true)
					
					if(table.getn(availableRace[4]) < table.getn(raceInfo[raceId][19])) then
						setCameraMatrix(racer, raceInfo[raceId][1], raceInfo[raceId][2], raceInfo[raceId][3], raceInfo[raceId][4], raceInfo[raceId][5], raceInfo[raceId][6])
						triggerClientEvent(racer, "onRaceEnter", racer, raceInfoForClient())
					
					else
						if(isTimer(availableRace[3])) then
							killTimer(availableRace[3])
							availableRace[3] = nil
						end
						
						if(isElement(availableRace[5])) then
							destroyElement(availableRace[5])
							availableRace[5] = nil
						end
						
						availableRace[2] = true
						availableRace[3] = setTimer(raceDestroy, raceInfo[raceId][10]+3000, 1)
						availableRace[5] = {}
						destroyElement(raceBlip)
						
						for i,cp in ipairs(raceInfo[raceId][20]) do
							
							local cr,cg,cb,ca,tx,ty,tz,cpElem
							if(i == table.getn(raceInfo[raceId][20])) then
								cr,cg,cb,ca = 255,255,255,128
								tx,ty,tz = raceInfo[raceId][20][1][1],raceInfo[raceId][20][1][2],raceInfo[raceId][20][1][3]
								cpElem = createMarker(cp[1], cp[2], cp[3], "checkpoint", cp[4]*1.5, cr, cg, cb, ca)
							
							else
								cr,cg,cb,ca = 255,0,0,128
								tx,ty,tz = raceInfo[raceId][20][i+1][1],raceInfo[raceId][20][i+1][2],raceInfo[raceId][20][i+1][3]
								cpElem = createMarker(cp[1], cp[2], cp[3], "checkpoint", cp[4]*1.5, cr, cg, cb, ca)
								setMarkerIcon(cpElem, "arrow")
							end
							
							local cpMark = createBlipAttachedTo(cpElem, 0, 1, 255, 0, 0, 255, 32767)
							table.insert(availableRace[5], cpElem)
							setElementVisibleTo(cpElem, root, false)
							setElementVisibleTo(cpMark, root, false)
							setMarkerTarget(cpElem, tx, ty, tz)
							setElementInterior(cpElem, raceInfo[raceId][7])
							addEventHandler("onMarkerHit", cpElem, raceMarkerHit)
							addEventHandler("onMarkerLeave", cpElem, raceMarkerHit)
						end
						
						local attachedElements = getAttachedElements(availableRace[5][1])
						local cpMark = nil
						
						if(table.getn(attachedElements) > 0) then
							cpMark = attachedElements[1]
						end
						
						for i,curRacer in ipairs(availableRace[4]) do
							setCameraTarget(curRacer[1])
							setElementDimension(curRacer[1], 0)
							setElementDimension(curRacer[2], 0)
							setElementInterior(curRacer[1], raceInfo[raceId][7])
							setElementInterior(curRacer[2], raceInfo[raceId][7])
							setElementVisibleTo(availableRace[5][1], curRacer[1], true)
							
							if cpMark then
								setElementVisibleTo(cpMark, curRacer[1], true)
							end
							
							triggerClientEvent(curRacer[1], "onRaceStart", curRacer[1], 3)
							addNewEventToLog(getPlayerName(curRacer[1]), "Гонка - Старт - ID "..tostring(availableRace[1]), true)
							warpPedIntoVehicle(curRacer[1], curRacer[2])
						end
						
						table.insert(availableRace, setTimer(raceSortRacers, 250, 0))
						table.insert(availableRace, {})
						setTimer(raceCount, 1000, 1, 2)
						setTimer(raceCount, 2000, 1, 1)
						setTimer(raceCount, 3000, 1, 0)
					end
				
				else
					triggerClientEvent(racer, "onServerMsgAdd", racer, "Ваше транспортное средство не подходит для этой гонки.")
				end
			end
		end
	end
end

function raceSortRacers()
	if not racersCoroutine then
		racersCoroutine = coroutine.create(raceSortRacersCoroutine)
	end
	coroutine.resume(racersCoroutine)
end

function raceSortRacersCoroutine()
	local raceId
	
	while true do
		raceId = availableRace[1]
		for i=1,table.getn(availableRace[4]) do
			for j=1,table.getn(availableRace[4])-i do
				if(availableRace[4][j][4] == availableRace[4][j+1][4]) then
					if(availableRace[4][j][3] == availableRace[4][j+1][3]) then
						local jx,jy,jz = getElementPosition(availableRace[4][j][1])
						local jdist = getDistanceBetweenPoints3D(jx,jy,jz,raceInfo[raceId][20][availableRace[4][j][3]][1],raceInfo[raceId][20][availableRace[4][j][3]][2],raceInfo[raceId][20][availableRace[4][j][3]][3])
						local j1x,j1y,j1z = getElementPosition(availableRace[4][j+1][1])
						local j1dist = getDistanceBetweenPoints3D(j1x,j1y,j1z,raceInfo[raceId][20][availableRace[4][j][3]][1],raceInfo[raceId][20][availableRace[4][j][3]][2],raceInfo[raceId][20][availableRace[4][j][3]][3])
						
						if(jdist > j1dist) then
							raceSortSwap(j, j+1)
						end
						
					elseif(availableRace[4][j][3] < availableRace[4][j+1][3]) then
						raceSortSwap(j, j+1)
					end
					
				elseif(availableRace[4][j][4] < availableRace[4][j+1][4]) then
					raceSortSwap(j, j+1)
				end
			end
		end
		coroutine.yield()
	end
	
end

function raceSortSwap(i, j)
	local buffer = availableRace[4][i]
	availableRace[4][i] = availableRace[4][j]
	availableRace[4][j] = buffer
end

function raceGetRacerIndex(racer)
	if availableRace then
		for i,curRacer in ipairs(availableRace[4]) do
			if(curRacer[1] == racer) then
				return i
			end
		end
	end
	
	return false
end

function raceRemoveRacer(i)
	if availableRace and availableRace[4] and availableRace[4][i] then
		local racer, raceVeh, raceCp = availableRace[4][i][1], availableRace[4][i][2], availableRace[4][i][3]
		local raceId = availableRace[1]
		table.remove(availableRace[4], i)
		removeEventHandler("onVehicleExplode", raceVeh, raceDisqualify)
		--removeEventHandler("onVehicleExit", raceVeh, raceDisqualify)
		removeEventHandler("onPlayerWasted", racer, raceDisqualify)
		
		if not (getElementInterior(racer) == 0) then
			setElementPosition(raceVeh, raceInfo[raceId][15], raceInfo[raceId][16], raceInfo[raceId][17])
			setElementInterior(racer, 0)
			setElementInterior(raceVeh, 0)
			warpPedIntoVehicle(racer, raceVeh)
		end
		
		if availableRace[2] then
			if(isElement(availableRace[5][raceCp])) then
				setElementVisibleTo(availableRace[5][raceCp], racer, false)
				local attachedElem = getAttachedElements(availableRace[5][raceCp])
				
				if(table.getn(attachedElem) > 0) then
					setElementVisibleTo(attachedElem[1], racer, false)
				end
				
			end
			addNewEventToLog(getPlayerName(racer), "Гонка - Завершение - ID "..tostring(availableRace[1]), true)
			triggerClientEvent(racer, "onServerMsgAdd", racer, "Гонка окончена.")
		
		else
			setElementFrozen(raceVeh, false)
			setElementFrozen(racer, false)
			setElementDimension(raceVeh, 0)
			setElementDimension(racer, 0)
			setCameraTarget(racer)
		end
	end
end

function raceExit()
	local racerIndex = raceGetRacerIndex(source)
	
	if(racerIndex) then
		local car = availableRace[4][racerIndex][2]
		
		if car then
			setElementGhostMode(car, 3000)
			warpPedIntoVehicle(source, car)
		end
		
		addNewEventToLog(getPlayerName(source), "Гонка - Отмена - ID "..tostring(availableRace[1]), true)
		raceRemoveRacer(racerIndex)
	end
end

function raceDestroy()
	if availableRace then
		if(isTimer(availableRace[3])) then
			killTimer(availableRace[3])
		end
		
		if(isTimer(availableRace[6])) then
			killTimer(availableRace[6])
		end
		
		if(isElement(raceBlip)) then
			destroyElement(raceBlip)
		end
		
		while(table.getn(availableRace[4]) > 0) do
			triggerClientEvent(availableRace[4][1][1], "onRaceExit", availableRace[4][1][1])
			raceRemoveRacer(1)
		end
		
		if availableRace[2] then
			for _,elem in ipairs(availableRace[5]) do
				local attachedElem = getAttachedElements(elem)
				
				if(table.getn(attachedElem) > 0) then
					destroyElement(attachedElem[1])
				end
				
				destroyElement(elem)
			end
			
			if(isTimer(availableRace[7])) then
				killTimer(availableRace[7])
			end
		
		else
			destroyElement(availableRace[5])
		end
		
		availableRace = nil
		
		if(get("raceAutoLaunch") == "Yes") then
			setTimer(raceCreate, timeBetweenRaces, 1, math.random(table.getn(raceInfo)))
		end
	end
end

function uniqueJumpSuccess(plr, jumpIndex)
	if(source == resourceRoot) and(plr == client) and(jumpIndex <= 71) and(jumpIndex >= 1) then
		local sHash = getHash(getPlayerName(plr))
		dbQuery(uniqueJumpSuccess2, {plr, sHash, jumpIndex}, db, "SELECT * FROM jumps WHERE player=? AND jumpId=?", sHash, jumpIndex)
	end
end

function uniqueJumpSuccess2(dbq, source, sHash, jumpIndex)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	if(table.getn(dbqueryresult) > 0) then
		triggerClientEvent(source, "onServerMsgAdd", source, "Неплохо, но вы выполнили этот уникальный прыжок ранее.")
	
	elseif(dbExec(db, "INSERT INTO jumps(player, jumpId) VALUES(?, ?)", sHash, jumpIndex)) then
		addNewEventToLog(getPlayerName(source), "Уникальный прыжок - Выполнение - ID "..tostring(jumpIndex), true)
		triggerClientEvent(source, "onServerMsgAdd", source, string.format("Уникальный прыжок! Держите свои $%d.", uniqueJumpMoney))
		giveMoney(source, uniqueJumpMoney)
	end
end

function isPlayerInHospital(plr)
	return(fractionIsPlayerInsideFractionInterior(plr, 5)
		  or fractionIsPlayerInsideFractionInterior(plr, 6)
		  or fractionIsPlayerInsideFractionInterior(plr, 7)
		  or fractionIsPlayerInsideFractionInterior(plr, 8))
end

playerDataCoroutine = nil

function savePlayerData()
	if not playerDataCoroutine then
		playerDataCoroutine = coroutine.create(savePlayerDataCoroutine)
	end
	
	if(coroutine.status(playerDataCoroutine) == "suspended") then
		coroutine.resume(playerDataCoroutine)
	end
end

function syncClientWeaponData(plr, callbackFunc, ...)
	if isElement(plr) then
		triggerClientEvent(plr, "onWeaponDataSync", resourceRoot, callbackFunc, ...)
	end
end

function receiveClientWeaponData(plr, weapData, callbackFunc, ...)
	if not isElement(plr) then
		return
	end
	
	local updateStr = "UPDATE users SET "
	
	for curWeapSlot=0,12 do
		if curWeapSlot == 0 then
			updateStr = updateStr..string.format("w%d=%d, w%dammo=%d", curWeapSlot, weapData[curWeapSlot][1], curWeapSlot, weapData[curWeapSlot][2])
		
		else
			updateStr = updateStr..string.format(", w%d=%d, w%dammo=%d", curWeapSlot, weapData[curWeapSlot][1], curWeapSlot, weapData[curWeapSlot][2])
		end
	end
	
	updateStr = updateStr.." WHERE name=?"
	
	if dbExec(db, updateStr, getHash(getPlayerName(plr))) and callbackFunc then
		loadstring("return "..callbackFunc)()(unpack({...}))
	end
end

function saveCurrentPlayer(playerValue, skipAFKCheck, procJetpack, procStats, procWeapons, procWanted)
	local hungryLevel, thirstLevel, hp, armor, curWeap, curWeapAmmo, stamina, oldStamina, maxHp, driving, cycling, biking, flying, speed, wanted
	
	if(not skipAFKCheck) and(isElement(playerValue)) and(getPlayerIdleTime(playerValue) > 900000) and(not isHelper(playerValue)) and(not isAdmin(playerValue)) and(not isModerator(playerValue)) then
		kickAFK(playerValue)
	
	elseif(isElement(playerValue)) and getElementData(playerValue, "spawned") and(not isPedDead(playerValue)) and(not specialEventGetEventByElement(playerValue)) then
		if procJetpack then
			if doesPedHaveJetPack(playerValue) then
				if isPedInVehicle(playerValue) then
					jetpackOff(playerValue)
				
				else
					local fuel = getElementData(playerValue, "jetpackFuel")
					
					if fuel and(fuel > 0.0) then
						if(fuel <= 200.0) then
							setElementData(playerValue, "jetpackFuel", math.max(0.0, fuel-0.415))
						end
					
					else
						jetpackOff(playerValue)
					end
					
				end
			end
		end
		hungryLevel = getElementData(playerValue, "hungryLevel")
		thirstLevel = getElementData(playerValue, "thirstLevel")
		hp = getElementHealth(playerValue)
		armor = getPedArmor(playerValue)
		if procStats then
			if isAdmin(playerValue) or isModerator(playerValue) then
				hungryLevel = 1.0
				thirstLevel = 1.0
			
			else
				if(hungryLevel > 0.0) then
					setElementData(playerValue, "hungryLevel", math.max(0.0, getElementData(playerValue, "hungryLevel")-0.0009), false)
					hungryLevel = getElementData(playerValue, "hungryLevel")
					
					if(hungryLevel > 0.199) and(hungryLevel < 0.201) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(playerValue, "onServerMsgAdd", playerValue, "Вы проголодались. Воспользуйтесь инвентарём(клавиша 'I') или найдите ближайшее кафе.")
						triggerClientEvent(players, "onServerPlaySound3D", playerValue, "audio/starving.wav", 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgFood)
					
					elseif((hungryLevel > 0.149) and(hungryLevel < 0.151)) or ((hungryLevel > 0.099) and(hungryLevel < 0.101)) or ((hungryLevel > 0.049) and(hungryLevel < 0.051)) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(players, "onServerPlaySound3D", playerValue, "audio/starving.wav", 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgFood)
					
					elseif(hungryLevel < 0.0001) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(playerValue, "onServerMsgAdd", playerValue, "Вы умираете от голода. Воспользуйтесь инвентарём(клавиша 'I') или найдите ближайшее кафе.")
						triggerClientEvent(players, "onServerPlaySound3D", playerValue, "audio/starving.wav", 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgFood)
					end
					
				else
					setElementHealth(playerValue, getElementHealth(playerValue)-2)
					local players = getNearbyElementsByType(playerValue, "player", 75.0)
					table.insert(players, playerValue)
					triggerClientEvent(players, "onServerPlaySound3D", playerValue, "audio/starving.wav", 0, 0, 0, false, 75, playerValue)
					triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgFood)
				end
				
				if(thirstLevel > 0.0) then
					setElementData(playerValue, "thirstLevel", math.max(0.0, getElementData(playerValue, "thirstLevel")-0.002), false)
					thirstLevel = getElementData(playerValue, "thirstLevel")
					
					if(thirstLevel > 0.199) and(thirstLevel < 0.201) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(playerValue, "onServerMsgAdd", playerValue, "Вас мучает жажда. Воспользуйтесь инвентарём(клавиша 'I') или найдите ближайшее кафе/бар/автомат.")
						triggerClientEvent(players, "onServerPlaySFX3D", playerValue, "pain_a", 2, math.random(0,6), 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgDrink)
					
					elseif((thirstLevel > 0.149) and(thirstLevel < 0.151)) or ((thirstLevel > 0.099) and(thirstLevel < 0.101)) or ((thirstLevel > 0.049) and(thirstLevel < 0.051)) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(players, "onServerPlaySFX3D", playerValue, "pain_a", 2, math.random(0,6), 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgDrink)
					
					elseif(thirstLevel < 0.0001) then
						local players = getNearbyElementsByType(playerValue, "player", 75.0)
						table.insert(players, playerValue)
						triggerClientEvent(playerValue, "onServerMsgAdd", playerValue, "Вы умираете от жажды. Воспользуйтесь инвентарём(клавиша 'I') или найдите ближайшее кафе/бар/автомат.")
						triggerClientEvent(players, "onServerPlaySFX3D", playerValue, "pain_a", 2, math.random(0,6), 0, 0, 0, false, 75, playerValue)
						triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgDrink)
					end
					
				else
					local players = getNearbyElementsByType(playerValue, "player", 75.0)
					table.insert(players, playerValue)
					triggerClientEvent(players, "onServerPlaySFX3D", playerValue, "pain_a", 2, math.random(0,6), 0, 0, 0, false, 75, playerValue)
					setElementHealth(playerValue, getElementHealth(playerValue)-1)
					triggerClientEvent(players, "onThinkBubbleCreate", playerValue, thinkContentImgDrink)
				end
			end
			
			if(hp <= 0) then
				hp = 100
			
			elseif(hp < 200.0) and isPlayerInHospital(playerValue) then
				local players = getNearbyElementsByType(playerValue, "player", 75.0)
				table.insert(players, playerValue)
				hp = math.min(200.0, hp + 2.5)
				setElementHealth(playerValue, hp)
				triggerClientEvent(players, "onCreateProgressPopup", playerValue, "images/hp.png", playerValue, true)
				hp = getElementHealth(playerValue)
			end
			
		end
		
		local updateStr = "UPDATE users SET hungry=?, thirst=?, health=?, armor=?"
		
		if procWeapons then
			syncClientWeaponData(playerValue)
		end
		
		stamina = getPedStat(playerValue, 22)
		maxHp = getPedStat(playerValue, 24)
		driving = getPedStat(playerValue, 160)
		cycling = getPedStat(playerValue, 230)
		biking = getPedStat(playerValue, 229)
		flying = getPedStat(playerValue, 169)
		if procStats then
			if isAdmin(playerValue) or isModerator(playerValue) then
				stamina = 1000
		        maxHp = 1000
		        driving = 1000
		        cycling = 1000
		        biking = 1000
		        flying = 1000
			end
			oldStamina = stamina
			speed = Vector3(getElementVelocity(playerValue)).length
			
			if speed > 0.0 then
				if stamina < 1000.0 then
					local veh = getPedOccupiedVehicle(playerValue)
					
					if veh and(speed > 0.1) then
						local vehType = getVehicleType(veh)
						
						if vehType == "BMX" then
							stamina = stamina + 50.0/30.0
							maxHp = math.min(1000.0, maxHp + 0.1)
							cycling = math.min(1000, cycling + 1)
						
						elseif(vehType == "Automobile") or (vehType == "Monster Truck") then
							driving = math.min(1000, driving + 1)
						
						elseif(vehType == "Bike") or (vehType == "Quad") then
							biking = math.min(1000, biking + 1)
						
						elseif(vehType == "Plane") or (vehType == "Helicopter") then
							flying = math.min(1000, flying + 1)
						end
						
					elseif isElementInWater(playerValue) then
						stamina = stamina + 50.0/15.0
						maxHp = math.min(1000.0, maxHp + 0.1)
					
					elseif isPedOnGround(playerValue) and(speed > 0.1) then
						stamina = stamina + 50.0/30.0
						maxHp = math.min(1000.0, maxHp + 0.1)
					end
					
					stamina = math.min(1000.0, stamina)
				end
			end
			
			if(stamina > 0.0) and(oldStamina == stamina) then
				stamina = math.max(0.0, stamina - 0.1)
			end
			
			setPedStat(playerValue, 22, stamina)
			setPedStat(playerValue, 24, maxHp)
			setPedStat(playerValue, 160, driving)
			setPedStat(playerValue, 230, cycling)
			setPedStat(playerValue, 229, biking)
			setPedStat(playerValue, 169, flying)
		end
		updateStr = updateStr..", stamina=?, maxhp=?, driving=?, cycling=?, biking=?, flying=? WHERE name=?"
		dbExec(db, updateStr, hungryLevel, thirstLevel, hp, armor, stamina, maxHp, driving, cycling, biking, flying, getHash(getPlayerName(playerValue)))
		wanted = getPlayerWantedLevel(playerValue)
		
		if(wanted > 0) and procWanted then
			local policeDist
			local allPlayers = getElementsByType("player")
			local plrInt = getElementInterior(playerValue)
			local plrDim = getElementDimension(playerValue)
			local plrX, plrY = getElementPosition(playerValue)
			local trgDist = 100.0*wanted
			local curDist, curX, curY
			
			for _,curPlr in ipairs(allPlayers) do
				if(curPlr ~= playerValue) and isPlayerFromPolice(curPlr) and(getElementInterior(curPlr) == plrInt) and(getElementDimension(curPlr) == plrDim) then
					curX, curY = getElementPosition(curPlr)
					curDist = getDistanceBetweenPoints2D(plrX, plrY, curX, curY)
					
					if policeDist and(curDist < policeDist) or (not policeDist) then
						policeDist = curDist
					end
					
				end
			end
			
			if(not policeDist) or (policeDist > trgDist) then
				if wantedCooldowns[playerValue] then
					wantedCooldowns[playerValue] = wantedCooldowns[playerValue] + 1
					
					if(wantedCooldowns[playerValue] > 9*wanted) then
						wantedLevelClear(playerValue)
					end
				else
					wantedCooldowns[playerValue] = 1
				end
				
			else
				if wantedCooldowns[playerValue] then
					wantedCooldowns[playerValue] = math.max(wantedCooldowns[playerValue] - 1, 0)
				end
			end
		end
	end
end

function savePlayerDataCoroutine()
	local players
	local startTick = getTickCount()
	local plrCounter = 0
	
	while true do
		players = getElementsByType("player")
		
		for _,playerValue in ipairs(players) do
			saveCurrentPlayer(playerValue, false, true, true, true, true)
			plrCounter = plrCounter+1
			
			if((getTickCount()-startTick) >= 1000) or (plrCounter >= 500) then
				coroutine.yield()
				plrCounter = 0
				startTick = getTickCount()
			end
		end
		
		coroutine.yield()
		plrCounter = 0
		startTick = getTickCount()
	end
end

function ammuBuyWeapon(ammuCurWeap)
	local tmpWeapons = {}
	for _,weaplvl in ipairs(ammuWeapons) do
		for _,weap in ipairs(weaplvl) do
			table.insert(tmpWeapons, weap)
		end
	end
	local weapprice = tmpWeapons[ammuCurWeap][4]
	
	if(getMoney(source) >= weapprice) then
		local weapid = tmpWeapons[ammuCurWeap][1]
		local weapammo = tmpWeapons[ammuCurWeap][3]
		
		if(weapid == 1242) then
			if(getPedArmor(source) < 100) then
				addNewEventToLog(getPlayerName(source), "Аммуниция - Покупка - Armor(100)", true)
				local ammuId = getElementDimension(source)
				local income = math.ceil(weapprice*0.5)
				setPedArmor(source, weapammo)
				takeMoney(source, weapprice)
				local baseid = clanBaseBusinesses[ammuShops[ammuId][7]]
				
				if baseid and clanBases[baseid][25] then
					clanBaseGiveMoney(baseid, weapprice-income, true)
				end
				
				if(ammuShops[ammuId][9] ~= 0) then
					ammuShops[ammuId][8] = ammuShops[ammuId][8]+income
					dbExec(db, "UPDATE businesses SET money=? WHERE id=?", ammuShops[ammuId][8], ammuShops[ammuId][7])
				end
				
			end
		else
			if giveWeapon(source, weapid, weapammo, true) then
				--local slotid = getSlotFromWeapon(weapid)
				--local curWeapAmmo = getPedTotalAmmo(source, slotid)
				--if(dbExec(db, string.format("UPDATE users SET w%d=?, w%dammo=? WHERE name=?", slotid, slotid), weapid, curWeapAmmo, getHash(getPlayerName(source)))) then
				addNewEventToLog(getPlayerName(source), "Аммуниция - Покупка - "..getWeaponNameFromID(weapid).."("..tostring(weapammo)..")", true)
				local ammuId = getElementDimension(source)
				local income = math.ceil(weapprice*0.5)
				takeMoney(source, weapprice)
				local baseid = clanBaseBusinesses[ammuShops[ammuId][7]]
				
				if baseid and clanBases[baseid][25] then
					clanBaseGiveMoney(baseid, weapprice-income, true)
				end
				
				if(ammuShops[ammuId][9] ~= 0) then
					ammuShops[ammuId][8] = ammuShops[ammuId][8]+income
					dbExec(db, "UPDATE businesses SET money=? WHERE id=?", ammuShops[ammuId][8], ammuShops[ammuId][7])
				end
				
				outputChatBox(generateTimeString().."[Аммуниция]: Вы купили оружие "..getWeaponNameFromID(weapid).."("..tostring(weapammo)..") за $"..tostring(weapprice)..".", source, 255, 64, 64)
				--end
			
			else
				outputChatBox(generateTimeString().."[Аммуниция]: Вы достигли ограничения по боезапасу данного оружия.", source, 255, 64, 64)
			end
		end
	else
		outputChatBox(generateTimeString().."[Аммуниция]: Недостаточно денежных средств.", source, 255, 64, 64)
	end
end

function ammuExit()
	setElementFrozen(source, false)
	setElementCollisionsEnabled(source, true)	
end

function carTuneMarkerHit(hitElement, tunecp)
	if(getElementType(hitElement) == "vehicle") then
		local occupant = getVehicleOccupant(hitElement)
		local owner = getElementData(hitElement, "owner")
		
		if(occupant) and(owner) and(getHash(getPlayerName(occupant)) == owner) and(getElementHealth(occupant) > 0) then
			if(getVehicleType(hitElement) == "Automobile" or getVehicleType(hitElement) =="Bike" or getVehicleType(hitElement) =="Monster Truck" or getVehicleType(hitElement) =="Plane" or getVehicleType(hitElement) =="Helicopter" or getVehicleType(hitElement) =="Quad") then
				for i,cp in ipairs(carTuneCps) do
					if(cp[5] == tunecp) then
						local occupants = getVehicleOccupants(hitElement)
						
						for oKey,oVal in pairs(occupants) do
							if(oVal == occupant) then
								removePedFromVehicle(oVal)
								warpPedIntoVehicle(oVal, hitElement)
							else
								removePedFromVehicle(oVal)
							end
						end
						
						carTuneEnter(i, hitElement, occupant)
						return true
					end
				end
			else
				triggerClientEvent(occupant, "onServerMsgAdd", resourceRoot, "Вы можете тюнинговать только личные легковые автомобили")
			end
		end
	end
	return false
end

function carTuneEnter(tuneid, car, driver)
	addNewEventToLog(getPlayerName(driver), "Тюнинг - Вход - ID "..tostring(tuneid)..", Транспорт "..getVehicleName(car), true)
	
	while carTuneDimensions[carTuneDimensionId] do
		carTuneDimensionId = carTuneDimensionId+1
		
		if(carTuneDimensionId > 65535) then
			carTuneDimensionId = 1
		end	
	end
	
	setElementDimension(car, carTuneDimensionId)
	setElementDimension(driver, carTuneDimensionId)
	carTuneDimensions[carTuneDimensionId] = driver
	setElementPosition(car, carTuneCps[tuneid][1], carTuneCps[tuneid][2], carTuneCps[tuneid][3]+1.0)
	setElementRotation(car, 0, 0, carTuneCps[tuneid][4])
	setElementFrozen(car, true)
	setElementCollisionsEnabled(car, false)
	local carTuneCompUpgrades = {}
	
	for i=0,16 do
		carTuneCompUpgrades[i] = getVehicleCompatibleUpgrades(car, i)
	end
	
	triggerClientEvent(driver, "onCarTuneEnter", car, carTuneSlotNames, carTunePrices, colorNames, carTuneColorPrice, carTuneCompUpgrades)
end

function carTuneApplyUpgrade(car, upgradeslot, upgradeid)
	if(addVehicleUpgrade(car, upgradeid) and dbExec(db, string.format("UPDATE cars SET upgrade%d=? WHERE id=?", upgradeslot), upgradeid, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Upgrade "..tostring(upgradeid), true)
		takeMoney(source, carTunePrices[upgradeid-999])
	
	else
		removeVehicleUpgrade(car, upgradeid)
		triggerClientEvent(source, "onServerMsgAdd", resourceRoot, "Возникли технические проблемы с применением данного тюнинга к вашему автомобилю. Приносим извинения.")
	end
end

function carTuneRemoveUpgrade(car, upgradeslot, upgradeid)
	if(dbExec(db, string.format("UPDATE cars SET upgrade%d=0 WHERE id=?", upgradeslot), getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Продажа - Upgrade "..tostring(upgradeid), true)
		removeVehicleUpgrade(car, upgradeslot, upgradeid)
		giveMoney(source, carTunePrices[upgradeid-999])
	end
end

function carTuneSetColor(car, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, pj)
	if(dbExec(db, "UPDATE cars SET clrr1=?, clrg1=?, clrb1=?, clrr2=?, clrg2=?, clrb2=?, clrr3=?, clrg3=?, clrb3=?, clrr4=?, clrg4=?, clrb4=?, paintjob=? WHERE id=?", c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, pj, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Покраска", true)
		setVehicleColor(car, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12)
		setVehiclePaintjob(car, pj)
		takeMoney(source, carTuneColorPrice)
	end
end


function carTuneFlyAbility(car, price)
	if(dbExec(db, "UPDATE cars SET fly=? WHERE id=?", 1, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Летающее ТС", true)
		setElementData(car, "flyAbility", true)
		takeMoney(source, price)
	end
end

function carTuneBoost(car, boostLevel, price)
	if(dbExec(db, "UPDATE cars SET engineBoost = ? WHERE id = ?", boostLevel, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Форсирование(уровень " .. tostring(boostLevel) .. ")", true)
		setElementData(car, "engineBoost", boostLevel)
		local accelMult
		
		if(boostLevel == 0) then
			accelMult = 1.0
			
		elseif(boostLevel == 1) then
			accelMult = 1.1
		
		elseif(boostLevel == 2) then
			accelMult = 1.25
		
		elseif(boostLevel == 3) then
			accelMult = 1.5
		end
		
		local vehModel = getElementModel(car)
		local pvehHandling = getOriginalHandling(vehModel)
		
		if predefinedHandling[vehModel] and predefinedHandling[vehModel]["engineAcceleration"] and predefinedHandling[vehModel]["maxVelocity"] then
			setVehicleHandling(car, "engineAcceleration", predefinedHandling[vehModel]["engineAcceleration"]*accelMult)
			setVehicleHandling(car, "maxVelocity", predefinedHandling[vehModel]["maxVelocity"]*accelMult)
		
		else
			setVehicleHandling(car, "engineAcceleration", pvehHandling["engineAcceleration"]*accelMult)
			setVehicleHandling(car, "maxVelocity", pvehHandling["maxVelocity"]*accelMult)
		end
		
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
----броня
function carTuneArmor(car, armorLevel, price)
	if(dbExec(db, "UPDATE cars SET armorLevel=? WHERE id=?", armorLevel, getElementData(car, "sqlid"))) then
		addNewEventToLog(getPlayerName(source), "Тюнинг - Покупка - Прочность кузова(уровень "..tostring(armorLevel)..")", true)
		applyCarArmor(car, armorLevel)
		takeMoney(source, price)
	end
end

function carTuneExit(car)
	addNewEventToLog(getPlayerName(source), "Тюнинг - Выход - nil", true)
	carTuneDimensions[getElementDimension(source)] = nil
	local car = getElementData(source, "vehicle")
	local id = getElementData(car, "sqlid")
	local carhp = getElementHealth(car)
	local cardoors = {}
	local carwheels = {}
	for i=0,5 do
		cardoors[i] = getVehicleDoorState(car, i)
	end
	carwheels[1], carwheels[2], carwheels[3], carwheels[4] = getVehicleWheelStates(car)
	carSellRemoveUserVehicles(source)
	setElementDimension(source, 0)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM cars WHERE id=?", id)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	triggerEvent("onPlayerSelectAction", resourceRoot, source, 12, { -2, dbqueryresult[1] })
	car = getElementData(source, "vehicle")
	warpPedIntoVehicle(source, car)
	setVehicleWheelStates(car, carwheels[1], carwheels[2], carwheels[3], carwheels[4])
	
	for i=0,5 do
		setVehicleDoorState(car, i, cardoors[i])
	end
	
	setElementHealth(car, carhp)
	setElementGhostMode(car, 3000)
	--[[
	setElementDimension(car, 0)
	setElementDimension(source, 0)
	setElementGhostMode(car, 3000)
	setElementFrozen(car, false)
	setElementCollisionsEnabled(car, true)
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
	]]
end

function applyCarArmor(veh, lvl)
	setElementData(veh, "armorLevel", lvl)
	local vehHandling = getModelHandling(getElementModel(veh))
	if(lvl > 1) then
	setVehicleHandling(veh, "collisionDamageMultiplier", 0.15)
		--setVehicleHandling(veh, "collisionDamageMultiplier", 0.0)
		--setVehicleHandling(veh, "mass", vehHandling["mass"]*3.0)
		--setVehicleHandling(veh, "turnMass", vehHandling["turnMass"]*3.0)
	end
end

function housesBuy(houseid, buyer)
	if(houses[houseid][11] == 0) then
		local hsqlindex = houses[houseid][1]
		local buyerHash = getHash(getPlayerName(buyer))
		
		if houseOwners[buyerHash] and(houseOwners[buyerHash] >= 3) then
			playerShowMessage(buyer, "Нельзя приобретать в собственность больше трёх домов.")
			return false
			
		elseif dbExec(db, "UPDATE houses SET owner=? WHERE id=?", buyerHash, hsqlindex) then
			addNewEventToLog(getPlayerName(buyer), "Дом - Покупка - SQL ID "..hsqlindex, true)
			takeMoney(buyer, houses[houseid][3])
			houses[houseid][11] = buyerHash
			local hx, hy, hz = getElementPosition(houses[houseid][4])
			destroyElement(houses[houseid][4])
			houses[houseid][4] = createPickup(hx, hy, hz, 3, housePickupModelNotAvailable, 0)
			attachActionToElement(defaultActions[128], houses[houseid][4])
			attachActionToElement(defaultActions[2], houses[houseid][4])
			attachActionToElement(defaultActions[14], houses[houseid][4])
			attachActionToElement(defaultActions[29], houses[houseid][4])
			attachActionToElement(defaultActions[12], houses[houseid][4])
			setPickupText(houses[houseid][4], "Занят", 255, 0, 0)
			
			if houseOwners[buyerHash] then
				houseOwners[buyerHash] = houseOwners[buyerHash] + 1
			else
				houseOwners[buyerHash] = 1
			end
			
			return true
		end
	end
	return false
end

function housesSell(houseid, seller)
	if(houses[houseid][11] == getHash(getPlayerName(seller))) then
		local hsqlindex = houses[houseid][1]
		local sellerHash = getHash(getPlayerName(seller))
		
		if(dbExec(db, "UPDATE houses SET owner=0 WHERE id=?", hsqlindex)) then
			addNewEventToLog(getPlayerName(seller), "Дом - Продажа - SQL ID "..hsqlindex, true)
			
			if(houseid == saveHouseGet(seller)) then
				saveHouseSet(seller, 0)
			end
			
			giveMoney(seller, math.floor(houses[houseid][3]/2))
			houses[houseid][11] = 0
			local hx, hy, hz = getElementPosition(houses[houseid][4])
			destroyElement(houses[houseid][4])
			houses[houseid][4] = createPickup(hx, hy, hz, 3, housePickupModelAvailable, 0)
			attachActionToElement(defaultActions[1], houses[houseid][4])
			setPickupText(houses[houseid][4], "$"..tostring(houses[houseid][3]), 0, 200, 0)
			houseOwners[sellerHash] = houseOwners[sellerHash] - 1
			
			if(houseOwners[sellerHash] < 1) then
				houseOwners[sellerHash] = nil
			end
			
			return true
		end
	end
	return false
end

function luckyPhoneActivate()
	luckyPhoneCurrent = math.random(table.getn(luckyPhoneCoords))
	--outputChatBox("Activate phone: "..tostring(luckyPhoneCurrent))
	luckyPhoneRing()
end

function luckyPhoneProcess()
	if not luckyPhoneCoroutine then
		luckyPhoneCoroutine = coroutine.create(luckyPhoneProcessCoroutine)
	end
	
	coroutine.resume(luckyPhoneCoroutine)
end

function luckyPhoneProcessCoroutine()
	while true do
		if(luckyPhoneCurrent > 0) then
			if(not(isTimer(luckyPhoneRingCycleTimer))) then
				luckyPhoneRingCycleTimer = setTimer(luckyPhoneRing, 5000, 1)
			end
			
			local allPlayers = getAlivePlayers()
			
			for _,alivePlr in ipairs(allPlayers) do
				if(not(isPedInVehicle(alivePlr))) then
					local px, py, pz = getElementPosition(alivePlr)
					
					if(getDistanceBetweenPoints3D(px, py, pz, luckyPhoneCoords[luckyPhoneCurrent][1], luckyPhoneCoords[luckyPhoneCurrent][2], luckyPhoneCoords[luckyPhoneCurrent][3]) < 0.7) then
						luckyPhoneApplyOnPlayer(alivePlr)
						break
					end
					
				end
			end
			
		else
			if(not(isTimer(luckyPhoneNextTimer))) then
				luckyPhoneNextTimer = setTimer(luckyPhoneActivate, 60000, 1)
			end		
		end
		
		coroutine.yield()
	end
end

function luckyPhoneApplyOnPlayer(winner)
	local winMoney = math.random(luckyPhoneMoneyMin, luckyPhoneMoneyMax)
	addNewEventToLog(getPlayerName(winner), "Счастливый звонок - Выигрыш - nil", true)
	giveMoney(winner, winMoney)
	local cx, cy, cz = getElementPosition(winner)
	local curCol = createColSphere(cx, cy, cz, 200)
	triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onLuckyPhoneWin", winner, winMoney)
	destroyElement(curCol)
	
	if(isTimer(luckyPhoneRingCycleTimer)) then
		killTimer(luckyPhoneRingCycleTimer)
	end
	
	luckyPhoneCurrent = 0
end

function luckyPhoneRing()
	local curCol = createColSphere(luckyPhoneCoords[luckyPhoneCurrent][1], luckyPhoneCoords[luckyPhoneCurrent][2], luckyPhoneCoords[luckyPhoneCurrent][3], 200)
	triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onLuckyPhoneRing", resourceRoot, luckyPhoneCoords[luckyPhoneCurrent][7])
	destroyElement(curCol)
end

function fuelProcess(curVeh)
	local vehicles
	local fuelLevel, vehController, vehSpeed, velx, vely, velz
	local vhandling
	local vtype
	local fuelExists
	local engineType
	
	if isElement(curVeh) and(getElementType(curVeh) == "vehicle") then
		vehicles = {}
		table.insert(vehicles, curVeh)
	else
		vehicles = getElementsByType("vehicle")
	end
	
	for _,veh in ipairs(vehicles) do
		if getElementSyncer(veh) then
			engineType = getElementData(veh, "engineType")
			
			if not engineType then
				vhandling = getVehicleHandling(veh)
				setElementData(veh, "engineType", vhandling["engineType"], false)
				engineType = vhandling["engineType"]
			end
			
			vtype = getVehicleType(veh)
			fuelExists = ((vtype == "Automobile") or (vtype == "Bike") or (vtype == "Monster Truck") or (vtype == "Quad") or (vtype == "Plane") or (getElementModel(veh) == 611))
			fuelLevel = getElementData(veh, "fuelLevel")
			--local canTurnOffEngine = fuelExists
			fuelExists = fuelExists and(not(engineType == 'electric'))
			--local hp = getElementHealth(veh)
			--if canTurnOffEngine and(hp < 500.0) and(not isVehicleBlown(veh)) and(not getElementData(veh, "explodable")) then
				--setElementHealth(veh, 499.0)
				--setVehicleEngineState(veh, false)
				--setVehicleOverrideLights(veh, 1)
			--elseif fuelLevel then
			if fuelLevel then
				if fuelExists then
					vehController = getVehicleController(veh)
					if(vehController) and(getElementType(vehController) == "player") then
						--setVehicleOverrideLights(veh, 0)
						velx, vely = getElementVelocity(veh)
						vehSpeed = ((velx^2+vely^2)^(0.5))*36
						if(fuelLevel > 0) then
							if(vehSpeed > 0) then
								setElementData(veh, "fuelLevel", math.max(0, fuelLevel- (vehSpeed*0.00003)))
								local vid = getElementData(veh, "sqlid")
								
								if vid then
									dbExec(db, "UPDATE cars SET fuel=? WHERE id=?", fuelLevel, vid)
								end
								
							end
							--setVehicleEngineState(veh, true)
						--else
							--setVehicleEngineState(veh, false)
						end
						if(vehSpeed == 0) then
							for i2=1,table.getn(fuelStations) do
								if(isElementWithinMarker(veh, fuelStations[i2][4])) then
									local fuelInc = math.min(1,fuelLevel+0.05)-fuelLevel
									
									if(fuelInc >= 0.01) then
										local fuelIncPrice = math.ceil(fuelInc*fuelPrice)
										local controllerMoney = getMoney(vehController)
										
										if(controllerMoney < fuelIncPrice) then
											fuelInc = math.max(0, controllerMoney/fuelPrice)
											fuelIncPrice = math.floor(fuelInc*fuelPrice)
										end
										
										if(fuelInc > 0) then
											setElementData(veh, "fuelLevel", fuelLevel+fuelInc)
											local vid = getElementData(veh, "sqlid")
											
											if vid then
												dbExec(db, "UPDATE cars SET fuel=? WHERE id=?", fuelLevel, vid)
											end
											
											takeMoney(vehController, math.max(1, fuelIncPrice))
											break
										end
									end
								end
							end
						end
					--elseif not vehController then
						--setVehicleEngineState(veh, false)
						--setVehicleOverrideLights(veh, 1)
					end
				
				else
					removeElementData(veh, "fuelLevel")
				end
				
			else
				if fuelExists then
					setElementData(veh, "fuelLevel", math.random(fuelRandomLevelMin, fuelRandomLevelMax)/100)
				end
			end
			
		end
	end
end

function setElementGhostMode(elem, timeEnabled)
	if elem then
		triggerClientEvent(getElementsByType("player"), "onElementGhostMode", elem, true)
		setTimer(function(elem)
					if(isElement(elem)) then
						triggerClientEvent(getElementsByType("player"), "onElementGhostMode", elem, false)
					end
				 end, timeEnabled, 1, elem)
	end
end

function carSellBuy(cid, buyer, checkid)
	if isPlayerBusy(buyer) then
		triggerClientEvent(buyer, "onServerMsgAdd", buyer, "Закончите остальные дела, прежде чем купить транспорт.")
	else
		local veh = carSellAvailableCars[cid][1]
		if(getElementModel(veh) == checkid) then
			local bhash = getHash(getPlayerName(buyer))
			local c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12 = getVehicleColor(veh, true)
			local vehmodel = getElementModel(veh)
			local hp = math.floor(getElementHealth(veh))
			
			if(dbExec(db, "INSERT INTO cars(carid, clrr1, clrg1, clrb1, clrr2, clrg2, clrb2, clrr3, clrg3, clrb3, clrr4, clrg4, clrb4, hp, owner) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", vehmodel, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, hp, bhash)) then
				
				repeat
					dbq = dbQuery(db, "SELECT last_insert_id() AS id")
					dbqueryresult = dbPoll(dbq, 120000)
					dbFree(dbq)
				until dbqueryresult
				
				if(dbqueryresult) then
					addNewEventToLog(getPlayerName(buyer), "Личный транспорт - Покупка - "..getVehicleName(veh), true)
					carSellRemoveUserVehicles(buyer)
					local shopid = carSellCarSpawnPoints[cid][5]
					setElementData(veh, "fuelLevel", 1)
					setVehicleLocked(veh, false)
					setElementFrozen(veh, false)
					setVehicleDamageProof(veh, false)
					setElementData(veh, "owner", bhash, false)
					setElementData(buyer, "vehicle", veh, false)
					setElementData(veh, "hp", hp, false)
					setElementData(veh, "sqlid", dbqueryresult[1]["id"], false)
					setElementData(veh, "engineBoost", 0)
					applyCarArmor(veh, 0)
					carSellSQLIds[dbqueryresult[1]["id"]] = veh
					warpPedIntoVehicle(buyer, veh)
					clearActions(veh)
					attachActionToElement(defaultActions[127], veh)
					attachActionToElement(defaultActions[60], veh)
					attachActionToElement(defaultActions[62], veh)
					setElementPosition(veh, carSellBuySpawns[shopid][1], carSellBuySpawns[shopid][2], carSellBuySpawns[shopid][3])
					setElementRotation(veh, 0, 0, carSellBuySpawns[shopid][4])
					setElementGhostMode(veh, 3000)
					takeMoney(buyer, carSellAvailableCars[cid][3])
					carSellAvailableCars[cid] = nil
					triggerClientEvent(getElementsByType("player"), "onCarSellUpdate", resourceRoot, carSellAvailableCars)
					return true
				end
				
			end
		end
	end
	return false
end

function carSellSell(veh, seller, sqlid, price)
	if isElement(seller) then
		repeat
			dbq = dbQuery(db, "SELECT carid FROM cars WHERE id=?", sqlid)
			dbqueryresult = dbPoll(dbq, 120000)
			dbFree(dbq)
		until dbqueryresult
		
		if dbqueryresult[1] then
			local carName = getVehicleNameFromModel(dbqueryresult[1]["carid"])
			
			if(dbExec(db, "DELETE FROM cars WHERE id=?", sqlid)) then
				addNewEventToLog(getPlayerName(seller), "Личный транспорт - Продажа - "..carName, true)
				carSellSQLIds[sqlid] = nil
				
				if(isElement(veh)) then
					destroyElement(veh)
				end
				
				giveMoney(seller, price)
				
				return true
			end
			
		end
	end
	return false
end

function carSellRemoveUserVehicles(owner)
	local veh = getElementData(owner, "vehicle")
	
	if veh and(isElement(veh)) then
		setElementData(owner, "vehicle", nil)
		carSellSQLIds[getElementData(veh, "sqlid")] = nil
		destroyElement(veh)
		return true
	end
	
	return false
end

function vehicleEnter()
	fuelProcess(source)
end

function vehicleExit(exitingPlayer, seat, jacked)
	if(seat == 0) then
		fuelProcess(source)
		local eId = specialEventGetEventByElement(source)
		
		if eId then
			setElementHealth(exitingPlayer, 0.0)
			specialEventRemoveElement(eId, source)
		end
		
	end
end

function vehicleStartEnter(enteringPlayer, seat, jacked)
	for _,carsell in ipairs(carSellAvailableCars) do
		if(source == carsell[1]) then
			cancelEvent()
			triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "Это транспортное средство находится в продаже. Воспользуйтесь меню действий(клавиша 'k') для его покупки.")
			break
		end
	end
	
	if(not wasEventCancelled()) and(seat == 0) then
		local owner = getElementData(source, "owner")
		
		if(owner) then
			if not (owner == getHash(getPlayerName(enteringPlayer))) then
				cancelEvent()
				triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "Это не ваше транспортное средство.")
			end
		end
		
		if(not wasEventCancelled()) then
			local clan = getElementData(source, "clan")
			
			if clan then
				local pclan = getPlayerClan(enteringPlayer)
				
				if not pclan then
					cancelEvent()
					triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "Это не ваше транспортное средство.")
				
				elseif(pclan ~= clan) then
					cancelEvent()
					triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "Это транспортное средство не принадлежит вашему клану.")
				end
				
			end
			
			if(not wasEventCancelled()) and(not(vehiclesOnWork[source] == nil)) and(not(vehiclesOnWork[source] == enteringPlayer)) then
				cancelEvent()
				triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "Это транспортное средство уже занято под работу другим игроком.")
			end
			
			if not wasEventCancelled() then
				local eId = specialEventGetEventByElement(source)
				
				if eId and jacked then
					cancelEvent()
				end
			end
		end
	
	elseif(not wasEventCancelled()) and(seat == 1) then
		for _,worker in ipairs(jobWorkers[10]) do
			if(source == worker[3]) then
				if(enteringPlayer == worker[1]) then
					cancelEvent()
					break
				
				elseif(getMoney(enteringPlayer) < worker[5]) then
					cancelEvent()
					triggerClientEvent(enteringPlayer, "onServerMsgAdd", enteringPlayer, "У вас недостаточно денег.")
					break
				end
				
			end
		end
	end
end

function vehicleStartExit(exitingPlayer, seat, jacked)
	if(seat == 0) then
		local eId = specialEventGetEventByElement(source)
		
		if eId then
			setElementHealth(exitingPlayer, 0.0)
			specialEventRemoveElement(eId, source)
		end
	end
end

function carSellProcess()
	if not carSellCoroutine then
		carSellCoroutine = coroutine.create(carSellProcessCoroutine)
	end
	
	coroutine.resume(carSellCoroutine)
end

function carSellProcessCoroutine()
	local veh, vcr, vcg, vcb, vcolortext, model, hp, hptext, vehhandling, price, carArrayIndex
	local distToCenterOfMass
	
	while true do
		for i,spawnPoint in ipairs(carSellCarSpawnPoints) do
			if(carSellAvailableCars[i] == nil) then
				carArray = carSellCarArrays[carSellBuySpawns[spawnPoint[5]][5]]
				model = carArray[math.random(table.getn(carArray))]
				hp = math.random(750, 1000)
				
				if(hp >= 900) then
					hp = 1000
					hptext = "Новое"
				else
					hptext = "Б/У"
				end
				
				vehhandling = getModelHandling(model)
				distToCenterOfMass = getDistanceBetweenPoints3D(vehhandling["centerOfMass"][1], vehhandling["centerOfMass"][2], vehhandling["centerOfMass"][3], 0, 0, 0)
				veh = createVehicle(model, spawnPoint[1], spawnPoint[2], spawnPoint[3]+distToCenterOfMass, 0, 0, spawnPoint[4])
				attachActionToElement(defaultActions[11], veh)
				setElementHealth(veh, hp)
				setVehicleLocked(veh, true)
				setElementFrozen(veh, true)
				setVehicleDamageProof(veh, true)
				vcr, vcg, vcb = getVehicleColor(veh, true)
				vcolortext = getColorName(vcr, vcg, vcb)
				price = getVehiclePrice(model)* (hp/1000)
				carSellAvailableCars[i] = { veh, getVehicleName(veh), price, string.format("%s", vcolortext), hptext, vcolortext }
			end
		end
		
		triggerClientEvent(getElementsByType("player"), "onCarSellUpdate", resourceRoot, carSellAvailableCars)
		coroutine.yield()
	end
end

function jobTruckerFinish(plr, deliveryPrice)
	if(source == resourceRoot) and(client == plr) then
		for i,worker in ipairs(jobWorkers[5]) do
			if(worker[1] == plr) and(getPedOccupiedVehicle(plr) == worker[3]) and(worker[2] == 0) and(not worker[8]) then
				jobWorkers[5][i][8] = true
				addNewEventToLog(getPlayerName(plr), "Перевозка грузов - Доставка - nil", true)
				giveMoney(plr, deliveryPrice)
				local respect = getElementData(plr, "respect")
				respectSet(plr, respect+ (deliveryPrice/15*0.00003), -1.0, 0.25, true)
				
				if worker[4] then
					destroyElement(worker[4])
					jobWorkers[5][i][4] = nil
				end
				
				triggerClientEvent(plr, "onJobTruckerStartReturn", plr, worker[5], worker[6], worker[7])
			end
		end
	end
end

function jobTruckerFinishReturn()
	addNewEventToLog(getPlayerName(source), "Перевозка грузов - Завершение - Успех", true)
	removeWorker(5, source, 1)
end

function jobTruckerTimesup()
	addNewEventToLog(getPlayerName(source), "Перевозка грузов - Завершение - Время вышло", true)
	removeWorker(5, source, 5)
end

function jobTruckerSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[5]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				jobWorkers[5][i][2] = state
				break
			end
		end
	end
end

function jobTruckerOnWasted()
	addNewEventToLog(getPlayerName(source), "Перевозка грузов - Завершение - Погиб", true)
	removeWorker(5, source, 2)
end

function jobTruckerBlowedUp()
	for _,worker in ipairs(jobWorkers[5]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Перевозка грузов - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobTruckerMoneyForBlowedCar)
			removeWorker(5, worker[1], 4)
		end
	end	
end

function jobTruckerLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Перевозка грузов - Завершение - Покинул транспорт", true)
	takeMoney(source, jobTruckerMoneyForLeftCar)
	removeWorker(5, source, 3)
end

function jobTruckerNowInVehicle(state)
	jobTruckerSetState(source, 0)
end

function jobTruckerTruckDestroyed()
	removeEventHandler("onVehicleExplode", source, jobTruckerTruckDestroyed)
	setTimer(function(veh)
				for i=1,table.getn(jobTruckerCarSpawnPoints) do
					if not (jobTruckerAvailableTrucks[i] == nil) then
						if(jobTruckerAvailableTrucks[i][1] == veh) then
							if(isElement(jobTruckerAvailableTrucks[i][4])) then
								destroyElement(jobTruckerAvailableTrucks[i][4])
								jobTruckerAvailableTrucks[i][4] = nil
							end
							
							destroyElement(jobTruckerAvailableTrucks[i][1])
							jobTruckerAvailableTrucks[i][1] = nil
							jobTruckerAvailableTrucks[i] = nil
							break
						end
					end
				end
			 end, 5000, 1, source)
end

function friendRequestAdd(plr, friend)
	if(source == resourceRoot) and(plr == client) then
		triggerClientEvent(friend, "onFriendReceiveAdd", plr)
	end
end

function friendRequestAccept(plr, sourceName, friendName)
	if(source == resourceRoot) and(plr == client) then
		local sHash = getHash(sourceName)
		local fHash = getHash(friendName)
		
		if(dbExec(db, "INSERT INTO friends(player, friend) VALUES(?, ?)", sHash, friendName)) then
			if(dbExec(db, "INSERT INTO friends(player, friend) VALUES(?, ?)", fHash, sourceName)) then
				addNewEventToLog(sHash, "Друзья - Добавление - "..friendName, true)
				addNewEventToLog(fHash, "Друзья - Добавление - "..sourceName, true)
				
				local friend = getPlayerFromName(friendName)
				
				if(friend) then
					triggerClientEvent(friend, "onFriendAdd", plr, sourceName)
				end
				
				triggerClientEvent(plr, "onFriendAdd", plr, friendName)
			end
		end
	end
end

function friendDel(plr, friendName)
	if(source == resourceRoot) and(plr == client) then
		local sourceName = getPlayerName(plr)
		local sHash = getHash(sourceName)
		local fHash = getHash(friendName)
		
		dbExec(db, "DELETE FROM friends WHERE player=? AND friend=?", sHash, friendName)
		dbExec(db, "DELETE FROM friends WHERE player=? AND friend=?", fHash, sourceName)
		addNewEventToLog(sHash, "Друзья - Удаление - "..friendName, true)
		addNewEventToLog(fHash, "Друзья - Удаление - "..sourceName, true)
		local friend = getPlayerFromName(friendName)
		
		if(friend) then
			triggerClientEvent(friend, "onFriendDel", plr, sourceName)
		end
		
	end
end

function friendPMSend(plr, friendName, msgText)
	if(source == resourceRoot) and(plr == client) then
		local friend = getPlayerFromName(friendName)
		
		if(friend) and(string.len(msgText) > 0) then
			local timeStr = generateTimeString()
			triggerClientEvent(friend, "onFriendPMReceive", plr, getPlayerName(plr), msgText, timeStr)
			triggerClientEvent(plr, "onFriendPMSuccess", plr, true, friendName, msgText, timeStr)
		
		else
			triggerClientEvent(plr, "onFriendPMSuccess", plr, false)
		end
	end
end

function findRotationVeh(x1,y1,x2,y2)
	local t = - (math.atan2(x2-x1,y2-y1)*180/math.pi)+360
	
	if t < 0 then t = t + 360 end
	
	if t > 360 then t = t - 360 end
	
	return t
end

function findRotation(x1,y1,x2,y2)
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  
  if t < 0 then t = t + 360 end
  return t
end

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(90 - angle)
    local dx = math.cos(a) * dist
    local dy = math.sin(a) * dist
    return x+dx, y+dy
end

function busStartEnterExit(plr, seatId, jacked)
	if(getElementType(plr) == "player") then
		local sx,sy,sz = getElementVelocity(source)
		if(((sx^2*sy^2*sz^2)^(0.5)) > 0) or (seatId == 0) or jacked then
			cancelEvent()
		end
	end
end

function busEnter(plr, seatId, jacked)
	--[[
	if(getElementType(plr) == "player") then
		if(getMoney(plr) < 5) then
			removePedFromVehicle(plr)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас недостаточно денег. Поездка на автобусе стоит $5.")
		else
			takeMoney(plr, 5)
		end
	end
	]]
end

function busProcess(busid)
	local posx, posy, posz, distToPoint
	bot = busesCars[busid][1]
	veh = busesCars[busid][2]
	dest = busesCars[busid][3]
	route = busesCars[busid][4]
	veh2 = busesCars[busid][8]
	repeat
		warpPedIntoVehicle(bot, veh2)
	until isPedInVehicle(bot)
	posx, posy, posz = getElementPosition(veh)
	
	if(dest < table.getn(busesPaths[route])) then
		busesCars[busid][3] = dest+1
	
	else
		busesCars[busid][3] = 1
	end
	
	dest = busesCars[busid][3]
	
	if(busesPaths[route][dest][5]) then
		busesCars[busid][5] = busesStopTime
		
		if not (busesPaths[route][dest][7] == busesCars[busid][9]) then
			busesCars[busid][7] = busesPaths[route][dest][7]
		end
		
	
	else
		busesCars[busid][5] = 0
	end
	
	distToPoint = getDistanceBetweenPoints3D(posx, posy, posz, busesPaths[route][dest][1], busesPaths[route][dest][2], busesPaths[route][dest][3])
	
	if((busesPaths[route][dest][6]) or (busesPaths[route][dest][5])) then
		targetSpeed = busesMaxSpeedOnTurn
	else
		targetSpeed = busesMaxSpeed
	end
	
	local moveTime = (distToPoint/ (targetSpeed*1000))*3600000
	local curPoint, prevPoint
	
	if(busesCars[busid][3] > 1) then
		curPoint = busesCars[busid][3]-1
	else
		curPoint = table.getn(busesPaths[route])
	end
	
	if(curPoint > 1) then
		prevPoint = curPoint-1
	else
		prevPoint = table.getn(busesPaths[route])
	end
	
	local rot1 = findRotation(busesPaths[route][prevPoint][1], busesPaths[route][prevPoint][2], busesPaths[route][curPoint][1], busesPaths[route][curPoint][2])
	local rot2 = findRotation(busesPaths[route][curPoint][1], busesPaths[route][curPoint][2], busesPaths[route][dest][1], busesPaths[route][dest][2])
	local pitch = math.deg(math.asin((busesPaths[route][dest][3]-busesPaths[route][curPoint][3])/getDistanceBetweenPoints3D(busesPaths[route][curPoint][1],busesPaths[route][curPoint][2],busesPaths[route][curPoint][3],busesPaths[route][dest][1],busesPaths[route][dest][2],busesPaths[route][dest][3])))
	local targetRot = rot2-rot1
	
	if(math.abs(targetRot) > 180) and(math.abs(targetRot) < 360) then
		if(targetRot > 0) then
			targetRot = targetRot-360
		else
			targetRot = targetRot+360
		end
	end
	
	setElementRotation(veh, pitch, 0, rot1)
	moveObject(veh, moveTime, busesPaths[route][dest][1], busesPaths[route][dest][2], busesPaths[route][dest][3], 0, 0, targetRot, "Linear")
	if(busesCars[busid][5] > 0) then
		setTimer(busStopWheels, moveTime, 1, bot, veh2)
	end
	setVehicleWheelStates(veh2, 3, 3, 3, 3)
	local cx, cy, cz = getElementPosition(veh)
	local curCol = createColSphere(cx, cy, cz, 300)
	triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onServerSetControlState", bot, "accelerate", 1)
	destroyElement(curCol)
	setTimer(busProcess, busesCars[busid][5]+moveTime, 1, busid)
end

function busStopWheels(bot, veh)
	local cx, cy, cz = getElementPosition(veh)
	local curCol = createColSphere(cx, cy, cz, 300)
	triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onServerSetControlState", bot, "accelerate", 0)
	setVehicleWheelStates(veh, 0, 0, 0, 0)
	destroyElement(curCol)
end

function jobCpFinishShow(worker, show)
	for _,cp in ipairs(jobCpFinish) do
		setElementVisibleTo(cp[1], worker, show)
		setElementVisibleTo(cp[2], worker, show)
	end
end

function jobCpFixShow(worker, show)
	for _,cp in ipairs(jobCpFix) do
		setElementVisibleTo(cp[1], worker, show)
		setElementVisibleTo(cp[2], worker, show)
	end
end

function isEvacuator(plr)
	if not isElement(plr) then
		return false
	end
	
	for _,workerInfo in ipairs(jobWorkers[4]) do
		if(workerInfo[1] == plr) then
			return true
		end
	end
	return false
end

function jobEvacuatorNewOrder(orderer)
	addNewEventToLog(getPlayerName(orderer), "Эвакуация - Вызов - nil", true)
	local ambMsg = string.format(generateTimeString().."[Эвакуация] %s вызывает эвакуатор. Местоположение обозначено на карте.", getPlayerName(orderer))
	local ox,oy,oz = getElementPosition(orderer)
	local ex,ey,ez,eint,edim
	local evacCount = 0
	
	for _,worker in ipairs(jobWorkers[4]) do
		ex,ey,ez = getElementPosition(worker[1])
		eint = getElementInterior(worker[1])
		edim = getElementDimension(worker[1])
		
		if(getDistanceBetweenPoints3D(ox,oy,oz,ex,ey,ez) < 2400) and(edim == getElementDimension(orderer)) and(eint == getElementInterior(orderer)) then
			outputChatBox(ambMsg, worker[1], 255, 128, 0, false)
			triggerClientEvent(worker[1], "onEvacOrderCreate", worker[1], ox, oy, oz)
			evacCount = evacCount+1
		end
	end
	
	if(evacCount > 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, string.format("Ваш заказ эвакуатора разослан %d автомобилям.", evacCount))
	
	elseif(evacCount == 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Ваш заказ эвакуатора разослан 1 автомобилю.")
	
	else
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Эвакуатор поблизости отсутствует.")
	end
end

function jobEvacuatorFillRequest(evacPlr, orderer)
	if not isElement(orderer) then
		return nil
	end
	
	local lowrider = getElementData(orderer, "lowrider")
	
	if lowrider then
		return nil
	end
	
	local rc = getElementData(orderer, "RC")
	
	if rc then
		return nil
	end
	
	local veh = getPedOccupiedVehicle(orderer)
	
	if not veh then
		return nil
	end
	
	local fuelLevel = getElementData(veh, "fuelLevel")
	
	if fuelLevel and(fuelLevel < 0.2) then
		triggerClientEvent(orderer, "onEvacuatorFillRequest", evacPlr, jobEvacuatorPriceFill)
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Вы предложили заправку транспортного средства игроку %s.", getPlayerName(orderer)))	
	else
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Транспорт игрока %s не нуждается в заправке.", getPlayerName(orderer)))	
	end
	
end

function jobEvacuatorFillAccept(evacPlr)
	if isElement(evacPlr) then
		local oVeh = getPedOccupiedVehicle(source)
		
		if oVeh then
			local fuelLevel = getElementData(oVeh, "fuelLevel")
			
			if fuelLevel and(fuelLevel < 0.2) then
				if(getMoney(source) >= jobEvacuatorPriceFill) then
					if not isEvacuator(source) then
						local serviceId = getElementData(evacPlr, "usergroup")
						if serviceId and serviceRegister(source, evacPlr, serviceId) then
							local respect = getElementData(evacPlr, "respect")
							respectSet(evacPlr, respect+0.000002, -1.0, 0.1, true)
						end
					end
					
					addNewEventToLog(getPlayerName(evacPlr), "Эвакуация - Заправка для игрока - "..getPlayerName(source), true)
					addNewEventToLog(getPlayerName(source), "Эвакуация - Заправка от игрока - "..getPlayerName(evacPlr), true)
					takeMoney(source, jobEvacuatorPriceFill)
					giveMoney(evacPlr, jobEvacuatorPriceFill)
					setElementData(oVeh, "fuelLevel", 1.0)
					triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Транспортное средство игрока %s было полностью заправлено.", getPlayerName(source)))
				
				else
					triggerEvent("onJobEvacuatorFillDecline", source, evacPlr)
					triggerClientEvent(source, "onServerMsgAdd", source, "У вас недостаточно денег.")
				end
			
			else
				triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Транспортное средство игрока %s не нуждается в заправке.", getPlayerName(source)))
			end
		end
	end
end

function jobEvacuatorFillDecline(evacPlr)
	if isElement(evacPlr) then
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Игрок %s отказался от услуги заправки транспортного средства.", getPlayerName(source)))
	end
end

function jobEvacuatorFixRequest(evacPlr, orderer)
	if not isElement(orderer) then
		return nil
	end
	
	local lowrider = getElementData(orderer, "lowrider")
	
	if lowrider then
		return nil
	end
	
	local rc = getElementData(orderer, "RC")
	
	if rc then
		return nil
	end
	
	local veh = getPedOccupiedVehicle(orderer)
	
	if not veh then
		return nil
	end
	
	local hp = getElementHealth(veh)
	
	if hp and(hp < 500.0) then
		triggerClientEvent(orderer, "onEvacuatorFixRequest", evacPlr, jobEvacuatorPriceFix)
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Вы предложили починку транспортного средства игроку %s.", getPlayerName(orderer)))		
	else
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Транспортное средство игрока %s не нуждается в починке.", getPlayerName(orderer)))
	end
	
end

function jobEvacuatorFixAccept(evacPlr)
	if isElement(evacPlr) then
		local oVeh = getPedOccupiedVehicle(source)
		
		if oVeh then
			if(getMoney(source) >= jobEvacuatorPriceFix) then
				if not isEvacuator(source) then
					local serviceId = getElementData(evacPlr, "usergroup")
					
					if serviceId and serviceRegister(source, evacPlr, serviceId) then
						local respect = getElementData(evacPlr, "respect")
						local hp = getElementHealth(oVeh)
						
						if hp then
							if(hp < 500.0) then
								respectSet(evacPlr, respect+0.000005, -1.0, 0.1, true)
							elseif(hp < 750.0) then
								respectSet(evacPlr, respect+0.000003, -1.0, 0.1, true)
							end
						end
						
					end
				end
				addNewEventToLog(getPlayerName(evacPlr), "Эвакуация - Ремонт для игрока - "..getPlayerName(source), true)
				addNewEventToLog(getPlayerName(source), "Эвакуация - Ремонт от игрока - "..getPlayerName(evacPlr), true)
				takeMoney(source, jobEvacuatorPriceFix)
				giveMoney(evacPlr, jobEvacuatorPriceFix)
				fixVehicle(oVeh)
				local rx, ry, rz = getElementRotation(oVeh)
				
				if(rx > 90.0) and(rx < 270.0) or (ry > 90.0) and(ry < 270.0) then
					setElementRotation(oVeh, 0.0, 0.0, rz)
				end
				
				local cx, cy, cz = getElementPosition(oVeh)
				local curCol = createColSphere(cx, cy, cz, 100)
				triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onServerPlaySFX3D", source, "script", 150, 0, 0, 0, 0, false, 100, oVeh)
				destroyElement(curCol)
				triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Транспортное средство игрока %s было починено.", getPlayerName(source)))
			
			else
				triggerEvent("onJobEvacuatorFixDecline", source, evacPlr)
				triggerClientEvent(source, "onServerMsgAdd", source, "У вас недостаточно денег.")				
			end
		end
	end
end

function jobEvacuatorFixDecline(evacPlr)
	if isElement(evacPlr) then
		triggerClientEvent(evacPlr, "onServerMsgAdd", evacPlr, string.format("Игрок %s отказался от услуги починки транспортного средства.", getPlayerName(source)))
	end	
end

function jobEvacuatorOnWasted()
	addNewEventToLog(getPlayerName(source), "Эвакуация - Завершение - Погиб", true)
	removeWorker(4, source, 2)
end

function jobEvacuatorBlowedUp()
	for _,worker in ipairs(jobWorkers[4]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Эвакуация - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobEvacuatorMoneyForBlowedCar)
			removeWorker(4, worker[1], 4)
		end
	end
end

function jobEvacuatorLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Эвакуация - Завершение - Покинул транспорт", true)
	takeMoney(source, jobEvacuatorMoneyForLeftCar)
	removeWorker(4, source, 3)
end

function jobEvacuatorNowInVehicle(state)
	jobEvacuatorSetState(source, state)
end

function jobEvacuatorSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[4]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					jobCpFinishShow(worker, true)
					jobCpFixShow(worker, true)
					jobWorkers[4][i][4] = nil
				
				elseif(state == 3) then
					jobCpFinishShow(worker, false)
					jobCpFixShow(worker, false)
				end
				
				jobWorkers[4][i][2] = state
				break
			end
		end		
	end
end

function jobLawnmowResetProgress()
	if(table.getn(jobLawnmowLawnsInProcess) <= 0) then
		for i,lawn in ipairs(jobLawnmowLawns) do
			if not (lawn[3]) then
				destroyElement(lawn[1])
				jobLawnmowLawns[i][1] = nil
				destroyElement(lawn[2])
				jobLawnmowLawns[i][2] = nil
			end
		end
		jobLawnmowLawns = {}
		local curBlip, curCp
		
		for _,lawnCoords in ipairs(jobLawnmowLawnCoords) do
			curBlip = createBlip(lawnCoords[1], lawnCoords[2], lawnCoords[3]-1.0, 7, 1, 255, 255, 255, 255, 1000, 300)
			curCp = createMarker(lawnCoords[1], lawnCoords[2], lawnCoords[3]-1.0, "cylinder", 4, 0, 128, 0, 128)
			setElementVisibleTo(curBlip, root, false)
			setElementVisibleTo(curCp, root, false)
			
			for _,worker in ipairs(jobWorkers[3]) do
				setElementVisibleTo(curBlip, worker[1], true)
				setElementVisibleTo(curCp, worker[1], true)
			end
			
			table.insert(jobLawnmowLawns, { curBlip, curCp, false })
		end
		
		jobLawnmowNeedToResetProgress = false
	end
end

function jobLawnmowLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Газонокосилка - Завершение - Покинул транспорт", true)
	takeMoney(source, jobLawnmowMoneyForLeftCar)
	removeWorker(3, source, 3)
end

function jobLawnmowNowInVehicle(state)
	jobLawnmowSetState(source, state)
end

function jobLawnmowDoneWithLawn()
	for i,worker in ipairs(jobWorkers[3]) do
		if(worker[1] == source) then
			addNewEventToLog(getPlayerName(source), "Газонокосилка - Кошение газона - ID "..tostring(worker[4]), true)
			giveMoney(worker[1], jobLawnmowMoneyForGrass*table.getn(jobLawnmowLawnCoords[worker[4]][4]))
			local respect = getElementData(source, "respect")
			respectSet(source, respect+0.000005, -1.0, 0.1, true)
			--destroyElement(jobLawnmowLawns[worker[4]][1])
			--jobLawnmowLawns[worker[4]][1] = nil
			--destroyElement(jobLawnmowLawns[worker[4]][2])
			--jobLawnmowLawns[worker[4]][2] = nil
			jobCollectItem(3, getPlayerName(source), worker[4])
			setElementVisibleTo(jobLawnmowLawns[worker[4]][1], source, false)
			setElementVisibleTo(jobLawnmowLawns[worker[4]][2], source, false)
			jobWorkers[3][i][5] = false
			break
		end
	end
	table.remove(jobLawnmowLawnsInProcess, lawnid)
	jobLawnmowSetState(source, 0)
	local numLawns = 0
	for _,lawn in ipairs(jobLawnmowLawns) do
		if isElement(lawn[1]) and(getElementType(lawn[1]) == "blip") then
			numLawns = numLawns+1
		end
	end
	--print(numLawns)
	--if(numLawns == 0) then
	--	jobLawnmowNeedToResetProgress = true
	--end
end

function jobLawnmowGrassPickedup(gx, gy, gz)
	local curCol = createColSphere(gx, gy, gz, 150)
	triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onCreateProgressPopup", source, "images/572.png", source, true)
	destroyElement(curCol)
	triggerClientEvent(source, "onJobProgress", source)
end

function jobLawnmowOnWasted()
	addNewEventToLog(getPlayerName(source), "Газонокосилка - Завершение - Погиб", true)
	removeWorker(3, source, 2)
end

function jobLawnmowBlowedUp()
	for _,worker in ipairs(jobWorkers[3]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Газонокосилка - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobLawnmowMoneyForBlowedCar)
			removeWorker(3, worker[1], 4)
		end
	end
end

function jobLawnmowSetState(worker, state)
	for j,curWorker in ipairs(jobWorkers[3]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					jobCpFinishShow(worker, true)
					jobCpFixShow(worker, true)
					
					for i,lawn in ipairs(jobLawnmowLawns) do
						if(isElement(lawn[1])) and(isElement(lawn[2])) and(not jobWasItemCollected(3, getPlayerName(worker), i)) then
							setElementVisibleTo(lawn[1], worker, true)
							setElementVisibleTo(lawn[2], worker, true)
						end
					end
				elseif(state == 1) then
					jobCpFinishShow(worker, false)
					jobCpFixShow(worker, false)
					
					for i,lawn in ipairs(jobLawnmowLawns) do
						if(isElement(lawn[1])) and(isElement(lawn[2])) and(not jobWasItemCollected(3, getPlayerName(worker), i)) then
							setElementVisibleTo(lawn[1], worker, false)
							setElementVisibleTo(lawn[2], worker, false)
						end
					end
					
				elseif(state == 3) then
					jobCpFinishShow(worker, false)
					jobCpFixShow(worker, false)
					
					for i,lawn in ipairs(jobLawnmowLawns) do
						if(isElement(lawn[1])) and(isElement(lawn[2])) and(not jobWasItemCollected(3, getPlayerName(worker), i)) then
							setElementVisibleTo(lawn[1], worker, false)
							setElementVisibleTo(lawn[2], worker, false)
						end
					end
					
				end
				
				jobWorkers[3][j][2] = state
				break
			end
		end		
	end
end

function jobWashroadsNowInVehicle(state)
	jobWashroadsSetState(source, state)
end

function jobWashroadsInit()
	for i,cpCoords in ipairs(jobWashroadsCpCoords) do
		jobWashroadsCps[i] = createMarker(cpCoords[1], cpCoords[2], cpCoords[3]-1.0, "cylinder", 3.0, 0, 0, 255, 128)
		jobWashroadsCpBlips[i] = createBlip(0, 0, 0, 0, 1, 0, 0, 255, 255, 0, 500)
		attachElements(jobWashroadsCpBlips[i], jobWashroadsCps[i])
		setElementVisibleTo(jobWashroadsCps[i], root, false)
		setElementVisibleTo(jobWashroadsCpBlips[i], root, false)
		addEventHandler("onMarkerHit", jobWashroadsCps[i], jobWashroadsMarkerHit)
	end
end

function jobWashroadsSetState(worker, state)
	for j,curWorker in ipairs(jobWorkers[2]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					jobCpFinishShow(worker, true)
					jobCpFixShow(worker, true)
					
					for i=1,table.getn(jobWashroadsCpCoords) do
						if(isElement(jobWashroadsCps[i])) and(isElement(jobWashroadsCpBlips[i])) and(not jobWasItemCollected(2, getPlayerName(worker), i)) then
							setElementVisibleTo(jobWashroadsCps[i], worker, true)
							setElementVisibleTo(jobWashroadsCpBlips[i], worker, true)
						end
					end
					
				elseif(state == 1) then
					jobCpFinishShow(worker, true)
					jobCpFixShow(worker, true)
					
					for i=1,table.getn(jobWashroadsCpCoords) do
						if(isElement(jobWashroadsCps[i]) and(isElement(jobWashroadsCpBlips[i])) and(not jobWasItemCollected(2, getPlayerName(worker), i))) then
							setElementVisibleTo(jobWashroadsCps[i], worker, false)
							setElementVisibleTo(jobWashroadsCpBlips[i], worker, false)
						end
					end
				elseif(state == 3) then
					jobCpFinishShow(worker, false)
					jobCpFixShow(worker, false)
					
					for i=1,table.getn(jobWashroadsCpCoords) do
						if(isElement(jobWashroadsCps[i]) and(isElement(jobWashroadsCpBlips[i])) and(not jobWasItemCollected(2, getPlayerName(worker), i))) then
							setElementVisibleTo(jobWashroadsCps[i], worker, false)
							setElementVisibleTo(jobWashroadsCpBlips[i], worker, false)
						end
					end
					
				end
				
				jobWorkers[2][j][2] = state
				break
			end
		end			
	end
end

function jobWashroadsTimesup(plr)
	if(source == resourceRoot) and(plr == client) then
		jobWashroadsSetState(plr, 1)
		for _,worker in ipairs(jobWorkers[2]) do
			if(worker[1] == plr) then
				addNewEventToLog(getPlayerName(plr), "Мойка дорог - Время вышло - nil", true)
				triggerClientEvent(getElementsByType("player"), "onServerDestroyAttachedEffects", plr, worker[3])
			end
		end
	end
end

function jobWashroadsOnWasted()
	addNewEventToLog(getPlayerName(source), "Мойка дорог - Завершение - Погиб", true)
	removeWorker(2, source, 2)
end

function jobWashroadsBlowedUp()
	for _,worker in ipairs(jobWorkers[2]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Мойка дорог - Завершение - Погиб", true)
			takeMoney(worker[1], jobWashroadsMoneyForBlowedCar)
			removeWorker(2, worker[1], 4)
		end
	end
end

function jobWashroadsLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Мойка дорог - Завершение - Покинул транспорт", true)
	takeMoney(source, jobWashroadsMoneyForLeftCar)
	removeWorker(2, source, 3)
end

function jobWashroadsMarkerHit(hitElem)
	if((getElementType(hitElem) == "player") and isElement(source) and isElementVisibleTo(source, hitElem)) then
		for i,cp in pairs(jobWashroadsCps) do
			if(isElement(cp)) then
				if(cp == source) then
					local playerVeh
					
					for _,worker in ipairs(jobWorkers[2]) do
						playerVeh = getPedOccupiedVehicle(hitElem)
						
						if(playerVeh == worker[3]) and(hitElem == worker[1]) and(not jobWasItemCollected(2, getPlayerName(hitElem), i)) then
							--destroyElement(cp)
							--jobWashroadsCps[i] = nil
							--destroyElement(jobWashroadsCpBlips[i])
							--jobWashroadsCpBlips[i] = nil
							jobCollectItem(2, getPlayerName(hitElem), i)
							setElementVisibleTo(cp, hitElem, false)
							setElementVisibleTo(jobWashroadsCpBlips[i], hitElem, false)
							triggerClientEvent(hitElem, "onJobProgress", hitElem, jobWashroadsIncTime, playerVeh)
							giveMoney(hitElem, jobWashroadsIncMoneyPerCp)
							local respect = getElementData(hitElem, "respect")
							respectSet(hitElem, respect+0.000001, -1.0, 0.1, true)
						end
					end
					
				end
			end
		end
	end
end

function jobProcess()
	if not jobCoroutine then
		jobCoroutine = coroutine.create(jobProcessCoroutine)
	end
	if(coroutine.status(jobCoroutine) == "suspended") then
		coroutine.resume(jobCoroutine)
	end
end

function jobProcessCoroutine()
	local startTick = getTickCount()
	while true do
		for key,worker in ipairs(jobWorkers[1]) do -- Выброс мусора
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobTrashmasterBackToVehicle", worker[1])
					jobWorkers[1][key][2] = -1
				else
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) then
							local noMarker = true
							
							for _,cp in ipairs(jobCpFinish) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									triggerClientEvent(worker[1], "onJobTrashmasterUnload", worker[1], false)
									addNewEventToLog(getPlayerName(worker[1]), "Вывоз мусора - Завершение - Успех", true)
									removeWorker(1, worker[1], 1)
									noMarker = false
									break
								end
							end
							
							if noMarker then
								for _,cp in ipairs(jobCpFix) do
									if(isElementWithinMarker(worker[1], cp[1])) then
										local cx, cy, cz = getElementPosition(worker[1])
										local curCol = createColSphere(cx, cy, cz, 150)
										triggerClientEvent(getElementsWithinColShape(curCol, "player"), "onCreateProgressPopup", worker[1], "images/408.png", worker[3], false)
										destroyElement(curCol)
										triggerClientEvent(worker[1], "onJobTrashmasterUnload", worker[1], true, jobTrashmasterUnloadCycle)
										noMarker = false
										break
									end
								end
								
								if noMarker then
									vx, vy = getElementPosition(workerVeh)
									local sectorId = getSectorByPoint(vx, vy)
									local sector = jobTrashmasterCps[sectorId]
									
									for i,cp in pairs(sector) do
										if((isElement(cp)) and(getElementType(cp) == "marker")) then
											if(isElementWithinMarker(worker[1], cp) and(worker[2] == 0) and(not jobWasItemCollected(1, getPlayerName(worker[1]), i))) then -- Trashmaster|State 0
												--destroyElement(jobTrashmasterCpBlips[i])
												--jobTrashmasterCpBlips[i] = nil
												--destroyElement(cp)
												--jobTrashmasterCps[sectorId][i] = nil
												jobCollectItem(1, getPlayerName(worker[1]), i)
												setElementVisibleTo(cp, worker[1], false)
												setElementVisibleTo(jobTrashmasterCpBlips[i], worker[1], false)
												local cx, cy, cz = getElementPosition(worker[1])
												local curCol = createColSphere(cx, cy, cz, 150)
												local players = getElementsWithinColShape(curCol, "player")
												destroyElement(curCol)
												triggerClientEvent(players, "onServerPlaySound3D", worker[1], "audio/job_trashcollect.wav", jobTrashmasterCpCoords[i][1], jobTrashmasterCpCoords[i][2], jobTrashmasterCpCoords[i][3], false, 100, worker[3])
												triggerClientEvent(players, "onCreateProgressPopup", worker[1], "images/408.png", worker[3], true)
												triggerClientEvent(worker[1], "onJobProgress", worker[1], jobTrashmasterIncTime)
											end
										end
									end
									
								end
							else
								break
							end
						
						elseif(worker[2] == 1) then
							local inMarker = false
							
							for _,cp in ipairs(jobCpFinish) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									triggerClientEvent(worker[1], "onJobTrashmasterUnload", worker[1], false)
									addNewEventToLog(getPlayerName(worker[1]), "Вывоз мусора - Завершение - Успех", true)
									removeWorker(1, worker[1], 1)
									inMarker = true
									break
								end
							end
							
							if inMarker then
								break
							end
						
						elseif(worker[2] == 2) then
							local inMarker = false
							
							for _,cp in ipairs(jobCpFix) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									local cx, cy, cz = getElementPosition(worker[1])
									local curCol = createColSphere(cx, cy, cz, 150)
									local players = getElementsWithinColShape(curCol, "player")
									destroyElement(curCol)
									triggerClientEvent(players, "onCreateProgressPopup", worker[1], "images/408.png", worker[3], false)
									triggerClientEvent(worker[1], "onJobTrashmasterUnload", worker[1], true, jobTrashmasterUnloadCycle)
									break
								end
							end
							
						end
						
					end
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobTrashmasterLeaveVehicle", worker[1], worker[2], jobTrashmasterTimeBackToVeh, worker[3])
				jobTrashmasterSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		
		for key,worker in ipairs(jobWorkers[2]) do -- Мойка дорог
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobWashroadsBackToVehicle", worker[1])
					jobWorkers[2][key][2] = -1
				else
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) or (worker[2] == 1) then
							local noMarker = true
							
							for _,cp in ipairs(jobCpFinish) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									addNewEventToLog(getPlayerName(worker[1]), "Мойка дорог - Завершение - Успех", true)
									removeWorker(2, worker[1], 1)
									noMarker = false
									break
								end
							end
							
							if noMarker then
								for _,cp in ipairs(jobCpFix) do
									if(isElementWithinMarker(worker[1], cp[1])) then
										local vehHp = getElementHealth(workerVeh)
										local vehFuel = getElementData(workerVeh, "fuelLevel")
										
										if(vehHp < 1000.0) then
											fixVehicle(workerVeh)
											local cx, cy, cz = getElementPosition(workerVeh)
											local curCol = createColSphere(cx, cy, cz, 150)
											local players = getElementsWithinColShape(curCol, "player")
											destroyElement(curCol)
											triggerClientEvent(players, "onServerPlaySFX3D", worker[1], "script", 150, 0, 0, 0, 0, false, 100, workerVeh)
										end
										
										if vehFuel and(vehFuel < 1.0) then
											setElementData(workerVeh, "fuelLevel", 1.0)
										end
										
										noMarker = false
										break
									end
									
								end
							
							else
								break
							end
							
						end
					end
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobWashroadsLeaveVehicle", worker[1], worker[2], jobWashroadsTimeBackToVeh, worker[3])
				jobWashroadsSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		
		if(jobLawnmowNeedToResetProgress) then
			jobLawnmowResetProgress()
		end
		
		for key,worker in ipairs(jobWorkers[3]) do -- Газонокосилка
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobLawnmowBackToVehicle", worker[1])
					jobWorkers[3][key][2] = -1
				else
				
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) then
							local noMarker = true
							
							for _,cp in ipairs(jobCpFinish) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									addNewEventToLog(getPlayerName(worker[1]), "Газонокосилка - Завершение - Успех", true)
									removeWorker(3, worker[1], 1)
									noMarker = false
									break
								end
							end
							
							if noMarker then
								for _,cp in ipairs(jobCpFix) do
									if(isElementWithinMarker(worker[1], cp[1])) then
										local vehHp = getElementHealth(workerVeh)
										local vehFuel = getElementData(workerVeh, "fuelLevel")
										
										if(vehHp < 1000.0) then
											fixVehicle(workerVeh)
											local cx, cy, cz = getElementPosition(workerVeh)
											local curCol = createColSphere(cx, cy, cz, 150)
											local players = getElementsWithinColShape(curCol, "player")
											destroyElement(curCol)
											triggerClientEvent(players, "onServerPlaySFX3D", worker[1], "script", 150, 0, 0, 0, 0, false, 100, workerVeh)
										end
										
										if vehFuel and(vehFuel < 1.0) then
											setElementData(workerVeh, "fuelLevel", 1.0)
										end
										
										noMarker = false
										break
									end
								end
								if noMarker then
									for i,lawn in pairs(jobLawnmowLawns) do
										if(isElement(lawn[2])) and(getElementType(lawn[2]) == "marker") then
											if(isElementWithinMarker(worker[1], lawn[2])) and(isElementVisibleTo(lawn[2], worker[1])) and(not jobWasItemCollected(3, getPlayerName(worker[1]), i)) then
												local curPickup
												triggerClientEvent(worker[1], "onJobLawnmowBeginLawn", worker[1], i, jobLawnmowLawnCoords[i][4], worker[3])
												--clearElementVisibleTo(lawn[1])
												--clearElementVisibleTo(lawn[2])
												--setElementVisibleTo(lawn[1], root, false)
												--setElementVisibleTo(lawn[2], root, false)
												jobWorkers[3][key][4] = i
												jobWorkers[3][key][5] = true
												jobLawnmowLawns[i][3] = true
												table.insert(jobLawnmowLawnsInProcess, i, true)
												jobLawnmowSetState(worker[1], 1)
												
												if isTestServer() then
													outputChatBox(string.format("%s - Lawnmow #%d - START", getPlayerName(worker[1]), i))
												end
												
												break
											end
										end
									end
									
								end
							
							else
								break
							end
						end
					end
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobLawnmowLeaveVehicle", worker[1], worker[2], 60000, worker[3])
				jobLawnmowSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		
		for key,worker in ipairs(jobWorkers[4]) do
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobEvacuatorBackToVehicle", worker[1])
					jobWorkers[4][key][2] = -1
				
				else
					--[[
					local towedVeh = getVehicleTowedByVehicle(workerVeh)
					if towedVeh then
						detachTrailerFromVehicle(workerVeh)
						attachTrailerToVehicle(workerVeh, towedVeh)
					end
					]]
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) or (worker[2] == 1) then
							local noMarker = true
							
							for _,cp in ipairs(jobCpFinish) do
								if(isElementWithinMarker(worker[1], cp[1])) then
									addNewEventToLog(getPlayerName(worker[1]), "Эвакуация - Завершение - Успех", true)
									removeWorker(4, worker[1], 1)
									noMarker = false
									break
								end
							end
							
							if noMarker then
								for _,cp in ipairs(jobCpFix) do
									if(isElementWithinMarker(worker[1], cp[1])) then
										local vehHp = getElementHealth(workerVeh)
										local vehFuel = getElementData(workerVeh, "fuelLevel")
										
										if(vehHp < 1000.0) then
											fixVehicle(workerVeh)
											local cx, cy, cz = getElementPosition(workerVeh)
											local curCol = createColSphere(cx, cy, cz, 150)
											local players = getElementsWithinColShape(curCol, "player")
											destroyElement(curCol)
											triggerClientEvent(players, "onServerPlaySFX3D", worker[1], "script", 150, 0, 0, 0, 0, false, 100, workerVeh)
										end
										
										if vehFuel and(vehFuel < 1.0) then
											setElementData(workerVeh, "fuelLevel", 1.0)
										end
										
										break
									end
								end
							end
						end
					end
				end
				
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobEvacuatorLeaveVehicle", worker[1], worker[2], jobWashroadsTimeBackToVeh, worker[3])
				jobEvacuatorSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		for key,worker in ipairs(jobWorkers[5]) do
			local workerVeh = getPedOccupiedVehicle(worker[1])
			local workerTrailer = false
			
			if workerVeh then
				workerTrailer = getVehicleTowedByVehicle(workerVeh)
			end
			
			if(workerVeh == worker[3]) then
				if((worker[4] == nil) or (workerTrailer == worker[4])) then
					if(worker[2] == 1) then
						triggerClientEvent(worker[1], "onJobTruckerBackToVehicle", worker[1])
						jobWorkers[5][key][2] = -1
					end
					
				elseif not (worker[2] == 1) then
					triggerClientEvent(worker[1], "onJobTruckerLeaveTrailer", worker[1], worker[2], jobTruckerTimeBackToVeh, worker[4])
					jobTruckerSetState(worker[1], 1)
				end
				
			elseif not (worker[2] == 1) then
				triggerClientEvent(worker[1], "onJobTruckerLeaveVehicle", worker[1], worker[2], jobTruckerTimeBackToVeh, worker[3])
				jobTruckerSetState(worker[1], 1)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		
		for i,spawnPoint in ipairs(jobTruckerCarSpawnPoints) do
			if(jobTruckerAvailableTrucks[i] == nil) then
				local dist = getDistanceBetweenPoints3D(jobTruckerCarSpawnPoints[i][1], jobTruckerCarSpawnPoints[i][2], jobTruckerCarSpawnPoints[i][3], jobTruckerTrucks[jobTruckerSpawnIndex][6], jobTruckerTrucks[jobTruckerSpawnIndex][7], jobTruckerTrucks[jobTruckerSpawnIndex][8])
				
				if(((jobTruckerTrucks[jobTruckerSpawnIndex][13] == 0) and spawnPoint[5]) or (jobTruckerTrucks[jobTruckerSpawnIndex][13] == i)) and(spawnPoint[6] == getVehicleType(jobTruckerTrucks[jobTruckerSpawnIndex][1])) and(dist > 400.0) then
					local veh
					local trailer = nil
					local vehMdl = jobTruckerTrucks[jobTruckerSpawnIndex][1]
					veh = createVehicle(vehMdl, spawnPoint[1], spawnPoint[2], spawnPoint[3]+jobTruckerTrucks[jobTruckerSpawnIndex][14], 0, 0, spawnPoint[4], "TRUCK", false, jobTruckerTrucks[jobTruckerSpawnIndex][9], jobTruckerTrucks[jobTruckerSpawnIndex][10])
					attachActionToElement(defaultActions[7], veh)
					setElementGhostMode(veh, 5000)
					setElementData(veh, "fuelLevel", 1.0)
					setElementFrozen(veh, true)
					setVehicleDamageProof(veh, true)
					addEventHandler("onVehicleExplode", veh, jobTruckerTruckDestroyed)
					
					if vehMdl == 428 then
						setElementData(veh, "explodable", true)
					end
					
					--[[
					if(jobTruckerTrucks[jobTruckerSpawnIndex][2] >= 400) then
						while not isElement(trailer) do
							trailer = createVehicle(jobTruckerTrucks[jobTruckerSpawnIndex][2], spawnPoint[1], spawnPoint[2], spawnPoint[3]+jobTruckerTrucks[jobTruckerSpawnIndex][14], 0, 0, spawnPoint[4], "TRUCK", false, jobTruckerTrucks[jobTruckerSpawnIndex][11], jobTruckerTrucks[jobTruckerSpawnIndex][12])
						end
						setElementGhostMode(trailer, 5000)
						attachTrailerToVehicle(veh, trailer)
						setElementFrozen(trailer, true)
						setVehicleDamageProof(trailer, true)
					end
					]]
					--local timemins = math.ceil(jobTruckerTrucks[jobTruckerSpawnIndex][5]/60000)
					local timemsec = math.ceil(math.ceil(dist*150.0)/60000)*60000
					local timetext = getTimeString(timemsec, "i", true, true)
					local vehType = getVehicleType(veh)
					local money = timemsec/600
					
					if(vehType == "Plane") or (vehType == "Helicopter") then
						money = math.ceil(money/1.5)
					end
					
					local moneytext = string.format("$%d", money)
					local disttext = string.format("%.1f км", dist/1000.0)
					jobTruckerAvailableTrucks[i] = { veh, jobTruckerSpawnIndex, false, trailer, jobTruckerTrucks[jobTruckerSpawnIndex][3], moneytext, timetext, disttext, timemsec, money }
				end
				--jobTruckerSpawnIndex = math.random(table.getn(jobTruckerTrucks))
				
				if(jobTruckerSpawnIndex < table.getn(jobTruckerTrucks)) then
					jobTruckerSpawnIndex = jobTruckerSpawnIndex+1
				else
					jobTruckerSpawnIndex = 1
				end
				
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
			
		end
		
		triggerClientEvent(getElementsByType("player"), "onJobTruckerUpdate", resourceRoot, jobTruckerAvailableTrucks)
		
		for _,worker in ipairs(jobWorkers[6]) do -- Скорая помощь
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				local vx, vy, vz = getElementVelocity(workerVeh)
				local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
				
				if not (vehSpeed > 0.0) then
					local finished = false
					
					for _,cp in ipairs(jobAmbulanceFinish) do
						if(isElementWithinMarker(worker[1], cp[4])) then
							finished = true
							break
						end
					end
					
					if finished then
						addNewEventToLog(getPlayerName(worker[1]), "Скорая помощь - Завершение - Успех", true)
						removeWorker(6, worker[1], 1)
						break
					end
					
				end
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
			
		end
		
		for key,worker in ipairs(jobWorkers[7]) do -- Сбор зерна
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobFarmBackToVehicle", worker[1])
					jobWorkers[7][key][2] = -1
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobFarmLeaveVehicle", worker[1], worker[2], jobFarmTimeBackToVeh, worker[3])
				jobFarmSetState(worker[1], 3)
			end	
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end	
			
		end
		
		for key,worker in ipairs(jobWorkers[8]) do -- Вспахивание поля
			local workerVeh = getPedOccupiedVehicle(worker[1])
			local workerTrailer = false
			
			if workerVeh then
				--workerTrailer = getVehicleTowedByVehicle(workerVeh)
				--addEventHandler("onTrailerDetach", workerTrailer, cancelTrailerDetach)
			end
			
			if(workerVeh == worker[3]) then
				--if workerTrailer and(workerTrailer == worker[6]) then
				--	if(worker[2] == 1) then
				--		triggerClientEvent(worker[1], "onJobFarm2BackToVehicle", worker[1])
				--		jobWorkers[8][key][2] = -1
				--	end
				--elseif not (worker[2] == 1) then
				--	triggerClientEvent(worker[1], "onJobFarm2LeaveTrailer", worker[1], worker[2], jobFarmTimeBackToVeh, worker[6])
				--	jobFarm2SetState(worker[1], 1)
				--end
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobFarm2BackToVehicle", worker[1])
					jobWorkers[8][key][2] = -1
				end
				
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobFarm2LeaveVehicle", worker[1], worker[2], jobFarmTimeBackToVeh, worker[3])
				jobFarm2SetState(worker[1], 3)
			end	
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
			
		end
		
		for key,worker in ipairs(jobWorkers[9]) do -- Перевозка генерала
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(militaryGeneralCar == workerVeh) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onMilitaryGeneralBackToVehicle", worker[1])
					jobWorkers[9][key][2] = -1
				else
					local vx, vy, vz = getElementVelocity(militaryGeneralCar)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) then
							if(isElementWithinMarker(militaryGeneralCar, militaryGeneralTargetMarker)) then
								if militaryGeneralArrived then
									militaryGeneralFinish(worker[1], not isElement(militaryGeneralPed))
								else
									militaryGeneralArrive(worker[1], true)
								end
							end
						end
					end
					
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onMilitaryGeneralLeaveVehicle", worker[1], worker[2], 60000, militaryGeneralCar)
				militaryGeneralSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end
		end
		
		for key,worker in ipairs(jobWorkers[10]) do -- Такси
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobTaxiBackToVehicle", worker[1])
					jobWorkers[10][key][2] = -1
				else
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) then
							local finished = false
							
							for _,cp in ipairs(jobTaxiCpsFinish) do
								if(isElementWithinMarker(worker[1], cp[4])) then
									addNewEventToLog(getPlayerName(worker[1]), "Такси - Завершение - Успех", true)
									removeWorker(10, worker[1], 1)
									finished = true
									break
								end
							end
							
							if finished then
								break
							end
						end
					end
				end
			
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobTaxiLeaveVehicle", worker[1], worker[2], 60000, worker[3])
				jobTaxiSetState(worker[1], 3)
			end
			
			if(getTickCount()-startTick > 500) then
				coroutine.yield()
				startTick = getTickCount()
			end			
		end
		
		for key,worker in ipairs(jobWorkers[11]) do
			local workerVeh = getPedOccupiedVehicle(worker[1])
			
			if(workerVeh == worker[3]) then
				if(worker[2] == 3) then
					triggerClientEvent(worker[1], "onJobFoodBackToVehicle", worker[1])
					jobWorkers[11][key][2] = -1
				else
					local vx, vy, vz = getElementVelocity(workerVeh)
					local vehSpeed = (vx^2 + vy^2 + vz^2)^(0.5)
					
					if not (vehSpeed > 0.0) then
						if(worker[2] == 0) then
							local finished = false
							
							for _,cp in ipairs(jobFoodFinishMarkers) do
								if(isElementWithinMarker(worker[1], cp[4])) then
									addNewEventToLog(getPlayerName(worker[1]), "Продажа еды - Завершение - Успех", true)
									removeWorker(11, worker[1], 1)
									finished = true
									break
								end
							end
							
							if finished then
								break
							end
						end
					end
				end
				
			elseif not (worker[2] == 3) then
				triggerClientEvent(worker[1], "onJobFoodLeaveVehicle", worker[1], worker[2], 60000, worker[3])
				jobFoodSetState(worker[1], 3)
			end		
		end
		coroutine.yield()
	end
end

function jobTrashmasterNowInVehicle(state)
	jobTrashmasterSetState(source, state)
end

function jobTrashmasterInit()
	for i=1,400 do
		table.insert(jobTrashmasterCps, {})
	end
	
	for i,cpCoords in ipairs(jobTrashmasterCpCoords) do
		local sector = getSectorByPoint(cpCoords[1], cpCoords[2])
		jobTrashmasterCps[sector][i] = createMarker(cpCoords[1], cpCoords[2], cpCoords[3]-1.0, "cylinder", 3.0, 0, 255, 0, 128)
		jobTrashmasterCpBlips[i] = createBlip(0, 0, 0, 0, 1, 0, 255, 0, 255, 0, 500)
		attachElements(jobTrashmasterCpBlips[i], jobTrashmasterCps[sector][i])
		setElementVisibleTo(jobTrashmasterCps[sector][i], root, false)
		setElementVisibleTo(jobTrashmasterCpBlips[i], root, false)
	end
end

function jobTrashmasterGetMoney(trashUnloaded, continueWork)
	addNewEventToLog(getPlayerName(source), "Вывоз мусора - Выгрузка - "..tostring(trashUnloaded).."%", true)
	giveMoney(source, trashUnloaded*jobTrashmasterIncMoney)
	local respect = getElementData(source, "respect")
	respectSet(source, respect+0.000006*trashUnloaded, -1.0, 0.1, true)
	
	if(continueWork) then
		local playerVeh = getPedOccupiedVehicle(source)
		fixVehicle(playerVeh)
		local cx, cy, cz = getElementPosition(playerVeh)
		local curCol = createColSphere(cx, cy, cz, 150)
		local players = getElementsWithinColShape(curCol, "player")
		destroyElement(curCol)
		triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 150, 0, 0, 0, 0, false, 100, playerVeh)
		jobTrashmasterSetState(source, 0)
	end
end

function jobTrashmasterSetState(worker, state)
	for j,curWorker in ipairs(jobWorkers[1]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				
				if(state == 0) then
					jobCpFinishShow(worker, true)
					jobCpFixShow(worker, true)
					
					for _,sector in ipairs(jobTrashmasterCps) do
						for i,cp in pairs(sector) do
							if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i])) and(not jobWasItemCollected(1, getPlayerName(worker), i)) then
								setElementVisibleTo(cp, worker, true)
								setElementVisibleTo(jobTrashmasterCpBlips[i], worker, true)
							end
						end
					end
				
				elseif(state == 1) then
					for _,sector in ipairs(jobTrashmasterCps) do
						for i,cp in pairs(sector) do
							if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i])) and(not jobWasItemCollected(1, getPlayerName(worker), i)) then
								setElementVisibleTo(cp, worker, false)
								setElementVisibleTo(jobTrashmasterCpBlips[i], worker, false)
							end
						end
					end
					
					jobCpFixShow(worker, false)
					jobCpFinishShow(worker, true)
				
				elseif(state == 2) then
					
					for _,sector in ipairs(jobTrashmasterCps) do
						for i,cp in pairs(sector) do
							if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i])) and(not jobWasItemCollected(1, getPlayerName(worker), i)) then
								setElementVisibleTo(cp, worker, false)
								setElementVisibleTo(jobTrashmasterCpBlips[i], worker, false)
							end
						end
					end
					
					jobCpFixShow(worker, true)
					jobCpFinishShow(worker, false)
				
				elseif(state == 3) then
					jobCpFinishShow(worker, false)
					jobCpFixShow(worker, false)
					
					for _,sector in ipairs(jobTrashmasterCps) do
						for i,cp in pairs(sector) do
							if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i])) and(not jobWasItemCollected(1, getPlayerName(worker), i)) then
								setElementVisibleTo(cp, worker, false)
								setElementVisibleTo(jobTrashmasterCpBlips[i], worker, false)
							end
						end
					end
					
				end
				
				jobWorkers[1][j][2] = state
				break
			end
		end			
	end
end

function jobTrashmasterFilledMax()
	addNewEventToLog(getPlayerName(source), "Вывоз мусора - Полное заполнение - nil", true)
	jobTrashmasterSetState(source, 2)
end

function jobTrashmasterTimesup(plr)
	if(source == resourceRoot) and(plr == client) then
		addNewEventToLog(getPlayerName(plr), "Вывоз мусора - Время вышло - nil", true)
		jobTrashmasterSetState(plr, 1)
	end
end

function jobTrashmasterOnWasted()
	addNewEventToLog(getPlayerName(source), "Вывоз мусора - Завершение - Погиб", true)
	removeWorker(1, source, 2)
end

function jobTrashmasterBlowedUp()
	for _,worker in ipairs(jobWorkers[1]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Вывоз мусора - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobTrashmasterMoneyForBlowedCar)
			removeWorker(1, worker[1], 4)
		end
	end
end

function jobTrashmasterLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Вывоз мусора - Завершение - Покинул транспорт", true)
	takeMoney(source, jobTrashmasterMoneyForLeftCar)
	removeWorker(1, source, 3)
end

function jobFoodOnWasted()
	addNewEventToLog(getPlayerName(source), "Продажа еды - Завершение - Погиб", true)
	removeWorker(11, source, 2)
end

function jobFoodBlowedUp()
	for _,worker in ipairs(jobWorkers[11]) do
		if(worker[3] == source) then
			addNewEventToLog(getPlayerName(worker[1]), "Продажа еды - Завершение - Взрыв транспорта", true)
			takeMoney(worker[1], jobFoodMoneyForBlowedCar)
			removeWorker(11, worker[1], 4)
		end
	end
end

function jobFoodLeftVehicle()
	addNewEventToLog(getPlayerName(source), "Продажа еды - Завершение - Покинул транспорт", true)
	takeMoney(source, jobFoodMoneyForLeftCar)
	removeWorker(11, source, 3)
end

function jobFoodNowInVehicle(state)
	jobFoodSetState(source, state)
end

function jobFoodSetState(worker, state)
	for i,curWorker in ipairs(jobWorkers[11]) do
		if(curWorker[1] == worker) then
			if not (curWorker[2] == state) then
				if(state == 0) then
					for _,cp in ipairs(jobFoodFinishMarkers) do
						if(isElement(cp[4])) then
							setElementVisibleTo(cp[4], worker, true)
						end
					end
				
				elseif(state == 3) then
					for _,cp in ipairs(jobFoodFinishMarkers) do
						if(isElement(cp[4])) then
							setElementVisibleTo(cp[4], worker, false)
						end
					end
					
				end
				
				jobWorkers[11][i][2] = state
				break
			end
		end			
	end
end

function addWorker(jobId, newWorker)
	local clientParams = {}
	local jobVehicle = getPedOccupiedVehicle(newWorker)
	if jobVehicle then
		if isPlayerBusy(newWorker) then
			triggerClientEvent(newWorker, "onServerMsgAdd", newWorker, "Вы должны закончить остальные дела, прежде чем приступать к работе.")
		
		else
			if vehiclesOnWork[jobVehicle] then
				triggerClientEvent(newWorker, "onServerMsgAdd", newWorker, "Этот транспорт уже занят под работу другого игрока.")
				return false
			end
			
			clearActions(jobVehicle)
			setElementFrozen(jobVehicle, false)
			setVehicleDamageProof(jobVehicle, false)
			local rx, ry, rz = getElementPosition(jobVehicle)
			local rrx, rry, rrz = getElementRotation(jobVehicle)
			setVehicleRespawnPosition(jobVehicle, rx, ry, rz, rrx, rry, rrz)
			vehiclesOnWork[jobVehicle] = newWorker
			
			if(jobId == 1) then -- Вывоз мусора
				addNewEventToLog(getPlayerName(newWorker), "Вывоз мусора - Старт работы - nil", true)
				table.insert(jobWorkers[1], { newWorker, 0, jobVehicle })
				table.insert(clientParams, jobTrashmasterStartTime)
				table.insert(clientParams, jobTrashmasterMaxFillness)
				addEventHandler("onPlayerWasted", newWorker, jobTrashmasterOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobTrashmasterBlowedUp)
				jobCpFinishShow(newWorker, true)
				jobCpFixShow(newWorker, true)
				
				for _,sector in ipairs(jobTrashmasterCps) do
					for i,cp in pairs(sector) do
						if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i])) and(not jobWasItemCollected(jobId, getPlayerName(newWorker), i)) then
							setElementVisibleTo(cp, newWorker, true)
							setElementVisibleTo(jobTrashmasterCpBlips[i], newWorker, true)
						end
					end
				end
				
			elseif(jobId == 2) then -- Мойка дорог
				addNewEventToLog(getPlayerName(newWorker), "Мойка дорог - Старт работы - nil", true)
				table.insert(jobWorkers[2], { newWorker, 0, jobVehicle })
				table.insert(clientParams, jobWashroadsStartTime)
				addEventHandler("onPlayerWasted", newWorker, jobWashroadsOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobWashroadsBlowedUp)
				triggerClientEvent(getElementsByType("player"), "onServerCreateEffect", newWorker, "prt_boatsplash", 0, 0, 0, 1, 2.5, 0, jobVehicle, 0.624, 1.521, -0.505)
				triggerClientEvent(getElementsByType("player"), "onServerCreateEffect", newWorker, "prt_boatsplash", 0, 0, 0, 1, 2.5, 0, jobVehicle, -0.624, 1.521, -0.505)
				jobCpFinishShow(newWorker, true)
				jobCpFixShow(newWorker, true)
				
				for i,cp in ipairs(jobWashroadsCps) do
					if(isElement(cp)) and(isElement(jobWashroadsCpBlips[i])) and(not jobWasItemCollected(jobId, getPlayerName(newWorker), i)) then
						setElementVisibleTo(cp, newWorker, true)
						setElementVisibleTo(jobWashroadsCpBlips[i], newWorker, true)
					end
				end
				
			elseif(jobId == 3) then -- Газонокосилка
				addNewEventToLog(getPlayerName(newWorker), "Газонокосилка - Старт работы - nil", true)
				table.insert(jobWorkers[3], { newWorker, 0, jobVehicle, 0, false })
				addEventHandler("onPlayerWasted", newWorker, jobLawnmowOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobLawnmowBlowedUp)
				jobCpFinishShow(newWorker, true)
				jobCpFixShow(newWorker, true)
				
				for i,lawn in ipairs(jobLawnmowLawns) do
					if(isElement(lawn[1])) and isElement(lawn[2]) and(not jobWasItemCollected(jobId, getPlayerName(newWorker), i)) then
						setElementVisibleTo(lawn[1], newWorker, true)
						setElementVisibleTo(lawn[2], newWorker, true)
					end
				end
				
			elseif(jobId == 4) then -- Эвакуатор
				addNewEventToLog(getPlayerName(newWorker), "Эвакуация - Старт работы - nil", true)
				table.insert(jobWorkers[4], { newWorker, 0, jobVehicle })
				addEventHandler("onPlayerWasted", newWorker, jobEvacuatorOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobEvacuatorBlowedUp)
				jobCpFinishShow(newWorker, true)
				jobCpFixShow(newWorker, true)
				attachActionToSelf(defaultActions[9], newWorker)
				attachActionToSelf(defaultActions[10], newWorker)
			
			elseif(jobId == 5) then -- Перевозка грузов
				local jobTrailer = nil
				local truck
				
				for i=1,table.getn(jobTruckerCarSpawnPoints) do
					truck = jobTruckerAvailableTrucks[i]
					
					if not (truck == nil) then
						if(truck[1] == jobVehicle) then
							addNewEventToLog(getPlayerName(newWorker), "Перевозка грузов - Старт работы - nil", true)
							truck[3] = true
							local sx, sy, sz = getElementPosition(jobVehicle)
							local _, _, srot = getElementRotation(jobVehicle)
							--jobTrailer = truck[4]
							local truckIndex = truck[2]
							
							if(jobTruckerTrucks[truckIndex][2] >= 400) then
								while not isElement(jobTrailer) do
									jobTrailer = createVehicle(jobTruckerTrucks[truckIndex][2], sx, sy, sz+jobTruckerTrucks[truckIndex][14], 0, 0, srot, "TRUCK", false, jobTruckerTrucks[truckIndex][11], jobTruckerTrucks[truckIndex][12])
								end
								jobTruckerAvailableTrucks[i][4] = jobTrailer
								setElementGhostMode(jobTrailer, 5000)
								attachTrailerToVehicle(jobVehicle, jobTrailer)
								setVehicleDamageProof(jobTrailer, true)
							end
							
							--if isElement(jobTrailer) then
								--setElementFrozen(jobTrailer, false)
								--setElementAlpha(jobTrailer, 255)
								--setElementCollisionsEnabled(jobTrailer, true)
							--end
							local vehMdl = getElementModel(jobVehicle)
							
							if(vehMdl == 428) then
								setPedArmor(newWorker, 100.0)
								giveWeapon(newWorker, 25, 25)
							end
							
							table.insert(jobWorkers[5], { newWorker, 0, jobVehicle, jobTrailer, sx, sy, sz, false })
							table.insert(clientParams, jobTruckerTrucks[truckIndex][6])
							table.insert(clientParams, jobTruckerTrucks[truckIndex][7])
							table.insert(clientParams, jobTruckerTrucks[truckIndex][8])
							table.insert(clientParams, truck[9])
							table.insert(clientParams, truck[10])
							break
						end
					end
				end
				
				addEventHandler("onPlayerWasted", newWorker, jobTruckerOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobTruckerBlowedUp)
			
			elseif(jobId == 6) then -- Скорая помощь
				addNewEventToLog(getPlayerName(newWorker), "Скорая помощь - Старт работы - nil", true)
				table.insert(jobWorkers[6], { newWorker, 0, jobVehicle })
				addEventHandler("onPlayerWasted", newWorker, jobAmbulanceOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobAmbulanceBlowedUp)
				addEventHandler("onVehicleEnter", root, jobAmbulanceEnterVehicle)
				
				for _,cp in ipairs(jobAmbulanceFinish) do
					setElementVisibleTo(cp[4], newWorker, true)
					setElementVisibleTo(cp[5], newWorker, true)
				end
			
			elseif(jobId == 7) then -- Сбор зерна
				for i,field in ipairs(jobFarmFields) do
					if(field[7] == jobVehicle) then
						addNewEventToLog(getPlayerName(newWorker), "Ферма - Сбор зерна - Старт работы", true)
						addEventHandler("onPlayerWasted", newWorker, jobFarmOnWasted)
						addEventHandler("onVehicleExplode", jobVehicle, jobFarmBlowedUp)
						table.insert(jobWorkers[7], { newWorker, 0, jobVehicle, i, 1 })
						setElementVisibleTo(field[8][1][4], newWorker, true)
					end
				end
			
			elseif(jobId == 8) then -- Вспахивание поля
				for i,field in ipairs(jobFarmFields) do
					if(field[7] == jobVehicle) then
						addNewEventToLog(getPlayerName(newWorker), "Ферма - Вспахивание поля - Старт работы", true)
						addEventHandler("onPlayerWasted", newWorker, jobFarm2OnWasted)
						addEventHandler("onVehicleExplode", jobVehicle, jobFarm2BlowedUp)
						--local trailer = getVehicleTowedByVehicle(jobVehicle
						--setElementFrozen(trailer, false)
						--setVehicleDamageProof(trailer, false)
						table.insert(jobWorkers[8], { newWorker, 0, jobVehicle, i, 1 })
						setElementVisibleTo(field[8][1][4], newWorker, true)
					end
				end
				
			elseif(jobId == 9) then -- Перевозка генерала
				addNewEventToLog(getPlayerName(newWorker), "Военный - Перевозка генерала - Старт работы", true)
				local destInfo = militaryGeneralInfo[militaryGeneralInfoId][7][math.random(table.getn(militaryGeneralInfo[militaryGeneralInfoId][7]))]
				removeEventHandler("onVehicleEnter", militaryGeneralCar, militaryGeneralCarEnter)
				table.insert(jobWorkers[9], { newWorker, 0, militaryGeneralCar })
				table.insert(clientParams, destInfo[6])
				militaryGeneralTargetMarker = createMarker(destInfo[1], destInfo[2], destInfo[3], "cylinder", destInfo[4], 255, 0, 0, 128)
				militaryGeneralTargetBlip = createBlip(destInfo[1], destInfo[2], destInfo[3], 0, 2, 255, 255, 0, 255, 32767)
				militaryGeneralArrived = false
				setElementVisibleTo(militaryGeneralTargetMarker, root, false)
				setElementVisibleTo(militaryGeneralTargetBlip, root, false)
				setElementVisibleTo(militaryGeneralTargetMarker, newWorker, true)
				setElementVisibleTo(militaryGeneralTargetBlip, newWorker, true)
				setElementVisibleTo(militaryGeneralPedBlip, newWorker, true)
				addEventHandler("onVehicleExplode", militaryGeneralCar, militaryGeneralDead)
				addEventHandler("onPlayerWasted", newWorker, militaryGeneralWasted)
				triggerClientEvent(newWorker, "onServerMsgAdd", newWorker, "Отвезите генерала "..destInfo[5]..". Вы должны успеть вовремя.")
				local allPlayers = getElementsByType("player")
				local pGrp
				
				for _,plr in ipairs(allPlayers) do
					if not (plr == newWorker) then
						pGrp = getElementData(plr, "usergroup")
						
						if pGrp and((pGrp == 5) or (pGrp == 10)) then
							triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Началась перевозка генерала "..destInfo[5]..". Он обозначен оранжевым человечком на радаре.")
							setElementVisibleTo(militaryGeneralPedBlip, plr, true)
							if(pGrp == 5) then
								triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Убедитесь, что генерал доберется до места назначения живым.")
							
							elseif(pGrp == 10) then
								triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Взорвите его автомобиль, чтобы получить деньги за его убийство.")
							end
						end
					end
				end
				
			elseif(jobId == 10) then -- Такси
				addNewEventToLog(getPlayerName(newWorker), "Такси - Старт работы - nil", true)
				addEventHandler("onPlayerWasted", newWorker, jobTaxiOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobTaxiBlowedUp)
				addEventHandler("onVehicleEnter", jobVehicle, jobTaxiNewClient)
				table.insert(jobWorkers[10], { newWorker, 0, jobVehicle, nil, 10 })
				
				for _,cp in ipairs(jobTaxiCpsFinish) do
					setElementVisibleTo(cp[4], newWorker, true)
				end
				
				setVehicleTaxiLightOn(jobVehicle, true)
				attachActionToSelf(defaultActions[51], newWorker)
			
			elseif(jobId == 11) then
				addNewEventToLog(getPlayerName(newWorker), "Продажа еды - Старт работы - nil", true)
				attachActionToElement(defaultActions[69], jobVehicle)
				addEventHandler("onPlayerWasted", newWorker, jobFoodOnWasted)
				addEventHandler("onVehicleExplode", jobVehicle, jobFoodBlowedUp)
				for _,cp in ipairs(jobFoodFinishMarkers) do
					if(isElement(cp[4])) then
						setElementVisibleTo(cp[4], newWorker, true)
						setElementVisibleTo(cp[4], newWorker, true)
					end
				end
				local food = jobFoodTypes[getElementModel(jobVehicle)]
				table.insert(jobWorkers[11], { newWorker, 0, jobVehicle, food })
				table.insert(jobFoodClientInfo, jobVehicle)
				triggerClientEvent(getElementsByType("player"), "onJobFoodUpdate", newWorker, jobFoodClientInfo)
			else
				if not jobWorkers[jobId] then
					jobWorkers[jobId] = {}
				end
				
				table.insert(jobWorkers[jobId], { newWorker, 0, jobVehicle })
				triggerEvent("onWorkStart", resourceRoot, jobId, newWorker, jobVehicle)
			end
			triggerClientEvent(newWorker, "onJobStart", newWorker, jobId, clientParams)
		end
	end
end

function removeWorker(jobId, worker, reason)
	for i,curWorker in ipairs(jobWorkers[jobId]) do
		if(curWorker[1] == worker) then
			if curWorker[3] then
				vehiclesOnWork[curWorker[3]] = nil
			end
			
			if(jobId == 1) then -- Вывоз мусора
				removeEventHandler("onPlayerWasted", worker, jobTrashmasterOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobTrashmasterBlowedUp)
				
				for _,sector in ipairs(jobTrashmasterCps) do
					for i2,cp in pairs(sector) do
						if(isElement(cp)) and(isElement(jobTrashmasterCpBlips[i2])) then
							setElementVisibleTo(cp, worker, false)
							setElementVisibleTo(jobTrashmasterCpBlips[i2], worker, false)
						end
					end
				end
				
			elseif(jobId == 2) then -- Мойка дорог
				removeEventHandler("onPlayerWasted", worker, jobWashroadsOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobWashroadsBlowedUp)
				triggerClientEvent(getElementsByType("player"), "onServerDestroyAttachedEffects", curWorker[1], curWorker[3])
				
				for i2,cp in ipairs(jobWashroadsCps) do
					if(isElement(cp)) and(isElement(jobWashroadsCpBlips[i2])) then
						setElementVisibleTo(cp, worker, false)
						setElementVisibleTo(jobWashroadsCpBlips[i2], worker, false)
					end
				end		
				
			elseif(jobId == 3) then -- Газонокосилка
				if(curWorker[5]) then
					table.remove(jobLawnmowLawnsInProcess, curWorker[4])
					jobLawnmowLawns[curWorker[4]][3] = false
					--clearElementVisibleTo(jobLawnmowLawns[curWorker[4]][1])
					--clearElementVisibleTo(jobLawnmowLawns[curWorker[4]][2])
					--setElementVisibleTo(jobLawnmowLawns[curWorker[4]][1], root, false)
					--setElementVisibleTo(jobLawnmowLawns[curWorker[4]][2], root, false)
					for _,curWorker2 in ipairs(jobWorkers[3]) do
						if(curWorker2[2] == 0) and(not jobWasItemCollected(3, getPlayerName(curWorker2[1]), curWorker[4])) then
							setElementVisibleTo(jobLawnmowLawns[curWorker[4]][1], curWorker2[1], true)
							setElementVisibleTo(jobLawnmowLawns[curWorker[4]][2], curWorker2[1], true)
						end
					end
				end
				
				removeEventHandler("onPlayerWasted", worker, jobLawnmowOnWasted)
				removeEventHandler("onVehicleExplode", jobWorkers[3][i][3], jobLawnmowBlowedUp)
				
				for _,lawn in ipairs(jobLawnmowLawns) do
					if(isElement(lawn[1])) and(isElement(lawn[2])) then
						setElementVisibleTo(lawn[1], worker, false)
						setElementVisibleTo(lawn[2], worker, false)
					end
				end
			
			elseif(jobId == 4) then -- Эвакуатор
				removeEventHandler("onPlayerWasted", worker, jobEvacuatorOnWasted)
				removeEventHandler("onVehicleExplode", jobWorkers[4][i][3], jobEvacuatorBlowedUp)
				detachActionFromSelf(defaultActions[9], newWorker)
				detachActionFromSelf(defaultActions[10], newWorker)
			
			elseif(jobId == 5) then -- Перевозка грузов
				if(reason == -1) then
					takeMoney(worker, jobTruckerMoneyForLeftCar)
				end
				
				removeEventHandler("onPlayerWasted", worker, jobTruckerOnWasted)
				removeEventHandler("onVehicleExplode", jobWorkers[5][i][3], jobTruckerBlowedUp)	
				
				for i2,truck in ipairs(jobTruckerAvailableTrucks) do
					if(truck[1] == curWorker[3]) then
						if not (curWorker[4] == nil) then
							destroyElement(curWorker[4])
							jobWorkers[jobId][i][4] = nil
						end
						
						removeEventHandler("onVehicleExplode", truck[1], jobTruckerTruckDestroyed)
						destroyElement(truck[1])
						jobTruckerAvailableTrucks[i2][1] = nil
						jobTruckerAvailableTrucks[i2] = nil
						break
					end
				end
				
			elseif(jobId == 6) then -- Скорая помощь
				removeEventHandler("onPlayerWasted", worker, jobAmbulanceOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobAmbulanceBlowedUp)
				removeEventHandler("onVehicleEnter", root, jobAmbulanceEnterVehicle)
				
				for _,cp in ipairs(jobAmbulanceFinish) do
					setElementVisibleTo(cp[4], worker, false)
					setElementVisibleTo(cp[5], worker, false)
				end
				
			elseif(jobId == 7) then -- Сбор зерна
				removeEventHandler("onPlayerWasted", worker, jobFarmOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobFarmBlowedUp)
				
				if(not jobFarmFields[curWorker[4]][7]) or (jobFarmFields[curWorker[4]][7] == curWorker[3]) then
					jobFarmSpawnNextVeh(getElementModel(curWorker[3]), curWorker[4])
				end
				
				destroyElement(curWorker[3])
				setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, false)				
			
			elseif(jobId == 8) then -- Вспахивание поля
				removeEventHandler("onPlayerWasted", worker, jobFarm2OnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobFarm2BlowedUp)
				local attachedElements = getAttachedElements(curWorker[3])
				
				for _,elem in ipairs(attachedElements) do
					destroyElement(elem)
				end
				
				if(not jobFarmFields[curWorker[4]][7]) or (jobFarmFields[curWorker[4]][7] == curWorker[3]) then
					jobFarmSpawnNextVeh(getElementModel(curWorker[3]), curWorker[4])
				end
				
				destroyElement(curWorker[3])
				setElementVisibleTo(jobFarmFields[curWorker[4]][8][curWorker[5]][4], worker, false)				
			
			elseif(jobId == 9) then -- Перевозка генерала
				removeEventHandler("onVehicleExplode", militaryGeneralCar, militaryGeneralDead)
				removeEventHandler("onPlayerWasted", worker, militaryGeneralWasted)
				destroyElement(militaryGeneralTargetMarker)
				militaryGeneralTargetMarker = nil
				destroyElement(militaryGeneralTargetBlip)
				militaryGeneralTargetBlip = nil
				
				if isElement(militaryGeneralPed) then
					destroyElement(militaryGeneralPedBlip)
					militaryGeneralPedBlip = nil
					destroyElement(militaryGeneralPed)
					militaryGeneralPed = nil
				end
				
				destroyElement(militaryGeneralCar)
				militaryGeneralInfoId = 0
				setTimer(militaryGeneralNew, militaryGeneralTimeBetween, 1)
			
			elseif(jobId == 10) then -- Такси
				for _,cp in ipairs(jobTaxiCpsFinish) do
					setElementVisibleTo(cp[4], worker, false)
				end
				
				removeEventHandler("onPlayerWasted", worker, jobTaxiOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobTaxiBlowedUp)
				removeEventHandler("onVehicleEnter", curWorker[3], jobTaxiNewClient)
				removeEventHandler("onVehicleExit", curWorker[3], jobTaxiFinishClient)
				jobTaxiRemoveClient(i, false)
				setVehicleTaxiLightOn(curWorker[3], false)
				detachActionFromSelf(defaultActions[51], newWorker)
			
			elseif(jobId == 11) then
				detachActionFromElement(defaultActions[69], curWorker[3])
				removeEventHandler("onPlayerWasted", worker, jobFoodOnWasted)
				removeEventHandler("onVehicleExplode", curWorker[3], jobFoodBlowedUp)
				
				for _,cp in ipairs(jobFoodFinishMarkers) do
					if(isElement(cp[4])) then
						setElementVisibleTo(cp[4], worker, false)
						setElementVisibleTo(cp[4], worker, false)
					end
				end
				
				for key,veh in ipairs(jobFoodClientInfo) do
					if(veh == curWorker[3]) then
						table.remove(jobFoodClientInfo, key)
						triggerClientEvent(getElementsByType("player"), "onJobFoodUpdate", worker, jobFoodClientInfo)
						break
					end
				end
				
			else
				triggerEvent("onWorkFinish", resourceRoot, jobId, curWorker[1], reason)
			end
			
			if(isElement(curWorker[3])) then
				local vehOccupants = getVehicleOccupants(curWorker[3])
				
				for _,occupant in ipairs(vehOccupants) do
					removePedFromVehicle(occupant)
				end
				
				vehOccupants = getVehicleController(curWorker[3])
				
				if vehOccupants then
					removePedFromVehicle(vehOccupants)
				end
				
				respawnVehicle(curWorker[3])
				fixVehicle(curWorker[3])
				setVehicleDamageProof(curWorker[3], true)
				setVehicleEngineState(curWorker[3], false)
				setElementGhostMode(curWorker[3], 3000)
				clearActions(curWorker[3])
				setTimer(function(veh)
							fixVehicle(veh)
							setElementData(veh, "fuelLevel", 1.0)
							attachActionToElement(defaultActions[7], veh)
							setElementFrozen(veh, true)
						 end, 1000, 1, curWorker[3])
			end
			
			table.remove(jobWorkers[jobId], i)
			jobCpFinishShow(worker, false)
			jobCpFixShow(worker, false)
			triggerClientEvent(worker, "onJobEnd", worker, jobId, reason)
			break
		end
	end
end

function groupVehicleEnter(thePlayer, seat)
	local eId = specialEventGetEventByElement(source)
	
	if eId then
		if(specialEvents[eId][3] < 1) then
			playerShowMessage(thePlayer, "Этот транспорт создан для мероприятия, которое ещё не началось.")
			cancelEvent()
		
		elseif(eId ~= specialEventGetEventByElement(thePlayer)) then
			playerShowMessage(thePlayer, "Вы не участвуете в мероприятии, для которого был создан этот транспорт.")
			cancelEvent()
		end
		
	elseif(seat == 0) then
		local plrGroup = getElementData(thePlayer, "usergroup")
		
		if plrGroup then
			local vehModel = getElementModel(source)
			local eventCancelled = false
			local correctGroup
			
			if groupVehicles[vehModel] then
				eventCancelled = true
				correctGroup = groupVehicles[vehModel][1]
				
				for _,grpVeh in ipairs(groupVehicles[vehModel]) do
					if(grpVeh == plrGroup) then
						eventCancelled = false
						break
					end
				end
				
				if eventCancelled then
					eventCancelled = cancelEvent()
				end
			end
			
			if eventCancelled then
				triggerClientEvent(thePlayer, "onServerMsgAdd", thePlayer, "Вы должны быть переодеты в рабочую форму '"..playerGroups[correctGroup][1].."', чтобы воспользоваться данным транспортным средством.")
			end
		end
	end
end

function getHash(key, enableRegistry)
	if enableRegistry then
		return calculateHash(key)
	
	else
		return calculateHash(string.upper(key))
	end
end

function loadHouses()
	dbQuery(loadHouses2, db, "SELECT * FROM houses")
end

function loadHouses2(dbq)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	local numloaded = 0
	local dim = 1
	local hindex, howner
	
	for _,row in ipairs(dbqueryresult) do
		hindex = row["id"]
		numloaded = numloaded + 1
		howner = row["owner"]
		local hx, hy, hz = houses[hindex][4][1], houses[hindex][4][2], houses[hindex][4][3]
		houses[hindex][4] = nil
		
		if(howner == 0) then
			while not houses[hindex][4] do
				houses[hindex][4] = createPickup(hx, hy, hz, 3, housePickupModelAvailable, 0)
			end
			attachActionToElement(defaultActions[1], houses[hindex][4])
			setPickupText(houses[hindex][4], "$"..tostring(houses[hindex][3]), 0, 200, 0)
		
		else
			while not houses[hindex][4] do
				houses[hindex][4] = createPickup(hx, hy, hz, 3, housePickupModelNotAvailable, 0)
			end
			
			attachActionToElement(defaultActions[128], houses[hindex][4])
			attachActionToElement(defaultActions[2], houses[hindex][4])
			attachActionToElement(defaultActions[14], houses[hindex][4])
			attachActionToElement(defaultActions[29], houses[hindex][4])
			attachActionToElement(defaultActions[12], houses[hindex][4])
			houses[hindex][11] = row["owner"]
			setPickupText(houses[hindex][4], "Занят", 255, 0, 0)
			
			if houseOwners[howner] then
				houseOwners[howner] = houseOwners[howner] + 1
			
			else
				houseOwners[howner] = 1
			end
		end
	end
	
	if isTestServer() then outputServerLog(string.format("RESPLAY: %d houses loaded", numloaded)) end
end

function unloadHouses()
	for i=1,table.getn(houses) do
		destroyElement(houses[i][4])
	end
	houses = {}
end

function generateMapFile()
	local childNode
	local rootNode = xmlCreateFile(":resplay/resplay.map", "map")
	
	if isTestServer() then
		rootNode = xmlCreateFile(":resplay/resplay_test.map", "map")
	end
	
	xmlNodeSetAttribute(rootNode, "edf:definitions", "editor_main,resplay")
	
	for i,pos in ipairs(respawnPositions) do
		childNode = xmlCreateChild(rootNode, "respawn")
		xmlNodeSetAttribute(childNode, "id", "respawn"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(pos[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(pos[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(pos[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(pos[4]))
	end
	
	for i,obj in ipairs(extraObjs) do
		childNode = xmlCreateChild(rootNode, "object")
		xmlNodeSetAttribute(childNode, "id", "object"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(obj[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(obj[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(obj[4]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(obj[5]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(obj[6]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(obj[7]))
		xmlNodeSetAttribute(childNode, "model", tostring(obj[1]))
	end
	
	--[[
	for i,obj in ipairs(removeObjs) do
		childNode = xmlCreateChild(rootNode, "removeWorldObject")
		xmlNodeSetAttribute(childNode, "id", "removeWorldObject"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(obj[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(obj[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(obj[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "model", tostring(obj[1]))
		xmlNodeSetAttribute(childNode, "radius", tostring(obj[5]))
		xmlNodeSetAttribute(childNode, "interior", tostring(obj[6]))
	end
	]]
	
	for i,vehcommonspawn in ipairs(vehCommonSpawnPos) do
		childNode = xmlCreateChild(rootNode, "vehcommonspawn")
		xmlNodeSetAttribute(childNode, "id", "vehcommonspawn"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(vehcommonspawn[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(vehcommonspawn[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(vehcommonspawn[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(vehcommonspawn[5]))
		xmlNodeSetAttribute(childNode, "radius", tostring(vehcommonspawn[4]))
	end
	
	for i,veh in ipairs(extraVehCoords) do
		childNode = xmlCreateChild(rootNode, "vehicle")
		xmlNodeSetAttribute(childNode, "id", "vehicle"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(veh[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(veh[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(veh[4]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(veh[5]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(veh[6]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(veh[7]))
		xmlNodeSetAttribute(childNode, "model", tostring(veh[1]))
	end
	
	for i,tutorial in ipairs(tutorialArray) do
		childNode = xmlCreateChild(rootNode, "tutorial")
		xmlNodeSetAttribute(childNode, "id", "tutorial"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "name", tostring(tutorial[1]))
		xmlNodeSetAttribute(childNode, "youtubeid", tostring(tutorial[2]))
		local tutorialNode = childNode
		
		for j,tutorialbot in ipairs(tutorialPositions) do
			if(i == tutorialbot[1]) then
				childNode = xmlCreateChild(tutorialNode, "tutorialbot")
				xmlNodeSetAttribute(childNode, "id", "tutorialbot"..tostring(j))
				xmlNodeSetAttribute(childNode, "posX", tostring(tutorialbot[2]))
				xmlNodeSetAttribute(childNode, "posY", tostring(tutorialbot[3]))
				xmlNodeSetAttribute(childNode, "posZ", tostring(tutorialbot[4]))
				xmlNodeSetAttribute(childNode, "rotX", "0")
				xmlNodeSetAttribute(childNode, "rotY", "0")
				xmlNodeSetAttribute(childNode, "rotZ", tostring(tutorialbot[5]))
			end
		end
		
	end
	
	for i,luckyphone in ipairs(luckyPhoneCoords) do
		childNode = xmlCreateChild(rootNode, "luckyphone")
		xmlNodeSetAttribute(childNode, "id", "luckyphone"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(luckyphone[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(luckyphone[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(luckyphone[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(luckyphone[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(luckyphone[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(luckyphone[6]))
	end
	
	for i,lowrider in ipairs(lowriderMarkers) do
		childNode = xmlCreateChild(rootNode, "lowrider")
		xmlNodeSetAttribute(childNode, "id", "lowrider"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "placename", tostring(lowrider[16]))
		local lowriderNode = childNode
		childNode = xmlCreateChild(lowriderNode, "lowridercp")
		xmlNodeSetAttribute(childNode, "id", "lowridercp"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(lowrider[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(lowrider[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(lowrider[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		childNode = xmlCreateChild(lowriderNode, "lowriderplr")
		xmlNodeSetAttribute(childNode, "id", "lowriderplr"..tostring(i).."(1)")
		xmlNodeSetAttribute(childNode, "posX", tostring(lowrider[5]))
		xmlNodeSetAttribute(childNode, "posY", tostring(lowrider[6]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(lowrider[7]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(lowrider[8]))
		childNode = xmlCreateChild(lowriderNode, "lowriderplr")
		xmlNodeSetAttribute(childNode, "id", "lowriderplr"..tostring(i).."(2)")
		xmlNodeSetAttribute(childNode, "posX", tostring(lowrider[9]))
		xmlNodeSetAttribute(childNode, "posY", tostring(lowrider[10]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(lowrider[11]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(lowrider[12]))
		for j,lowridercamera in ipairs(lowrider[14]) do
			childNode = xmlCreateChild(lowriderNode, "lowridercamerapos")
			xmlNodeSetAttribute(childNode, "id", "lowridercamerapos"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(lowridercamera[1]))
			xmlNodeSetAttribute(childNode, "posY", tostring(lowridercamera[2]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(lowridercamera[3]))
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
			childNode = xmlCreateChild(lowriderNode, "lowridercameralook")
			xmlNodeSetAttribute(childNode, "id", "lowridercameralook"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(lowridercamera[4]))
			xmlNodeSetAttribute(childNode, "posY", tostring(lowridercamera[5]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(lowridercamera[6]))
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
		end
	end
	
	for i,house in ipairs(houses) do
		childNode = xmlCreateChild(rootNode, "house")
		xmlNodeSetAttribute(childNode, "id", "house"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "price", tostring(house[2]))
		xmlNodeSetAttribute(childNode, "level", tostring(house[3]))
		local pickupNode = xmlCreateChild(childNode, "housepos")
		xmlNodeSetAttribute(pickupNode, "id", "housepos"..tostring(i))
		local hx, hy, hz = getElementPosition(house[4])
		xmlNodeSetAttribute(pickupNode, "posX", tostring(hx))
		xmlNodeSetAttribute(pickupNode, "posY", tostring(hy))
		xmlNodeSetAttribute(pickupNode, "posZ", tostring(hz))
		xmlNodeSetAttribute(pickupNode, "rotX", "0")
		xmlNodeSetAttribute(pickupNode, "rotY", "0")
		xmlNodeSetAttribute(pickupNode, "rotZ", "0")
		childNode = xmlCreateChild(childNode, "houseparking")
		xmlNodeSetAttribute(childNode, "id", "houseparking"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(house[5]))
		xmlNodeSetAttribute(childNode, "posY", tostring(house[6]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(house[7]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(house[8]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(house[9]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(house[10]))
	end
	
	for i,workstart in ipairs(workStartMarkers) do
		childNode = xmlCreateChild(rootNode, "workstart")
		xmlNodeSetAttribute(childNode, "id", "workstart"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(workstart[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(workstart[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(workstart[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "workid", tostring(workstart[1]))
		xmlNodeSetAttribute(childNode, "icon", tostring(workstart[6]))
	end
	
	for i,healplayer in ipairs(HealthMarkers) do -- функции лечения для .map файла
		childNode = xmlCreateChild(rootNode, "healplayer")
		xmlNodeSetAttribute(childNode, "id", "healplayer"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(healplayer[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(healplayer[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(healplayer[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	    end

	for i,trashmastercp in ipairs(jobTrashmasterCpCoords) do
		childNode = xmlCreateChild(rootNode, "trashmastercp")
		xmlNodeSetAttribute(childNode, "id", "trashmastercp"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(trashmastercp[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(trashmastercp[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(trashmastercp[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,trashmastercar in ipairs(jobTrashmasterCarCoords) do
		childNode = xmlCreateChild(rootNode, "trashmastercar")
		xmlNodeSetAttribute(childNode, "id", "trashmastercar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(trashmastercar[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(trashmastercar[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(trashmastercar[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(trashmastercar[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(trashmastercar[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(trashmastercar[6]))
	end
	
	for i,washroadscp in ipairs(jobWashroadsCpCoords) do
		childNode = xmlCreateChild(rootNode, "washroadscp")
		xmlNodeSetAttribute(childNode, "id", "washroadscp"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(washroadscp[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(washroadscp[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(washroadscp[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,washroadscar in ipairs(jobWashroadsCarCoords) do
		childNode = xmlCreateChild(rootNode, "washroadscar")
		xmlNodeSetAttribute(childNode, "id", "washroadscar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(washroadscar[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(washroadscar[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(washroadscar[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(washroadscar[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(washroadscar[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(washroadscar[6]))
	end
	
	for i,lawncar in ipairs(jobLawnmowCars) do
		childNode = xmlCreateChild(rootNode, "lawncar")
		xmlNodeSetAttribute(childNode, "id", "lawncar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(lawncar[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(lawncar[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(lawncar[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(lawncar[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(lawncar[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(lawncar[6]))
	end
	
	for i,lawn in ipairs(jobLawnmowLawnCoords) do
		childNode = xmlCreateChild(rootNode, "lawn")
		xmlNodeSetAttribute(childNode, "id", "lawn"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		local lawnNode = xmlCreateChild(childNode, "lawncp")
		xmlNodeSetAttribute(lawnNode, "id", "lawncp"..tostring(i))
		xmlNodeSetAttribute(lawnNode, "posX", tostring(lawn[1]))
		xmlNodeSetAttribute(lawnNode, "posY", tostring(lawn[2]))
		xmlNodeSetAttribute(lawnNode, "posZ", tostring(lawn[3]))
		xmlNodeSetAttribute(lawnNode, "rotX", "0")
		xmlNodeSetAttribute(lawnNode, "rotY", "0")
		xmlNodeSetAttribute(lawnNode, "rotZ", "0")
		
		for j,lawngrass in ipairs(lawn[4]) do
			lawnNode = xmlCreateChild(childNode, "lawngrass")
			xmlNodeSetAttribute(lawnNode, "id", "lawngrass"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(lawnNode, "posX", tostring(lawngrass[1]))
			xmlNodeSetAttribute(lawnNode, "posY", tostring(lawngrass[2]))
			xmlNodeSetAttribute(lawnNode, "posZ", tostring(lawngrass[3]))
			xmlNodeSetAttribute(lawnNode, "rotX", "0")
			xmlNodeSetAttribute(lawnNode, "rotY", "0")
			xmlNodeSetAttribute(lawnNode, "rotZ", "0")
		end
		
	end
	
	for i,evacuatorcar in ipairs(jobEvacuatorCars) do
		childNode = xmlCreateChild(rootNode, "evacuatorcar")
		xmlNodeSetAttribute(childNode, "id", "evacuatorcar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(evacuatorcar[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(evacuatorcar[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(evacuatorcar[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(evacuatorcar[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(evacuatorcar[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(evacuatorcar[6]))
	end
	
	for i,truckdeliver in ipairs(jobTruckerTrucks) do
		childNode = xmlCreateChild(rootNode, "truckdeliver")
		xmlNodeSetAttribute(childNode, "id", "truckdeliver"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(truckdeliver[6]))
		xmlNodeSetAttribute(childNode, "posY", tostring(truckdeliver[7]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(truckdeliver[8]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "truck", tostring(truckdeliver[1]))
		xmlNodeSetAttribute(childNode, "trailer", tostring(truckdeliver[2]))
		xmlNodeSetAttribute(childNode, "shipment", tostring(truckdeliver[3]))
		xmlNodeSetAttribute(childNode, "truckvariant1", tostring(truckdeliver[9]))
		xmlNodeSetAttribute(childNode, "truckvariant2", tostring(truckdeliver[10]))
		xmlNodeSetAttribute(childNode, "trailervariant1", tostring(truckdeliver[11]))
		xmlNodeSetAttribute(childNode, "trailervariant2", tostring(truckdeliver[12]))
		xmlNodeSetAttribute(childNode, "zcorrection", tostring(truckdeliver[14]))
	end
	
	for i,truckspawn in ipairs(jobTruckerCarSpawnPoints) do
		childNode = xmlCreateChild(rootNode, "truckspawn")
		xmlNodeSetAttribute(childNode, "id", "truckspawn"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(truckspawn[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(truckspawn[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(truckspawn[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(truckspawn[4]))
	end
	
	for i,ambulancecar in ipairs(jobAmbulanceCars) do
		childNode = xmlCreateChild(rootNode, "ambulancecar")
		xmlNodeSetAttribute(childNode, "id", "ambulancecar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(ambulancecar[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(ambulancecar[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(ambulancecar[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(ambulancecar[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(ambulancecar[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(ambulancecar[6]))
	end
	for i,ambulancefinish in ipairs(jobAmbulanceFinish) do
		childNode = xmlCreateChild(rootNode, "ambulancefinish")
		xmlNodeSetAttribute(childNode, "id", "ambulancefinish"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(ambulancefinish[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(ambulancefinish[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(ambulancefinish[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,field in ipairs(jobFarmFields) do
		childNode = xmlCreateChild(rootNode, "field")
		xmlNodeSetAttribute(childNode, "id", "field"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		local fieldNode = childNode
		childNode = xmlCreateChild(fieldNode, "fieldcar")
		xmlNodeSetAttribute(childNode, "id", "fieldcar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(field[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(field[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(field[3]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(field[4]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(field[5]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(field[6]))
		for j,fieldcp in ipairs(field[8]) do
			childNode = xmlCreateChild(fieldNode, "fieldcp")
			xmlNodeSetAttribute(childNode, "id", "fieldcp"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(fieldcp[1]))
			xmlNodeSetAttribute(childNode, "posY", tostring(fieldcp[2]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(fieldcp[3]))
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
		end
	end
	
	for i,issuance in ipairs(weaponIssuances) do
		childNode = xmlCreateChild(rootNode, "issuance")
		xmlNodeSetAttribute(childNode, "id", "issuance"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(issuance[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(issuance[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(issuance[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "workid", tostring(issuance[4]))
		xmlNodeSetAttribute(childNode, "armor", tostring(issuance[5]))
		local issuanceNode = childNode
		
		for j,issuanceweapon in ipairs(issuance[7]) do
			childNode = xmlCreateChild(issuanceNode, "issuanceweapon")
			xmlNodeSetAttribute(childNode, "id", "issuanceweapon"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", "0")
			xmlNodeSetAttribute(childNode, "posY", "0")
			xmlNodeSetAttribute(childNode, "posZ", "0")
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
			xmlNodeSetAttribute(childNode, "weapon", tostring(issuanceweapon[1]))
			xmlNodeSetAttribute(childNode, "ammo", tostring(issuanceweapon[2]))
		end
	end
	
	for i,militarybase in ipairs(militaryBases) do
		childNode = xmlCreateChild(rootNode, "militarybase")
		xmlNodeSetAttribute(childNode, "id", "militarybase"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(militarybase[13]))
		xmlNodeSetAttribute(childNode, "posY", tostring(militarybase[14]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(militarybase[15]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "X1", tostring(militarybase[1]))
		xmlNodeSetAttribute(childNode, "Y1", tostring(militarybase[2]))
		xmlNodeSetAttribute(childNode, "X2", tostring(militarybase[3]))
		xmlNodeSetAttribute(childNode, "Y2", tostring(militarybase[4]))
		xmlNodeSetAttribute(childNode, "X3", tostring(militarybase[5]))
		xmlNodeSetAttribute(childNode, "Y3", tostring(militarybase[6]))
		xmlNodeSetAttribute(childNode, "X4", tostring(militarybase[7]))
		xmlNodeSetAttribute(childNode, "Y4", tostring(militarybase[8]))
		xmlNodeSetAttribute(childNode, "Zmin", tostring(militarybase[9]))
		xmlNodeSetAttribute(childNode, "Zmax", tostring(militarybase[10]))
	end
	
	for i,militarygeneral in ipairs(militaryGeneralInfo) do
		childNode = xmlCreateChild(rootNode, "militarygeneral")
		xmlNodeSetAttribute(childNode, "id", "militarygeneral"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		local generalNode = childNode
		childNode = xmlCreateChild(generalNode, "militarygeneralcar")
		xmlNodeSetAttribute(childNode, "id", "militarygeneralcar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(militarygeneral[13]))
		xmlNodeSetAttribute(childNode, "posY", tostring(militarygeneral[14]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(militarygeneral[15]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(militarygeneral[16]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(militarygeneral[17]))
		
		xmlNodeSetAttribute(childNode, "rotZ", tostring(militarygeneral[18]))
		for j,militarygeneraldest in ipairs(militarygeneral[7]) do
			childNode = xmlCreateChild(generalNode, "militarygeneraldest")
			xmlNodeSetAttribute(childNode, "id", "militarygeneraldest"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(militarygeneraldest[1]))
			xmlNodeSetAttribute(childNode, "posY", tostring(militarygeneraldest[2]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(militarygeneraldest[3]))
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
			xmlNodeSetAttribute(childNode, "radius", tostring(militarygeneraldest[4]))
			xmlNodeSetAttribute(childNode, "placename", tostring(militarygeneraldest[5]))
			xmlNodeSetAttribute(childNode, "timems", tostring(militarygeneraldest[6]))
		end
		
	end
	
	for i,taxicar in ipairs(jobTaxiCars) do
		childNode = xmlCreateChild(rootNode, "taxicar")
		xmlNodeSetAttribute(childNode, "id", "taxicar"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(taxicar[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(taxicar[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(taxicar[4]))
		xmlNodeSetAttribute(childNode, "rotX", tostring(taxicar[5]))
		xmlNodeSetAttribute(childNode, "rotY", tostring(taxicar[6]))
		xmlNodeSetAttribute(childNode, "rotZ", tostring(taxicar[7]))
		xmlNodeSetAttribute(childNode, "model", tostring(taxicar[1]))
	end
	
	for i,taxifinish in ipairs(jobTaxiCpsFinish) do
		childNode = xmlCreateChild(rootNode, "taxifinish")
		xmlNodeSetAttribute(childNode, "id", "taxifinish"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(taxifinish[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(taxifinish[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(taxifinish[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	for i,heavertakecp in ipairs(heaverTakeMarkers) do
		childNode = xmlCreateChild(rootNode, "heavertakecp")
		xmlNodeSetAttribute(childNode, "id", "heavertakecp"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(heavertakecp[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(heavertakecp[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(heavertakecp[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,heaverdelivercp in ipairs(heaverDeliverMarkers) do
		childNode = xmlCreateChild(rootNode, "heaverdelivercp")
		xmlNodeSetAttribute(childNode, "id", "heaverdelivercp"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(heaverdelivercp[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(heaverdelivercp[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(heaverdelivercp[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,carsellblip in ipairs(carSellShops) do
		childNode = xmlCreateChild(rootNode, "carsellblip")
		xmlNodeSetAttribute(childNode, "id", "carsellblip"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(carsellblip[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(carsellblip[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(carsellblip[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "icon", tostring(carsellblip[4]))
	end
	
	for i,carsellsell in ipairs(carSellSellCps) do
		childNode = xmlCreateChild(rootNode, "carsellsell")
		xmlNodeSetAttribute(childNode, "id", "carsellsell"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(carsellsell[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(carsellsell[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(carsellsell[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,carsellshop in ipairs(carSellBuySpawns) do
		childNode = xmlCreateChild(rootNode, "carsellshop")
		xmlNodeSetAttribute(childNode, "id", "carsellshop"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "type", tostring(carsellshop[5]))
		local sellPosNode = xmlCreateChild(childNode, "carsellbuy")
		xmlNodeSetAttribute(sellPosNode, "id", "carsellbuy"..tostring(i))
		xmlNodeSetAttribute(sellPosNode, "posX", tostring(carsellshop[1]))
		xmlNodeSetAttribute(sellPosNode, "posY", tostring(carsellshop[2]))
		xmlNodeSetAttribute(sellPosNode, "posZ", tostring(carsellshop[3]))
		xmlNodeSetAttribute(sellPosNode, "rotX", "0")
		xmlNodeSetAttribute(sellPosNode, "rotY", "0")
		xmlNodeSetAttribute(sellPosNode, "rotZ", tostring(carsellshop[4]))
		
		for j,carsellpos in ipairs(carSellCarSpawnPoints) do
			if(i == carsellpos[5]) then
				sellPosNode = xmlCreateChild(childNode, "carsellpos")
				xmlNodeSetAttribute(sellPosNode, "id", "carsellpos"..tostring(i).."("..tostring(j)..")")
				xmlNodeSetAttribute(sellPosNode, "posX", tostring(carsellpos[1]))
				xmlNodeSetAttribute(sellPosNode, "posY", tostring(carsellpos[2]))
				xmlNodeSetAttribute(sellPosNode, "posZ", tostring(carsellpos[3]))
				xmlNodeSetAttribute(sellPosNode, "rotX", "0")
				xmlNodeSetAttribute(sellPosNode, "rotY", "0")
				xmlNodeSetAttribute(sellPosNode, "rotZ", tostring(carsellpos[4]))
			end
		end

	end
	
	for i,cartune in ipairs(carTuneCps) do
		childNode = xmlCreateChild(rootNode, "cartune")
		xmlNodeSetAttribute(childNode, "id", "cartune"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(cartune[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(cartune[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(cartune[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(cartune[4]))
	end
	
	for i,ammushop in ipairs(ammuShops) do
		childNode = xmlCreateChild(rootNode, "ammushop")
		xmlNodeSetAttribute(childNode, "id", "ammushop"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(ammushop[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(ammushop[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(ammushop[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(ammushop[5]))
		xmlNodeSetAttribute(childNode, "ammuinterior", tostring(ammushop[1]))
	end
	
	for i,eatlocation in ipairs(eatLocations) do
		childNode = xmlCreateChild(rootNode, "eatlocation")
		xmlNodeSetAttribute(childNode, "id", "eatlocation"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(eatlocation[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(eatlocation[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(eatlocation[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(eatlocation[5]))
		xmlNodeSetAttribute(childNode, "type", tostring(eatlocation[1]))
	end
	
	for i,otblocation in ipairs(otbLocations) do
		childNode = xmlCreateChild(rootNode, "otblocation")
		xmlNodeSetAttribute(childNode, "id", "otblocation"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(otblocation[2]))
		xmlNodeSetAttribute(childNode, "posY", tostring(otblocation[3]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(otblocation[4]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(otblocation[5]))
	end
	
	for i,seller in ipairs(outsideFoodSellers) do
		childNode = xmlCreateChild(rootNode, "seller")
		xmlNodeSetAttribute(childNode, "id", "seller"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(seller[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(seller[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(seller[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", tostring(seller[4]))
		local sellerNode = childNode
		
		for j,sellitem in ipairs(seller[5]) do
			childNode = xmlCreateChild(sellerNode, "sellitem")
			xmlNodeSetAttribute(childNode, "id", "sellitem"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", "0")
			xmlNodeSetAttribute(childNode, "posY", "0")
			xmlNodeSetAttribute(childNode, "posZ", "0")
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
			xmlNodeSetAttribute(childNode, "goodid", tostring(sellitem))
		end
		
	end
	
	for i,fuelstation in ipairs(fuelStations) do
		childNode = xmlCreateChild(rootNode, "fuelstation")
		xmlNodeSetAttribute(childNode, "id", "fuelstation"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(fuelstation[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(fuelstation[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(fuelstation[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
	end
	
	for i,race in ipairs(raceInfo) do
		childNode = xmlCreateChild(rootNode, "race")
		xmlNodeSetAttribute(childNode, "id", "race"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", "0")
		xmlNodeSetAttribute(childNode, "posY", "0")
		xmlNodeSetAttribute(childNode, "posZ", "0")
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "interior", tostring(race[7]))
		xmlNodeSetAttribute(childNode, "laps", tostring(race[8]))
		xmlNodeSetAttribute(childNode, "preparetimems", tostring(race[9]))
		xmlNodeSetAttribute(childNode, "racetimems", tostring(race[10]))
		local vehtype
		
		if(race[11] == 0) then
			vehtype = "car"
		elseif(race[11] == 1) then
			vehtype = "motorcycle"
		else
			vehtype = "bicycle"
		end
		
		xmlNodeSetAttribute(childNode, "vehtype", vehtype)
		xmlNodeSetAttribute(childNode, "prize1st", tostring(race[12]))
		xmlNodeSetAttribute(childNode, "prize2nd", tostring(race[13]))
		xmlNodeSetAttribute(childNode, "prize3rd", tostring(race[14]))
		local raceNode = childNode
		childNode = xmlCreateChild(raceNode, "racecamerapos")
		xmlNodeSetAttribute(childNode, "id", "racecamerapos"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(race[1]))
		xmlNodeSetAttribute(childNode, "posY", tostring(race[2]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(race[3]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		childNode = xmlCreateChild(raceNode, "racecameralook")
		xmlNodeSetAttribute(childNode, "id", "racecameralook"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(race[4]))
		xmlNodeSetAttribute(childNode, "posY", tostring(race[5]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(race[6]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		childNode = xmlCreateChild(raceNode, "racestartmarker")
		xmlNodeSetAttribute(childNode, "id", "racestartmarker"..tostring(i))
		xmlNodeSetAttribute(childNode, "posX", tostring(race[15]))
		xmlNodeSetAttribute(childNode, "posY", tostring(race[16]))
		xmlNodeSetAttribute(childNode, "posZ", tostring(race[17]))
		xmlNodeSetAttribute(childNode, "rotX", "0")
		xmlNodeSetAttribute(childNode, "rotY", "0")
		xmlNodeSetAttribute(childNode, "rotZ", "0")
		xmlNodeSetAttribute(childNode, "radius", tostring(race[18]))
		
		for j,racestartpos in ipairs(race[19]) do
			childNode = xmlCreateChild(raceNode, "racestartpos")
			xmlNodeSetAttribute(childNode, "id", "racestartpos"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(racestartpos[1]))
			xmlNodeSetAttribute(childNode, "posY", tostring(racestartpos[2]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(racestartpos[3]))
			xmlNodeSetAttribute(childNode, "rotX", tostring(racestartpos[4]))
			xmlNodeSetAttribute(childNode, "rotY", tostring(racestartpos[5]))
			xmlNodeSetAttribute(childNode, "rotZ", tostring(racestartpos[6]))
		end
		
		for j,racecp in ipairs(race[20]) do
			childNode = xmlCreateChild(raceNode, "racecp")
			xmlNodeSetAttribute(childNode, "id", "racecp"..tostring(i).."("..tostring(j)..")")
			xmlNodeSetAttribute(childNode, "posX", tostring(racecp[1]))
			xmlNodeSetAttribute(childNode, "posY", tostring(racecp[2]))
			xmlNodeSetAttribute(childNode, "posZ", tostring(racecp[3]))
			xmlNodeSetAttribute(childNode, "rotX", "0")
			xmlNodeSetAttribute(childNode, "rotY", "0")
			xmlNodeSetAttribute(childNode, "rotZ", "0")
			xmlNodeSetAttribute(childNode, "radius", tostring(racecp[4]))
		end
		
	end
	
	xmlSaveFile(rootNode)
	xmlUnloadFile(rootNode)
end

function splitString(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function getACLGroupUsers(grpName)
	local aclName
	local returnList = {}
	local aclGroup = aclGetGroup(grpName)
	
	if aclGroup then
		local aclGroupList = aclGroupListObjects(aclGroup)
		
		if aclGroupList then
			for _,aclName in pairs(aclGroupList) do
				if string.sub(aclName, 1, 5) == "user." then
					aclName = string.sub(aclName, 6)
					
					if aclName == "MrJengas" then
						aclName = "Admin_Jengas"
					
					elseif aclName == "JustEazzy" then
						aclName = "Admin_JustEazzy"
					
					elseif aclName == "DEAGLOS" then
						aclName = "Admin_Deaglos"
					
					elseif aclName == "StinGeR" then
						aclName = "Admin_Stinger"
					end
					
					table.insert(returnList, aclName)
				end
			end
		end
	end
	return returnList
end

function getAdministrationList()
	local returnList = {}
	--local adminList = getACLGroupUsers("Helper")
	--for _,listItem in ipairs(adminList) do
	--	table.insert(returnList, listItem)
	--end
	local adminList = getACLGroupUsers("Moderator")
	
	for _,listItem in ipairs(adminList) do
		table.insert(returnList, listItem)
	end
	
	adminList = getACLGroupUsers("Admin")
	
	for _,listItem in ipairs(adminList) do
		table.insert(returnList, listItem)
	end
	return returnList
end

function loadMapFile()
	local elemx, elemy, elemz, elemrx, elemry, elemrz, mdl, oint
	local elements = getElementsByType("pickup")
	local children
	
	for i,pup in ipairs(elements) do
		local pupName = getElementData(pup, "id")
		
		if(string.sub(pupName, 1, 4) == "base") then
			local baseHash = getHash(pupName)
			elemx, elemy, elemz = getElementPosition(pup)
			local baseInfo = { baseHash, elemx, elemy, elemz, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, {}, {}, nil, nil, nil, nil, {}, nil, 0, {}, {}, "closed", clanBaseCars[1], {}, nil, "off", false, nil }
			baseInfo[36] = createBlip(elemx, elemy, elemz, 23, 2, 255, 255, 255, 255, 1, 300)
			children = getElementChildren(pup, "object")
			local minX = 900000.0
			local minY = 900000.0
			local maxX = -900000.0
			local maxY = -900000.0
			
			for _,child in ipairs(children) do
				mdl = tonumber(getElementData(child, "model"))
				elemx, elemy, elemz = getElementPosition(child)
				minX = math.min(minX, elemx)
				minY = math.min(minY, elemy)
				maxX = math.max(maxX, elemx)
				maxY = math.max(maxY, elemy)
				elemrx = getElementData(child, "rotX")
				elemry = getElementData(child, "rotY")
				elemrz = getElementData(child, "rotZ")
				
				if(mdl == 971) then
					baseInfo[12] = elemx
					baseInfo[13] = elemy
					baseInfo[14] = elemz
					baseInfo[15] = elemrx
					baseInfo[16] = elemry
					baseInfo[17] = elemrz
				
				elseif(mdl == 967) then
					table.insert(baseInfo[18], { elemx, elemy, elemz, elemrx, elemry, elemrz })
				
				elseif(mdl == 987) then
					table.insert(extraObjs, { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
				
				else
					for lvl,sizeInfo in ipairs(clanBaseSizes) do
						if(mdl == sizeInfo[1]) then
							baseInfo[5] = lvl
							baseInfo[6] = elemx
							baseInfo[7] = elemy
							baseInfo[8] = elemz-sizeInfo[3]
							baseInfo[9] = elemrx
							baseInfo[10] = elemry
							baseInfo[11] = elemrz
							break
						end
					end
				end
				
				destroyElement(child)
			end
			minX = minX-5.0
			minY = minY-5.0
			maxX = maxX+5.0
			maxY = maxY+5.0
			children = getElementChildren(pup, "vehicle")
			
			for _,child in ipairs(children) do
				mdl = tonumber(getElementData(child, "model"))
				
				if(mdl == clanBaseCars[1]) then
					elemx, elemy, elemz = getElementPosition(child)
					elemrx = getElementData(child, "rotX")
					elemry = getElementData(child, "rotY")
					elemrz = getElementData(child, "rotZ")
					table.insert(baseInfo[19], { elemx, elemy, elemz, elemrx, elemry, elemrz })
				
				elseif(mdl == 611) then
					elemx, elemy, elemz = getElementPosition(child)
					elemrx = getElementData(child, "rotX")
					elemry = getElementData(child, "rotY")
					elemrz = getElementData(child, "rotZ")
					baseInfo[32] = { elemx, elemy, elemz, elemrx, elemry, elemrz }
				end
				
				destroyElement(child)
			end
			baseInfo[35] = createRadarArea(minX, minY, maxX-minX, maxY-minY, 255, 255, 255, 0)
			table.insert(clanBases, baseInfo)
			destroyElement(pup)
		end
	end
	
	local elements = getElementsByType("respawn")
	
	for i,respawn in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(respawn)
		elemrz = getElementData(respawn, "rotZ")
		oint = tonumber(getElementData(respawn, "interior"))
		local fId = tonumber(getElementData(respawn, "fraction"))
		table.insert(respawnPositions, { elemx, elemy, elemz, elemrz, oint, fId })
		destroyElement(respawn)
	end
	
	elements = getElementsByType("bot")
	
	for i,bot in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(bot)
		elemrz = getElementData(bot, "rotZ")
		mdl = tonumber(getElementData(bot, "model"))
		local interior = tonumber(getElementData(bot, "botinterior"))
		local animbank = getElementData(bot, "animbank")
		local animname = getElementData(bot, "animname")
		table.insert(bots, { mdl, elemx, elemy, elemz, elemrz, animbank, animname, interior })
		destroyElement(bot)
	end
	
	gangsterStealGenerateCarPool(math.random(600, 1200))
	gangsterStealCreateMarkers()
	local carPoolCounter = 1
	elements = getElementsByType("vehicle", resourceRoot)
	
	for i,veh in ipairs(elements) do
		local vehName = getElementData(veh, "id")
		elemx, elemy, elemz = getElementPosition(veh)
		elemrx = getElementData(veh, "rotX")
		elemry = getElementData(veh, "rotY")
		elemrz = getElementData(veh, "rotZ")
		
		if(string.sub(vehName, 1, 12) == "stealableCar") then
			--[[
			mdl = tonumber(getElementData(veh, "model"))
			local _,_,minZ1 = exports.server_coldata:getModelBoundingBox(mdl)
			]]
			
			if(#gangsterStealCarPool < carPoolCounter) then
				mdl = gangsterStealCarPool[carPoolCounter]
				carPoolCounter = carPoolCounter + 1
			else
				mdl = carSellCarArrays["car"][math.random(#carSellCarArrays["car"])]
			end
			
			--[[
			local _,_,minZ2 = exports.server_coldata:getModelBoundingBox(mdl)
			if minZ1 and minZ2 then
				elemz = elemz + minZ2 - minZ1
			end
			]]
			
			if(math.random(100) > 50) then
				elemrz = elemrz + 180.0
				if(elemrz > 360.0) then
					elemrz = elemrz - 360.0
				end
			end
			
			gangsterStealCreateCar(mdl, elemx, elemy, elemz, elemrx, elemry, elemrz)
		else
			mdl = tonumber(getElementData(veh, "model"))
			table.insert(extraVehCoords, { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
		end
		
		destroyElement(veh)
	end
	elements = getElementsByType("object", resourceRoot)
	local subStrs, elemint
	
	for i,obj in ipairs(elements) do
		elemid = getElementData(obj, "id")
		elemx, elemy, elemz = getElementPosition(obj)
		elemrx = getElementData(obj, "rotX")
		elemry = getElementData(obj, "rotY")
		elemrz = getElementData(obj, "rotZ")
		oint = getElementData(obj, "interior")
		
		if oint then
			oint = (tonumber(oint) or 0)
		else
			oint = 0
		end
		
		mdl = tonumber(getElementData(obj, "model"))
		--outputServerLog("RESPLAY: Loading object '"..elemid.."'...")
		if(string.sub(elemid, 1, 8) == "stealobj") then
			subStrs = splitString(elemid, "_")
			local intId = tonumber(subStrs[2])
			local arrayId = tonumber(subStrs[3])
			
			if intId and arrayId then
				arrayId = arrayId+1
				if not gangsterStealObjs[intId] then
					gangsterStealObjs[intId] = {}
				end
				
				if not gangsterStealObjs[intId][arrayId] then
					gangsterStealObjs[intId][arrayId] = {}
				end
				
				table.insert(gangsterStealObjs[intId][arrayId], { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
			end
			
		elseif(string.sub(elemid, 1, 9) == "stealcont") then
			subStrs = splitString(elemid, "_")
			local intId = tonumber(subStrs[2])
			local arrayId = tonumber(subStrs[3])
			
			if intId and arrayId then
				arrayId = arrayId+1
				
				if not gangsterStealContainers[intId] then
					gangsterStealContainers[intId] = {}
				end
				
				if not gangsterStealContainers[intId][arrayId] then
					gangsterStealContainers[intId][arrayId] = {}
				end
				table.insert(gangsterStealContainers[intId][arrayId], { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
			end
		elseif(string.sub(elemid, 1, 6) == "house_") then
			subStrs = splitString(elemid, "_")
			local intId = tonumber(subStrs[2])
			
			if intId and housesInteriors[intId] then
				table.insert(housesInteriors[intId][5], { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
			end
		
		else
			table.insert(extraObjs, { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz, oint })
		end
		
		destroyElement(obj)
	end
	elements = getElementsByType("ped", resourceRoot)
	for i,curPed in ipairs(elements) do
		elemid = getElementData(curPed, "id")
		
		if(string.sub(elemid, 1, 8) == "stealped") then
			subStrs = splitString(elemid, "_")
			elemx, elemy, elemz = getElementPosition(curPed)
			elemrz = getElementData(curPed, "rotZ")
			mdl = tonumber(getElementData(curPed, "skin"))
			
			if not gangsterStealBots[subStrs[2]] then
				gangsterStealBots[subStrs[2]] = {}
			end
			
			table.insert(gangsterStealBots[subStrs[2]], { mdl, elemx, elemy, elemz, elemrz })
		end
		destroyElement(curPed)
	end
	elements = getElementsByType("removeWorldObject", resourceRoot)
	for i,removeObj in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(removeObj)
		mdl = tonumber(getElementData(removeObj, "model"))
		elemrz = tonumber(getElementData(removeObj, "radius"))
		local removeInt = tonumber(getElementData(removeObj, "interior"))
		
		if not removeInt then
			removeInt = 0
		end
		
		table.insert(removeObjs, { mdl, elemx, elemy, elemz, elemrz, removeInt })
		mdl = tonumber(getElementData(removeObj, "lodModel"))
		if(mdl ~= 0) then
			table.insert(removeObjs, { mdl, elemx, elemy, elemz, elemrz, removeInt })
		end
		destroyElement(removeObj)
	end
	elements = getElementsByType("house")
	local dbStr = "INSERT IGNORE INTO houses(id) VALUES "
	local housescount = table.getn(elements)
	
	for i,house in ipairs(elements) do
		children = getElementChildren(house, "housepos")
		if(table.getn(children) > 0) then
			local housepos = children[1]
			children = getElementChildren(house, "houseparking")
			
			if(table.getn(children) > 0) then
				local houseparking = children[1]
				elemid = getHash(getElementData(house, "id"))
				elemx, elemy, elemz = getElementPosition(housepos)
				local vx, vy, vz = getElementPosition(houseparking)
				local vangx = getElementData(houseparking, "rotX")
				local vangy = getElementData(houseparking, "rotY")
				local vangz = getElementData(houseparking, "rotZ")
				local lvl = getElementData(house, "level")
				local price = getElementData(house, "price")
				
				if(i > 1) then
					dbStr = dbStr..","
				end
				
				dbStr = dbStr..dbPrepareString(db, "(?)", elemid)
				houses[elemid] = { elemid, tonumber(lvl), tonumber(price), { elemx, elemy, elemz }, tonumber(vx), tonumber(vy), tonumber(vz), tonumber(vangx), tonumber(vangy), tonumber(vangz), 0 }
				destroyElement(houseparking)
			end
			destroyElement(housepos)
		end
		destroyElement(house)
	end
	
	repeat
		dbq = dbQuery(db, "SELECT id FROM houses", sqlid)
		dbqueryresult = dbPoll(dbq, 120000)
		dbFree(dbq)
	until dbqueryresult
	
	while(table.getn(dbqueryresult) < housescount) do
		dbExec(db, dbStr)
		repeat
			dbq = dbQuery(db, "SELECT id FROM houses", sqlid)
			dbqueryresult = dbPoll(dbq, 120000)
			dbFree(dbq)
		until dbqueryresult
	end
	
	elements = getElementsByType("vehcommonspawn")
	for i,vehcommonspawn in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(vehcommonspawn)
		local radius = tonumber(getElementData(vehcommonspawn, "radius"))
		local vehtype = getElementData(vehcommonspawn, "vehtype")
		elemrz = getElementData(vehcommonspawn, "rotZ")
		table.insert(vehCommonSpawnPos, { elemx, elemy, elemz, radius, elemrz, nil, vehtype })
		destroyElement(vehcommonspawn)
	end
	
	elements = getElementsByType("tutorial")
	for i,tutorial in ipairs(elements) do
		local tName = getElementData(tutorial, "name")
		
		if tutorialImages[tName] then
			table.insert(tutorialArray, { tName, tutorialImages[tName] })
		else
			table.insert(tutorialArray, { tName, getElementData(tutorial, "youtubeid") })
		end
		
		children = getElementChildren(tutorial, "tutorialbot")
		
		for j,tutorialbot in ipairs(children) do
			elemx, elemy, elemz = getElementPosition(tutorialbot)
			elemrz = getElementData(tutorialbot, "rotZ")
			table.insert(tutorialPositions, { i, elemx, elemy, elemz, elemrz, nil })
			destroyElement(tutorialbot)
		end
		
		destroyElement(tutorial)
	end

	elements = getElementsByType("luckyphone")	
	for i,luckyphone in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(luckyphone)
		elemrx = getElementData(luckyphone, "rotX")
		elemry = getElementData(luckyphone, "rotY")
		elemrz = getElementData(luckyphone, "rotZ")
		table.insert(luckyPhoneCoords, { elemx, elemy, elemz, elemrx, elemry, elemrz, nil })
		destroyElement(luckyphone)
	end
	
	elements = getElementsByType("lowrider")
	for i,lowrider in ipairs(elements) do
		local cp = getElementChildren(lowrider, "lowridercp")
		
		if(table.getn(cp) > 0) then
			cp = cp[1]
			elemx, elemy, elemz = getElementPosition(cp)
			local plrs = getElementChildren(lowrider, "lowriderplr")
			
			if(table.getn(plrs) > 1) then
				local p1x, p1y, p1z = getElementPosition(plrs[1])
				local p1r = getElementData(plrs[1], "rotZ")
				local p2x, p2y, p2z = getElementPosition(plrs[2])
				local p2r = getElementData(plrs[2], "rotZ")
				local placename = getElementData(lowrider, "placename")
				local camerapos = getElementChildren(lowrider, "lowridercamerapos")
				local cameralook = getElementChildren(lowrider, "lowridercameralook")
				
				if(table.getn(camerapos) <= table.getn(cameralook)) then
					local cameras = {}
					local px, py, pz, lx, ly, lz
					
					for j=1,table.getn(camerapos) do
						px, py, pz = getElementPosition(camerapos[j])
						lx, ly, lz = getElementPosition(cameralook[j])
						table.insert(cameras, { px, py, pz, lx, ly, lz })
						destroyElement(camerapos[j])
						destroyElement(cameralook[j])
					end
					
					table.insert(lowriderMarkers, { elemx, elemy, elemz, nil, p1x, p1y, p1z, p1r, p2x, p2y, p2z, p2r, {}, cameras, false, placename, 0, 0, 0, {}, nil })
				end
				
				destroyElement(plrs[1])
				destroyElement(plrs[2])
			end
			
			destroyElement(cp)
		end
		
		destroyElement(lowrider)
	end
	
	elements = getElementsByType("workstart")
	
	for i,workstart in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(workstart)
		local workid = tonumber(getElementData(workstart, "workid"))
		local blipid = tonumber(getElementData(workstart, "icon"))
		table.insert(workStartMarkers, { workid, elemx, elemy, elemz, nil, blipid })
		destroyElement(workstart)
	end
	
	elements = getElementsByType("healplayer") -- функции для маркера лечения в больнице.
	
	for i,healplayer in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(healplayer)
		local id = tonumber(getElementData(healplayer, "id"))
		table.insert(HealthMarkers, { id, elemx, elemy, elemz, nil})
		destroyElement(healplayer)
	end
	
	elements = getElementsByType("trashmastercp")
	
	for i,trashmastercp in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(trashmastercp)
		table.insert(jobTrashmasterCpCoords, { elemx, elemy, elemz })
		destroyElement(trashmastercp)
	end
	
	elements = getElementsByType("trashmastercar")
	
	for i,trashmastercar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(trashmastercar)
		elemrx = getElementData(trashmastercar, "rotX")
		elemry = getElementData(trashmastercar, "rotY")
		elemrz = getElementData(trashmastercar, "rotZ")
		table.insert(jobTrashmasterCarCoords, { elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(trashmastercar)
	end
	
	elements = getElementsByType("washroadscp")
	
	for i,washroadscp in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(washroadscp)
		table.insert(jobWashroadsCpCoords, { elemx, elemy, elemz })
		destroyElement(washroadscp)
	end
	
	elements = getElementsByType("washroadscar")
	
	for i,washroadscar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(washroadscar)
		elemrx = getElementData(washroadscar, "rotX")
		elemry = getElementData(washroadscar, "rotY")
		elemrz = getElementData(washroadscar, "rotZ")
		table.insert(jobWashroadsCarCoords, { elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(washroadscar)
	end
	
	elements = getElementsByType("lawncar")
	
	for i,lawncar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(lawncar)
		elemrx = getElementData(lawncar, "rotX")
		elemry = getElementData(lawncar, "rotY")
		elemrz = getElementData(lawncar, "rotZ")
		table.insert(jobLawnmowCars, { elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(lawncar)
	end
	
	elements = getElementsByType("lawn")
	
	for i,lawn in ipairs(elements) do
		children = getElementChildren(lawn, "lawncp")
		
		if(table.getn(children) > 0) then
			local lawncp = children[1]
			local grassArray = {}
			children = getElementChildren(lawn, "lawngrass")
			
			for j,lawngrass in ipairs(children) do
				elemx, elemy, elemz = getElementPosition(lawngrass)
				table.insert(grassArray, { elemx, elemy, elemz })
				destroyElement(lawngrass)
			end
			
			elemx, elemy, elemz = getElementPosition(lawncp)
			table.insert(jobLawnmowLawnCoords, { elemx, elemy, elemz, grassArray })
			destroyElement(lawncp)
		end
		
		destroyElement(lawn)
	end
	
	elements = getElementsByType("evacuatorcar")
	
	for i,evacuatorcar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(evacuatorcar)
		elemrx = getElementData(evacuatorcar, "rotX")
		elemry = getElementData(evacuatorcar, "rotY")
		elemrz = getElementData(evacuatorcar, "rotZ")
		table.insert(jobEvacuatorCars, { elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(evacuatorcar)
	end
	
	elements = getElementsByType("truckdeliver")
	
	for i,truckdeliver in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(truckdeliver)
		local vehid = tonumber(getElementData(truckdeliver, "truck"))
		local trailerid = tonumber(getElementData(truckdeliver, "trailer"))
		local shipment = getElementData(truckdeliver, "shipment")
		local vehvar1 = tonumber(getElementData(truckdeliver, "truckvariant1"))
		local vehvar2 = tonumber(getElementData(truckdeliver, "truckvariant2"))
		local trailervar1 = tonumber(getElementData(truckdeliver, "trailervariant1"))
		local trailervar2 = tonumber(getElementData(truckdeliver, "trailervariant2"))
		local zcorrection = tonumber(getElementData(truckdeliver, "zcorrection"))
		table.insert(jobTruckerTrucks, { vehid, trailerid, shipment, nil, nil, elemx, elemy, elemz, vehvar1, vehvar2, trailervar1, trailervar2, 0, zcorrection })
		destroyElement(truckdeliver)
	end
	
	elements = getElementsByType("truckspawn")
	
	for i,truckspawn in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(truckspawn)
		elemrz = getElementData(truckspawn, "rotZ")
		local vehtype = getElementData(truckspawn, "vehtype")
		table.insert(jobTruckerCarSpawnPoints, { elemx, elemy, elemz, elemrz, true, vehtype })
		destroyElement(truckspawn)
	end
	
	elements = getElementsByType("ambulancecar")
	
	for i,ambulancecar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(ambulancecar)
		elemrx = getElementData(ambulancecar, "rotX")
		elemry = getElementData(ambulancecar, "rotY")
		elemrz = getElementData(ambulancecar, "rotZ")
		table.insert(jobAmbulanceCars, { elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(ambulancecar)
	end
	
	elements = getElementsByType("ambulancefinish")
	
	for i,ambulancefinish in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(ambulancefinish)
		table.insert(jobAmbulanceFinish, { elemx, elemy, elemz, nil, nil })
		destroyElement(ambulancefinish)
	end
	
	elements = getElementsByType("field")
	
	for i,field in ipairs(elements) do
		children = getElementChildren(field, "fieldcar")
		
		if(table.getn(children) > 0) then
			local fieldcar = children[1]
			children = getElementChildren(field, "fieldcp")
			local cpArray = {}
			
			for j,fieldcp in ipairs(children) do
				elemx, elemy, elemz = getElementPosition(fieldcp)
				table.insert(cpArray, { elemx, elemy, elemz, nil })
				destroyElement(fieldcp)
			end
			
			elemx, elemy, elemz = getElementPosition(fieldcar)
			elemrx = getElementData(fieldcar, "rotX")
			elemry = getElementData(fieldcar, "rotY")
			elemrz = getElementData(fieldcar, "rotZ")
			table.insert(jobFarmFields, { elemx, elemy, elemz, elemrx, elemry, elemrz, nil, cpArray })
			destroyElement(fieldcar)
		end
		
		destroyElement(field)
	end
	elements = getElementsByType("issuance")
	
	for i,issuance in ipairs(elements) do
		children = getElementChildren(issuance, "issuanceweapon")
		local weapArray = {}
		local weap, ammo
		
		for j,issuanceweapon in ipairs(children) do
			weap = tonumber(getElementData(issuanceweapon, "weapon"))
			ammo = tonumber(getElementData(issuanceweapon, "ammo"))
			table.insert(weapArray, { weap, ammo })
			destroyElement(issuanceweapon)
		end
		
		elemx, elemy, elemz = getElementPosition(issuance)
		local armor = getElementData(issuance, "armor")
		
		if(armor == "true") then
			armor = true
		else
			armor = false
		end
		
		local workid = tonumber(getElementData(issuance, "workid"))
		oint = tonumber(getElementData(issuance, "interior"))
		table.insert(weaponIssuances, { elemx, elemy, elemz, workid, armor, nil, weapArray, oint })
		destroyElement(issuance)
	end
	
	elements = getElementsByType("militarybase")
	for i,militarybase in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(militarybase)
		local x1 = tonumber(getElementData(militarybase, "X1"))
		local y1 = tonumber(getElementData(militarybase, "Y1"))
		local x2 = tonumber(getElementData(militarybase, "X2"))
		local y2 = tonumber(getElementData(militarybase, "Y2"))
		local x3 = tonumber(getElementData(militarybase, "X3"))
		local y3 = tonumber(getElementData(militarybase, "Y3"))
		local x4 = tonumber(getElementData(militarybase, "X4"))
		local y4 = tonumber(getElementData(militarybase, "Y4"))
		local zmin = tonumber(getElementData(militarybase, "Zmin"))
		local zmax = tonumber(getElementData(militarybase, "Zmax"))
		table.insert(militaryBases, { x1, y1, x2, y2, x3, y3, x4, y4, zmin, zmax, nil, false, elemx, elemy, elemz, nil })
		destroyElement(militarybase)
	end
	
	elements = getElementsByType("militarygeneral")
	for i,militarygeneral in ipairs(elements) do
		children = getElementChildren(militarygeneral, "militarygeneralcar")
		if(table.getn(children) > 0) then
			local militarygeneralcar = children[1]
			children = getElementChildren(militarygeneral, "militarygeneraldest")
			local destArray = {}
			
			for j,militarygeneraldest in ipairs(children) do
				elemx, elemy, elemz = getElementPosition(militarygeneraldest)
				local radius = tonumber(getElementData(militarygeneraldest, "radius"))
				local placename = getElementData(militarygeneraldest, "placename")
				local timems = tonumber(getElementData(militarygeneraldest, "timems"))
				table.insert(destArray, { elemx, elemy, elemz, radius, placename, timems })
				destroyElement(militarygeneraldest)
			end
			
			elemx, elemy, elemz = getElementPosition(militarygeneralcar)
			elemrx = getElementData(militarygeneralcar, "rotX")
			elemry = getElementData(militarygeneralcar, "rotY")
			elemrz = getElementData(militarygeneralcar, "rotZ")
			table.insert(militaryGeneralInfo, { elemx, elemy, elemz, elemrx, elemry, elemrz, destArray })
			destroyElement(militarygeneralcar)
		end
		
		destroyElement(militarygeneral)
	end
	elements = getElementsByType("taxicar")
	
	for i,taxicar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(taxicar)
		elemrx = getElementData(taxicar, "rotX")
		elemry = getElementData(taxicar, "rotY")
		elemrz = getElementData(taxicar, "rotZ")
		local mdl = tonumber(getElementData(taxicar, "model"))
		table.insert(jobTaxiCars, { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(taxicar)
	end
	
	elements = getElementsByType("taxifinish")
	
	for i,taxifinish in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(taxifinish)
		table.insert(jobTaxiCpsFinish, { elemx, elemy, elemz, nil })
		destroyElement(taxifinish)
	end
	
	elements = getElementsByType("heavertakecp")
	
	for i,heavertakecp in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(heavertakecp)
		table.insert(heaverTakeMarkers, { elemx, elemy, elemz, nil })
		destroyElement(heavertakecp)
	end
	
	elements = getElementsByType("heaverdelivercp")
	
	for i,heaverdelivercp in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(heaverdelivercp)
		table.insert(heaverDeliverMarkers, { elemx, elemy, elemz, nil, nil })
		destroyElement(heaverdelivercp)
	end
	
	elements = getElementsByType("carsellblip")
	
	for i,carsellblip in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(carsellblip)
		local icon = tonumber(getElementData(carsellblip, "icon"))
		table.insert(carSellShops, { elemx, elemy, elemz, icon })
		destroyElement(carsellblip)
	end
	
	elements = getElementsByType("carsellsell")
	
	for i,carsellsell in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(carsellsell)
		table.insert(carSellSellCps, { elemx, elemy, elemz, nil })
		destroyElement(carsellsell)
	end
	
	elements = getElementsByType("carsellshop")
	
	for i,carsellshop in ipairs(elements) do
		children = getElementChildren(carsellshop, "carsellbuy")
		
		if(table.getn(children) > 0) then
			local carsellbuy = children[1]
			elemx, elemy, elemz = getElementPosition(carsellbuy)
			elemrz = getElementData(carsellbuy, "rotZ")
			local vehtype = getElementData(carsellshop, "type")
			table.insert(carSellBuySpawns, { elemx, elemy, elemz, elemrz, vehtype })
			children = getElementChildren(carsellshop, "carsellpos")
			
			for j,carsellpos in ipairs(children) do
				elemx, elemy, elemz = getElementPosition(carsellpos)
				elemrz = getElementData(carsellpos, "rotZ")
				table.insert(carSellCarSpawnPoints, { elemx, elemy, elemz, elemrz, i })
				destroyElement(carsellpos)
			end
			
			destroyElement(carsellbuy)
		end
		
		destroyElement(carsellshop)
	end
	
	elements = getElementsByType("cartune")
	
	for i,cartune in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(cartune)
		elemrz = getElementData(cartune, "rotZ")
		table.insert(carTuneCps, { elemx, elemy, elemz, elemrz, nil })
		destroyElement(cartune)
	end
	
	repeat
		dbq = dbQuery(db, "SELECT id,money,owner FROM businesses")
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	local hashList = {}
	
	local adminList = getAdministrationList()
	
	for _,adminName in ipairs(adminList) do
		table.insert(hashList, getHash(adminName))
	end
	
	adminList = "("..table.concat(hashList, ",")..")"
	dbExec(db, "UPDATE businesses SET owner=0,money=0 WHERE owner IN "..adminList, fHash, sourceName)
	elements = getElementsByType("ammushop")
	dbStr = "INSERT IGNORE INTO businesses(id) VALUES "
	local newBusinesses = 0
	
	for i,ammushop in ipairs(elements) do
		local dbid = getHash(getElementData(ammushop, "id"))
		local money = 0
		local owner = 0
		
		repeat
			dbq = dbQuery(db, "SELECT money,owner FROM businesses WHERE id=?", dbid)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		if(table.getn(dbqueryresult) > 0) then
			money = dbqueryresult[1]["money"]
			owner = dbqueryresult[1]["owner"]
		else
			if(newBusinesses > 0) then
				dbStr = dbStr..","
			end
			
			newBusinesses = newBusinesses + 1
			dbStr = dbStr..dbPrepareString(db, "(?)", dbid)
		end
		
		elemx, elemy, elemz = getElementPosition(ammushop)
		elemrz = getElementData(ammushop, "rotZ")
		local ammuint = tonumber(getElementData(ammushop, "ammuinterior"))
		table.insert(ammuShops, { ammuint, elemx, elemy, elemz, elemrz, nil, dbid, money, owner })
		destroyElement(ammushop)
	end
	
	elements = getElementsByType("eatlocation")
	
	for i,eatlocation in ipairs(elements) do
		local dbid = getHash(getElementData(eatlocation, "id"))
		local money = 0
		local owner = 0
		
		repeat
			dbq = dbQuery(db, "SELECT money,owner FROM businesses WHERE id=?", dbid)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		if(table.getn(dbqueryresult) > 0) then
			money = dbqueryresult[1]["money"]
			owner = dbqueryresult[1]["owner"]
		else
			if(newBusinesses > 0) then
				dbStr = dbStr..","
			end
			
			newBusinesses = newBusinesses + 1
			dbStr = dbStr..dbPrepareString(db, "(?)", dbid)
		end
		
		elemx, elemy, elemz = getElementPosition(eatlocation)
		elemrz = getElementData(eatlocation, "rotZ")
		local shopint = tonumber(getElementData(eatlocation, "type"))
		table.insert(eatLocations, { shopint, elemx, elemy, elemz, elemrz, nil, dbid, money, owner })
		destroyElement(eatlocation)
	end
	
	if(newBusinesses > 0) then
		dbExec(db, dbStr)
	end
	
	elements = getElementsByType("otblocation")
	
	for i,otblocation in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(otblocation)
		elemrz = getElementData(otblocation, "rotZ")
		local otbint = tonumber(getElementData(otblocation, "type"))
		table.insert(otbLocations, { otbint, elemx, elemy, elemz, elemrz, nil, {}, nil })
		destroyElement(otblocation)
	end
	
	elements = getElementsByType("seller")
	
	for i,seller in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(seller)
		elemrz = getElementData(seller, "rotZ")
		children = getElementChildren(seller, "sellitem")
		local itemArray = {}
		for j,sellitem in ipairs(children) do
			table.insert(itemArray, tonumber(getElementData(sellitem, "goodid")))
			destroyElement(sellitem)
		end
		table.insert(outsideFoodSellers, { elemx, elemy, elemz, elemrz, itemArray, nil })
		destroyElement(seller)
	end
	
	elements = getElementsByType("fuelstation")
	
	for i,fuelstation in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(fuelstation)
		table.insert(fuelStations, { elemx, elemy, elemz, nil })
		destroyElement(fuelstation)
	end
	
	elements = getElementsByType("race")
	
	for i,race in ipairs(elements) do
		children = getElementChildren(race, "racecamerapos")
		
		if(table.getn(children) > 0) then
			local racecamerapos = children[1]
			children = getElementChildren(race, "racecameralook")
			
			if(table.getn(children) > 0) then
				local racecameralook = children[1]
				children = getElementChildren(race, "racestartmarker")
				
				if(table.getn(children) > 0) then
					local racestartmarker = children[1]
					local camx, camy, camz = getElementPosition(racecamerapos)
					local lookx, looky, lookz = getElementPosition(racecameralook)
					local raceint = tonumber(getElementData(race, "interior"))
					local laps = tonumber(getElementData(race, "laps"))
					local preparetime = tonumber(getElementData(race, "preparetimems"))
					local racetime = tonumber(getElementData(race, "racetimems"))
					local vehtype = getElementData(race, "vehtype")
					
					if(vehtype == "car") then
						vehtype = 0
					
					elseif(vehtype == "motorcycle") then
						vehtype = 1
					
					elseif(vehtype == "bicycle") then
						vehtype = 2
					
					elseif(vehtype == "heli") then
						vehtype = 3
					
					elseif(vehtype == "boat") then
						vehtype = 4
					
					else
						vehtype = 5
					end
					
					local prize1st = tonumber(getElementData(race, "prize1st"))
					local prize2nd = tonumber(getElementData(race, "prize2nd"))
					local prize3rd = tonumber(getElementData(race, "prize3rd"))
					local startArray = {}
					local cpArray = {}
					children = getElementChildren(race, "racestartpos")
					
					for j,racestartpos in ipairs(children) do
						elemx, elemy, elemz = getElementPosition(racestartpos)
						elemrx = getElementData(racestartpos, "rotX")
						elemry = getElementData(racestartpos, "rotY")
						elemrz = getElementData(racestartpos, "rotZ")
						table.insert(startArray, { elemx, elemy, elemz, elemrx, elemry, elemrz })
						destroyElement(racestartpos)
					end
					
					children = getElementChildren(race, "racecp")
					
					for j,racecp in ipairs(children) do
						elemx, elemy, elemz = getElementPosition(racecp)
						elemrz = getElementData(racecp, "radius")
						table.insert(cpArray, { elemx, elemy, elemz, elemrz })
						destroyElement(racecp)
					end
					
					elemx, elemy, elemz = getElementPosition(racestartmarker)
					elemrz = getElementData(racestartmarker, "radius")
					table.insert(raceInfo, { camx, camy, camz, lookx, looky, lookz, raceint, laps, preparetime, racetime, vehtype, prize1st, prize2nd, prize3rd, elemx, elemy, elemz, elemrz, startArray, cpArray })
					destroyElement(racestartmarker)
				end
				
				destroyElement(racecameralook)
			end
			
			destroyElement(racecamerapos)
		end
		
		destroyElement(race)
	end
	
	elements = getElementsByType("repairgarage")
	
	for i,repairgarage in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(repairgarage)
		local grgid = tonumber(getElementData(repairgarage, "garageid"))
		table.insert(repairGarages, { grgid, elemx, elemy, elemz, nil })
		destroyElement(repairgarage)
	end
	
	elements = getElementsByType("foodcar")
	
	for i,foodcar in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(foodcar)
		elemrx = getElementData(foodcar, "rotX")
		elemry = getElementData(foodcar, "rotY")
		elemrz = getElementData(foodcar, "rotZ")
		local mdl = tonumber(getElementData(foodcar, "model"))
		table.insert(jobFoodAvailableCars, { mdl, elemx, elemy, elemz, elemrx, elemry, elemrz })
		destroyElement(foodcar)
	end
	
	elements = getElementsByType("foodfinish")
	
	for i,foodfinish in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(foodfinish)
		table.insert(jobFoodFinishMarkers, { elemx, elemy, elemz, nil })
		destroyElement(foodfinish)
	end
	
	elements = getElementsByType("derby")
	
	for i,derby in ipairs(elements) do
		elemx, elemy, elemz = getElementPosition(derby)
		local arenaid = tonumber(getElementData(derby, "arenaid"))
		table.insert(derbyStartMarkers, { elemx, elemy, elemz, nil, arenaid })
		destroyElement(derby)
	end
	
	elements = getElementsByType("groupgate")
	
	for _,groupgate in ipairs(elements) do
		local groupgateobjs = getElementChildren(groupgate, "groupgateobj")
		local groupgatecntls = getElementChildren(groupgate, "groupgatecontrol")
		local objIdxs = {}
		
		for _,obj in ipairs(groupgateobjs) do
			elemx, elemy, elemz = getElementPosition(obj)
			elemrx = tonumber(getElementData(obj, "rotX"))
			elemry = tonumber(getElementData(obj, "rotY"))
			elemrz = tonumber(getElementData(obj, "rotZ"))
			local openx = tonumber(getElementData(obj, "openX"))
			local openy = tonumber(getElementData(obj, "openY"))
			local openz = tonumber(getElementData(obj, "openZ"))
			local mdl = tonumber(getElementData(obj, "model"))
			table.insert(groupGateObjs, { createObject(mdl, elemx, elemy, elemz, elemrx, elemry, elemrz), openx, openy, openz, elemx, elemy, elemz, "closed" })
			table.insert(objIdxs, table.getn(groupGateObjs))
			destroyElement(obj)
		end
		
		local grpid = tonumber(getElementData(groupgate, "groupid"))
		local opentime = tonumber(getElementData(groupgate, "timeopenmsec"))
		local cntl
		
		for _,obj in ipairs(groupgatecntls) do
			elemx, elemy, elemz = getElementPosition(obj)
			cntl = createMarker(elemx, elemy, elemz, "cylinder", 2.0, 255, 0, 0, 128)
			attachActionToElement(defaultActions[113], cntl)
			setPickupText(cntl, "Тригер", 255, 0, 0)
			groupGateControls[cntl] = { grpid, opentime, objIdxs }
			destroyElement(obj)
		end
		
		destroyElement(groupgate)
	end
end

function resourceStart(startedResource)
	local h1, h2, h3 = debug.gethook() 
	debug.sethook(nil)
	call(getResourceFromName("scoreboard"), "addScoreboardColumn", "Respect")
	call(getResourceFromName("scoreboard"), "scoreboardForceTeamsHidden", true)
	setTimer(cmdSpamProc, 1000, 0)
	loadAdminCmds()
	
	for i=1,table.getn(availableJobs) do
		jobWorkers[i] = {}
	end
	
	repeat
		--3LcJm524jr
		db = dbConnect("mysql", "dbname=rsplsrv;host=127.0.0.1;port=3306", "kartos", "Vecmrf12374")
		--db = dbConnect("mysql", "dbname=server657169;host=n150.serva4ok.ru;port=3306", "server657169", "gdK9HIuQDE")
		--db = dbConnect("mysql", "dbname=resplaychik;host=game334530.ourserver.ru;port=3306", "resplaysis", "ebanutogoeliseeva")
	until db
	
	loadMapFile()
	clanInit()
	--generateMapFile()
	fractionInit()
	criminalActivityInit()
	--missionsInit()
	colorNames = fromJSON(colorNamesJSON)
	--outputServerLog(string.format("RESPLAY: %d colors found", table.getn(colorNames)))
	
	for i=1,table.getn(jobTruckerCarSpawnPoints) do
		jobTruckerAvailableTrucks[i] = nil
	end
	
	addEventHandler("onVehicleStartEnter", root, groupVehicleEnter)
	
	local curVehicle
	local curTaxiLocations = {}
	
	for _,carCoords in ipairs(jobTrashmasterCarCoords) do
		curVehicle = createVehicle(408, carCoords[1], carCoords[2], carCoords[3], carCoords[4], carCoords[5], carCoords[6])
		attachActionToElement(defaultActions[7], curVehicle)
		--setVehicleRespawnPosition(curVehicle, carCoords[1], carCoords[2], carCoords[3], carCoords[4], carCoords[5], carCoords[6])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)
	end
	
	for i,cpcoords in ipairs(jobCpFinishCoords) do
		jobCpFinish[i] = { createMarker(cpcoords[1], cpcoords[2], cpcoords[3], "checkpoint", 5.0, 255, 0, 0, 255), createBlip(0, 0, 0, 53, 2, 255, 255, 255, 255, 32766) }
		attachElements(jobCpFinish[i][2], jobCpFinish[i][1])
		setMarkerIcon(jobCpFinish[i][1], "finish")
		setElementVisibleTo(jobCpFinish[i][1], root, false)
		setElementVisibleTo(jobCpFinish[i][2], root, false)
		setPickupText(jobCpFinish[i][1], "Закончить работу", 255, 0, 0)
	end
	
	for i,cpcoords in ipairs(jobCpFixCoords) do
		jobCpFix[i] = { createMarker(cpcoords[1], cpcoords[2], cpcoords[3], "checkpoint", 5.0, 255, 255, 0, 255), createBlip(0, 0, 0, 63, 2, 255, 255, 255, 255, 32766) }
		attachElements(jobCpFix[i][2], jobCpFix[i][1])
		setElementVisibleTo(jobCpFix[i][1], root, false)
		setElementVisibleTo(jobCpFix[i][2], root, false)
		setPickupText(jobCpFix[i][1], "Ремонт и заправка", 255, 255, 0)
	end
	
	jobTrashmasterInit()
	
	for _,carCoords in ipairs(jobWashroadsCarCoords) do
		curVehicle = createVehicle(574, carCoords[1], carCoords[2], carCoords[3], carCoords[4], carCoords[5], carCoords[6])
		attachActionToElement(defaultActions[7], curVehicle)
		--setVehicleRespawnPosition(curVehicle, carCoords[1], carCoords[2], carCoords[3], carCoords[4], carCoords[5], carCoords[6])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)
	end
	
	jobWashroadsInit()
	
	for _,evac in ipairs(jobEvacuatorCars) do
		curVehicle = createVehicle(525, evac[1], evac[2], evac[3], evac[4], evac[5], evac[6])
		attachActionToElement(defaultActions[7], curVehicle)
		--setVehicleRespawnPosition(curVehicle, evac[1], evac[2], evac[3], evac[4], evac[5], evac[6])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)
	end
	
	for _,mower in ipairs(jobLawnmowCars) do
		curVehicle = createVehicle(572, mower[1], mower[2], mower[3], mower[4], mower[5], mower[6])
		attachActionToElement(defaultActions[7], curVehicle)
		--setVehicleRespawnPosition(curVehicle, mower[1], mower[2], mower[3], mower[4], mower[5], mower[6])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)		
	end
	
	for i,obj in ipairs(extraObjs) do
		if obj[8] and(obj[8] > 0) then
			for key,eatLocation in ipairs(eatLocations) do
				if(eatLocation[1] == obj[8]) then
					local eatType = eatTypes[eatLocation[1]]
					extraObjs[i] = createObject(obj[1], obj[2], obj[3], obj[4], obj[5], obj[6], obj[7])
					setElementInterior(extraObjs[i], eatType[3])
					setElementDimension(extraObjs[i], key)
					
					for itemId,itemInfo in ipairs(inventoryItemNames) do
						if(itemInfo[3] == obj[1]) and(not inventoryIllegalItems[itemId]) then
							if eatTypes[eatLocation[1]][14] > 0 then
								setPickupText(extraObjs[i], "$"..tostring(itemInfo[2]), 0, 160, 0)
								objsForSale[extraObjs[i]] = { itemId, itemInfo[2] }
							
							elseif not inventoryFurnitureItems[itemId] then
								setPickupText(extraObjs[i], itemInfo[1], 0, 160, 0)
								objsForSale[extraObjs[i]] = { itemId, 0 }
							end
							
						end
					end
					
				end
			end
		
		else
    		-- FIXME: RUNTIME ERROR #93 createObject
			-- https://wiki.multitheftauto.com/wiki/CreateObject
			-- WARNING: Bad argument @ 'createObject' [Expected vector3 at argument 5, got boolean]
			-- WARNING: Bad argument @ 'createObject' [Expected vector3 at argument 5, got boolean] [DUP x4]
			extraObjs[i] = createObject(obj[1], obj[2], obj[3], obj[4], obj[5], obj[6], obj[7])
		end
		
		if housesFrozenObjs[obj[1]] then
			repeat
				setElementFrozen(extraObjs[i], true)
			until isElementFrozen(extraObjs[i])
		end
		
	end
	
	for _,obj in ipairs(removeObjs) do
		--if(obj[6] == 0) then
			removeWorldModel(obj[1], obj[5], obj[2], obj[3], obj[4], obj[6])
		--end
	end
	
	for i=1,table.getn(carSellCarSpawnPoints) do
		table.insert(carSellAvailableCars, nil)
	end
	
	for _,shop in ipairs(carSellShops) do
		createBlip(shop[1], shop[2], shop[3], shop[4], 2, 255, 255, 255, 255, 0, 300)
	end
	
	for i,cp in ipairs(carSellSellCps) do
		carSellSellCps[i][4] = createMarker(cp[1], cp[2], cp[3]-1.1, "cylinder", 4.0, 255, 0, 0, 128)
		attachActionToElement(defaultActions[13], carSellSellCps[i][4])
		setPickupText(carSellSellCps[i][4], "Продажа личного транспорта", 255, 0, 0)
		table.insert(curTaxiLocations, { cp[1], cp[2], cp[3] })
	end
	
	table.insert(jobTaxiLocations, { "Автосалон", curTaxiLocations })
	curTaxiLocations = {}
	setTimer(carSellProcess, 1000, 0)
	setTime(6, 0)
	setTimer(jobProcess, 500, 0)
	--setTimer(function()
	--			triggerClientEvent(getElementsByType("player"), "onBusesUpdate", resourceRoot, busesCars)
	--		 end, 1000, 0)
	
	for i,station in ipairs(fuelStations) do
		fuelStations[i][4] = createMarker(station[1], station[2], station[3], "cylinder", 4, 0, 0, 255, 128)
		attachActionToElement(defaultActions[16], fuelStations[i][4])
		attachActionToElement(defaultActions[5], fuelStations[i][4])
		setPickupText(fuelStations[i][4], "Заправка", 0, 0, 255)
		createBlip(station[1], station[2], station[3], 56, 2, 255, 255, 255, 255, 0, 300)
		table.insert(curTaxiLocations, { station[1], station[2], station[3] })
	end
	
	table.insert(jobTaxiLocations, { "Заправка", curTaxiLocations })
	curTaxiLocations = {}
	setTimer(fuelProcess, 1000, 0)
	
	for i,phone in ipairs(luckyPhoneCoords) do
		luckyPhoneCoords[i][7] = createObject(luckyPhoneModel, phone[1], phone[2], phone[3], phone[4], phone[5], phone[6])
	end
	
	setTimer(luckyPhoneProcess, 500, 0)
	--setTimer(housesProcess, 750, 0)
	
	for i,cp in ipairs(carTuneCps) do
		carTuneCps[i][5] = createMarker(cp[1], cp[2], cp[3], "cylinder", 4.0, 255, 0, 0, 128)
		attachActionToElement(defaultActions[108], carTuneCps[i][5])
		setPickupText(carTuneCps[i][5], "Тюнинг", 255, 0, 0)
		createBlip(cp[1], cp[2], cp[3], 27, 2, 255, 255, 255, 255, 0, 300)
		--addEventHandler("onMarkerHit", carTuneCps[i][5], carTuneMarkerHit)
	end
	
	for i,shop in ipairs(ammuShops) do
		createBlip(shop[2], shop[3], shop[4], 6, 2, 255, 255, 255, 255, 0, 300)
		ammuShops[i][6] = createPickup(shop[2], shop[3], shop[4], 3, 1318, 0, 1)
		attachActionToElement(defaultActions[17], ammuShops[i][6])
		
		if(ammuBusinessPrice > 0) then
			attachActionToElement(defaultActions[3], ammuShops[i][6])
			attachActionToElement(defaultActions[4], ammuShops[i][6])
			attachActionToElement(defaultActions[41], ammuShops[i][6])
		end

		table.insert(curTaxiLocations, { shop[2], shop[3], shop[4] })

	end
	
	table.insert(jobTaxiLocations, { "Аммуниция", curTaxiLocations })
	curTaxiLocations = { {}, {}, {}, {}, {} }
	local locIndex
	
	for i,eatLoc in ipairs(eatLocations) do
		-- FIXME: RUNTIME ERROR #93 Bad usage @ 'createBlip' [Invalid icon]
		-- https://wiki.multitheftauto.com/wiki/CreateBlip
		createBlip(eatLoc[2], eatLoc[3], eatLoc[4], eatTypes[eatLoc[1]][1], 2, 255, 255, 255, 255, 0, 300)
		eatLocations[i][6] = createPickup(eatLoc[2], eatLoc[3], eatLoc[4], 3, 1318, 0, 1)
		attachActionToElement(defaultActions[18], eatLocations[i][6])
		
		if((eatLoc[1] == 7) or (eatLoc[1] == 8) or (eatLoc[1] == 9)) then
			locIndex = 1
		
		elseif(eatLoc[1] == 11) then
			locIndex = 2
		
		elseif(eatLoc[1] == 5) then
			locIndex = 3
		
		elseif((eatLoc[1] == 6) or (eatLoc[1] == 12)) then
			locIndex = 4
		
		else
			locIndex = 5
		end
		
		if(eatTypes[eatLoc[1]][14] > 0) then
			attachActionToElement(defaultActions[3], eatLocations[i][6])
			attachActionToElement(defaultActions[4], eatLocations[i][6])
			attachActionToElement(defaultActions[41], eatLocations[i][6])
		end
		
		table.insert(curTaxiLocations[locIndex], { eatLoc[2], eatLoc[3], eatLoc[4] })
	end
	
	table.insert(jobTaxiLocations, { "Магазин 24/7", curTaxiLocations[1] })
	table.insert(jobTaxiLocations, { "Магазин RC Zero", curTaxiLocations[2] })
	table.insert(jobTaxiLocations, { "Бар", curTaxiLocations[3] })
	table.insert(jobTaxiLocations, { "Клуб", curTaxiLocations[4] })
	table.insert(jobTaxiLocations, { "Кафе или столовая", curTaxiLocations[5] })
	
	if(get("raceAutoLaunch") == "Yes") then
		setTimer(raceCreate, timeBetweenRaces, 1, math.random(table.getn(raceInfo)))
	end
	
	for i,garage in ipairs(repairGarages) do
		repairGarages[i][5] = createMarker(garage[2], garage[3], garage[4], "cylinder", 5, 255, 0, 0, 128)
		setPickupText(repairGarages[i][5], "Ремонт", 255, 0, 0)
		createBlip(garage[2], garage[3], garage[4], 63, 2, 255, 255, 255, 255, 0, 300)
		addEventHandler("onMarkerHit", repairGarages[i][5], repairMarkerHit)
		setGarageOpen(garage[1], true)
	end
	
	--setTimer(boomboxUpdate, 1000, 0)
	weatherUpdate()
	curTaxiLocations = {}
	
	for wg=1,table.getn(playerGroups) do
		curTaxiLocations[wg] = {}
	end
	
	for i,cp in ipairs(HealthMarkers) do -- функции для маркера лечения в больнице
		HealthMarkers[i][5] = createMarker(cp[2], cp[3], cp[4], "cylinder", 1.2, 255, 254, 0, 128)
		attachActionToElement( defaultActions[22], HealthMarkers[i][5] )
		attachActionToElement( defaultActions[23], HealthMarkers[i][5] )
		setPickupText(HealthMarkers[i][5], "Лечение", 255, 255, 0)
	end
	
	for i,cp in ipairs(workStartMarkers) do
		workStartMarkers[i][5] = createMarker(cp[2], cp[3], cp[4], "cylinder", 1.2, 255, 0, 0, 128)
		attachActionToElement(defaultActions[22], workStartMarkers[i][5])
		attachActionToElement(defaultActions[23], workStartMarkers[i][5])
		setPickupText(workStartMarkers[i][5], "Работа", 255, 0, 0)
		createBlip(cp[2], cp[3], cp[4], cp[6], 2, 255, 255, 255, 255, 0, 300)
		table.insert(curTaxiLocations[cp[1]], { cp[2], cp[3], cp[4] })
	end
	
	for wg=1,table.getn(playerGroups) do
		if(table.getn(curTaxiLocations[wg]) > 0) then
			table.insert(jobTaxiLocations, { "Работа - "..playerGroups[wg][1], curTaxiLocations[wg] })
		end
	end
	
	setTimer(updateWantedLevel, 1000, 0)
	
	for _,car in ipairs(jobAmbulanceCars) do
		--[[
		curVehicle = createVehicle(416, 0, 0, 0)
		spawnVehicle(curVehicle, car[1], car[2], car[3], car[4], car[5], car[6])
		setVehicleRespawnPosition(curVehicle, car[1], car[2], car[3], car[4], car[5], car[6])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)
		]]
		curVehicle = createVehicle(416, car[1], car[2], car[3], car[4], car[5], car[6])
		toggleVehicleRespawn(curVehicle, true)
		setVehicleIdleRespawnDelay(curVehicle, 600000)	
	end
	
	for i,cp in ipairs(jobAmbulanceFinish) do
		jobAmbulanceFinish[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 6, 255, 0, 0, 128)
		setPickupText(jobAmbulanceFinish[i][4], "Закончить работу", 255, 0, 0)
		jobAmbulanceFinish[i][5] = createBlip(cp[1], cp[2], cp[3])
		setElementVisibleTo(jobAmbulanceFinish[i][4], root, false)
		setElementVisibleTo(jobAmbulanceFinish[i][5], root, false)
	end
	
	--setTimer(taxesProcess, 86400000, 0)
	local numFieldCp
	
	for i,field in ipairs(jobFarmFields) do
		jobFarmFields[i][7] = createVehicle(532, field[1], field[2], field[3], field[4], field[5], field[6])
		attachActionToElement(defaultActions[7], jobFarmFields[i][7])
		setVehicleDamageProof(field[7], true)
		setElementFrozen(field[7], true)
		numFieldCp = table.getn(field[8])
		
		for i2=1,numFieldCp do
			jobFarmFields[i][8][i2][4] = createMarker(field[8][i2][1], field[8][i2][2], field[8][i2][3], "checkpoint", 6, 255, 0, 0, 128)
			field[8][i2][4] = jobFarmFields[i][8][i2][4]
			if(i2 < numFieldCp) then
				setMarkerIcon(field[8][i2][4], "arrow")
				setMarkerTarget(field[8][i2][4], field[8][i2+1][1], field[8][i2+1][2], field[8][i2+1][3])
			else
				setMarkerColor(field[8][i2][4], 255, 255, 255, 128)
				setMarkerIcon(field[8][i2][4], "finish")
			end
			setElementVisibleTo(field[8][i2][4], root, false)
			addEventHandler("onMarkerHit", field[8][i2][4], jobFarmEnterCp)
		end
		
	end
	
	local start
	
	for i,cabin in ipairs(ferrisWheelCabins) do
		start = ferrisWheelPath[cabin[2]]
		ferrisWheelCabins[i][1] = createObject(3752, start[1], start[2], start[3])
	end
	
	ferrisWheelMove()
	
	for i,seller in ipairs(outsideFoodSellers) do
		outsideFoodSellers[i][6] = createPed(168, seller[1], seller[2], seller[3], seller[4], false)
		attachActionToElement(defaultActions[136], outsideFoodSellers[i][6])
		setElementData(outsideFoodSellers[i][6], "godmode", true)
		setElementData(outsideFoodSellers[i][6], "foodseller", i, false)
		setElementFrozen(outsideFoodSellers[i][6], true)
	end
	
	local otbId
	curTaxiLocations = {}
	
	for i,otbLoc in ipairs(otbLocations) do
		createBlip(otbLoc[2], otbLoc[3], otbLoc[4], 48, 2, 255, 255, 255, 255, 0, 300)
		otbLocations[i][6] = createPickup(otbLoc[2], otbLoc[3], otbLoc[4], 3, 1318, 0, 1)
		attachActionToElement(defaultActions[42], otbLocations[i][6])
		otbId = otbLoc[1]
		
		for i2,otb in ipairs(otbInts[otbId][6]) do
			table.insert(otbLoc[7], createObject(2754, otb[1], otb[2], otb[3], otb[4], otb[5], otb[6]))
			setElementInterior(otbLoc[7][i2], otbInts[otbId][5])
			setElementDimension(otbLoc[7][i2], i)
		end
		
		otbLocations[i][8] = createMarker(otbInts[otbId][7], otbInts[otbId][8], otbInts[otbId][9], "cylinder", 1.5, 255, 0, 0, 128)
		attachActionToElement(defaultActions[48], otbLocations[i][8])
		setElementInterior(otbLocations[i][8], otbInts[otbId][5])
		setElementDimension(otbLocations[i][8], i)
		table.insert(curTaxiLocations, { otbLoc[2], otbLoc[3], otbLoc[4] })
	end
	
	table.insert(jobTaxiLocations, { "Букмекерская контора", curTaxiLocations })
	setTimer(otbRespawnMachines, 10080*getMinuteDuration(), 0)
	
	for _,veh in ipairs(extraVehCoords) do
		curVehicle = createVehicle(veh[1], veh[2], veh[3], veh[4], veh[5], veh[6], veh[7])
		
		if(veh[1] >= 596) and(veh[1] <= 599) then
			attachActionToElement(defaultActions[60], curVehicle)
			attachActionToElement(defaultActions[62], curVehicle)
		end
		
		toggleVehicleRespawn(curVehicle, true)
		setVehicleIdleRespawnDelay(curVehicle, 600000)		
	end
	
	curTaxiLocations = {}
	for i,spawnPos in ipairs(vehCommonSpawnPos) do
		vehCommonSpawnPos[i][6] = createMarker(spawnPos[1], spawnPos[2], spawnPos[3], "cylinder", spawnPos[4], 255, 0, 0, 128)
		attachActionToElement(defaultActions[12], vehCommonSpawnPos[i][6])
		setPickupText(vehCommonSpawnPos[i][6], "Спаун личного транспорта", 255, 0, 0)
		table.insert(curTaxiLocations, { spawnPos[1], spawnPos[2], spawnPos[3] })
	end
	
	table.insert(jobTaxiLocations, { "Место восстановления личного транспорта", curTaxiLocations })
	curTaxiLocations = {}
	
	for i,base in ipairs(militaryBases) do
		militaryBases[i][11] = createColPolygon(base[1], base[2], base[1], base[2], base[3], base[4], base[5], base[6], base[7], base[8], base[3], base[4], base[5], base[6])
		militaryBases[i][16] = createMarker(base[13], base[14], base[15], "cylinder", 5.0, 255, 0, 0, 128)
		local xmin = math.min(math.min(math.min(base[1], base[3]), base[5]), base[7])
		local ymin = math.min(math.min(math.min(base[2], base[4]), base[6]), base[8])
		local xmax = math.max(math.max(math.max(base[1], base[3]), base[5]), base[7])
		local ymax = math.max(math.max(math.max(base[2], base[4]), base[6]), base[8])
		setRadarAreaFlashing(createRadarArea(xmin, ymin, xmax-xmin, ymax-ymin, 255, 0, 0, 160), true)
		setPickupText(militaryBases[i][16], "Ремонт для военных", 255, 0, 0)
		addEventHandler("onMarkerHit", militaryBases[i][16], militaryBasesFixVeh)
		table.insert(curTaxiLocations, { base[13], base[14], base[15] })
	end
	
	table.insert(jobTaxiLocations, { "Военная база", curTaxiLocations })
	
	for i,cargo in ipairs(militaryCargoInfo) do
		militaryCargoInfo[i][17] = createMarker(cargo[1], cargo[2], cargo[3], "cylinder", 3.0, 0, 255, 0, 128)
		setPickupText(militaryCargoInfo[i][17], "Груз с оружием", 0, 255, 0)
		militaryCargoInfo[i][18] = createMarker(cargo[14], cargo[15], cargo[16], "cylinder", 3.0, 0, 255, 0, 128)
		setPickupText(militaryCargoInfo[i][18], "Разгрузка", 0, 255, 0)
		militaryCargoInfo[i][19] = createBlip(cargo[14], cargo[15], cargo[16], 0, 2, 0, 255, 0, 255, 32766)
		addEventHandler("onMarkerHit", militaryCargoInfo[i][17], militaryCargoTake)
		addEventHandler("onMarkerHit", militaryCargoInfo[i][18], militaryCargoDeliver)
		setElementVisibleTo(militaryCargoInfo[i][18], root, false)
		setElementVisibleTo(militaryCargoInfo[i][19], root, false)
		militaryCargoInfo[i][20] = createObject(cargo[4], cargo[5], cargo[6], cargo[7], cargo[11], cargo[12], cargo[13])
		attachActionToElement(defaultActions[44], militaryCargoInfo[i][20])
		attachActionToElement(defaultActions[45], militaryCargoInfo[i][20])
	end
	
	setTimer(militaryBasesProcess, 1500, 0)
	militaryGeneralNew()
	
	for i,issuance in ipairs(weaponIssuances) do
		local curMarker 
		
		if issuance[8] then
			weaponIssuances[i][6] = {}
			local eatType = issuance[8]
			local wint = eatTypes[eatType][3]
			
			for wdim,locInfo in ipairs(eatLocations) do
				if(locInfo[1] == eatType) then
					curMarker = createMarker(issuance[1], issuance[2], issuance[3], "cylinder", 1.5, 255, 255, 0, 128)
					attachActionToElement(defaultActions[46], curMarker)
					setElementInterior(curMarker, wint)
					setElementDimension(curMarker, wdim)
					table.insert(weaponIssuances[i][6], curMarker)
					setPickupText(curMarker, "Выдача снаряжения("..playerGroups[weaponIssuances[i][4]][1]..")", 255, 255, 0)
				end
			end
			
		else
			curMarker = createMarker(issuance[1], issuance[2], issuance[3], "cylinder", 1.5, 255, 255, 0, 128)
			weaponIssuances[i][6] = { curMarker }
			setPickupText(curMarker, "Выдача снаряжения("..playerGroups[weaponIssuances[i][4]][1]..")", 255, 255, 0)
		end
	end
	
	setTimer(otbPreStart, 60000, 1)
	setTimer(otbStart, 180000, 1)
	
	for _,taxi in ipairs(jobTaxiCars) do
		curVehicle = createVehicle(taxi[1], 0, 0, 0)
		attachActionToElement(defaultActions[7], curVehicle)
		spawnVehicle(curVehicle, taxi[2], taxi[3], taxi[4], taxi[5], taxi[6], taxi[7])
		--setVehicleRespawnPosition(curVehicle, taxi[2], taxi[3], taxi[4], taxi[5], taxi[6], taxi[7])
		setVehicleColor(curVehicle, 255, 128, 0, 0, 0, 0)
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)		
	end
	
	for i,cp in ipairs(jobTaxiCpsFinish) do
		jobTaxiCpsFinish[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 6.0, 255, 0, 0, 128)
		setPickupText(jobTaxiCpsFinish[i][4], "Закончить работу", 255, 0, 0)
		setElementVisibleTo(jobTaxiCpsFinish[i][4], root, false)
	end
	
	curTaxiLocations = {}
	
	for i,cp in ipairs(lowriderMarkers) do	
		lowriderMarkers[i][4] = createMarker(cp[1], cp[2], cp[3], "checkpoint", 7.0, 0, 0, 255, 128)
		attachActionToElement(defaultActions[58], lowriderMarkers[i][4])
		setPickupText(lowriderMarkers[i][4], "Бой лоурайдеров", 0, 0, 255)
		table.insert(curTaxiLocations, { cp[1], cp[2], cp[3] })
	end
	
	table.insert(jobTaxiLocations, { "Бой лоурайдеров", curTaxiLocations })
	local tutorPed, tutorIcon
	
	for i,tut in ipairs(tutorialPositions) do
		tutorPed = createPed(tutorialMdl, tut[2], tut[3], tut[4], tut[5], false)
		attachActionToElement(defaultActions[50], tutorPed)
		setElementData(tutorPed, "godmode", true)
		setElementFrozen(tutorPed, true)
		setElementRotation(tutorPed, 0, 0, tut[5], "default", true)
		tutorIcon = createPickup(0, 0, 0, 3, 1239, 0, 0)
		attachElements(tutorIcon, tutorPed, 0, 0, 1.4)
		setElementData(tutorPed, "tutorial", tut[1], false)
		setPedAnimation(tutorPed, "KISSING", "gfwave2", -1, true, false, false, false)
		tutorialPositions[i][6] = tutorPed
	end
	
	for i,que in ipairs(queryPeds) do
		tutorPed = createPed(70, que[1], que[2], que[3], que[4], false)
		attachActionToElement(defaultActions[104], tutorPed)
		setElementData(tutorPed, "godmode", true)
		setElementFrozen(tutorPed, true)
		setElementRotation(tutorPed, 0, 0, que[4], "default", true)
		setPedAnimation(tutorPed, "CASINO", "cards_loop", -1, true, false, false, false)
		setElementData(tutorPed, "query", true, false)
		tutorIcon = createPickup(0, 0, 0, 3, 1274, 0, 0)
		attachElements(tutorIcon, tutorPed, 0, 0, 1.4)
		queryPeds[i][5] = tutorPed
	end
	
	setTimer(botCorrectRotation, 5000, 0)
	curTaxiLocations = {}
	
	for i,cp in ipairs(heaverTakeMarkers) do
		heaverTakeMarkers[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 2.0, 0, 255, 0, 128)
		setPickupText(heaverTakeMarkers[i][4], "Взять груз", 0, 255, 0)
		--setElementVisibleTo(heaverTakeMarkers[i][4], root, false)
		addEventHandler("onMarkerHit", heaverTakeMarkers[i][4], heaverTakeCargo)
		table.insert(curTaxiLocations, { cp[1], cp[2], cp[3] })
	end
	
	--table.insert(jobTaxiLocations, { "Работа - Грузчик", curTaxiLocations })
	
	for i,cp in ipairs(heaverDeliverMarkers) do
		heaverDeliverMarkers[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 2.0, 0, 255, 0, 128)
		setPickupText(heaverDeliverMarkers[i][4], "Положить груз", 0, 255, 0)
		heaverDeliverMarkers[i][5] = createBlip(cp[1], cp[2], cp[3], 0, 1, 0, 255, 0, 255, 32767, 300.0)
		setElementVisibleTo(heaverDeliverMarkers[i][4], root, false)
		setElementVisibleTo(heaverDeliverMarkers[i][5], root, false)
		addEventHandler("onMarkerHit", heaverDeliverMarkers[i][4], heaverDeliverCargo)
	end
	
	setTimer(heaverProcess, 500, 0)
	
	for _,foodveh in ipairs(jobFoodAvailableCars) do
		curVehicle = createVehicle(foodveh[1], 0, 0, 0)
		attachActionToElement(defaultActions[7], curVehicle)
		spawnVehicle(curVehicle, foodveh[2], foodveh[3], foodveh[4], foodveh[5], foodveh[6], foodveh[7])
		--setVehicleRespawnPosition(curVehicle, foodveh[2], foodveh[3], foodveh[4], foodveh[5], foodveh[6], foodveh[7])
		setElementFrozen(curVehicle, true)
		setVehicleDamageProof(curVehicle, true)		
	end
	
	for i,cp in ipairs(jobFoodFinishMarkers) do
		jobFoodFinishMarkers[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 6.0, 255, 0, 0, 128)
		setPickupText(jobFoodFinishMarkers[i][4], "Закончить работу", 255, 0, 0)
		setElementVisibleTo(jobFoodFinishMarkers[i][4], root, false)
	end
	curTaxiLocations = {}
	
	for i,cp in ipairs(derbyStartMarkers) do
		derbyStartMarkers[i][4] = createMarker(cp[1], cp[2], cp[3], "cylinder", 2.0, 255, 0, 0, 128)
		attachActionToElement(defaultActions[70], derbyStartMarkers[i][4])
		setPickupText(derbyStartMarkers[i][4], "Дерби", 255, 0, 0)
		table.insert(curTaxiLocations, { cp[1], cp[2], cp[3] })
	end
	
	table.insert(jobTaxiLocations, { "Стадион", curTaxiLocations })
	
	repeat
		dbq = dbQuery(db, "SELECT * FROM furniture")
		dbqueryresult = dbPoll(dbq, 120000)
		dbFree(dbq)
	until dbqueryresult
	
	for _,furnLine in ipairs(dbqueryresult) do
		local obj = createObject(inventoryItemNames[furnLine["item"]][3], furnLine["x"], furnLine["y"], furnLine["z"], furnLine["rx"], furnLine["ry"], furnLine["rz"])
		setElementInterior(obj, furnLine["interior"])
		setElementDimension(obj, furnLine["dimension"])
		spawnedFurniture[obj] = { furnLine["id"], furnLine["item"], furnLine["hid"] }
	end
	
	table.sort(jobTaxiLocations, function(a,b)
      return string.lower(a[1]) < string.lower(b[1])
    end)
	
	derbyInit()
	--trainInit()
	checkOldAccounts()
	setTimer(jobTaxiSendClientInfo, 2500, 0)
	--setTimer(setRandomThinkBubble, 5000, 0)
	setTimer(savePlayerData, 10000, 0)
	setTimer(gangsterStealProc, gangsterStealProcTime, 0)
	setTimer(gangsterStealProcCar, gangsterStealProcTime, 0)
	setTimer(criminalActivityProc, criminalActivityProcTimeStep, 0)
	setTimer(payoutProcAdmin, 60000, 0)
	setTimer(checkTraffic, 60000, 0)
	setTimer(gangsterStealProcMarkers, 60000, 0)
	gangsterKillOrderRandomTimer = setTimer(gangsterKillOrderRandomProc, 720000, 0)
	setTimer(updateMute, 1000, 0)
	
	if isTestServer() then
		setTimer(function()
					triggerClientEvent(getElementsByType("player"), "onUpdateMemoryMonitor", resourceRoot, collectgarbage("count"))
		end, 1000, 0)
		setTimer(debugLawnmowsInit, 1000, 1)
	end
	
	triggerEvent("onWorkInit", resourceRoot)
	debug.sethook(_, h1, h2, h3)
end

function resourceStop(theResourceStopped)
	triggerEvent("onWorkDestroy", resourceRoot)
	if(db) then destroyElement(db) end
end

wantedLevelCoroutine = nil

function updateWantedLevel()
	
	if not wantedLevelCoroutine then
		wantedLevelCoroutine = coroutine.create(updateWantedLevelCoroutine)
	end
	
	coroutine.resume(wantedLevelCoroutine)
end

function updateWantedLevelCoroutine()
	local allPlayers
	local arrested
	
	while true do
		allPlayers = getElementsByType("player")
		
		for _,plr in ipairs(allPlayers) do
			arrested = getElementData(plr, "arrested")
			
			if arrested and(arrested > 0) then
				arrested = math.max(0, arrested-1)
				setElementData(plr, "arrested", arrested)
				dbExec(db, "UPDATE users SET arrested=? WHERE name=?", arrested, getHash(getPlayerName(plr)))
				
				if(arrested <= 0) then
					local locId = getClosestInteriorOfType(14, 0.0, 0.0, 0.0)
					local eatInfo = eatTypes[eatLocations[locId][1]]
					setElementPosition(plr, 267.6, 90.8, 1001.0)
					setElementRotation(plr, 0.0, 0.0, 90.0)
					setElementDimension(plr, locId)
					setElementInterior(plr, eatTypes[eatLocations[locId][1]][3])
					triggerClientEvent(plr, "onEatEnter", plr, eatInfo, true)
				end
				
			end
			
		end
		
		coroutine.yield()
	end
end

function playerCheckIfRegistered(plr)
	if(source == resourceRoot) and(plr == client) then
		dbQuery(playerCheckIfRegistered2, {plr}, db, "SELECT pass FROM users WHERE name = ?", getHash(getPlayerName(plr)))
	end
end

function playerCheckIfRegistered2(dbq, source)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	local playerPass = nil
	
	if(table.getn(dbqueryresult) > 0) then
		playerPass = dbqueryresult[1]["pass"]
	end
	
	triggerClientEvent(source, "onReceiveRegisterCheck", resourceRoot, playerPass)
	loginTimers[source] = setTimer(kickAFK, 80000, 1, source)
end

function setPlayerNewGroup(plr, grpid, skipFractionCheck)
	local wantedLevel = getPlayerWantedLevel(plr)
	local curGrp = getElementData(plr, "usergroup")
	local grpSkills = playerGroupSkills[grpid]
	--if(wantedLevel > 0) and((grpid == 2) or (grpid == 5) or (grpid == 14)) then
	
	if false then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Данная работа недоступна для игроков с уровнем розыска.")
		return "у игрока имеется уровень розыска"
	
	else
		if grpSkills then
			local curSkill
			
			for skillId,skillInfo in pairs(grpSkills) do
				curSkill = getPedStat(plr, skillId)
				if(curSkill < skillInfo[1]) then
					playerShowMessage(plr, string.format("Вам необходимо %s, чтобы начать карьеру '%s'", skillInfo[2], playerGroups[grpid][1]))
					return "игроку необходимо "..skillInfo[2]
				end
			end
			
		end
		
		if not skipFractionCheck then
			for _,fInfo in ipairs(fractions) do
				if(fInfo[2] == grpid) or (fInfo[2] == curGrp) then
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Рабочие процессы данной или текущей группы игроков управляются фракциями. Для приема на работу или увольнения необходимо обратиться к лидеру одной из фракции или её члену с необходимыми правами.")
					return "NIL"
				end
			end
		end
		
		fractionRemovePlayerFromFraction(plr)
		local moneyAmount = getMoney(plr)
		
		if(moneyAmount >= 0) or ((moneyAmount < 0) and((grpid == 8) or (grpid == 12))) then
			local sHash = getHash(getPlayerName(plr))
	
			if(dbExec(db, "UPDATE users SET usergroup=? WHERE name=?", grpid, sHash)) then
				--setElementModel(plr, sknid)
				setElementData(plr, "usergroup", grpid)
				refreshSkin(plr, grpid)
				
				if isPlayerGroupCommon(grpid) then
					for jobId=1,table.getn(jobWorkers) do
						for _,worker in ipairs(jobWorkers[jobId]) do
							if(worker[1] == plr) then
								removeWorker(jobId, plr, -1)
								break
							end
						end
					end
					--respectDrop(plr)
				end
				
				triggerClientEvent(plr, "onCrimeDestroyBlip", plr)
				addNewEventToLog(getPlayerName(plr), "Аккаунты - Новый статус - "..playerGroups[grpid][1], true)
				local payoutInfoStr = ""
				
				if payoutTimers[plr] then
					killTimer(payoutTimers[plr])
					payoutTimers[plr] = nil
				end
				
				if payoutGroups[grpid] then
					local payoutHours = math.max(1, math.floor(payoutGroups[grpid][2]))
					local payoutAmount = payoutGroups[grpid][1]*payoutHours
					payoutTimers[plr] = setTimer(payoutProc, 60000*payoutHours, 0, plr, payoutAmount)
					payoutInfoStr = " Вам полагается оклад "
					
					if(payoutHours < 2) then
						payoutInfoStr = payoutInfoStr.."каждый час "
					
					elseif(payoutHours < 5) then
						payoutInfoStr = payoutInfoStr.."каждые "..tostring(payoutHours).." часа "
					
					else
						payoutInfoStr = payoutInfoStr.."каждые "..tostring(payoutHours).." часов "
					end
					
					payoutInfoStr = payoutInfoStr.."в размере $"..tostring(payoutAmount).." с соответствующей надбавкой за ранг."
				end
				
				setElementData(plr, "usergroupname", playerGroups[grpid][1])
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш новый статус - '"..playerGroups[grpid][1].."'."..payoutInfoStr)
				
				if not isPlayerFromPolice(plr) then
					for zoneIndex=1,criminalActivityZoneNum do
						if criminalActivityZones[zoneIndex][1] then
							criminalActivitySendInfo(zoneIndex, false, plr)
						end
					end
				end
				
				return true
			end
			
		else
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Данная работа недоступна для игроков-банкротов.")
			return "игрок-банкрот"
		end
	end

	refreshSkin(plr, grpid)
	return "NIL"
end

function payoutProc(plr, amount)
	if isElement(plr) then
		local pGrp = getElementData(plr, "usergroup")
		local plrInPayoutZone = true
		local fId, pId = fractionGetPlayerFraction(plr)
		local fMult = 1
		
		if pGrp then
			
			if pGrp == 5 then
				plrInPayoutZone = false
				for i,mBase in ipairs(militaryBases) do
					if isElementWithinColShape(plr, mBase[11]) then
						plrInPayoutZone = true
						break
					end
				end
				
			elseif pGrp == 4 then
				plrInPayoutZone = false
				local pVeh = getPedOccupiedVehicle(plr)
				
				if pVeh and(getPedOccupiedVehicleSeat(plr) == 0) then
					local vGrps = groupVehicles[getElementModel(pVeh)]
					
					if vGrps then
						for _,vGrp in ipairs(vGrps) do
							if vGrp == pGrp then
								plrInPayoutZone = true
								break
							end
						end
						
					end
				
				elseif not pVeh then
					plrInPayoutZone = fractionIsPlayerInsideFractionInterior(plr, fId)
				end
				
			elseif pGrp == 2 then
				plrInPayoutZone = false
				local pVeh = getPedOccupiedVehicle(plr)
				
				if pVeh and(getPedOccupiedVehicleSeat(plr) == 0) or (getPedOccupiedVehicleSeat(plr) == 1) or (getPedOccupiedVehicleSeat(plr) == 2) or (getPedOccupiedVehicleSeat(plr) == 3) then
					local vGrps = groupVehicles[getElementModel(pVeh)]
					
					if vGrps then
						for _,vGrp in ipairs(vGrps) do
							if vGrp == pGrp then
								plrInPayoutZone = true
								break
							end
						end
					end
					
				elseif not pVeh then
					plrInPayoutZone = fractionIsPlayerInsideFractionInterior(plr, fId)
				end
			end
		end
		
		if not plrInPayoutZone then
			return
		end
		
		if fId then
			if(pId == 0) then
				fMult = payoutMults[11]
			else
				fMult = payoutMults[fractions[fId][5][pId][2]]
			end
		end
		
		giveMoney(plr, math.floor(amount*fMult), false)
	end
end

function payoutProcAdmin()
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		if getElementData(plr, "spawned") and(getPlayerIdleTime(plr) < 600000) then
			if(isAdmin(plr) or isModerator(plr)) then
				giveMoney(plr, math.ceil(payoutAdminPerQuestion*2), false)
			end
		end
	end
end

function registerPlayer(plr, pass, email, referrer, userGender, userRace)
	if(source == resourceRoot) and (plr == client) then
		local accName = getPlayerName(plr)
		
		if not doesPlayerHaveRPName(plr) then
			outputServerLog("RESPLAY: RP check failed while registering a player("..accName..")")
			triggerClientEvent(plr, "onRegisterFinished", plr, false, 10)
			return nil
		end
		
		local serverId = webGetServerId()
		local md5Pass = md5(pass)
		
		if serverId and md5Pass then
			local sserial = getPlayerSerial(plr)
			dbQuery(registerPlayerSerial, {accName, pass, email, referrer, sserial, userGender, userRace}, db, "SELECT COUNT(*) AS count FROM users WHERE serial = ?", sserial)
		else
			triggerClientEvent(plr, "onRegisterFinished", plr, false, 6)
		end
	end
end

function registerPlayerSerial(dbq, accName, pass, email, referrer, sserial, userGender, userRace)
	local source = getPlayerFromName(accName)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	if isElement(source) then
		if(dbqueryresult[1]["count"] < 3) or isTestServer() then
			if(string.len(referrer) > 0) then
				dbQuery(registerPlayerReferrer, {accName, pass, email, referrer, sserial, userGender, userRace}, db, "SELECT * FROM users WHERE name = ?", getHash(referrer))
			else
				webAccountsTmp[accName] = { pass, email, referrer, sserial, userGender, userRace }
				registerPlayerResult(accName, 0)
			end
		
		else
			outputServerLog("RESPLAY: Register error. Too many accounts from one device("..accName..")")
			triggerClientEvent(source, "onRegisterFinished", source, false, 8)
		end
	end
end

function registerPlayerReferrer(dbq, accName, pass, email, referrer, sserial, userGender, userRace)
	local source = getPlayerFromName(accName)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	if isElement(source) then
		if(table.getn(dbqueryresult) > 0) then
			--[[
			if callRemote(webSiteHost.."mtacreateaccount.php", registerPlayerResult, accName, md5Pass, serverId, email) then
				webAccountsTmp[accName] = { pass, email, referrer, sserial, userGender }
			else
				outputServerLog("RESPLAY: Error while accessing the website")
				triggerClientEvent(plr, "onRegisterFinished", plr, false, 7)
			end
			]]
			
			if(dbqueryresult[1]["serial"] == sserial) then
				outputServerLog("RESPLAY: Register error. Referrer with same serial("..accName..", "..referrer..")")
				triggerClientEvent(source, "onRegisterFinished", source, false, 11)
			
			else
				webAccountsTmp[accName] = { pass, email, referrer, sserial, userGender, userRace }
				registerPlayerResult(accName, 0)
			end
		
		else
			outputServerLog("RESPLAY: Register error. Unknown referrer("..accName..", "..referrer..")")
			triggerClientEvent(source, "onRegisterFinished", source, false, 9)
		end
	end
end

function registerPlayerResult(accName, res)
	if accName and(accName ~= "ERROR") and webAccountsTmp[accName] then
		local source = getPlayerFromName(accName)
		local pass = webAccountsTmp[accName][1]
		local email = webAccountsTmp[accName][2]
		local referrer = webAccountsTmp[accName][3]
		local sserial = webAccountsTmp[accName][4]
		local userGender = webAccountsTmp[accName][5]
		local userRace = webAccountsTmp[accName][6]
		webAccountsTmp[accName] = nil
		if res and(res == 0) then
			if isElement(source) then
				local curTime = getRealTime()
				local sIP = getPlayerIP(source)

				local defaultSkin = playerGroups[1][2][userRace+1][userGender][1]

				if dbExec(db, "INSERT INTO users (name, pass, usergroup, skin, lastLogin, email, referrer, serial, regip, gender, race) VALUES (?, ?, 1, ?, ?, ?, ?, ?, ?, ?, ?)", getHash(accName), getHash(pass, true), defaultSkin, curTime.timestamp, email, getHash(referrer), sserial, sIP, userGender, userRace) then

					addNewEventToLog(accName, "Аккаунты - Регистрация - IP "..sIP..", с/н "..sserial, true)
					outputServerLog("RESPLAY: A new registered player - "..accName)
					triggerClientEvent(source, "onRegisterFinished", source, true)
				
				else
					outputServerLog("RESPLAY: Error while inserting a player info into database("..accName..")")
					triggerClientEvent(source, "onRegisterFinished", source, false, 5)
				end
			
			else
				outputServerLog("RESPLAY: Error while inserting a player info into database("..accName..")")
			end
		
		else
			if isElement(source) then
				triggerClientEvent(source, "onRegisterFinished", source, false, res)
			end
		end
	
	else
		outputServerLog("RESPLAY: Request error while registering a new player(accName = "..accName..")")
	end
end

function changePassword(plr, pass)
	if(source == resourceRoot) and(plr == client) then
		local accName = getPlayerName(plr)
		local serverId = webGetServerId()
		local md5Pass = md5(pass)
		
		if serverId and md5Pass then
			--[[
			if callRemote(webSiteHost.."mtachangepass.php", changePasswordResult, accName, md5Pass, serverId) then
				webAccountsTmp[accName] = { pass }
			else
				outputServerLog("RESPLAY: Error while accessing the website")
				triggerClientEvent(plr, "onChangePassFinished", plr, false)
			end
			]]
			webAccountsTmp[accName] = { pass }
			changePasswordResult(accName, 0)
		
		else
			triggerClientEvent(plr, "onChangePassFinished", plr, false)
		end
	end
end

function changePasswordResult(accName, res)
	if accName and(accName ~= "ERROR") and webAccountsTmp[accName] then
		local source = getPlayerFromName(accName)
		local pass = webAccountsTmp[accName][1]
		webAccountsTmp[accName] = nil
		
		if res then
			if dbExec(db, "UPDATE users SET pass=? WHERE name=?", getHash(pass, true), getHash(accName)) then
				outputServerLog("RESPLAY: Player has changed his/her password("..accName..")")
				
				if isElement(source) then
					addNewEventToLog(accName, "Аккаунты - Смена пароля - IP "..getPlayerIP(source)..", с/н "..getPlayerSerial(source), true)
					triggerClientEvent(source, "onChangePassFinished", source, true)
				end
			
			else
				outputServerLog("RESPLAY: Error while inserting a new password info into database("..accName..")")
				if isElement(source) then
					triggerClientEvent(source, "onChangePassFinished", source, false)
				end
			end
		
		else
			outputServerLog("RESPLAY: Error while changing password on website("..accName..")")
			
			if isElement(source) then
				triggerClientEvent(source, "onChangePassFinished", source, false)
			end
		end
	end
end

function joinHandler()
	addNewEventToLog(getPlayerName(source), "Аккаунты - Соединение с сервером - IP "..getPlayerIP(source)..", с/н "..getPlayerSerial(source), true)
	playerLastInfo[getPlayerName(source)] = { getPlayerIP(source), getPlayerSerial(source) }
end

function kickAFK(plr)
	kickPlayer(plr, "AFK")
end

function getPlayerHash(plr, key)
	if(source == resourceRoot) and(plr == client) then
		triggerClientEvent(plr, "onReceiveHash", plr, getHash(key, true))
	end
end

function getPlayerAssigned(plr)
	if(source == resourceRoot) and(plr == client) then
		--[[
		repeat
			dbq = dbQuery(db, "SELECT serial,assigned FROM users WHERE name=?", getHash(getPlayerName(plr)))
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		local checkPassed = (((dbqueryresult[1]["assigned"] > 0) and(dbqueryresult[1]["serial"] == getPlayerSerial(plr))) or (dbqueryresult[1]["assigned"] <= 0))
		if checkPassed then
		]]
		
		if true then
			triggerClientEvent(plr, "onReceiveAssigned", plr, true, not doesPlayerHaveRPName(plr))
		else
			kickPlayer(plr, "Аккаунт присоединён к другому устройству")
		end
	end
end

function inventoryGetSlots(pName)
	local sHash = getHash(pName)
	local slotInfo = {}
	
	repeat
		dbq = dbQuery(db, "SELECT slot, item FROM inventory WHERE player=?", sHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	for _,slt in ipairs(dbqueryresult) do
		slotInfo[slt["slot"]] = slt["item"]
	end
	
	return slotInfo
end

function inventoryCheckForSlot(source, itemId)
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	local slotsNum = getElementData(source, "invSlotNum")
	
	if slotsNum then
		for i=1,slotsNum do
			if not slotInfo[i] then
				return i
			end
		end
	end
	
	return false
end

function inventoryGetItemSlot(source, itemId)
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	local slotsNum = getElementData(source, "invSlotNum")
	
	if slotsNum then
		for i=1,slotsNum do
			if slotInfo[i] and(slotInfo[i] == itemId) then
				return i
			end
		end
	end
	
	return false
end

function inventoryGetItemInSlot(source, slotId)
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	
	if slotInfo[slotId] then
		return slotInfo[slotId]
	end
	
	return false
end

function inventoryNewItem(source, itemId, slotId)
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	local slotsNum = getElementData(source, "invSlotNum")
	
	if slotsNum and(slotsNum >= slotId) then
		local slotItem = slotInfo[slotId]
		
		if not slotItem then
			return inventoryUpdateSlot(source, slotId, itemId)
		end
	end
	
	return false
end

function inventoryGetItemsInTrunk(veh)
	local items = {}
	local sqlid = getElementData(veh, "sqlid")
	
	if sqlid then
		repeat
			dbq = dbQuery(db, "SELECT id, item FROM carTrunks WHERE car = ?", sqlid)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		for _,item in ipairs(dbqueryresult) do
			table.insert(items, { item["id"], item["item"] })
		end
	end
	return items
end

function inventoryTakeItemFromTrunk(itemId, source)
	repeat
		dbq = dbQuery(db, "SELECT item FROM carTrunks WHERE id = ?", itemId)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if(table.getn(dbqueryresult) > 0) then
		local item = dbqueryresult[1]["item"]
		local slotId = inventoryCheckForSlot(source, item)
		
		if slotId then
			if(dbExec(db, "DELETE FROM carTrunks WHERE id = ?", itemId)) then
				inventoryNewItem(source, item, slotId)
				triggerClientEvent(source, "onServerMsgAdd", source, "Вы взяли предмет из багажника.")
				return true
			
			else
				triggerClientEvent(source, "onServerMsgAdd", source, "Ошибка.")
			end
		
		else
			triggerClientEvent(source, "onServerMsgAdd", source, "Нет свободного места в инвентаре.")
		end
	end
end

function inventoryPutItemInTrunk(item, source, veh)
	local sqlid = getElementData(veh, "sqlid")
	
	if sqlid then
		repeat
			dbq = dbQuery(db, "SELECT item FROM carTrunks WHERE car = ?", sqlid)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		if(table.getn(dbqueryresult) < inventoryCarTrunkSlots) then
			if(dbExec(db, "INSERT INTO carTrunks(car, item) VALUES(?, ?)", sqlid, item)) then
				triggerClientEvent(source, "onServerMsgAdd", source, "Вы положили данный предмет в багажник автомобиля.")
				return true
			else
				triggerClientEvent(source, "onServerMsgAdd", source, "Ошибка.")
			end
		else
			triggerClientEvent(source, "onServerMsgAdd", source, "Багажник полон.")
		end
		
	else
		if not inventoryCarTempTrunks[veh] then
			inventoryCarTempTrunks[veh] = {}
		end
		
		if(#inventoryCarTempTrunks[veh] < inventoryCarTrunkSlots) then
			table.insert(inventoryCarTempTrunks[veh], item)
			triggerClientEvent(source, "onServerMsgAdd", source, "Вы положили данный предмет в багажник автомобиля.")
			return true
		else
			triggerClientEvent(source, "onServerMsgAdd", source, "Багажник полон.")
		end
		
	end
	
	return false
end

function inventoryCreateDroppedItem(mdl, source, dropx, dropy, dropz, itemId)
	local droppedItem = createPickup(dropx, dropy, dropz, 3, mdl, 0, 1)
	
	if not droppedItem then
		return false
	end
	
	setElementInterior(droppedItem, getElementInterior(source))
	setElementDimension(droppedItem, getElementDimension(source))
	table.insert(inventoryDroppedItems, { droppedItem, setTimer(inventoryDestroyDroppedItem, 300000, 1, droppedItem), itemId })
	
	return true
end

function inventoryDestroyDroppedItem(droppedItem)
	for i=1,table.getn(inventoryDroppedItems) do
		if(inventoryDroppedItems[i][1] == droppedItem) then
			destroyElement(droppedItem)
			killTimer(inventoryDroppedItems[i][2])
			table.remove(inventoryDroppedItems, i)
			break
		end
	end
end

function inventoryDropSlot(slotId, dropx, dropy, dropz, checkTrunks)
	if(checkTrunks == nil) then
		checkTrunks = true
	end
	
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	local slotItem = slotInfo[slotId]
	local slotUsed = false
	
	if slotItem then
		if(not isPedInVehicle(source)) then
			--print(tostring(checkTrunks))
			if checkTrunks then
				local vehicles = getNearbyElementsByType(source, "vehicle", nearbyVehiclesRadius)
				local openRatio, trunkState, hp
				
				for _,veh in ipairs(vehicles) do
					openRatio = getVehicleDoorOpenRatio(veh, 1)
					trunkState = getVehicleDoorState(veh, 1)
					hp = getElementHealth(veh)
					
					if(hp > 0) and((openRatio > 0.0) or (trunkState == 1) or (trunkState == 3) or (trunkState == 4)) then
						slotUsed = inventoryPutItemInTrunk(slotItem, source, veh)
						break
					end
					
				end
				
				if not slotUsed then
					for i,base in ipairs(clanBases) do
						if clanBasePlayerInsideMarker(i, source) then
							slotUsed = clanBaseGiveInventoryItem(i, source, slotId)
							break
						end
					end
				end
			end
			
			if not slotUsed then
				if inventoryFurnitureItems[slotItem] then
					slotUsed = inventoryCreateDroppedItem(1558, source, dropx, dropy, dropz, slotItem)
				
				else
					slotUsed = inventoryCreateDroppedItem(inventoryItemNames[slotItem][3], source, dropx, dropy, dropz, slotItem)
				end
			end
		end
		
		if(slotUsed) then
			slotItem = 0
		end
		
		inventoryUpdateSlot(source, slotId, slotItem)
	end
end

function inventoryRemoveItem(source, slotId)
	local slotInfo = inventoryGetSlots(getPlayerName(source))
	local slotItem = slotInfo[slotId]
	
	if slotItem then
		inventoryUpdateSlot(source, slotId, 0)
	end
end

function inventoryUseSlot(slotId)
	local cargo = getElementData(source, "heaverCargo")
	local rcVeh = getElementData(source, "RC")
	local jetpack = doesPedHaveJetPack(source)
	
	if(not cargo) and(not rcVeh) and(not jetpack) and(not isElementInWater(source)) then
		local slotInfo = inventoryGetSlots(getPlayerName(source))
		local sHash = getHash(getPlayerName(source))
		local slotItem = slotInfo[slotId]
		local slotUsed = false
		setPedAnimation(source)
		
		if inventoryFurnitureItems[slotItem] then
			local hid = getPlayerHouseInside(source)
			
			if inventoryOnlyForHouse[slotItem] and((not hid) or (houses[hid][11] ~= sHash)) then
				playerShowMessage(source, "Этот предмет можно размещать только внутри cобственного дома.")
			else
				furnitureSelect(source, slotItem)
			end
		
		elseif(slotItem == 1) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local can = createObject(2601, 0, 0, 0, 0, 0, 0)
				setElementInterior(can, getElementInterior(source))
				setElementDimension(can, getElementDimension(source))
				setPedAnimation(source, "VENDING", "VEND_Drink2_P", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 203, 0, 0, 0, 0, false, 25, source, 3)
				exports.bone_attach:attachElementToBone(can, source, 11, 0, 0.05, 0.1, 0, 90, 0)
				setTimer(function(drinker, can)
							if(isElement(drinker)) then
								setElementData(drinker, "thirstLevel", math.min(1, getElementData(drinker, "thirstLevel")+0.5), false)
							end
							if(isElement(can)) then
								destroyElement(can)
							end
						 end, 1500, 1, source, can)
				slotUsed = true
			end
		
		elseif(slotItem == 2) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) then
				local vehicleToFill
				local allVehicles = getNearbyElementsByType(source, "vehicle", nearbyVehiclesRadius)
				local px, py, pz = getElementPosition(source)
				local fuelLevel, vx, vy, vz, vDist
				local minVehDist = 1000000.0
				
				for i=1,table.getn(allVehicles) do
					vx, vy, vz = getElementPosition(allVehicles[i])
					vDist = getDistanceBetweenPoints3D(vx, vy, vz, px, py, pz)
					
					if(vDist < minVehDist) then
						fuelLevel = getElementData(allVehicles[i], "fuelLevel")
						
						if(fuelLevel) then
							vehicleToFill = allVehicles[i]
							minVehDist = vDist
						end
						
					end
					
				end
				
				if(vehicleToFill) and(not isVehicleBlown(vehicleToFill)) then
					fuelLevel = getElementData(vehicleToFill, "fuelLevel")
					
					if((1.0-fuelLevel) > 0.1) then
						setElementData(vehicleToFill, "fuelLevel", fuelLevel+0.1)
						triggerClientEvent(source, "onServerMsgAdd", source, string.format("Транспортное средство %s было дозаправлено на 10%s.", getVehicleName(vehicleToFill), "%"))
						slotUsed = true					
					else
						triggerClientEvent(source, "onServerMsgAdd", source, string.format("Бак у %s должен быть опустошен хотя бы на 10%s, чтобы использовать канистру.", getVehicleName(vehicleToFill), "%"))
					end
					
				end
			end
		
		elseif(slotItem == 3) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local burger = createObject(2703, 0, 0, 0, 0, 0, 0)
				setElementInterior(burger, getElementInterior(source))
				setElementDimension(burger, getElementDimension(source))
				setPedAnimation(source, "FOOD", "EAT_Burger", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 151, 0, 0, 0, 0, false, 25, source)
				exports.bone_attach:attachElementToBone(burger, source, 12, 0, 0.05, 0.1, 0, 90, 0)
				setTimer(function(eater, burger)
							if(isElement(eater)) then
								setElementData(eater, "hungryLevel", math.min(1, getElementData(eater, "hungryLevel")+0.4), false)
							end
							if(isElement(burger)) then
								destroyElement(burger)
							end
						 end, 1500, 1, source, burger)
				slotUsed = true
			end
		
		elseif(slotItem == 4) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local pizza = createObject(2702, 0, 0, 0, 0, 0, 0)
				setElementInterior(pizza, getElementInterior(source))
				setElementDimension(pizza, getElementDimension(source))
				setPedAnimation(source, "FOOD", "EAT_Pizza", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 151, 0, 0, 0, 0, false, 25, source)
				exports.bone_attach:attachElementToBone(pizza, source, 12, 0, 0.05, 0.1, 180, 90, 180)
				setTimer(function(eater, pizza)
							if(isElement(eater)) then
								setElementData(eater, "hungryLevel", math.min(1, getElementData(eater, "hungryLevel")+0.5), false)
							end
							if(isElement(pizza)) then
								destroyElement(pizza)
							end
						 end, 1500, 1, source, pizza)
				slotUsed = true
			end
		
		elseif(slotItem == 5) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local chicken = createObject(2769, 0, 0, 0, 0, 0, 0)
				setElementInterior(chicken, getElementInterior(source))
				setElementDimension(chicken, getElementDimension(source))
				setPedAnimation(source, "FOOD", "EAT_Chicken", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 151, 0, 0, 0, 0, false, 25, source)
				exports.bone_attach:attachElementToBone(chicken, source, 12, 0, 0.05, 0.1, 0, 0, 0)
				setTimer(function(eater, chicken)
							if(isElement(eater)) then
								setElementData(eater, "hungryLevel", math.min(1, getElementData(eater, "thirstLevel")+0.5), false)
							end
							if(isElement(chicken)) then
								destroyElement(chicken)
							end
						 end, 1500, 1, source, chicken)
				slotUsed = true
			end
		
		elseif(slotItem == 6) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local beer = createObject(1544, 0, 0, 0, 0, 0, 0)
				setElementInterior(beer, getElementInterior(source))
				setElementDimension(beer, getElementDimension(source))
				setPedAnimation(source, "GANGS", "drnkbr_prtl", 1500, false, false, false, false)
				exports.bone_attach:attachElementToBone(beer, source, 12, 0.2, 0.05, 0.2, 0, 240, 0)
				setTimer(function(drinker, beer)
							if(isElement(drinker)) then
								setElementData(drinker, "thirstLevel", math.min(1, getElementData(drinker, "thirstLevel")+0.5), false)
								triggerClientEvent(drinker, "onPlayerIncDrunkiness", drinker, 150)
							end
							if(isElement(beer)) then
								destroyElement(beer)
							end
						 end, 1500, 1, source, beer)
				slotUsed = true
			end
		
		elseif(slotItem == 7) then
			if not isPedInVehicle(source) then
				slotUsed = boomboxAdd(source)
			end
		
		elseif(slotItem == 8) then
			--[[
			local curHp = getElementHealth(source)
			if(curHp > 0) and(curHp < 100) then
				setElementHealth(source, math.min(100, curHp+50))
				triggerClientEvent("onCreateProgressPopup", source, "images/health.png", source, true)
				triggerClientEvent("onServerPlaySFX3D", source, "genrl", 52, 17, 0, 0, 0, false, 40, source)
				slotUsed = true
			end
			]]
			slotUsed = true
		
		elseif(slotItem == 9) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				local donut = createObject(2218, 0, 0, 0, 0, 0, 0)
				setElementInterior(donut, getElementInterior(source))
				setElementDimension(donut, getElementDimension(source))
				setPedAnimation(source, "FOOD", "EAT_Burger", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 151, 0, 0, 0, 0, false, 25, source)
				exports.bone_attach:attachElementToBone(donut, source, 12, 0, 0.05, 0.1, 180, 90, 0)
				setTimer(function(eater, donut)
							if(isElement(eater)) then
								setElementData(eater, "hungryLevel", math.min(1, getElementData(eater, "hungryLevel")+0.4), false)
							end
							if(isElement(donut)) then
								destroyElement(donut)
							end
						 end, 1500, 1, source, donut)
				slotUsed = true
			end
		
		elseif(slotItem == 10) then
			local boxWeap = weaponsInBox[math.random(table.getn(weaponsInBox))]
			if giveWeapon(source, boxWeap[1], boxWeap[2]) then
				triggerClientEvent(source, "onServerMsgAdd", source, "Вы нашли в ящике "..boxWeap[3]..".")
				slotUsed = true
			else
				triggerClientEvent(source, "onServerMsgAdd", source, "Вы нашли в ящике "..boxWeap[3]..", но не можете взять оружие себе, так как достигнуто ограничение по боезапасу.")
				dropWeapon(source, boxWeap[1], boxWeap[2], true, false)
				slotUsed = true
			end
		
		elseif(slotItem == 11) then
			if((not isPedInVehicle(source)) and isPedOnGround(source)) or isPedInVehicle(source) then
				--local nuts = createObject(2218, 0, 0, 0, 0, 0, 0)
				--setElementInterior(nuts, getElementInterior(source))
				--setElementDimension(nuts, getElementDimension(source))
				setPedAnimation(source, "VENDING", "vend_eat_P", 1500, false, false, false, false)
				local cx, cy, cz = getElementPosition(source)
				local curCol = createColSphere(cx, cy, cz, 50)
				local players = getElementsWithinColShape(curCol, "player")
				destroyElement(curCol)
				triggerClientEvent(players, "onServerPlaySFX3D", source, "script", 203, 1, 0, 0, 0, false, 25, source, 3)
				--exports.bone_attach:attachElementToBone(nuts, source, 12, 0, 0.05, 0.1, 180, 90, 0)
				setTimer(function(eater)
							if(isElement(eater)) then
								setElementData(eater, "hungryLevel", math.min(1, getElementData(eater, "hungryLevel")+0.2), false)
							end
							--if(isElement(nuts)) then
							--	destroyElement(nuts)
							--end
						 end, 1500, 1, source)
				slotUsed = true
			end
		
		elseif(slotItem == 12) then
			if(not isPedInVehicle(source)) and isPedOnGround(source) then
				slotUsed = rcCreate(source, 501)
			end
		
		elseif(slotItem == 13) then
			if(not isPedInVehicle(source)) and isPedOnGround(source) then
				slotUsed = rcCreate(source, 441)
			end
		
		elseif(slotItem == 14) then
			if(not isPedInVehicle(source)) and isPedOnGround(source) then
				slotUsed = rcCreate(source, 564)
			end
		
		elseif(slotItem == 15) then
			if(not isPedInVehicle(source)) and isPedOnGround(source) then
				slotUsed = rcCreate(source, 464)
			end
		
		elseif(slotItem == 16) then
			if(not isPedInVehicle(source)) and isPedOnGround(source) then
				if isPlayerBusy(source) then
					playerShowMessage(source, "Вы должны закончить остальные дела, прежде чем сможете начать ограбление.")
				
				elseif(getElementData(source, "usergroup") ~= 10) then
					playerShowMessage(source, "Ограбление доступно только бандитам.")
				
				elseif(getElementInterior(source) == 0) and(getElementDimension(source) == 0) then
					local sx, sy, sz = getElementPosition(source)
					local px, py, pz
					
					for houseid,house in pairs(houses) do
						px, py, pz = getElementPosition(house[4])
						if(getDistanceBetweenPoints3D(sx, sy, sz, px, py, pz) <= nearbyPickupsRadius) then
							local h = getTime()
							if(h < 23) and(h > 7) then
								playerShowMessage(source, "Ограбление дома можно начать только в промежутке между 23:00 и 8:00.")
							else
								slotUsed = gangsterStealStart(source, houseid)
							end
							break
						end
					end
					
					if not slotUsed then
						local veh, vx, vy, vz, minDist, curDist
						local px, py, pz = getElementPosition(source)
						
						for curveh in pairs(gangsterStealCars) do
							if isElement(curveh) then
								vx, vy, vz = getElementPosition(curveh)
								curDist = getDistanceBetweenPoints3D(px, py, pz, vx, vy, vz)
								if(curDist <= nearbyVehiclesRadius) and((not minDist) or (minDist > curDist)) then
									veh = curveh
									minDist = curDist
								end
							end
						end
						
						if veh then
							slotUsed = gangsterStealStartCar(veh, source)
						else
							playerShowMessage(source, "Рядом с вами нет объекта для ограбления.")
						end
						
					end
				end
			end
		end
		
		if(slotUsed) then
			slotItem = 0
		end
		
		inventoryUpdateSlot(source, slotId, slotItem)
	end
end

function inventoryUpdateSlot(playa, slotId, itemId)
	local sHash = getHash(getPlayerName(playa))
	
	if itemId and(itemId > 0) then
		local slotInfo = inventoryGetSlots(getPlayerName(playa))
		local slotItem = slotInfo[slotId]
		local dbOper = false
		
		if slotItem and(slotItem > 0) then
			dbOper = dbExec(db, "UPDATE inventory SET item=? WHERE player=? AND slot=?", itemId, sHash, slotId)
		else
			dbOper = dbExec(db, "INSERT INTO inventory(player, slot, item) VALUES(?, ?, ?)", sHash, slotId, itemId)
		end
		
		if dbOper then
			triggerClientEvent(playa, "onInventoryUpdateSlot", playa, slotId, itemId, 1)
			return true
		end
	
	else
		if(dbExec(db, "DELETE FROM inventory WHERE player=? AND slot=?", sHash, slotId)) then
			triggerClientEvent(playa, "onInventoryUpdateSlot", playa, slotId, 0, 0)
			return true
		end
	end
	
	return false
end

function respectSet(plr, val, minBorder, maxBorder, diffMultEnabled)
	local oldVal = getElementData(plr, "respect")
	
	if((oldVal <= maxBorder) and(oldVal >= minBorder)) then
		local sHash = getHash(getPlayerName(plr))
		local newVal = math.max(minBorder, math.min(maxBorder, val))
		
		if diffMultEnabled then
			local deltaVal = newVal-oldVal
			local diffMult = nil
			
			if(deltaVal > 0.0) then
				diffMult = tonumber(get("respectDiffPositive"))
			else
				diffMult = tonumber(get("respectDiffNegative"))
			end
			
			if diffMult then
				diffMult = math.max(0.1, diffMult)
				newVal = oldVal+deltaVal*diffMult
			end
		end
		newVal = math.max(minBorder, math.min(maxBorder, newVal))
		
		if(dbExec(db, "UPDATE users SET respect=? WHERE name = ?", newVal, sHash)) then
			addNewEventToLog(getPlayerName(plr), string.format("Уважение - Изменение - %.2f -> %.2f", oldVal*100.0, newVal*100.0), true)
			setElementData(plr, "respect", newVal)
			setElementData(plr, "Respect", string.format("%.2f%%", newVal*100.0))
			
			if(math.abs(newVal) >= referrerRespect) then
				local referrer = getElementData(plr, "referrer")
				
				if not (referrer == 0) then
					dbExec(db, "UPDATE users SET referrer=0 WHERE name=?", sHash)
					setElementData(plr, "referrer", 0, false)
					local referrerOnline = false
					local players = getElementsByType("player")
					local playersName, referTimes
					
					for i=1,table.getn(players) do
						playersName = getPlayerName(players[i])
						referTimes = getElementData(players[i], "referTimes")
						if((getHash(playersName) == referrer) and(referTimes < 3) and(getElementData(players[i], "spawned")) and(getPlayerSerial(players[i]) ~= getPlayerSerial(plr))) then
							referTimes = referTimes+1
							dbExec(db, "UPDATE users SET referTimes=? WHERE name=?", referTimes, referrer)
							setElementData(players[i], "referTimes", referTimes, false)
							giveMoney(players[i], referrerMoney)
							triggerClientEvent(players[i], "onServerMsgAdd", players[i], string.format("Игрок %s достиг уважения %d%s. За приглашение данного игрока вы получаете $%d!", getPlayerName(plr), math.floor(referrerRespect*100), "%", referrerMoney))
							referrerOnline = true
							break
						end
					end
					
					if not referrerOnline then
						dbQuery(respectSet2, {referrer, getPlayerSerial(plr)}, db, "SELECT money,serial,referTimes FROM users WHERE name=?", referrer)
					end
					
				end
			end
			
			checkPlayerGroup(plr)
		end
	end
end

function respectSet2(dbq, referrer, plrSerial)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	if dbqueryresult and(table.getn(dbqueryresult) > 0) and(dbqueryresult[1]["referTimes"] < 3) and(dbqueryresult[1]["serial"] ~= plrSerial) then
		local curMoney = dbqueryresult[1]["money"]
		local referTimes = dbqueryresult[1]["referTimes"]+1
		dbExec(db, "UPDATE users SET referTimes=?,money=? WHERE name=?", referTimes, curMoney+referrerMoney, referrer)
	end
end

function requestUserData(plr, playerShouldBeSpawned, firstTime)
	if(source == resourceRoot) and(plr == client) then
		if loginTimers[plr] then
			killTimer(loginTimers[plr])
			loginTimers[plr] = nil
		end
		local sHash = getHash(getPlayerName(plr))
		dbQuery(requestUserData2, {plr, sHash, playerShouldBeSpawned, firstTime}, db, "SELECT * FROM users WHERE name = ?", sHash)
	end
end

caseWords = {
	["дней"] = {
		["i"] = "дней",
		["r"] = "дней",
		["d"] = "дням",
		["v"] = "дней",
		["t"] = "днями",
		["p"] = "днях"
	},
	["дня"] = {
		["i"] = "дня",
		["r"] = "дней",
		["d"] = "дням",
		["v"] = "дня",
		["t"] = "днями",
		["p"] = "днях"
	},
	["день"] = {
		["i"] = "день",
		["r"] = "дня",
		["d"] = "дню",
		["v"] = "день",
		["t"] = "днём",
		["p"] = "дне"
	},
	["часов"] = {
		["i"] = "часов",
		["r"] = "часов",
		["d"] = "часам",
		["v"] = "часов",
		["t"] = "часами",
		["p"] = "часах"
	},
	["часа"] = {
		["i"] = "часа",
		["r"] = "часов",
		["d"] = "часам",
		["v"] = "часа",
		["t"] = "часами",
		["p"] = "часах"
	},
	["час"] = {
		["i"] = "час",
		["r"] = "часа",
		["d"] = "часу",
		["v"] = "час",
		["t"] = "часом",
		["p"] = "часе"
	},
	["минут"] = {
		["i"] = "минут",
		["r"] = "минут",
		["d"] = "минутам",
		["v"] = "минут",
		["t"] = "минутами",
		["p"] = "минутах"
	},
	["минуты"] = {
		["i"] = "минуты",
		["r"] = "минут",
		["d"] = "минутам",
		["v"] = "минуты",
		["t"] = "минутами",
		["p"] = "минутах"
	},
	["минута"] = {
		["i"] = "минута",
		["r"] = "минуты",
		["d"] = "минуте",
		["v"] = "минуту",
		["t"] = "минутой",
		["p"] = "минуте"
	},
	["секунд"] = {
		["i"] = "секунд",
		["r"] = "секунд",
		["d"] = "секундам",
		["v"] = "секунд",
		["t"] = "секундами",
		["p"] = "секундах"
	},
	["секунды"] = {
		["i"] = "секунды",
		["r"] = "секунд",
		["d"] = "секундам",
		["v"] = "секунды",
		["t"] = "секундами",
		["p"] = "секундах"
	},
	["секунда"] = {
		["i"] = "секунда",
		["r"] = "секунды",
		["d"] = "секунде",
		["v"] = "секунду",
		["t"] = "секундой",
		["p"] = "секунде"
	}
}

function getWordCase(wordStr, caseLetter)
	local curCase = caseLetter or "i"
	
	if not caseWords[wordStr] then
		return "ERROR"
	end
	
	return caseWords[wordStr][curCase] or "ERROR"
end

function getTimeWord(timeCount, timeOne, timeTwoThreeFour, timeEtc)
	local leftDiv10 = timeCount%10
	local leftDiv100 = timeCount%100
	
	if(leftDiv10 ~= 0) and(leftDiv10 < 5) and((leftDiv100 < 11) or (leftDiv100 > 14)) then
		if(leftDiv10 == 1) then
			return timeOne
		else
			return timeTwoThreeFour
		end
	else
		return timeEtc
	end
end

function getTimeString(timeMs, strCase, disableDays, disableHours, disableMins)
	local timeStr = nil
	local timeMsLeft = timeMs
	
	if not disableDays then
		local timeDays = math.floor(timeMs/86400000)
		
		if(timeDays > 0) then
			timeStr = tostring(timeDays).." "..getWordCase(getTimeWord(timeDays, "день", "дня", "дней"), strCase)
		end
		
		timeMsLeft = timeMsLeft-timeDays*86400000
	end
	
	if not disableHours then
		local timeHours = math.floor(timeMsLeft/3600000)
		
		if(timeHours > 0) then
			timeMsLeft = timeMsLeft-timeHours*3600000
			timeHours = tostring(timeHours).." "..getWordCase(getTimeWord(timeHours, "час", "часа", "часов"), strCase)
		else
			timeHours = ""
		end
		
		if timeStr then
			timeStr = timeStr.." "..timeHours
		elseif(string.len(timeHours) > 0) then
			timeStr = timeHours
		end
	end
	
	if not disableMins then
		local timeMins = math.floor(timeMsLeft/60000)
		if(timeMins > 0) then
			timeMsLeft = timeMsLeft-timeMins*60000
			timeMins = tostring(timeMins).." "..getWordCase(getTimeWord(timeMins, "минута", "минуты", "минут"), strCase)
		else
			timeMins = ""
		end
		
		if timeStr then
			timeStr = timeStr.." "..timeMins
		elseif(string.len(timeMins) > 0) then
			timeStr = timeMins
		end
	end
	
	local timeSecs = math.floor(timeMsLeft/1000)
	
	if(timeSecs > 0) then
		timeSecs = tostring(timeSecs).." "..getWordCase(getTimeWord(timeSecs, "секунда", "секунды", "секунд"), strCase)
	elseif not timeStr then
		timeMsLeft = tostring(timeMsLeft)
		
		if(string.len(timeMsLeft) == 1) then
			timeMsLeft = "00"..timeMsLeft
		elseif(string.len(timeMsLeft) == 2) then
			timeMsLeft = "0"..timeMsLeft
		end
		timeSecs = "0."..tostring(timeMsLeft).." "..getWordCase("секунд", strCase)
	else
		timeSecs = nil
	end
	
	if timeSecs then
		if timeStr then
			timeStr = timeStr.." "..timeSecs
		else
			timeStr = timeSecs
		end
	end
	
	return timeStr
end

function requestUserData2(dbq, source, sHash, playerShouldBeSpawned, firstTime)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	lastSerial = getPlayerSerial(source)
	
	if(playerShouldBeSpawned) then
		local curTime = getRealTime()
		addNewEventToLog(getPlayerName(source), "Аккаунты - Вход - nil", true)
		outputServerLog("RESPLAY: "..getPlayerName(source).." has logged in")
		
		dbExec(db, "UPDATE users SET lastLogin=? WHERE name=?", curTime.timestamp, sHash)
		dbExec(db, "UPDATE users SET lastSerial=? WHERE name=?", lastSerial, sHash)
		setElementData(source, "usergroup", dbqueryresult[1]["usergroup"])

		
		if payoutGroups[dbqueryresult[1]["usergroup"]] then
			local payoutHours = math.max(1, math.floor(payoutGroups[dbqueryresult[1]["usergroup"]][2]))
			local payoutAmount = payoutGroups[dbqueryresult[1]["usergroup"]][1]*payoutHours
			payoutTimers[source] = setTimer(payoutProc, 60000*payoutHours, 0, source, payoutAmount)
		end
		
		setElementData(source, "hungryLevel", dbqueryresult[1]["hungry"], false)
		setElementData(source, "thirstLevel", dbqueryresult[1]["thirst"], false)
		setElementData(source, "arrested", dbqueryresult[1]["arrested"])
		setElementData(source, "wantedLevel", dbqueryresult[1]["wantedLevel"])
		setElementData(source, "spawned", true, false)
		setElementData(source, "respect", dbqueryresult[1]["respect"])
		setElementData(source, "Respect", string.format("%.2f%%", dbqueryresult[1]["respect"]*100.0))
		setElementData(source, "referrer", dbqueryresult[1]["referrer"], false)
		setElementData(source, "referTimes", dbqueryresult[1]["referTimes"], false)
		setElementData(source, "vehicle", nil, false)
		setElementData(source, "heaverCargo", nil)
		setElementData(source, "jetpackFuel", dbqueryresult[1]["jetpack"])
		setElementData(source, "muted", dbqueryresult[1]["muted"])	
		
		if(dbqueryresult[1]["fireproof"] == 1) then
			setElementData(source, "fireproof", true)
		end
		
		if(dbqueryresult[1]["weapAfterDeath"] == 1) then
			setElementData(source, "saveWeapons", true, false)
		end
		
		local face = dbqueryresult[1]["face"]
		
		if face and(face ~= "EMPTY") and(string.lower(string.sub(face, -4)) == ".png") and(string.lower(string.sub(face, 1, 7)) == "http://") then
			fetchRemote(face, insertFaceIntoArray, "", false, source)
			loadedFaces[source] = true
			attachActionToSelf(defaultActions[114], source)
		else
			loadedFaces[source] = "EMPTY"
			attachActionToSelf(defaultActions[115], source)
		end
		
		setPlayerNametagShowing(source, false)
		local sphealth = dbqueryresult[1]["health"]
		local sparmor = dbqueryresult[1]["armor"]
		local spx, spy, spz, spangle, spint, spdim
		local sphouse = dbqueryresult[1]["houseid"]
		local spawnOutside = true
		
		if not (sphouse == 0) then
			local sphouselvl, sphouseowner = houses[sphouse][2], houses[sphouse][11]
			
			if(sphouseowner == sHash) then
				spdim = 2
				
				for i,house in pairs(houses) do
					if(house[1] == sphouse) then
						break
					else
						spdim = spdim+1
					end
				end
				
				playersInsideHouses[source] = sphouse
				spx, spy, spz, spangle, spint = housesInteriors[sphouselvl][1], housesInteriors[sphouselvl][2], housesInteriors[sphouselvl][3], 0.0, housesInteriors[sphouselvl][4]
				local hx, hy, hz = getElementPosition(houses[sphouse][4])
				triggerClientEvent(source, "onSaveHouseSet", source, hx, hy, hz)
				setTimer(function(source, houseInterior, housesFrozenObjs)
							triggerClientEvent(source, "onHouseEnter", source, houseInterior, false, housesFrozenObjs)
							setElementPosition(source, houseInterior[1], houseInterior[2], houseInterior[3])
						 end, 500, 1, source, housesInteriors[sphouselvl], housesFrozenObjs)
				spawnOutside = false
			end
			
		end
		
		if spawnOutside then
			local spawnid
			spx, spy, spz, spangle, spint, spdim, spawnid = getOutsideSpawn(dbqueryresult[1]["city"])
			if(dbqueryresult[1]["city"] <= 0) then
				setOutsideSpawn(source, spawnid)
			end
		end
		
		local pTeam = dbqueryresult[1]["clan"]
		
		if(pTeam == 0) then
			pTeam = clanDefault
		else
			pTeam = getClanByHash(pTeam)
			
			if pTeam then
				attachActionToSelf(defaultActions[85], source)
				attachActionToSelf(defaultActions[99], source)
			else
				pTeam = clanDefault
			end
		end
		
		playerSkillsBuffer[source] = {}
		playerSkillsBuffer[source][22] = dbqueryresult[1]["stamina"]
		playerSkillsBuffer[source][24] = dbqueryresult[1]["maxhp"]
		playerSkillsBuffer[source][160] = dbqueryresult[1]["driving"]
		playerSkillsBuffer[source][230] = dbqueryresult[1]["cycling"]
		playerSkillsBuffer[source][229] = dbqueryresult[1]["biking"]
		playerSkillsBuffer[source][169] = dbqueryresult[1]["flying"]
		spawnPlayer(source, spx, spy, spz)
		setElementRotation(source, 0, 0, spangle)
		setElementModel(source, dbqueryresult[1]["skin"])
		setElementInterior(source, spint)
		setElementDimension(source, spdim)
		setPlayerTeam(source, pTeam)
		local weapons = {}
		local money = dbqueryresult[1]["money"]
		local wantedLvl = dbqueryresult[1]["wantedLevel"]
		weapons[0] = { dbqueryresult[1]["w0"], dbqueryresult[1]["w0ammo"] }

		--- REFRESH SKIN IF NOT INITED ---
		local skinInited = dbqueryresult[1]["skin_inited"]
		local gender = dbqueryresult[1]["gender"]
		local race = dbqueryresult[1]["race"] + 1

		if (skinInited == 0) and not firstTime then
			local fractionId = dbqueryresult[1]["fraction"]
			local usergroupId = dbqueryresult[1]["usergroup"]

			if fractionId == 0 and usergroupId == 1 then
		

				local skin = playerGroups[1][2][race][gender][math.random(table.getn(playerGroups[1][2][race][gender])-1)+1]

				if dbExec(db, "UPDATE users SET skin=?, default_skin=?, skin_inited=1 WHERE name=?", skin, skin, sHash) then
					outputServerLog("RESPLAY: Player has changed his/her skin - "..sHash)
					setPedSkin(source, skin)
				else
					outputServerLog("RESPLAY: Error while updaing a player info into database ("..sHash..")")
				end	
			end
		end

		local grp = dbqueryresult[1]["usergroup"]
		if grp > 1 then
			local fractionSkin = dbqueryresult[1]["fraction_skin"]
			-- Set Fraction Skin
			if fractionSkin == 0 then
				local currentSkn = dbqueryresult[1]["skin"]
				if hasValueInTable(currentSkn, playerGroups[grp][2][race][gender]) then
					dbExec(db, "UPDATE users SET fraction_skin=? WHERE name=?", currentSkn, sHash)
					setPedSkin(source, currentSkn)
				else
					local newSkn = playerGroups[grp][2][race][gender][math.random(table.getn(playerGroups[grp][2][race][gender])-1)+1]
					dbExec(db, "UPDATE users SET fraction_skin=?, skin=? WHERE name=?", newSkn, skin, sHash)
					setPedSkin(source, newSkn)
				end
			else
				dbExec(db, "UPDATE users SET skin=? WHERE name=?", fractionSkin, sHash)
				setPedSkin(source, fractionSkin)
			end
		end
		------------------
		
		for i=1,12 do
			weapons[i] = { dbqueryresult[1][string.format("w%d", i)], dbqueryresult[1][string.format("w%dammo", i)] }
		end
		
		if(dbqueryresult[1]["wantedLevel"] > 0) then
			attachActionToElement(defaultActions[134], source)
			attachActionToElement(defaultActions[116], source)
		end
		
		if(pTeam ~= clanDefault) then
			clanPlayerInfoUpdate(pTeam)
		end
		
		local loadedInvSlots = {}
		local invSlotNum = dbqueryresult[1]["invSlotNum"]
		local tmpqueryres = dbqueryresult[1]
		local slotInfo = inventoryGetSlots(getPlayerName(source))
		setElementData(source, "invSlotNum", invSlotNum, false)
		
		for i=1,invSlotNum do
			if slotInfo[i] then
				table.insert(loadedInvSlots, { slotInfo[i], 1 })
			else
				table.insert(loadedInvSlots, { 0, 0 })
			end
		end
		
		triggerEvent("onWorkSendClientInfo", source)
		triggerClientEvent(source, "onProcessUserData", source, tmpqueryres, loadedInvSlots, weatherSequence[weatherCurId][1], nil, trainElements, trainRoutes, invSlotNum, jobTaxiLocations, bots, pickupTextArray)
		checkMoney(source)
		checkPlayerGroup(source)
		dbqueryresult[1]["usergroup"] = getElementData(source, "usergroup")
		local fId, pId = fractionGetPlayerFraction(source)
		
		if fId then
			local rankName
			if(pId == 0) then
				rankName = "Лидер"
			else
				rankName = fractionGetRankName(fId, fractionGetPlayerRank(fId, pId))
			end
			setElementData(source, "usergroupname", fractions[fId][1].." - "..rankName)
			fractionUpdate(fId, true, true)
		else
			setElementData(source, "usergroupname", playerGroups[dbqueryresult[1]["usergroup"]][1])
		end
		
		if(getElementData(source, "arrested") > 0) or (fId and spawnOutside) then
			spawnPlayerEx(source)
		elseif spawnOutside then
			setTimer(setPlayerGreenZone, 500, 1, source)
		end
		
		_give_weapon(source, weapons[0][1], weapons[0][2], false, true)
		
		for i=1,12 do
			giveWeapon(source, weapons[i][1], weapons[i][2], false, true)
		end
		
		setElementHealth(source, sphealth)
		setPedArmor(source, sparmor)
		setElementGhostMode(source, 3000)
		setPlayerMoney(source, money, true)
		setCameraTarget(source, source)
		setPlayerWantedLevel(source, wantedLvl)
		triggerClientEvent(source, "onJobFoodUpdate", source, jobFoodClientInfo)
		clanBaseGeneratorUpdateForClient(nil, source)
		clanBaseAlarmUpdateForClient(nil, source)
		
		if(getElementData(source, "muted") > 0) then
		    setPlayerMuted(source, true)
			exports.voice:setPlayerVoiceMuted(source, true)
		end
		
		if isPlayerFromPolice(source) then
			for zoneIndex,zoneInfo in ipairs(criminalActivityZones) do
				if zoneInfo[1] then
					criminalActivitySendInfo(zoneIndex, true, source)
				end
			end
		end
		
		for eId,eInfo in pairs(specialEvents) do
			if(getPlayerName(source) == eInfo[1]) and(specialEvents[eId][3] < 2) then
				triggerClientEvent(source, "onSpecialEventCreate", resourceRoot, { eId, {} })
				setTimer(specialEventUpdateInfo, 1000, 1, eId)
				break
			end
		end
		
		setTimer(specialEventLoadPlayer, 1500, 1, source, true)
		
		--[[if firstTime then
			triggerEvent("onMissionStart", resourceRoot, source, "mis_tutorial")
		end]]
		
		if isAdmin(source) or isModerator(source) then
			dbExec(db, "UPDATE users SET jetpack=1000 WHERE name=?", sHash)
		end
		
		attachActionToSelf(defaultActions[86], source)
		attachActionToSelf(defaultActions[63], source)
		attachActionToSelf(defaultActions[64], source)
		attachActionToSelf(defaultActions[81], source)
		attachActionToSelf(defaultActions[82], source)
		attachActionToSelf(defaultActions[129], source)
		attachActionToSelf(defaultActions[74], source)
		attachActionToSelf(defaultActions[25], source)
		attachActionToSelf(defaultActions[26], source)
		attachActionToSelf(defaultActions[27], source)
		attachActionToSelf(defaultActions[66], source)
		attachActionToSelf(defaultActions[67], source)
		attachActionToSelf(defaultActions[77], source)
		attachActionToSelf(defaultActions[105], source)
		attachActionToSelf(defaultActions[8], source)
		attachActionToSelf(defaultActions[28], source)
		attachActionToSelf(defaultActions[52], source)
		attachActionToSelf(defaultActions[135], source)
		attachActionToSelf(defaultActions[109], source)
		attachActionToSelf(defaultActions[56], source)
		attachActionToSelf(defaultActions[71], source)
		attachActionToSelf(defaultActions[123], source)
	end
	
	dbQuery(requestUserData4, {source}, db, "SELECT friend FROM friends WHERE player = ?", sHash)
end

function requestUserData4(dbq, source)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	triggerClientEvent(source, "onFriendsLoad", source, dbqueryresult)
end

function insertFaceIntoArray(imageData, err, plr)
	if(err == 0) then
		loadedFaces[plr] = imageData
	else
		loadedFaces[plr] = "EMPTY"
	end
end

function playerLoadFace(plr)
	if loadedFaces[plr] and(loadedFaces[plr] ~= true) then
		triggerClientEvent(source, "onPlayerReceiveFace", source, loadedFaces[plr], plr)
	else
		triggerClientEvent(source, "onPlayerReceiveFace", source, nil, plr)
	end
end

local ma69X, ma69Y, ma69Z = 211.88176, 1811.16797, 20.86719
local malvaX, malvaY, malvaZ = 2564.28418, 2805.77222, 9.82031
local masfaX, masfaY, masfaZ = -1296.07275, 489.53729, 10.19531
local malsaX, malsaY, malsaZ = 2131.75562, -2283.37012, 19.67188
local markerRadius = 1.5
local markera69 = createMarker(ma69X, ma69Y, ma69Z, "cylinder", markerRadius, 255, 0, 0, 64)
local markerlva = createMarker(malvaX, malvaY, malvaZ, "cylinder", markerRadius, 255, 0, 0, 64)
local markersfa = createMarker(masfaX, masfaY, masfaZ, "cylinder", markerRadius, 255, 0, 0, 64)
local markerlsa = createMarker(malsaX, malsaY, malsaZ, "cylinder", markerRadius, 255, 0, 0, 64)
setPickupText(markera69, "Тревога", 255, 0, 0)
setPickupText(markerlva, "Тревога", 255, 0, 0)
setPickupText(markersfa, "Тревога", 255, 0, 0)
setPickupText(markerlsa, "Тревога", 255, 0, 0)

function requestActionsList(aplr)
	if(source == resourceRoot) and(aplr == client) then
		local alist = {}
		local pupx, pupy, pupz
		local ownedveh = getElementData(aplr, "vehicle")
		local shash = getHash(getPlayerName(aplr))
		local respect = getElementData(aplr, "respect")
		local boombox = getElementData(aplr, "boombox")
		local aplrGrp = getElementData(aplr, "usergroup")
		local rcVeh = getElementData(aplr, "RC")
		local players = getNearbyElementsByType(aplr, "player", nearbyPlayersRadius)
		local playersInCar = getNearbyElementsByType(aplr, "player", 5.0)
		local lowrider = getElementData(aplr, "lowrider")
		local allVehicles = getNearbyElementsByType(aplr, "vehicle", nearbyVehiclesRadius)
		local peds = getNearbyElementsByType(aplr, "ped", nearbyPlayersRadius)
		local objs = getNearbyElementsByType(aplr, "object", nearbyPlayersRadius)
		local clan = getPlayerClan(aplr)
		local fId = fractionGetPlayerFraction(aplr)
		local pHelper = isHelper(aplr)
		local pAdmin = isAdmin(aplr)
		local pModerator = isModerator(aplr)
		local dbuserinfo
		
		repeat
			local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", shash)
			dbuserinfo = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbuserinfo
		
		repeat
			local dbq = dbQuery(db, "SELECT id, donateid, donatesum FROM donate WHERE player=? AND donateactiv=0 AND donatestate='pay' AND donatemsg IS NULL", shash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		-- Новые действия
		local aAction, aplrseat
		local pint = getElementInterior(aplr)
		local pdim = getElementDimension(aplr)
		local px, py, pz = getElementPosition(aplr)
		local aplrveh = getPedOccupiedVehicle(aplr)
		if aplrveh then
			aplrseat = getPedOccupiedVehicleSeat(aplr)
		end
		local newActions = getLocalActions(aplr, pint, pdim, px, py, pz)
		
		for aNumber,aInfo in ipairs(newActions) do
			aAction = playerActions[aInfo]
			if(aAction["outsideVehicle"] and not aplrveh)
			
			or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
			                                           or (not aAction["forPassengers"])) then
				table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"] }, aAction["functionInputs"], 0, 255, 0 })
			end
		end
		
		for _,elem in ipairs(players) do
			newActions = getElementActions(aplr, elem)
			for aNumber,aInfo in ipairs(newActions) do
				aAction = playerActions[aInfo]
				if(aAction["outsideVehicle"] and not aplrveh)
				
				or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
														   or (not aAction["forPassengers"])) then
					table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"], elem }, aAction["functionInputs"], 0, 255, 0 })
				end
			end
		end
		
		for _,elem in ipairs(allVehicles) do
			newActions = getElementActions(aplr, elem)
			for aNumber,aInfo in ipairs(newActions) do
				aAction = playerActions[aInfo]
				if(aAction["outsideVehicle"] and not aplrveh)
				
				or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
														   or (not aAction["forPassengers"])) then
					table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"], elem }, aAction["functionInputs"], 0, 255, 0 })
				end
			end
		end
		
		for _,elem in ipairs(peds) do
			newActions = getElementActions(aplr, elem)
			for aNumber,aInfo in ipairs(newActions) do
				aAction = playerActions[aInfo]
				if(aAction["outsideVehicle"] and not aplrveh)
				
				or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
														   or (not aAction["forPassengers"])) then
					table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"], elem }, aAction["functionInputs"], 0, 255, 0 })
				end
			end
		end
		
		for _,elem in ipairs(objs) do
			newActions = getElementActions(aplr, elem)
			for aNumber,aInfo in ipairs(newActions) do
				aAction = playerActions[aInfo]
				if(aAction["outsideVehicle"] and not aplrveh)
				or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
														   or (not aAction["forPassengers"])) then
					table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"], elem }, aAction["functionInputs"], 0, 255, 0 })
				end
			end
		end
		local newActions = getSelfActions(aplr)
		
		for aNumber,aInfo in ipairs(newActions) do
			aAction = playerActions[aInfo]
			if(aAction["outsideVehicle"] and not aplrveh)
			
			or(aAction["insideVehicle"] and aplrveh and(aAction["forPassengers"] and(aplrseat == 0))
			                                           or (not aAction["forPassengers"])) then
				table.insert(alist, { 135, aAction["name"], { aAction["functionSource"], aAction["function"] }, aAction["functionInputs"], 0, 255, 0 })
			end
		end
		-- END OF Новые действия
		
		if isElementWithinMarker(aplr, markera69) then		
		    table.insert(alist, { 144, availableActions[136], {}, nil, 0, 255, 0 } )
		    table.insert(alist, { 148, availableActions[137], {}, nil, 0, 255, 0 } )
		elseif isElementWithinMarker(aplr, markerlva) then		
		    table.insert(alist, { 145, availableActions[136], {}, nil, 0, 255, 0 } )
		    table.insert(alist, { 149, availableActions[137], {}, nil, 0, 255, 0 } )
	    elseif isElementWithinMarker(aplr, markersfa) then		
		    table.insert(alist, { 146, availableActions[136], {}, nil, 0, 255, 0 } )
		    table.insert(alist, { 150, availableActions[137], {}, nil, 0, 255, 0 } )
		elseif isElementWithinMarker(aplr, markerlsa) then		
		    table.insert(alist, { 147, availableActions[136], {}, nil, 0, 255, 0 } )
		    table.insert(alist, { 151, availableActions[137], {}, nil, 0, 255, 0 } )
		end
		
		table.insert(alist, { 81, availableActions[81], { dbqueryresult }, nil, 255, 255, 255 })
		table.insert(alist, { 64, availableActions[64], {}, nil, 255, 255, 255 })
		
		if isPlayerFromPolice(aplr) then
			table.insert(alist, { 63, availableActions[63], {}, nil, 0, 255, 0 })
			table.insert(alist, { 129, availableActions[129], {}, { "Имя", "Кол-во звезд", "Причина" }, 0, 255, 0 })
			table.insert(alist, { 74, availableActions[74], {}, nil, 0, 255, 0 })
			
			for _,plr in ipairs(players) do
				if(getPlayerWantedLevel(plr) > 0) then
					table.insert(alist, { 116, availableActions[116]..getPlayerName(plr).."($"..tostring(buyoutPrice).." x 1 звезда)", { plr }, nil, 0, 255, 0 })
				end
				table.insert(alist, { 134, availableActions[134]..getPlayerName(plr), { plr }, nil, 0, 255, 0 })
			end
		end
		
		table.insert(alist, { 82, availableActions[82], {}, nil, 255, 255, 255 })
		if lowrider then
			table.insert(alist, { 59, availableActions[59], { lowrider }, nil, 0, 255, 0 })
		else
			for key,lowriderMarker in ipairs(lowriderMarkers) do
				if lowriderMarker[15] then
					for _,plr in ipairs(players) do
						if(plr == lowriderMarker[13][1]) or (plr == lowriderMarker[13][2]) then
							table.insert(alist, { 73, string.format("%s %s", availableActions[73], getPlayerName(plr)), { key, plr }, { "Ставка" }, 0, 255, 0 })
						end
					end
				else
					if isElementWithinMarker(aplr, lowriderMarker[4]) then
						table.insert(alist, { 58, availableActions[58], { key }, nil, 0, 255, 0 })
					end
				end
			end
		end
		table.insert(alist, { 25, availableActions[25], {}, nil, 255, 255, 255 })
		table.insert(alist, { 26, availableActions[26], {}, nil, 255, 255, 255 })
		table.insert(alist, { 27, availableActions[27], {}, { "Ваше обращение" }, 255, 255, 255 })
		table.insert(alist, { 66, availableActions[66], {}, nil, 255, 255, 255 })
		table.insert(alist, { 67, availableActions[67], {}, nil, 255, 255, 255 })
		--[[
		if(dbuserinfo[1]["customWalk"] == 1) then
			table.insert(alist, { 79, availableActions[79], {}, nil, 255, 255, 255 })
		end
		if(dbuserinfo[1]["customFight"] == 1) then
			table.insert(alist, { 80, availableActions[80], {}, nil, 255, 255, 255 })
		end
		]]
		
		if(not dbuserinfo[1]["face"]) or (dbuserinfo[1]["face"] == "EMPTY") then
			table.insert(alist, { 114, availableActions[114], {}, { "PNG 256x256" }, 255, 255, 255 })
		else
			table.insert(alist, { 115, availableActions[115], {}, nil, 255, 255, 255 })
		end
		
		if(aplrveh) then
			if(aplrveh == ownedveh) then
				for _,carTuneCp in ipairs(carTuneCps) do
					if(isElementWithinMarker(aplrveh, carTuneCp[5])) then
						table.insert(alist, { 108, availableActions[108], { carTuneCp[5] }, nil, 0, 255, 0 })
					end
				end
				
				if availableRace and(not availableRace[2]) and isElementWithinMarker(aplrveh, availableRace[5]) then
					table.insert(alist, { 19, availableActions[19], {}, nil, 0, 255, 0 })
				end
				
				for _,carSellSellCp in ipairs(carSellSellCps) do
					if(isElementWithinMarker(aplrveh, carSellSellCp[4])) then
						local price = getVehiclePrice(getElementModel(aplrveh))* (getElementData(aplrveh, "hp")/1000)*0.25
						table.insert(alist, { 13, string.format("%s($%d)", availableActions[13], price), { aplrveh, price }, nil, 0, 255, 0 })
					end
				end
				
				if getElementData(aplrveh, "flyAbility") then
					if getElementData(aplrveh, "flyToggle") then
						table.insert(alist, { 75, availableActions[75], {}, nil, 0, 255, 0 })
					else
						table.insert(alist, { 76, availableActions[76], {}, nil, 0, 255, 0 })
					end
				end
			
			elseif isElement(rcVeh) then
				table.insert(alist, { 68, availableActions[68], {}, nil, 0, 255, 0 })
			end
		else
			if gangsterStealPlayers[aplr] then
				for objId,obj in ipairs(gangsterStealPlayers[aplr][4]) do
					if obj then
						local itemMdl = getElementModel(obj)
						local itemId = nil
						
						for curItemId,itemInfo in ipairs(inventoryItemNames) do
							if(itemInfo[3] == itemMdl) then
								itemId = curItemId
								break
							end
						end
						
						if itemId and gangsterStealIdObjs[itemId] then
							if(pint == getElementInterior(obj)) and(pdim == getElementDimension(obj)) then
								local ix, iy, iz = getElementPosition(obj)
								
								if(getDistanceBetweenPoints3D(ix,iy,iz,px,py,pz) <= nearbyPickupsRadius) then
									table.insert(alist, { 130, availableActions[130]..string.match(inventoryItemNames[itemId][1], "(.*)"), { objId }, nil, 0, 255, 0 })
								end
							end
						end
					end
				end
				
				for objId,objInfo in ipairs(gangsterStealPlayers[aplr][5]) do
					if objInfo[2] then
						local itemName = gangsterStealIdContainers[getElementModel(objInfo[1])]
						if itemName and(pint == getElementInterior(objInfo[1])) and(pdim == getElementDimension(objInfo[1])) then
							local ix, iy, iz = getElementPosition(objInfo[1])
							
							if(getDistanceBetweenPoints3D(ix,iy,iz,px,py,pz) <= nearbyPickupsRadius) then
								table.insert(alist, { 131, availableActions[131]..itemName, { objId }, nil, 0, 255, 0 })
							end
						end
					end
				end
			end
			
			for cntl,_ in pairs(groupGateControls) do
				local cx, cy, cz = getElementPosition(cntl)
				if isElementWithinMarker(aplr, cntl) then
					table.insert(alist, { 113, availableActions[113], { cntl }, nil, 0, 255, 0 })
				end
			end
			
			local curvehMdl
			
			for _,curveh in ipairs(allVehicles) do
				if isElement(curveh) then
					curvehMdl = getElementModel(curveh)
					
					if(curveh == ownedveh) then
						for _,curPlr in ipairs(players) do
							table.insert(alist, { 127, availableActions[127].." "..getPlayerName(curPlr), { curveh, curPlr }, { "Цена" }, 0, 255, 0 })
						end
					end
					
					if((curveh == ownedveh) or (isPlayerFromPolice(aplr))) and(getElementData(curveh, "owner") or (curvehMdl == 427) or (curvehMdl == 528) or (curvehMdl == 523) or (curvehMdl == 596) or (curvehMdl == 597) or (curvehMdl == 598) or (curvehMdl == 599) or (curvehMdl == 601) or (curvehMdl == 497) or (curvehMdl == 433) or (curvehMdl == 530) or (curvehMdl == 470)) and(getElementHealth(curveh) > 0.0) and(getVehicleType(curveh) == "Automobile") then
						local trunkState = getVehicleDoorState(curveh, 1)
						
						if((trunkState == 0) or (trunkState == 2)) then
							local openRatio = getVehicleDoorOpenRatio(curveh, 1)
							
							if(openRatio > 0.0) then
								table.insert(alist, { 61, availableActions[61], { curveh }, nil, 0, 255, 0 })
								local vehTrunk = inventoryGetItemsInTrunk(curveh)
								
								for _,itemInfo in ipairs(vehTrunk) do
									table.insert(alist, { 62, string.format("%s %s", availableActions[62], inventoryItemNames[itemInfo[2]][1]), { curveh, itemInfo[1] }, nil, 0, 255, 0 })
								end
								
							else
								table.insert(alist, { 60, availableActions[60], { curveh }, nil, 0, 255, 0 })
							end
							
						else
							local vehTrunk = inventoryGetItemsInTrunk(curveh)
							
							for _,itemInfo in ipairs(vehTrunk) do
								table.insert(alist, { 62, string.format("%s %s", availableActions[62], inventoryItemNames[itemInfo[2]][1]), { curveh, itemInfo[1] }, nil, 0, 255, 0 })
							end
							
						end
					end
				end
			end
			--[[
			if boombox then
				table.insert(alist, { 20, availableActions[20], {}, nil, 255, 255, 255 })
				table.insert(alist, { 21, availableActions[21], {}, nil, 255, 255, 255 })
			end
			]]
			local jetpackFuel = getElementData(aplr, "jetpackFuel")
			
			if doesPedHaveJetPack(aplr) then
				table.insert(alist, { 78, availableActions[78], {}, nil, 255, 255, 255 })
			elseif(jetpackFuel > 0.0) then
				table.insert(alist, { 77, availableActions[77], {}, nil, 255, 255, 255 })
			end
			
			local tutid, foodSelId, queryPed
			
			for key,bot in ipairs(peds) do
				tutid = getElementData(bot, "tutorial")
				foodSelId = getElementData(bot, "foodseller")
				queryPed = getElementData(bot, "query")
				
				if tutid then
					table.insert(alist, { 50, availableActions[50].." '"..tutorialArray[tutid][1].."'", { tutorialArray[tutid][1], tutorialArray[tutid][2] }, nil, 0, 255, 0 })
				
				elseif foodSelId then
					local foodArray = outsideFoodSellers[foodSelId][5]
					
					for _,foodId in ipairs(foodArray) do
						table.insert(alist, { 10006, string.format("Купить %s($%d)", inventoryItemNames[foodId][1], inventoryItemNames[foodId][2]), { foodId, inventoryItemNames[foodId][2] }, nil, 0, 255, 0 })
					end	
				
				elseif queryPed then
					table.insert(alist, { 104, availableActions[104], {}, nil, 0, 255, 0 })
				end
				
			end
			
			for obj,objInfo in pairs(objsForSale) do
				if isElement(obj) and(pint == getElementInterior(obj)) and(pdim == getElementDimension(obj)) then
					pupx, pupy, pupz = getElementPosition(obj)
					
					if(getDistanceBetweenPoints3D(px,py,pz,pupx,pupy,pupz) < nearbyPickupsRadius) then
						local objName, actionName
						
						if(objInfo[1] > 400) and(objInfo[1] < 447) then
							objName = getWeaponNameFromID(objInfo[1]-400)
						else
							objName = inventoryItemNames[objInfo[1]][1]
						end
						
						if(objInfo[2] > 0) then
							actionName = "Магазин - Купить %s($%d)"
						else
							actionName = "Предмет - Подобрать %s"
						end
						
						table.insert(alist, { 10006, string.format(actionName, objName, objInfo[2]), { objInfo[1], objInfo[2] }, nil, 0, 255, 0 })
					end
				end
			end
			
			for derbyid,cp in ipairs(derbyStartMarkers) do
				if isElementWithinMarker(aplr, cp[4]) and isElementVisibleTo(cp[4], root) then
					table.insert(alist, { 70, availableActions[70], { derbyid }, nil, 0, 255, 0 })
				end
			end
			
			for obj,objInfo in pairs(spawnedFurniture) do
				if isElement(obj) and(getElementInterior(obj) == pint) and(getElementDimension(obj) == pdim) then
					pupx, pupy, pupz = getElementPosition(obj)
					if(getDistanceBetweenPoints3D(px,py,pz,pupx,pupy,pupz) < nearbyPickupsRadius) then
						table.insert(alist, { 140, "Предмет - Подобрать "..inventoryItemNames[objInfo[2]][1], { obj }, nil, 0, 255, 0 })
					end
				end
			end
			
			for mId,mInfo in ipairs(gangsterStealCarSellMarkers) do
				if isElement(mInfo[5]) and isElementWithinMarker(aplr, mInfo[5]) then
					table.insert(alist, { 139, "Сбыт краденных авто - Требуемые машины", { mId }, nil, 0, 255, 0 })
				end
			end
			
			for key,foodworker in ipairs(jobWorkers[11]) do
				local fWorker = foodworker[1]
				
				if not (aplr == fWorker) then
					local fVeh = foodworker[3]
					local fx, fy, fz = getElementPosition(fVeh)
					
					if(getDistanceBetweenPoints3D(fx,fy,fz,px,py,pz) <= nearbyVehiclesRadius) then
						local fArray = foodworker[4]
						for _,foodId in ipairs(fArray) do
							table.insert(alist, { 69, string.format("%s %s($%d)", availableActions[69], inventoryItemNames[foodId][1], inventoryItemNames[foodId][2]), { key, fWorker, fVeh, foodId, inventoryItemNames[foodId][2] }, nil, 0, 255, 0 })
						end
					end
				end
				
			end
			
			local inCabin = false
			
			for _,cabin in ipairs(ferrisWheelCabins) do
				if(cabin[3] == aplr) then
					table.insert(alist, { 31, availableActions[31], {}, nil, 0, 255, 0 })
					inCabin = true
					break
				end
			end
			
			if not inCabin then
				for key,cabin in ipairs(ferrisWheelCabins) do
					pupx, pupy, pupz = getElementPosition(cabin[1])
					
					if(getDistanceBetweenPoints3D(px,py,pz,pupx,pupy,pupz) < 4.0) then
						table.insert(alist, { 30, string.format("%s($%d)", availableActions[30], ferrisWheelPrice), { key }, nil, 0, 255, 0 })
						break
					end
				end
			end
			
			for key,weaponIssuance in ipairs(weaponIssuances) do
				for _,curWeaponIssuance in ipairs(weaponIssuance[6]) do
					if(getElementInterior(curWeaponIssuance) == pint) and(getElementDimension(curWeaponIssuance) == pdim) and isElementWithinMarker(aplr, curWeaponIssuance) then
						table.insert(alist, { 46, availableActions[46], { key }, nil, 0, 255, 0 })
					end
				end
			end
			
			for key,militaryCargo in ipairs(militaryCargoInfo) do
				pupx, pupy, pupz = getElementPosition(militaryCargo[17])
				if(getDistanceBetweenPoints3D(px,py,pz,pupx,pupy,pupz) < 4.0) then
					if aplrGrp and((aplrGrp == 5) or (aplrGrp == 14) or (aplrGrp == 2)) then
						table.insert(alist, { 45, availableActions[45], { key }, nil, 0, 255, 0 })
					else
						table.insert(alist, { 44, availableActions[44], { key }, nil, 0, 255, 0 })
					end
					break
				end
			end
			
			local plrIsInGrp
			
			for i,workStartMarker in ipairs(workStartMarkers) do
				if(isElementWithinMarker(aplr, workStartMarker[5])) then
					local markerGroup = workStartMarker[1]
					plrIsInGrp = (markerGroup == aplrGrp)
					
					if plrIsInGrp then
						table.insert(alist, { 23, string.format("%s'%s'", availableActions[23], playerGroups[aplrGrp][1]), {}, nil, 0, 255, 0 })
					else
						table.insert(alist, { 22, string.format("%s'%s'", availableActions[22], playerGroups[markerGroup][1]), { markerGroup }, nil, 0, 255, 0 })
					end
					
					--[[
					if(markerGroup == 4) then
						table.insert(alist, { 47, string.format("%s($%d)", availableActions[47], hospitalHealthPrice), { i }, nil, 0, 255, 0 })
					elseif(markerGroup == 2) and(getPlayerWantedLevel(aplr) > 0) then
						table.insert(alist, { 57, string.format("%s($%d x 1 звезда)", availableActions[57], buyoutPrice), {}, nil, 0, 255, 0 })
					end
					]]
				end			
			end
			
			for i,HealthMarker in ipairs(HealthMarkers) do -- лечение в больнице с помощью маркера с ботом
				if(isElementWithinMarker(aplr, HealthMarker[5])) then		
					table.insert(alist, { 47, string.format("%s ($%d)", availableActions[47], hospitalHealthPrice), { i }, nil, 0, 255, 0 } )
				end
            end
			
			for _,fuelStation in ipairs(fuelStations) do
				if(isElementWithinMarker(aplr, fuelStation[4])) then
					table.insert(alist, { 16, string.format("%s($%d)", availableActions[16], fuelPrice/10+10), {}, nil, 0, 255, 0 })
					
					if(aplrGrp == 10) then
						table.insert(alist, { 10006, string.format("Купить %s($%d)", getWeaponNameFromID(18), 10), { 418, 10 }, nil, 0, 255, 0 })
					end
				end
			end
			
			for key,droppedItem in ipairs(inventoryDroppedItems) do
				if isElement(droppedItem[1]) and(getElementDimension(droppedItem[1]) == getElementDimension(aplr)) and((getElementInterior(droppedItem[1]) == getElementInterior(aplr))) then
					pupx, pupy, pupz = getElementPosition(droppedItem[1])
					
					if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) < nearbyPickupsRadius) then
						local itemName = inventoryItemNames[droppedItem[3]][1]
						table.insert(alist, { 15, string.format("%s %s", availableActions[15], itemName), { key, droppedItem[3] }, nil, 0, 255, 0 })
					end
				end
			end
			
			table.insert(alist, { 105, availableActions[105], {}, { "Кол-во" }, 255, 255, 255 })
			
			for droppedWeap,timerDest in pairs(weaponsDropped) do
				if timerDest and isElement(droppedWeap) and(getElementDimension(droppedWeap) == getElementDimension(aplr)) and((getElementInterior(droppedWeap) == getElementInterior(aplr))) then
					pupx, pupy, pupz = getElementPosition(droppedWeap)
					
					if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) < nearbyPickupsRadius) then
						local weapName = getWeaponNameFromID(getPickupWeapon(droppedWeap))
						table.insert(alist, { 106, availableActions[106]..weapName, { droppedWeap }, nil, 0, 255, 0 })
					end
				end
			end
			for key,ammuShop in ipairs(ammuShops) do
				local pupx, pupy, pupz = getElementPosition(ammuShop[6])
				
				if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) < nearbyPickupsRadius) then
					table.insert(alist, { 17, availableActions[17], { key }, nil, 0, 255, 0 })
					
					if(ammuBusinessPrice > 0) then
						if(ammuShop[9] == shash) then
							table.insert(alist, { 4, availableActions[4].."($"..ammuBusinessPrice..")", { key, 2 }, nil, 0, 255, 0 })
							table.insert(alist, { 41, availableActions[41].."($"..ammuShop[8]..")", { key, 2 }, nil, 0, 255, 0 })
						else
							table.insert(alist, { 3, availableActions[3].."($"..ammuBusinessPrice..")", { key, 2 }, nil, 0, 255, 0 })
						end
					end
				end			
			end
			
			for key,eatLocation in ipairs(eatLocations) do
				local pupx, pupy, pupz = getElementPosition(eatLocation[6])
				--and(eatTypes[eatLocation[1]][14] > 0)
				
				if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) < nearbyPickupsRadius) then
					table.insert(alist, { 18, string.format("%s%s", availableActions[18], eatTypes[eatLocation[1]][2]), { key }, nil, 0, 255, 0 })
					
					if(eatTypes[eatLocation[1]][14] > 0) then
						if(eatLocation[9] == shash) then
							table.insert(alist, { 4, availableActions[4].."($"..eatTypes[eatLocation[1]][14]..")", { key, 1 }, nil, 0, 255, 0 })
							table.insert(alist, { 41, availableActions[41].."($"..eatLocation[8]..")", { key, 1 }, nil, 0, 255, 0 })
						else
							table.insert(alist, { 3, availableActions[3].."($"..eatTypes[eatLocation[1]][14]..")", { key, 1 }, nil, 0, 255, 0 })
						end
					end
				end				
			end
			
			for key,otbLocation in ipairs(otbLocations) do
				local pupx, pupy, pupz = getElementPosition(otbLocation[6])
				
				if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) < 2.0) then
					table.insert(alist, { 42, availableActions[42], { key }, nil, 0, 255, 0 })
				end	
				
				if isElementWithinMarker(aplr, otbLocation[8]) and(getElementInterior(otbLocation[8]) == getElementInterior(aplr)) and(getElementDimension(otbLocation[8]) == getElementDimension(aplr)) then
					table.insert(alist, { 48, string.format("%s($%d)", availableActions[48], otbPrice), {}, nil, 0, 255, 0 })
				end
			end
			
			i = 0
			
			for key,house in pairs(houses) do
				i = i + 1
				pupx, pupy, pupz = getElementPosition(house[4])
				if(getDistanceBetweenPoints3D(px, py, pz, pupx, pupy, pupz) < nearbyPickupsRadius) then
					if(getHash(getPlayerName(aplr)) == house[11]) then
						for _,curPlr in ipairs(players) do
							table.insert(alist, { 128, availableActions[128].." "..getPlayerName(curPlr), { key, curPlr }, { "Цена" }, 0, 255, 0 })
						end
						
						table.insert(alist, { 143, string.format("%s($%d)", availableActions[2], math.floor(house[3]/2)), { key }, nil, 0, 255, 0 })
						table.insert(alist, { 14, availableActions[14], { key, i }, nil, 0, 255, 0 })
						table.insert(alist, { 29, availableActions[29], { house[1] }, nil, 0, 255, 0 })
						
						repeat
							local dbq = dbQuery(db, "SELECT * FROM cars WHERE owner=?", getHash(getPlayerName(aplr)))
							dbqueryresult = dbPoll(dbq, 30000)
							dbFree(dbq)
						until dbqueryresult
						
						local colorName
						
						for _, row in ipairs(dbqueryresult) do
							if(row["paintjob"] == 3) then
								colorName = getColorName(row["clrr1"], row["clrg1"], row["clrb1"])
							else
								colorName = "Спец."
							end
							if(getVehicleType(row["carid"]) ~= "Boat") then
								table.insert(alist, { 12, string.format("%s %s(%s)", availableActions[12], getVehicleNameFromModel(row["carid"]), colorName), { key, row }, nil, 0, 255, 0 })
							end
						end
						
					elseif(house[11] == 0) then
						table.insert(alist, { 142, string.format("%s($%d)", availableActions[1], house[3]), { key }, nil, 0, 255, 0 })
					end
					
				end
			end
			
			for key,pos in ipairs(vehCommonSpawnPos) do
				if isElementWithinMarker(aplr, pos[6]) then
					repeat
						local dbq = dbQuery(db, "SELECT * FROM cars WHERE owner=?", shash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult

					local colorName, vehmdl, curvehtype, vehtype
					
					if(pos[7] == "boat") then
						curvehtype = "Boat"

					elseif(pos[7] == "plane") then
						curvehtype = "Plane"

					elseif(pos[7] == "heli") then
						curvehtype = "Helicopter"

					else
						curvehtype = nil
					end

					for _,row in ipairs(dbqueryresult) do
						vehmdl = row["carid"]
						
						if(vehmdl == 460) then
							vehtype = "Boat"
						else
							vehtype = getVehicleType(vehmdl)
						end

						if((not (vehtype == "Boat")) and (not (vehtype == "Plane")) and (not (vehtype == "Helicopter")) and (curvehtype == nil)) or ((vehtype == curvehtype) and ((vehtype == "Boat") or (vehtype == "Helicopter") or (vehtype == "Plane"))) then
							if(row["paintjob"] == 3) then
								colorName = getColorName(row["clrr1"], row["clrg1"], row["clrb1"])
							else
								colorName = "Спец."
							end
							table.insert(alist, { 12, string.format("%s %s(%s)($%d)", availableActions[12], getVehicleNameFromModel(vehmdl), colorName, vehCommonSpawnPrice), { 0, row, key }, nil, 0, 255, 0 })
						end
					end
					
					break
				end
			end
			
			if(dbuserinfo[1]["carSpawns"] > 0) and(pint == 0) and(pdim == 0) then
				repeat
					local dbq = dbQuery(db, "SELECT * FROM cars WHERE owner=?", shash)
					dbqueryresult = dbPoll(dbq, 30000)
					dbFree(dbq)
				until dbqueryresult
				
				local colorName, vehmdl
				
				for _, row in ipairs(dbqueryresult) do
					vehmdl = row["carid"]
					
					if(row["paintjob"] == 3) then
						colorName = getColorName(row["clrr1"], row["clrg1"], row["clrb1"])
					else
						colorName = "Спец."
					end
					
					table.insert(alist, { 12, string.format("%s %s(%s)(За один спаун)", availableActions[12], getVehicleNameFromModel(vehmdl), colorName), { -1, row }, nil, 255, 255, 255 })
				end
			end
			
			for key,sellCar in ipairs(carSellAvailableCars) do
				if not (sellCar == nil) then
					pupx, pupy, pupz = getElementPosition(sellCar[1])
					if(getDistanceBetweenPoints3D(px, py, pz, pupx, pupy, pupz) < 5.0) then
						table.insert(alist, { 11, string.format("%s %s %s($%d)", availableActions[11], sellCar[6], sellCar[2], sellCar[3]), { key, getElementModel(sellCar[1]) }, nil, 0, 255, 0 })
					end
				end
			end
			
		end
		
		if fId and(aplrGrp == 4) and(fractionIsPlayerInsideFractionInterior(aplr, fId) or (aplrveh and(getElementModel(aplrveh) == 416 or getElementModel(aplrveh) == 563))) then
			for _,orderer in ipairs(players) do
				if(not aplrveh) or (getPedOccupiedVehicle(orderer) == aplrveh) then
					table.insert(alist, { 28, string.format("%s %s($%d)", availableActions[28], getPlayerName(orderer), jobAmbulancePriceForHP), { orderer }, nil, 0, 255, 0 })
				end
			end
		end
		
		if isTestServer() then
			table.insert(alist, { 5, availableActions[5], {}, { "X", "Y", "Z", "Интерьер" }, 255, 255, 0 })
			table.insert(alist, { 6, availableActions[6], {}, { "ID" }, 255, 255, 0 })
		end
		
		local isaplrOnJob = false
		
		for i=1,table.getn(availableJobs) do
			for _,worker in ipairs(jobWorkers[i]) do
				if(worker[1] == aplr) then
					isaplrOnJob = true
					break
				end
			end
			
			if(isaplrOnJob) then
				break
			end
		end
		
		table.insert(alist, { 8, availableActions[8], {}, nil, 255, 255, 255 })
		
		if not (isaplrOnJob) then
			if(isPedInVehicle(aplr)) and(not specialEventGetEventByElement(aplrveh)) then
				local aplrseat = getPedOccupiedVehicleSeat(aplr)
				
				if(aplrseat == 0) then
					local jobFound = false
					
					for key,truck in ipairs(jobTruckerAvailableTrucks) do
						if not (truck == nil) then
							if(aplrveh == truck[1]) then
								table.insert(alist, { 7, string.format("%s '%s'", availableActions[7], availableJobs[5]), { 5 }, nil, 0, 255, 0 })
								jobFound = true
								break
							end
						end
					end
					
					if not jobFound then
						local aplrvehmodel = getElementModel(aplrveh)
						if jobVehicles[aplrvehmodel] then
							local workId = jobVehicles[aplrvehmodel]
							table.insert(alist, { 7, string.format("%s '%s'", availableActions[7], availableJobs[workId]), { workId }, nil, 0, 255, 0 })
						end
					end
					
				end
			end
		else
			local jobFound = false
			for key,worker in ipairs(jobWorkers[4]) do
				if(worker[1] == aplr) then
					jobFound = true
					
					for _,orderer in ipairs(playersInCar) do
						table.insert(alist, { 9, string.format("%s %s($%d)", availableActions[9], getPlayerName(orderer), jobEvacuatorPriceFill), { orderer }, nil, 0, 255, 0 })
						table.insert(alist, { 10, string.format("%s %s($%d)", availableActions[10], getPlayerName(orderer), jobEvacuatorPriceFix), { orderer }, nil, 0, 255, 0 })
					end
					
					break
				end
			end
			
			if not jobFound then
				for key,worker in ipairs(jobWorkers[10]) do
					
					if(worker[1] == aplr) then
						jobFound = true
						table.insert(alist, { 51, availableActions[51], { key }, { "Тариф" }, 0, 255, 0 })
					end
				end
			end
		end
		
		for _,nearbyPlr in ipairs(players) do
			table.insert(alist, { 55, availableActions[55].." "..getPlayerName(nearbyPlr), { nearbyPlr }, { "Количество" }, 0, 255, 0 })
		end
		
		if clan then
			table.insert(alist, { 85, availableActions[85], {}, nil, 255, 255, 255 })
			
			for i,base in ipairs(clanBases) do
				
				if(getDistanceBetweenPoints3D(px, py, pz, base[2], base[3], base[4]) < 2.0) then
					table.insert(alist, { 84, availableActions[84], { i }, nil, 0, 255, 0 })
				end
				
				if(base[25] == clan) then
					if clanBaseControlAvailableForPlayer(i, aplr) then
						table.insert(alist, { 87, availableActions[87], { i }, nil, 0, 255, 0 })
					end
					
					if clanBasePlayerInsideMarker(i, aplr) then
						local genRepairPrice = clanBaseGeneratorGetRepairPrice(i)
						
						if(genRepairPrice > 0) then
							table.insert(alist, { 100, availableActions[100].."($"..tostring(genRepairPrice)..")", { i }, nil, 0, 255, 0 })
						end
						
						local upgradePrice = clanBaseGetUpgradePrice(i)
						
						if(upgradePrice > 0) then
							table.insert(alist, { 101, availableActions[101].."($"..tostring(upgradePrice)..")", { i }, nil, 0, 255, 0 })
						end
						
						local money = clanBaseGetMoney(i)
						table.insert(alist, { 88, availableActions[88].."($"..tostring(money)..")", { i }, { "Количество" }, 0, 255, 0 }) -- Взять деньги со склада базы
						table.insert(alist, { 89, availableActions[89], { i }, { "Количество" }, 0, 255, 0 }) -- Внести деньги на склад базы
						
						local weapons = clanBaseGetWeapons(i)
						
						for _,weap in ipairs(weapons) do
							table.insert(alist, { 91, availableActions[91].." "..getWeaponNameFromID(weap[1]).."("..tostring(weap[2])..")", { i, weap[1] }, { "Количество" }, 0, 255, 0 }) -- Взять со склада базы оружие
						end
						local items = clanBases[i][31]
						
						for _,item in ipairs(items) do
							table.insert(alist, { 94, availableActions[94].." '"..inventoryItemNames[item[1]][1].."'("..tostring(item[2])..")", { i, item[1] }, nil, 0, 255, 0 })
						end
						
						table.insert(alist, { 90, availableActions[90], { i }, { "Количество" }, 0, 255, 0 }) -- Положить текущее оружие на склад базы
						table.insert(alist, { 92, availableActions[92].."($"..clanBaseGetCarPrice(i)..")", { i }, nil, 0, 255, 0 })
						local upgradeCarsPrice = clanBaseGetUpgradeCarsPrice(i)
						
						if upgradeCarsPrice and(clanBaseGetCarsCount(i) > 0) then
							table.insert(alist, { 93, availableActions[93].."($"..upgradeCarsPrice..")", { i }, nil, 0, 255, 0 })
						end
						
						if clanBaseAlarmTurnedOn(i) then
							table.insert(alist, { 98, availableActions[98], { i }, nil, 0, 255, 0 })
						else
							table.insert(alist, { 97, availableActions[97], { i }, nil, 0, 255, 0 })
						end
						
					end
					
					local gx, gy, gz = getElementPosition(base[32])
					
					if(getDistanceBetweenPoints3D(px,py,pz,gx,gy,gz) < nearbyVehiclesRadius) then
						if(base[33] == "on") then
							table.insert(alist, { 96, availableActions[96], { i }, nil, 0, 255, 0 })
						else
							table.insert(alist, { 95, availableActions[95], { i }, nil, 0, 255, 0 })
						end
					end
					
				else
					if isInsideRadarArea(base[35], px, py) and(not isPedDead(aplr)) then
						table.insert(alist, { 99, availableActions[99], { i }, nil, 0, 255, 0 })
					end
				end
			end
		else
			for i,invite in ipairs(clanInvites) do
				if(invite[2] == aplr) then
					local clan = invite[1]
					if isElement(clan) then
						table.insert(alist, { 86, availableActions[86].." "..getTeamName(clan), { i, clan }, nil, 0, 255, 0 })
					end
				end
			end
			
			table.insert(alist, { 83, availableActions[83], {}, { "Название", "Цвет" }, 255, 255, 255 })
		end
		
		table.insert(alist, { 52, availableActions[52], {}, { "Местоположение" }, 255, 255, 255 })
		--table.insert(alist, { 32, availableActions[32], {}, { "Игрок", "Цена" }, 255, 255, 255 })
		table.insert(alist, { 141, availableActions[135], {}, nil, 255, 255, 255 }) -- становление бандитом
		table.insert(alist, { 109, availableActions[109], {}, nil, 255, 255, 255 })
		table.insert(alist, { 56, availableActions[56], {}, { "Игрок", "Причина" }, 255, 255, 0 })
		table.insert(alist, { 71, availableActions[71], {}, { "Вопрос" }, 255, 255, 0 })
		--if(dbuserinfo[1]["assigned"] > 0) then
			--table.insert(alist, { 111, availableActions[111], {}, nil, 255, 255, 0 })
		--else
			--table.insert(alist, { 110, availableActions[110], {}, nil, 255, 255, 0 })
		--end
		local curEvent = specialEventGetEventByElement(aplr)
		
		if curEvent then
			table.insert(alist, { 136, "Мероприятие - Респаун", {}, nil, 0, 255, 0 })
			table.insert(alist, { 137, "Мероприятие - Выйти из состава участников", { curEvent }, nil, 0, 255, 0 })
		else
			for eId,eInfo in pairs(specialEvents) do
				if(eInfo[3] == 0) then
					table.insert(alist, { 123, availableActions[123].."'"..eInfo[2].."'", { eId }, nil, 0, 255, 0 })
				end
			end
		end
		
		if fId then
			table.insert(alist, { 125, availableActions[125], {}, nil, 255, 255, 255 })
		end
		
		if pAdmin or pModerator or pHelper then
			table.insert(alist, { 72, availableActions[72], {}, nil, 255, 0, 0 })
			--table.insert(alist, { 53, availableActions[53], {}, { "Игрок", "Причина" }, 255, 0, 0 })
			
			if pAdmin or pModerator then
				--table.insert(alist, { 54, availableActions[54], { "player" }, { "Игрок", "Причина", "Время(кол-во часов)" }, 255, 0, 0 })
				table.insert(alist, { 126, availableActions[126], {}, { "Фракция", "Игрок" }, 255, 0, 0 })
				--[[table.insert(alist, { 133, "Модерация - Разбанить игрока", { "serial" }, { "Серийный номер" }, 255, 0, 0 })
				table.insert(alist, { 133, "Модерация - Разбанить аккаунт", { "player" }, { "Аккаунт" }, 255, 0, 0 })]]
				table.insert(alist, { 65, availableActions[65], {}, { "ID гонки" }, 255, 0, 0 })
				if pAdmin then 
					table.insert(alist, { 132, availableActions[132], {}, { "Серийный номер" }, 255, 0, 0 })
					table.insert(alist, { 702, "Модерация - Удалить аккаунт", {}, { "ID аккаунта" }, 255, 0, 0 })
				end
			end
			
			table.insert(alist, { 107, availableActions[107], {}, nil, 255, 0, 0 })
			table.insert(alist, { 112, availableActions[112], {}, { "Игрок" }, 255, 0, 0 })
		end
		
		if pAdmin or pModerator then
			local eFound = false
			
			for eId,eInfo in pairs(specialEvents) do
				if(getPlayerFromName(eInfo[1]) == aplr) and(eInfo[3] < 2) then
					eFound = true
					table.insert(alist, { 118, availableActions[118], { eId }, nil, 255, 0, 0 })
					
					if(eInfo[3] == -1) then
						table.insert(alist, { 119, availableActions[119], { eId }, nil, 255, 0, 0 })
					
					elseif(eInfo[3] == 0) then
						table.insert(alist, { 120, availableActions[120], { eId }, nil, 255, 0, 0 })
					
					elseif(eInfo[3] == 1) then
						table.insert(alist, { 121, availableActions[121], { eId }, nil, 255, 0, 0 })
					end
					
					for _,member in ipairs(players) do
						if(specialEventGetEventByElement(member) == eId) then
							table.insert(alist, { 124, availableActions[124]..getPlayerName(member), { eId, member }, { "ID скина" }, 0, 255, 0 })
						end
					end
					
					table.insert(alist, { 122, availableActions[122], { eId }, nil, 255, 0, 0 })
					break
				end
			end
			
			if not eFound then
				table.insert(alist, { 117, availableActions[117], {}, { "Название" }, 255, 0, 0 })
			end
		end
		triggerClientEvent(aplr, "onReceiveActionsList", aplr, alist)
	end
end

function removeSpacesInString(str)
	return string.gsub(string.gsub(str, "^%s* (.-)%s*$", "%1"), "%s+", " ")
end

function weaponIssuanceRemovePlr(pName)
	if weaponIssuancePlrs[pName] or (weaponIssuancePlrs[pName] == false) then
		weaponIssuancePlrs[pName] = nil
	end
end

function executeAction(aplr, actionId, params)
	if(source == resourceRoot) then
		if not params then
			params = {}
		end
		
		for pid,param in ipairs(params) do
			if(type(param) == "string") then
				params[pid] = removeSpacesInString(param)
			end
		end
		
		if(actionId == 1) then -- Покупка дома с госа
			local hindex = params[1]
			
			if(getMoney(aplr) < houses[hindex][3]) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
			
			elseif gangsterStealHouses[hindex] and((gangsterStealHouses[hindex] == 1) or (gangsterStealHouses[hindex] == 2)) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В этом доме в данный момент находится грабитель.")
			
			elseif(housesBuy(hindex, aplr)) then
				triggerEvent("onPlayerChat", aplr, "Купил дом", 1)
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы приобрели недвижимость.")
			end
		
		elseif(actionId == 2) then -- Продажа дома в гос
			if(housesSell(params[1], aplr)) then
				triggerEvent("onPlayerChat", aplr, "Продал дом", 1)
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы продали недвижимость.")
			end
		
		elseif(actionId == 3) then
			local pName = getPlayerName(aplr)
			local adminList = getAdministrationList()
			
			for _,aName in ipairs(adminList) do
				if aName == pName then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Администрация не может покупать бизнес.")
					return
				end
			end
			
			local bindex = params[1]
			local btype = params[2]
			
			if(btype == 1) then
				local owner = eatLocations[bindex][9]
				
				if(owner == 0) then
					local money = getMoney(aplr)
					local price = eatTypes[eatLocations[bindex][1]][14]
					owner = getHash(getPlayerName(aplr))
					
					if(money < price) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег для приобретения этого бизнеса.")
					
					elseif dbExec(db, "UPDATE businesses SET owner=? WHERE id=?", owner, eatLocations[bindex][7]) then
						triggerEvent("onPlayerChat", aplr, "купил бизнес", 1)
						addNewEventToLog(getPlayerName(aplr), "Бизнес - Покупка - Магазин "..tostring(eatLocations[bindex][7]), true)
						takeMoney(aplr, price)
						eatLocations[bindex][9] = owner
					
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при приобретении бизнеса.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес уже куплен.")
				end
			
			elseif(btype == 2) then
				local owner = ammuShops[bindex][9]
				
				if(owner == 0) then
					local money = getMoney(aplr)
					owner = getHash(getPlayerName(aplr))
					
					if(money < ammuBusinessPrice) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег для приобретения этого бизнеса.")
					
					elseif dbExec(db, "UPDATE businesses SET owner=? WHERE id=?", owner, ammuShops[bindex][7]) then
						triggerEvent("onPlayerChat", aplr, "купил аммуницию", 1)
						addNewEventToLog(getPlayerName(aplr), "Бизнес - Покупка - Аммуниция "..tostring(ammuShops[bindex][7]), true)
						takeMoney(aplr, ammuBusinessPrice)
						ammuShops[bindex][9] = owner
					
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при приобретении бизнеса.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес уже куплен.")
				end
				
			end
			
		elseif(actionId == 4) then
			local bindex = params[1]
			local btype = params[2]
			local pHash = getHash(getPlayerName(aplr))
			
			if(btype == 1) then
				local owner = eatLocations[bindex][9]
				
				if(owner == pHash) then
					local price = eatTypes[eatLocations[bindex][1]][14]
					
					if dbExec(db, "UPDATE businesses SET owner=0 WHERE id=?", eatLocations[bindex][7]) then
						triggerEvent("onPlayerChat", aplr, "продал бизнес "..tostring(eatLocations[bindex][7]), 1)
						addNewEventToLog(getPlayerName(aplr), "Бизнес - Продажа - Магазин "..tostring(eatLocations[bindex][7]), true)
						giveMoney(aplr, price)
						eatLocations[bindex][9] = 0
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при продаже бизнеса.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес вам не принадлежит.")
				end
			
			elseif(btype == 2) then
				local owner = ammuShops[bindex][9]
				
				if(owner == pHash) then
					if dbExec(db, "UPDATE businesses SET owner=0 WHERE id=?", ammuShops[bindex][7]) then
						triggerEvent("onPlayerChat", aplr, "продал аммуницию", 1)
						addNewEventToLog(getPlayerName(aplr), "Бизнес - Продажа - Аммуниция "..tostring(ammuShops[bindex][7]), true)
						giveMoney(aplr, ammuBusinessPrice)
						ammuShops[bindex][9] = 0
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при продаже бизнеса.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес вам не принадлежит.")
				end
			end
		
		elseif(actionId == 5) then
			local tx = tonumber(params[1])
			local ty = tonumber(params[2])
			local tz = tonumber(params[3])
			local tint = tonumber(params[4])
			
			if(not((tx == nil) or (ty == nil) or (tz == nil) or (tint == nil))) and(tint >= 0) then
				local intSuccess = true
				if not (getElementInterior(aplr) == tint) then intSuccess = setElementInterior(aplr, tint) end
				if(intSuccess and setElementPosition(aplr, tx, ty, tz)) then
					outputChatBox("Вы телепортировались в указанную точку", aplr)
				else
					outputChatBox(errorStr_incorrectParams, aplr)
				end
			else
				outputChatBox(errorStr_incorrectParams, aplr)
			end
		
		elseif(actionId == 6) then
			local vehid = tonumber(params[1])
			if vehid then
				local veh = getPedOccupiedVehicle(aplr)
				
				if not veh then
					local px, py, pz = getElementPosition(aplr)
					local rx, ry, rz = getElementRotation(aplr)
					veh = createVehicle(vehid, px, py, pz, rx, ry, rz, getPlayerName(aplr), false, 0, 0)
				else
					setElementModel(veh, vehid)
				end
				
				if(veh) then
					warpPedIntoVehicle(aplr, veh)
					outputChatBox("Вы заспаунили транспорт", aplr)
				else
					outputChatBox(errorStr_incorrectParams, aplr)
				end
			
			else
				outputChatBox(errorStr_incorrectParams, aplr)
			end
			
		elseif(actionId == 7) then
			addWorker(params[1], aplr)
		
		elseif(actionId == 8) then
			jobEvacuatorNewOrder(aplr)
		
		elseif(actionId == 9) then
			local orderer = params[1]
			
			if isElement(orderer) and isPedInVehicle(orderer) then
				local ox,oy,oz = getElementPosition(orderer)
				local sx,sy,sz = getElementPosition(aplr)
				
				if(getDistanceBetweenPoints3D(ox,oy,oz,sx,sy,sz) <= 5.0) and(getElementDimension(aplr) == getElementDimension(orderer)) and(getElementInterior(aplr) == getElementInterior(orderer)) then
					if(getMoney(orderer) >= jobEvacuatorPriceFill) then
						triggerEvent("onPlayerChat", aplr, "предложил заправиться игроку "..getPlayerName(orderer), 1)
						jobEvacuatorFillRequest(aplr, orderer)
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока недостаточно денег.")
					end
				end
			end
			
		elseif(actionId == 10) then
			local orderer = params[1]
			
			if isElement(orderer) and isPedInVehicle(orderer) then
				local ox,oy,oz = getElementPosition(orderer)
				local sx,sy,sz = getElementPosition(aplr)
				
				if(getDistanceBetweenPoints3D(ox,oy,oz,sx,sy,sz) <= 5.0) and(getElementDimension(aplr) == getElementDimension(orderer)) and(getElementInterior(aplr) == getElementInterior(orderer)) then
					if(getMoney(orderer) >= jobEvacuatorPriceFix) then
						triggerEvent("onPlayerChat", aplr, "предложил починить ТС игроку "..getPlayerName(orderer), 1)
						jobEvacuatorFixRequest(aplr, orderer)
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока недостаточно денег.")
					end
				end
			end
			
		elseif(actionId == 11) then
			local cindex = params[1]
			
			if(getMoney(aplr) < carSellAvailableCars[cindex][3]) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
			elseif(carSellBuy(cindex, aplr, params[2])) then
				triggerEvent("onPlayerChat", aplr, "купил ТС", 1)
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы купили транспортное средство.")
			end
			
		elseif(actionId == 12) then
			if isPlayerBusy(aplr) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Закончите остальные дела, прежде чем заспаунить транспорт.")
			else
				local i = params[1]
				local sHash = getHash(getPlayerName(aplr))
				local carSpawnsCur
				
				if(i == -1) then
					repeat
						local dbq = dbQuery(db, "SELECT carSpawns FROM users WHERE name=?", sHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					carSpawnsCur = dbqueryresult[1]["carSpawns"]
				end
				
				if((i == -1) and(carSpawnsCur > 0)) or (i ~= 0) or (getMoney(aplr) >= vehCommonSpawnPrice) then
					local carInfo = params[2]
					addNewEventToLog(getPlayerName(aplr), "Личный транспорт - Спаун - "..getVehicleNameFromModel(carInfo["carid"]), true)
					local pveh
					carSellRemoveUserVehicles(aplr)
					
					if(carSellSQLIds[carInfo["id"]]) then
						pveh = carSellSQLIds[carInfo["id"]]
					else
						pveh = createVehicle(carInfo["carid"], 0, 0, 0)
						attachActionToElement(defaultActions[127], pveh)
						attachActionToElement(defaultActions[60], pveh)
						attachActionToElement(defaultActions[62], pveh)
						local pvehHandling = getOriginalHandling(carInfo["carid"])
						setVehicleColor(pveh, carInfo["clrr1"], carInfo["clrg1"], carInfo["clrb1"], carInfo["clrr2"], carInfo["clrg2"], carInfo["clrb2"], carInfo["clrr3"], carInfo["clrg3"], carInfo["clrb3"], carInfo["clrr4"], carInfo["clrg4"], carInfo["clrb4"])
						setVehiclePaintjob(pveh, carInfo["paintjob"])
						local accelMult
						
						if(carInfo["engineBoost"] == 1) then
							accelMult = 1.05
						
						elseif(carInfo["engineBoost"] == 2) then
							accelMult = 1.15		
						
						elseif(carInfo["engineBoost"] == 3) then
							accelMult = 1.2
						
						else
							accelMult = 1.0
						end
						
						if predefinedHandling[carInfo["carid"]] and predefinedHandling[carInfo["carid"]]["engineAcceleration"] and predefinedHandling[carInfo["carid"]]["maxVelocity"] and predefinedHandling[carInfo["carid"]]["tractionBias"] then
							setVehicleHandling(pveh, "engineAcceleration", predefinedHandling[carInfo["carid"]]["engineAcceleration"]*accelMult)
							setVehicleHandling(pveh, "maxVelocity", predefinedHandling[carInfo["carid"]]["maxVelocity"]*accelMult)
						else
							setVehicleHandling(pveh, "engineAcceleration", pvehHandling["engineAcceleration"]*accelMult)
							setVehicleHandling(pveh, "maxVelocity", pvehHandling["maxVelocity"]*accelMult)
						end
						
						local upgradeName
						
						for i2=0,16 do
							upgradeName = string.format("upgrade%d", i2)
							if(carInfo[upgradeName] > 0) then
								addVehicleUpgrade(pveh, carInfo[upgradeName])
							end
						end
						
						setElementData(pveh, "owner", getHash(getPlayerName(aplr)), false)
						setElementData(aplr, "vehicle", pveh, false)
						setElementData(pveh, "hp", carInfo["hp"], false)
						setElementData(pveh, "sqlid", carInfo["id"], false)
						setElementData(pveh, "fuelLevel", carInfo["fuel"])
						setElementData(pveh, "engineBoost", carInfo["engineBoost"])
						
						if(carInfo["fly"] > 0) then
							setElementData(pveh, "flyAbility", true)
						end
						
						applyCarArmor(pveh, carInfo["armorLevel"])
						carSellSQLIds[carInfo["id"]] = pveh
					end
					
					if(i == -1) or (i == -2) then
						local px, py, pz = getElementPosition(aplr)
						local rx, ry ,rz = getElementRotation(aplr)
						spawnVehicle(pveh, px, py, pz, 0, 0, rz)
						warpPedIntoVehicle(aplr, pveh)
						
						if(i == -1) then
							carSpawnsCur = carSpawnsCur-1
							dbExec(db, "UPDATE users SET carSpawns=? WHERE name=?", carSpawnsCur, sHash)
							--triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас осталось "..tostring(carSpawnsCur).." спаунов транспорта в любом месте.")
						end
						
					elseif(i ~= 0) then
						spawnVehicle(pveh, houses[i][5], houses[i][6], houses[i][7], houses[i][8], houses[i][9], houses[i][10])
					
					else
						i = params[3]
						spawnVehicle(pveh, vehCommonSpawnPos[i][1], vehCommonSpawnPos[i][2], vehCommonSpawnPos[i][3]+1, 0, 0, vehCommonSpawnPos[i][5])
						warpPedIntoVehicle(aplr, pveh)
						takeMoney(aplr, vehCommonSpawnPrice)
					end
					setElementGhostMode(pveh, 3000)
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
			end
		
		elseif(actionId == 13) then
			local sqlid = getElementData(params[1], "sqlid")
			local owner = getElementData(params[1], "owner")
			
			if sqlid and owner and(getHash(getPlayerName(aplr)) == owner) and carSellSell(params[1], aplr, sqlid, params[2]) then
				triggerEvent("onPlayerChat", aplr, "продал ТС", 1)
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы продали транспортное средство.")
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Не удалось продать транспортное средство.")
			end
			
		elseif(actionId == 14) then
			local pupx, pupy, pupz = getElementPosition(houses[params[1]][4])
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px, py, pz, pupx, pupy, pupz) < nearbyPickupsRadius) then
				triggerEvent("onPlayerChat", aplr, "вошел в дом", 1)
				playersInsideHouses[aplr] = params[1]
				local intid = houses[params[1]][2]
				local dimension = params[2]+1
				setElementInterior(aplr, housesInteriors[intid][4], housesInteriors[intid][1], housesInteriors[intid][2], housesInteriors[intid][3])
				setElementDimension(aplr, dimension)
				triggerClientEvent(aplr, "onHouseEnter", aplr, housesInteriors[intid], true, housesFrozenObjs)
			end
			
		elseif(actionId == 15) then
			if inventoryDroppedItems[params[1]] then
				local pup = inventoryDroppedItems[params[1]][1]
				local pupTimer = inventoryDroppedItems[params[1]][2]
				local pupx, pupy, pupz = getElementPosition(pup)
				local px, py, pz = getElementPosition(aplr)
				
				if(getDistanceBetweenPoints3D(px, py, pz, pupx, pupy, pupz) < 2.0) then
					local pickupmdl = params[2]
					
					if(pickupmdl == inventoryDroppedItems[params[1]][3]) then
						local slotId = inventoryCheckForSlot(aplr, pickupmdl)
						
						if(slotId) and(inventoryNewItem(aplr, pickupmdl, slotId)) then
							triggerEvent("onPlayerChat", aplr, "взял предмет", 1)
							killTimer(pupTimer)
							table.remove(inventoryDroppedItems, params[1])
							destroyElement(pup)
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов для этого предмета.")
						end						
					else
						killTimer(pupTimer)
						table.remove(inventoryDroppedItems, params[1])
						destroyElement(pup)
					end
					
				end
			end
			
		elseif(actionId == 16) then
			local slotId = inventoryCheckForSlot(aplr, 2)
			
			if(slotId) then
				local money = getMoney(aplr)
				local price = fuelPrice/10+10
				
				if(money >= price) then
					if(inventoryNewItem(aplr, 2, slotId)) then
						triggerEvent("onPlayerChat", aplr, "купил канистру на заправке", 1)
						addNewEventToLog(getPlayerName(aplr), "Заправка - Покупка - Канистра", true)
						takeMoney(aplr, price)
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов для канистры.")
			end
			
		elseif(actionId == 17) then
			local ammuid = params[1]
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px, py, pz, ammuShops[ammuid][2], ammuShops[ammuid][3], ammuShops[ammuid][4]) < 2.0) then
				triggerEvent("onPlayerChat", aplr, "вошел в аммуницию", 1)
				local ammuInt = ammuInts[ammuShops[params[1]][1]]
				local dimension = params[1]
				setElementInterior(aplr, ammuInt[1], ammuInt[2], ammuInt[3], ammuInt[4])
				setElementRotation(aplr, 0, 0, ammuInt[5])
				setElementDimension(aplr, dimension)
				triggerClientEvent(aplr, "onAmmuEnter", aplr, ammuInt)
			end
			
		elseif(actionId == 18) then
			local eatid = params[1]
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px, py, pz, eatLocations[eatid][2], eatLocations[eatid][3], eatLocations[eatid][4]) < 2.0) then
				triggerEvent("onPlayerChat", aplr, "вошел в здание", 1)
				local eatInfo = eatTypes[eatLocations[eatid][1]]
				local dimension = params[1]
				setElementInterior(aplr, eatInfo[3], eatInfo[4], eatInfo[5], eatInfo[6])
				setElementRotation(aplr, 0, 0, eatInfo[7])
				setElementDimension(aplr, dimension)
				triggerClientEvent(aplr, "onEatEnter", aplr, eatInfo)
				if isPlayerInHospital(aplr) then
					setElementData(aplr, "godMode", true)
				end
			end
			
		elseif(actionId == 19) then
			raceNewRacer(aplr)
		
		elseif(actionId == 20) then
			boomboxRemove(aplr)
		
		elseif(actionId == 21) then
			boomboxSwitch(aplr)
		
		elseif(actionId == 22) then
			local curGrp = getElementData(aplr, "usergroup")
			--if isPlayerGroupCommon(curGrp) then
				local newGrp = params[1]
				local curRespect = getElementData(aplr, "respect")
				local respectNeed = playerGroupRPLevels[newGrp][1]
				
				if respectNeed then
					if(respectNeed > curRespect) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, string.format("Вам необходимо %d%s уважения со стороны государства, чтобы начать эту карьеру.", math.floor(respectNeed*100), '%'))
					else
						setPlayerNewGroup(aplr, newGrp)
					end
				else
					setPlayerNewGroup(aplr, newGrp)
				end
				
			--else
			--	triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вам необходимо сначала закончить старую карьеру, чтобы начать новую.")
			--end
		
		elseif(actionId == 23) then
			setPlayerNewGroup(aplr, groupCommonGet(aplr))
		
		elseif(actionId == 24) then
			--jobAmbulanceTakeOrder(aplr)
		
		elseif(actionId == 25) then
			if(getElementInterior(aplr) == 0) and (getElementDimension(aplr) == 0) then
				local respect = getElementData(aplr, "respect")
			    if respect and (respect > 0.0) and not isPlayerFromPolice(aplr) then
				    triggerEvent("onPlayerChat", aplr, "вызвал полицию", 1)
				    jobPoliceNewOrder(aplr)
				else
				    triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вызов полиции доступен только игрокам с положительной репутацией и если он сам не полицейский")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете вызвать полицию, пока находитесь внутри здания.")
			end
		elseif(actionId == 26) then
			if(getElementInterior(aplr) == 0) and(getElementDimension(aplr) == 0) then
				triggerEvent("onPlayerChat", aplr, "вызвал скорую помощь", 1)
				jobAmbulanceNewOrder(aplr)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете вызвать скорую помощь, пока находитесь внутри здания.")
			end
		
		elseif(actionId == 27) then
		
            if isPlayerMuted(aplr) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете обратиться в СМИ, так как на вас наложен mute.")
				return false
			end
			
			if (getMoney(aplr) < 400) then
			    triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег")
				return false
			end

			local turnText = params[1]
			if(string.len(turnText) > 0) then
				local players = getElementsByType("player")
				local saNewsCount = 0
				local saNewsMsg = generateTimeString().."СМИ: Игрок "..getPlayerName(aplr).." обратился: "..turnText
					
				for i=1,table.getn(players) do
					if PlayerFromSaNews(players[i]) then
						saNewsCount = saNewsCount + 1
						triggerClientEvent(players[i], "onSaNewsShow", players[i], saNewsMsg)
					end
				end
					
				if(saNewsCount > 0) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ваше обращение в СМИ отправлено")
					takeMoney(aplr, 400)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На сервере нет ни одного игрока с фракции СМИ на данный момент.")
				end
		
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не указали обращение.")
			end

		elseif(actionId == 28) then
			local orderer = params[1]
			
			if isElement(orderer) then
				local ox,oy,oz = getElementPosition(orderer)
				local px,py,pz = getElementPosition(aplr)
				
				if(getDistanceBetweenPoints3D(ox,oy,oz,px,py,pz) < 2.0) then
					if(getMoney(orderer) >= jobAmbulancePriceForHP) then
						triggerEvent("onPlayerChat", aplr, "предложил лечение игроку "..getPlayerName(orderer), 1)
						jobAmbulanceRequest(aplr, orderer)
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока недостаточно денег.")
					end
				end
			end
			
			--[[
			local ambOrder = jobAmbulanceGetOrderByAmbulance(aplr)
			if ambOrder then
				local ox,oy,oz = getElementPosition(jobAmbulanceOrders[ambOrder][1])
				local px,py,pz = getElementPosition(aplr)
				if(getDistanceBetweenPoints3D(ox,oy,oz,px,py,pz) < 2.0) then
					jobAmbulanceDestroyOrder(ambOrder, true)
				end
			end
			]]
		
		elseif(actionId == 29) then
			saveHouseSet(aplr, params[1])
		
		elseif(actionId == 30) then
			local cabinId = params[1]
			local px,py,pz = getElementPosition(aplr)
			local cx,cy,cz = getElementPosition(ferrisWheelCabins[cabinId][1])
			
			if(getDistanceBetweenPoints3D(px,py,pz,cx,cy,cz) < 4.0) then
				triggerEvent("onPlayerChat", aplr, "сел на колесо обозрения", 1)
				ferrisWheelNewPlayer(aplr, cabinId)
			end
		
		elseif(actionId == 31) then
			triggerEvent("onPlayerChat", aplr, "слез с колеса обозрения", 1)
			ferrisWheelRemovePlayer(aplr)
		
		elseif(actionId == 32) then
			local players = getElementsByType("player")
			local killPlr = findPlayerByNamePattern(params[1])
			if isElement(killPlr) then
				local killPrice = tonumber(params[2])
				if(killPlr == aplr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете назначить цену за свою же голову.")
				elseif(not killPrice) or (killPrice <= 0) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Цена введена неправильно.")
				elseif(killPrice > getMoney(aplr)) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				else
					gangsterKillOrderNew(killPlr, killPrice, aplr)
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, killPlr)
			end
		
		elseif(actionId == 33) then
			-- BLANK
		
		elseif(actionId == 34) then
			-- BLANK
		
		elseif(actionId == 35) then
			-- BLANK
		
		elseif(actionId == 36) then
			-- BLANK
		
		elseif(actionId == 37) then
			-- BLANK
		
		elseif(actionId == 38) then
			-- BLANK
		
		elseif(actionId == 39) then
			-- BLANK
		
		elseif(actionId == 40) then
			-- BLANK
		
		elseif(actionId == 41) then
			local bindex = params[1]
			local btype = params[2]
			local pHash = getHash(getPlayerName(aplr))
			
			if(btype == 1) then
				local owner = eatLocations[bindex][9]
				
				if(owner == pHash) then
					local income = eatLocations[bindex][8]
					
					if(income > 0) then
						if dbExec(db, "UPDATE businesses SET money=0 WHERE id=?", eatLocations[bindex][7]) then
							triggerEvent("onPlayerChat", aplr, "взял выручку своего бизнеса "..tostring(eatLocations[bindex][7]), 1)
							addNewEventToLog(getPlayerName(aplr), "Бизнес - Выручка - Магазин "..tostring(eatLocations[bindex][7]), true)
							giveMoney(aplr, income)
							eatLocations[bindex][8] = 0
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при получении выручки.")
						end
						
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес вам не принадлежит.")
				end
				
			elseif(btype == 2) then
				local owner = ammuShops[bindex][9]
				
				if(owner == pHash) then
					local income = ammuShops[bindex][8]
					if(income > 0) then
						if dbExec(db, "UPDATE businesses SET money=0 WHERE id=?", ammuShops[bindex][7]) then
							triggerEvent("onPlayerChat", aplr, "взял выручку аммуниции", 1)
							addNewEventToLog(getPlayerName(aplr), "Бизнес - Выручка - Аммуниция "..tostring(ammuShops[bindex][7]), true)
							giveMoney(aplr, income)
							ammuShops[bindex][8] = 0
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ошибка при получении выручки.")
						end
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Этот бизнес вам не принадлежит.")
				end
			end
			
		elseif(actionId == 42) then
			local otbid = params[1]
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px, py, pz, otbLocations[otbid][2], otbLocations[otbid][3], otbLocations[otbid][4]) < 2.0) then
				triggerEvent("onPlayerChat", aplr, "вошел в букмекерскую контору", 1)
				local otbInfo = otbInts[otbLocations[otbid][1]]
				local dimension = otbid
				setElementInterior(aplr, otbInfo[5], otbInfo[1], otbInfo[2], otbInfo[3])
				setElementRotation(aplr, 0, 0, otbInfo[4])
				setElementDimension(aplr, dimension)
				triggerClientEvent(aplr, "onOtbEnter", aplr, otbInfo)
			end
		
		elseif(actionId == 43) then
			-- BLANK
		
		elseif(actionId == 44) then
			if(get("militaryCanStealWeapons") == "Yes") then
				local cargoInfoId = params[1]
				
				if(militaryCargoGetBoxCount(cargoInfoId) > 0) then
					local slotId = inventoryCheckForSlot(aplr, 10)
					if(slotId) and(inventoryNewItem(aplr, 10, slotId)) then
						triggerEvent("onPlayerChat", aplr, "украл ящик с оружием", 1)
						addNewEventToLog(getPlayerName(aplr), "Военная база - Воровство - Ящик с оружием", true)
						militaryCargoUpdateBoxCount(cargoInfoId, -1)
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов.")
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Груз кончился.")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На данный момент на сервере отключено воровство военного груза.")
			end
		
		elseif(actionId == 45) then
			local cargoInfoId = params[1]
			
			if(militaryCargoGetBoxCount(cargoInfoId) < militaryCargoGetBoxMax(cargoInfoId)) then
				local slot = inventoryGetItemSlot(aplr, 10)
				if slot then
					triggerEvent("onPlayerChat", aplr, "вернул ящик с оружием", 1)
					addNewEventToLog(getPlayerName(aplr), "Военная база - Возвращение - Ящик с оружием", true)
					inventoryRemoveItem(aplr, slot)
					militaryCargoUpdateBoxCount(cargoInfoId, 1)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет коробок с оружием.")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Груз уже заполнен. Поищите другой.")
			end
		
		elseif(actionId == 46) then
			local aName = getPlayerName(aplr)
			
			if not weaponIssuancePlrs[aName] then
				local i = params[1]
				local grp = getElementData(aplr, "usergroup")
				
				if grp and(grp == weaponIssuances[i][4]) then
					triggerEvent("onPlayerChat", aplr, "получил оружие", 1)
					if weaponIssuances[i][5] then
						setPedArmor(aplr, 100)
					end
					local curWeap
					
					for wId=1,table.getn(weaponIssuances[i][7]) do
						curWeap = getPedWeapon(aplr, getSlotFromWeapon(weaponIssuances[i][7][wId][1]))
						if(curWeap > 0) then
							takeWeapon(aplr, curWeap)
						end
						giveWeapon(aplr, weaponIssuances[i][7][wId][1], weaponIssuances[i][7][wId][2], true)
						weaponIssuancePlrs[aName] = setTimer(weaponIssuanceRemovePlr, weaponIssuanceDelay, 1, aName)
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете получить оружие тут.")
				end
			
			elseif isTimer(weaponIssuancePlrs[aName]) then
				local timeLeft = getTimerDetails(weaponIssuancePlrs[aName])
				
				if timeLeft then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вам нужно подождать ещё "..getTimeString(timeLeft, "v")..", чтобы получить оружие.")
				end
			end
		
		elseif(actionId == 47) then -- лечение в больнице по боту с маркером
			if isElementWithinMarker(aplr, HealthMarkers[params[1]][5]) then
				local curMoney = getMoney(aplr)
				
				if(curMoney < hospitalHealthPrice) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				else
				    if (getElementHealth(aplr) > 150) then
					    triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не нуждаетесь в лечении.")
						return false
					end
					
					triggerEvent("onPlayerChat", aplr, "вылечился в больнице", 1)
					addNewEventToLog(getPlayerName(aplr), "Больница - Лечение - nil", true)
					takeMoney(aplr, hospitalHealthPrice)
					setTimer(function(aplr)
						if isElement(aplr) then
							setElementHealth(aplr, 250)
							local cx, cy, cz = getElementPosition(aplr)
							local curCol = createColSphere(cx, cy, cz, 150)
							local players = getElementsWithinColShape(curCol, "player")
							destroyElement(curCol)
							triggerClientEvent(players, "onCreateProgressPopup", aplr, "images/health.png", aplr, true)
							triggerClientEvent(players, "onServerPlaySFX3D", aplr, "genrl", 52, 17, 0, 0, 0, false, 40, aplr)
						end
					end, 500, 1, aplr)
				end
			end
			
		elseif(actionId == 48) then
			if(table.getn(otbTickets) < 50) then
				local curMoney = getMoney(aplr)
				
				if(curMoney < otbPrice) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				else
					local ticketBought = false
					local ticketNum
					
					for i=1,50 do
						if otbTickets[i] and(otbTickets[i] == aplr) then
							ticketNum = i
							ticketBought = true
							break
						end
					end
					
					if ticketBought then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы уже купили билет. Номер - "..tostring(ticketNum))
					else
						triggerEvent("onPlayerChat", aplr, "купил билет", 1)
						ticketNum = math.random(50)
						addNewEventToLog(getPlayerName(aplr), "Букмекерская контора - Покупка - Билет #"..tostring(ticketNum), true)
						
						while otbTickets[ticketNum] do
							ticketNum = ticketNum+1
							
							if(ticketNum > 50) then
								ticketNum = 1
							end
						end
						
						otbTickets[ticketNum] = aplr
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, string.format("Номер вашего билета - %d. Удачи!", ticketNum))
						takeMoney(aplr, otbPrice)
						otbFund = otbFund+otbPrice
					end
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Все билеты распроданы.")
			end
		
		elseif(actionId == 49) then
			--[[
			local evacid = params[1]
			if jobWorkers[4][evacid][1] and(jobWorkers[4][evacid][1] == aplr) then
				local ex, ey, ez = getElementPosition(aplr)
				local closestOrder = nil
				local ox, oy, oz, cdist, edist
				for i=1,table.getn(jobEvacuatorOrders) do
					if not jobEvacuatorOrders[i][2] then
						ox, oy, oz = getElementPosition(jobEvacuatorOrders[i][1])
						if(closestOrder == nil) then
							closestOrder = i
							cdist = getDistanceBetweenPoints3D(ex, ey, ez, ox, oy, oz)
						else
							edist = getDistanceBetweenPoints3D(ex, ey, ez, ox, oy, oz)
							if(edist < cdist) then
								closestOrder = i
								cdist = edist
							end
						end				
					end
				end
				if not (closestOrder == nil) then
					jobEvacuatorAssignOrder(evacid, closestOrder)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На данный момент нет доступных заказов.")
				end
			end
			]]
		
		elseif(actionId == 50) then
			triggerClientEvent(aplr, "onServerPlaySFX3D", aplr, "genrl", 52, 13, 0, 0, 0, false, 1000, aplr)
			triggerClientEvent(aplr, "onTutorialShow", aplr, params[1], params[2])
		
		elseif(actionId == 51) then
			local tid = params[1]
			
			if not jobWorkers[10][tid][4] then
				local newTariff = tonumber(params[2])
				
				if newTariff then
					if(newTariff < jobTaxiPriceLimits[1]) or (newTariff > jobTaxiPriceLimits[2]) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, string.format("Тариф не может быть меньше $%d и больше $%d.", jobTaxiPriceLimits[1], jobTaxiPriceLimits[2]))
					else
						triggerEvent("onPlayerChat", aplr, "установил тариф такси $"..tostring(newTariff), 1)
						jobTaxiSetTariff(tid, newTariff)
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введен тариф.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Нельзя менять тариф, пока в такси находится пассажир.")
			end
			
		elseif(actionId == 52) then
			triggerEvent("onPlayerChat", aplr, "заказал такси", 1)
			jobTaxiOrder(aplr, params[1])
		
		elseif(actionId == 53) then
			local kickedPlr = findPlayerByNamePattern(params[1])
			
			if isElement(kickedPlr) then
				kickPlayer(kickedPlr, aplr, params[2])
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, kickedPlr)
			end
		
		elseif(actionId == 54) then
			local bannedPlr
			
			if params[1] == "player" then
				bannedPlr = findPlayerByNamePattern(params[2])
			end
			
			if isElement(bannedPlr) then
				params[4] = tonumber(params[4])
				
				if params[4] and(params[4] >= 0) then
					local pName = getPlayerName(bannedPlr)
					
					if resplayAddBan(params[1], pName, getPlayerName(aplr), params[3], params[4]*3600) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Игрок "..pName.." был забанен.")
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Игрока "..pName.." не удалось забанить.")
					end
				
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Время бана введено неверно или должно быть больше или равно 0.")
				end
			
			else
				params[4] = tonumber(params[4])
				
				if params[4] and(params[4] >= 0) then
					resplayAddBan(params[1], params[2], getPlayerName(aplr), params[3], params[4]*3600)
					local banMessage
					
					if params[1] == "ip" then
						banMessage = "Игрок с IP "..params[2].." получил бан."
					
					elseif params[1] == "serial" then
						banMessage = "Игрок с серийным номером "..params[2].." получил бан."
					
					else
						banMessage = "Игрок с никнеймом "..params[2].." не находится на сервере, но получил бан."
					end
					
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, banMessage)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Время бана введено неверно или должно быть больше или равно 0.")
				end
			end
		
		elseif(actionId == 55) then
			local plr = params[1]
			
			if isElement(plr) then
				local sx, sy, sz = getElementPosition(aplr)
				local px, py, pz = getElementPosition(plr)
				local aName = getPlayerName(aplr)
				local pName = getPlayerName(plr)
				
				if(getDistanceBetweenPoints3D(sx,sy,sz,px,py,pz) < 5.0) then
					local sint, sdim, pint, pdim = getElementInterior(aplr), getElementDimension(aplr), getElementInterior(plr), getElementDimension(plr)
					
					if(sint == pint) and(sdim == pdim) then
						local giveMoneyAmount = tonumber(params[2])
						
						if giveMoneyAmount and(giveMoneyAmount > 0) then
							giveMoneyAmount = math.ceil(giveMoneyAmount)
							local aplrMoney = getMoney(aplr)
							local aplrSent = playerMoneySent[aName] or 0
							aplrSent = aplrSent + giveMoneyAmount
							if(aplrMoney < giveMoneyAmount) then
								triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
							--[[elseif(not(isAdmin(aplr) or isModerator(aplr))) and(aplrSent > 10000) then
								triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете передавать больше $10000 в сутки. На данный момент вы уже передали $"..tostring(aplrSent)..".")]]
							else
								triggerEvent("onPlayerChat", aplr, "дал $"..tostring(giveMoneyAmount).." игроку "..pName, 1)
								addNewEventToLog(getPlayerName(aplr), "Аккаунты - Передача денег игроку - "..pName, true)
								addNewEventToLog(getPlayerName(plr), "Аккаунты - Получение денег от игрока - "..aName, true)
								giveMoney(plr, giveMoneyAmount)
								takeMoney(aplr, giveMoneyAmount)
								playerMoneySent[aName] = aplrSent
								triggerClientEvent(plr, "onServerMsgAdd", aplr, "Игрок "..aName.." передал вам $"..giveMoneyAmount..".")
							end
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введено количество денег.")
						end
						
					end
				end
			end
		elseif(actionId == 56) then
			local reportPlr = findPlayerByNamePattern(params[1])
			if isElement(reportPlr) then
				if(reportPlr == aplr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете отправить сами на себя жалобу.")
				
				elseif isPlayerMuted(aplr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете отправить жалобу, так как на вас наложен mute.")
				
				else
					local rNew = true
					
					for _,report in pairs(reportsArray) do
						if(report[1] == getPlayerName(aplr)) and(report[2] == getPlayerName(reportPlr)) then
							rNew = false
							break
						end
					end
					
					if rNew then
						local reasonText = params[2]
						
						if(string.len(reasonText) > 0) then
							addNewEventToLog(getPlayerName(aplr), "Аккаунты - Жалоба на игрока - "..getPlayerName(reportPlr).."("..reasonText..")", true)
							addNewEventToLog(getPlayerName(reportPlr), "Аккаунты - Жалоба от игрока - "..getPlayerName(aplr).."("..reasonText..")", true)
							reportsCounter = reportsCounter + 1
							reportsArray[reportsCounter] = { getPlayerName(aplr), getPlayerName(reportPlr), reasonText }
							setTimer(removeOldReport, 300000, 1, reportsCounter)
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ваша жалоба разослана всем модераторам на сервере.")
							local reportMsg = generateTimeString().."REPORT: На "..getPlayerName(reportPlr).." от "..getPlayerName(aplr)..". Причина: "..reasonText
							outputServerLog(reportMsg)
							local players = getElementsByType("player")
							
							for i=1,table.getn(players) do
								if isAdmin(players[i]) or isModerator(players[i]) then
									triggerClientEvent(players[i], "onReportShow", players[i], reportMsg)
									triggerClientEvent(players[i], "onReportsUpdate", resourceRoot, reportsArray)
								end
							end
							
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не указали причину жалобы.")
						end
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы уже пожаловались на данного игрока.")
					end
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, reportPlr)
			end
			
		elseif(actionId == 57) then
			local respect = getElementData(aplr, "respect")
			
			if respect and(respect >= 0.0) then
				local price = buyoutPrice*getPlayerWantedLevel(aplr)
				
				if(getMoney(aplr) >= price) then
					addNewEventToLog(getPlayerName(aplr), "Полиция - Откуп - Звёзды: "..tostring(getPlayerWantedLevel(aplr)), true)
					takeMoney(aplr, price)
					wantedLevelClear(aplr)
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы откупились от полицейских.")
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны обладать неотрицательным уважением, чтобы воспользоваться откупом.")
			end
			
			--policeOrder(aplr, params[1])
			--triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ваш вызов принят и разослан всем полицейским поблизости.")
		
		elseif(actionId == 58) then
			triggerEvent("onPlayerChat", aplr, "принимает участие в лоурайдерских боях", 1)
			lowriderAddPlayer(params[1], aplr)
		
		elseif(actionId == 59) then
			local lowriderId = getElementData(aplr, "lowrider")
			
			if lowriderId and(not lowriderMarkers[lowriderId][15]) then
				giveMoney(aplr, lowriderPrice)
			end
			
			lowriderRemovePlayer(params[1], aplr)
			triggerEvent("onPlayerChat", aplr, "вышел из лоурайдерских боев", 1)
		
		elseif(actionId == 60) then
			if not isPedInVehicle(aplr) then
				local car = params[1]
				
				if car and(getElementHealth(car) > 0.0) then
					local owner = getElementData(car, "owner")
					local sint, sdim, cint, cdim = getElementInterior(aplr), getElementDimension(aplr), getElementInterior(car), getElementDimension(car)
					local openRatio = getVehicleDoorOpenRatio(car, 1)
					local cx, cy, cz = getElementPosition(car)
					local sx, sy, sz = getElementPosition(aplr)
					local trunkState = getVehicleDoorState(car, 1)
					
					if((owner and(getHash(getPlayerName(aplr)) == owner)) or isPlayerFromPolice(aplr)) and((trunkState == 0) or (trunkState == 2)) and(sint == cint) and(sdim == cdim) and(openRatio <= 0.0) and(getDistanceBetweenPoints3D(cx, cy, cz, sx, sy, sz) < nearbyVehiclesRadius) then
						triggerEvent("onPlayerChat", aplr, "открыл багажник", 1)
						setVehicleDoorOpenRatio(car, 1, 1.0, 500)
					end
					
				end
				
			end
		
		elseif(actionId == 61) then
			if not isPedInVehicle(aplr) then
				local car = params[1]
				
				if car and(getElementHealth(car) > 0.0) then
					local owner = getElementData(car, "owner")
					local sint, sdim, cint, cdim = getElementInterior(aplr), getElementDimension(aplr), getElementInterior(car), getElementDimension(car)
					local openRatio = getVehicleDoorOpenRatio(car, 1)
					local cx, cy, cz = getElementPosition(car)
					local sx, sy, sz = getElementPosition(aplr)
					local trunkState = getVehicleDoorState(car, 1)
					
					if((owner and(getHash(getPlayerName(aplr)) == owner)) or isPlayerFromPolice(aplr)) and((trunkState == 0) or (trunkState == 2)) and(sint == cint) and(sdim == cdim) and(openRatio > 0.0) and(getDistanceBetweenPoints3D(cx, cy, cz, sx, sy, sz) < nearbyVehiclesRadius) then
						triggerEvent("onPlayerChat", aplr, "закрыл багажник", 1)
						setVehicleDoorOpenRatio(car, 1, 0.0, 500)
					end
					
				end
				
			end
			
		elseif(actionId == 62) then
			if not isPedInVehicle(aplr) then
				local car = params[1]
				
				if isElement(car) and(getElementHealth(car) > 0.0) then
					local owner = getElementData(car, "owner")
					local sint, sdim, cint, cdim = getElementInterior(aplr), getElementDimension(aplr), getElementInterior(car), getElementDimension(car)
					local openRatio = getVehicleDoorOpenRatio(car, 1)
					local cx, cy, cz = getElementPosition(car)
					local sx, sy, sz = getElementPosition(aplr)
					local trunkState = getVehicleDoorState(car, 1)
					
					if((owner and(getHash(getPlayerName(aplr)) == owner)) or isPlayerFromPolice(aplr)) and((trunkState == 0) or (trunkState == 2)) and(sint == cint) and(sdim == cdim) and(openRatio > 0.0) and(getDistanceBetweenPoints3D(cx, cy, cz, sx, sy, sz) < nearbyVehiclesRadius) then
						triggerEvent("onPlayerChat", aplr, "взял что-то из багажника", 1)
						inventoryTakeItemFromTrunk(params[2], aplr)
					end
					
				end
				
			end
			
		elseif(actionId == 63) then
			if(getElementDimension(aplr) == 0) then
				triggerEvent("onPlayerChat", aplr, "вызвал подкрепление", 1)
				addNewEventToLog(getPlayerName(aplr), "Полиция - Требование подкрепления - nil", true)
				local players = getNearbyElementsByType(aplr, "player", 1000.0)
				local counter = 0
				
				for _,plr in ipairs(players) do
					if isPlayerFromPolice(plr) then
						triggerClientEvent(plr, "onPoliceBackup", aplr)
						counter = counter+1
					end
				end
				
				
				if(counter > 1) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Требование подкрепления разослано "..tostring(counter).." полицейским.")
				
				elseif(counter == 1) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Требование подкрепления разослано 1 полицейскому.")
				
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Поблизости нет полицейских.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Подкрепление недоступно внутри помещения.")
			end
			
		elseif(actionId == 64) then
			local wlist = {}
			local fractionGroups = fractionGetAllGroups()
			
			for _,workId in ipairs(workGroups) do
				if fractionGroupRPLevels[workId] then
					table.insert(wlist, { playerGroups[workId][1], math.floor(fractionGroupRPLevels[workId]*100.0), true })
				
				else
					table.insert(wlist, { playerGroups[workId][1], math.floor(playerGroupRPLevels[workId][1]*100.0), false })
				end
			end
			
			triggerClientEvent(aplr, "onAvailableWorkShow", aplr, wlist)
		elseif(actionId == 65) then
			local raceId = tonumber(params[1])
			
			if raceId then
				raceCreate(raceId)
			
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введен ID гонки.")
			end
			
		
		elseif(actionId == 66) then
			triggerClientEvent(aplr, "onAnimMenuShow", aplr, animList)
		
		elseif(actionId == 67) then
			animStop(aplr)
		
		elseif(actionId == 68) then
			rcDestroy(aplr)
		
		elseif(actionId == 69) then
			local workerInfo = jobWorkers[11][params[1]]
			
			if workerInfo and(workerInfo[1] == params[2]) and(workerInfo[3] == params[3]) then
				local px, py, pz = getElementPosition(aplr)
				local fx, fy, fz = getElementPosition(workerInfo[3])
				
				if(getDistanceBetweenPoints3D(px,py,pz,fx,fy,fz) <= nearbyVehiclesRadius) then
					local pMoney = getMoney(aplr)
					local fId = params[4]
					local fPrice = params[5]
					
					if(fPrice <= pMoney) then
						local slotId = inventoryCheckForSlot(aplr, fId)
						
						if slotId then
							if inventoryNewItem(aplr, fId, slotId) then
								local serviceId = getElementData(workerInfo[1], "usergroup")
								
								if serviceId and serviceRegister(aplr, workerInfo[1], serviceId) then
									local respect = getElementData(workerInfo[1], "respect")
									respectSet(workerInfo[1], respect+0.000002, -1.0, 0.1, true)
								end
								
								triggerEvent("onPlayerChat", aplr, "купил еду у игрока "..getPlayerName(workerInfo[1]), 1)
								addNewEventToLog(getPlayerName(workerInfo[1]), "Продажа еды - Продажа - "..inventoryItemNames[fId][1], true)
								addNewEventToLog(getPlayerName(aplr), "Продажа еды - Покупка - "..inventoryItemNames[fId][1], true)
								takeMoney(aplr, fPrice)
								giveMoney(workerInfo[1], fPrice)
							end
						
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов.")
						end
					
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
					end
				end
			end
		
		elseif(actionId == 70) then
			local derbyid = params[1]
			triggerEvent("onPlayerChat", aplr, "принимает участие в дерби", 1)
			derbyNewPlayer(derbyid, aplr)
		
		elseif(actionId == 71) then
			local qCount = 0
			
			for _,question in pairs(questionsArray) do
				if(question[1] == getPlayerName(aplr)) then
					qCount = qCount + 1
				end
			end
			
            if isPlayerMuted(aplr) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете задать вопрос, так как на вас наложен mute.")
				return false
			end
			
			if(qCount < 3) then
				local questionText = params[1]
				
				if(string.len(questionText) > 0) then
					local players = getElementsByType("player")
					local adminsCount = 0
					local reportMsg = generateTimeString().."ВОПРОС: Игрок "..getPlayerName(aplr).." спрашивает: "..questionText
					
					for i=1,table.getn(players) do
						if isAdmin(players[i]) or isModerator(players[i]) or isHelper(players[i]) then
							adminsCount = adminsCount + 1
							addNewEventToLog(getPlayerName(players[i]), "Аккаунты - Получение вопроса - Игрок "..getPlayerName(aplr).." с вопросом '"..questionText.."'", true)
							triggerClientEvent(players[i], "onReportShow", players[i], reportMsg)
						end
					end
					
					if(adminsCount > 0) then
						addNewEventToLog(getPlayerName(aplr), "Аккаунты - Вопрос - "..questionText, true)
						questionsCounter = questionsCounter + 1
						questionsArray[questionsCounter] = { getPlayerName(aplr), questionText, setTimer(questionRemove, 300000, 1, questionsCounter, true), nil }
						questionUpdate()
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Ваш вопрос разослан всем модераторам на сервере. Вопрос без ответа будет снят через 5 минут.")
					else
						addNewEventToLog(getPlayerName(aplr), "Аккаунты - Вопрос - "..questionText, false)
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На сервере нет ни одного модератора на данный момент.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не указали вопрос.")
				end
			
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете указать больше трех вопросов, пока они не будут рассмотрены или сняты.")
			end
			
		elseif(actionId == 72) then
			if isAdmin(aplr) or isModerator(aplr) or isHelper(aplr) then
				local qArrayClient = {}
				
				for qnum,question in pairs(questionsArray) do
					if(question[4] == nil) then
						qArrayClient[qnum] = { question[1], question[2] }
					end
				end
				
				triggerClientEvent(aplr, "onQuestionOpen", aplr, qArrayClient)
			end
		
		elseif(actionId == 73) then
			local bet = tonumber(params[3])
			
			if bet then
				lowriderAddBet(params[1], aplr, params[2], params[3])
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введена сумма ставки.")
			end
			
		elseif(actionId == 74) then
			local playerInPoliceVehicle = false
			local aVeh = getPedOccupiedVehicle(aplr)
			
			if aVeh then
				local vehGrps = groupVehicles[getElementModel(aVeh)]
				if vehGrps then
					for _,curGrp in ipairs(vehGrps) do
						if(curGrp == 2) or (curGrp == 5) or (curGrp == 14) or (curGrp == 15) or (curGrp == 17) then
							playerInPoliceVehicle = true
							break
						end
					end
				end
			end
			
			if playerInPoliceVehicle then
				local players = getElementsByType("player")
				local suspPlr = nil
				local suspDist = 0.0
				local sx, sy, sz = getElementPosition(aplr)
				local px, py, pz, plrDist, plrInt, plrDim
				local trgDist, wantedLvl
				
				for _,plr in ipairs(players) do
					plrInt, plrDim, wantedLvl = getElementInterior(plr), getElementDimension(plr), getPlayerWantedLevel(plr)
					if(wantedLvl > 0) and(plrInt == 0) and(plrDim == 0) then
						px, py, pz = getElementPosition(plr)
						plrDist = getDistanceBetweenPoints3D(sx,sy,sz,px,py,pz)
						trgDist = 130.0*wantedLvl
						if(plrDist < trgDist) and((suspPlr == nil) or (suspDist > plrDist)) then
							suspPlr = plr
							suspDist = plrDist
						end
					end
				end
				
				if(suspPlr == nil) then
					triggerClientEvent(aplr, "onReceivePoliceMessage", aplr, generateTimeString().."[Полиция] ДИСПЕТЧЕР: #FFFFFFПоблизости нет преступников.")
				else
					triggerClientEvent(aplr, "onCrimeCreateBlip", aplr, suspPlr)
				end
				
			else
				triggerClientEvent(aplr, "onReceivePoliceMessage", aplr, generateTimeString().."[Полиция] ДИСПЕТЧЕР: #FFFFFFВы должны находиться в служебном транспорте, чтобы определить местоположение преступника.")
			end
			
		elseif(actionId == 75) then
			local veh = getPedOccupiedVehicle(aplr)
			
			if veh and getElementData(veh, "flyAbility") then
				setElementData(veh, "flyToggle", false)
			end
			
		elseif(actionId == 76) then
			local veh = getPedOccupiedVehicle(aplr)
			if veh and getElementData(veh, "flyAbility") then
				setElementData(veh, "flyToggle", true)
			end
			
		elseif(actionId == 77) then
			triggerEvent("onPlayerChat", aplr, "надел джетпак", 1)
			jetpackOn(aplr)
			
		elseif(actionId == 78) then
			triggerEvent("onPlayerChat", aplr, "снял джетпак", 1)
			jetpackOff(aplr)
			
		elseif(actionId == 79) then
			triggerClientEvent(aplr, "onPlayerCustomWalkOpen", aplr)
		
		elseif(actionId == 80) then
			triggerClientEvent(aplr, "onPlayerCustomFightOpen", aplr)
		
		elseif(actionId == 81) then
			triggerClientEvent(aplr, "onDonateOpen", aplr, params[1])
		
		elseif(actionId == 82) then
			triggerClientEvent(aplr, "onGpsOpen", aplr)
		
		elseif(actionId == 83) then
			local respect = getElementData(aplr, "respect")

			if(respect > -0.1 ) then
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Для создания клана необходимо иметь 10% отрицательной репутации.")
			else
				local clanName = params[1]
				local clanR, clanG, clanB
				
				for clrStrR, clrStrG, clrStrB in string.gmatch(params[2], "(%d+),%s(%d+),%s(%d+)") do
					clanR = tonumber(clrStrR)
					clanG = tonumber(clrStrG)
					clanB = tonumber(clrStrB)
				end
				
				if(string.len(clanName) > 0) and clanR and clanG and clanB then
					clanR = math.ceil(clanR)
					clanG = math.ceil(clanG)
					clanB = math.ceil(clanB)
					if not clanCreateNew(aplr, clanName, clanR, clanG, clanB) then
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Возникли проблемы при создании клана.")
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введены данные.")
				end
			end
		
		elseif(actionId == 84) then
			local baseId = params[1]
			local baseOwner = clanBases[baseId][25]
			
			if baseOwner then
				baseOwner = "["..getTeamName(baseOwner).."]"
			else
				baseOwner = "отсутствует"
			end
			
			triggerClientEvent(aplr, "onClanBaseMenu", aplr, { baseId, clanBaseGetPrice(baseId), clanBaseSizes[clanBases[baseId][5]][2], math.min(5, clanBaseGetBusinessesCount(baseId)), baseOwner })
		
		elseif(actionId == 85) then
			local clan = getPlayerClan(aplr)
			
			if clan then
				triggerClientEvent(aplr, "onClanOpenMenu", aplr, clan)
			end
			
		
		elseif(actionId == 86) then
			clanInviteAccept(aplr, params[2])
		
		elseif(actionId == 87) then
			triggerEvent("onPlayerChat", aplr, "воспользовался тригером", 1)
			clanBaseGateTrigger(params[1], aplr)
		
		elseif(actionId == 88) then -- Взять деньги со склада базы
			local amount = tonumber(params[2])
			
			if amount and(amount > 0) then
				amount = math.ceil(amount)
				
				if clanBaseTakeMoney(params[1], amount) then
					giveMoney(aplr, amount)
					triggerEvent("onPlayerChat", aplr, "взял $"..tostring(amount).." с базы", 1)
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы взяли с базы $"..tostring(amount)..".")
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На базе нет столько денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введены данные.")
			end
			
		elseif(actionId == 89) then -- Внести деньги на склад базы
			local amount = tonumber(params[2])
			
			if amount and(amount > 0) then
				amount = math.ceil(amount)
				local aMoney = getMoney(aplr)
				
				if(aMoney >= amount) then
					if clanBaseGiveMoney(params[1], amount) then
						takeMoney(aplr, amount)
						triggerEvent("onPlayerChat", aplr, "внес $"..tostring(amount).." на базу", 1)
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы внесли на базу $"..tostring(amount)..".")
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "На складе базы нет столько места для денег(максимум - $"..tostring(clanBaseGetMaxMoneyAmount(params[1])).."). Попробуйте расширить склад.")
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введены данные.")
			end
		
		elseif(actionId == 90) then -- Положить текущее оружие на склад базы
			local amount = tonumber(params[2])
			
			if amount and(amount > 0) then
				triggerEvent("onPlayerChat", aplr, "положил оружие на склад базы", 1)
				amount = math.ceil(amount)
				clanBaseGiveCurrentWeapon(params[1], aplr, amount)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введены данные.")
			end
			
		elseif(actionId == 91) then -- Взять со склада базы оружие
			local amount = tonumber(params[3])
			
			if amount and(amount > 0) then
				triggerEvent("onPlayerChat", aplr, "взял оружие со склада базы", 1)
				amount = math.ceil(amount)
				clanBaseTakeWeapon(params[1], aplr, params[2], amount)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Неправильно введены данные.")
			end
			
		elseif(actionId == 92) then
			clanBaseAddCar(params[1], aplr)
		
		elseif(actionId == 93) then
			clanBaseUpgradeCars(params[1], aplr)
		
		elseif(actionId == 94) then
			clanBaseTakeInventoryItem(params[1], aplr, params[2])
		
		elseif(actionId == 95) then
			local baseId = params[1]
			local gx, gy, gz = getElementPosition(clanBases[baseId][32])
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px,py,pz,gx,gy,gz) < nearbyVehiclesRadius) then
				local clan = getPlayerClan(aplr)
				
				if(clan ~= clanBases[baseId][25]) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не находитесь в составе клана, которому принадлежит эта база.")
				
				elseif isVehicleBlown(clanBases[baseId][32]) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Генератор уничтожен. Воспользуйтесь маркером склада базы для его восстановления.")
				
				elseif(getElementData(clanBases[baseId][32], "fuelLevel") <= 0.0) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Бак генератора пуст. Купите канистру на заправке и воспользуйтесь ею для пополнения запаса топлива.")
				
				else
					triggerEvent("onPlayerChat", aplr, "включил генератор", 1)
					clanBaseGeneratorTurnOn(baseId)
				end
			end
			
		elseif(actionId == 96) then
			local baseId = params[1]
			local gx, gy, gz = getElementPosition(clanBases[baseId][32])
			local px, py, pz = getElementPosition(aplr)
			
			if(getDistanceBetweenPoints3D(px,py,pz,gx,gy,gz) < nearbyVehiclesRadius) then
				local clan = getPlayerClan(aplr)
				
				if(clan ~= clanBases[baseId][25]) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не находитесь в составе клана, которому принадлежит эта база.")
				
				else
					triggerEvent("onPlayerChat", aplr, "выключил генератор", 1)
					clanBaseGeneratorTurnOff(baseId)
				end
			end
		
		elseif(actionId == 97) then
			local baseId = params[1]
			
			if clanBasePlayerInsideMarker(baseId, aplr) then
				local clan = getPlayerClan(aplr)
				
				if(clan ~= clanBases[baseId][25]) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не находитесь в составе клана, которому принадлежит эта база.")
		
				elseif clanBases[baseId][33] == "off" then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Нужно запустить генератор, прежде чем удастся включить тревогу.")
				
				else
					triggerEvent("onPlayerChat", aplr, "включил тревогу на базе", 1)
					clanBaseAlarmTurnOn(baseId)
				end
			end
			
		elseif(actionId == 98) then
			local baseId = params[1]
			
			if clanBasePlayerInsideMarker(baseId, aplr) then
				local clan = getPlayerClan(aplr)
				
				if(clan ~= clanBases[baseId][25]) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не находитесь в составе клана, которому принадлежит эта база.")
				
				else
					triggerEvent("onPlayerChat", aplr, "выключил тревогу на базе", 1)
					clanBaseAlarmTurnOff(baseId)
				end
			end
			
		elseif(actionId == 99) then
			clanBaseCaptureStart(params[1], aplr)
		
		elseif(actionId == 100) then
			triggerEvent("onPlayerChat", aplr, "попытался починить генератор", 1)
			clanBaseGeneratorRepair(params[1], aplr)
		
		elseif(actionId == 101) then
			triggerEvent("onPlayerChat", aplr, "попытался улучшить базу", 1)
			clanBaseUpgrade(params[1], aplr)
		
		elseif(actionId == 102) then
			local accName = params[1]
			local day = params[2]
			local month = params[3]
			local year = params[4]
			
			if(string.len(accName) > 0) and(string.len(day) > 0) and(string.len(month) > 0) and(string.len(year) > 0) then
				day = tonumber(day)
				month = tonumber(month)
				year = tonumber(year)
				local curTime = getRealTime()
				
				if day and month and year then
					if((curTime.year+1900) >= year) and(year >= 2016) and(month >= 1) and(month <= 12) then
						local correctDay
						
						if(month == 2) then
							if isLeapYear(year) then
								correctDay = ((day >= 1) and(day <= 29))
							else
								correctDay = ((day >= 1) and(day <= 28))
							end
						
						elseif(month == 1) or (month == 3) or (month == 5) or (month == 7) or (month == 8) or (month == 10) or (month == 12) then
							correctDay = ((day >= 1) and(day <= 31))
						
						else
							correctDay = ((day >= 1) and(day <= 30))
						end
						
						if correctDay then
							repeat
								local dbq = dbQuery(db, "SELECT event, success, eventDate FROM eventsLog WHERE player=? AND eventDate BETWEEN ? AND ?", getHash(accName), getTimestamp(year, month, day, 0, 0, 0), getTimestamp(year, month, day, 23, 59, 59))
								dbqueryresult = dbPoll(dbq, 30000)
								dbFree(dbq)
							until dbqueryresult
							
							if(table.getn(dbqueryresult) > 0) then
								triggerClientEvent(aplr, "onEventsLogOpen", aplr, accName, dbqueryresult)
							else
								triggerClientEvent(aplr, "onServerMsgAdd", aplr, "За эту дату нет событий у данного игрока.")
							end
						
						else
							triggerClientEvent(aplr, "onServerMsgAdd", aplr, "День месяца находится в некорректном диапазоне.")
						end
					
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Год или месяц находятся в некорректном диапазоне.")
					end
				
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Параметры даты введены неправильно.")
				end
			
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Введите все параметры.")
			end
		
		elseif(actionId == 103) then
			
		
		elseif(actionId == 104) then
			local curTime = getRealTime()
			local curYear = curTime.year+1900
			local curMonth = curTime.month+1
			local curDay = curTime.monthday
			local expired = false
			local queryFound = false
			local plrAnswers = {}
			
			repeat
				local dbq = dbQuery(db, "SELECT question FROM queries WHERE player=?", getHash(getPlayerName(aplr)))
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			for _,answer in ipairs(dbqueryresult) do
				plrAnswers[answer["question"]] = true
			end
			
			for qid,query in ipairs(queryQuestions) do
				if(curYear > query[4]) then
					expired = true
				
				elseif(curYear < query[4]) then
					expired = false
				
				elseif(curMonth > query[3]) then
					expired = true
				
				elseif(curMonth < query[3]) then
					expired = false
				
				elseif(curDay > query[2]) then
					expired = true
				
				else
					expired = false
				end
				
				if not expired then
					if not plrAnswers[qid] then
						queryFound = true
						triggerClientEvent(aplr, "onQueryAsk", resourceRoot, qid, query[1], query[5])
						break
					end
				end
			end
			
			if queryFound then
				triggerEvent("onPlayerChat", aplr, "проходит опрос", 1)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "На данный момент для вас нет опросов. Попробуйте в другой раз.")
			end
			
		elseif(actionId == 105) then
			local weapId = getPedWeapon(aplr)
			
			if(weapId > 0) and(weapId ~= 40) then
				local receiveAmmo = params[1]
				
				if(string.len(receiveAmmo) > 0) then
					receiveAmmo = tonumber(receiveAmmo)
					
					if receiveAmmo then
						local weapAmmo = getPedTotalAmmo(aplr)
						
						if(weapAmmo >= receiveAmmo) then
							dropWeapon(aplr, weapId, receiveAmmo, false, true)
							triggerEvent("onPlayerChat", aplr, "выкинул оружие", 1)
						else
							triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "У вас нет такого количества текущего оружия/предмета.")
						end
					
					else
						triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Неправильно введено количество передаваемого оружия или предмета.")
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Вы не ввели количество передаваемого оружия или предмета.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "У вас нет оружия или предмета в руках на данный момент.")
			end
		
		elseif(actionId == 106) then
			local pup = params[1]
			
			if pup and isElement(pup) then
				local pupx, pupy, pupz = getElementPosition(pup)
				local px, py, pz = getElementPosition(aplr)
				
				if(getDistanceBetweenPoints3D(pupx, pupy, pupz, px, py, pz) <= nearbyPickupsRadius) then
					pickupWeapon(aplr, pup)
					triggerEvent("onPlayerChat", aplr, "подобрал оружие", 1)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Вы находитесь слишком далеко от оружия.")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Оружие уже подобрано.")
			end
			
		elseif(actionId == 107) then
			if isAdmin(aplr) or isModerator(aplr) or isHelper(aplr) then
				triggerClientEvent(aplr, "onReportsOpen", aplr, reportsArray)
			end
			
		elseif(actionId == 108) then
			local plrVeh = getPedOccupiedVehicle(aplr)
			
			if plrVeh and(getPedOccupiedVehicleSeat(aplr) == 0) and carTuneMarkerHit(plrVeh, params[1]) then
				triggerEvent("onPlayerChat", aplr, "заехал в тюнинг-мастерскую", 1)
			end
		
		elseif(actionId == 109) then
			local pGrp = getElementData(aplr, "usergroup")
			
			if pGrp and(pGrp == 10) then
				local players = getElementsByType("player")
				local ax, ay, az = getElementPosition(aplr)
				local px, py, pz, pdist, pelem, curelem, curdist, pprice
				
				for curname,curprice in pairs(gangsterKillOrders) do
					curelem = getPlayerFromName(curname)
					if curelem and(curelem ~= aplr) then
						px, py, pz = getElementPosition(curelem)
						curdist = getDistanceBetweenPoints3D(ax,ay,az,px,py,pz)
						if(not pdist) or (curdist<pdist) then
							pelem = curelem
							pdist = curdist
							pprice = gangsterKillOrders[curname]
						end
					end
				end
				
				triggerClientEvent(aplr, "onKillOrderFound", resourceRoot, pelem, pprice)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Поиск игрока с ценой на голову доступен только бандитам.")
			end
		
		elseif(actionId == 110) then
			local aName = getPlayerName(aplr)
			local aHash = getHash(aName)
			local aSerial = getPlayerSerial(aplr)
			
			repeat
				local dbq = dbQuery(db, "SELECT serial FROM users WHERE name = ?", aHash)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			if(table.getn(dbqueryresult) > 0) and(dbqueryresult[1]["serial"] == aSerial) then
				if dbExec(db, "UPDATE users SET assigned = 1 WHERE name = ?", aHash) then
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Ваш аккаунт был присоединен к данному компьютеру/устройству.")
					addNewEventToLog(aName, "Аккаунт - Присоединение к с/н - "..aSerial, true)
				else
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Возникла ошибка при присоединении аккаунта. Обратитесь к администрации.")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Вы можете присоединить аккаунт только к тому устройству, с которого он регистрировался на данном сервере.")
			end
			
		elseif(actionId == 111) then
			local aName = getPlayerName(aplr)
			local aHash = getHash(aName)
			local aSerial = getPlayerSerial(aplr)
			
			repeat
				local dbq = dbQuery(db, "SELECT serial FROM users WHERE name = ?", aHash)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			if(table.getn(dbqueryresult) > 0) and(dbqueryresult[1]["serial"] == aSerial) then
				if dbExec(db, "UPDATE users SET assigned = 0 WHERE name = ?", aHash) then
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Ваш аккаунт был отсоединен от данного компьютера/устройства.")
					addNewEventToLog(aName, "Аккаунт - Отсоединение от с/н - "..aSerial, true)
				
				else
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Возникла ошибка при отсоединении аккаунта. Обратитесь к администрации.")
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Аккаунт можно отсоединить только с того устройства, на котором он был зарегистрирован.")
			end
			
		elseif(actionId == 112) then
			local selPlr = findPlayerByNamePattern(params[1])
			
			if isElement(selPlr) then
				local sName = getPlayerName(selPlr)
				local sHash = getHash(sName)
				
				repeat
					local dbq = dbQuery(db, "SELECT serial, regip, assigned FROM users WHERE name = ?", sHash)
					dbqueryresult = dbPoll(dbq, 30000)
					dbFree(dbq)
				until dbqueryresult
				
				if(table.getn(dbqueryresult) > 0) then
					local resStr = "Найден игрок "..sName..". "
					--if(dbqueryresult[1]["assigned"] > 0) then
					
					if false then
						resStr = resStr.."Аккаунт присоединён к устройству. Скорее всего, он не был взломан."
					else
						local sSerial = getPlayerSerial(selPlr)
						local sIP = getPlayerIP(selPlr)
						--resStr = resStr.."Аккаунт не присоединён. "
						
						if(dbqueryresult[1]["serial"] == sSerial) then
							resStr = resStr.."Выполнен вход с устройства регистрации. "
						
						else
							resStr = resStr.."Выполнен вход с неопознанного устройства. "
						end
						
						if(dbqueryresult[1]["regip"] == sIP) then
							resStr = resStr.."IP совпадает с регистрационным."
						
						else
							resStr = resStr.."IP не совпадает с регистрационным."
						end
						
					end
					
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, resStr)
				end
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, selPlr)
			end
		elseif(actionId == 113) then
			triggerEvent("onPlayerChat", aplr, "воспользовался тригером", 1)
			groupGateTrigger(params[1], aplr)
		
		elseif(actionId == 114) then
			local faceURL = params[1]
			local pName = getPlayerName(aplr)
			if(string.lower(string.sub(faceURL, 1, 7)) ~= "http://") then
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Ссылка на лицо персонажа должна начинаться с 'http://'")
			elseif(string.lower(string.sub(faceURL, -4)) ~= ".png") then
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Ссылка на лицо персонажа должна заканчиваться на '.png'")
			elseif dbExec(db, "UPDATE users SET face=? WHERE name=?", faceURL, getHash(pName)) then
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Лицо персонажа установлено. Для его появления перезайдите на сервер. Помните, что для работоспособности размер изображения должен быть 256х256.")
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Возникла ошибка при назначении лица персонажа. Обратитесь к администрации.")
			end
		
		elseif(actionId == 115) then
			if dbExec(db, "UPDATE users SET face=? WHERE name=?", nil, getHash(getPlayerName(aplr))) then
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Лицо персонажа очищено. Для применения изменений перезайдите на сервер.")
			else
				triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Возникла ошибка при назначении лица персонажа. Обратитесь к администрации.")
			end
		
		elseif(actionId == 116) then
			local plr = params[1]
			
			if plr and isElement(plr) then
				local respect = getElementData(plr, "respect")
				local px, py, pz = getElementPosition(plr)
				local ax, ay, az = getElementPosition(aplr)
				--[[if(respect < 0.0) then
					triggerClientEvent(aplr, "onServerMsgAdd", resourceRoot, "Вы не можете предложить игроку с отрицательной репутацией оплатить штраф.")]]
				
				if(getPlayerWantedLevel(plr) > 0) and isPlayerFromPolice(aplr) and(getDistanceBetweenPoints3D(px,py,pz,ax,ay,az) <= nearbyPlayersRadius) then
					local lowrider = getElementData(plr, "lowrider")
					
					if lowrider then
						return false
					end
					local rc = getElementData(plr, "RC")
					
					if rc then
						return false
					end
					triggerEvent("onPlayerChat", aplr, "предлагает оплатить штраф игроку "..getPlayerName(plr), 1)
					triggerClientEvent(params[1], "onFineRequest", aplr, buyoutPrice)
				end
			end
			
		elseif(actionId == 117) then
			
			if isPlayerBusy(aplr) then
				playerShowMessage(aplr, "Вы не можете создать мероприятие, так как заняты чем-то другим.")
			else
				specialEventCreate(aplr, params[1])
			end
			
		elseif(actionId == 118) then
			local eId = params[1]
			
			if specialEvents[eId] and(getPlayerFromName(specialEvents[eId][1]) == aplr) then
				triggerClientEvent(aplr, "onSpecialEventTriggerWindow", resourceRoot)
			end
		
		elseif(actionId == 119) then
			local eId = params[1]
			
			if specialEvents[eId] and(getPlayerFromName(specialEvents[eId][1]) == aplr) then
				if not specialEventOpen(eId) then
					playerShowMessage(aplr, "Возникла ошибка при открытии мероприятия.")
				end
			end
		
		elseif(actionId == 120) then
			local eId = params[1]
			
			if specialEvents[eId] and(getPlayerFromName(specialEvents[eId][1]) == aplr) then
				if not specialEventStart(eId) then
					playerShowMessage(aplr, "Возникла ошибка при старте мероприятия.")
				end
			end
		
		elseif(actionId == 121) then
			local eId = params[1]
			
			if specialEvents[eId] and(getPlayerFromName(specialEvents[eId][1]) == aplr) then
				if not specialEventRestart(eId) then
					playerShowMessage(aplr, "Возникла ошибка при рестарте мероприятия.")
				end
			end
		
		elseif(actionId == 122) then
			local eId = params[1]
			
			if specialEvents[eId] and(getPlayerFromName(specialEvents[eId][1]) == aplr) then
				if not specialEventDestroy(eId) then
					playerShowMessage(aplr, "Возникла ошибка при завершении мероприятия.")
				end
			end
		
		elseif(actionId == 123) then
			local eId = params[1]
			
			if specialEvents[eId] and(specialEvents[eId][3] == 0) then
				if not specialEventAddElement(eId, aplr, nil, nil, nil, nil, nil, nil, true) then
					playerShowMessage(aplr, "Возникла ошибка при присоединении к мероприятию. Возможно, вы заняты чем-то другим на данный момент, или лимит участников превышен.")
				end
			else
				playerShowMessage(aplr, "Невозможно присоединиться к данному мероприятию. Набор участников закрыт или мероприятие уже завершено.")
			end
		
		elseif(actionId == 124) then
			local eId = params[1]
			
			if specialEvents[eId] and(specialEvents[eId][3] <= 0) then
				local member = params[2]
				local skinId = tonumber(params[3])
				if(not skinId) or (specialEventGetEventByElement(member) ~= eId) or (not specialEventSetElementModel(eId, member, skinId)) then
					playerShowMessage(aplr, "Возникла ошибка при смене скина данного участника мероприятия. Проверьте введенные данные.")
				end
			end
		
		elseif(actionId == 125) then
			local fId = fractionGetPlayerFraction(aplr)
			if fId then
				triggerClientEvent(aplr, "onFractionOpenMenu", aplr)
			end
		
		elseif(actionId == 126) then
			local fFound = false
			local pFound = false
			
			for fId,fInfo in ipairs(fractions) do
				if(string.lower(fInfo[1]) == string.lower(params[1])) then
					local plr = getPlayerFromName(params[2])
					fFound = true
					
					if plr then
						pFound = true
						local setResult = fractionSetPlayerFraction(plr, fId)
						
						if(setResult == true) then
							setResult = fractionSetLeader(fId, plr)
						end
						
						if(setResult == true) then
							playerShowMessage(aplr, "Вы назначили игрока "..params[2].." лидером фракции '"..params[1].."'.")
							playerShowMessage(plr, "Администратор "..getPlayerName(aplr).." назначил вас лидером фракции '"..params[1].."'.")
						
						else
							playerShowMessage(aplr, "Не удалось назначить данного игрока лидером. Причина: "..tostring(setResult)..".")
						end
					end
					
					break
				end
			end
			
			if not fFound then
				playerShowMessage(aplr, "Не удалось назначить лидера. Фракция с таким именем отсутствует.")
			
			elseif not pFound then
				playerShowMessage(aplr, "Не удалось назначить лидера. Игрок с таким никнеймом отсутствует на сервере.")
			end
			
		elseif(actionId == 127) then
			local veh = params[1]
			
			if not isElement(veh) then
				return false
			end
			
			local newOwner = params[2]
			
			if not isElement(newOwner) then
				return false
			end
			local price = tonumber(params[3])
			
			if price and(price >= 0) then
				price = math.floor(price)
				local aint = getElementInterior(aplr)
				local oint = getElementInterior(newOwner)
				local adim = getElementDimension(aplr)
				local odim = getElementDimension(newOwner)
				
				if(aint == oint) and(adim == odim) then
					local ax, ay, az = getElementPosition(aplr)
					local ox, oy, oz = getElementPosition(newOwner)
					
					if(getDistanceBetweenPoints3D(ax,ay,az,ox,oy,oz) <= nearbyPlayersRadius) then
						if not (isVehicleBlown(veh) or isElementInWater(veh)) then
							local curOwner = getElementData(veh, "owner")
							
							if curOwner and(curOwner ~= newOwner) then
								if(curOwner == getHash(getPlayerName(aplr))) then
									triggerClientEvent(newOwner, "onVehicleSellRequest", aplr, veh, price)
									playerShowMessage(aplr, "Вы предложили купить данное ТС игроку "..getPlayerName(newOwner)..".")
								
								else
									playerShowMessage(aplr, "Это транспортное средство не принадлежит вам.")
								end
							
							else
								playerShowMessage(aplr, "Это транспортное средство уже принадлежит данному игроку.")
							end
							
						else
							playerShowMessage(aplr, "Транспортное средство уничтожено и не может быть продано.")
						end
					
					else
						playerShowMessage(aplr, "Вы слишком далеко от игрока.")
					end
					
				else
					playerShowMessage(aplr, "Вы слишком далеко от игрока.")
				end
				
			else
				playerShowMessage(aplr, "Неправильно введена цена.")
			end
			
		elseif(actionId == 128) then
			local houseid = params[1]
			
			if not (houseid and houses[houseid]) then
				return false
			end
			
			local newOwner = params[2]
			
			if not isElement(newOwner) then
				return false
			end
			
			local price = tonumber(params[3])
			
			if not (price and(price >= 0)) then
				playerShowMessage(aplr, "Неправильно введена цена.")
				return false
			end
			
			price = math.floor(price)
			local curHash = getHash(getPlayerName(aplr))
			
			if(houses[houseid][11] ~= curHash) then
				playerShowMessage(aplr, "Вам не принадлежит данная недвижимость.")
				return false
			end
			
			local aint = getElementInterior(aplr)
			local oint = getElementInterior(newOwner)
			local adim = getElementDimension(aplr)
			local odim = getElementDimension(newOwner)
			
			if(aint ~= oint) or (adim ~= odim) then
				playerShowMessage(aplr, "Вы слишком далеко от данного игрока.")
				return false
			end
			
			local ax, ay, az = getElementPosition(aplr)
			local ox, oy, oz = getElementPosition(newOwner)
			
			if(getDistanceBetweenPoints3D(ax,ay,az,ox,oy,oz) > nearbyPlayersRadius) then
				playerShowMessage(aplr, "Вы слишком далеко от данного игрока.")
				return false
			end
			
			local newMoney = getMoney(newOwner)
			
			if(newMoney < price) then
				playerShowMessage(aplr, "У данного игрока недостаточно денег.")
				return false
			end
			
			triggerClientEvent(newOwner, "onHouseSellRequest", aplr, houseid, price)
			playerShowMessage(aplr, "Вы предложили купить данную недвижимость игроку "..getPlayerName(newOwner)..".")
		
		elseif(actionId == 129) then
			local gangster = findPlayerByNamePattern(params[1])
			
			if not isElement(gangster) then
				playerShowMessage(aplr, gangster)
				return false
			end
			
			local wantedLvl = tonumber(params[2])
			
			if not wantedLvl then
				playerShowMessage(aplr, "Неправильно введен уровень розыска")
				return false
			end
			policeSetWantedLevel(aplr, gangster, wantedLvl, params[3])
		
		elseif(actionId == 130) then
			if gangsterStealPlayers[aplr] then
				local objid = params[1]
				
				if gangsterStealPlayers[aplr][4][objid] then
					local objmdl = getElementModel(gangsterStealPlayers[aplr][4][objid])
					local itemId = nil
					
					for curItemId,curItem in ipairs(inventoryItemNames) do
						if gangsterStealIdObjs[curItemId] and(curItem[3] == objmdl) then
							itemId = curItemId
							break
						end
					end
					
					if itemId and gangsterStealIdObjs[itemId] then
						local slotId = inventoryCheckForSlot(aplr, itemId)
						if slotId and inventoryNewItem(aplr, itemId, slotId) then
							destroyElement(gangsterStealPlayers[aplr][4][objid])
							gangsterStealPlayers[aplr][4][objid] = false
						else
							playerShowMessage(aplr, "В инвентаре нет доступных слотов для этого предмета.")
						end
					end
				end
			end
		
		elseif(actionId == 131) then
			if gangsterStealPlayers[aplr] then
				local objid = params[1]
				
				if gangsterStealPlayers[aplr][5][objid] and gangsterStealPlayers[aplr][5][objid][2] then
					local messageStr
					local itemFound = (math.random(100) > 50)
					
					if itemFound then
						local itemIds = {}
						
						for curItemId,_ in pairs(gangsterStealIdObjs) do
							table.insert(itemIds, curItemId)
						end
						
						local itemId = itemIds[math.random(#itemIds)]
						local slotId = inventoryCheckForSlot(aplr, itemId)
						messageStr = "Вы нашли '"..string.match(inventoryItemNames[itemId][1],"(.*)").."'"
						
						if not (slotId and inventoryNewItem(aplr, itemId, slotId)) then
							local ix, iy, iz = getElementPosition(aplr)
							messageStr = messageStr..", но этот предмет не поместился в инвентарь"
							inventoryCreateDroppedItem(inventoryItemNames[itemId][3], aplr, ix, iy, iz, itemId)
						end
						
					else
						messageStr = "Вы ничего не нашли"
					end
					
					playerShowMessage(aplr, messageStr)
					gangsterStealPlayers[aplr][5][objid][2] = false
				end
			end
		
		elseif(actionId == 132) then
			local serial = params[1]
			
			if(string.len(serial) <= 0) then
				playerShowMessage(aplr, "Вы не ввели серийный номер игрока.")
				return false
			end
			
			repeat
				local dbq = dbQuery(db, "SELECT name FROM users WHERE serial = ?", serial)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			if(table.getn(dbqueryresult) > 0) then
				local players = getElementsByType("player")
				
				for _,curRec in ipairs(dbqueryresult) do
					for _,curPlr in ipairs(players) do
						if isElement(curPlr) and(getHash(getPlayerName(curPlr)) == curRec["name"]) then
							kickPlayer(curPlr, aplr, "Удален")
							break
						end
					end
				end
				
				if dbExec(db, "DELETE FROM users WHERE serial=?", serial) then
					playerShowMessage(aplr, "Все аккаунты с данным серийным номером были удалены.")
				else
					playerShowMessage(aplr, "Возникла ошибка при удалении аккаунтов по серийному номеру.")
				end
				
			else
				playerShowMessage(aplr, "В базе отсутствуют игроки с таким серийным номером.")
			end
			
		elseif(actionId == 133) then
			local bansRemoved = resplayDelBan(params[1], params[2], getPlayerName(aplr))
			
			if bansRemoved then
				playerShowMessage(aplr, "Все баны с ключом "..params[2].." были удалены.")
			else
				playerShowMessage(aplr, "В банах не найдено ключа "..params[2]..".")
			end
			
		elseif(actionId == 134) then
			if isPlayerFromPolice(aplr) then
				local plr = params[1]
				
				if isPedInVehicle(plr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Нельзя обыскать человека, находящегося в транспорте.")
				
				elseif isElementInWater(plr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Нельзя обыскать человека, находящегося в воде.")
				
				elseif not isPedOnGround(plr) then
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Нельзя обыскать человека, находящегося не на земле.")
				
				else
					local ax, ay, az = getElementPosition(aplr)
					local px, py, pz = getElementPosition(plr)
					
					if(getElementInterior(aplr) == getElementInterior(plr))
						and(getElementDimension(aplr) == getElementDimension(aplr))
						and(getDistanceBetweenPoints3D(ax,ay,az,px,py,pz) < nearbyPlayersRadius) then
						local pName = getPlayerName(plr)
						local slots = inventoryGetSlots(pName)
						
						for _,item in pairs(slots) do
							if inventoryIllegalItems[item] then
								triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока "..pName.." найден предмет '"..inventoryItemNames[item][1].."'.")
								return true
							end
						end
						
						local weap, weapAmmo
						
						for i=1,12 do
							weap = getPedWeapon(plr, i)
							weapAmmo = getPedTotalAmmo(plr, i)
							if(weap ~= 0) and(weapAmmo > 0) then
								triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока "..pName.." имеется при себе оружие.")
								return true
							end
						end
						
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У игрока "..pName.." не найдено запрещенных предметов.")
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Игрок находится далеко от вас.")
					end
				end
			end
			
		elseif(actionId == 135) then
			call(getResourceFromName(params[1]), params[2], aplr, params[3])
		
		elseif(actionId == 136) then
			local veh = getPedOccupiedVehicle(aplr)
			
			if veh and(getPedOccupiedVehicleSeat(aplr) == 0) then
				local veId = specialEventGetEventByElement(veh)
				
				if veId then
					specialEventRemoveElement(veId, veh)
				end
			end
			
			setElementHealth(aplr, 0.0)
		
		elseif(actionId == 137) then
			local eId = params[1]
			
			if specialEvents[eId] then
				if not specialEventRemoveElement(eId, aplr) then
					playerShowMessage(aplr, "Возникла ошибка при отсоединении от мероприятия.")
				end
			end
			
		elseif(actionId == 138) then
			local veh = params[1]
			local px, py, pz = getElementPosition(aplr)
			local vx, vy, vz = getElementPosition(veh)
			
			if(getDistanceBetweenPoints3D(px, py, pz, vx, vy, vz) <= nearbyVehiclesRadius) then
				gangsterStealStartCar(veh, aplr)
			end
		
		elseif(actionId == 139) then
			local mInfo = gangsterStealCarSellMarkers[params[1]]
			
			if not mInfo then
				return
			end
			
			if isElementWithinMarker(aplr, mInfo[5]) then
				local wantedCars = gangsterStealGetWantedCars(mInfo[5])
				
				if wantedCars then
					playerShowMessage(aplr, "Здесь требуются следующие автомобили: "..wantedCars..".")
				else
					playerShowMessage(aplr, "Здесь, пока что, больше не требуются краденные автомобили.")
				end
			end
			
		elseif(actionId == 140) then
			furnitureTake(params[1], aplr)

		elseif(actionId == 141) then
			triggerClientEvent(aplr, "onGangRequest", aplr)
			
		elseif(actionId == 142) then -- Запрос на подтверждения покупки дома с госа
			local hindex = params[1]
		    triggerClientEvent(aplr, "onHouseBuyGosRequest", aplr, hindex)
			
		elseif(actionId == 143) then -- Запрос на подтверждения продажи дома в гос
			local hindex = params[1]
            triggerClientEvent(aplr, "onHouseSellGosRequest", aplr, hindex)
			
		elseif(actionId == 144) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "a69AlarmEnable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Включил тревогу в зоне 69.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы включить тревогу")
			end
			
		elseif(actionId == 145) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "lvaAlarmEnable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Включил тревогу в Топливном складе Лас-Вентурас.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы включить тревогу")
			end
		
		elseif(actionId == 146) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "sfaAlarmEnable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Включил тревогу на Авианосце.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы включить тревогу")
			end
		
		elseif(actionId == 147) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "lsaAlarmEnable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Включил тревогу на военной базе ЛС.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы включить тревогу")
			end
		
		elseif(actionId == 148) then
			
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "a69AlarmDisable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Выключил тревогу в зоне 69.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы выключить тревогу")
			end
			
		elseif(actionId == 149) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "lvaAlarmDisable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Выключил тревогу в Топливном складе Лас-Вентурас.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы выключить тревогу")
			end
		
		elseif(actionId == 150) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "sfaAlarmDisable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Выключил тревогу на Авианосце.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы выключить тревогу")
			end
		
		elseif(actionId == 151) then
		    if(getElementData(aplr, "usergroup") == 5) then
				triggerClientEvent(getElementsByType("player"), "lsaAlarmDisable", resourceRoot)
				triggerEvent("onPlayerChat", aplr, "Выключил тревогу на военной базе ЛС.", 2)
			else
		        triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы должны быть военным чтобы выключить тревогу")
			end

        -- Действия для админ функционала(с 700)
			
		elseif(actionId == 700) then
			local fFound = false
			local pFound = false
			for fId,fInfo in ipairs(fractions) do
				if(string.lower(fInfo[1]) == string.lower(params[1])) then
					local plr = getPlayerFromName(params[2])
					fFound = true
					if plr then
						pFound = true
						local setResult = fractionSetPlayerFraction(plr, fId)
						if( setResult == true ) then
							playerShowMessage(aplr, "Вы приняли игрока "..params[2].." во фракцию '"..params[1].."'.")
							playerShowMessage(plr, "Администратор "..getPlayerName(aplr).." принял вас во фракцию '"..params[1].."'.")
							fractionUpdate(fId, true, false)
						else
							playerShowMessage(aplr, "Не удалось принять игрока во фракцию. Причина: "..tostring( setResult )..".")
						end
					end
					break
				end
			end
			if not fFound then
				playerShowMessage(aplr, "Не удалось принять игрока во фракцию. Фракция с таким именем отсутствует.")
			elseif not pFound then
				playerShowMessage(aplr, "Не удалось принять игрока во фракцию. Игрок с таким никнеймом отсутствует на сервере.")
			end

		elseif(actionId == 701) then
			local pFound = false
			for fId,fInfo in ipairs(fractions) do
			    local plr = getPlayerFromName(params[2])
				--fFound = true
				if plr then
					pFound = true
					local setResult = fractionRemovePlayerFromFraction(plr, fId)
					if( setResult == true ) then
					    playerShowMessage(aplr, "Вы уволили игрока "..params[2].." из фракции ")
					    playerShowMessage(plr, "Администратор "..getPlayerName(aplr).." уволил вас из фракции.")
						setPlayerNewGroup(plr, groupCommonGet(plr), true)
					else
						playerShowMessage(aplr, "Не удалось уволить игрока с фракции. Причина: "..tostring( setResult )..".")
					end
				end
				break
			end
			if not pFound then
				playerShowMessage(aplr, "Не удалось уволить игрока. Игрок с таким никнеймом отсутствует на сервере.")
			end
			
        elseif(actionId == 702) then
			local name = params[1]
			
			if(string.len(name) <= 0) then
				playerShowMessage(aplr, "Вы не ввели ID аккаунта.")
				return false
			end
			
			repeat
				local dbq = dbQuery(db, "SELECT name FROM users WHERE name = ?", name)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			if(table.getn(dbqueryresult) > 0) then
				local players = getElementsByType("player")
				
				for _,curRec in ipairs(dbqueryresult) do
					for _,curPlr in ipairs(players) do
						if isElement(curPlr) and(getHash(getPlayerName(curPlr)) == curRec["name"]) then
							kickPlayer(curPlr, aplr, "Удален")
							break
						end
					end
				end
				
				if dbExec(db, "DELETE FROM users WHERE name=?", name) then
					playerShowMessage(aplr, "Аккаунт был удалён")
				else
					playerShowMessage(aplr, "Возникла ошибка при удалении аккаунта")
				end
				
			else
				playerShowMessage(aplr, "В базе отсутствует данный аккаунт.")
			end
			
		elseif(actionId == 703) then
			local fFound = false
			local pFound = false
			
			for fId,fInfo in ipairs(fractions) do
				if(string.lower(fInfo[1]) == string.lower(params[1])) then
					local plr = getPlayerFromName(params[2])
					fFound = true
					
					if plr then
						pFound = true
						local setResult = fractionRemoveLeader(fId, plr)
						
						if(setResult == true) then
							playerShowMessage(aplr, "Вы сняли игрока "..params[2].." с лидера")
							playerShowMessage(plr, "Администратор "..getPlayerName(aplr).." снял вас с лидера фракции '"..params[1].."'.")
						
						else
							playerShowMessage(aplr, "Не удалось снять данного игрока с лидера. Причина: "..tostring(setResult)..".")
						end
					end
					
					break
				end
			end

		-- Клиентские действия(с 10001)
		elseif(actionId == 10001) then
			local slotId = inventoryCheckForSlot(aplr, 1)
			
			if(slotId) then
				local money = getMoney(aplr)
				if(money >= params[1]) then
					
					if(inventoryNewItem(aplr, 1, slotId)) then
						triggerEvent("onPlayerChat", aplr, "купил газировку в автомате", 1)
						local sx, sy, sz = getElementPosition(aplr)
						local curCol = createColSphere(sx, sy, sz, 100)
						local players = getElementsWithinColShape(curCol, "player")
						destroyElement(curCol)
						triggerClientEvent(players, "onServerPlaySFX3D", aplr, "script", 203, 0, sx, sy, sz, false, 40, nil, 0.5, 2400)
						takeMoney(aplr, params[1])
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов для газировки.")
			end
		
		elseif(actionId == 10002) then
			local houseid = getElementDimension(aplr)-1
			local curId = 1
			
			for _,house in pairs(houses) do
				if(curId == houseid) then
					houseid = house[1]
					break
				else
					curId = curId+1
				end
			end
			
			local hx, hy, hz = getElementPosition(houses[houseid][4])
			setElementPosition(aplr, hx, hy, hz)
			setElementInterior(aplr, 0)
			setElementDimension(aplr, 0)
			triggerClientEvent(aplr, "onHouseExit", aplr)
			gangsterStealStop(aplr)
			playersInsideHouses[aplr] = nil
			furnitureDecline(aplr)
			triggerEvent("onPlayerChat", aplr, "вышел из дома", 1)
		
		elseif(actionId == 10003) then
			local ammuid = getElementDimension(aplr)
			setElementPosition(aplr, ammuShops[ammuid][2], ammuShops[ammuid][3], ammuShops[ammuid][4])
			setElementRotation(aplr, 0, 0, ammuShops[ammuid][5])
			setElementInterior(aplr, 0)
			setElementDimension(aplr, 0)
			triggerClientEvent(aplr, "onAmmuExit", aplr)
			triggerEvent("onPlayerChat", aplr, "вышел из аммуниции", 1)
		
		elseif(actionId == 10004) then
			local respect = getElementData(aplr, "respect")
			
			if respect then
				respect = math.abs(respect)
				setElementFrozen(aplr, true)
				setElementCollisionsEnabled(aplr, false)
				local ammuLevel
				
				if(respect < 0.25) then
					ammuLevel = 1
				
				elseif(respect < 0.50) then
					ammuLevel = 2
				
				elseif(respect < 0.75) then
					ammuLevel = 3
				
				elseif(respect < 1) then
					ammuLevel = 4
				
				else
				    ammuLevel = 5
				end
				
				local curAmmuWeap = {}
				
				for i=1,ammuLevel do
					for i2=1,table.getn(ammuWeapons[i]) do
						table.insert(curAmmuWeap, ammuWeapons[i][i2])
					end
				end
				
				triggerClientEvent(aplr, "onAmmuOpenMenu", aplr, curAmmuWeap)
			end
		
		elseif(actionId == 10005) then 
			local eatid = getElementDimension(aplr)
			
			if isPlayerInHospital(aplr) and (getElementHealth(aplr) < 50.0) then -- блок на выход из больницы если меньше 50% хп.
			    triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете выйти из больницы, пока не вылечитесь до 50%")
				return false
			end
			
			setElementPosition(aplr, eatLocations[eatid][2], eatLocations[eatid][3], eatLocations[eatid][4])
			setElementRotation(aplr, 0, 0, eatLocations[eatid][5])
			setElementInterior(aplr, 0)
			setElementDimension(aplr, 0)
			triggerClientEvent(aplr, "onEatExit", aplr)
			
			if getElementData(aplr, "godMode") then
				removeElementData(aplr, "godMode")
			end
			
			triggerEvent("onPlayerChat", aplr, "вышел из здания", 1)
		
		elseif(actionId == 10006) then
			local itemId = params[1]
			local shopId = getElementDimension(aplr)
			local income = math.ceil(params[2]*0.5)
			local obj = params[3]
			
			if(itemId > 400) and(itemId < 447) then
				local money = getMoney(aplr)
				
				if(money >= params[2]) or (params[2] <= 0) then
					local ammoNum
					
					if(itemId == 418) then
						ammoNum = 1
					else
						ammoNum = 200
					end
					
					if giveWeapon(aplr, itemId-400, ammoNum) then
						takeMoney(aplr, params[2])
						
						if(shopId > 0) then
							local baseid = clanBaseBusinesses[eatLocations[shopId][7]]
							
							if baseid and clanBases[baseid][25] then
								clanBaseGiveMoney(baseid, params[2]-income, true)
							end
							
							if(eatLocations[shopId][9] ~= 0) then
								eatLocations[shopId][8] = eatLocations[shopId][8]+income
								dbExec(db, "UPDATE businesses SET money=? WHERE id=?", eatLocations[shopId][8], eatLocations[shopId][7])
							end
						end
						
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "Вы не можете унести с собой больше этого предмета.")
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
			else
				local slotId = inventoryCheckForSlot(aplr, params[1])
				
				if(slotId) then
					local money = getMoney(aplr)
					
					if(money >= params[2]) or (params[2] <= 0) then
						if(inventoryNewItem(aplr, params[1], slotId)) then
							takeMoney(aplr, params[2])
							
							if(shopId > 0) then
								local baseid = clanBaseBusinesses[eatLocations[shopId][7]]
								
								if baseid and clanBases[baseid][25] then
									clanBaseGiveMoney(baseid, params[2]-income, true)
								end
								
								if(eatLocations[shopId][9] ~= 0) then
									eatLocations[shopId][8] = eatLocations[shopId][8]+income
									dbExec(db, "UPDATE businesses SET money=? WHERE id=?", eatLocations[shopId][8], eatLocations[shopId][7])
								end
								
							end
						end
						
					else
						triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
					end
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов.")
				end
				
			end
		
		elseif(actionId == 10007) then
			local otbid = getElementDimension(aplr)
			setElementPosition(aplr, otbLocations[otbid][2], otbLocations[otbid][3], otbLocations[otbid][4])
			setElementRotation(aplr, 0, 0, otbLocations[otbid][5])
			setElementInterior(aplr, 0)
			setElementDimension(aplr, 0)
			triggerClientEvent(aplr, "onOtbExit", aplr)
			triggerEvent("onPlayerChat", aplr, "вышел из букмекерской конторы", 1)
		
		elseif(actionId == 10008) then
			local slotId = inventoryGetItemSlot(aplr, 10)
			
			if slotId then
				giveMoney(aplr, inventoryItemNames[10][2])
				inventoryRemoveItem(aplr, slotId)
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет ни одного ящика с оружием.")
			end
			
		elseif(actionId == 10009) then
			local slotId = inventoryCheckForSlot(aplr, 11)
			
			if(slotId) then
				local money = getMoney(aplr)
				
				if(money >= params[1]) then
					if(inventoryNewItem(aplr, 11, slotId)) then
						local sx, sy, sz = getElementPosition(aplr)
						local curCol = createColSphere(sx, sy, sz, 50)
						local players = getElementsWithinColShape(curCol, "player")
						destroyElement(curCol)
						triggerClientEvent(players, "onServerPlaySFX3D", aplr, "script", 203, 0, sx, sy, sz, false, 40, nil, 0.5, 2400)
						takeMoney(aplr, params[1])
					end
					
				else
					triggerClientEvent(aplr, "onServerMsgAdd", aplr, "У вас недостаточно денег.")
				end
				
			else
				triggerClientEvent(aplr, "onServerMsgAdd", aplr, "В инвентаре нет доступных слотов для орешек.")
			end
		
		elseif(actionId == 10010) then
			local slotId = params[1]
			local itemId = params[2]
			
			if(inventoryGetItemInSlot(aplr, slotId) == itemId) then
				local price = inventoryItemNames[itemId][2]
				inventoryRemoveItem(aplr, slotId)
				giveMoney(aplr, price)
				playerShowMessage(aplr, "Вы продали продавцу данный предмет за $"..tostring(price))
			end
			
		end
	end
end

function policeSetWantedLevel(policeman, gangster, wantedLvl, reason)
	if isElement(policeman) and isElement(gangster) and isPlayerFromPolice(policeman) then
		local curWL = getPlayerWantedLevel(gangster)
		
		if((curWL >= wantedLvl) and(wantedLvl ~= 0)) or (wantedLvl > 6) or (wantedLvl < 0) then
			playerShowMessage(policeman, "У этого игрока уже установлен данный уровень розыска или уровень розыска введен неправильно.")
			return false
		end
		
		local reasonText
		
		if(string.len(reason) > 0) then
			reasonText = " с причиной '"..reason.."'."
		else
			reasonText = " без причины."
		end
		
		local eventNameGangster, eventNamePolice
		
		if(wantedLvl > 0) then
			eventNameGangster = "Получение"
			eventNamePolice = "Установка"
			playerShowMessage(policeman, "Вы установили уровень розыска "..tostring(wantedLvl).." игроку "..getPlayerName(gangster)..reasonText)
			playerShowMessage(gangster, "Вы получили уровень розыска "..tostring(wantedLvl).." от игрока "..getPlayerName(policeman)..reasonText)
			attachActionToElement(defaultActions[134], gangster)
			attachActionToElement(defaultActions[116], gangster)
		
		else
			eventNameGangster = "Очистка"
			eventNamePolice = "Снятие"
			playerShowMessage(policeman, "Вы очистили уровень розыска игроку "..getPlayerName(gangster)..reasonText)
			playerShowMessage(gangster, "С вас был снят уровень розыска игроком "..getPlayerName(policeman)..reasonText)
			detachActionFromElement(defaultActions[134], gangster)
			detachActionFromElement(defaultActions[116], gangster)
		end
		
		addNewEventToLog(getPlayerName(gangster), "Уровень розыска - "..eventNameGangster.." - "..tostring(wantedLvl).." от "..getPlayerName(policeman).."("..reason..")", true)
		addNewEventToLog(getPlayerName(policeman), "Уровень розыска - "..eventNamePolice.." - "..tostring(wantedLvl).." для "..getPlayerName(gangster).."("..reason..")", true)
		setPlayerWantedLevel(gangster, wantedLvl)
		wantedCooldowns[gangster] = nil
		setElementData(gangster, "wantedLevel", wantedLvl)
		dbExec(db, "UPDATE users SET wantedLevel=? WHERE name=?", wantedLvl, getHash(getPlayerName(gangster)))
		return true
	end
	
	playerShowMessage(policeman, "Ошибка при установке уровня розыска игроку.")
	return false
end

function isPlayerGroupCommon(grpid)
	return((grpid == 1) or (grpid == 10) or (grpid == 12) or (grpid == 13) or (grpid == 15))
end

function checkPlayerGroup(plr)
	if not getElementData(plr, "spawned") then
		return false
	end

	local fId = fractionGetPlayerFraction(plr)
	local respectCur = getElementData(plr, "respect")
	
	if not fId then
		local curGrp = getElementData(plr, "usergroup")
		local respectNeedMin, respectNeedMax = playerGroupRPLevels[curGrp][1], playerGroupRPLevels[curGrp][2]
		local moneyAmount = getMoney(plr)
		local commonGrp = groupCommonGet(plr)
		
		if(respectCur < respectNeedMin) or isPlayerGroupCommon(curGrp) or ((moneyAmount < 0) and not ((curGrp == 8) or (curGrp == 12))) then
			if not (curGrp == commonGrp) then
				for jobId=1,table.getn(jobWorkers) do
					for i=1,table.getn(jobWorkers[jobId]) do
						if(jobWorkers[jobId][i][1] == plr) then
							removeWorker(jobId, plr, 6)
							break
						end
					end
				end
				setPlayerNewGroup(plr, commonGrp)
			end
		end

		-- change skin
		local sHash = getHash(getPlayerName(plr))
		repeat
			dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", sHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		local grpId = dbqueryresult[1]["usergroup"]
		local gender = dbqueryresult[1]["gender"]
		local race = dbqueryresult[1]["race"] + 1
		local sknId = dbqueryresult[1]["skin"]

		if not hasValueInTable(sknId, playerGroups[grpId][2][race][gender]) then
			refreshSkin(plr, curGrp)
		end
	end
	
	if(isModerator(plr) or isAdmin(plr)) and(respectCur < 1.0) then
		respectSet(plr, 1.0, -1.0, 1.0)
	
	elseif isHelper(plr) and(respectCur < 0.3) then
		respectSet(plr, 0.3, -1.0, 1.0)
	end
end

function refreshSkin(plr, grpid)
	local sHash = getHash(getPlayerName(plr))
	repeat
		dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", sHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult

	
	local gender = dbqueryresult[1]["gender"]
	local race = dbqueryresult[1]["race"] + 1

	-- outputServerLog("grpid "..tostring(grpid)..")")
	-- outputServerLog("race "..tostring(race)..")")
	-- outputServerLog("gender "..tostring(gender)..")")
	-- outputServerLog("table.getn "..tostring(table.getn(playerGroups[grpid][2][race][gender]))..")")
	-- outputServerLog("math.random "..tostring(math.random(table.getn(playerGroups[grpid][2][race][gender])))..")")

	local sknid = playerGroups[grpid][2][race][gender][math.random(table.getn(playerGroups[grpid][2][race][gender]))]
	-- outputServerLog("sknid"..tostring(sknid)..")")

	-- Set civil skin --
	if grpid == 1 then
		-- Fetch default civil skin --
		local skinFromDb = dbqueryresult[1]["default_skin"]
		if skinFromDb == 0 then
			-- REFRESH CIVIL SKIN IF NOT INITED --
			local randNum = math.random(table.getn(playerGroups[1][2][race][gender]))
			sknid = playerGroups[1][2][race][gender][randNum]
			dbExec(db, "UPDATE users SET default_skin=?, skin_inited=1, skin=? WHERE name=?", sknid, sknid, sHash)
		else
			sknid = skinFromDb
		end	
	else
		-- Fetch fraction skin
		local skinFromDb = dbqueryresult[1]["fraction_skin"]
		if skinFromDb == 0 then
			-- init fraction skin
			dbExec(db, "UPDATE users SET fraction_skin=?, skin=? WHERE name=?", sknid, sknid, sHash)
		else
			if hasValueInTable(skinFromDb, playerGroups[grpid][2][race][gender]) then -- Check if userGroup remains the same
				-- userGroup has changed, change the skin 
				sknid = skinFromDb
			end
			dbExec(db, "UPDATE users SET fraction_skin=?, skin=? WHERE name=?", sknid, sknid, sHash)
		end
	end
	
	-------
	-- outputServerLog("New skin"..tostring(sknid)..")")

	if(dbExec(db, "UPDATE users SET skin=? WHERE name=?", sknid, sHash)) then
		setElementModel(plr, sknid)
	end
end

function checkMoney(plr)
	if isElement(plr) then
		local pMoney = getMoney(plr)
		if(pMoney < 0) then
			local pHash = getHash(getPlayerName(plr))
			dbQuery(checkMoney2, {plr, pHash}, db, "SELECT id,carid,hp FROM cars WHERE owner=?", pHash)
		end
	end
end

function checkMoney2(dbq, plr, pHash)
	if isElement(plr) then
		dbqueryresult = dbPoll(dbq, 0)
		dbFree(dbq)
		local sellIndex = 0
		local sellPrice = 0
		local curPrice
		
		for i=1,table.getn(dbqueryresult) do
			curPrice = math.ceil(getVehiclePrice(dbqueryresult[i]["carid"])* (dbqueryresult[i]["hp"]/1000)*0.75)
			if(curPrice > sellPrice) then
				sellIndex = i
				sellPrice = curPrice
			end
		end
		
		if(sellIndex > 0) then
			local allVehicles = getElementsByType("vehicle")
			local sqlid
			local veh = nil
			
			for i=1,table.getn(allVehicles) do
				sqlid = getElementData(allVehicles[i], "sqlid")
				if sqlid and(sqlid == dbqueryresult[sellIndex]["id"]) then
					veh = allVehicles[i]
					break
				end
			end
			
			if not veh then
				veh = createVehicle(dbqueryresult[sellIndex]["carid"], 0, 0, 0)
			end
			
			local vehName = getVehicleName(veh)
			carSellSell(veh, plr, dbqueryresult[sellIndex]["id"], sellPrice)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Один или несколько ваших транспортных средств конфискованы у вас за долги.")
		
		else
			for i,eatloc in ipairs(eatLocations) do
				curPrice = eatTypes[eatLocations[i][1]][14]
				if(eatloc[9] == pHash) and(curPrice > sellPrice) then
					sellIndex = i
					sellPrice = curPrice
				end
			end
			
			if(sellIndex > 0) then
				if dbExec(db, "UPDATE businesses SET owner=0 WHERE id=?", eatLocations[sellIndex][7]) then
					addNewEventToLog(getPlayerName(plr), "Бизнес - Продажа - Магазин "..tostring(eatLocations[sellIndex][7]), true)
					giveMoney(plr, sellPrice)
					eatLocations[sellIndex][9] = 0
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Один или несколько ваших магазинов конфискованы у вас за долги.")
				end
				
			else
				for i,ammo in ipairs(ammuShops) do
					if(ammo[9] == pHash) then
						sellIndex = i
						break
					end
				end
				
				if(sellIndex > 0) then
					if dbExec(db, "UPDATE businesses SET owner=0 WHERE id=?", ammuShops[sellIndex][7]) then
						addNewEventToLog(getPlayerName(plr), "Бизнес - Продажа - Аммуниция "..tostring(ammuShops[sellIndex][7]), true)
						giveMoney(plr, ammuBusinessPrice)
						ammuShops[sellIndex][9] = 0
						triggerClientEvent(plr, "onServerMsgAdd", plr, "Одна или несколько ваших аммуниций конфискованы у вас за долги.")
					end
					
				else
					sellIndex = nil
					sellPrice = 0
					
					for i,house in pairs(houses) do
						curPrice = house[3]
						if(house[11] == pHash) and(curPrice > sellPrice) then
							sellIndex = i
							sellPrice = curPrice
						end
					end
					
					if sellIndex then
						housesSell(sellIndex, plr)
						triggerClientEvent(plr, "onServerMsgAdd", plr, "Один или несколько ваших домов конфискованы у вас за долги.")
					end
				end
			end
		end
	end
end

function getMoney(plr)
	local pHash = getHash(getPlayerName(plr))
	
	repeat
		dbq = dbQuery(db, "SELECT money FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 120000)
		dbFree(dbq)
	until dbqueryresult
	
	if(dbqueryresult) then
		return dbqueryresult[1]["money"]
	end
	
	return nil
end

function takeMoney(plr, amount, playSnd)
	if(amount > 0) then
		local curMoney = getMoney(plr)
		
		if curMoney then
			local amountRound = math.floor(amount)
			local newMoney = curMoney-amountRound
			dbExec(db, "UPDATE users SET money=? WHERE name=?", newMoney, getHash(getPlayerName(plr)))
			triggerClientEvent(plr, "onPlayerMoneyChange", plr, -amountRound)
			local players = getNearbyElementsByType(plr, "player", 200.0)
			table.insert(players, plr)
			triggerClientEvent(players, "onCreateProgressPopup", plr, "images/money.png", plr, false)
			
			if(type(playSnd) == "nil") or playSnd then
				triggerClientEvent(players, "onServerPlaySound3D", plr, "audio/decmoney.wav", 0, 0, 0, false, 150, plr)
			end
			
			setPlayerMoney(plr, newMoney)
			addNewEventToLog(getPlayerName(plr), "Деньги - Списание - $"..tostring(amount), true)
			checkMoney(plr)
			checkPlayerGroup(plr)
		end
	end
end

function giveMoney(plr, amount, playSnd)
	if(amount > 0) then
		local curMoney = getMoney(plr)
		
		if curMoney then
			local amountRound = math.floor(amount)
			local newMoney = curMoney+amountRound
			dbExec(db, "UPDATE users SET money=? WHERE name=?", newMoney, getHash(getPlayerName(plr)))
			triggerClientEvent(plr, "onPlayerMoneyChange", plr, amountRound)
			local players = getNearbyElementsByType(plr, "player", 200.0)
			table.insert(players, plr)
			triggerClientEvent(players, "onCreateProgressPopup", plr, "images/money.png", plr, true)
			
			if(type(playSnd) == "nil") or playSnd then
				triggerClientEvent(players, "onServerPlaySound3D", plr, "audio/incmoney.wav", 0, 0, 0, false, 100, plr)
			end
			
			setPlayerMoney(plr, newMoney)
			addNewEventToLog(getPlayerName(plr), "Деньги - Зачисление - $"..tostring(amount), true)
			checkMoney(plr)
			checkPlayerGroup(plr)
		end
	end
end

function setPlayerGreenZone(plr)
	if isElement(plr) then
		local zx, zy, zz = getElementPosition(plr)
		local zcol = createColSphere(zx, zy, zz, greenZonesRadius)
		setElementData(plr, "protected", zcol)
		setElementData(zcol, "playerToProtect", plr, false)
		setElementInterior(zcol, getElementInterior(plr))
		setElementDimension(zcol, getElementDimension(plr))
		addEventHandler("onColShapeLeave", zcol, leavePlayerGreenZone)
	end
end

function leavePlayerGreenZone(plr)
	if(plr == getElementData(source, "playerToProtect")) then
		removePlayerGreenZone(plr, source)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "С вас снята спаун-защита, т. к. вы отошли достаточно далеко от точки спауна.")
	end
end

function removePlayerGreenZone(plr, zone)
	if(isElement(zone)) then
		removeEventHandler("onColShapeLeave", zone, leavePlayerGreenZone)
		removeElementData(zone, "playerToProtect")
		destroyElement(zone)
	end
	removeElementData(plr, "protected")
end

function playerSpawn(pX, pY, pZ, pR, pTeam, pSkin, pInt, pDim)
	if isElement(source) then
		setElementFrozen(source, true)
		setTimer(setElementFrozen, 2000, 1, source, false)
		
		if playerSkillsBuffer[source] then
			for skillId,skillVal in pairs(playerSkillsBuffer[source]) do
				setPedStat(source, skillId, skillVal)
			end
		end
	end
end

function spawnPlayerEx(plr)
	if not updateSkillsBuffer(plr) then
		return false
	end
	local arrested = getElementData(plr, "arrested")
	local pTeam = getPlayerTeam(plr)
	local pMdl = getElementModel(plr)
	local pHash = getHash(getPlayerName(plr))
	local eId = specialEventGetEventByElement(plr)
	playersInsideHouses[plr] = nil
	furnitureDecline(plr)
	
	if(arrested > 0) then
		spawnPlayer(plr, 264.5, 77.6, 1001.0)
		setElementRotation(plr, 0, 0, 270.0)
		setElementHealth(plr, 40)
		setElementModel(plr, pMdl)
		setElementInterior(plr, 6)
		setElementDimension(plr, 65535)
		setPlayerTeam(plr, pTeam)
		setCameraTarget(plr)
		
	elseif eId then
		spawnPlayer(plr, specialEvents[eId][5], specialEvents[eId][6], specialEvents[eId][7])
		setPlayerTeam(plr, pTeam)
		setElementModel(plr, pMdl)
		setElementInterior(plr, 0)
		setElementDimension(plr, 0)
		setCameraTarget(plr)
		specialEventLoadPlayer(plr, false)
	
	else
		local px, py, pz = getElementPosition(plr)
		local sx, sy, sz, srot, sint, sdim
		local hp = 1000
		local spawned = false
		local locationId = nil
		local fId = fractionGetPlayerFraction(plr)
		
		if fId then
			locationId = getClosestFractionInterior(fId, px, py, pz)
		else
			locationId = getClosestHospital(px, py, pz)
			hp = 5
			fId = 0
		end
		
		if locationId then
			for _,respInfo in ipairs(respawnPositions) do
				if respInfo[5] and(respInfo[5] > 0) and(respInfo[6] == fId) and(eatLocations[locationId][1] == respInfo[5]) then
					sx, sy, sz = respInfo[1], respInfo[2], respInfo[3]
					srot = respInfo[4]
					sdim = locationId
					sint = eatTypes[eatLocations[locationId][1]][3]
					setTimer(triggerClientEvent, 1000, 1, plr, "onEatEnter", plr, eatTypes[eatLocations[locationId][1]], true)
					spawned = true
					break
				end
			end
		end
		
		if not spawned then
			for _,respInfo in ipairs(respawnPositions) do
				if respInfo[5] and(respInfo[5] == 0) and(respInfo[6] == fId) then
					sx, sy, sz = respInfo[1], respInfo[2], respInfo[3]
					srot = respInfo[4]
					sdim = 0
					sint = 0
					spawned = true
					break
				end
			end
		end
		
		if spawned then
			spawnPlayer(plr, sx, sy, sz)
			setElementRotation(plr, 0, 0, srot)
			setElementModel(plr, pMdl)
			setElementInterior(plr, sint)
			setElementDimension(plr, sdim)
			setElementHealth(plr, hp)
			setPlayerTeam(plr, pTeam)
			setCameraTarget(plr)
			setTimer(setPlayerGreenZone, 500, 1, plr)
		end
	end
	
	if isPlayerInHospital(plr) then
		setElementData(plr, "godMode", true)
	elseif getElementData(plr, "godMode") then
		removeElementData(plr, "godMode")
	end
	
	dbQuery(spawnPlayerEx2, {plr}, db, "SELECT * FROM users WHERE name = ?", pHash)
	setElementGhostMode(plr, 3000)
end

function spawnPlayerEx2(dbq, plr)
	dbqueryresult = dbPoll(dbq, 0)
	dbFree(dbq)
	
	if dbqueryresult then
		if(dbqueryresult[1]["weapAfterDeath"] == 1) then
			for i=0,12 do
				giveWeapon(plr, dbqueryresult[1][string.format("w%d", i)], dbqueryresult[1][string.format("w%dammo", i)])
			end
		end
	end
end

-----функции полиции----
function getPoliceGroups()
	return { 2, 5, 14, 15, 17 }
end

function isPlayerFromPolice(plr)
	local plrGrp = getElementData(plr, "usergroup")
	local policeGrps = getPoliceGroups()
	
	if plrGrp then
		for _,polGrp in ipairs(policeGrps) do
			if(polGrp == plrGrp) then
				return true
			end
		end
	end
	
	return false
end

function jobPoliceNewOrder(orderer)
	addNewEventToLog(getPlayerName(orderer), "Полиция - Вызов - nil", true)
	local polMsg = string.format(generateTimeString().."[Полиция] ДИСПЕТЧЕР: #FFFFFF%s вызывает полицию. Местоположение обозначено на карте.", getPlayerName(orderer))
	local ox,oy,oz = getElementPosition(orderer)
	local ax,ay,az,agrp
	local polCount = 0
	local players = getElementsByType("player")
	for _,plr in ipairs(players) do
		agrp = getElementData(plr, "usergroup")
	    if isPlayerFromPolice(plr) and (getElementInterior(plr) == 0) and (getElementDimension(plr) == 0) then
			ax,ay,az = getElementPosition(plr)
			if(getDistanceBetweenPoints3D(ox,oy,oz,ax,ay,az) < 2400) then
				triggerClientEvent(plr, "onReceivePoliceMessage", plr, polMsg)
				triggerClientEvent(plr, "onPoliceOrderCreate", orderer, ox, oy, oz)
				polCount = polCount+1
			end
		end
	end
	if(polCount > 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, string.format("Ваш вызов полиции разослан %d полицейским.", polCount))
	elseif(polCount == 1) then
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Ваш вызов разослан 1 полицейскому.")
	else
		triggerClientEvent(orderer, "onServerMsgAdd", orderer, "Полицейские поблизости отсутствуют.")
	end
end

function wantedLevelInc(plr)
	if(getElementType(plr) == "player") and(not isPedDead(plr)) and(not isAdmin(plr)) and(not isModerator(plr)) then
		
		if wantedTimers[plr] then
			return false
		end
		
		local curWL = getPlayerWantedLevel(plr)
		
		if(curWL < 6) then
			curWL = curWL+1
			attachActionToElement(defaultActions[134], plr)
			attachActionToElement(defaultActions[116], plr)
			addNewEventToLog(getPlayerName(plr), "Уровень розыска - Увеличение - "..tostring(curWL), true)
			setPlayerWantedLevel(plr, curWL)
			setElementData(plr, "wantedLevel", curWL)
			wantedCooldowns[plr] = nil
			dbExec(db, "UPDATE users SET wantedLevel=? WHERE name=?", curWL, getHash(getPlayerName(plr)))
		end
		
		--if isPlayerFromPolice(plr) then
		--	triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы уволены за наличие уровня розыска.")
		--	setPlayerNewGroup(plr, groupCommonGet(plr))
		--end
		wantedTimers[plr] = setTimer(wantedTimerRemove, 67000, 1, plr)
		return true
	end
	
	return false
end

function wantedTimerRemove(plr)
	wantedTimers[plr] = nil
end

function wantedLevelClear(plr)
	if(getElementType(plr) == "player") then
		local curWL = getPlayerWantedLevel(plr)
		if(curWL > 0) then
			detachActionFromElement(defaultActions[134], plr)
			detachActionFromElement(defaultActions[116], plr)
			wantedCooldowns[plr] = nil
			addNewEventToLog(getPlayerName(plr), "Уровень розыска - Снятие - 0", true)
			setPlayerWantedLevel(plr, 0)
			setElementData(plr, "wantedLevel", 0)
			dbExec(db, "UPDATE users SET wantedLevel=0 WHERE name=?", getHash(getPlayerName(plr)))
		end
	end
end

function playerDamage(attacker, attackWeap, bodypart, loss)
	if attacker and(source ~= attacker) and(getElementType(attacker) == "player") then
		if(attackWeap == 3) and isPlayerFromPolice(attacker) then
			local sWanted = getPlayerWantedLevel(source)
			
			if(sWanted > 0) then
				setElementHealth(source, math.max(getElementHealth(source)-33.0, 0.0))
			end
		end
		
		if isPlayerFromPolice(source) and(not isPlayerFromPolice(attacker)) then
			criminalActivityRegisterCrime(criminalActivityGetPlayerZoneIndex(attacker))
			wantedLevelInc(attacker)
		end
		
	end
end

function playerWasted(totalAmmo, attacker, killerWeapon, bodypart, stealth)
	local px, py, pz = getElementPosition(source)
	local evtStr = "Смерть - "
	local eId = specialEventGetEventByElement(source)
	
	if not eId then
		for i=1,getElementData(source, "invSlotNum") do
			triggerEvent("onInventoryDropSlot", source, i, px, py, pz, false)
		end
	end
	
	if attacker then
		local killer
		
		if(getElementType(attacker) == "vehicle") then
			evtStr = evtStr.."Задавлен транспортом - "
			killer = getVehicleController(attacker)
			
			if(not killer) or (not(getElementType(killer) == "player")) then
				killer = source
				evtStr = evtStr.."Бот или ТС без водителя"
			
			elseif(getElementType(killer) == "player") then
				evtStr = evtStr..getPlayerName(killer)
			
			else
				evtStr = evtStr.."Неизвестно"
			end
			
		elseif(getElementType(attacker) == "player") then
			if(attacker == source) then
				evtStr = evtStr.."Самоубийство - "..getPlayerName(attacker)
			else
				evtStr = evtStr.."Убит игроком - "..getPlayerName(attacker)
			end
			
			killer = attacker
		
		else
			killer = false
		end
		
		addNewEventToLog(getPlayerName(source), evtStr, true)
		
		if eId then
			-- EMPTY
		
		elseif killer and(getElementType(killer) == "player") and(not(killer == source)) then
			local kName = getPlayerName(killer)
			local killWithoutReason = true
			evtStr = "Убийство - "
			local sourceWanted = getPlayerWantedLevel(source)
			local sName = getPlayerName(source)
			local sHash = getHash(sName)
			
			if(sourceWanted > 0) and isPlayerFromPolice(killer) then
				evtStr = evtStr.."Убил преступника - "..getPlayerName(source).."("..tostring(sourceWanted).." звезд)"
				wantedLevelClear(source)
				local arrested = 300*sourceWanted -- срок в тюрьме за звезды, 1 зв = 5 минут тюрьмы, 6 = 30 минут.
				setElementData(source, "arrested", arrested)
				dbExec(db, "UPDATE users SET arrested=? WHERE name=?", arrested, getHash(getPlayerName(source)))
				local serviceId = getElementData(killer, "usergroup")
				
				if serviceId and serviceRegister(source, killer, serviceId) then
					local respect = getElementData(killer, "respect")
					respectSet(killer, respect+0.000002*sourceWanted, 0.0, 1.0, true)
				end
				
				local money = math.max(0, math.min(wantedKillPrices[sourceWanted], getMoney(source)))
				--giveMoney(killer, money)
				takeMoney(source, money)
				triggerClientEvent(killer, "onServerMsgAdd", killer, "Вы поймали и арестовали преступника.")
				triggerClientEvent(source, "onServerMsgAdd", source, "Вы арестованы. Длительность ареста - "..getTimeString(arrested*1000)..".")
				killWithoutReason = false
			
			else
				local clan = getPlayerClan(killer)
				local sclan = getPlayerClan(source)
				evtStr = evtStr.."Убил игрока - "..getPlayerName(source)
				local ugrp = getElementData(source, "usergroup")
				
				if(ugrp ~= 10) then
					sendPoliceMessage(killer, "убийство")
					criminalActivityRegisterCrime(criminalActivityGetPlayerZoneIndex(killer))
					wantedLevelInc(killer)
				end
				
				local respect = getElementData(killer, "respect")
				
				if(clan and sclan and(clan ~= sclan)) or isPlayerFromPolice(source) then
					local respect = getElementData(killer, "respect")
					respectSet(killer, respect-0.000005, -1.0, 1.0, true)
					killWithoutReason = false
				end
				local killPrice = gangsterKillOrders[getPlayerName(source)]
				
				if killPrice then
					addNewEventToLog(getPlayerName(source), "Цена за голову - Смерть - $"..tostring(killPrice).." для "..getPlayerName(killer), true)
					addNewEventToLog(getPlayerName(killer), "Цена за голову - Убийство - $"..tostring(killPrice).." за "..getPlayerName(source), true)
					local respect = getElementData(killer, "respect")
					respectSet(killer, respect-0.000008, -1.0, 1.0, true)
					giveMoney(killer, killPrice)
					triggerClientEvent(killer, "onServerMsgAdd", killer, string.format("Вы получили $%d как вознаграждение за голову игрока %s.", killPrice, sName))
					gangsterKillOrders[getPlayerName(source)] = nil
					killWithoutReason = false
				end
				
			end
			addNewEventToLog(getPlayerName(killer), evtStr, true)
		end
	end
	
	local greenZone = getElementData(source, "protected")
	
	if greenZone then
		removePlayerGreenZone(source, greenZone)
	end
	
	setElementData(source, "hungryLevel", 1.0, false)
	setElementData(source, "thirstLevel", 1.0, false)
	
	for key,worker in ipairs(jobWorkers[10]) do
		if(worker[4] == source) then
			jobTaxiRemoveClient(key, false)
			break
		end
	end
	
	if getElementData(source, "boombox") then
		boomboxRemove(source)
	end
	
	if getElementData(source, "RC") then
		rcDestroy(source)
	end
	
	if doesPedHaveJetPack(source) then
		jetpackOff(source)
	end
	
	ferrisWheelRemovePlayer(source)
	furnitureDecline(source)
	wantedCooldowns[source] = nil
	heaverDestroyCargo(source, getElementData(source, "heaverCargo"), false)
	dbExec(db, "UPDATE users SET hungry=1, thirst=1 WHERE name=?", getHash(getPlayerName(source)))
	
	if not getElementData(source, "saveWeapons") then
		for i=0,12 do
			dbExec(db, string.format("UPDATE users SET w%d=0, w%dammo=0 WHERE name=?", i, i), getHash(getPlayerName(source)))
		end
	end
	
	setTimer(function(source)
				if(isElement(source)) then
					fadeCamera(source, false, 1.5)
				end
			 end, 2500, 1, source)
	setTimer(function(source)
				if(isElement(source)) then
					spawnPlayerEx(source)
				end
			 end, 4100, 1, source)
	setTimer(function(source, sWeap)
				if(isElement(source)) then
					fadeCamera(source, true, 1.5)
					--if carSellRemoveUserVehicles(source) then
						--showVehicleDestroyedMessage(source)
					--end
				end
			 end, 5100, 1, source)
end

function updateSkillsBuffer(plr)
	
	if not isElement(plr) then
		return false
	end
	
	playerSkillsBuffer[plr][22] = getPedStat(plr, 22)
	playerSkillsBuffer[plr][24] = getPedStat(plr, 24)
	playerSkillsBuffer[plr][160] = getPedStat(plr, 160)
	playerSkillsBuffer[plr][230] = getPedStat(plr, 230)
	playerSkillsBuffer[plr][229] = getPedStat(plr, 229)
	playerSkillsBuffer[plr][169] = getPedStat(plr, 169)
	
	return true
end

function playerQuit(quitType, reason, responsibleElem)
	if isElement(source) then
		
		for workVeh,workPlr in pairs(vehiclesOnWork) do
			if workPlr == source then
				vehiclesOnWork[workVeh] = nil
			end
		end
		
		for mId,mInfo in pairs(missions) do
			if mInfo["players"][source] then
				missionFinish(source, mId, "QUIT")
			end
		end
		
		playerSkillsBuffer[source] = nil
		wantedCooldowns[source] = nil
		playerDisconnect(getPlayerName(source), getPlayerIP(source), getPlayerSerial(source), quitType)
		playerDisconnectLocal(getPlayerName(source), quitType)
		local eId = specialEventGetEventByElement(source)
		
		if eId then
			specialEventRemoveElement(eId, source)
		end
		
		local fId = fractionGetPlayerFraction(source)
		
		if fId then
			fractionUpdate(fId, true, false)
		end
		
		--gangsterStealExitCar(source, 0)
		gangsterStealLeaveCar(source)
		gangsterStealStop(source)
		furnitureDecline(source)
		playersInsideHouses[source] = nil
		specStates[source] = nil
		rcDestroy(source)
		
		if availableRace and availableRace[4] then
			for i,racer in ipairs(availableRace[4]) do
				if(racer[1] == source) then
					raceRemoveRacer(i)
					break
				end
			end
		end
		
		for dim,plr in pairs(carTuneDimensions) do
			if(plr == source) then
				carTuneDimensions[dim] = nil
				break
			end
		end
		
		if loginTimers[source] then
			killTimer(loginTimers[source])
			loginTimers[source] = nil
		end
		
		if payoutTimers[source] then
			killTimer(payoutTimers[source])
			payoutTimers[source] = nil
		end
		
		local greenZone = getElementData(source, "protected")
		
		if greenZone then
			removePlayerGreenZone(source, greenZone)
		end
		
		carSellRemoveUserVehicles(source)
		ferrisWheelRemovePlayer(source)
		heaverDestroyCargo(source, getElementData(source, "heaverCargo"), false)
		
		for key,worker in ipairs(jobWorkers[10]) do
			if(worker[4] == source) then
				jobTaxiRemoveClient(key, false)
				break
			end
		end
		
		for jobId=1,table.getn(jobWorkers) do
			for _,worker in ipairs(jobWorkers[jobId]) do
				if(worker[1] == source) then
					removeWorker(jobId, source, -1)
					break
				end
			end
		end
		
		for qnum,question in pairs(questionsArray) do
			if(source == question[4]) then
				questionDenyEx(qnum, source)
			end
		end
		
		if getElementData(source, "boombox") then
			boomboxRemove(source)
		end
		
		if doesPedHaveJetPack(source) then
			jetpackOff(source)
		end
		
		local clan = getPlayerClan(source)
		
		if clan then
			setPlayerTeam(source, clanDefault)
			clanPlayerInfoUpdate(clan)
		end
		
		--saveCurrentPlayer(source, true, false, false, false, false)
		if(quitType == "Banned") and responsibleElem and isElement(responsibleElem) then
			local pName = getPlayerName(source)
			local logStr = "Аккаунты - "
			local msgStr
			
			if(quitType == "Kicked") then
				logStr = logStr.."Кик"
				msgStr = generateTimeString().."KICK: "..pName.." кикнут игроком "..getPlayerName(responsibleElem).."."
			else
				logStr = logStr.."Бан"
				msgStr = generateTimeString().."BAN: "..pName.." забанен игроком "..getPlayerName(responsibleElem).."."
			end
			
			if reason then
				msgStr = msgStr.." Причина: "..reason.."."
			end
			
			outputChatBox(msgStr, root, 255, 0, 0)
			addNewEventToLog(pName, logStr.." - Админ: "..getPlayerName(responsibleElem)..", Причина: "..tostring(reason), true)
		else
			local evtStr = "Аккаунты - Выход - "..quitType
			
			if reason then
				evtStr = evtStr.."("..reason..")"
			end
			addNewEventToLog(getPlayerName(source), evtStr, true)
		end
	end
end

function playerShoot(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement, startX, startY, startZ)
	if(weapon == 25) or (weapon == 26) or (weapon == 27) then
		local otbInfo
		
		for i,otbLocation in ipairs(otbLocations) do
			otbInfo = otbInts[otbLocation[1]]
			if(getElementInterior(source) == otbInfo[5]) and(getElementDimension(source) == i) then
				for key,otb in pairs(otbLocation[7]) do
					if(hitElement == otb) and isElement(otb) and isElement(source) then
						createExplosion(otbInfo[6][key][1], otbInfo[6][key][2], otbInfo[6][key][3], 12, source)
						destroyElement(otb)
						otbLocation[7][key] = nil
						local money = createMoney(otbInfo[6][key][1], otbInfo[6][key][2], otbInfo[6][key][3], 50)
						setElementInterior(money, otbInfo[5])
						setElementDimension(money, i)
						local respect = getElementData(source, "respect")
						respectSet(source, respect-0.000005, -1.0, 1.0, true)
						wantedLevelInc(source)
						sendPoliceMessage(source, "ограбление букмекерской конторы")
						break
					end
				end
				break
			end
		end
	end
end

function sendPoliceMessage(suspect, crimeText)
	local crimeMsg = "NIL"
	local sx, sy, sz
	
	if(getElementDimension(suspect) == 0) then
		crimeMsg = string.format(generateTimeString().."[Полиция] ДИСПЕТЧЕР: #FFFFFF%s только что совершил %s. Место: %s(%s)", getPlayerName(suspect), crimeText, getElementZoneName(suspect, false), getElementZoneName(suspect, true))
		sx, sy, sz = getElementPosition(suspect)
	else
		crimeMsg = string.format(generateTimeString().."[Полиция] ДИСПЕТЧЕР: #FFFFFF%s только что совершил %s. Место: неизвестно", getPlayerName(suspect), crimeText)
		sx = nil
	end
	
	local players = getNearbyElementsByType(suspect, "player", 1000.0)
	
	for _,plr in ipairs(players) do
		if isPlayerFromPolice(plr) then
			if sx then
				triggerClientEvent(plr, "onReceivePoliceMessage", suspect, crimeMsg, sx, sy, sz)
			else
				triggerClientEvent(plr, "onReceivePoliceMessage", suspect, crimeMsg)
			end
		end
	end
end

function showVehicleDestroyedMessage(vehOrPlr)
	local plr = nil
	
	if(getElementType(vehOrPlr) == "player") then
		plr = vehOrPlr
	else
		local owner = getElementData(vehOrPlr, "owner")
		
		if owner then
			local players = getElementsByType("player")
			
			for _,vehOwner in ipairs(players) do
				if(getHash(getPlayerName(vehOwner)) == owner) then
					plr = vehOwner
					break
				end
			end
		end
	end
	
	if plr then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш транспорт уничтожен или утерян. Вы можете его восстановить в одном из больших красных маркеров(например, около больницы) или воспользовавшись любым из ваших домов.")
	end
end

function vehicleExplode()
	showVehicleDestroyedMessage(source)
	local vehMdl = getElementModel(source)
	
	if(vehMdl == 428) then
		local vx, vy, vz = getElementPosition(source)
		vz = vz-0.5
		local mx, my
		local moneyNum = math.random(10, 20)
		local mAngle = 0.0
		local mDist
		
		for i=1,moneyNum do
			mAngle = mAngle+math.random(3600)/10.0
			
			while not (mAngle < 360.0) do
				mAngle = mAngle-360.0
			end
			
			mDist = 2.0+math.random(30)/10.0
			mx, my = getPointFromDistanceRotation(vx, vy, mDist, mAngle)
			createMoney(mx, my, vz, math.random(100, 250))
		end
	end
end

function pedDamage(attacker, weapon)
	if(weapon == 0) or (weapon == 1) then
		local tutid = getElementData(source, "tutorial")
		
		if tutid then
			triggerEvent("onPlayerSelectAction", resourceRoot, attacker, 50, { tutorialArray[tutid][1], tutorialArray[tutid][2] })
		end
	end
end

function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

function chatCmdMessage(plr, cmdName, ...)
	local msgArray = {...}
	
	if isElement(plr) and(#msgArray > 0) then
		local msg = table.concat(msgArray, " ")
		local respect = getElementData(plr, "respect")
		
		if(cmdName == "a") and(isHelper(plr) or isModerator(plr) or isAdmin(plr)) then
			playerSendAdminMessage(plr, msg)
		
		elseif(cmdName == "mm") and PlayerFromSaNews(plr) then
		    playerSendSMIMessage(plr, msg)
			giveMoney(plr, saNewsPrice)
			respectSet(plr, respect+0.0000030, -1.0, 1.0, true)
		
		elseif(cmdName == "do") then
			triggerEvent("onPlayerChat", plr, msg.." #FFFFFF"..getPlayerName(plr), 3)
		
		elseif(cmdName == "b") then
			triggerEvent("onPlayerChat", plr, "#939393(("..msg.."))", 0)
		
		elseif(cmdName == "bt") then
			triggerEvent("onPlayerChat", plr, "#939393(("..msg.."))", 2)
		
		elseif(cmdName == "try") then
			math.randomseed(getTickCount())
			
			local result
			
			if(math.random(100) > 50) then
				result = "#39B55Aудачно"
			else
				result = "#E03131неудачно"
			end
			
			triggerEvent("onPlayerChat", plr, getPlayerName(plr).." "..msg.." | "..result, 3)
		end
	end
end

function playerChat(msg, msgType)
	if not isPlayerMuted(source) then
		local sint = getElementInterior(source)
		local sdim = getElementDimension(source)
		
		if(msgType == 0) then
			local sx,sy,sz = getElementPosition(source)
			local msgSphere = createColSphere(sx, sy, sz, 30.0)
			local allPlayersBase = getElementsWithinColShape(msgSphere, "player")
			destroyElement(msgSphere)
			local pint, pdim
			local allPlayers = {}
			local localMsg = msg
			
			for _,plr in ipairs(allPlayersBase) do
				pint = getElementInterior(plr)
				pdim = getElementDimension(plr)
				
				if(pint == sint) and(pdim == sdim) then
					table.insert(allPlayers, plr)
				end
			end
			
			allPlayersBase = nil
			
			if(string.len(localMsg) > 0) then
				triggerClientEvent(allPlayers, "onChatMessageRender", source, generateTimeString(), isAdmin(source) or isModerator(source), localMsg)
			end
			
		elseif(msgType == 1) then
			local players = getNearbyElementsByType(source, "player", 30.0)
			triggerClientEvent(players, "onChatMessageRender", source, generateTimeString(), false, msg, true)
			triggerClientEvent(source, "onChatMessageRender", source, generateTimeString(), false, msg, true)
		
		elseif(msgType == 2) then
			local cR, cG, cB
			local sGrp = getElementData(source, "usergroup")
			local eId = specialEventGetEventByElement(source)
			local allPlayers
			local tcAvailable = false
			
			if eId then
				local elemType
				local eCreator = getPlayerFromName(specialEvents[eId][1])
				
				if eCreator then
					allPlayers = { eCreator }
				else
					allPlayers = {}
				end
				
				tcAvailable = true
				cR = 255
				cG = 128
				cB = 0
				sGrp = "Мероприятие"
				
				for elem,_ in pairs(specialEvents[eId][4]) do
					if isElement(elem) and(getElementType(elem) == "player") then
						table.insert(allPlayers, elem)
					end
				end
				
			elseif(sGrp == 10) then
				sGrp = getPlayerClan(source)
				
				if sGrp then
					tcAvailable = true
					allPlayers = getPlayersInTeam(sGrp)
				end
			else
				local tcGrps
				
				if playerTeamChats[sGrp] then
					tcGrps = playerTeamChats[sGrp]
				end
				
				if tcGrps then
					tcAvailable = true
					allPlayers = {}
					local allPlayersBase = getElementsByType("player")
					local pGrp
					
					for _,plr in ipairs(allPlayersBase) do
						pGrp = getElementData(plr, "usergroup")
						for _,tcGrp in ipairs(tcGrps) do
							if(pGrp == tcGrp) then
								table.insert(allPlayers, plr)
							end
						end
					end
					
					allPlayersBase = nil
				end
			end
			
			if tcAvailable then
				triggerClientEvent(allPlayers, "onPlayerTeamChat", source, generateTimeString(), sGrp, msg, cR, cG, cB)
			else
				triggerClientEvent(source, "onServerMsgAdd", resourceRoot, "Ваш текущий статус не имеет поддержку командного чата")
			end
			
		elseif(msgType == 3) then -- Rp
			local players = getNearbyElementsByType(source, "player", 30.0)
			triggerClientEvent(players, "onChatMessageRender", source, generateTimeString(), false, msg, false, true)
			triggerClientEvent(source, "onChatMessageRender", source, generateTimeString(), false, msg, false, true)
		end
		
	end
	
	cancelEvent()
end

function playerLogin(prevAccount, curAccount, autoLogin)
	addNewEventToLog(getPlayerName(source), "Аккаунты - Login - "..getAccountName(curAccount), true)
	checkPlayerGroup(source)
end

function playerLogout(prevAccount, curAccount)
	addNewEventToLog(getPlayerName(source), "Аккаунты - Logout - "..getAccountName(prevAccount), true)
	checkPlayerGroup(source)
end

function cancelTrailerDetach(theTruck)
	attachTrailerToVehicle(theTruck, source)
end

function lowriderAddPlayer(lowriderId, plr)
	local hp = getElementHealth(plr)
	
	if(hp > 0) then
		local money = getMoney(plr)
		
		if(money >= lowriderPrice) then
			local car = getPedOccupiedVehicle(plr)
			
			if car and(getPedOccupiedVehicleSeat(plr) == 0) and(getVehicleUpgradeOnSlot(car, 9) == 1087) then
				addNewEventToLog(getPlayerName(plr), "Бои лоурайдеров - Регистрация - ID "..tostring(lowriderId), true)
				attachActionToSelf(defaultActions[59], plr)
				attachActionToElement(defaultActions[73], plr)
				
				local occupants = getVehicleOccupants(car)
				
				for _, occupant in pairs(occupants) do
					if(occupant == plr) then
						removePedFromVehicle(plr)
						warpPedIntoVehicle(plr, car)
					else
						removePedFromVehicle(occupant)
					end
				end
				
				setElementData(plr, "lowrider", lowriderId, false)
				local isSecondPlayer = (table.getn(lowriderMarkers[lowriderId][13]) > 0)
				table.insert(lowriderMarkers[lowriderId][13], plr)
				addEventHandler("onPlayerQuit", plr, lowriderQuit)
				addEventHandler("onPlayerWasted", plr, lowriderWasted)
				local startx, starty, startz, startr
				
				if isSecondPlayer then
					startx = lowriderMarkers[lowriderId][9]
					starty = lowriderMarkers[lowriderId][10]
					startz = lowriderMarkers[lowriderId][11]
					startr = lowriderMarkers[lowriderId][12]
				else
					startx = lowriderMarkers[lowriderId][5]
					starty = lowriderMarkers[lowriderId][6]
					startz = lowriderMarkers[lowriderId][7]
					startr = lowriderMarkers[lowriderId][8]				
				end
				
				setElementPosition(car, startx, starty, startz)
				setElementRotation(car, 0.0, 0.0, startr)
				takeMoney(plr, lowriderPrice)
				
				if isSecondPlayer then
					lowriderStart(lowriderId)
				else
					setElementDimension(car, 1)
					setElementFrozen(plr, true)
					setElementFrozen(car, true)
					triggerClientEvent(plr, "onLowriderWait", plr)
					triggerClientEvent(getElementsByType("player"), "onServerMsgAdd", plr, string.format("Игрок %s готов к лоурайдерскому бою. Местоположение - %s.", getPlayerName(plr), lowriderMarkers[lowriderId][16]))
				end
				
			else
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы должны находиться в личном автомобиле с установленной гидравлической подвеской.")
			end
			
		else
			triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас недостаточно денег.")
		end
	end
end

function lowriderQuit()
	local lowriderId = getElementData(source, "lowrider")
	
	if lowriderId then
		addNewEventToLog(getPlayerName(source), "Бои лоурайдеров - Выход - ID "..tostring(lowriderId), true)
		lowriderRemovePlayer(lowriderId, source)
	end
end

function lowriderWasted()
	local lowriderId = getElementData(source, "lowrider")
	
	if lowriderId then
		addNewEventToLog(getPlayerName(source), "Бои лоурайдеров - Погиб - ID "..tostring(lowriderId), true)
		lowriderRemovePlayer(lowriderId, source)
	end	
end

function lowriderRemovePlayer(lowriderId, plr)
	addNewEventToLog(getPlayerName(plr), "Бои лоурайдеров - Завершение - ID "..tostring(lowriderId), true)
	detachActionFromSelf(defaultActions[59], plr)
	detachActionFromElement(defaultActions[73], plr)
	local started = lowriderMarkers[lowriderId][15]
	
	if started then
		local winner
		
		if(plr == lowriderMarkers[lowriderId][13][1]) then
			winner = lowriderMarkers[lowriderId][13][2]
		else
			winner = lowriderMarkers[lowriderId][13][1]
		end
		lowriderFinish(lowriderId, winner)
	
	else
		local car = getPedOccupiedVehicle(plr)
		setElementFrozen(plr, false)
		removeEventHandler("onPlayerQuit", plr, lowriderQuit)
		removeEventHandler("onPlayerWasted", plr, lowriderWasted)
		
		if car then
			setElementFrozen(car, false)
			setElementGhostMode(car, 5000)
			setElementDimension(car, 0)
		end
		
		local plrid
		
		if(lowriderMarkers[lowriderId][13][1] == plr) then
			plrid = 1
		else
			plrid = 2
		end
		
		table.remove(lowriderMarkers[lowriderId][13], plrid)
		triggerClientEvent(plr, "onLowriderFinish", plr)
		setElementData(plr, "lowrider", nil, false)
	end
end

function lowriderStart(lowriderId)
	lowriderMarkers[lowriderId][15] = true
	setElementVisibleTo(lowriderMarkers[lowriderId][4], root, false)
	local plr1 = lowriderMarkers[lowriderId][13][1]
	local plr2 = lowriderMarkers[lowriderId][13][2]
	addNewEventToLog(getPlayerName(plr1), "Бои лоурайдеров - Старт - ID "..tostring(lowriderId), true)
	addNewEventToLog(getPlayerName(plr2), "Бои лоурайдеров - Старт - ID "..tostring(lowriderId), true)
	local car1 = getPedOccupiedVehicle(plr1)
	local car2 = getPedOccupiedVehicle(plr2)
	setElementFrozen(plr1, false)
	setElementFrozen(car1, false)
	setElementFrozen(plr2, false)
	setElementFrozen(car2, false)
	setElementGhostMode(car1, 5000)
	setElementGhostMode(car2, 5000)
	setElementDimension(car1, 0)
	setElementDimension(car2, 0)
	local musicInfo = lowriderMusic[math.random(table.getn(lowriderMusic))]
	lowriderMarkers[lowriderId][17] = musicInfo[1]
	lowriderMarkers[lowriderId][18] = 0
	lowriderMarkers[lowriderId][19] = 0
	lowriderMarkers[lowriderId][20] = {}
	local cameraInfo = lowriderMarkers[lowriderId][14]
	triggerClientEvent(plr1, "onLowriderStart", plr1, lowriderId, musicInfo[3], cameraInfo)
	triggerClientEvent(plr2, "onLowriderStart", plr2, lowriderId, musicInfo[3], cameraInfo)
	triggerClientEvent(getElementsByType("player"), "onLowriderMusicStart", resourceRoot, lowriderId, lowriderMarkers[lowriderId][1], lowriderMarkers[lowriderId][2], lowriderMarkers[lowriderId][3], musicInfo[1])
	lowriderMarkers[lowriderId][21] = setTimer(lowriderWin, musicInfo[2]*1000, 1, lowriderId)
end

function lowriderAddBet(lowriderId, plrBet, plrFor, bet)
	if lowriderMarkers[lowriderId][15] then
		local noBet = true
		
		for _,betInfo in ipairs(lowriderMarkers[lowriderId][20]) do
			if(betInfo[1] == plrBet) then
				noBet = false
				break
			end
		end
		
		if noBet then
			bet = math.max(1, math.ceil(bet))
			
			if(getMoney(plrBet) < bet) then
				triggerClientEvent(plrBet, "onServerMsgAdd", plrBet, "У вас недостаточно денег.")
			else
				for i,racer in ipairs(lowriderMarkers[lowriderId][13]) do
					if(racer == plrFor) then
						addNewEventToLog(getPlayerName(plrBet), "Бои лоурайдеров - Ставка - На "..getPlayerName(plrFor).."($"..tostring(bet)..")", true)
						addNewEventToLog(getPlayerName(plrFor), "Бои лоурайдеров - Ставка - От "..getPlayerName(plrBet).."($"..tostring(bet)..")", true)
						takeMoney(plrBet, bet)
						table.insert(lowriderMarkers[lowriderId][20], { plrBet, plrFor, bet })
						triggerClientEvent(plrBet, "onServerMsgAdd", plrBet, string.format("Вы поставили $%d на игрока %s.", bet, getPlayerName(plrFor)))
						break
					end
				end
			end
			
		else
			triggerClientEvent(plrBet, "onServerMsgAdd", plrBet, "Вы уже сделали ставку.")
		end
	end
end

function lowriderWinBet(lowriderId, plrWinner)
	if plrWinner then
		local plrsWinBet = {}
		local betSumWin = 0
		local betSumLose = 0
		
		for _,plrBetInfo in ipairs(lowriderMarkers[lowriderId][20]) do
			if(plrBetInfo[2] == plrWinner) then
				table.insert(plrsWinBet, { plrBetInfo[1], plrBetInfo[3] })
				betSumWin = betSumWin+plrBetInfo[3]
			else
				addNewEventToLog(getPlayerName(plrBetInfo[1]), "Бои лоурайдеров - Ставка - Проигрыш", true)
				triggerClientEvent(plrBetInfo[1], "onServerMsgAdd", plrBetInfo[1], "Вы проиграли ставку в лоурайдерских боях.")
				betSumLose = betSumLose+plrBetInfo[3]
			end
		end
		
		local betSum = betSumWin+betSumLose
		
		if(betSum > 0) then
			local winAmount
			
			for _,plrBetInfo in ipairs(plrsWinBet) do
				winAmount = math.floor(plrBetInfo[2]/betSumWin*betSum)
				addNewEventToLog(getPlayerName(plrBetInfo[1]), "Бои лоурайдеров - Ставка - Победа($"..tostring(winAmount)..")", true)
				giveMoney(plrBetInfo[1], winAmount)
				triggerClientEvent(plrBetInfo[1], "onServerMsgAdd", plrBetInfo[1], string.format("Вы выиграли $%d на ставках в лоурайдерских боях.", winAmount))
			end
		end
		
	else
		for _,plrBetInfo in ipairs(lowriderMarkers[lowriderId][20]) do
			addNewEventToLog(getPlayerName(plrBetInfo[1]), "Бои лоурайдеров - Ставка - Ничья($"..tostring(plrBetInfo[3])..")", true)
			giveMoney(plrBetInfo[1], plrBetInfo[3])
			triggerClientEvent(plrBetInfo[1], "onServerMsgAdd", plrBetInfo[1], string.format("Ничья в лоурайдерских боях. Вам возвращена ваша ставка.", winAmount))
		end
		
		lowriderMarkers[lowriderId][20] = {}
	end
end

function lowriderAddScore(lowriderId, score)
	if lowriderMarkers[lowriderId][15] then
		local scoreIndex
		
		if(source == lowriderMarkers[lowriderId][13][1]) then
			scoreIndex = 18
		else
			scoreIndex = 19
		end
		
		lowriderMarkers[lowriderId][scoreIndex] = lowriderMarkers[lowriderId][scoreIndex]+score
		triggerClientEvent(lowriderMarkers[lowriderId][13][1], "onLowriderSetScores", source, lowriderMarkers[lowriderId][18], lowriderMarkers[lowriderId][19])
		triggerClientEvent(lowriderMarkers[lowriderId][13][2], "onLowriderSetScores", source, lowriderMarkers[lowriderId][19], lowriderMarkers[lowriderId][18])
	end
end

function lowriderWin(lowriderId)
	local winner = nil
	
	if(lowriderMarkers[lowriderId][18] > lowriderMarkers[lowriderId][19]) then
		winner = lowriderMarkers[lowriderId][13][1]
	elseif(lowriderMarkers[lowriderId][19] > lowriderMarkers[lowriderId][18]) then
		winner = lowriderMarkers[lowriderId][13][2]
	end
	
	lowriderFinish(lowriderId, winner)
end

function lowriderFinish(lowriderId, winner)
	if isTimer(lowriderMarkers[lowriderId][21]) then
		killTimer(lowriderMarkers[lowriderId][21])
	end
	
	lowriderMarkers[lowriderId][15] = false
	setElementVisibleTo(lowriderMarkers[lowriderId][4], root, true)
	triggerClientEvent(getElementsByType("player"), "onLowriderMusicStop", resourceRoot, lowriderId)
	local plrArray = lowriderMarkers[lowriderId][13]
	
	while(table.getn(plrArray) > 0) do
		if(winner == nil) then
			addNewEventToLog(getPlayerName(plrArray[1]), "Бои лоурайдеров - Финиш - Ничья", true)
			triggerClientEvent(plrArray[1], "onServerMsgAdd", plrArray[1], "Ничья.")
			giveMoney(plrArray[1], lowriderPrice)
			lowriderWinBet(lowriderId, nil)
		else
			if(winner == plrArray[1]) then
				addNewEventToLog(getPlayerName(plrArray[1]), "Бои лоурайдеров - Финиш - Победа($"..tostring(lowriderPrice*2)..")", true)
				triggerClientEvent(plrArray[1], "onServerMsgAdd", plrArray[1], "Вы выиграли.")
				giveMoney(plrArray[1], lowriderPrice*2)
				lowriderWinBet(lowriderId, winner)
			else
				addNewEventToLog(getPlayerName(plrArray[1]), "Бои лоурайдеров - Финиш - Проигрыш", true)
				triggerClientEvent(plrArray[1], "onServerMsgAdd", plrArray[1], "Вы проиграли.")
			end
		end
		
		lowriderRemovePlayer(lowriderId, plrArray[1])
	end
end

function animPlay(anim)
	if not isPedInVehicle(source) then
		setPedAnimation(source, anim[2], anim[3], -1, anim[4], anim[5], anim[6], anim[7])
	end
end

function animStop(plr)
	setPedAnimation(plr)
end

function rcCreate(plr, rcMdl)
	if not isElement(getElementData(plr, "RC")) then
		if isPlayerBusy(plr) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы должны закончить остальные дела, прежде чем использовать RC транспорт.")
		
		else
			jetpackOff(plr)
			toggleControl(plr, "enter_exit", false)
			toggleControl(plr, "fire", false)
			toggleControl(plr, "vehicle_fire", false)
			toggleControl(plr, "vehicle_secondary_fire", false)
			setElementAlpha(plr, 0)
			local rcX, rcY, rcZ = getElementPosition(plr)
			local rcRX, rcRY, rcRZ = getElementRotation(plr)
			setElementData(plr, "RCStart", { rcX, rcY, rcZ, rcRX, rcRY, rcRZ }, false)
			local rcVeh = createVehicle(rcMdl, rcX, rcY, rcZ, rcRX, rcRY, rcRZ)
			attachActionToElement(defaultActions[68], rcVeh)
			addNewEventToLog(getPlayerName(plr), "RC транспорт - Старт - "..getVehicleName(rcVeh), true)
			setElementData(plr, "RC", rcVeh)
			setElementInterior(rcVeh, getElementInterior(plr))
			setElementDimension(rcVeh, getElementDimension(plr))
			setVehicleDamageProof(rcVeh, true)
			warpPedIntoVehicle(plr, rcVeh)
			addEventHandler("onVehicleExplode", rcVeh, rcDestroy)
			addEventHandler("onVehicleStartEnter", rcVeh, rcCancelEvent)
			setElementData(plr, "RCZone", createColSphere(rcX, rcY, rcZ, 150), false)
			setElementData(plr, "RCTimer", setTimer(rcProc, 2000, 0, plr, rcVeh), false)
			triggerClientEvent(getElementsByType("player"), "onRCStart", plr, rcVeh, rcX, rcY, rcZ)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Если RC транспорт окажется слишком далеко, то радиосвязь будет утеряна и он самоуничтожится.")
			
			return true
		end
	end
	
	return false
end

function rcCancelEvent()
	cancelEvent()
end

function rcProc(plr, rcVeh)
	local rcZone = getElementData(plr, "RCZone")
	
	if not isElementWithinColShape(rcVeh, rcZone) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Радиосвязь с RC транспортом была утеряна.")
		rcDestroy(plr)
	end
end

function rcDestroy(plr)
	local rcVeh = getElementData(plr, "RC")
	
	if isElement(rcVeh) then
		addNewEventToLog(getPlayerName(plr), "RC транспорт - Стоп - "..getVehicleName(rcVeh), true)
		setTimer(removeElementData, 1000, 1, plr, "RC")
		destroyElement(getElementData(plr, "RCZone"))
		killTimer(getElementData(plr, "RCTimer"))
		removeElementData(plr, "RCZone")
		removeElementData(plr, "RCTimer")
		removeEventHandler("onVehicleExplode", rcVeh, rcDestroy)
		removeEventHandler("onVehicleStartEnter", rcVeh, rcCancelEvent)
		local rcStart = getElementData(plr, "RCStart")
		removeElementData(plr, "RCStart")
		removePedFromVehicle(plr)
		setElementPosition(plr, rcStart[1], rcStart[2], rcStart[3])
		setElementRotation(plr, rcStart[4], rcStart[5], rcStart[6], "default", true)
		setElementAlpha(plr, 255)
		local blowX, blowY, blowZ = getElementPosition(rcVeh)
		local blowInt = getElementInterior(rcVeh)
		local blowDim = getElementDimension(rcVeh)
		destroyElement(rcVeh)
		local curCol = createColSphere(blowX, blowY, blowZ, 300)
		local players = getElementsWithinColShape(curCol, "player")
		destroyElement(curCol)
		triggerClientEvent(players, "onFakeExplosion", plr, blowX, blowY, blowZ, blowInt, blowDim, 11)
		toggleControl(plr, "enter_exit", true)
		toggleControl(plr, "fire", true)
		toggleControl(plr, "vehicle_fire", true)
		toggleControl(plr, "vehicle_secondary_fire", true)
		setCameraTarget(plr)
		triggerClientEvent(plr, "onRCStop", plr)
	end
end

function webGetServerId()
	if isTestServer() then	
		return true	
	end
	
	local serverName = getServerName()
	local i, j = string.find(serverName, " #%d+ ")

	if i then
		return tonumber(string.sub(serverName, i+2, j-1))
	else
		return true
	end
end

-- DEBUG MODE OPTIONS

function isTestServer()
	local serverName = getServerName()
	local i, j = string.find(serverName, "[DEV-CLOSED BETA]")

	if i then
		return true
	else
		return false
	end

end

addEvent("isTestServer", true)
addEventHandler("isTestServer", root, isTestServer)

-- DEBUG MODE OPTIONS

function webGetAccountInfo(accName)
	local accInfo = nil
	
	if(type(accName) == "string") then
		local accHash = getHash(accName)
		
		repeat
			dbq = dbQuery(db, "SELECT money, email, usergroup, wantedLevel, respect FROM users WHERE name=?", accHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		if(table.getn(dbqueryresult) > 0) then
			--accInfo = { accName, dbqueryresult[1]["money"], math.floor(dbqueryresult[1]["respect"]*100), playerGroups[dbqueryresult[1]["usergroup"]][1], dbqueryresult[1]["wantedLevel"], dbqueryresult[1]["email"] }
			accInfo = {}
			accInfo["Никнейм"] = accName
			accInfo["Деньги"] = dbqueryresult[1]["money"]
			accInfo["Репутация"] = math.floor(dbqueryresult[1]["respect"]*100)
			accInfo["Статус"] = playerGroups[dbqueryresult[1]["usergroup"]][1]
			accInfo["Уровень розыска"] = dbqueryresult[1]["wantedLevel"]
			accInfo["Электронная почта"] = dbqueryresult[1]["email"]
		end
	end
	
	return accInfo
end

function webGetDonateInfo(payId)
	repeat
		dbq = dbQuery(db, "SELECT * FROM donate WHERE id=?", payId)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if(table.getn(dbqueryresult) > 0) then
		return dbqueryresult[1]
	end
	
	return nil
end

function webApplyDonate(accName, payId, payDonateId, payParam, payState, payMsg, paySum)
	return dbExec(db,
		"INSERT INTO donate(id, player, donateid, donateparam, donatestate, donatemsg, donatesum) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE player=VALUES(player), donateid=VALUES(donateid), donateparam=VALUES(donateparam), donatestate=VALUES(donatestate), donatemsg=VALUES(donatemsg), donatesum=VALUES(donatesum)",
		payId, getHash(accName), payDonateId, tostring(payParam), payState, payMsg, paySum)
end

--[[
function webGetDonateRecordsNum(plrName, did)
	local pHash = getHash(plrName)
	repeat
		dbq = dbQuery(db, "SELECT COUNT(id) AS count FROM donate WHERE player=? AND donateid=? AND", pHash, did)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	if dbqueryresult then
		return tonumber(dbqueryresult[1]["count"])
	end
	return 0
end
]]

function activateDonate(plr, dbid)
	if client and(source == resourceRoot) and(plr == client) then
		local donateSuccess = false
		repeat
			dbq = dbQuery(db, "SELECT * FROM donate WHERE id=? AND donateactiv=0 AND donatestate='pay' AND donatemsg IS NULL", dbid)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		if(table.getn(dbqueryresult) > 0) then
			local donateInfo = dbqueryresult[1]
			local pHash = getHash(getPlayerName(plr))
			local dbHash = donateInfo["player"]
			
			if(pHash == dbHash) then
				local did = donateInfo["donateid"]
				local paramStr = donateInfo["donateparam"]
				
				if(did == 1) then -- Покупка игровой валюты
					local amount = math.ceil(tonumber(paramStr)*donateInfo["donatesum"])
					giveMoney(plr, amount)
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы совершили покупку игровых вирт в размере $"..tostring(amount))
					donateSuccess = true
				
				elseif(did == 2) then -- Покупка рекламы
					--TODO
				
				elseif(did == 3) then -- Покупка лица для персонажа
					donateSuccess = dbExec(db, "UPDATE users SET face=? WHERE name=?", nil, pHash)
					if donateSuccess then
						triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы активировали возможность использования лиц для персонажа. Вы можете задать ссылку на изображение лица в меню действий.")
					end
				
				elseif(did == 4) then -- Сохранение оружия после смерти
					donateSuccess = dbExec(db, "UPDATE users SET weapAfterDeath=1 WHERE name=?", pHash)
					if donateSuccess then
						triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь ваше оружие останется с вами даже после смерти.")
					end
				
				elseif(did == 5) then -- Расширение инвентаря
					repeat
						dbq = dbQuery(db, "SELECT invSlotNum FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local slotsNum = dbqueryresult[1]["invSlotNum"]
						
						if(slotsNum == 6) then
							donateSuccess = dbExec(db, "UPDATE users SET invSlotNum=12 WHERE name=?", pHash)
							
							if donateSuccess then
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш инвентарь был расширен до 12 слотов. Перезайдите на сервер для вступления изменений в силу.")
							end
							
						elseif(slotsNum == 12) then
							donateSuccess = dbExec(db, "UPDATE users SET invSlotNum=18 WHERE name=?", pHash)
							
							if donateSuccess then
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш инвентарь был расширен до 18 слотов. Перезайдите на сервер для вступления изменений в силу.")
							end
						end
						
					end
				
				elseif(did == 6) then -- Покупка увеличенного запаса здоровья
					repeat
						dbq = dbQuery(db, "SELECT maxhp FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local maxhp = dbqueryresult[1]["maxhp"]
						
						if(maxhp == 569) then
							donateSuccess = dbExec(db, "UPDATE users SET maxhp=1000 WHERE name=?", pHash)
							if donateSuccess then
								setPedStat(plr, 24, 1000)
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш максимальный запас здоровья был увеличен.")
							end
						end
					end
					
				elseif(did == 7) then -- Спаун транспорта в любом месте(х10)
					repeat
						dbq = dbQuery(db, "SELECT carSpawns FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local carSpawns = dbqueryresult[1]["carSpawns"]
						donateSuccess = dbExec(db, "UPDATE users SET carSpawns=? WHERE name=?", carSpawns+10, pHash)
						if donateSuccess then
							triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы получили 10 спаунов вашего транспорта в любом месте.")
						end
					end
					
				elseif(did == 8) then -- Покупка джетпака
					repeat
						dbq = dbQuery(db, "SELECT jetpack FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local fuelOldVal = dbqueryresult[1]["jetpack"]
						local fuelNewVal = tonumber(paramStr)
						
						if(fuelOldVal > 200) then
							donateSuccess = false
							triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас уже есть бесконечный запас топлива джетпака.")
						else
							if(fuelNewVal > 200) then
								donateSuccess = dbExec(db, "UPDATE users SET jetpack=1000 WHERE name=?", pHash)
								if donateSuccess then
									setElementData(plr, "jetpackFuel", 1000)
									triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь у вас бесконечный запас топлива джетпака. Вы можете воспользоваться джетпаком через меню действий.")
								end
							
							else
								if(fuelOldVal < 95) then
									donateSuccess = dbExec(db, "UPDATE users SET jetpack=100 WHERE name=?", pHash)
									if donateSuccess then
										setElementData(plr, "jetpackFuel", 100)
										triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы пополнили запас топлива джетпака. Вы можете воспользоваться джетпаком через меню действий.")
									end
								else
									donateSuccess = false
									triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас уже достаточно топлива в джетпаке для его пополнения.")
								end
							end
						end
					end
					
				elseif(did == 9) then -- Выбор анимации ходьбы
					repeat
						dbq = dbQuery(db, "SELECT customWalk FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local customWalk = dbqueryresult[1]["customWalk"]
						
						if(customWalk == 0) then
							donateSuccess = dbExec(db, "UPDATE users SET customWalk=1 WHERE name=?", pHash)
							if donateSuccess then
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь вы можете выбирать анимацию ходьбы через подменю внутри меню действий.")
							end
						end
						
					end
					
				elseif(did == 10) then -- Огнеупорность
					repeat
						dbq = dbQuery(db, "SELECT fireproof FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local fireproof = dbqueryresult[1]["fireproof"]
						
						if(fireproof == 0) then
							donateSuccess = dbExec(db, "UPDATE users SET fireproof=1 WHERE name=?", pHash)
							if donateSuccess then
								setElementData(plr, "fireproof", true)
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь ваш персонаж имеет огнеупорность.")
							end
						end
					end
					
				elseif(did == 11) then -- Выбор стиля борьбы
					repeat
						dbq = dbQuery(db, "SELECT customFight FROM users WHERE name=?", pHash)
						dbqueryresult = dbPoll(dbq, 30000)
						dbFree(dbq)
					until dbqueryresult
					
					if dbqueryresult then
						local customFight = dbqueryresult[1]["customFight"]
						
						if(customFight == 0) then
							donateSuccess = dbExec(db, "UPDATE users SET customFight=1 WHERE name=?", pHash)
							if donateSuccess then
								triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь вы можете выбирать различные стили борьбы через подменю внутри меню действий.")
							end
						end
					end
					
				elseif(did == 12) then -- Уникальный автомобиль
					local vehMdl = tonumber(paramStr)
					local veh = createVehicle(vehMdl, 0, 0, 0)
					setElementDimension(veh, 1)
					local c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12 = getVehicleColor(veh, true)
					destroyElement(veh)
					donateSuccess = dbExec(db, "INSERT INTO cars(carid, clrr1, clrg1, clrb1, clrr2, clrg2, clrb2, clrr3, clrg3, clrb3, clrr4, clrg4, clrb4, hp, owner) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", vehMdl, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, 1000, pHash)
					
					if donateSuccess then
						triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы приобрели уникальное транспортное средство и можете его получить на любой точке спауна данного вида транспорта.")
					end
				end
			end
		end
		
		if donateSuccess then
			donateSuccess = dbExec(db, "UPDATE donate SET donateactiv=1 WHERE id=?", dbid)
		end
		
		if not donateSuccess then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Произошла ошибка при активации доната. Возможно, этот вид доната является одноразовым и был активирован вами ранее.")
		end
		
		addNewEventToLog(getPlayerName(plr), "Донат - Активация - "..tostring(dbid).."", donateSuccess)
		
		return donateSuccess
	end
	
	return false
end

function jetpackOn(plr)
	if(not doesPedHaveJetPack(plr)) and(not isPedInVehicle(plr)) then
		local fuel = getElementData(plr, "jetpackFuel")
		
		if fuel and(fuel > 0.0) then
			addNewEventToLog(getPlayerName(plr), "Джетпак - Старт - nil", true)
			givePedJetPack(plr)
		end
		
	end
end

function jetpackOff(plr)
	if doesPedHaveJetPack(plr) then
		local pHash = getHash(getPlayerName(plr))
		local fuel = getElementData(plr, "jetpackFuel")
		
		if fuel then
			dbExec(db, "UPDATE users SET jetpack=? WHERE name=?", fuel, pHash)
		end
		
		addNewEventToLog(getPlayerName(plr), "Джетпак - Стоп - nil", true)
		removePedJetPack(plr)
	end
end

function addNewEventToLog(plrName, eventName, success)
	local plrHash
	
	if(type(plrName) == "string") then
		plrHash = getHash(plrName)
	else
		plrHash = tostring(plrName)
	end
	
	local successStr
	
	if success then
		successStr = "Succeed"
	else
		successStr = "Failed"
	end
	
	--return true
	return outputServerLog("EVENT("..successStr.."): "..plrHash.." ["..eventName.."]")
	--return dbExec(db, "INSERT INTO eventsLog(player, event, success, eventDate) VALUES(?, ?, ?, ?)", getHash(plrName), eventName, success, curTime.timestamp)
end

function customWalkSelect(plr, animId)
	if(source == resourceRoot) and(plr == client) then
		setPedWalkingStyle(plr, animId)
	end
end

function customFightSelect(plr, animId)
	if(source == resourceRoot) and(client == plr) then
		setPedFightingStyle(plr, animId)
	end
end

function setRandomThinkBubble()
	local plr = getRandomPlayer(plr)
	
	if plr and isElement(plr) and(not getElementData(plr, "RC")) and(not isPedDead(plr)) and((not thinkBubbleLastTime[plr]) or (thinkBubbleLastTime[plr] and((getTickCount()-thinkBubbleLastTime[plr]) > 90000))) then
		local cx, cy, cz = getElementPosition(plr)
		local curCol = createColSphere(cx, cy, cz, 300)
		local players = getElementsWithinColShape(curCol, "player")
		destroyElement(curCol)
		triggerClientEvent(players, "onThinkBubbleCreate", plr, "images/think_random_"..math.random(30)..".dds")
		thinkBubbleLastTime[plr] = getTickCount()
	end
	
	for plr,btim in pairs(thinkBubbleLastTime) do
		if not isElement(plr) then
			thinkBubbleLastTime[plr] = nil
		end
	end
end

clanDefault = nil
clanLeaders = {}
clanColeaders = {}
clanInvites = {}

--[[
	- 971(Тригер)
	- 492(автомобиль)
	- 987(забор)
	- 967(открытие/закрытие ворот)
	- 16096(склад очень маленький) Z+0.0, Marker(X-3.1, Y-0.0, Z-1.9)
	- 12925(склад маленький) Z-1.9, Marker(X-7.8, Y-0.0, Z-0.0)
	- 10847(склад средний) Z+4.5, Marker(X-11.8, Y-5.8, Z-6.4)
	- 13190(склад большой) Z+1.8, Marker(X-11.1, Y+0.9, Z-3.8)
	- 9260(склад очень большой) Z+3.3, Marker(X-14.2, Y+0.2, Z-8.1)
	- Marker size: 1.5
	- X, Y, Z, territorySize, buildingPosition, carPositions, gatePosition, controlPositions
]]

--[[ { baseHash, baseX, baseY, baseZ, baseSizeId, baseBuildingX, baseBuildingY, baseBuildingZ, baseBuildingRX, baseBuildingRY, baseBuildingRZ, baseGateX, baseGateY, baseGateZ, baseGateRX, baseGateRY, baseGateRZ,
					{ { controlX, controlY, controlZ, controlRX, controlRY, controlRZ } },
					{ { carX, carY, carZ, carRX, carRY, carRZ } },
					basePickup, baseBuilding, baseMarker, baseGate, { baseControls }, clan, money, { baseCars }, { { weapId, weapAmmo } }, gateState, carModel
					}
]]

function clanInit()
	--dbExec(db, "UPDATE users SET clan=0,coleader=0 WHERE lastLogin<? AND leader=0", getRealTime().timestamp-604800)
	dbExec(db, "DELETE FROM clans WHERE id IN(SELECT id FROM(SELECT clans.id, COUNT(users.name) AS playerCount FROM clans LEFT JOIN users ON users.clan = clans.id GROUP BY clans.id HAVING playerCount = 0) AS emptyClans)")
	dbExec(db, "UPDATE clanBases SET clan=0 WHERE clan NOT IN(SELECT id FROM clans)")
	clanDefault = createTeam("Граждане")
	repeat
		local dbq = dbQuery(db, "SELECT id, name, clrr, clrg, clrb FROM clans")
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	local clanInfo = dbqueryresult
	local clanLeaderHash, clanColeadersHashes, clanPlayersInfo
	
	for _,clan in ipairs(clanInfo) do
		clanLeaderHash = nil
		clanColeadersHashes = {}
		
		repeat
			local dbq = dbQuery(db, "SELECT name, leader, coleader FROM users WHERE clan=?", clan["id"])
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		clanPlayersInfo = dbqueryresult
		
		for _,plr in ipairs(clanPlayersInfo) do
			if(plr["leader"] > 0) then
				clanLeaderHash = plr["name"]
			elseif(plr["coleader"] > 0) then
				table.insert(clanColeadersHashes, plr["name"])
			end
		end
		
		clanCreate(clan["name"], clan["clrr"], clan["clrg"], clan["clrb"], clanLeaderHash, clanColeadersHashes)
	end
	
	local mpos
	local lvlInfo, baseMoney, baseCarNum, baseCarMdl, baseHash, baseOwner, baseWeapons, baseInventory
	
	for i,base in ipairs(clanBases) do
		baseHash = base[1]
		
		repeat
			local dbq = dbQuery(db, "SELECT clan, lvl, money, carnum, carmdl, genfuel FROM clanBases WHERE id=?", baseHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		while(table.getn(dbqueryresult) == 0) do
			dbExec(db, "INSERT INTO clanBases(id,carmdl) VALUES(?,?)", baseHash, clanBaseCars[1])
			repeat
				local dbq = dbQuery(db, "SELECT clan, lvl, money, carnum, carmdl, genfuel FROM clanBases WHERE id=?", baseHash)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
		end
		
		lvlInfo = clanBaseSizes[dbqueryresult[1]["lvl"]]
		baseMoney = dbqueryresult[1]["money"]
		baseCarNum = dbqueryresult[1]["carnum"]
		baseCarMdl = dbqueryresult[1]["carmdl"]
		baseOwner = getClanByHash(dbqueryresult[1]["clan"])
		local fuelLevel = dbqueryresult[1]["genfuel"]
		clanBases[i][32] = createVehicle(611, base[32][1], base[32][2], base[32][3], base[32][4], base[32][5], base[32][6])
		setElementFrozen(clanBases[i][32], true)
		setElementData(clanBases[i][32], "explodable", true)
		setElementData(clanBases[i][32], "fuelLevel", fuelLevel)
		setElementData(clanBases[i][32], "engineType", "generator")
		addEventHandler("onVehicleExplode", clanBases[i][32], clanBaseGeneratorOnDestroy)
		
		repeat
			local dbq = dbQuery(db, "SELECT weapon, ammo FROM clanBaseWeapons WHERE base=?", baseHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		baseWeapons = dbqueryresult
		
		repeat
			local dbq = dbQuery(db, "SELECT item, count FROM clanBaseInventory WHERE base=?", baseHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		baseInventory = dbqueryresult
		clanBases[i][20] = createPickup(base[2], base[3], base[4], 3, 1314, 0)
		attachActionToElement(defaultActions[84], clanBases[i][20])
		setPickupText(clanBases[i][20], "Купить/продать базу", 255, 0, 0)
		clanBases[i][21] = createObject(lvlInfo[1], base[6], base[7], base[8]+lvlInfo[3], base[9], base[10], base[11])
		mpos = getOffsetFromElement(clanBases[i][21], lvlInfo[4], lvlInfo[5], lvlInfo[6])
		clanBases[i][22] = createMarker(mpos[1], mpos[2], mpos[3], "cylinder", 1.5, 255, 0, 0, 128)
		attachActionToElement(defaultActions[100], clanBases[i][22])
		attachActionToElement(defaultActions[88], clanBases[i][22])
		attachActionToElement(defaultActions[89], clanBases[i][22])
		attachActionToElement(defaultActions[101], clanBases[i][22])
		attachActionToElement(defaultActions[91], clanBases[i][22])
		attachActionToElement(defaultActions[94], clanBases[i][22])
		attachActionToElement(defaultActions[90], clanBases[i][22])
		attachActionToElement(defaultActions[92], clanBases[i][22])
		attachActionToElement(defaultActions[93], clanBases[i][22])
		attachActionToElement(defaultActions[97], clanBases[i][22])
		setPickupText(clanBases[i][22], "База клана", 255, 0, 0)
		clanBases[i][23] = createObject(971, base[12], base[13], base[14], base[15], base[16], base[17])
		
		if baseOwner then
			local r, g, b = getTeamColor(baseOwner)
			setRadarAreaColor(base[35], r, g, b, 150)
			
			if(fuelLevel > 0.0) then
				clanBaseGeneratorTurnOn(i)
			else
				clanBaseGateOpen(i)
			end
			
			setElementVisibleTo(base[36], root, false)
		else
			clanBaseGateOpen(i)
		end
		
		local ctrlObj
		
		for _,ctrlInfo in ipairs(base[18]) do
			ctrlObj = createObject(967, ctrlInfo[1], ctrlInfo[2], ctrlInfo[3], ctrlInfo[4], ctrlInfo[5], ctrlInfo[6])
			table.insert(clanBases[i][24], ctrlObj)
			attachActionToElement(defaultActions[87], ctrlObj)
		end
		
		clanBases[i][25] = baseOwner
		clanBases[i][26] = baseMoney
		clanBases[i][30] = baseCarMdl
		
		for carid=1,baseCarNum do
			clanBaseAddCar(i, nil)
		end
		
		for _,weap in ipairs(baseWeapons) do
			table.insert(clanBases[i][28], { weap["weapon"], weap["ammo"] })
		end
		
		for _,item in ipairs(baseInventory) do
			table.insert(clanBases[i][31], { item["item"], item["count"] })
		end
		
		local businesses = {}
		
		for _,business in ipairs(ammuShops) do
			if(not clanBaseBusinesses[business[7]]) and(getDistanceBetweenPoints2D(base[6], base[7], business[2], business[3]) < 550.0) then
				clanBaseBusinesses[business[7]] = i
			end
		end
		
		for _,business in ipairs(eatLocations) do
			if(not clanBaseBusinesses[business[7]]) and(getDistanceBetweenPoints2D(base[6], base[7], business[2], business[3]) < 550.0) then
				clanBaseBusinesses[business[7]] = i
			end
		end
		
	end
	
	setTimer(clanBaseGeneratorProcess, 5000, 0)
end

function clanCreate(clanName, clanR, clanG, clanB, clanLeaderHash, clanColeadersHashes)
	local newClan = createTeam(clanName, clanR, clanG, clanB)
	clanLeaders[newClan] = clanLeaderHash
	clanColeaders[newClan] = clanColeadersHashes
	return newClan
end

function clanCreateNew(creator, clanName, clanR, clanG, clanB)
	local clanNameUpper = string.upper(clanName)
	local respect = getElementData(creator, "respect")
	local checkStrStart, checkStrEnd = string.find(clanNameUpper, "[ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]+")
	local curMoney = getMoney(creator)
	
	if isPlayerBusy(creator) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Вы должны закончить остальные дела, прежде чем создать клан.")
	
	elseif string.find(clanNameUpper, " ") then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Имя клана не может содержать пробелы.")
	
	elseif(string.len(clanNameUpper) == 0) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Имя клана не может быть пустым.")
	
	elseif(not checkStrStart) or (string.sub(clanNameUpper, checkStrStart, checkStrEnd) ~= clanNameUpper) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Имя клана должно содержать только символы латиницы и цифры.")
	
	elseif(string.len(clanNameUpper) > 6) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Имя клана не может быть длиннее шести символов.")
	
	elseif getTeamFromName(clanNameUpper) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Такой клан уже существует на сервере.")
	
	elseif getPlayerClan(creator) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "Вы уже находитесь в клане.")
		
	elseif (curMoney < clanCreatePrice) then
		triggerClientEvent(creator, "onServerMsgAdd", creator, "У вас недостаточно денег.")
		
	else
		local pHash = getHash(getPlayerName(creator))
		local newClan = clanCreate(clanNameUpper, math.min(225, math.max(30, clanR)), math.min(225, math.max(30, clanG)), math.min(225, math.max(30, clanB)), pHash, {})
		local cHash = getHash(clanNameUpper)
		setPlayerTeam(creator, newClan)
		attachActionToSelf(defaultActions[85], creator)
		attachActionToSelf(defaultActions[99], creator)
		clanLeaders[newClan] = pHash
		clanColeaders[newClan] = {}
		clanPlayerInfoUpdate(newClan)
		local respect = getElementData(creator, "respect")
		respectSet(creator, math.min(respect, -0.0001), -1.0, 1.0)
		takeMoney(creator, clanCreatePrice)
		local crResult = dbExec(db, "INSERT INTO clans(id,name,clrr,clrg,clrb) VALUES(?,?,?,?,?)", cHash, clanNameUpper, clanR, clanG, clanB)
		
		if crResult then
			dbExec(db, "UPDATE users SET clan=?, leader=1 WHERE name=?", cHash, pHash)
			addNewEventToLog(getPlayerName(creator), "Клан - Создание - "..tostring(clanNameUpper), true)
			triggerClientEvent(creator, "onServerMsgAdd", creator, "Вы создали новый клан - "..clanNameUpper..".")
		end
		
		return crResult
	end
	
	return false
end

function getPlayerClan(plr)
	local clan = getPlayerTeam(plr)
	
	if(clan == clanDefault) then
		clan = nil
	end
	
	return clan
end

function clanDestroy(destroyer, clan)
	local isLeader = clanIsLeader(destroyer, clan)
	
	if(isLeader or isAdmin(destroyer) or isModerator(destroyer)) then
		addNewEventToLog(getPlayerName(destroyer), "Клан - Удаление - "..getTeamName(clan), true)
		local clanName = getTeamName(clan)
		local members = getPlayersInTeam(clan)
		
		for _,member in ipairs(members) do
			clanLeave(member, false)
			--setPlayerTeam(member, clanDefault)
			--detachActionFromSelf(defaultActions[85], member)
			--detachActionFromSelf(defaultActions[99], member)
		end
		
		for i,base in ipairs(clanBases) do
			if clanBaseCaptures[i] then
				if(base[25] == clan) then
					clanBaseCaptureFinish(i, true)
				elseif(clanBaseCaptures[i][1] == clan) then
					clanBaseCaptureFinish(i, false)
				end
				
			elseif(base[25] == clan) then
				clanBaseChangeOwner(i, nil)
			end
		end
		
		local invFound
		repeat
			invFound = false
			
			for i,invite in ipairs(clanInvites) do
				if(clan == invite[1]) then
					if isTimer(invite[3]) then
						killTimer(invite[3])
					end
					table.remove(clanInvites, i)
					invFound = true
					break
				end
			end
			
		until not invFound
		triggerClientEvent(members, "onServerMsgAdd", destroyer, "Клан "..clanName.." был удалён с сервера игроком "..getPlayerName(destroyer)..".")
		
		if isElement(clan) then
			destroyElement(clan)
		end
		
		triggerClientEvent(members, "onClanCloseMenu", destroyer)
		dbExec(db, "DELETE FROM clans WHERE id=?", getHash(clanName))
		dbExec(db, "UPDATE users SET clan=0,leader=0,coleader=0 WHERE clan=?", getHash(clanName))
	end
end

function clanSetLeader(seter, newLeader)
	if(source == resourceRoot) and(client == seter) then
		local clan = getPlayerClan(seter)
		
		if clan and clanIsLeader(seter, clan) then
			if not (getPlayerClan(newLeader) == clan) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newLeader).." не находится в составе клана "..getTeamName(clan)..".")
			
			elseif(seter == newLeader) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не можете назначить себя лидером своего клана.")
			
			elseif clanIsLeader(newLeader, clan) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newLeader).." уже назначен лидером клана.")
			
			else
				addNewEventToLog(getPlayerName(seter), "Клан - Новый лидер - "..getPlayerName(newLeader), true)
				
				if clanIsColeader(newLeader, clan) then
					clanRemoveColeader(seter, newLeader)
				end
				
				dbExec(db, "UPDATE users SET leader=0 WHERE name=?", clanLeaders[clan])
				clanLeaders[clan] = getHash(getPlayerName(newLeader))
				dbExec(db, "UPDATE users SET leader=1 WHERE name=?", clanLeaders[clan])
				clanPlayerInfoUpdate(clan)
				triggerClientEvent(newLeader, "onServerMsgAdd", newLeader, "Игрок "..getPlayerName(seter).." назначил вас новым лидером клана "..getTeamName(clan)..".")
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newLeader).." назначен новым лидером клана "..getTeamName(clan)..".")
			end
			
		else
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не являетесь лидером клана.")
		end
	end
end

function clanIsLeader(plr, clan)
	return(clanLeaders[clan] == getHash(getPlayerName(plr)))
end

function clanIsColeader(plr, clan)
	for _,coleader in ipairs(clanColeaders[clan]) do
		if(coleader == getHash(getPlayerName(plr))) then
			return true
		end
	end
	return false
end

function clanSetColeader(seter, newColeader)
	if(source == resourceRoot) and(client == seter) then
		local clan = getPlayerClan(seter)
		
		if clan and clanIsLeader(seter, clan) then
			if not (getPlayerClan(newColeader) == clan) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newColeader).." не находится в составе клана "..getTeamName(clan)..".")
			
			elseif(seter == newColeader) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не можете назначить себя ко-лидером своего клана.")
			
			elseif clanIsColeader(newColeader, clan) then
				--triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newColeader).." уже назначен ко-лидером клана.")
				clanRemoveColeader(seter, newColeader)
			
			elseif clanIsLeader(newColeader, clan) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newColeader).." уже назначен лидером клана.")
			
			else
				addNewEventToLog(getPlayerName(seter), "Клан - Новый ко-лидер - "..getPlayerName(newColeader), true)
				local pHash = getHash(getPlayerName(newColeader))
				table.insert(clanColeaders[clan], pHash)
				clanPlayerInfoUpdate(clan)
				dbExec(db, "UPDATE users SET coleader=1 WHERE name=?", pHash)
				triggerClientEvent(newColeader, "onServerMsgAdd", newColeader, "Игрок "..getPlayerName(seter).." назначил вас ко-лидером клана "..getTeamName(clan)..".")
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(newColeader).." назначен ко-лидером клана "..getTeamName(clan)..".")
			end
			
		else
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не являетесь лидером клана.")
		end
	end
end

function clanRemoveColeader(seter, coleader)
	local clan = getPlayerClan(seter)
	
	if clan and clanIsLeader(seter, clan) then
		if not (getPlayerClan(coleader) == clan) then
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(coleader).." не находится в составе клана "..getTeamName(clan)..".")
		
		elseif not clanIsColeader(coleader, clan) then
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(coleader).." не является ко-лидером клана.")
		
		else
			addNewEventToLog(getPlayerName(seter), "Клан - Снятие ко-лидера - "..getPlayerName(coleader), true)
			
			local pHash = getHash(getPlayerName(coleader))
			
			for i,member in ipairs(clanColeaders[clan]) do
				if(member == pHash) then
					table.remove(clanColeaders[clan], i)
					break
				end
			end
			
			clanPlayerInfoUpdate(clan)
			dbExec(db, "UPDATE users SET coleader=0 WHERE name=?", pHash)
			triggerClientEvent(coleader, "onServerMsgAdd", coleader, "Игрок "..getPlayerName(seter).." убрал вас из ко-лидеров клана "..getTeamName(clan)..".")
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(coleader).." был убран из ко-лидеров клана "..getTeamName(clan)..".")
		end
		
	else
		triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не являетесь лидером клана.")
	end
end

function clanGetBasesCount(clan)
	local count = 0
	
	for _,base in ipairs(clanBases) do
		if(base[25] == clan) then
			count = count + 1
		end
	end
	
	return count
end

function clanGetMaxMembers(clan)
	return(20+clanGetBasesCount(clan)*10)
end

function clanGetMembersCount(clan)
	local cHash = getHash(getTeamName(clan))
	
	repeat
		local dbq = dbQuery(db, "SELECT COUNT(*) AS count FROM users WHERE clan=?", cHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	return(dbqueryresult[1]["count"]+clanGetInvitesCount(clan))
end

function clanInviteSend(sender, receiver)
	if(source == resourceRoot) and(client == sender) then
		local clan = getPlayerClan(sender)
		
		if clan and(clanIsLeader(sender, clan) or clanIsColeader(sender, clan)) then
			if not (getPlayerClan(receiver) == nil) then
				triggerClientEvent(sender, "onServerMsgAdd", sender, "Игрок "..getPlayerName(receiver).." уже находится в составе клана.")
			
			elseif(receiver == sender) then
				triggerClientEvent(sender, "onServerMsgAdd", sender, "Вы не можете пригласить сами себя в клан.")
			
			elseif clanInviteFind(receiver, clan) then
				triggerClientEvent(sender, "onServerMsgAdd", sender, "У игрока "..getPlayerName(receiver).." уже есть приглашение в ваш клан.")
			
			elseif(clanGetMembersCount(clan) >= clanGetMaxMembers(clan)) then
				triggerClientEvent(sender, "onServerMsgAdd", sender, "Ваш клан достиг лимита количества приглашений и членов клана.")
			
			else
				addNewEventToLog(getPlayerName(sender), "Клан - Приглашение - "..getPlayerName(receiver), true)
				table.insert(clanInvites, { clan, receiver, setTimer(clanInviteDeny, 60000, 1, receiver, clan) })
				triggerClientEvent(receiver, "onServerMsgAdd", receiver, "Игрок "..getPlayerName(sender).." приглашает вас в клан "..getTeamName(clan)..". Воспользуйтесь меню действий для вступления в клан.")
				triggerClientEvent(sender, "onServerMsgAdd", sender, "Вы отослали игроку "..getPlayerName(receiver).." приглашение в клан.")
			end
			
		else
			triggerClientEvent(sender, "onServerMsgAdd", sender, "Вы не являетесь лидером или ко-лидером клана.")
		end
	end
end

function clanGetInvitesCount(clan)
	local count = 0
	
	for i,invite in ipairs(clanInvites) do
		if(invite[1] == clan) then
			count = count + 1
		end
	end
	
	return count
end

function clanInviteFind(plr, clan)
	for i,invite in ipairs(clanInvites) do
		if(invite[1] == clan) and(invite[2] == plr) then
			return i
		end
	end
	return false
end

function clanInviteAccept(plr, clan)
    local fracGrp = getElementData(plr, "usergroup")
	local invite = clanInviteFind(plr, clan)
	if fracGrp and (fracGrp == 2) or (fracGrp == 4) or (fracGrp == 5) or (fracGrp == 17) or (fracGrp == 18) then
	    triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Вы не можете вступить в клан, находясь в гос.фракции.")
		return
	end	
	
	if invite then
		if not getPlayerClan(plr) then
			addNewEventToLog(getPlayerName(plr), "Клан - Вступление - "..getTeamName(clan), true)
			setPlayerTeam(plr, clan)
			attachActionToSelf(defaultActions[85], plr)
			attachActionToSelf(defaultActions[99], plr)
			
			if isTimer(clanInvites[invite][3]) then
				killTimer(clanInvites[invite][3])
			end
			
			table.remove(clanInvites, invite)
			dbExec(db, "UPDATE users SET clan=? WHERE name=?", getHash(getTeamName(clan)), getHash(getPlayerName(plr)))
			local respect = getElementData(plr, "respect")
			respectSet(plr, math.min(respect, -0.0001), -1.0, 1.0)
			clanPlayerInfoUpdate(clan)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы вступили в клан "..getTeamName(clan)..".")
		end
	end
	
end

function clanInviteDeny(plr, clan)
	if isElement(plr) then
		local invite = clanInviteFind(plr, clan)
		
		if invite then
			if not getPlayerClan(plr) then
				addNewEventToLog(getPlayerName(plr), "Клан - Вступление - "..getTeamName(clan), false)
				
				if isTimer(clanInvites[invite][3]) then
					killTimer(clanInvites[invite][3])
				end
				
				table.remove(clanInvites, invite)
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы отказались от вступления в клан "..getTeamName(clan)..".")
			end
		end
		
	end
end

function clanRemoveMember(seter, member)
	if(source == resourceRoot) and(client == seter) then
		local clan = getPlayerClan(seter)
		local clanName = getTeamName(clan)
		
		if clan and clanIsLeader(seter, clan) then
			if not (getPlayerClan(member) == clan) then
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(member).." не находится в составе клана "..clanName..".")
			
			else
				addNewEventToLog(getPlayerName(seter), "Клан - Исключение игрока - "..getPlayerName(member), true)
				addNewEventToLog(getPlayerName(member), "Клан - Исключение из клана - "..getPlayerName(seter), true)
				clanLeave(member, true)
				triggerClientEvent(member, "onServerMsgAdd", member, "Игрок "..getPlayerName(seter).." исключил вас из клана "..clanName..".")
				triggerClientEvent(seter, "onServerMsgAdd", seter, "Игрок "..getPlayerName(member).." исключён из клана "..clanName..".")
			end
			
		else
			triggerClientEvent(seter, "onServerMsgAdd", seter, "Вы не являетесь лидером клана.")
		end
		
	end
end

function clanLeave(member, checkLeader)
	local clan = getPlayerClan(member)
	
	if clan then
		addNewEventToLog(getPlayerName(member), "Клан - Покинул клан - "..getTeamName(clan), true)
		triggerClientEvent(member, "onClanCloseMenu", member)
		
		if(client == member) then
			triggerClientEvent(member, "onServerMsgAdd", member, "Вы покинули клан "..getTeamName(clan)..".")
		end
		
		setPlayerTeam(member, clanDefault)
		detachActionFromSelf(defaultActions[85], member)
		detachActionFromSelf(defaultActions[99], member)
		triggerClientEvent(member, "onClanCloseMenu", member)
		dbExec(db, "UPDATE users SET clan=0,leader=0,coleader=0 WHERE name=?", getHash(getPlayerName(member)))
		
		if checkLeader and clanIsLeader(member, clan) then
			clanDestroy(member, clan)
		end
	end
end

function clanPlayerInfoUpdate(clan)
	local plrs = getPlayersInTeam(clan)
	local leader = nil
	local coleaders = {}
	local members = {}
	
	for i,plr in ipairs(plrs) do
		if clanIsLeader(plr, clan) then
			leader = plr
		elseif clanIsColeader(plr, clan) then
			table.insert(coleaders, plr)
		
		else
			table.insert(members, plr)
		end
		
	end
	
	triggerClientEvent(plrs, "onClanInfoUpdate", resourceRoot, leader, coleaders, members)
end

function getClanByHash(hash)
	local teams = getElementsByType("team")
	
	for _,tm in ipairs(teams) do
		if(hash == getHash(getTeamName(tm))) then
			return tm
		end
	end
	
	return nil
end

function findRotationObj(x1, y1, x2, y2)
	local t = math.deg(math.atan2(x2 - x1, y2 - y1))
	return t < 0 and t + 360 or t
end

function getOffsetFromElement(elem, x, y, z)
	local elemx, elemy, elemz = getElementPosition(elem)
	--[[
	local mat = getElementMatrix(elem, false)
	local vec = {elemx+y, elemy-x, elemz+z}
	mat[1][4] = 0
    mat[2][4] = 0
    mat[3][4] = 0
    mat[4][4] = 1
    mat = matrix.invert(mat)
    local offX = vec[1] * mat[1][1] + vec[2] * mat[2][1] + vec[3] * mat[3][1] + mat[4][1]
    local offY = vec[1] * mat[1][2] + vec[2] * mat[2][2] + vec[3] * mat[3][2] + mat[4][2]
    local offZ = vec[1] * mat[1][3] + vec[2] * mat[2][3] + vec[3] * mat[3][3] + mat[4][3]
	]]
	local offX, offY, offZ
	offZ = elemz+z
	local _,_,angle = getElementRotation(elem)
	local dist = getDistanceBetweenPoints2D(0,0,x,y)
	offX = elemx + x * math.cos(math.rad(angle)) + y * math.sin(math.rad(angle))
	offY = elemy + x * math.sin(math.rad(angle)) + y * math.cos(math.rad(angle))
	return {offX, offY, offZ}
end

function clanBaseGetBusinessesCount(baseId)
	local businessesNum = 0
	
	for _,businessbase in pairs(clanBaseBusinesses) do
		if(businessbase == baseId) then
			businessesNum = businessesNum+1
		end
	end
	
	return businessesNum
end

function clanBaseGetPrice(baseId)
	local price = clanBaseSizes[clanBases[baseId][5]][7]
	return price+price*0.3*clanBaseGetBusinessesCount(baseId)+ (clanBaseGetLevel(baseId)-1)*25000+clanBaseGetCarsCount(baseId)*clanBaseGetCarPrice(baseId)+clanBaseGetMoney(baseId)
end

function clanBaseCheckBuy(plr, baseId, price)
	if(source == resourceRoot) and(client == plr) then
		if(price == clanBaseGetPrice(baseId)) then
			clanBaseBuy(client, baseId)
		else
			triggerClientEvent(client, "onServerMsgAdd", client, "Цена базы уже изменилась. Откройте меню ещё раз.")
		end
	end
end

function clanBaseBuy(plr, baseId)
	local clan = getPlayerClan(plr)
	local price = clanBaseGetPrice(baseId)
	local owner = clanBases[baseId][25]
	
	if clanBaseIsInCapture(baseId) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Эта база находится в состоянии захвата.")
	
	elseif owner then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Эта база уже занята.")
	
	elseif not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не числитесь ни в одном клане.")
	
	elseif not clanIsLeader(plr, clan) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не являетесь лидером своего клана.")
	
	elseif(getMoney(plr) < price) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас недостаточно денег для покупки этой базы.")
	else
		local curTime = getRealTime()
		addNewEventToLog(getPlayerName(plr), "Клан - Покупка базы - ID "..tostring(baseId), true)
		clanBases[baseId][25] = clan
		setElementVisibleTo(clanBases[baseId][36], root, false)
		takeMoney(plr, price)
		dbExec(db, "UPDATE clanBases SET clan=?,lastCapture=? WHERE id=?", getHash(getTeamName(clan)), curTime.timestamp, clanBases[baseId][1])
		local r, g, b = getTeamColor(clan)
		setRadarAreaColor(clanBases[baseId][35], r, g, b, 150)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Теперь эта база принадлежит клану "..getTeamName(clan)..".")
	end
end

function clanBaseCheckSell(plr, baseId, price)
	if(source == resourceRoot) and(client == plr) then
		local clan = getPlayerClan(client)
		
		repeat
			local dbq = dbQuery(db, "SELECT lastCapture FROM clanBases WHERE id=?", clanBases[baseId][1])
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		local curTime = getRealTime()
		local lastCapture = dbqueryresult[1]["lastCapture"]
		local timeLeft = lastCapture+129600-curTime.timestamp
		
		if clanBaseIsInCapture(baseId) then
			triggerClientEvent(client, "onServerMsgAdd", client, "Эта база находится в состоянии захвата.")
		
		elseif not clan then
			triggerClientEvent(client, "onServerMsgAdd", client, "Вы не находитесь в составе клана.")
		
		elseif not clanBases[baseId][25] then
			triggerClientEvent(client, "onServerMsgAdd", client, "Эта база никому не принадлежит.")
		
		elseif(clanBases[baseId][25] ~= clan) then
			triggerClientEvent(client, "onServerMsgAdd", client, "Эта база не принадлежит вашему клану.")
		
		elseif not clanIsLeader(client, clan) then
			triggerClientEvent(client, "onServerMsgAdd", client, "Вы не являетесь лидером клана.")
		
		elseif(price ~= clanBaseGetPrice(baseId)) then
			triggerClientEvent(client, "onServerMsgAdd", client, "Цена базы уже изменилась. Откройте меню ещё раз.")
		
		elseif(timeLeft > 0) then -- Продажа базы не меньше чем через 36 часов после другого захвата
			triggerClientEvent(client, "onServerMsgAdd", client, "Эту базу можно будет продать только через "..getTimeString(timeLeft*1000, "v")..".")
		
		else
			giveMoney(client, price)
			clanBaseChangeOwner(baseId)
			triggerClientEvent(client, "onServerMsgAdd", client, "Вы продали базу клана.")
		end
	end
end

function clanBaseIsInCapture(baseId)
	if clanBaseCaptures[baseId] then
		return true
	end
	
	return false
end

function clanBaseChangeOwner(baseId, newOwner)
	local oldOwner = clanBases[baseId][25]
	
	if(oldOwner ~= newOwner) then
		if newOwner then
			local r,g,b = getTeamColor(newOwner)
			
			for _,car in ipairs(clanBases[baseId][27]) do
				respawnVehicle(car)
				setElementData(car, "clan", newOwner, false)
				setVehicleColor(car,r,g,b,r,g,b,r,g,b,r,g,b)
			end
			
			setRadarAreaColor(clanBases[baseId][35], r, g, b, 150)
			dbExec(db, "UPDATE clanBases SET clan=? WHERE id=?", getHash(getTeamName(newOwner)), clanBases[baseId][1])
			clanBases[baseId][25] = newOwner
			setElementVisibleTo(clanBases[baseId][36], root, false)
		
		else
			--clanBases[baseId][29] = "closed"
			--setElementPosition(clanBases[baseId][23], clanBases[baseId][12], clanBases[baseId][13], clanBases[baseId][14])
			clanBaseGeneratorTurnOff(baseId)
			
			for _,car in ipairs(clanBases[baseId][27]) do
				destroyElement(car)
			end
			
			clanBases[baseId][27] = {}
			setElementModel(clanBases[baseId][21], clanBaseSizes[1][1])
			setElementPosition(clanBases[baseId][21], clanBases[baseId][6], clanBases[baseId][7], clanBases[baseId][8])
			clanBases[baseId][26] = 0
			clanBases[baseId][28] = {}
			setRadarAreaColor(clanBases[baseId][35], 255, 255, 255, 0)
			clanBases[baseId][31] = {}
			dbExec(db, "UPDATE clanBases SET clan=0, lvl=1, money=0, carnum=0, carmdl=? WHERE id=?", clanBaseCars[1], clanBases[baseId][1])
			dbExec(db, "DELETE FROM clanBaseWeapons WHERE base=?", clanBases[baseId][1])
			dbExec(db, "DELETE FROM clanBaseInventory WHERE base=?", clanBases[baseId][1])
			clanBases[baseId][25] = nil
			setElementVisibleTo(clanBases[baseId][36], root, true)
		end
	end
end

function clanBaseGetUpgradePrice(baseId)
	local lvl = clanBaseGetLevel(baseId)+1
	
	if(lvl > clanBases[baseId][5]) then
		return 0
	else
		return 25000
	end
end

function clanBaseUpgrade(baseId, plr)
	local clan = getPlayerClan(plr)
	local owner = clanBases[baseId][25]
	local money = clanBaseGetMoney(baseId)
	local price = clanBaseGetUpgradePrice(baseId)
	local lvl = clanBaseGetLevel(baseId)+1
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= owner) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Эта база не принадлежит вашему клану.")
	
	elseif(lvl > clanBases[baseId][5]) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Размер территории базы не позволяет улучшить её склад.")
	
	elseif clanBaseCaptures[baseId] then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Нельзя улучшить склад во время захвата базы.")
	
	elseif(money < price) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На базе недостаточно денег. Внесите на базу деньги для улучшения склада.")
	
	elseif clanBaseSetLevel(baseId, lvl) then
		addNewEventToLog(getPlayerName(plr), "Клан - Улучшение базы - ID "..tostring(baseId)..", LVL "..tostring(lvl), true)
		clanBaseTakeMoney(baseId, price)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Началось строительство нового склада базы. Все вещи, хранящиеся на старом складе, будут перенесены в новый.")
	end
end

function clanBaseGetLevel(baseId)
	local buildingMdl = getElementModel(clanBases[baseId][21])
	
	for i,baseSizeInfo in ipairs(clanBaseSizes) do
		if(buildingMdl == baseSizeInfo[1]) then
			return i
		end
	end
	
	return false
end

function clanBaseSetLevel(baseId, lvl)
	if(lvl <= clanBases[baseId][5]) then
		local baseBuilding = clanBases[baseId][21]
		
		if(getElementAlpha(baseBuilding) ~= 128) then
			setElementModel(baseBuilding, clanBaseSizes[lvl][1])
			clanBaseConstructionStart(baseId)
			dbExec(db, "UPDATE clanBases SET lvl=? WHERE id=?", lvl, clanBases[baseId][1])
			return true
		end
		
	end
	
	return false
end

function clanBaseGateTrigger(baseId, plr)
	if(not plr) or (plr and clanBaseControlAvailableForPlayer(baseId, plr)) then
		local clan, owner, gateState
		
		if plr then
			clan = getPlayerClan(plr)
		end
		owner = clanBases[baseId][25]
		gateState = clanBases[baseId][29]
		
		if plr and(not(clan == owner)) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Эта база не принадлежит вашему клану.")
		
		elseif plr and(gateState == "moving") then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "В данный момент ворота включен.")
		
		elseif(clanBases[baseId][33] == "off") and(gateState == "opened") then
			if plr then
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Ворота обесточены. Запустите генератор, чтобы закрыть их.")
			end
		
		else
			local gate = clanBases[baseId][23]
			local gatex, gatey, gatez = clanBases[baseId][12], clanBases[baseId][13], clanBases[baseId][14]
			
			if(gateState == "opened") then
				moveObject(gate, 3000, gatex, gatey, gatez, 0, 0, 0, "OutBounce")
				clanBases[baseId][29] = "moving"
				setTimer(clanBaseGateClose, 3000, 1, baseId)
			
			elseif(gateState == "closed") then
				moveObject(gate, 3000, gatex, gatey, gatez-8.0, 0, 0, 0, "OutBounce")
				clanBases[baseId][29] = "moving"
				setTimer(clanBaseGateOpen, 3000, 1, baseId)
			end
		end
	end
end

function clanBaseGetCarFreeSlot(baseId)
	local carsArray = clanBases[baseId][27]
	
	for i,car in ipairs(carsArray) do
		if not isElement(car) then
			return i
		end
	end
	
	local carsNum = table.getn(carsArray)
	local carSpawnsNum = table.getn(clanBases[baseId][19])
	
	if(carsNum < carSpawnsNum) then
		return(carsNum+1)
	end
	
	return false
end

function clanBaseGetCarsCount(baseId)
	local counter = 0
	
	for _,car in ipairs(clanBases[baseId][27]) do
		if isElement(car) then
			counter = counter+1
		end
	end
	
	return counter
end

function clanBaseGetCarPrice(baseId)
	return getVehiclePrice(clanBases[baseId][30])*0.4
end

function clanBaseAddCar(baseId, plr)
	if(not plr) or (plr and clanBasePlayerInsideMarker(baseId, plr)) then
		local clan, price
		
		if plr then
			clan = getPlayerClan(plr)
			price = clanBaseGetCarPrice(baseId)
		end
		
		if plr and(not clan) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
		
		elseif plr and(not(clanIsLeader(plr, clan) or clanIsColeader(plr, clan))) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас нет прав на управление базой клана.")
		
		elseif plr and(price > clanBaseGetMoney(baseId)) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "На базе недостаточно денег. Внесите деньги на базу с помощью маркера перед её зданием.")
		
		elseif plr and clanBaseCaptures[baseId] then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Данное действие недоступно во время захвата базы.")
		
		else
			local newSpawnId = clanBaseGetCarFreeSlot(baseId)
			
			if newSpawnId then
				local newSpawn = clanBases[baseId][19][newSpawnId]
				local carMdl = clanBases[baseId][30]
				local car = createVehicle(carMdl, newSpawn[1], newSpawn[2], newSpawn[3], newSpawn[4], newSpawn[5], newSpawn[6])
				
				setElementData(car, "clan", clanBases[baseId][25], false)
				
				local teamCol = clanBases[baseId][25]
				
				if teamCol then
					local r, g, b = getTeamColor(teamCol)
					setVehicleColor(car, r, g, b, r, g, b, r, g, b, r, g, b)
				end
				
				addEventHandler("onVehicleExplode", car, clanBaseCarExploded)
				clanBases[baseId][27][newSpawnId] = car
				
				if plr then
					addNewEventToLog(getPlayerName(plr), "Клан - Новое авто на базе - ID "..tostring(baseId), true)
					clanBaseTakeMoney(baseId, price)
					dbExec(db, "UPDATE clanBases SET carnum=? WHERE id=?", clanBaseGetCarsCount(baseId), clanBases[baseId][1])
				end
			
			elseif plr then
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Превышен лимит автомобилей на территории базы.")
			end
		end
	end
end

function clanBaseGetUpgradeCarModel(baseId)
	local curMdl = clanBases[baseId][30]
	local curMdlFound = false
	
	for _,carMdl in ipairs(clanBaseCars) do
		if curMdlFound then
			return carMdl
		end
		
		curMdlFound = (carMdl == curMdl)
	end
	return false
end

function clanBaseGetUpgradeCarsPrice(baseId)
	local upgradeMdl = clanBaseGetUpgradeCarModel(baseId)
	
	if upgradeMdl then
		return((getVehiclePrice(upgradeMdl)*0.4-clanBaseGetCarPrice(baseId))*clanBaseGetCarsCount(baseId))
	end
	
	return false
end

function clanBaseGetMaxMoneyAmount(baseId)
	return clanBaseGetLevel(baseId)*250000
end

function clanBaseGiveMoney(baseId, amount, setmax)
	local newAmount = clanBaseGetMoney(baseId)+amount
	local maxAmount = clanBaseGetMaxMoneyAmount(baseId)
	
	if(newAmount <= maxAmount) then
		clanBases[baseId][26] = newAmount
		dbExec(db, "UPDATE clanBases SET money=? WHERE id=?", newAmount, clanBases[baseId][1])
		return true
	
	elseif setmax then
		clanBases[baseId][26] = maxAmount
		dbExec(db, "UPDATE clanBases SET money=? WHERE id=?", newAmount, clanBases[baseId][1])
		return true
	
	end
	
	return false
end

function clanBaseTakeMoney(baseId, amount)
	if(clanBaseGetMoney(baseId) >= amount) then
		local newAmount = clanBases[baseId][26]-amount
		clanBases[baseId][26] = newAmount
		dbExec(db, "UPDATE clanBases SET money=? WHERE id=?", newAmount, clanBases[baseId][1])
		return true
	end
	return false
end

function clanBaseGetMoney(baseId)
	return clanBases[baseId][26]
end

function clanBaseUpgradeCars(baseId, plr)
	if clanBasePlayerInsideMarker(baseId, plr) then
		local clan = getPlayerClan(plr)
		local price = clanBaseGetUpgradeCarsPrice(baseId)
		
		if not clan then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
		
		elseif not (clanIsLeader(plr, clan) or clanIsColeader(plr, clan)) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас нет прав на управление базой клана.")
		
		elseif(price > clanBaseGetMoney(baseId)) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "На базе недостаточно денег. Внесите деньги на базу с помощью маркера перед её зданием.")
		
		elseif clanBaseCaptures[baseId] then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Данное действие недоступно во время захвата базы.")
		
		else
			local upgradeMdl = clanBaseGetUpgradeCarModel(baseId)
			
			if upgradeMdl then
				addNewEventToLog(getPlayerName(plr), "Клан - Улучшение авто на базе - ID "..tostring(baseId)..", ID транспорта "..tostring(upgradeMdl), true)
				
				for _,car in ipairs(clanBases[baseId][27]) do
					if isElement(car) then
						setElementModel(car, upgradeMdl)
					end
				end
				
				clanBases[baseId][30] = upgradeMdl
				clanBaseTakeMoney(baseId, price)
				dbExec(db, "UPDATE clanBases SET carmdl=? WHERE id=?", upgradeMdl, clanBases[baseId][1])
			
			else
				triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете улучшить текущий транспорт базы вашего клана. Вы уже имеете самый лучший транспорт.")
			end
		end
	end
end

function clanBaseCarExploded()
	for baseId,base in ipairs(clanBases) do
		for i,car in ipairs(base[27]) do
			if(car == source) then
				clanBases[baseId][27][i] = false
				dbExec(db, "UPDATE clanBases SET carnum=? WHERE id=?", clanBaseGetCarsCount(baseId), clanBases[baseId][1])
				setTimer(destroyElement, 2000, 1, source)
				break
			end
		end
	end
end

function clanBasePlayerInsideMarker(baseId, plr)
	local baseMarker = clanBases[baseId][22]
	return(isElementWithinMarker(plr, baseMarker) and isElementVisibleTo(baseMarker, root))
end

function clanBaseControlAvailableForPlayer(baseId, plr)
	local px, py, pz = getElementPosition(plr)
	
	for _,cinfo in ipairs(clanBases[baseId][18]) do
		if(getDistanceBetweenPoints3D(px,py,pz,cinfo[1],cinfo[2],cinfo[3]) <= 1.5) then
			return true
		end
	end
	
	return false
end

function clanBaseGateOpen(baseId)
	local gate = clanBases[baseId][23]
	local gatex, gatey, gatez = clanBases[baseId][12], clanBases[baseId][13], clanBases[baseId][14]
	setElementPosition(gate, gatex, gatey, gatez-8.0)
	clanBases[baseId][29] = "opened"
end

function clanBaseGateClose(baseId)
	local gate = clanBases[baseId][23]
	local gatex, gatey, gatez = clanBases[baseId][12], clanBases[baseId][13], clanBases[baseId][14]
	setElementPosition(gate, gatex, gatey, gatez)
	clanBases[baseId][29] = "closed"
end

function clanBaseGetWeapons(baseId)
	return clanBases[baseId][28]
end

function clanBaseGetWeaponAmmo(baseId, wid)
	local weapons = clanBaseGetWeapons(baseId)
	
	for _,weap in ipairs(weapons) do
		if(weap[1] == wid) then
			return weap[2]
		end
	end
	
	return 0
end

function clanBaseTakeWeapon(baseId, plr, weapId, ammo)
	local clan = getPlayerClan(plr)
	local weapAmmo = clanBaseGetWeaponAmmo(baseId, weapId)
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= clanBases[baseId][25]) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана, которому принадлежит данная база.")
	
	elseif(weapAmmo < ammo) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На складе базы нет столько боезапаса для данного оружия.")
	
	else
		for i,weap in ipairs(clanBases[baseId][28]) do
			if(weap[1] == weapId) then
				local newAmmo = weap[2]-ammo
				
				if(newAmmo > 0) then
					clanBases[baseId][28][i][2] = weap[2]-ammo
					dbExec(db, "UPDATE clanBaseWeapons SET ammo=? WHERE base=? AND weapon=?", newAmmo, clanBases[baseId][1], weapId)
				else
					table.remove(clanBases[baseId][28], i)
					dbExec(db, "DELETE FROM clanBaseWeapons WHERE base=? AND weapon=?", clanBases[baseId][1], weapId)
				end
				
				if giveWeapon(plr, weapId, ammo, true) then
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы взяли со склада базы "..tostring(ammo).." единиц боезапаса "..getWeaponNameFromID(weapId)..".")
				else
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете взять с собой это оружие, так как достигнуто ограничение по боезапасу.")
				end
				
				break
			end
		end
	end
end

function clanBaseGetWeaponFreeSpace(baseId)
	local weapons = clanBaseGetWeapons(baseId)
	local ammo = 0
	
	for _,weap in ipairs(weapons) do
		ammo = ammo + weap[2]
	end
	
	return(clanBaseGetLevel(baseId)*500-ammo)
end

function clanBaseGiveCurrentWeapon(baseId, plr, ammo)
	local clan = getPlayerClan(plr)
	local weapAmmo = getPedTotalAmmo(plr)
	local weapSlot = getPedWeaponSlot(plr)
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= clanBases[baseId][25]) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана, которому принадлежит данная база.")
	
	elseif(weapSlot < 2) or (weapSlot > 8) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас нет оружия в руках или вы не можете положить данное оружие на склад.")
	
	elseif(weapAmmo < ammo) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "У вас нет столько боезапаса для данного оружия.")
	
	elseif(clanBaseGetWeaponFreeSpace(baseId) <= 0) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На складе нет свободного места для оружия. Попробуйте расширить склад.")
	
	else
		local weapId = getPedWeapon(plr)
		takeWeapon(plr, weapId, ammo)
		syncClientWeaponData(plr, "clanBaseGiveCurrentWeaponFinish", baseId, plr, ammo, weapId)
	end
	
end

function clanBaseGiveCurrentWeaponFinish(baseId, plr, ammo, weapId)
	local weapFound = false
	
	for i,weap in ipairs(clanBases[baseId][28]) do
		if(weap[1] == weapId) then
			weapFound = true
			local newAmmo = weap[2]+ammo
			clanBases[baseId][28][i][2] = newAmmo
			dbExec(db, "UPDATE clanBaseWeapons SET ammo=? WHERE base=? AND weapon=?", newAmmo, clanBases[baseId][1], weapId)
			break
		end
	end
	
	
	if not weapFound then
		table.insert(clanBases[baseId][28], { weapId, ammo })
		dbExec(db, "INSERT INTO clanBaseWeapons(base,weapon,ammo) VALUES(?,?,?)", clanBases[baseId][1], weapId, ammo)
	end
	
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы положили на склад базы "..tostring(ammo).." единиц боезапаса "..getWeaponNameFromID(weapId)..".")
end

function clanBaseGetInventoryItem(baseId, invItem)
	for i,item in ipairs(clanBases[baseId][31]) do
		if(item[1] == invItem) then
			return i
		end
	end
	return false
end

function clanBaseGetInventoryFreeSpace(baseId)
	local itemsCount = 0
	
	for _,item in ipairs(clanBases[baseId][31]) do
		itemsCount = itemsCount + item[2]
	end
	
	return math.max(50*clanBaseGetLevel(baseId)-itemsCount, 0)
end

function clanBaseTakeInventoryItem(baseId, plr, invItem)
	local clan = getPlayerClan(plr)
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= clanBases[baseId][25]) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана, которому принадлежит данная база.")
	
	else
		local idx = clanBaseGetInventoryItem(baseId, invItem)
		
		if idx then
			local slotId = inventoryCheckForSlot(plr, invItem)
			
			if slotId then
				if inventoryNewItem(plr, invItem, slotId) then
					local newAmount = clanBases[baseId][31][idx][2]-1
					
					if(newAmount > 0) then
						clanBases[baseId][31][idx][2] = newAmount
						dbExec(db, "UPDATE clanBaseInventory SET count=? WHERE base=? AND item=?", newAmount, clanBases[baseId][1], invItem)
					
					else
						table.remove(clanBases[baseId][31], idx)
						dbExec(db, "DELETE FROM clanBaseInventory WHERE base=? AND item=?", clanBases[baseId][1], invItem)
					end
					
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Со склада базы получен предмет '"..inventoryItemNames[invItem][1].."'.")
				
				else
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Ошибка инвентаря.")
				end
				
			else
				triggerClientEvent(plr, "onServerMsgAdd", plr, "В инвентаре нет доступных слотов.")
			end
			
		else
			triggerClientEvent(plr, "onServerMsgAdd", plr, "На складе нет данного предмета.")
		end
		
	end
end

function clanBaseGiveInventoryItem(baseId, plr, slotId)
	local clan = getPlayerClan(plr)
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= clanBases[baseId][25]) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана, которому принадлежит данная база.")
	
	elseif(clanBaseGetInventoryFreeSpace(baseId) <= 0) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На базе исчерпано свободное место под предметы инвентаря. Попробуйте расширить склад.")
	
	else
		local invItem = inventoryGetItemInSlot(plr, slotId)
		
		if invItem then
			local idx = clanBaseGetInventoryItem(baseId, invItem)
			
			if idx then
				local newAmount = clanBases[baseId][31][idx][2]+1
				clanBases[baseId][31][idx][2] = clanBases[baseId][31][idx][2]+1
				dbExec(db, "UPDATE clanBaseInventory SET count=? WHERE base=? AND item=?", newAmount, clanBases[baseId][1], invItem)
			else
				table.insert(clanBases[baseId][31], { invItem, 1 })
				dbExec(db, "INSERT INTO clanBaseInventory(base,item,count) VALUES(?,?,1)", clanBases[baseId][1], invItem)
			end
			
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы положили предмет '"..inventoryItemNames[invItem][1].."' на склад базы.")
			
			return true
		end
	end
	
	return false
end

function clanBaseGeneratorProcess()
	local fuelLevel
	
	for baseId,base in ipairs(clanBases) do
		if(base[33] == "on") then
			fuelLevel = math.max(0.0, getElementData(base[32], "fuelLevel")-0.0001157)
			setElementData(base[32], "fuelLevel", fuelLevel)
			dbExec(db, "UPDATE clanBases SET genfuel=? WHERE id=?", fuelLevel, base[1])
			
			if(fuelLevel <= 0.0) then
				clanBaseGeneratorTurnOff(baseId)
			end
			
		elseif(base[29] == "closed") then
			clanBaseGateTrigger(baseId)
		end
	end
end

function clanBaseGeneratorTurnOn(baseId)
	if(clanBases[baseId][33] == "off") then
		clanBases[baseId][33] = "on"
		clanBaseGeneratorUpdateForClient(baseId)
	end
end

function clanBaseGeneratorTurnOff(baseId)
	if(clanBases[baseId][33] == "on") then
		clanBases[baseId][33] = "off"
		
		if(clanBases[baseId][29] == "closed") then
			clanBaseGateTrigger(baseId)
		end
		
		clanBaseAlarmTurnOff(baseId)
		clanBaseGeneratorUpdateForClient(baseId)
	end
end

function clanBaseGeneratorOnDestroy()
	local baseId = nil
	
	for i,base in ipairs(clanBases) do
		if(source == base[32]) then
			baseId = i
			break
		end
	end
	
	if baseId then
		clanBaseGeneratorTurnOff(baseId)
		setElementData(source, "fuelLevel", 0.0)
		dbExec(db, "UPDATE clanBases SET genfuel=0 WHERE id=?", clanBases[baseId][1])
	end
end

function clanBaseGeneratorGetRepairPrice(baseId)
	local generator = clanBases[baseId][32]
	local fullPrice = 500
	
	if isVehicleBlown(generator) then
		return fullPrice
	else
		local hp = getElementHealth(generator)
		
		if(hp < 990) then
			return((1000.0-hp)/1000.0*fullPrice)
		else
			return 0
		end		
	end
end

function clanBaseGeneratorRepair(baseId, plr)
	local clan = getPlayerClan(plr)
	local owner = clanBases[baseId][25]
	local money = clanBaseGetMoney(baseId)
	local price = clanBaseGeneratorGetRepairPrice(baseId)
	
	if not clan then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не находитесь в составе клана.")
	
	elseif(clan ~= owner) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Эта база не принадлежит вашему клану.")
	
	elseif(money < price) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На базе недостаточно денег. Внесите на базу деньги для ремонта генератора.")
	
	elseif clanBaseCaptures[baseId] then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете починить генератор во время захвата базы.")
	
	else
		local generator = clanBases[baseId][32]
		local fuelLevel = getElementData(generator, "fuelLevel")
		local gx, gy, gz = getElementPosition(generator)
		local grx, gry, grz = getElementRotation(generator)
		setVehicleRespawnPosition(generator, gx, gy, gz, grx, gry, grz)
		respawnVehicle(generator)
		setElementFrozen(generator, true)
		setElementData(generator, "fuelLevel", fuelLevel)
		clanBaseTakeMoney(baseId, price)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Генератор был восстановлен.")
	end
end

function clanBaseGeneratorUpdateForClient(baseId, plr)
	local sendInfo
	
	if baseId then
		sendInfo = clanBases[baseId][33]
	else
		sendInfo = {}
		
		for _,base in ipairs(clanBases) do
			table.insert(sendInfo, { base[32], base[33], nil })
		end
		
	end
	
	if plr then
		triggerClientEvent(plr, "onClanBaseGeneratorUpdate", resourceRoot, baseId, sendInfo)
	
	else
		triggerClientEvent(getElementsByType("player"), "onClanBaseGeneratorUpdate", resourceRoot, baseId, sendInfo)
	end
end

function clanBaseAlarmTurnedOn(baseId)
	return clanBases[baseId][34]
end

function clanBaseAlarmTurnOn(baseId)
	if not clanBaseAlarmTurnedOn(baseId) then
		clanBases[baseId][34] = true
		setRadarAreaFlashing(clanBases[baseId][35], true)
		triggerClientEvent(getPlayersInTeam(clanBases[baseId][25]), "onServerMsgAdd", resourceRoot, "На одной из ваших баз только что сработала тревога. Зона этой базы мигает на карте. Доберитесь до этой базы и проверьте её.")
		clanBaseAlarmUpdateForClient(baseId)
	end
end

function clanBaseAlarmTurnOff(baseId)
	if clanBaseAlarmTurnedOn(baseId) then
		clanBases[baseId][34] = false
		setRadarAreaFlashing(clanBases[baseId][35], false)
		clanBaseAlarmUpdateForClient(baseId)
	end
end

function clanBaseAlarmUpdateForClient(baseId, plr)
	local sendInfo
	
	if baseId then
		sendInfo = clanBases[baseId][34]
	else
		sendInfo = {}
		
		for _,base in ipairs(clanBases) do
			table.insert(sendInfo, { base[21], base[34], nil })
		end
		
	end
	
	if plr then
		triggerClientEvent(plr, "onClanBaseAlarmUpdate", resourceRoot, baseId, sendInfo)
	else
		triggerClientEvent(getElementsByType("player"), "onClanBaseAlarmUpdate", resourceRoot, baseId, sendInfo)
	end
end

function clanBaseConstructionStart(baseId)
	local baseMarker = clanBases[baseId][22]
	setElementVisibleTo(baseMarker, root, false)
	local baseLevelInfo = clanBaseSizes[clanBaseGetLevel(baseId)]
	local baseBuilding = clanBases[baseId][21]
	local objx = clanBases[baseId][6]
	local objy = clanBases[baseId][7]
	local objz = clanBases[baseId][8]+baseLevelInfo[3]
	local rotx, roty, rotz = clanBases[baseId][9], clanBases[baseId][10], clanBases[baseId][11]
	setElementPosition(baseBuilding, objx, objy, objz)
	setElementCollisionsEnabled(baseBuilding, false)
	setElementAlpha(baseBuilding, 141)
	setObjectScale(baseBuilding, 0.85, 0.85, 1.0)
	local markpos = getOffsetFromElement(baseBuilding, baseLevelInfo[4], baseLevelInfo[5], baseLevelInfo[6])
	setElementPosition(clanBases[baseId][22], markpos[1], markpos[2], markpos[3])
	triggerClientEvent(getElementsByType("player"), "onClanBaseConstructionStart", resourceRoot, baseId, getElementModel(baseBuilding), objx, objy, objz, rotx, roty, rotz, clanBaseConstructionTime)
	setTimer(clanBaseConstructionFinish, clanBaseConstructionTime, 1, baseId)
end

function clanBaseConstructionFinish(baseId)
	setElementVisibleTo(clanBases[baseId][22], root, true)
	local baseBuilding = clanBases[baseId][21]
	setObjectScale(baseBuilding, 1.0, 1.0, 1.0)
	setElementCollisionsEnabled(baseBuilding, true)
	setElementAlpha(baseBuilding, 255)
	triggerClientEvent(getElementsByType("player"), "onClanBaseConstructionStop", resourceRoot, baseId)
end

function clanBaseCaptureProcess(baseId)
	local capture = clanBaseCaptures[baseId]
	local area = clanBases[baseId][35]
	local owner = clanBases[baseId][25]
	local posz = clanBases[baseId][8]
	local clan = capture[1]
	local clanPlayers = getPlayersInTeam(clan)
	local ownerPlayers = getPlayersInTeam(owner)
	local areaPlayers = {}
	local px, py, pz, veh
	
	for _,plr in ipairs(capture[6]) do
		if isElement(plr) then
			px, py, pz = getElementPosition(plr)
			if not (isInsideRadarArea(area, px, py) and(math.abs(pz-posz) < 30.0) and(not isPedDead(plr)) and((getPlayerTeam(plr) == clan) or (getPlayerTeam(plr) == owner))) then
				triggerClientEvent(plr, "onClanBaseCaptureUpdate", resourceRoot, nil)
			end
		end
	end
	
	for _,plr in ipairs(clanPlayers) do
		px, py, pz = getElementPosition(plr)
		if isInsideRadarArea(area, px, py) and(math.abs(pz-posz) < 30.0) and(not isPedDead(plr)) then
			table.insert(areaPlayers, plr)
		end
	end
	
	local capturePlayersCount = table.getn(areaPlayers)
	
	if(capturePlayersCount < clanBaseCaptureMinPlr) then
		if capture[2] then
			clanBaseCaptures[baseId][2] = false
			
			if isTimer(capture[5]) then
				killTimer(capture[5])
			end
			
			clanBaseCaptures[baseId][5] = setTimer(clanBaseCaptureFinish, 60000, 1, baseId, false)
			triggerClientEvent(areaPlayers, "onServerMsgAdd", resourceRoot, "Захват базы остановлен из-за недостатка игроков на её территории. Необходимо минимум "..tostring(clanBaseCaptureMinPlr).." игроков. Иначе захват базы будет прекращён через 60 секунд.")
		end
	
	else
		if not capture[2] then
			clanBaseCaptures[baseId][2] = true
			if isTimer(capture[5]) then
				killTimer(capture[5])
			end
			clanBaseCaptures[baseId][5] = nil
		end
		clanBaseCaptures[baseId][3] = capture[3]-1
	end
	
	for _,plr in ipairs(ownerPlayers) do
		px, py = getElementPosition(plr)
		
		if isInsideRadarArea(area, px, py) and(math.abs(pz-posz) < 30.0) and(not isPedDead(plr)) then
			table.insert(areaPlayers, plr)
		end
		
	end
	clanBaseCaptures[baseId][6] = areaPlayers
	
	for _,plr in ipairs(areaPlayers) do
		veh = getPedOccupiedVehicle(plr)
		
		if veh and(getPedOccupiedVehicleSeat(plr) == 0) and(getVehicleType(veh) == "Helicopter") then
			blowVehicle(veh)
		end
		
	end
	
	if(clanBaseCaptures[baseId][3] > 0) then
		triggerClientEvent(areaPlayers, "onClanBaseCaptureUpdate", resourceRoot, { owner, clan, clanBaseCaptures[baseId][3]*1000, clanBaseCaptures[baseId][2], capturePlayersCount, clanBaseCaptureMinPlr })
	else
		clanBaseCaptureFinish(baseId, true)
	end
end

function clanBaseCaptureStart(baseId, initiator)
	local clan = getPlayerClan(initiator)
	
	repeat
		local dbq = dbQuery(db, "SELECT lastCapture FROM clanBases WHERE id=?", clanBases[baseId][1])
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	local curTime = getRealTime()
	local lastCapture = dbqueryresult[1]["lastCapture"]
	local timeLeft = lastCapture+64800-curTime.timestamp
	
	if clan and(not clanBaseCaptures[baseId]) then
		local owner = clanBases[baseId][25]
		
		if(clan == owner) then
			triggerClientEvent(initiator, "onServerMsgAdd", initiator, "Эта база принадлежит вашему клану.")
		
		elseif not owner then
			triggerClientEvent(initiator, "onServerMsgAdd", initiator, "Эта база не принадлежит никому и не может быть захвачена.")
		
		elseif(timeLeft > 0) then -- Захват базы не меньше чем через 18 часов после другого захвата
			triggerClientEvent(initiator, "onServerMsgAdd", initiator, "Эту базу можно будет захватить только через "..getTimeString(timeLeft*1000, "v")..".")
		
		else
			local clanPlayers = getPlayersInTeam(clan)
			local ownerPlayers = getPlayersInTeam(owner)
			local pcount = 0
			local px, py
			
			for _,plr in ipairs(clanPlayers) do
				px, py = getElementPosition(plr)
				if isInsideRadarArea(clanBases[baseId][35], px, py) and(not isPedDead(plr)) then
					pcount = pcount + 1
				end
			end
			
			if(pcount < clanBaseCaptureMinPlr) then
				triggerClientEvent(initiator, "onServerMsgAdd", initiator, "На территории базы находится недостаточное количество игроков(необходимо "..tostring(clanBaseCaptureMinPlr)..").")
			
			else
				clanBaseCaptures[baseId] = { clan, true, clanBaseCaptureTimeSec, setTimer(clanBaseCaptureProcess, 1000, 0, baseId), nil, {} }
				triggerClientEvent(clanPlayers, "onServerMsgAdd", initiator, "Ваш клан начал захват базы клана '"..getTeamName(owner).."' по инициативе игрока "..getPlayerName(initiator)..".")
				triggerClientEvent(ownerPlayers, "onServerMsgAdd", initiator, "Одна из ваших баз подверглась нападению клана '"..getTeamName(clan).."'.")
				if clanBases[baseId][33] ~= "off" then
					clanBaseAlarmTurnOn(baseId)
				end
			end
			
		end
	
	else
		triggerClientEvent(initiator, "onServerMsgAdd", initiator, "Эта база уже захватывается на данный момент.")
	end
end

function clanBaseCaptureFinish(baseId, success)
	local capture = clanBaseCaptures[baseId]
	
	if capture then
		local owner = clanBases[baseId][25]
		local clan = capture[1]
		local clanPlayers = getPlayersInTeam(clan)
		local ownerPlayers = getPlayersInTeam(owner)
		local area = clanBases[baseId][35]
		local areaPlayers = {}
		local evtStr = "Клан - Захват базы - ID "..tostring(baseId)
		
		for _,plr in ipairs(clanPlayers) do
			addNewEventToLog(getPlayerName(plr), evtStr, success)
		end
		
		if success then
			local px, py
			
			for _,plr in ipairs(clanPlayers) do
				px, py = getElementPosition(plr)
				if isInsideRadarArea(area, px, py) then
					table.insert(areaPlayers, plr)
				end
			end
			
			clanBaseChangeOwner(baseId, clan)
			triggerClientEvent(ownerPlayers, "onServerMsgAdd", resourceRoot, "Клан '"..getTeamName(clan).."' захватил одну из ваших баз.")
			triggerClientEvent(clanPlayers, "onServerMsgAdd", resourceRoot, "Поздравляем! Ваш клан захватил базу клана '"..getTeamName(owner).."'.")
			triggerClientEvent(areaPlayers, "onSuccessMusicPlay", resourceRoot)
		
		else
			local px, py
			
			for _,plr in ipairs(ownerPlayers) do
				px, py = getElementPosition(plr)
				if isInsideRadarArea(area, px, py) then
					table.insert(areaPlayers, plr)
				end
			end
			
			triggerClientEvent(ownerPlayers, "onServerMsgAdd", resourceRoot, "Поздравляем! Ваш клан отбил захват базы кланом '"..getTeamName(clan).."'.")
			triggerClientEvent(clanPlayers, "onServerMsgAdd", resourceRoot, "Захват базы клана '"..getTeamName(owner).."' был прекращён.")
			triggerClientEvent(areaPlayers, "onSuccessMusicPlay", resourceRoot)
		end
		
		if isTimer(capture[4]) then
			killTimer(capture[4])
		end
		
		if isTimer(capture[5]) then
			killTimer(capture[5])
		end
		
		clanBaseAlarmTurnOff(baseId)
		triggerClientEvent(capture[6], "onClanBaseCaptureUpdate", resourceRoot, nil)
		local curTime = getRealTime()
		dbExec(db, "UPDATE clanBases SET lastCapture=? WHERE id=?", curTime.timestamp, clanBases[baseId][1])
		clanBaseCaptures[baseId] = nil
	end
end

function queryAnswer(plr, qid, aid)
	if(source == resourceRoot) and(client == plr) and dbExec(db, "INSERT INTO queries(player,question,answer) VALUES(?,?,?)", getHash(getPlayerName(client)), qid, aid) then
		addNewEventToLog(getPlayerName(client), "Опрос - Ответ - Вопрос "..tostring(qid)..", Ответ "..tostring(aid), true)
		giveMoney(client, queryMoneyForAnswer)
		triggerClientEvent(client, "onServerMsgAdd", resourceRoot, "Спасибо за ответ. Держите свои $"..tostring(queryMoneyForAnswer)..".")
	end
end

function dropWeapon(plr, weap, ammo, savePlrWeap, checkPolice)
    local plsGrp = getElementData(plr, "usergroup")
	if checkPolice and isPlayerFromPolice(plr) then
		triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Охранникам правопорядка запрещено разбрасываться оружием.")
		return
	end
	
	if plsGrp and (plsGrp == 18) then
	    triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Вам запрещено выбрасывать снаряжение.")
		return
	end	
	
	
	
	if isPedOnGround(plr) and(ammo > 0) then
		local weapSlot = getSlotFromWeapon(weap)
		
		if not savePlrWeap then
			if(weapSlot > 1) and(weapSlot < 10) then
				takeWeapon(plr, weap, ammo)
			else
				takeWeapon(plr, weap)
			end
			
			syncClientWeaponData(plr, "dropWeaponFinish", plr, weap, ammo)
		else
			dropWeaponFinish(plr, weap, ammo)
		end
	end
end

function dropWeaponFinish(plr, weap, ammo)
	local wx, wy, wz = getElementPosition(plr)
	local wint = getElementInterior(plr)
	local wdim = getElementDimension(plr)
	local pup = createPickup(wx, wy, wz, 2, weap, 0, ammo)
	attachActionToElement(defaultActions[106], pup)
	setElementInterior(pup, wint)
	setElementDimension(pup, wdim)
	weaponsDropped[pup] = setTimer(destroyWeapon, 300000, 1, pup)
	addEventHandler("onPickupUse", pup, weaponPickupUse)
end

function pickupWeapon(plr, pup)
	if isElement(plr) and(not isPedDead(plr)) and isElement(pup) and weaponsDropped[pup] then
		local weap = getPickupWeapon(pup)
		local ammo = getPickupAmmo(pup)
		
		if giveWeapon(plr, weap, ammo, true) then
			destroyWeapon(pup)
			weaponsDropped[pup] = nil
		else
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете взять с собой это оружие, так как достигнуто ограничение по боезапасу.")
		end
		
	end
end

function destroyWeapon(pup)
	if isElement(pup) and weaponsDropped[pup] then
		if isTimer(weaponsDropped[pup]) then
			killTimer(weaponsDropped[pup])
		end
		weaponsDropped[pup] = nil
		removeEventHandler("onPickupUse", pup, weaponPickupUse)
		destroyElement(pup)
	end
end

function weaponPickupUse()
	cancelEvent()
end

function removeOldReport(repId)
	if reportsArray[repId] then
		reportsArray[repId] = nil
		local players = getElementsByType("player")
		local admins = {}
		
		for _,plr in ipairs(players) do
			if isAdmin(plr) or isModerator(plr) or isHelper(plr) then
				table.insert(admins, plr)
			end
		end
		
		if #admins > 0 then
			triggerClientEvent(admins, "onReportsUpdate", resourceRoot, reportsArray)
		end
	end
end

function questionTake(qnum, admin)
	if((source == resourceRoot) and(client == admin) and questionsArray[qnum] and(questionsArray[qnum][4] == nil)) then
		local plr = getPlayerFromName(questionsArray[qnum][1])
		
		if plr then
			if isTimer(questionsArray[qnum][3]) then
				killTimer(questionsArray[qnum][3])
			end
			questionsArray[qnum][3] = setTimer(questionRemove, 300000, 1, qnum, true)
			questionsArray[qnum][4] = client
			addNewEventToLog(getPlayerName(plr), "Аккаунты - Вопрос взят модератором - Админ "..getPlayerName(client), true)
			triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Модератор "..getPlayerName(admin).." взял вопрос #"..tostring(qnum)..".")
			triggerClientEvent(client, "onAnswerOpen", resourceRoot, qnum, questionsArray[qnum][1], questionsArray[qnum][2])
		else
			triggerClientEvent(client, "onServerMsgAdd", resourceRoot, "Игрок вышел с сервера.")
		end
		
	end
end

function questionAnswer(qnum, admin, answerText)
	if((source == resourceRoot) and(client == admin) and questionsArray[qnum]) then
		local plr = getPlayerFromName(questionsArray[qnum][1])
		
		if plr then
			addNewEventToLog(getPlayerName(plr), "Аккаунты - Ответ на вопрос - Админ "..getPlayerName(client)..", Ответ: "..answerText, true)
			local answerTextFull = generateTimeString().."ОТВЕТ: Ответ #"..tostring(qnum).." от "..getPlayerName(client)..": "..answerText
			local players = getElementsByType("player")
			local answerReceivers = { plr }
			
			for _,curPlayer in ipairs(players) do
				if(isAdmin(curPlayer) or isModerator(curPlayer) or isHelper(curPlayer)) and(plr ~= curPlayer) then
					table.insert(answerReceivers, curPlayer)
				end
			end
			
			triggerClientEvent(answerReceivers, "onReportShow", resourceRoot, answerTextFull)
			triggerClientEvent(client, "onServerMsgAdd", resourceRoot, "Ответ на вопрос #"..tostring(qnum).." отправлен.")
			
			if not ((plr == client) or isAdmin(plr) or isModerator(plr) or isHelper(plr)) then
				if isAdmin(client) or isModerator(client) then
					giveMoney(client, payoutAdminPerQuestion)
				else
					giveMoney(client, math.ceil(payoutAdminPerQuestion/2.0))
				end
			end
			
		else
			triggerClientEvent(client, "onServerMsgAdd", resourceRoot, "Игрок вышел с сервера.")
		
		end
		questionRemove(qnum, false)
	end
end

function questionDeny(qnum, admin)
	if((source == resourceRoot) and(client == admin) and questionsArray[qnum]) then
		questionDenyEx(qnum, admin)
	end
end

function questionDenyEx(qnum, admin)
	local plr = getPlayerFromName(questionsArray[qnum][1])
	
	if plr then
		addNewEventToLog(getPlayerName(plr), "Аккаунты - Вопрос без ответа - Админ "..getPlayerName(admin), true)
		local answerTextFull = generateTimeString().."ОТВЕТ: Модератор "..getPlayerName(admin).." оставил вопрос #"..tostring(qnum).." без ответа."
		local players = getElementsByType("player")
		local answerReceivers = { plr }
		
		for _,curPlayer in ipairs(players) do
			if(isAdmin(curPlayer) or isModerator(curPlayer) or isHelper(curPlayer)) and(plr ~= curPlayer) then
				table.insert(answerReceivers, curPlayer)
			end
		end
		
		triggerClientEvent(answerReceivers, "onReportShow", resourceRoot, answerTextFull)
		triggerClientEvent(admin, "onServerMsgAdd", resourceRoot, "Вы оставили вопрос #"..tostring(qnum).." без ответа.")
	else
		triggerClientEvent(admin, "onServerMsgAdd", resourceRoot, "Игрок вышел с сервера.")
	end
	
	questionRemove(qnum, false)
end

function questionRemove(qnum, isOld)
	if questionsArray[qnum] then
		if isOld then
			local plr = getPlayerFromName(questionsArray[qnum][1])
			
			if plr then
				addNewEventToLog(getPlayerName(plr), "Аккаунты - Превышение ожидания вопроса - nil", true)
				triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Ваш вопрос #"..tostring(qnum).." превысил время ожидания ответа и был удален.")
			end
			
			if isElement(questionsArray[qnum][4]) then
				triggerClientEvent(questionsArray[qnum][4], "onServerMsgAdd", resourceRoot, "Вопрос #"..tostring(qnum).." превысил время ожидания ответа и был удален.")
				triggerClientEvent(questionsArray[qnum][4], "onAnswerClose", resourceRoot)
			end
			
		end
		questionsArray[qnum] = nil
		questionUpdate()
	end
end

function questionUpdate()
	local qArrayClient = {}
	
	for qnum,question in pairs(questionsArray) do
		if(question[4] == nil) then
			qArrayClient[qnum] = { question[1], question[2] }
		end
	end
	
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		if isAdmin(plr) or isModerator(plr) or isHelper(plr) then
			triggerClientEvent(plr, "onQuestionUpdate", resourceRoot, qArrayClient)
		end
	end
end

function findPlayerByNamePattern(pName)
	local foundPlr = nil
	
	if pName and(string.len(pName) > 0) then
		foundPlr = getPlayerFromName(pName)
		local pFound = false
		local players = getElementsByType("player")
		
		if not isElement(foundPlr) then
			for i=1,table.getn(players) do
				if(string.match(string.lower(getPlayerName(players[i])), string.lower(pName))) then
					if pFound then
						return "Вашему запросу соответствует несколько игроков. Попробуйте уточнить никнейм."
					else
						pFound = true
						foundPlr = players[i]
					end
				end
			end
		end
		
	end
	
	if foundPlr then
		return foundPlr
	
	else
		return "Игрок с таким никнеймом отсутствует на сервере."
	end
end

function vehicleDamage(loss)
	local hp = getElementHealth(source)
	local engineType = getElementData(source, "engineType")
	
	if not engineType then
		vhandling = getVehicleHandling(source)
		setElementData(source, "engineType", vhandling["engineType"], false)
		engineType = vhandling["engineType"]
	end
	
	local vtype = getVehicleType(source)
	local fuelExists = (((vtype == "Automobile") or (vtype == "Bike") or (vtype == "Monster Truck") or (vtype == "Quad") or (vtype == "Plane"))) or (getElementModel(source) == 611)
	
	if fuelExists and(hp < 500.0) and(not isVehicleBlown(source)) and(not getElementData(source, "explodable")) then
		setElementHealth(source, 499.0)
		setVehicleEngineState(source, false)
		setVehicleOverrideLights(source, 1)
	end
	
end

function groupGateTrigger(controlObj, plr)
	local gateCntl = groupGateControls[controlObj]
	local gateCntlAvailable = false
	
	if gateCntl then
		gateCntlAvailable = true
		
		if isElement(plr) then
			if(gateCntl[1] == 2) or (gateCntl[1] == 5) or (gateCntl[1] == 14) or (gateCntl[1] == 15) then
				gateCntlAvailable = isPlayerFromPolice(plr)
			else
				local grpid = getElementData(plr, "usergroup")
				gateCntlAvailable = (grpid == gateCntl[1])
			end
			
			if not gateCntlAvailable then
				triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Тригер доступен только игрокам со статусом '"..playerGroups[gateCntl[1]][1].."'")
			end
		end
		
	end
	
	if gateCntlAvailable then
		local gateState = groupGateGetState(controlObj)
		
		if gateState then
			if(gateState == "opened") then
				for _,objId in ipairs(gateCntl[3]) do
					groupGateMove(objId, gateCntl[2], "close")
				end
			
			elseif(gateState == "closed") then
				for _,objId in ipairs(gateCntl[3]) do
					groupGateMove(objId, gateCntl[2], "open")
				end
			
			elseif isElement(plr) then
				triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Тригер уже включен в данный момент")
			end
		end
	end
	return gateCntlAvailable
end

function groupGateMove(objId, mvTime, targetState)
	local objInfo = groupGateObjs[objId]
	
	if(targetState == "open") then
		moveObject(objInfo[1], mvTime, objInfo[2], objInfo[3], objInfo[4], 0, 0, 0, "InOutQuad")
		setTimer(groupGateOpen, mvTime, 1, objId)
		groupGateObjs[objId][8] = "moving"
	
	elseif(targetState == "close") then
		moveObject(objInfo[1], mvTime, objInfo[5], objInfo[6], objInfo[7], 0, 0, 0, "InOutQuad")
		setTimer(groupGateClose, mvTime, 1, objId)
		groupGateObjs[objId][8] = "moving"
	end
end

function groupGateOpen(objId)
	local objInfo = groupGateObjs[objId]
	setElementPosition(objInfo[1], objInfo[2], objInfo[3], objInfo[4])
	groupGateObjs[objId][8] = "opened"
end

function groupGateClose(objId)
	local objInfo = groupGateObjs[objId]
	setElementPosition(objInfo[1], objInfo[5], objInfo[6], objInfo[7])
	groupGateObjs[objId][8] = "closed"
end

function groupGateGetState(controlObj)
	local gateCntl = groupGateControls[controlObj]
	
	if gateCntl then
		return groupGateObjs[groupGateControls[controlObj][3][1]][8]
	end
	
	return nil
end

function jobCollectItem(jobId, worker, itemId)
	if not jobCollectedItems[jobId] then
		jobCollectedItems[jobId] = {}
	end
	
	if not jobCollectedItems[jobId][worker] then
		jobCollectedItems[jobId][worker] = {}
	end
	jobCollectedItems[jobId][worker][itemId] = true
end

function jobWasItemCollected(jobId, worker, itemId)
	if jobCollectedItems[jobId] and jobCollectedItems[jobId][worker] and jobCollectedItems[jobId][worker][itemId] then
		return true
	end
	
	return false
end

function fineAccept(policePlr)
	if isElement(policePlr) and isElement(source) and isPlayerFromPolice(policePlr) then
		local fine = getPlayerWantedLevel(source)*buyoutPrice
		
		if(fine > 0) then
			local respect = getElementData(source, "respect")
			local pName = getPlayerName(policePlr)
			local sName = getPlayerName(source)
			--[[if(respect < 0.0) then
				triggerClientEvent(source, "onServerMsgAdd", resourceRoot, "Вы не можете оплатить штраф, так как обладаете отрицательной репутацией.")
				triggerClientEvent(policePlr, "onServerMsgAdd", resourceRoot, "Игрок "..sName.." не может оплатить штраф, так как обладает отрицательной репутацией.")]]
			
			if(getMoney(source) < fine) then
				triggerClientEvent(source, "onServerMsgAdd", resourceRoot, "У вас недостаточно денег для оплаты штрафа.")
				triggerClientEvent(policePlr, "onServerMsgAdd", resourceRoot, "У игрока "..sName.." недостаточно денег для оплаты штрафа.")
			
			else
				addNewEventToLog(sName, "Штраф - Оплата - "..pName)
				addNewEventToLog(pName, "Штраф - Получение - "..sName)
				takeMoney(source, fine)
				giveMoney(policePlr, fine)
				wantedLevelClear(source)
				triggerClientEvent(source, "onServerMsgAdd", resourceRoot, "Вы оплатили штраф $"..tostring(fine).." игроку "..pName..".")
				triggerClientEvent(policePlr, "onServerMsgAdd", resourceRoot, "Игрок "..sName.." заплатил вам штраф $"..tostring(fine)..".")
			end
		end
		
	end
end

function fineDecline(policePlr)
	if isElement(policePlr) and isElement(source) and isPlayerFromPolice(policePlr) then
		triggerClientEvent(policePlr, "onServerMsgAdd", resourceRoot, "Игрок "..getPlayerName(source).." отказался оплачивать вам штраф.")
	end
end

function getAdminsAndModeratorsOnline()
	local players = getElementsByType("player")
	local resultTable = {}
	
	for _,plr in ipairs(players) do
		if isAdmin(plr) then
			table.insert(resultTable, { getPlayerName(plr), "Администратор" })
		
		elseif isModerator(plr) then
			table.insert(resultTable, { getPlayerName(plr), "Модератор" })
		
		elseif isHelper(plr) then
			table.insert(resultTable, { getPlayerName(plr), "Хелпер" })
		end
	end
	
	return resultTable
end

function gangsterStealCreateCar(mdl, cx, cy, cz, crx, cry, crz)
	if not (mdl and cx and cy and cz and crx and cry and crz) then
		return false
	end
	
	if getVehicleType(mdl) ~= "Automobile" then
		return false
	end
	
	local veh = createVehicle(mdl, cx, cy, cz, crx, cry, crz, "CAR STLN")
	setElementFrozen(veh, true)
	setVehicleLocked(veh, true)
	setVehicleDamageProof(veh, true)
	toggleVehicleRespawn(veh, true)
	setVehicleIdleRespawnDelay(veh, 300000)
	setVehicleRespawnDelay(veh, 10000)
	gangsterStealCars[veh] = { false, nil, 0 }
	addEventHandler("onVehicleEnter", veh, gangsterStealEnterCar, false)
	addEventHandler("onTrailerAttach", veh, gangsterStealTowCar, false)
	addEventHandler("onVehicleRespawn", veh, gangsterStealRespawnCar, false)
end

function gangsterStealRespawnCar()
	gangsterStealStopCar(source, false)
	gangsterStealCars[source] = { false, nil, 0 }
	fixVehicle(source)
	setVehicleLocked(source, true)
	setVehicleDamageProof(source, true)
	setElementGhostMode(source, 3000)
	
	for i=0,5 do
		setVehicleDoorOpenRatio(source, i, 0)
		setVehicleDoorState(source, i, 0)
	end
	
	setTimer(gangsterStealRespawnCarFinish, 400, 1, source)
end

function gangsterStealRespawnCarFinish(source)
	setElementFrozen(source, true)
end

function gangsterStealEnterCar(plr, seat)
	if seat ~= 0 then
		return
	end
	triggerClientEvent(plr, "onServerMsgAdd", resourceRoot, "Эту машину можно продать в одном из пунктов сбыта краденных автомобилей, обозначенных на карте фиолетовым человечком.")
end

function gangsterStealTowCar(eVeh)
	local ePlr = getVehicleOccupant(eVeh, 0)
	
	if not ePlr then
		return
	end
	
	triggerClientEvent(ePlr, "onServerMsgAdd", resourceRoot, "Эту краденную машину можно сдать на штрафстоянку в одном из полицейских участков ЛС, СФ или ЛВ.")
end

function gangsterStealCreateMarkers()
	local marker, blip
	
	for mId,mInfo in ipairs(gangsterStealCarEvacMarkers) do
		marker = createMarker(mInfo[1], mInfo[2], mInfo[3], "cylinder", 5.0, 0, 225, 255, 64)
		setPickupText(marker, "Сдать краденный автомобиль", 0, 225, 255)
		addEventHandler("onMarkerHit", marker, gangsterStealEvacCar, false)
		gangsterStealCarEvacMarkers[mId][4] = nil
		gangsterStealCarEvacMarkers[mId][5] = marker
	end
	
	for mId,mInfo in ipairs(gangsterStealCarSellMarkers) do
		marker = createMarker(mInfo[1], mInfo[2], mInfo[3], "cylinder", 5.0, 0, 225, 255, 64)
		blip = createBlipAttachedTo(marker, 59, 1, 255, 255, 255, 255, 1, 300)
		setPickupText(marker, "Сбыт краденных автомобилей", 0, 225, 255)
		addEventHandler("onMarkerHit", marker, gangsterStealSellCar, false)
		gangsterStealCarSellMarkers[mId][4] = blip
		gangsterStealCarSellMarkers[mId][5] = marker
		gangsterStealCarSellMarkers[mId][6] = {}
	end
end

function gangsterStealProcMarkers()
	local newCarArray, carMdl
	local stealMdls = {}
	
	for veh in pairs(gangsterStealCars) do
		if isElement(veh) then
			carMdl = getElementModel(veh)
			if not stealMdls[carMdl] then
				stealMdls[carMdl] = true
			end
		end
	end
	
	for mId in ipairs(gangsterStealCarSellMarkers) do
		newCarArray = {}
		
		for _,carMdl in ipairs(gangsterStealCarSellMarkers[mId][6]) do
			if stealMdls[carMdl] then
				table.insert(newCarArray, carMdl)
			end
		end
		
		if(#gangsterStealCarSellMarkers[mId][6] ~= #newCarArray) then
			gangsterStealCarSellMarkers[mId][6] = newCarArray
		end
		
		if(#gangsterStealCarSellMarkers[mId][6] < 4) then
			newCarArray = gangsterStealTakeCarsFromPool(1)
			if newCarArray and(#newCarArray > 0) then
				table.insert(gangsterStealCarSellMarkers[mId][6], newCarArray[1])
				break
			end
		end
		
	end
end

function gangsterStealGenerateCarPool(maxCars)
	local carPrices = {}
	gangsterStealCarPool = {}
	local priceMin, priceMax, priceCur, priceDiff, carMdl, counter
	
	for _,mId in ipairs(carSellCarArrays["car"]) do
		priceCur = carSellPrices[mId]
		carPrices[mId] = priceCur
		
		if not priceMin then
			priceMin = priceCur
			priceMax = priceCur
		elseif(priceMin > carSellPrices[mId]) then
			priceMin = priceCur
		
		elseif(priceMax < carSellPrices[mId]) then
			priceMax = priceCur
		end
		
	end
	
	priceCur = priceMin
	for i=1,maxCars do
		priceDiff = nil
		
		for mId,mPrice in pairs(carPrices) do
			if(not priceDiff) or (priceDiff > math.abs(mPrice-priceCur)) then
				carMdl = mId
				priceDiff = math.abs(mPrice-priceCur)
			end
		end
		
		table.insert(gangsterStealCarPool, carMdl)
		priceCur = priceMin + (priceMax-priceMin)*getEasingValue(i*1.0/maxCars, "InQuad")
	end
	
	math.randomseed(getTickCount())
	counter = maxCars
	
	while counter > 1 do
		local i = math.random(counter)
		gangsterStealCarPool[i], gangsterStealCarPool[counter] = gangsterStealCarPool[counter], gangsterStealCarPool[i]
		counter = counter - 1
	end
end

function gangsterStealTakeCarsFromPool(carsNum)
	local carPool = {}
	
	if #gangsterStealCarPool <= carsNum then
		carPool = gangsterStealCarPool
		gangsterStealCarPool = {}
	else
		for i=1,carsNum do
			table.insert(carPool, gangsterStealCarPool[1])
			table.remove(gangsterStealCarPool, 1)
		end
	end
	
	return carPool
end

function gangsterStealGetWantedCars(marker)
	if not isElement(marker) then
		return
	end
	
	for mId,mInfo in ipairs(gangsterStealCarSellMarkers) do
		if(mInfo[5] == marker) then
			if #mInfo[6] <= 0 then
				return
			end
			local strWanted, vehName
			
			for _,vId in ipairs(mInfo[6]) do
				vehName = getVehicleNameFromModel(vId)
				if strWanted then
					strWanted = strWanted..", "..vehName
				else
					strWanted = vehName
				end
			end
			
			return strWanted
		end
		
	end
	
	return
end

function gangsterStealIsCarWanted(marker, veh)
	if not isElement(veh) then
		return false
	end
	
	if not isElement(marker) then
		return false
	end
	
	local vehMdl = getElementModel(veh)
	
	if not vehMdl then
		return false
	end
	
	for mId,mInfo in ipairs(gangsterStealCarSellMarkers) do
		if(mInfo[5] == marker) then
			for _,vId in ipairs(mInfo[6]) do
				if(vId == vehMdl) then
					return true
				end
			end
		end
	end
	
	return false
end

function gangsterStealSellCar(veh)
	if not (isElement(veh) and(getElementType(veh) == "vehicle")) then
		return false
	end
	
	local seller = getVehicleOccupant(veh)
	
	if not seller then
		return false
	end
	
	if not isPlayerFromPolice(seller) then
		if not gangsterStealCars[veh] then
			playerShowMessage(seller, "Эту машину нельзя продать скупщикам краденых автомобилей.")
			return false
		end
		
		if not gangsterStealIsCarWanted(source, veh) then
			playerShowMessage(seller, "Эта машина не требуется здесь. Попробуйте сбыть её в другом месте или спрятать до появления спроса на неё.")
			return false
		end
		
		local priceMult = getElementHealth(veh) - 500.0
		
		if(priceMult < 50.0) then
			playerShowMessage(seller, "Вам не удалось продать этот автомобиль из-за его технического состояния. Почините его.")
			return false
		end
		
		priceMult = priceMult/500.0
		local vehMdl = getElementModel(veh)
		local price = math.floor(math.max(800, carSellPrices[vehMdl]/375.0))
		--local price = math.floor(math.min(8000, math.max(800, carSellPrices[vehMdl]))*priceMult)
		
		for mId,mInfo in ipairs(gangsterStealCarSellMarkers) do
			if(mInfo[5] == source) then
				for vIndex,vId in ipairs(mInfo[6]) do
					if(vId == vehMdl) then
						table.remove(gangsterStealCarSellMarkers[mId][6], vIndex)
						break
					end
				end
				--if #gangsterStealCarSellMarkers[mId][6] <= 0 then
					--gangsterStealCarSellMarkers[mId][6] = gangsterStealTakeCarsFromPool(4)
				--end
				break
			end
		end
		
		gangsterStealCars[veh] = nil
		destroyElement(veh)
		giveMoney(seller, price)
		
		if(priceMult < 1.0) then
			playerShowMessage(seller, "Вы получили $"..tostring(price).." за кражу данного автомобиля.")
		else
			playerShowMessage(seller, "Идеальное состояние! Вы получили $"..tostring(price).." за кражу данного автомобиля.")
		end
		
		local respect = getElementData(seller, "respect")
		
		if respect then
			respectSet(seller, respect-0.000010, -1.0, 1.0, true)
		end
		
		return true
	
	else
		playerShowMessage(seller, "Сбыт краденных автомобилей недоступен полицейским и военным.")
	end
end

function gangsterStealEvacCar(eVeh)
	if not (isElement(eVeh) and(getElementType(eVeh) == "vehicle")) then
		return false
	end
	
	local ePlr = getVehicleOccupant(eVeh)
	
	if not ePlr then
		return false
	end
	
	local veh = getVehicleTowedByVehicle(eVeh)
	
	if not veh then
		playerShowMessage(ePlr, "Здесь эвакуаторщики могут сдавать краденные автомобили за вознаграждение.")
		return false
	end
	
	if not gangsterStealCars[veh] then
		playerShowMessage(ePlr, "Это не краденный автомобиль.")
		return false
	end
	
	for _,worker in ipairs(jobWorkers[4]) do
		if(worker[1] == ePlr) and(worker[3] == eVeh) then
			gangsterStealCars[veh] = nil
			destroyElement(veh)
			giveMoney(ePlr, 100)
			--local respect = getElementData(ePlr, "respect")
			--if respect then
				--respectSet(ePlr, respect+0.0002, -1.0, 0.1, true)
			--end
			playerShowMessage(ePlr, "Вы получили $100 за сдачу краденного автомобиля.")
			return true
		end
	end
	
	return false
end

function gangsterStealStartCar(veh, plr)
	if not (isElement(plr) and isElement(veh)) then
		return false
	end
	
	if(getElementData(plr, "usergroup") ~= 10) then
		playerShowMessage(plr, "Взлом автомобилей доступен только бандитам.")
	
	elseif not gangsterStealCars[veh] then
		playerShowMessage(plr, "Эта машина недоступна для угона. Поищите другую на парковках.")
	
	elseif gangsterStealCars[veh][2] then
		playerShowMessage(plr, "Эту машину уже взламывают. Поищите другую.")
	
	elseif gangsterStealCars[veh][1] then
		playerShowMessage(plr, "Эта машина уже взломана.")
	
	else
		local px, py = getElementPosition(plr)
		local vx, vy = getElementPosition(veh)
		local openTime = 20000+math.ceil(carSellPrices[getElementModel(veh)]/3000.0)*240
		gangsterStealCars[veh][2] = plr
		gangsterStealCars[veh][3] = openTime
		removePedFromVehicle(plr)
		setElementRotation(plr, 0.0, 0.0, findRotation(px, py, vx, vy), "default", true)
		setElementFrozen(plr, true)
		setPedAnimation(plr, "COP_AMBIENT", "copbrowse_loop", -1, true, false, false, false)
		addEventHandler("onPlayerWasted", plr, gangsterStealWastedCar)
		triggerClientEvent(plr, "onStealCarStart", resourceRoot, openTime)
		criminalActivityRegisterCrime(criminalActivityGetPlayerZoneIndex(plr))
		return true
	end
	
	return false
end

function gangsterStealStopCar(veh, success)
	if not (isElement(veh) and gangsterStealCars[veh]) then
		return false
	end
	
	local plr = gangsterStealCars[veh][2]
	
	if isElement(plr) then
		triggerClientEvent(plr, "onStealCarStop", resourceRoot)
		setPedAnimation(plr)
		setElementFrozen(plr, false)
		removeEventHandler("onPlayerWasted", plr, gangsterStealWastedCar)
	end
	
	if success then
		gangsterStealCars[veh][1] = true
		setElementFrozen(veh, false)
		setVehicleLocked(veh, false)
		setVehicleDamageProof(veh, false)
		wantedLevelInc(plr, 0 > 1)
		if isElement(plr) then
			playerShowMessage(plr, "Вы успешно вскрыли автомобиль. Теперь отвезите его к точке сдачи и получите свои деньги.")
		end
	
	else
		gangsterStealCars[veh][1] = false
	end
	gangsterStealCars[veh][2] = nil
	gangsterStealCars[veh][3] = 0
	
	if isElement(plr) then
		triggerClientEvent(plr, "onStealCarStop", resourceRoot)
	end
end

function gangsterStealInterruptCar(plr)
	if(source == resourceRoot) and(client == plr) then
		gangsterStealLeaveCar(plr)
	end
end

function gangsterStealWastedCar()
	gangsterStealLeaveCar(source)
end

function gangsterStealLeaveCar(plr)
	for veh,vInfo in pairs(gangsterStealCars) do
		if vInfo[2] and(vInfo[2] == plr) and isElement(veh) then
			gangsterStealStopCar(veh, false)
			break
		end
	end
end

function gangsterStealProcCar()
	for veh,vInfo in pairs(gangsterStealCars) do
		if isElement(veh) and isElement(vInfo[2]) then
			gangsterStealCars[veh][3] = math.max(0, vInfo[3] - gangsterStealProcTime)
			
			if gangsterStealCars[veh][3] > 0 then
				setPedAnimation(vInfo[2], "COP_AMBIENT", "copbrowse_loop", -1, true, false, false, false)
				triggerClientEvent(vInfo[2], "onStealCarUpdate", resourceRoot, vInfo[3])
			
			else
				gangsterStealStopCar(veh, true)
			end
		
		elseif not vInfo[1] then
			
		end
	end
end

function gangsterStealStart(plr, hid)
	local house = houses[hid]
	local usergroup = getElementData(plr, "usergroup")
	
	if isElement(plr) and house then
		if(usergroup == 2) or (usergroup == 5) or (usergroup == 14) or (usergroup == 17) then
			playerShowMessage(plr, "Ограбление недоступно полицейским и военным.")
		
		elseif gangsterStealHouses[hid] then
			if(gangsterStealHouses[hid] == 1) then
				playerShowMessage(plr, "Этот дом уже грабят. Поищите другой.")
			
			elseif(gangsterStealHouses[hid] >= 2) then
				playerShowMessage(plr, "Этот дом уже ограблен. Поищите другой.")
			end
		
		elseif(house[11] ~= 0) then
			playerShowMessage(plr, "Этот дом уже куплен. Для ограбления доступны только свободные дома.")
		
		else
			local hx, hy, hz = getElementPosition(house[4])
			local px, py, pz = getElementPosition(plr)
			
			if(getDistanceBetweenPoints3D(px, py, pz, hx, hy, hz) <= nearbyPickupsRadius) then
				removePedFromVehicle(plr)
				setElementFrozen(plr, true)
				setPedAnimation(plr, "COP_AMBIENT", "copbrowse_loop", -1, true, false, false, false)
				gangsterStealHouses[hid] = 1
				local openTime = 10000+14000*house[2]
				gangsterStealPlayers[plr] = { 1, openTime, hid, {}, {} }
				addEventHandler("onPlayerWasted", plr, gangsterStealWasted)
				triggerClientEvent(plr, "onStealOpenStart", resourceRoot, openTime)
				criminalActivityRegisterCrime(criminalActivityGetPlayerZoneIndex(plr))
				return true
			end
		end
	end
	
	return false
end

function gangsterStealWasted()
	gangsterStealStop(source)
end

function gangsterStealStop(plr)
	if gangsterStealPlayers[plr] then
		local hid = gangsterStealPlayers[plr][3]
		
		if(gangsterStealPlayers[plr][1] == 1) then
			triggerClientEvent(plr, "onStealOpenStop", resourceRoot)
			setPedAnimation(plr)
			setElementFrozen(plr, false)
		end
		
		for _,obj in ipairs(gangsterStealPlayers[plr][4]) do
			if obj then
				destroyElement(obj)
			end
		end
		
		for _,objInfo in ipairs(gangsterStealPlayers[plr][5]) do
			destroyElement(objInfo[1])
		end
		
		if(gangsterStealHouses[hid] == 1) then
			gangsterStealHouses[hid] = nil
		elseif(gangsterStealHouses[hid] == 2) then
			gangsterStealHouses[hid] = 3
		end
		
		removeEventHandler("onPlayerWasted", plr, gangsterStealWasted)
		gangsterStealPlayers[plr] = nil
	end
end

function gangsterStealInterrupt(plr)
	if(source == resourceRoot) and(client == plr) and gangsterStealPlayers[plr] and(gangsterStealPlayers[plr][1] == 1) then
		gangsterStealStop(plr)
	end
end

function gangsterStealProc()
	for plr,state in pairs(gangsterStealPlayers) do
		if(state[1] == 1) then
			gangsterStealPlayers[plr][2] = state[2] - gangsterStealProcTime
			if(gangsterStealPlayers[plr][2] > 0) then
				local h = getTime()
				
				if(h < 23) and(h > 7) then
					playerShowMessage(plr, "Вы опоздали на ограбление. Уже наступило утро. Теперь вы в розыске.")
					wantedLevelInc(plr)
					gangsterStealStop(plr)
				else
					setPedAnimation(plr, "COP_AMBIENT", "copbrowse_loop", -1, true, false, false, false)
					triggerClientEvent(plr, "onStealOpenUpdate", resourceRoot, state[2])
				end
				
			else
				local house = houses[state[3]]
				triggerClientEvent(plr, "onStealOpenStop", resourceRoot)
				gangsterStealHouses[state[3]] = 2
				gangsterStealPlayers[plr][1] = 2
				setPedAnimation(plr)
               	wantedLevelInc(plr, 0 > 1)
				setElementFrozen(plr, false)
				local dim = 1
				
				for key,_ in pairs(houses) do
					dim = dim + 1
					if(key == state[3]) then
						break
					end
				end
				
				local intid = house[2]
				setElementInterior(plr, housesInteriors[intid][4], housesInteriors[intid][1], housesInteriors[intid][2], housesInteriors[intid][3])
				setElementDimension(plr, dim)
				local stealObj
				
				if gangsterStealObjs[intid] and(#gangsterStealObjs[intid] > 0) then
					local arrayid = math.random(#gangsterStealObjs[intid])
					
					for _,objInfo in ipairs(gangsterStealObjs[intid][arrayid]) do
						stealObj = createObject(objInfo[1], objInfo[2], objInfo[3], objInfo[4], objInfo[5], objInfo[6], objInfo[7])
						attachActionToElement(defaultActions[130], stealObj)
						setElementInterior(stealObj, housesInteriors[intid][4])
						setElementDimension(stealObj, dim)
						table.insert(gangsterStealPlayers[plr][4], stealObj)
					end
					
					for _,objInfo in ipairs(gangsterStealContainers[intid][arrayid]) do
						stealObj = createObject(objInfo[1], objInfo[2], objInfo[3], objInfo[4], objInfo[5], objInfo[6], objInfo[7])
						attachActionToElement(defaultActions[131], stealObj)
						setElementInterior(stealObj, housesInteriors[intid][4])
						setElementDimension(stealObj, dim)
						table.insert(gangsterStealPlayers[plr][5], { stealObj, true })
					end
					
				end
				triggerClientEvent(plr, "onHouseEnter", plr, housesInteriors[intid], true, housesFrozenObjs)
			end
		
		elseif(state[1] == 2) then
			local h = getTime()
			
			if(h < 23) and(h > 7) then
				playerShowMessage(plr, "Уже наступило утро. Вас выгнали из дома. Теперь вы в розыске.")
				wantedLevelInc(plr)
				--executeAction(plr, 10002)
				triggerEvent("onPlayerSelectAction", resourceRoot, plr, 10002, {})
			end
			
		end
	end
end

specialEvents = {}

function specialEventCreate(eCreator, eTitle)
	local ex = 0
	local ey = 0
	local ez = 0
	local eCreatorName = nil
	
	if isElement(eCreator) then
		ex, ey, ez = getElementPosition(eCreator)
		eint = getElementInterior(eCreator)
		edim = getElementDimension(eCreator)
		
		if(eint == 0) and(edim == 0) then
			eCreatorName = getPlayerName(eCreator)
		
		else
			playerShowMessage(eCreator, "Мероприятие не может быть создано, т.к. вы находитесь в интерьере.")
			return false
		end
	end
	
	--[[
	for _,eventInfo in pairs(specialEvents) do
		if(getDistanceBetweenPoints3D(eventInfo[5], eventInfo[6], eventInfo[7], ex, ey, ez) < 300.0) and(eventInfo[3] < 2) then
			if isElement(eCreator) then
				playerShowMessage(eCreator, "Мероприятие не может быть создано, т.к. рядом уже проводится другое мероприятие.")
			end
			return false
		end
	end
	]]
	table.insert(specialEvents, { eCreatorName, eTitle, -1, {}, ex, ey, ez })
	local eId = table.getn(specialEvents)
	playerShowMessage(eCreator, "Вы создали мероприятие. Его ID - "..tostring(eId)..". Запомните эту цифру!")
	triggerClientEvent(eCreator, "onSpecialEventCreate", resourceRoot, { eId, {} })
	return eId
end

function specialEventOpen(eId)
	if specialEvents[eId] then
		local eState = specialEvents[eId][3]
		
		if(eState == -1) then
			local eCreator = getPlayerFromName(specialEvents[eId][1])
			specialEvents[eId][3] = 0
			playerSendAdminMessage(eCreator, "Начинается мероприятие '"..specialEvents[eId][2].."'. Для участия в нём воспользуйтесь меню действий.")
			return true
		end
		
	end
	
	return false
end

function specialEventGetPlayersCount(eId)
	if not specialEvents[eId] then
		return 0
	end
	
	if not specialEvents[eId][4] then
		return 0
	end
	
	local playersCount = 0
	
	for elem,elemInfo in pairs(specialEvents[eId][4]) do
		if elemInfo[1] == "player" then
			playersCount = playersCount + 1
		end
	end
	
	return playersCount
end

function specialEventSavePlayer(eId, plr, px, py, pz, pr, plrmdl, vehmdl, vehcr, vehcg, vehcb)
	local pname = getPlayerName(plr)
	
	if(specialEvents[eId][3] > 0) then
		specialEventSavePoints[pname] = { eId, px, py, pz, pr, vehmdl, vehcr, vehcg, vehcb, plrmdl }
	else
		specialEventSavePoints[pname] = { eId }
	end
end

function specialEventLoadPlayer(plr, firstRestore)
	local pname = getPlayerName(plr)
	local saveData = specialEventSavePoints[pname]
	
	if not saveData then
		return false
	end
	
	local eId = saveData[1]
	
	if isPlayerBusy(plr) then
		return false
	end
	
	if(getPlayerName(plr) == specialEvents[eId][1]) then
		return false
	end
	
	if saveData[2] and(specialEvents[eId][3] == 1) then
		removePedFromVehicle(plr)
		
		if saveData[6] then
			local eVeh = createVehicle(saveData[6], saveData[2], saveData[3], saveData[4], 0, 0, saveData[5], "RPSE"..tostring(eId))
			setVehicleColor(eVeh, saveData[7], saveData[8], saveData[9], saveData[7], saveData[8], saveData[9], saveData[7], saveData[8], saveData[9], saveData[7], saveData[8], saveData[9])
			specialEvents[eId][4][eVeh] = { "vehicle" }
			warpPedIntoVehicle(plr, eVeh)
			setElementGhostMode(eVeh, 3000)
			setElementData(eVeh, "noCollisions", true)
			setElementRotation(eVeh, 0, 0, saveData[5])
		else
			setElementPosition(plr, saveData[2], saveData[3], saveData[4])
			setElementRotation(plr, 0, 0, saveData[5], "default", true)
			setElementGhostMode(plr, 3000)
		end
		
		setElementModel(plr, saveData[10])
	
	elseif(specialEvents[eId][3] < 2) then
		removePedFromVehicle(plr)
		setElementPosition(plr, specialEvents[eId][5], specialEvents[eId][6], specialEvents[eId][7])
		if saveData[2] then
			setElementModel(plr, saveData[10])
		end
	
	else
		specialEventSavePoints[pname] = nil
		return false
	end
	
	if firstRestore then
		specialEvents[eId][4][plr] = { "player" }
		specialEventUpdateInfo(eId)
		setElementData(plr, "eventSkin", getElementModel(plr), false)
		for weapSlot=0,12 do
			setElementData(plr, "eventWeap"..tostring(weapSlot), { getPedWeapon(plr, weapSlot), getPedTotalAmmo(plr, weapSlot) }, false)
		end
		setElementGhostMode(plr, 3000)
		triggerClientEvent(plr, "onEventModeSwitch", resourceRoot, true)
	end
	
	takeAllWeapons(plr)
	setElementInterior(plr, 0)
	setElementDimension(plr, 0)
	setElementData(plr, "noCollisions", true)
end

function specialEventStart(eId)
	if specialEvents[eId] then
		local eState = specialEvents[eId][3]
		
		if(eState == 0) then
			local eCreator = getPlayerFromName(specialEvents[eId][1])
			local elemType, firstPlayer
			
			for elem,_ in pairs(specialEvents[eId][4]) do
				if elem and isElement(elem) then
					elemType = getElementType(elem)
					if(elemType == "player") then
						firstPlayer = elem
						break
					end
				end
			end
			
			if not firstPlayer then
				return false
			end
			
			specialEvents[eId][3] = 1
			playerSendAdminMessage(eCreator, "Мероприятие '"..specialEvents[eId][2].."' стартовало. Присоединиться к нему больше нельзя.")
			
			for elem,_ in pairs(specialEvents[eId][4]) do
				if elem and isElement(elem) then
					elemType = getElementType(elem)
					if(elemType ~= "player") then
						setElementFrozen(elem, false)
						setElementCollisionsEnabled(elem, true)
						--setElementVelocity(elem, 0, 0, 0)
						if(elemType == "vehicle") then
							setVehicleDamageProof(elem, false)
						end
					end
				end
			end
			
			return true
		end
	end
	
	return false
end

function specialEventRestart(eId)
	if specialEvents[eId] then
		local eState = specialEvents[eId][3]
		
		if(eState == 1) then
			local elemArray = specialEvents[eId][4]
			specialEvents[eId][3] = 0
			
			if specialEventRemoveAllElements(eId) then
				for elem,elemInfo in pairs(elemArray) do
					if elem and isElement(elem) then
						if(elemInfo[1] == "player") then
							if isElement(elem) then
								specialEventAddElement(eId, elem, nil, nil, nil, nil, nil, nil, false)
							end
						
						elseif elemInfo[2] then
							specialEventCreateElement(eId, elemInfo[1], elemInfo[2], elemInfo[3], elemInfo[4], elemInfo[5], elemInfo[6], elemInfo[7], elemInfo[8])
						end
					end
				end
				
				return true
			end
		end
	end
	
	return false
end

function specialEventCheckpointHit(hitElem)
	if(getElementType(hitElem) == "player") then
		local eId = specialEventGetEventByElement(hitElem)
		
		if eId and(eId == specialEventGetEventByElement(source)) and(specialEvents[eId][1] ~= getPlayerName(hitElem)) then
			local pMdl = getElementModel(hitElem)
			local px, py, pz = getElementPosition(source)
			local _, _, pr = getElementRotation(hitElem)
			local veh = getPedOccupiedVehicle(hitElem)
			local vMdl, vcr, vcg, vcb
			
			if isElement(veh) and(getPedOccupiedVehicleSeat(hitElem) == 0) then
				vMdl = getElementModel(veh)
				vcr, vcg, vcb = getVehicleColor(veh, true)
				specialEventSavePlayer(eId, hitElem, px, py, pz, pr, pMdl, vMdl, vcr, vcg, vcb)
			else
				specialEventSavePlayer(eId, hitElem, px, py, pz, pr, pMdl)
			end
			
			outputChatBox(generateTimeString().."[Мероприятие] RESPLAY: #FFFFFFТочка сохранения достигнута.", hitElem, 255, 128, 0, true)
		end
	end
end

function specialEventRestorePlayer(elem)
	local skin = getElementData(elem, "eventSkin")
	
	if skin then
		removeElementData(elem, "eventSkin")
		takeAllWeapons(elem)
		local weapInfo
		
		for weapSlot=0,12 do
			weapInfo = getElementData(elem, "eventWeap"..tostring(weapSlot))
			removeElementData(elem, "eventWeap"..tostring(weapSlot))
			giveWeapon(elem, weapInfo[1], weapInfo[2], false, true)
		end
		
		setElementModel(elem, skin)
	end
end

function specialEventRemoveAllElements(eId)
	if specialEvents[eId] then
		
		for sname,sinfo in pairs(specialEventSavePoints) do
			if(eId == sinfo[1]) then
				specialEventSavePoints[sname] = nil
			end
		end
		
		for elem,_ in pairs(specialEvents[eId][4]) do
			if elem and isElement(elem) then
				elemType = getElementType(elem)
				if(elemType == "player") then
					specialEventRestorePlayer(elem)
					triggerClientEvent(elem, "onEventModeSwitch", resourceRoot, false)
					setElementGhostMode(elem, 3000)
					removeElementData(elem, "noCollisions")
				
				elseif(elemType == "marker") then
					clearElementVisibleTo(elem)
					removeEventHandler("onMarkerHit", elem, specialEventCheckpointHit)
					destroyElement(elem)
				
				else
					destroyElement(elem)
				end
			end
		end
		
		specialEvents[eId][4] = {}
		specialEventUpdateInfo(eId)
		return true
	end
	return false
end

function specialEventDestroy(eId)
	if specialEvents[eId] then
		local elemType
		local eCreator = getPlayerFromName(specialEvents[eId][1])
		
		if(specialEvents[eId][3] > -1) then
			playerSendAdminMessage(eCreator, "Мероприятие '"..specialEvents[eId][2].."' завершено. Спасибо за участие.")
		end
		
		specialEvents[eId][3] = 2
		specialEventRemoveAllElements(eId)
		triggerClientEvent(eCreator, "onSpecialEventDestroy", resourceRoot)
		return true
	end
	
	return false
end

function specialEventRespawnPlayer(elem)
	if isElement(elem) and(getElementType(elem) == "player") and specialEventGetEventByElement(elem) then
		spawnPlayerEx(elem)
	end
end

function specialEventAddElement(eId, elem, ex, ey, ez, erx, ery, erz, pCheckCount)
	if specialEvents[eId] and isElement(elem) and(not specialEventGetEventByElement(elem)) then
		local elemType = getElementType(elem)
		
		if(specialEvents[eId][3] > 0) or (not elemType) then
			return false
		end
		
		if(elemType == "player") then
			if isPlayerBusy(elem) then
				return false
			end
			
			if pCheckCount then
				local pCount = specialEventGetPlayersCount(eId)
				
				if pCount > 19 then
					return false
				elseif pCount == 19 then
					local eCreator = getPlayerFromName(specialEvents[eId][1])
					if eCreator then
						playerShowMessage(eCreator, "Лимит участников достигнут. Можете начинать мероприятие.")
					end
				end
				
			end
			removePedFromVehicle(elem)
			setElementPosition(elem, specialEvents[eId][5], specialEvents[eId][6], specialEvents[eId][7])
			setElementInterior(elem, 0)
			setElementDimension(elem, 0)
			
			if getElementData(elem, "godMode") then
				removeElementData(elem, "godMode")
			end
			
			specialEvents[eId][4][elem] = { "player" }
			specialEventUpdateInfo(eId)
			setElementData(elem, "eventSkin", getElementModel(elem), false)
			
			for weapSlot=0,12 do
				setElementData(elem, "eventWeap"..tostring(weapSlot), { getPedWeapon(elem, weapSlot), getPedTotalAmmo(elem, weapSlot) }, false)
			end
			
			takeAllWeapons(elem)
			setElementGhostMode(elem, 3000)
			specialEventSavePlayer(eId, elem)
			triggerClientEvent(elem, "onEventModeSwitch", resourceRoot, true)
			setElementData(elem, "noCollisions", true)
		
		else
			setElementPosition(elem, ex, ey, ez)
			setElementRotation(elem, erx, ery, erz, "default",(elemType == "ped"))
			setElementFrozen(elem, true)
			setElementCollisionsEnabled(elem, false)
			
			if(elemType == "vehicle") then
				setVehicleDamageProof(elem, true)
			end
			
		end
		
		return true
	end
	
	return false
end

function specialEventClientCreateElement(eId, elemType, ex, ey, ez, erx, ery, erz, elemParams)
	if(source == resourceRoot) and(client == getPlayerFromName(specialEvents[eId][1])) and(getElementInterior(client) == 0) and(getElementDimension(client) == 0) then
		specialEventCreateElement(eId, elemType, ex, ey, ez, erx, ery, erz, elemParams)
	end
end

function specialEventClientRemoveElement(eId, elem)
	if(source == resourceRoot) and(client == getPlayerFromName(specialEvents[eId][1])) then
		specialEventRemoveElement(eId, elem)
	end
end

function specialEventCreateElement(eId, elemType, ex, ey, ez, erx, ery, erz, elemParams)
	if specialEvents[eId] then
		local elem
		
		if(specialEvents[eId][3] > 0) then
			return false
		end
		
		if(string.lower(elemType) == "vehicle") then -- Параметры:(1) Модель,(2,3,4) Цвет
			elem = createVehicle(elemParams[1], ex, ey, ez, erx, ery, erz, "RPSE"..tostring(eId))
			setVehicleColor(elem, elemParams[2], elemParams[3], elemParams[4], elemParams[2], elemParams[3], elemParams[4], elemParams[2], elemParams[3], elemParams[4], elemParams[2], elemParams[3], elemParams[4])
			setElementData(elem, "noCollisions", true)
		
		elseif(string.lower(elemType) == "object") then -- Параметры:(1) Модель
			elem = createObject(elemParams[1], ex, ey, ez, erx, ery, erz)
		
		elseif(string.lower(elemType) == "marker") then -- Параметры:(1) Размер
			elem = createMarker(ex, ey, ez, "checkpoint", elemParams[1], 255, 0, 0, 0)
			setElementVisibleTo(elem, root, false)
			addEventHandler("onMarkerHit", elem, specialEventCheckpointHit)
		
		else
			return false
		end
		
		if not isElement(elem) then
			return false
		end
		
		if specialEventAddElement(eId, elem, ex, ey, ez, erx, ery, erz) then
			specialEvents[eId][4][elem] = { elemType, ex, ey, ez, erx, ery, erz, elemParams }
			specialEventUpdateInfo(eId)
			return true
		end
		
		return false
	end
	
	return false
end

function specialEventSetElementModel(eId, elem, newMdl)
	if specialEvents[eId][4][elem] and isElement(elem) then
		local elemType = getElementType(elem)
		
		if(elemType == "player") or (elemType == "object") or (elemType == "vehicle") then
			return setElementModel(elem, newMdl)
		end
		
	end
	
	return false
end

function specialEventRemoveElement(eId, elem)
	if specialEvents[eId][4][elem] then
		if(getElementType(elem) == "player") then
			local veh = getPedOccupiedVehicle(elem)
			
			if veh and(getPedOccupiedVehicleSeat(elem) == 0) then
				local veId = specialEventGetEventByElement(veh)
				
				if veId then
					specialEventRemoveElement(veId, veh)
				end
			end
			
			playerShowMessage(elem, "Вы вышли или были исключены из мероприятия.")
			specialEventRestorePlayer(elem)
			triggerClientEvent(elem, "onEventModeSwitch", resourceRoot, false)
			setElementGhostMode(elem, 3000)
			removeElementData(elem, "noCollisions")
		
		elseif(getElementType(elem) == "marker") then
			clearElementVisibleTo(elem)
			removeEventHandler("onMarkerHit", elem, specialEventCheckpointHit)
			destroyElement(elem)
		else
			destroyElement(elem)
		end
		
		specialEvents[eId][4][elem] = nil
		specialEventUpdateInfo(eId)
		
		return true
	end
	return false
end

function specialEventGetEventByElement(elem)
	local eCreator
	
	for eId,_ in pairs(specialEvents) do
		if specialEvents[eId][4][elem] then
			return eId
		
		else
			eCreator = getPlayerFromName(specialEvents[eId][1])
			
			if eCreator and(eCreator == elem) and(specialEvents[eId][3] < 2) then
				return eId
			end
		end
	end
	
	return nil
end

function specialEventUpdateInfo(eId)
	if isElement(getPlayerFromName(specialEvents[eId][1])) then
		local eventInfo = { eId, {} }
		local elemType
		
		for elem,_ in pairs(specialEvents[eId][4]) do
			if isElement(elem) then
				elemType = getElementType(elem)
				
				if(elemType == "player") then
					eventInfo[2][elem] = "Player:"..getPlayerName(elem)..", Model:"..tostring(getElementModel(elem))
				
				elseif(elemType == "marker") then
					eventInfo[2][elem] = "Type:checkpoint, Size:"..tostring(getMarkerSize(elem))
				
				else
					eventInfo[2][elem] = "Type:"..elemType..", Model:"..tostring(getElementModel(elem))
				
				end
				
			end
		end
		
		triggerClientEvent(getPlayerFromName(specialEvents[eId][1]), "onSpecialEventUpdateInfo", resourceRoot, eventInfo)
	end
end

function fractionGetAllGroups()
	local groups = {}
	
	for _,frac in ipairs(fractions) do
		groups[frac[2]] = true
	end
	
	return groups
end

function fractionInit()
	--dbExec(db, "UPDATE users SET usergroup=12,fraction=0,rank=0 WHERE lastLogin<? AND usergroup IN(2, 4, 5, 17, 18 )", getRealTime().timestamp-1814400) -- Автоувольнение с гос.фракций.
	local fHash
	fractions = fractionsOrig
	
	for i,fInfo in ipairs(fractions) do
		fHash = getHash(fInfo[1])
		
		repeat
			local dbq = dbQuery(db, "SELECT leader, ranks FROM fractions WHERE name = ?", fHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		
		if(#dbqueryresult < 1) then
			dbExec(db, "INSERT INTO fractions(name,leader,ranks) VALUES(?,0,3)", fHash)
			dbqueryresult[1] = {}
			dbqueryresult[1]["leader"] = 0
			dbqueryresult[1]["ranks"] = 3
		end
		
		table.insert(fractions[i], dbqueryresult[1]["leader"])
		table.insert(fractions[i], dbqueryresult[1]["ranks"])
		table.insert(fractions[i], {})
		
		repeat
			local dbq = dbQuery(db, "SELECT name, rank FROM users WHERE fraction = ?", fHash)
			dbqueryresult = dbPoll(dbq, 30000)
			dbFree(dbq)
		until dbqueryresult
		
		for _,rec in ipairs(dbqueryresult) do
			table.insert(fractions[i][5], { rec["name"], rec["rank"] })
		end
	end
end

function fractionSetLeader(fId, fLeader)
	local curFraction, pId = fractionGetPlayerFraction(fLeader)
	
	if(curFraction == fId) then
		local fHash = getHash(fractions[fId][1])
		local fLeaderHash = getHash(getPlayerName(fLeader))
		
		if dbExec(db, "UPDATE fractions SET leader = ? WHERE name = ?", fLeaderHash, fHash) then
			local curLeader = fractions[fId][3]
			addNewEventToLog(curLeader, "Фракция - Снят с лидера - "..fractions[fId][1])
			fractions[fId][3] = fLeaderHash
			table.remove(fractions[fId][5], pId)
			
			if curLeader and(curLeader ~= 0) then
				local players = getElementsByType("player")
				table.insert(fractions[fId][5], { curLeader, fractions[fId][4] })
				
				for _,curPlr in ipairs(players) do
					if(getHash(getPlayerName(curPlr)) == curLeader) then
						setElementData(curPlr, "usergroupname", fractions[fId][1].." - "..fractionGetRankName(fId, fractions[fId][4]))
						break
					end
				end
			end
			
			setElementData(fLeader, "usergroupname", fractions[fId][1].." - Лидер")
			addNewEventToLog(fLeaderHash, "Фракция - Назначен лидером - "..fractions[fId][1])
			fractionUpdate(fId, true, false)
			
			return true
		end
	end
	return false
end

function fractionGetFractionByHash(fHash)
	for fId,fracInfo in ipairs(fractionsOrig) do
		if getHash(fracInfo[1]) == fHash then
			return fId, fracInfo[1]
		end
	end
	
	return nil
end

function fractionGetLeader(fId)
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		if(getHash(getPlayerName(plr)) == fractions[fId][3]) then
			return plr
		end
	end
	
	return nil
end

function fractionGetGroup(fId)
	return fractions[fId][2]
end

function fractionGetPlayersOnline(fId)
	local pHash
	local fractionPlayers = {}
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		pHash = getHash(getPlayerName(plr))
		
		if(pHash == fractions[fId][3]) then
			table.insert(fractionPlayers, { getPlayerName(plr), "Лидер" })
		
		else
			for _,pInfo in ipairs(fractions[fId][5]) do
				if(pHash == pInfo[1]) then
					table.insert(fractionPlayers, { getPlayerName(plr), fractionGetRankName(fId, pInfo[2]) })
					break
				end
			end
		end
		
	end
	
	return fractionPlayers
end

function fractionGetPlayerFraction(plr)
	for fId,fInfo in ipairs(fractions) do
		if(getHash(getPlayerName(plr)) == fractions[fId][3]) then
			return fId, 0
		end
		
		for pId,pInfo in ipairs(fInfo[5]) do
			if(getHash(getPlayerName(plr)) == pInfo[1]) then
				return fId, pId
			end
		end
		
	end
	
	return nil
end

function fractionSetPlayerFraction(plr, fId)
	local curFraction = fractionGetPlayerFraction(plr)
	
	if(not curFraction) and(not isPlayerBusy(plr)) then
		local pHash = getHash(getPlayerName(plr))
		local fHash = getHash(fractions[fId][1])
		local setResult = setPlayerNewGroup(plr, fractions[fId][2], true)
		
		if(setResult == true) then
			if dbExec(db, "UPDATE users SET fraction=?,rank=1 WHERE name = ?", fHash, pHash) then
				setElementData(plr, "usergroupname", fractions[fId][1].." - "..fractionGetRankName(fId, 1))
				table.insert(fractions[fId][5], { pHash, 1 })
				addNewEventToLog(pHash, "Фракция - Принят - "..fractions[fId][1])
				return true
			end
			
			return "ошибка базы данных. Свяжитесь с администрацией, сообщив все подробности ошибки"
		
		else
		
			return setResult
		end
	end
	
	return "игрок занят на данный момент или находится в другой фракции"
end

function fractionRemovePlayerFromFraction(plr)
	local fId, pId = fractionGetPlayerFraction(plr)
	
	if fId and(not isPlayerBusy(plr)) then
		local rank = fractions[fId][5][pId][2]
		
		if(rank > 0) then
			local pHash = getHash(getPlayerName(plr))
			
			if dbExec(db, "UPDATE users SET fraction=0,rank=0 WHERE name = ?", pHash) then
				table.remove(fractions[fId][5], pId)
				addNewEventToLog(pHash, "Фракция - Уволен - "..fractions[fId][1])
				fractionUpdate(fId, true, false)
				return true
			end
			
		end
		
	end
	
	return false
end

function fractionSetPlayerRank(fId, pId, fRank)
	local pInfo = fractions[fId][5][pId]
	local curPlayer
	
	if not pInfo then
		return false
	end
	
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		if(getHash(getPlayerName(plr)) == pInfo[1]) then
			if isPlayerBusy(plr) then
				return false
			else
				curPlayer = plr
				setElementData(curPlayer, "usergroupname", fractions[fId][1].." - "..fractionGetRankName(fId, fRank))
				break
			end
		end
	end
	
	if(pInfo[2] ~= fRank) then
		if not dbExec(db, "UPDATE users SET rank = ? WHERE name = ?", fRank, pInfo[1]) then
			return false
		end
		
		fractions[fId][5][pId][2] = fRank
	end
	
	addNewEventToLog(fractions[fId][5][pId][1], "Фракция - Установлен ранг - "..fractions[fId][1]..", Ранг "..fRank)
	
	return true
end

function fractionGetPlayerRank(fId, pId)
	local pInfo = fractions[fId][5][pId]
	
	if not pInfo then
		return nil
	end
	
	return pInfo[2]
end

function fractionSetMaxRank(fId, fRank)
	local fHash = getHash(fractions[fId][1])
	
	if not dbExec(db, "UPDATE fractions SET ranks = ? WHERE name = ?", fRank, fHash) then
		return false
	end
	
	fractions[fId][4] = fRank
	local fHash = getHash(fractions[fId][1])
	local players = getElementsByType("player")
	
	for pId,pInfo in ipairs(fractions[fId][5]) do
		if(pInfo[2] > fRank) then
			dbExec(db, "UPDATE users SET rank = ? WHERE name = ?", fRank, fractions[fId][5][pId][1])
			fractions[fId][5][pId][2] = fRank
			
			for _,plr in ipairs(players) do
				if(getHash(getPlayerName(plr)) == fractions[fId][5][pId][1]) then
					setElementData(plr, "usergroupname", fractions[fId][1].." - "..fractionGetRankName(fId, fRank))
					break
				end
			end
			
		end
	end
	
	return true
end

function fractionSetRankName(fId, fRank, rName)
	local fHash = getHash(fractions[fId][1])
	
	if not dbExec(db, "UPDATE fractionRanks SET name = ? WHERE fraction = ? AND rank = ?", rName, fHash, fRank) then
		return false
	end
	
	--local players = getElementsByType("player")
	
	for pId,pInfo in ipairs(fractions[fId][5]) do
		if(pInfo[2] == fRank) then
			fractionSetPlayerRank(fId, pId, fRank)
		end
	end
	
	return true
end

function fractionGetRankName(fId, fRank)
	local fHash = getHash(fractions[fId][1])
	
	repeat
		local dbq = dbQuery(db, "SELECT name FROM fractionRanks WHERE fraction = ? AND rank = ?", fHash, fRank)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if(#dbqueryresult < 1) then
		local newName = "Ранг "..tostring(fRank)
		
		if not dbExec(db, "INSERT INTO fractionRanks(fraction,rank,name) VALUES(?,?,?)", fHash, fRank, newName) then
			return nil
		end
		
		dbqueryresult[1] = {}
		dbqueryresult[1]["name"] = newName
	end
	return dbqueryresult[1]["name"]
end

function fractionDoesMemberHaveRight(fId, member, rightName)
	local mFrac, mId = fractionGetPlayerFraction(member)
	
	if(mFrac ~= fId) then
		return false
	end
	
	local mRank
	
	if(mId ~= 0) then
		mRank = fractionGetPlayerRank(fId, mId)
		if not mRank then
			return false
		end
	end
	
	local mHash = getHash(getPlayerName(member))
	
	if(rightName == "AddRank") or (rightName == "RemoveRank") or (rightName == "RenameRank") then
		return(fractions[fId][3] == mHash)
	
	elseif(rightName == "AddMember") or (rightName == "UpgradeMember") or (rightName == "DowngradeMember") then
		return((fractions[fId][3] == mHash) or (mRank >=(fractions[fId][4] - 2)))
	end
	
	return false
end

function fractionGetRanks(fId)
	local fractionRanks = {}
	
	for i=1,fractions[fId][4] do
		table.insert(fractionRanks, { tostring(i), fractionGetRankName(fId, i) })
	end
	
	return fractionRanks
end

function fractionUpdate(fId, updatePlayers, updateRanks)
	local newInfo = {}
	local players = getElementsByType("player")
	local members = {}
	local curFraction
	--if updatePlayers then
	
	if true then
		newInfo[1] = fractionGetPlayersOnline(fId)
	end
	
	--if updateRanks then
	
	if true then
		newInfo[2] = fractionGetRanks(fId)
	end
	
	for _,plr in ipairs(players) do
		if getElementData(plr, "spawned") then
			curFraction = fractionGetPlayerFraction(plr)
			if(curFraction == fId) then
				table.insert(members, plr)
			end
		end
	end
	
	if(#members > 0) then
		triggerClientEvent(members, "onFractionRefreshMenu", resourceRoot, newInfo)
	end
end

function fractionIsPlayerInsideFractionInterior(plr, fId)
	local fractionIntExists = false
	
	for eatType,eatFrac in pairs(eatFractions) do
		if(eatFrac == fId) then
			fractionIntExists = true
			break
		end
	end
	
	if fractionIntExists then
		local pdim = getElementDimension(plr)
		
		if not eatLocations[pdim] then
			return false
		end
		
		if eatFractions[eatLocations[pdim][1]] then
			return((getElementInterior(plr) == eatTypes[eatLocations[pdim][1]][3]) and(fId == eatFractions[eatLocations[pdim][1]]))
		end
		
		return false
	end
	
	return true
end

function fractionClientAddMember(curMember, newMember)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		local respect = getElementData(newMember, "respect")
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "AddMember") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на добавление нового члена фракции.")
			return false
		end
		
		--[[if not (fractionIsPlayerInsideFractionInterior(curMember, fId) and fractionIsPlayerInsideFractionInterior(newMember, fId)) then
			playerShowMessage(curMember, "Вы и новый член фракции должны находиться внутри здания фракции.")
			return false
		end]]
		if(not respect) or (respect < fractionGroupRPLevels[fractionGetGroup(fId)]) then
			playerShowMessage(curMember, "Для приема в эту фракцию у игрока должно быть "..tostring(math.floor(rpMin*100.0)).."% положительного уважения.")
			return false
		end
		
		local setResult = fractionSetPlayerFraction(newMember, fId)
		
		if(setResult ~= true) then
			playerShowMessage(curMember, "Не удалось добавить данного игрока в состав фракции. Причина: "..tostring(setResult)..".")
			return false
		end
		
		playerShowMessage(newMember, "Вы были приняты во фракцию '"..fractions[fId][1].."' игроком "..getPlayerName(curMember)..".")
		addNewEventToLog(getPlayerName(curMember), "Фракция - Принял - "..fractions[fId][1]..", "..getPlayerName(newMember))
		fractionUpdate(fId, true, true)
		
		return true
	end
	
	return false
end

function fractionClientUpgradeMember(curMember, member)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "UpgradeMember") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на повышение члена фракции.")
			return false
		end
		
		if(curMember == member) then
			playerShowMessage(curMember, "Вы не можете повышать сами себя.")
			return false
		end
		
		local curFraction, pId = fractionGetPlayerFraction(member)
		
		if(fId ~= curFraction) then
			playerShowMessage(curMember, "Этого игрока нет в составе вашей фракции.")
			return false
		end
		
		if(pId == 0) then
			playerShowMessage(curMember, "Вы не можете повысить лидера.")
			return false
		end
		
		local curRank = fractionGetPlayerRank(fId, pId)
		
		if(curRank >= fractions[fId][4]) then
			playerShowMessage(curMember, "Вы не можете повысить члена высшего ранга.")
			return false
		else
			local newRank = math.max(1, curRank+1)
			
			if fractionSetPlayerRank(fId, pId, newRank) then
				playerShowMessage(member, "Вы были повышены во фракции игроком "..getPlayerName(curMember)..". Ваш новый ранг - "..fractionGetRankName(fId, newRank)..".")
				addNewEventToLog(getPlayerName(curMember), "Фракция - Повысил - "..fractions[fId][1]..", "..getPlayerName(member))
				fractionUpdate(fId, true, false)
				return true
			end
			
		end
	end
	
	return false
end

function fractionClientDowngradeMember(curMember, member)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "DowngradeMember") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на понижение члена фракции.")
			return false
		end
		
		if(curMember == member) then
			playerShowMessage(curMember, "Вы не можете понижать сами себя.")
			return false
		end
		
		local curFraction, pId = fractionGetPlayerFraction(member)
		
		if(fId ~= curFraction) then
			playerShowMessage(curMember, "Этого игрока нет в составе вашей фракции.")
			return false
		end
		
		if(pId == 0) then
			playerShowMessage(curMember, "Вы не можете понизить лидера. Необходимо назначить нового лидера для снятия текущего.")
			return false
		end
		
		local curRank = fractionGetPlayerRank(fId, pId)
		
		if(curRank > 1) then
			local newRank = math.max(1, curRank-1)
			
			if fractionSetPlayerRank(fId, pId, newRank) then
				playerShowMessage(member, "Вы были понижены во фракции игроком "..getPlayerName(curMember)..". Ваш новый ранг - "..fractionGetRankName(fId, newRank)..".")
				fractionUpdate(fId, true, false)
				addNewEventToLog(getPlayerName(curMember), "Фракция - Понизил - "..fractions[fId][1]..", "..getPlayerName(member))
				return true
			end
			
		else
			if setPlayerNewGroup(member, groupCommonGet(member), true) then
				playerShowMessage(member, "Вы были уволены из фракции игроком "..getPlayerName(curMember)..".")
				addNewEventToLog(getPlayerName(curMember), "Фракция - Уволил - "..fractions[fId][1]..", "..getPlayerName(member))
				return true
			end
		end
		
	end
	
	return false
end

function fractionClientAddRank(curMember)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "AddRank") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на добавление ранга.")
			return false
		end
		
		if(fractions[fId][4] >= 10) then
			playerShowMessage(curMember, "Внутри фракции не может быть более 10 рангов.")
			return false
		end
		
		if fractionSetMaxRank(fId, fractions[fId][4]+1) then
			fractionUpdate(fId, false, true)
			return true
		end
		
	end
	
	return false
end

function fractionClientRemoveRank(curMember, delRankId)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "RemoveRank") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на удаление ранга.")
			return false
		end
		
		if(fractions[fId][4] <= 1) then
			playerShowMessage(curMember, "Нельзя удалить единственный ранг.")
			return false
		end
		
		if(delRankId < fractions[fId][4]) then
			for i=delRankId,(fractions[fId][4]-1) do
				fractionSetRankName(fId, i, fractionGetRankName(fId, i+1))
			end
		end
		
		for pId,pInfo in ipairs(fractions[fId][5]) do
			if(pInfo[2] >= delRankId) and(pInfo[2] > 1) then
				fractionSetPlayerRank(fId, pId, pInfo[2]-1)
			end
		end
		
		if fractionSetMaxRank(fId, fractions[fId][4]-1) then
			fractionUpdate(fId, true, true)
			return true
		end
		
	end
	
	return false
end

function fractionClientRenameRank(curMember, renRankId, rankName)
	if(source == resourceRoot) and(client == curMember) then
		local fId = fractionGetPlayerFraction(curMember)
		
		if not fId then
			playerShowMessage(curMember, "Вы не состоите в фракции.")
			return false
		end
		
		if not fractionDoesMemberHaveRight(fId, curMember, "RenameRank") then
			playerShowMessage(curMember, "У вас нет прав внутри фракции на переименование ранга.")
			return false
		end
		
		if fractionSetRankName(fId, renRankId, rankName) then
			fractionUpdate(fId, true, true)
			return true
		end
	end
	
	return false
end

function timeToString(inTime)
	return string.format("%02d", inTime.monthday).."."..string.format("%02d", inTime.month+1).."."..tostring(1900+inTime.year).." "..string.format("%02d", inTime.hour)..":"..string.format("%02d", inTime.minute)
end

function playerConnect(playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber, playerVersionString)
	local banAdmin, banReason, _, unbanTime = resplayGetBan("player", playerNick)
	
	if not banAdmin then
		banAdmin, banReason, _, unbanTime = resplayGetBan("ip", playerIP)
	end
	
	if not banAdmin then
		banAdmin, banReason, _, unbanTime = resplayGetBan("serial", playerSerial)
	end
	
	if banAdmin then
		local banText
		
		if unbanTime then
			banText = "Бан от "..banAdmin.." до "..timeToString(getRealTime(tonumber(unbanTime))).."("..banReason..")."
		else
			banText = "Бессрочный бан от "..banAdmin.."("..banReason..")."
		end
		
		cancelEvent(true, banText)
	elseif not doesPlayerHaveRPName(nil, playerNick) then
		cancelEvent(true, 'Смените никнейм в настройках на соответствующий шаблону "Имя_Фамилия"')
	
	else
		local players = getElementsByType("player")
		local connectStr = playerNick.."("..playerIP..", "..playerSerial..")"
		local timeStr = generateTimeString()
		
		for _,plr in ipairs(players) do
			if(getPlayerName(plr) ~= playerNick) and(isAdmin(plr) or isModerator(plr) or isHelper(plr)) then
				outputConsole(connectStr, plr)
				outputChatBox(timeStr..connectStr, plr, 104, 212, 104)
			end
		end
	end
end

checkModList = {
	["bravura"] = true,
	["buffalo"] = true,
	["linerun"] = true,
	["peren"] = true,
	["sentinel"] = true,
	["dumper"] = true,
	["firetruk"] = true,
	["trash"] = true,
	["stretch"] = true,
	["manana"] = true,
	["infernus"] = true,
	["voodoo"] = true,
	["pony"] = true,
	["mule"] = true,
	["cheetah"] = true,
	["ambulan"] = true,
	["leviathn"] = true,
	["moonbeam"] = true,
	["esperant"] = true,
	["taxi"] = true,
	["washing"] = true,
	["bobcat"] = true,
	["mrwhoop"] = true,
	["bfinject"] = true,
	["hunter"] = true,
	["premier"] = true,
	["enforcer"] = true,
	["securica"] = true,
	["banshee"] = true,
	["predator"] = true,
	["bus"] = true,
	["rhino"] = true,
	["barracks"] = true,
	["hotknife"] = true,
	["artict1"] = true,
	["previon"] = true,
	["coach"] = true,
	["cabbie"] = true,
	["stallion"] = true,
	["rumpo"] = true,
	["rcbandit"] = true,
	["romero"] = true,
	["packer"] = true,
	["monster"] = true,
	["admiral"] = true,
	["squalo"] = true,
	["seaspar"] = true,
	["pizzaboy"] = true,
	["tram"] = true,
	["artict2"] = true,
	["turismo"] = true,
	["speeder"] = true,
	["reefer"] = true,
	["tropic"] = true,
	["flatbed"] = true,
	["yankee"] = true,
	["caddy"] = true,
	["solair"] = true,
	["topfun"] = true,
	["skimmer"] = true,
	["pcj600"] = true,
	["faggio"] = true,
	["freeway"] = true,
	["rcbaron"] = true,
	["rcraider"] = true,
	["glendale"] = true,
	["oceanic"] = true,
	["sanchez"] = true,
	["sparrow"] = true,
	["patriot"] = true,
	["quad"] = true,
	["coastg"] = true,
	["dinghy"] = true,
	["hermes"] = true,
	["sabre"] = true,
	["rustler"] = true,
	["zr350"] = true,
	["walton"] = true,
	["regina"] = true,
	["comet"] = true,
	["bmx"] = true,
	["burrito"] = true,
	["camper"] = true,
	["marquis"] = true,
	["baggage"] = true,
	["dozer"] = true,
	["maverick"] = true,
	["vcnmav"] = true,
	["rancher"] = true,
	["fbiranch"] = true,
	["virgo"] = true,
	["greenwoo"] = true,
	["jetmax"] = true,
	["hotring"] = true,
	["sandking"] = true,
	["blistac"] = true,
	["polmav"] = true,
	["boxville"] = true,
	["benson"] = true,
	["mesa"] = true,
	["rcgoblin"] = true,
	["hotrina"] = true,
	["hotrinb"] = true,
	["bloodra"] = true,
	["rnchlure"] = true,
	["supergt"] = true,
	["elegant"] = true,
	["journey"] = true,
	["bike"] = true,
	["mtbike"] = true,
	["beagle"] = true,
	["cropdust"] = true,
	["stunt"] = true,
	["petro"] = true,
	["rdtrain"] = true,
	["nebula"] = true,
	["majestic"] = true,
	["buccanee"] = true,
	["shamal"] = true,
	["hydra"] = true,
	["fcr900"] = true,
	["nrg500"] = true,
	["copbike"] = true,
	["cement"] = true,
	["towtruck"] = true,
	["fortune"] = true,
	["cadrona"] = true,
	["fbitruck"] = true,
	["willard"] = true,
	["forklift"] = true,
	["tractor"] = true,
	["combine"] = true,
	["feltzer"] = true,
	["remingtn"] = true,
	["slamvan"] = true,
	["blade"] = true,
	["freight"] = true,
	["streak"] = true,
	["vortex"] = true,
	["vincent"] = true,
	["bullet"] = true,
	["clover"] = true,
	["sadler"] = true,
	["firela"] = true,
	["hustler"] = true,
	["intruder"] = true,
	["primo"] = true,
	["cargobob"] = true,
	["tampa"] = true,
	["sunrise"] = true,
	["merit"] = true,
	["utility"] = true,
	["nevada"] = true,
	["yosemite"] = true,
	["windsor"] = true,
	["monstera"] = true,
	["monsterb"] = true,
	["uranus"] = true,
	["jester"] = true,
	--["sultan"] = true,
	--["stratum"] = true,
	["elegy"] = true,
	["raindanc"] = true,
	["rctiger"] = true,
	["flash"] = true,
	["tahoma"] = true,
	["savanna"] = true,
	["bandito"] = true,
	["freiflat"] = true,
	["streakc"] = true,
	["kart"] = true,
	["mower"] = true,
	["duneride"] = true,
	["sweeper"] = true,
	["broadway"] = true,
	["tornado"] = true,
	["at400"] = true,
	["dft30"] = true,
	["huntley"] = true,
	["stafford"] = true,
	["bf400"] = true,
	["newsvan"] = true,
	["tug"] = true,
	["petrotr"] = true,
	["emperor"] = true,
	["wayfarer"] = true,
	["euros"] = true,
	["hotdog"] = true,
	["club"] = true,
	["freibox"] = true,
	["artict3"] = true,
	["androm"] = true,
	["dodo"] = true,
	["rccam"] = true,
	["launch"] = true,
	["copcarla"] = true,
	["copcarsf"] = true,
	["copcarvg"] = true,
	["copcarru"] = true,
	["picador"] = true,
	["swatvan"] = true,
	["alpha"] = true,
	["phoenix"] = true,
	["glenshit"] = true,
	["sadlshit"] = true,
	["bagboxa"] = true,
	["bagboxb"] = true,
	["tugstair"] = true,
	["boxburg"] = true,
	["farmtr1"] = true,
	["utiltr1"] = true,
	["brassknuckle"] = true,
	["golfclub"] = true,
	["nitestick"] = true,
	["knifecur"] = true,
	["bat"] = true,
	["shovel"] = true,
	["poolcue"] = true,
	["katana"] = true,
	["chnsaw"] = true,
	["gun_dildo1"] = true,
	["gun_dildo2"] = true,
	["gun_vibe1"] = true,
	["gun_vibe2"] = true,
	["flowera"] = true,
	["gun_cane"] = true,
	["grenade"] = true,
	["teargas"] = true,
	["molotov"] = true,
	["colt45"] = true,
	["silenced"] = true,
	["desert_eagle"] = true,
	["chromegun"] = true,
	["sawnoff"] = true,
	["shotgspa"] = true,
	["micro_uzi"] = true,
	["mp5lng"] = true,
	["ak47"] = true,
	["m4"] = true,
	["tec9"] = true,
	["cuntgun"] = true,
	["sniper"] = true,
	["rocketla"] = true,
	["heatseek"] = true,
	["flame"] = true,
	["minigun"] = true,
	["satchel"] = true,
	["bomb"] = true,
	["spraycan"] = true,
	["fire_ex"] = true,
	["camera"] = true,
	["nvgoggles"] = true,
	["irgoggles"] = true,
	["gun_para"] = true
}

-- Изменение описания игрового режима
addEventHandler("onResourceStart", resourceRoot, 
    function() 
        setGameType ("[Lite RP, Голосовой чат]") 
        resetMapInfo() 
        for i,player in ipairs(getElementsByType("player")) do 
            spawn(player) 
        end 
    end 
)

--Проверка файлов SA на оригинальность
function playerModInfo(filename, modList)
	local checkName
	for _,item in ipairs(modList) do
		checkName = string.sub(item.name, 1, -5)
		if checkName and checkModList[checkName] then
			kickPlayer(source, "Resplay", "Неоригинальный файл "..item.name.." в "..filename..".")
			break
		end
	end
end

function playerDisconnect(playerNick, playerIP, playerSerial, reason)
	local players = getElementsByType("player")
	local connectStr = playerNick.."("..playerIP..", "..playerSerial..", "..reason..")"
	local timeStr = generateTimeString()
	
	for _,plr in ipairs(players) do
		if(getPlayerName(plr) ~= playerNick) and(isAdmin(plr) or isModerator(plr) or isHelper(plr)) then
			outputConsole(connectStr, plr)
			outputChatBox(timeStr..connectStr, plr, 233, 78, 78)
		end
	end
	
end

function vehicleSellAccept(newOwner, curOwner, veh, price)
	if(source == resourceRoot) and(client == newOwner) then
		if price and(price >= 0) then
			local aint = getElementInterior(curOwner)
			local oint = getElementInterior(newOwner)
			local adim = getElementDimension(curOwner)
			local odim = getElementDimension(newOwner)
			
			if(aint == oint) and(adim == odim) then
				local ax, ay, az = getElementPosition(curOwner)
				local ox, oy, oz = getElementPosition(newOwner)
				
				if(getDistanceBetweenPoints3D(ax,ay,az,ox,oy,oz) <= nearbyPlayersRadius) then
					if not (isVehicleBlown(veh) or isElementInWater(veh)) then
						local oldOwner = getElementData(veh, "owner")
						
						if oldOwner and(oldOwner ~= getHash(getPlayerName(newOwner))) then
							if(getHash(getPlayerName(curOwner)) == oldOwner) then
								local oMoney = getMoney(newOwner)
								
								if(oMoney >= price) then
									local sqlid = getElementData(veh, "sqlid")
									local oHash = getHash(getPlayerName(newOwner))
									
									if dbExec(db, "UPDATE cars SET owner=? WHERE id=?", oHash, sqlid) then
										local curVeh = getElementData(newOwner, "vehicle")
										
										if curVeh and isElement(curVeh) then
											sqlid = getElementData(curVeh, "sqlid")
											
											if sqlid then
												carSellSQLIds[sqlid] = nil
											end
											
											destroyElement(curVeh)
										end
										
										setElementData(newOwner, "vehicle", veh, false)
										setElementData(veh, "owner", oHash, false)
										
										if getElementData(curOwner, "vehicle") then
											removeElementData(curOwner, "vehicle")
										end
										
										triggerEvent("onPlayerChat", client, "купил ТС "..getVehicleName(veh).." у игрока "..getPlayerName(curOwner)..".", 1)
										giveMoney(curOwner, price)
										takeMoney(newOwner, price)
									
									else
										playerShowMessage(newOwner, "Возникла ошибка при покупке ТС.")
									end
								
								else
									playerShowMessage(newOwner, "У вас недостаточно денег.")
								end
							
							else
								playerShowMessage(newOwner, "Это транспортное средство уже не принадлежит данному игроку.")
							end
						
						else
							playerShowMessage(newOwner, "Это транспортное средство уже принадлежит вам.")
						end
					
					else
						playerShowMessage(newOwner, "Транспортное средство уничтожено и не может быть куплено.")
					end
				
				else
					playerShowMessage(newOwner, "Вы слишком далеко от игрока.")
				end
			
			else
				playerShowMessage(newOwner, "Вы слишком далеко от игрока.")
			end

		else		
			playerShowMessage(newOwner, "Неправильно введена цена.")
		end
	
	end
	
	return false
end

function vehicleSellDecline(newOwner)
	if(source == resourceRoot) and(client == newOwner) then
		triggerEvent("onPlayerChat", client, "отказался от покупки ТС.", 1)
	end
end

function houseSellAccept(newOwner, curOwner, houseid, price)
	if(source == resourceRoot) and(client == newOwner) then
	--[[
		if not (houseid and houses[houseid]) then
			return false
		end
		if not (isElement(newOwner) and isElement(curOwner)) then
			return false
		end
		if not (price and(price >= 0)) then
			return false
		end
	]]
		local curHash = getHash(getPlayerName(curOwner))
		
		if(houses[houseid][11] ~= curHash) then
			playerShowMessage(newOwner, "Этому игроку уже не принадлежит данная недвижимость.")
			return false
		end
		
		local aint = getElementInterior(curOwner)
		local oint = getElementInterior(newOwner)
		local adim = getElementDimension(curOwner)
		local odim = getElementDimension(newOwner)
		
		if(aint ~= oint) or (adim ~= odim) then
			playerShowMessage(newOwner, "Вы слишком далеко от данного игрока.")
			return false
		end
		
		local ax, ay, az = getElementPosition(curOwner)
		local ox, oy, oz = getElementPosition(newOwner)
		
		if(getDistanceBetweenPoints3D(ax,ay,az,ox,oy,oz) > nearbyPlayersRadius) then
			playerShowMessage(newOwner, "Вы слишком далеко от данного игрока.")
			return false
		end
		
		local newMoney = getMoney(newOwner)
		
		if(newMoney < price) then
			playerShowMessage(newOwner, "У вас недостаточно денег.")
			return false
		end
		
		local hsqlindex = houses[houseid][1]
		local newHash = getHash(getPlayerName(newOwner))
		
		if houseOwners[newHash] and(houseOwners[newHash] >= 3) then
			playerShowMessage(newOwner, "Нельзя приобретать в собственность больше трёх домов.")
			return false
		
		elseif(dbExec(db, "UPDATE houses SET owner=? WHERE id=?", newHash, hsqlindex)) then
			addNewEventToLog(getPlayerName(curOwner), "Дом - Передача - SQL ID "..hsqlindex, true)
			addNewEventToLog(getPlayerName(curOwner), "Дом - Получение - SQL ID "..hsqlindex, true)
			if(houseid == saveHouseGet(curOwner)) then
				saveHouseSet(curOwner, 0)
			end
			takeMoney(newOwner, price)
			giveMoney(curOwner, price)
			houses[houseid][11] = newHash
			triggerEvent("onPlayerChat", newOwner, "купил дом у игрока "..getPlayerName(curOwner), 1)
			if houseOwners[newHash] then
				houseOwners[newHash] = houseOwners[newHash] + 1
			else
				houseOwners[newHash] = 1
			end
			houseOwners[curHash] = houseOwners[curHash] - 1
			if(houseOwners[curHash] < 1) then
				houseOwners[curHash] = nil
			end
			return true
		end
		
	end
	
	return false
end

function houseSellDecline(newOwner)
	if(source == resourceRoot) and(client == newOwner) then
		triggerEvent("onPlayerChat", client, "отказался от покупки недвижимости.", 1)
	end
	return false
end

function getClosestHospital(posX, posY, posZ)
	local hospitalTypes = {}
	local locId = nil
	local locDist, curDist
	
	for eatId,fId in pairs(eatFractions) do
		if(fId >= 5) and(fId <= 8) then
			table.insert(hospitalTypes, eatId)
		end
	end
	
	for curId,locInfo in ipairs(eatLocations) do
		for _,locTypeId in ipairs(hospitalTypes) do
			if(locInfo[1] == locTypeId) then
				curDist = getDistanceBetweenPoints3D(posX,posY,posZ,locInfo[2],locInfo[3],locInfo[4])
				if(not locId) or (curDist < locDist) then
					locDist = curDist
					locId = curId
				end
				break
			end
		end
	end
	
	return locId
end

function getClosestFractionInterior(fractionId, posX, posY, posZ)
	local locTypeId = nil
	local locId = nil
	local sx, sy, sz, sint, sdim
	local locDist, curDist
	
	for eatId,fId in pairs(eatFractions) do
		if(fId == fractionId) then
			locTypeId = eatId
			break
		end
	end
	
	if locTypeId then
		locId = getClosestInteriorOfType(locTypeId, posX, posY, posZ)
	end
	
	return locId
end

function getClosestInteriorOfType(locTypeId, posX, posY, posZ)
	local locId = nil
	local locDist, curDist
	
	for curId,locInfo in ipairs(eatLocations) do
		if(locInfo[1] == locTypeId) then
			curDist = getDistanceBetweenPoints3D(posX,posY,posZ,locInfo[2],locInfo[3],locInfo[4])
			if(not locId) or (curDist < locDist) then
				locDist = curDist
				locId = curId
			end
		end
	end
	
	return locId
end

function putPlayerInsideInterior(plr, locationId, posX, posY, posZ, rotZ, turnOffSound)
	local eatInfo = eatTypes[eatLocations[locationId][1]]
	setElementInterior(plr, eatInfo[3], posX, posY, posZ)
	setElementRotation(plr, 0, 0, rotZ)
	setElementDimension(plr, locationId)
	triggerClientEvent(plr, "onEatEnter", plr, eatInfo, turnOffSound)
end

function doesPlayerHaveRPName(plr, nick)
	local pName
	
	if nick then
		pName = nick
	else
		pName = getPlayerName(plr)
	end
	
	local adminNicknames = string.find(pName, "Karts") or string.find(pName, "Midlas") or string.find(pName, "Sadros") or string.find(pName, "DEAGLOS") or string.find(pName, "JustEazzy") or string.find(pName, "AKSOV") or string.find(pName, "Pagan")
	
	if adminNicknames then
		return true
	end
	
	local s = string.find(pName, "^%u%l+_Mc%u%l+$") or (string.find(pName, "^%u%l+_%u%l+$") and not string.find(pName, "^%u%l+_Mc%l+$"))
	
	if s then
		return true
	end
	
	return false
end

function criminalActivityInit()
	local zonesByXY = math.max(1, math.floor(math.sqrt(criminalActivityZoneNum)))
	criminalActivityZoneNum = zonesByXY^2
	
	for curIndex=1,criminalActivityZoneNum do
		table.insert(criminalActivityZones, { false, criminalActivityCrimesToActivate, 0 })
	end
end

function criminalActivityGetPlayerZoneIndex(plr)
	if(getElementInterior(plr) ~= 0) or (getElementDimension(plr) ~= 0) then
		return nil
	end
	
	local px, py = getElementPosition(plr)
	px, py = px+3000.0, py+3000.0
	
	if(px < 0.0) or (py < 0.0) then
		return nil
	end
	
	local zonesByXY = math.sqrt(criminalActivityZoneNum)
	local zoneIndexStep = 6000.0/zonesByXY
	local zoneIndexX = math.min(zonesByXY, math.max(1, math.ceil(px/zoneIndexStep)))
	local zoneIndexY = math.min(zonesByXY, math.max(1, math.ceil(py/zoneIndexStep)))
	return(zoneIndexX-1)*zonesByXY+zoneIndexY
end

function criminalActivityGetZoneBounds(zoneIndex)
	local zonesByXY = math.sqrt(criminalActivityZoneNum)
	local zoneIndexStep = 6000.0/zonesByXY
	local zoneIndexX = math.floor((zoneIndex-1)/zonesByXY)+1
	local zoneIndexY = -zoneIndexX*zonesByXY+zoneIndex+zonesByXY
	local x2 = -3000+zoneIndexStep*zoneIndexX
	local x1 = x2-zoneIndexStep
	local y2 = -3000+zoneIndexStep*zoneIndexY
	local y1 = y2-zoneIndexStep
	return x1, y1, x2, y2
end

function criminalActivityRegisterCrime(zoneIndex)
	if not zoneIndex then
		return nil
	end
	
	if not criminalActivityZones[zoneIndex][1] then
		criminalActivityZones[zoneIndex][2] = criminalActivityZones[zoneIndex][2]-1
		
		if(criminalActivityZones[zoneIndex][2] <= 0) then
			criminalActivityZones[zoneIndex][1] = true
			criminalActivitySendInfo(zoneIndex, true)
		end
	end
	criminalActivityZones[zoneIndex][3] = criminalActivityResetTime
end

function criminalActivitySendInfo(zoneIndex, activate, curPlr)
	local policemen
	local outputAlert = true
	
	if curPlr then
		policemen = curPlr
		outputAlert = false
	else
		local players = getElementsByType("player")
		policemen = {}
		
		for _,plr in ipairs(players) do
			if isPlayerFromPolice(plr) then
				table.insert(policemen, plr)
			end
		end
	end
	
	if activate then
		local x1, y1, x2, y2 = criminalActivityGetZoneBounds(zoneIndex)
		triggerClientEvent(policemen, "onCriminalActivityNew", resourceRoot, zoneIndex, x1, y1, x2, y2, outputAlert, generateTimeString())
	else
		triggerClientEvent(policemen, "onCriminalActivityDestroy", resourceRoot, zoneIndex)
	end
end

function criminalActivityProc()
	for zoneIndex,zoneInfo in ipairs(criminalActivityZones) do
		if(zoneInfo[3] > 0) then
			criminalActivityZones[zoneIndex][3] = math.max(0, zoneInfo[3]-criminalActivityProcTimeStep)
			if(criminalActivityZones[zoneIndex][3] == 0) then
				if zoneInfo[1] then
					criminalActivityZones[zoneIndex][1] = false
					criminalActivitySendInfo(zoneIndex, false)
				end
				criminalActivityZones[zoneIndex][2] = criminalActivityCrimesToActivate
			end
		end
	end
end

function chatBubbleChangeState(plr, newState)
	if(source ~= resourceRoot) or (client ~= plr) then
		return false
	end
	
	local players = getNearbyElementsByType(plr, "player", 300)
	
	if(#players <= 0) then
		return false
	end
	
	triggerClientEvent(players, "onChatBubbleSetState", plr, newState)
	return true
end

function playerChangeNickname(plr, nick)
	if(source == resourceRoot) and(client == plr) then
		if doesPlayerHaveRPName(plr, nick) then
			local oldNick = getPlayerName(plr)
			local oldHash = getHash(oldNick)
			local newHash = getHash(nick)
			
			repeat
				dbq = dbQuery(db, "SELECT name FROM users WHERE name=?", newHash)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			if(#dbqueryresult > 0) then
				triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 2)
			
			elseif(oldHash == newHash) then
				triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 2)
			
			elseif dbExec(db, "UPDATE users SET name=? WHERE name=?", newHash, oldHash) then
				kickPlayer(plr, "Ник сменен. Перезайдите на сервер под новым никнеймом.")
				dbExec(db, "UPDATE friends SET friend=? WHERE friend=?", nick, oldNick)
				
				for i,house in pairs(houses) do
					if(house[11] == oldHash) then
						houses[i][11] = newHash
					end
				end
				
				for i,frac in ipairs(fractions) do
					if(frac[3] == oldHash) then
						fractions[i][3] = newHash
					end
				end
				
				for i,lead in pairs(clanLeaders) do
					if(lead == oldHash) then
						clanLeaders[i] = newHash
					end
				end
				
				for i,leadArray in pairs(clanColeaders) do
					for i2,lead in ipairs(leadArray) do
						if(lead == oldHash) then
							clanColeaders[i][i2] = newHash
						end
					end
				end
			
			else
				triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 3)
			end
		
		else
			triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 1)
		end
	end
end

function serviceRegister(plr, servicer, serviceId)
	local sName = getPlayerName(servicer)
	local pName = getPlayerName(plr)
	
	if not jobRenderedServices[serviceId] then
		jobRenderedServices[serviceId] = {}
	end
	
	if not jobRenderedServices[serviceId][sName] then
		jobRenderedServices[serviceId][sName] = {}
	end
	
	if serviceCheckLimit(plr, servicer, serviceId) then
		if jobRenderedServices[serviceId][sName][pName] then
			jobRenderedServices[serviceId][sName][pName] = jobRenderedServices[serviceId][sName][pName]+1
		
		else
			jobRenderedServices[serviceId][sName][pName] = 1
		end
		
		return true
	end
	
	return false
end

function serviceCount(plr, servicer, serviceId)
	local sName = getPlayerName(servicer)
	local pName = getPlayerName(plr)
	
	if not jobRenderedServices[serviceId] then
		return 0
	
	elseif not jobRenderedServices[serviceId][sName] then
		return 0
	
	elseif not jobRenderedServices[serviceId][sName][pName] then
		return 0
	end
	
	return jobRenderedServices[serviceId][sName][pName]
end

function serviceSetLimit(serviceId, limit)
	jobServiceLimits[serviceId] = limit
end

function serviceGetLimit(serviceId)
	return jobServiceLimits[serviceId]
end

function serviceCheckLimit(plr, servicer, serviceId)
	if not jobServiceLimits[serviceId] then
		return true
	end
	
	return(jobServiceLimits[serviceId] > serviceCount(plr, servicer, serviceId))
end

function processLookPoint(plr, lx, ly, lz)
	if(source == resourceRoot) and(plr == client) then
		triggerLatentClientEvent("onPlayerLookAt", plr, lx, ly, lz)
	end
end

function checkTraffic()
	local traffic = getResourceFromName("npchlc_traffic")
	
	if traffic then
		local players = getElementsByType("player")
		
		if(#players > 55) and(getResourceState(traffic) == "running") then
			stopResource(traffic)
		elseif(#players < 45) and(getResourceState(traffic) == "loaded") then
			startResource(traffic)
		end
	end
end

function missionsInit()
	if(#missions > 0) then
		outputDebugString("Missions are already loaded", 1)
		return nil
	end
	local xml = xmlLoadFile(":resplay/missions.xml")
	
	if not xml then
		outputDebugString("Missions.xml load error", 1)
		return nil
	end
	local missionNodes = xmlNodeGetChildren(xml)
	
	if not missionNodes then
		outputDebugString("Missions.xml mission nodes error", 1)
		return nil
	end
	
	if(#missionNodes == 0) then
		outputDebugString("Missions.xml is empty", 2)
		return nil
	end
	local id,name,desc,parent,errorStr,resource
	
	for mI,missionNode in ipairs(missionNodes) do
		errorStr = nil
		if xmlNodeGetName(missionNode) == "mission" then
			id = xmlNodeGetAttribute(missionNode, "id")
			
			if id then
				resource = getResourceFromName(id)
				
				if resource and startResource(resource) then
					name = getResourceInfo(resource, "name")
					desc = getResourceInfo(resource, "description")
					parent = getResourceInfo(resource, "previous")
					missions[id] = {}
					missions[id]["name"] = name or "Untitled"
					missions[id]["description"] = desc or ""
					missions[id]["resource"] = getResourceRootElement(resource)
					
					if parent then
						for parentId in string.gmatch(parent, ",") do
							if(string.len(parentId) > 0) then
								if not missions[id]["parents"] then
									missions[id]["parents"] = {}
								end
								table.insert(missions[id]["parents"], parentId)
							end
						end
					end
					
					missions[id]["players"] = {}
				
				else
					errorStr = "No resource"
				end
			
			else
				errorStr = "No mission id"
			end
		
		else
			errorStr = "Incorrect node name"
		
		end
		
		if errorStr then
			outputDebugString("Cannot load mission "..tostring(mI)..": "..errorStr, 1)
		end
		
	end
	
	addEvent("onMissionStart")
	addEvent("onMissionFinish")
	addEvent("onMissionClientStart", true)
	addEvent("onMissionClientFinish", true)
	addEventHandler("onMissionStart", resourceRoot, missionStart, false)
	addEventHandler("onMissionFinish", resourceRoot, missionFinish, false)
	addEventHandler("onMissionClientStart", resourceRoot, missionClientStart, false)
	addEventHandler("onMissionClientFinish", resourceRoot, missionClientFinish, false)
	xmlUnloadFile(xml)
end

function missionClientStart(plr, mId)
	if not ((client == plr) and triggerEvent("onMissionStart", resourceRoot, plr)) then
		cancelEvent()
	end
end

function missionStart(plr, mId)
	if not missions[mId] then
		cancelEvent(true, "Ошибка инициализации миссии. Обратитесь к модераторам проекта.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if not missions[mId]["resource"] then
		cancelEvent(true, "Ошибка инициализации миссии. Обратитесь к модераторам проекта.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if isPlayerBusy(plr) then
		cancelEvent(true, "В данный момент вы не можете начать миссию. Завершите все остальные дела.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if not triggerEvent("onMissionStart", missions[mId]["resource"], plr) then
		cancelEvent(true, "Внутренняя ошибка при запуске миссии.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	showMissionTitle(plr, missions[mId]["name"])
	missions[mId]["players"][plr] = true
end

function missionClientFinish(plr, mId, reason)
	if not ((client == plr) and missionFinish(plr, mId, reason)) then
		cancelEvent()
	end
end

function missionFinish(plr, mId, reason)
	if not missions[mId] then
		cancelEvent(true, "Ошибка инициализации миссии. Обратитесь к модераторам проекта.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if not missions[mId]["resource"] then
		cancelEvent(true, "Ошибка инициализации миссии. Обратитесь к модераторам проекта.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if not missions[mId]["players"][plr] then
		cancelEvent(true, "Вы не находитесь на миссии в данный момент. Обратитесь к модераторам проекта.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	
	if not triggerEvent("onMissionFinish", missions[mId]["resource"], plr, reason) then
		cancelEvent(true, "Внутренняя ошибка при завершении миссии.")
		playerShowMessage(plr, getCancelReason())
		return nil
	end
	missions[mId]["players"][plr] = nil
end

function showMissionTitle(plr, titleStr)
	triggerClientEvent(plr, "onMissionTitleShow", resourceRoot, titleStr)
end

function showPlace(plr, place, timeY, timeMo, timeD)
	triggerClientEvent(plr, "onPlaceShow", resourceRoot, place, timeY, timeMo, timeD)
end

function moveCamera(plr, camX1, camY1, camZ1, camLX1, camLY1, camLZ1, camX2, camY2, camZ2, camLX2, camLY2, camLZ2, moveCamTime, moveCamFunc)
	triggerClientEvent(plr, "onCameraMove", resourceRoot, camX1, camY1, camZ1, camLX1, camLY1, camLZ1, camX2, camY2, camZ2, camLX2, camLY2, camLZ2, moveCamTime, moveCamFunc)
end

function toggleResplayMessages(plr, bToggle)
	triggerClientEvent(plr, "onResplayMessagesToggle", resourceRoot, bToggle)
end

function toggleSkinChooser(plr)
	triggerClientEvent(plr, "onSkinChooser", resourceRoot)
end

playerActions = {}
actionsAvailability = {}
playerActionsLocal = {}
playerActionsElement = {}
playerActionsSelf = {}

function actionsInit()
	local policeGrps = getPoliceGroups()
	defaultActions = {}
	defaultActions[1] = createAction("Дом - Купить(${houseprice})", nil, 2, executeAction, nil, true, false) -- 1
	defaultActions[2] = createAction("Дом - Продать(${housesellprice})", nil, 2, executeAction, nil, true, false) -- 2
	defaultActions[3] = createAction("Бизнес - Купить(${businessprice})", nil, 2, executeAction, nil, true, false) -- 3
	defaultActions[4] = createAction("Бизнес - Продать(${businessprice})", nil, 2, executeAction, nil, true, false) -- 4
	defaultActions[5] = createAction("Заправка - Сделать Коктейль Молотова($10)", nil, 2, executeAction, nil, true, false) -- 5(10006)
	defaultActions[7] = createAction("Работа - Начать {workname}", nil, 2, executeAction, nil, false, true, false) -- 7
	defaultActions[8] = createAction("Службы - Вызвать эвакуатор", nil, 1, executeAction, nil, true, true, true) -- 8
	defaultActions[9] = createAction("Работа - Заправить ТС игрока", nil, 2, executeAction, { "Игрок" }, false, true, false) -- 9
	defaultActions[10] = createAction("Работа - Починить ТС игрока", nil, 2, executeAction, { "Игрок" }, false, true, false) -- 10
	defaultActions[11] = createAction("Транспорт - Купить {vehiclecolor} {vehiclename}(${vehicleprice})", nil, 2, executeAction, nil, true, false) -- 11
	defaultActions[12] = createAction("Транспорт - {myvehiclecolor} {myvehiclename}", nil, 2, executeAction, nil, true, false) -- 12
	defaultActions[13] = createAction("Транспорт - Продать(${vehiclesellprice})", nil, 2, executeAction, nil, false, true, false) -- 13
	defaultActions[14] = createAction("Дом - Войти", nil, 2, executeAction, nil, true, false) -- 14
	defaultActions[15] = createAction("Предмет - Подобрать(${droppeditemname})", nil, 2, executeAction, nil, true, false) -- 15
	defaultActions[16] = createAction("Заправка - Купить канистру(${fuelcanprice})", nil, 2, executeAction, nil, true, false) -- 16
	defaultActions[17] = createAction("Здание - Войти в аммуницию", nil, 2, executeAction, nil, true, false) -- 17
	defaultActions[18] = createAction("Здание - Войти в {businessname}", nil, 2, executeAction, nil, true, false) -- 18
	defaultActions[19] = createAction("Гонка - Принять участие", nil, 2, executeAction, nil, false, true, false) -- 19
	defaultActions[22] = createAction("Работа - Начать карьеру '{careername}'", nil, 2, executeAction, nil, true, false) -- 22
	defaultActions[23] = createAction("Работа - Бросить карьеру '{careername}'", nil, 2, executeAction, nil, true, false) -- 23
	defaultActions[25] = createAction("Службы - Вызвать полицию", nil, 1, executeAction, nil, true, true, true ) -- 25
	defaultActions[26] = createAction("Службы - Вызвать скорую помощь", nil, 1, executeAction, nil, true, true, true) -- 26
	defaultActions[27] = createAction("СМИ - Обратиться", nil, 3, executeAction, { "Ваше обращение" }, true, true, true) -- 27
	defaultActions[28] = createAction("Работа - Вылечить игрока", nil, 2, executeAction, { "Игрок" }, true, true, true) -- 28
	setActionAvailableToGroup(defaultActions[28], 4)
	defaultActions[29] = createAction("Дом - Сделать точкой старта", nil, 2, executeAction, nil, true, false) -- 29
	defaultActions[30] = createAction("Колесо обозрения - Прокатиться", nil, 2, executeAction, nil, true, false) -- 30
	defaultActions[31] = createAction("Колесо обозрения - Покинуть", nil, 2, executeAction, nil, true, false) -- 31
	defaultActions[41] = createAction("Бизнес - Забрать выручку", nil, 2, executeAction, nil, true, false) -- 41
	defaultActions[42] = createAction("Здание - Войти в букмекерскую контору", nil, 2, executeAction, nil, true, false) -- 42
	defaultActions[44] = createAction("Военный груз - Украсть", nil, 2, executeAction, nil, true, false) -- 44
	defaultActions[45] = createAction("Военный груз - Вернуть ящик", nil, 2, executeAction, nil, true, false) -- 45
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[45], polGrp) end
	defaultActions[46] = createAction("Выдача снаряжения - Получить", nil, 2, executeAction, nil, true, false) -- 46
	defaultActions[48] = createAction("Продавец - Купить лотерейный билет", nil, 2, executeAction, nil, true, false) -- 48
	defaultActions[50] = createAction("Туториал - {tutorialname}", nil, 2, executeAction, nil, true, false) -- 50
	defaultActions[51] = createAction("Работа - Установить тариф", nil, 2, executeAction, { "Тариф" }, false, true, false) -- 51
	defaultActions[52] = createAction("Службы - Заказать такси", nil, 1, executeAction, nil, true, true, true) -- 52
	defaultActions[53] = createAction("Модерация - Кикнуть игрока", nil, 4, executeAction, { "Игрок", "Причина" }, true, true, true) -- 53
	defaultActions[54] = createAction("Модерация - Забанить игрока", nil, 4, executeAction, { "Игрок", "Причина", "Время(кол-во часов)" }, true, true, true) -- 54
	defaultActions[55] = createAction("Игрок - Дать деньги", nil, 1, executeAction, { "Игрок", "Кол-во" }, true, true, true) -- 55
	defaultActions[56] = createAction("Модерация - Пожаловаться на игрока", nil, 3, executeAction, { "Игрок", "Причина" }, true, true, true) -- 56
	defaultActions[58] = createAction("Бой лоурайдеров - Начать", nil, 2, executeAction, nil, false, true, false) -- 58
	defaultActions[59] = createAction("Бой лоурайдеров - Покинуть", nil, 2, executeAction, nil, true, true, true) -- 59
	defaultActions[60] = createAction("Транспорт - Открыть/закрыть багажник", nil, 2, executeAction, nil, true, false) -- 60(60, 61)
	defaultActions[62] = createAction("Транспорт - Взять из багажника {inventoryitem}", nil, 2, executeAction, nil, true, false) -- 62
	defaultActions[63] = createAction("Работа - Вызвать подкрепление", nil, 2, executeAction, nil, true, true, true) -- 63
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[63], polGrp) end
	defaultActions[64] = createAction("Работа - Просмотреть доступные карьеры", nil, 1, executeAction, nil, true, true, true) -- 64
	defaultActions[65] = createAction("Модерация - Создать гонку", nil, 4, executeAction, { "ID гонки" }, true, true, true) -- 65
	defaultActions[66] = createAction("Игрок - Применить анимацию", nil, 1, executeAction, nil, true, false) -- 66
	defaultActions[67] = createAction("Игрок - Остановить анимацию", nil, 1, executeAction, nil, true, false) -- 67
	defaultActions[68] = createAction("RC - Уничтожить", nil, 2, executeAction, nil, false, true, false) -- 68
	defaultActions[69] = createAction("Продажа еды - Купить {foodname}(${foodprice})", nil, 2, executeAction, nil, true, false) -- 69
	defaultActions[70] = createAction("Дерби - Участвовать", nil, 2, executeAction, nil, true, false) -- 70
	defaultActions[71] = createAction("Модерация - Задать вопрос", nil, 3, executeAction, { "Вопрос" }, true, true, true) -- 71
	defaultActions[72] = createAction("Модерация - Просмотреть вопросы от игроков", nil, 4, executeAction, nil, true, true, true) -- 72
	defaultActions[73] = createAction("Бой лоурайдеров - Сделать ставку на {playername}", nil, 2, executeAction, { "Ставка" }, true, false) -- 73
	defaultActions[74] = createAction("Работа - Найти ближайшего преступника", nil, 2, executeAction, nil, true, true, true) -- 74
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[74], polGrp) end
	defaultActions[77] = createAction("Джетпак - Надеть/снять", nil, 1, executeAction, nil, true, false) -- 77(77, 78)
	defaultActions[81] = createAction("Донат - Активация", nil, 1, executeAction, nil, true, true, true) -- 81
	defaultActions[82] = createAction("GPS - Включить/выключить", nil, 1, executeAction, nil, true, true, true) -- 82
	defaultActions[83] = createAction("Клан - Создать(пропадёт уважение государства)", nil, 1, executeAction, { "Название", "Цвет" }, true, true, true) -- 83
	defaultActions[84] = createAction("База - Информация", nil, 2, executeAction, nil, true, false) -- 84
	defaultActions[85] = createAction("Клан - Открыть меню", nil, 1, executeAction, nil, true, false) -- 85
	defaultActions[86] = createAction("Приглашения - Вступить в клан {clanname}(пропадёт уважение государства)", nil, 2, executeAction, nil, true, true, true) -- 86
	defaultActions[87] = createAction("База - Открыть/закрыть ворота", nil, 2, executeAction, nil, true, false) -- 87
	defaultActions[88] = createAction("База - Взять деньги со склада(${basemoney})", nil, 2, executeAction, nil, true, false) -- 88
	defaultActions[89] = createAction("База - Положить деньги на склад", nil, 2, executeAction, nil, true, false) -- 89
	defaultActions[90] = createAction("База - Положить текущее оружие на склад", nil, 2, executeAction, { "Кол-во" }, true, false) -- 90
	defaultActions[91] = createAction("База - Взять с базы {baseweapon}({baseweaponamount})", nil, 2, executeAction, { "Кол-во" }, true, false) -- 91
	defaultActions[92] = createAction("База - Купить автомобиль(${basevehprice})", nil, 2, executeAction, nil, true, false) -- 92
	defaultActions[93] = createAction("База - Апгрейд автомобилей(${basevehupgradeprice})", nil, 2, executeAction, nil, true, false) -- 93
	defaultActions[94] = createAction("База - Взять с базы {baseitem}({baseitemamount})", nil, 2, executeAction, { "Кол-во" }, true, false) -- 94
	defaultActions[95] = createAction("Генератор - Включить/отключить", nil, 2, executeAction, nil, true, false) -- 95(95, 96)
	defaultActions[97] = createAction("База - Включить/отключить тревогу", nil, 2, executeAction, nil, true, false) -- 97(97, 98)
	defaultActions[99] = createAction("Клан - Начать захват базы", nil, 2, executeAction, nil, true, true, true) -- 99
	defaultActions[100] = createAction("База - Восстановить генератор(${generatorprice})", nil, 2, executeAction, nil, true, false) -- 100
	defaultActions[101] = createAction("База - Увеличить склад(${upgradeprice})", nil, 2, executeAction, nil, true, false) -- 101
	defaultActions[104] = createAction("Опрос - Пройти за вознаграждение", nil, 2, executeAction, nil, true, false) -- 104
	defaultActions[105] = createAction("Игрок - Выкинуть текущее оружие", nil, 1, executeAction, { "Кол-во" }, true, false) -- 105
	defaultActions[106] = createAction("Оружие - Подобрать {weaponname}", nil, 2, executeAction, nil, true, false) -- 106
	defaultActions[107] = createAction("Модерация - Просмотреть жалобы на игроков", nil, 4, executeAction, nil, true, true, true) -- 107
	defaultActions[108] = createAction("Транспорт - Тюнинг", nil, 2, executeAction, nil, false, true, false) -- 108
	defaultActions[109] = createAction("Цена за голову - Найти ближайшую жертву", nil, 1, executeAction, nil, true, true, true) -- 109
	defaultActions[110] = createAction("Безопасность - Присоединить аккаунт к данному устройству", nil, 3, executeAction, nil, true, true, true) -- 110
	defaultActions[111] = createAction("Безопасность - Отсоединить аккаунт от устройства", nil, 3, executeAction, nil, true, true, true) -- 111
	defaultActions[112] = createAction("Модерация - Проверить присоединенное устроиство аккаунта", nil, 4, executeAction, true, true, true) -- 112
	defaultActions[113] = createAction("Тригер - Открыть/Закрыть", nil, 2, executeAction, nil, true, false) -- 113
	defaultActions[114] = createAction("Игрок - Задать лицо персонажа", nil, 1, executeAction, { "PNG 256x256" }, true, true, true) -- 114
	defaultActions[115] = createAction("Игрок - Очистить лицо персонажа", nil, 1, executeAction, nil, true, true, true) -- 115
	defaultActions[116] = createAction("Работа - Предложить оплатить штраф {playername}", nil, 2, executeAction, nil, true, true, true) -- 116
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[116], polGrp) end
	defaultActions[117] = createAction("Мероприятие - Создать", nil, 2, executeAction, { "Название" }, true, true, true) -- 117
	defaultActions[118] = createAction("Мероприятие - Открыть меню", nil, 2, executeAction, nil, true, true, true) -- 118
	defaultActions[119] = createAction("Мероприятие - Начать приём участников", nil, 2, executeAction, nil, true, true, true) -- 119
	defaultActions[120] = createAction("Мероприятие - Старт", nil, 2, executeAction, nil, true, true, true) -- 120
	defaultActions[121] = createAction("Мероприятие - Рестарт", nil, 2, executeAction, nil, true, true, true) -- 121
	defaultActions[122] = createAction("Мероприятие - Закончить", nil, 2, executeAction, nil, true, true, true) -- 122
	defaultActions[123] = createAction("Мероприятие - Присоединиться к '{eventname}'", nil, 2, executeAction, nil, true, true, true) -- 123
	defaultActions[124] = createAction("Мероприятие - Сменить скин участника", nil, 2, executeAction, { "Игрок", "ID скина" }, true, true, true) -- 124
	defaultActions[125] = createAction("Фракция - Открыть меню", nil, 1, executeAction, nil, true, true, true) -- 125
	defaultActions[126] = createAction("Фракция - Назначить лидера", nil, 4, executeAction, { "Фракция", "Игрок" }, true, true, true) -- 126
	defaultActions[127] = createAction("Транспорт - Продать игроку", nil, 2, executeAction, { "Игрок", "Цена" }, true, false) -- 127
	defaultActions[128] = createAction("Дом - Продать игроку", nil, 2, executeAction, { "Игрок", "Цена" }, true, false) -- 128
	defaultActions[129] = createAction("Работа - Установить уровень розыска", nil, 2, executeAction, { "Имя", "Кол-во звезд", "Причина" }, true, true, true) -- 129
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[129], polGrp) end
	defaultActions[130] = createAction("Ограбление - Украсть {inventoryitem}", nil, 2, executeAction, nil, true, false) -- 130
	defaultActions[131] = createAction("Ограбление - Обыскать {containeritem}", nil, 2, executeAction, nil, true, false) -- 131
	defaultActions[133] = createAction("Модерация - Разбанить игрока", nil, 4, executeAction, { "Игрок" }, true, true, true) -- 133
	defaultActions[134] = createAction("Работа - Обыскать игрока {playername}", nil, 2, executeAction, nil, true, false) -- 134
	for _,polGrp in ipairs(policeGrps) do setActionAvailableToGroup(defaultActions[134], polGrp) end
	defaultActions[136] = createAction("Продавец - Купить {foodname}(${foodprice})", nil, 2, executeAction, nil, true, false) -- 136(10006)
end

function createAction(aName, aSource, aType, aFunc, aFuncInputs, outsideVehicle, insideVehicle, forPassengers)
	local newAction = {}
	local aMySource
	if aSource then
		aMySource = aSource
	else
		aMySource = getResourceName(resource)
	end
	newAction["name"] = aName
	newAction["type"] = aType
	newAction["function"] = aFunc
	newAction["functionSource"] = aSource
	newAction["functionInputs"] = aFuncInputs
	newAction["outsideVehicle"] = outsideVehicle
	newAction["insideVehicle"] = insideVehicle
	newAction["forPassengers"] = forPassengers
	table.insert(playerActions, newAction)
	return table.getn(playerActions)
end

function isActionAvailableTo(aId, aPlr)
	if not aId then
		return false
	end
	
	if not playerActions[aId] then
		return false
	end
	
	if not actionsAvailability[aId] then
		return true
	end
	local pGrp = getElementData(aPlr, "usergroup")
	
	for rId,rElem in ipairs(actionsAvailability[aId]) do
		if(isElement(rElem) and((rElem == aPlr) or (isPedInVehicle(aPlr, rElem))))
		
		or((not isElement(rElem)) and(pGrp == rElem)) then
			return true
		end
	end
	
	return false
end

function clearActionAvailableTo(aId)
	if not aId then
		return false
	end
	
	if not playerActions[aId] then
		return false
	end
	
	if actionsAvailability[aId] then
		actionsAvailability[aId] = nil
	end
	return true
end

function setActionAvailableTo(aId, aRule)
	if not aId then
		return false
	end
	
	if not playerActions[aId] then
		return false
	end
	
	if not actionsAvailability[aId] then
		actionsAvailability[aId] = {}
	end
	
	local correctRule = isElement(aRule)
	
	if correctRule then
		correctRule = (getElementType(aRule) == "player") or (getElementType(aRule) == "vehicle")
	
	else
		correctRule = (playerGroups[aRule] ~= nil)
	end
	
	if not correctRule then
		return false
	end
	
	table.insert(actionsAvailability[aId], aRule)
	return true
end

function attachActionToPosition(aId, aInt, aDim, aPosX, aPosY, aPosZ, aRadius)
	if not aId then
		return false
	end
	
	if not playerActionsLocal[aInt] then
		playerActionsLocal[aInt] = {}
	end
	
	if not playerActionsLocal[aInt][aDim] then
		playerActionsLocal[aInt][aDim] = {}
	end
	
	table.insert(playerActionsLocal[aInt][aDim], { aId, aPosX, aPosY, aPosZ, aRadius })
	return aInt, aDim, table.getn(playerActionsLocal[aInt][aDim])
end

function detachActionFromPosition(aId, aInt, aDim, aNumber)
	if not aId then
		return false
	end
	
	if not playerActionsLocal[aInt] then
		return false
	end
	
	if not playerActionsLocal[aInt][aDim] then
		return false
	end
	
	if not playerActionsLocal[aInt][aDim][aNumber] then
		return false
	end
	
	playerActionsLocal[aInt][aDim][aNumber] = nil
end

function getLocalActions(aPlr, aInt, aDim, aX, aY, aZ)
	local alist = {}
	local posX, posY, posZ
	
	if playerActionsLocal[-1] then
		if playerActionsLocal[-1][-1] then
			for aNumber,aInfo in pairs(playerActionsLocal[-1][-1]) do
				if(getDistanceBetweenPoints3D(aX,aY,aZ,aInfo[2],aInfo[3],aInfo[4]) <= aInfo[5] and isActionAvailableTo(aInfo[1], aPlr)) then
					table.insert(alist, aInfo[1])
				end
			end
		end
		
		if playerActionsLocal[-1][aDim] then
			for aNumber,aInfo in pairs(playerActionsLocal[-1][aDim]) do
				if(getDistanceBetweenPoints3D(aX,aY,aZ,aInfo[2],aInfo[3],aInfo[4]) <= aInfo[5] and isActionAvailableTo(aInfo[1], aPlr)) then
					table.insert(alist, aInfo[1])
				end
			end
		end
	end
	
	if playerActionsLocal[aInt] then
		if playerActionsLocal[aInt][-1] then
			for aNumber,aInfo in pairs(playerActionsLocal[aInt][-1]) do
				if(getDistanceBetweenPoints3D(aX,aY,aZ,aInfo[2],aInfo[3],aInfo[4]) <= aInfo[5] and isActionAvailableTo(aInfo[1], aPlr)) then
					table.insert(alist, aInfo[1])
				end
			end
		end
		
		if playerActionsLocal[aInt][aDim] then
			for aNumber,aInfo in pairs(playerActionsLocal[aInt][aDim]) do
				if(getDistanceBetweenPoints3D(aX,aY,aZ,aInfo[2],aInfo[3],aInfo[4]) <= aInfo[5] and isActionAvailableTo(aInfo[1], aPlr)) then
					table.insert(alist, aInfo[1])
				end
			end
		end
	end
	
	return alist
end

function getElementActions(aPlr, aElem)
	local alist = {}
	
	if playerActionsElement[aElem] then
		if(getElementInterior(aPlr) == getElementInterior(aElem))
		
		and(getElementDimension(aPlr) == getElementDimension(aElem)) then
			for aId in pairs(playerActionsElement[aElem]) do
				if isActionAvailableTo(aId, aPlr) then
					table.insert(alist, aId)
				end
			end
		end
	end
	return alist
end

function getSelfActions(aPlr)
	local alist = {}
	
	if playerActionsSelf[aPlr] then
		for aId in pairs(playerActionsSelf[aPlr]) do
			if isActionAvailableTo(aId, aPlr) then
				table.insert(alist, aId)
			end
		end
	end
	return alist
end

function attachActionToElement(aId, aElem)
	if not aId then
		return false
	end
	
	if not playerActionsElement[aElem] then
		playerActionsElement[aElem] = {}
	end
	playerActionsElement[aElem][aId] = true
end

function detachActionFromElement(aId, aElem)
	if not aId then
		return false
	end
	
	if playerActionsElement[aElem] then
		playerActionsElement[aElem][aId] = nil
	end
end

function attachActionToSelf(aId, aPlr)
	if not aId then
		return false
	end
	
	if not playerActionsSelf[aPlr] then
		playerActionsSelf[aPlr] = {}
	end
	playerActionsSelf[aPlr][aId] = true
end

function detachActionFromSelf(aId, aPlr)
	if not aId then
		return false
	end
	
	if playerActionsSelf[aPlr] then
		playerActionsSelf[aPlr][aId] = nil
	end
end

function clearActions(aElem)
	playerActionsSelf[aElem] = nil
	playerActionsElement[aElem] = nil
end

function clearActionsFromDestroyedElement()
	clearActions(source)
end

function playerPM()
	if not (isAdmin(source) or isModerator(source) or isHelper(source)) then
		cancelEvent()
	end
end

function weaponSwitch(prevWeapId, curWeapId)
	if isElement(source) and forbiddenWeapons[curWeapId] then
		takeWeapon(source, curWeapId)
		syncClientWeaponData(source)
	end
end

function getPlayerHouseInside(plr)
	return playersInsideHouses[plr]
end

function isHouseOwner(plr, hid)
	if not isElement(plr) then
		return false
	end
	
	if not houses[hid] then
		return false
	end
	return(houses[hid][11] == getHash(getPlayerName(plr)))
end

function furnitureGetSelected(plr)
	return playersSelectedFurniture[plr]
end

function furnitureSelect(plr, invId)
	if not isElement(plr) then
		return false
	end
	
	if not inventoryFurnitureItems[invId] then
		return false
	end
	
	if furnitureGetSelected(plr) then
		return false
	end
	local hid = getPlayerHouseInside(plr)
--	if not hid then
--		return false
--	end
	local itemInfo = inventoryItemNames[invId]
	
	if not itemInfo then
		return false
	end
	
	playersSelectedFurniture[plr] = invId
	triggerClientEvent(plr, "onPlayerFurnitureSelect", resourceRoot, itemInfo[3])
	return true
end

function furnitureAccept(plr, px, py, pz, rx, ry, rz)
	if not isElement(plr) then
		return false
	end
	
	local invId = furnitureGetSelected(plr)
	
	if not invId then
		return false
	end
	
	if not inventoryFurnitureItems[invId] then
		return false
	end
	
	local itemInfo = inventoryItemNames[invId]
	
	if not itemInfo then
		return false
	end
	
	local slotId = inventoryGetItemSlot(plr, invId)
	
	if not slotId then
		return false
	end
	
	local hid = getPlayerHouseInside(plr)
	
	if not hid then
		hid = 0
	end
	
	local int = getElementInterior(plr)
	local dim = getElementDimension(plr)
	
	if dbExec(db, "INSERT INTO furniture(hid,interior,dimension,item,x,y,z,rx,ry,rz) VALUES(?,?,?,?,?,?,?,?,?,?)", hid, int, dim, invId, px, py, pz, rx, ry, rz) then
		repeat
			dbq = dbQuery(db, "SELECT last_insert_id() AS id")
			dbqueryresult = dbPoll(dbq, 120000)
			dbFree(dbq)
		until dbqueryresult
		
		local furnId = dbqueryresult[1]["id"]
		inventoryRemoveItem(plr, slotId)
		local obj = createObject(itemInfo[3], px, py, pz, rx, ry, rz)
		setElementInterior(obj, int)
		setElementDimension(obj, dim)
		playersSelectedFurniture[plr] = nil
		spawnedFurniture[obj] = { furnId, invId, hid }
		triggerClientEvent(plr, "onPlayerFurnitureRemove", resourceRoot)
		
		return true
	end
	
	return false
end

function furnitureDecline(plr)
	if not isElement(plr) then
		return false
	end
	
	playersSelectedFurniture[plr] = nil
	triggerClientEvent(plr, "onPlayerFurnitureRemove", resourceRoot)
	return true
end

function furnitureTake(obj, plr)
	if not isElement(obj) then
		return false
	end
	
	local furniture = spawnedFurniture[obj]
	
	if not furniture then
		return false
	end
	
	local furnId = furniture[1]
	
	if not furnId then
		return false
	end
	
	local invId = furniture[2]
	
	if not invId then
		return false
	end
	
	local slotId
	
	if plr then
		if not isElement(plr) then
			return false
		end
		
		local hid = getPlayerHouseInside(plr)
		
		if hid and not isHouseOwner(plr, hid) then
			playerShowMessage(plr, "Вы не можете подбирать предметы, которые находятся в доме другого игрока.")
			return false
		end
		
		slotId = inventoryCheckForSlot(plr, invId)
		
		if not slotId then
			playerShowMessage(plr, "У вас нет места в инвентаре, чтобы подобрать предмет.")
			return false
		end
		
	end
	
	if dbExec(db, "DELETE FROM furniture WHERE id=?", furnId) then
		if slotId then
			inventoryNewItem(plr, invId, slotId)
		end
		spawnedFurniture[obj] = nil
		destroyElement(obj)
		return true
	end
	
	return false
end

function playerCmd(cmd)
	if not commandSpam[source] then
		commandSpam[source] = 1
	
	elseif commandSpam[source] == 5 then
		commandSpam[source] = 36
		cancelEvent()
		outputChatBox(generateTimeString().."RESPLAY: #FFFFFFОбнаружен спам! Необходимо немного подождать, прежде чем вы сможете снова пользоваться чатом и командами.", source, 255, 128, 0, true)
	
	elseif commandSpam[source] > 5 then
		cancelEvent()
	
	else
		commandSpam[source] = commandSpam[source] + 1
	end
end

function cmdSpamProc()
	for plr,cmdCount in pairs(commandSpam) do
		if isElement(plr) then
			if(cmdCount == 6) or (cmdCount == 1) then
				commandSpam[plr] = nil
			else
				commandSpam[plr] = cmdCount - 1
			end
		end
	end
end

adminCmds = {}

function loadAdminCmds()
	local rootNode = xmlLoadFile("admincmds.xml")
	local childNodes = xmlNodeGetChildren(rootNode)
	local nodeName, cmdName
	adminCmds = {}
	
	for _,childNode in ipairs(childNodes) do
		nodeName = xmlNodeGetName(childNode)
		if nodeName == "command" then
			cmdName = xmlNodeGetAttribute(childNode, "name")
			adminCmds[cmdName] = xmlNodeGetAttributes(childNode)
			addCommandHandler(cmdName, adminCmd, false, false)
		end
	end
	
	xmlUnloadFile(rootNode)
end

-- Название админ команд не менять :)
function adminCmd(plr, cmd, ...)
	local adminCmdInfo = adminCmds[cmd]
	
	if plr and adminCmdInfo then
		if((adminCmdInfo["level"] == "1") and(isAdmin(plr) or isModerator(plr) or isHelper(plr)))
		or((adminCmdInfo["level"] == "2") and(isAdmin(plr) or isModerator(plr)))
		or((adminCmdInfo["level"] == "3") and isAdmin(plr)) then
			loadstring("return adminCMD"..cmd)()(plr, unpack({...}))
		end
	end
end

function adminCMDkick(plr, nickname, ...)
	local kickPlr = findPlayerByNamePattern(nickname)
	local kickName = getPlayerName(kickPlr)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 53, { nickname, table.concat({...}, " ") })
	outputChatBox(generateTimeString().."KICK: "..kickName.." кикнут игроком "..getPlayerName(plr).." по причине "..table.concat({...}, " ").. ".", getRootElement(), 255, 0, 0)
end

function adminCMDban(plr, nickname, serial, hours, ...)
    banHours = tonumber(hours)
    local banTime = getTimeString(banHours*3600000, "v", true)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 54, { "serial", serial, table.concat({...}, " "), hours })
    if (banHours > 0) then
	    outputChatBox(generateTimeString().."BAN: "..nickname.." забанен игроком "..getPlayerName(plr).." по причине "..table.concat({...}, " ").. " на "..banTime..".", getRootElement(), 255, 0, 0)
	else
		outputChatBox(generateTimeString().."BAN: "..nickname.." забанен игроком "..getPlayerName(plr).." по причине "..table.concat({...}, " ").. " бессрочно", getRootElement(), 255, 0, 0)
	end
end


function adminCMDbanip(plr, ip, hours, ...)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 54, { "ip", ip, table.concat({...}, " "), hours })
end


function adminCMDbanaccount(plr, nickname, hours, ...)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 54, { "player", nickname, table.concat({...}, " "), hours })
end

function adminCMDunban(plr, serial)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 133, { "serial", serial })
end

function adminCMDunbanip(plr, ip)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 133, { "ip", ip })
end

function adminCMDunbanaccount(plr, nickname)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 133, { "player", nickname })
end

function adminCMDslap(plr, nickname)
	local slappedPlr = findPlayerByNamePattern(nickname)
	
	if isElement(slappedPlr) then
		local veh = getPedOccupiedVehicle(slappedPlr)
		
		if veh then
			setElementVelocity(veh, 0.0, 0.0, 0.5)
		else
			setElementVelocity(slappedPlr, 0.0, 0.0, 1.0)
		end
		
		triggerClientEvent(slappedPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." пнул вас")
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы пнули игрока "..getPlayerName(slappedPlr))
	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, slappedPlr)
	end
end

function adminCMDsetmoney(plr, nickname, newMoney)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local money = tonumber(newMoney)
		
		if not money then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Неправильно введено кол-во денег")
			return
		end
		
		local monPlr = getPlayerFromName(nickname)
		
		if monPlr and getElementData(monPlr, "spawned") then
			giveMoney(monPlr, money)
			triggerClientEvent(monPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." обновил вам кол-во денег")
		else
			dbExec(db, "UPDATE users SET money=? WHERE name=?", money, pHash)
		end
		
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили кол-вол денег на аккаунте "..nickname)
	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end
end

function adminCMDremovemoney(plr, nickname, newMoney)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local money = tonumber(newMoney)
		
		if not money then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Неправильно введено кол-во денег")
			return
		end
		
		local monPlr = getPlayerFromName(nickname)
		
		if monPlr and getElementData(monPlr, "spawned") then
			takeMoney(monPlr, money)
			triggerClientEvent(monPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." обновил вам кол-во денег")
		else
			dbExec(db, "UPDATE users SET money=? WHERE name=?", money, pHash)
		end
		
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили кол-вол денег на аккаунте "..nickname)
	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end
end

function adminCMDwarpto(plr, nickname)
	local warpPlr = findPlayerByNamePattern(nickname)
	
	if isElement(warpPlr) then
		local wint = getElementInterior(warpPlr)
		local wdim = getElementDimension(warpPlr)
		local pint = getElementInterior(plr)
		local pdim = getElementDimension(plr)
		
		if(wint ~= pint) or (wdim ~= pdim) or exports.freecam:isPlayerFreecamEnabled(warpPlr) or exports.freecam:isPlayerFreecamEnabled(plr) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "К данному игроку невозможно телепортироваться. Возможно, он находится в другом интерьере.")
			return
		end
		
		removePedFromVehicle(plr)
		local veh = getPedOccupiedVehicle(warpPlr)
		local warped = false
		
		if veh then
			for i=1,getVehicleMaxPassengers(veh)+1 do
				if not getVehicleOccupant(veh, i-1) then
					warpPedIntoVehicle(plr, veh, i-1)
					warped = true
					break
				end
			end
		end
		
		if not warped then
			local wx, wy, wz = getElementPosition(warpPlr)
			setElementGhostMode(plr, 3000)
			setElementPosition(plr, wx, wy, wz)
		end
		
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, warpPlr)
	end
end

function adminCMDwarp(plr, nickname)
	local warpedPlr = findPlayerByNamePattern(nickname)
	
	if isElement(warpedPlr) then
		local wint = getElementInterior(warpedPlr)
		local wdim = getElementDimension(warpedPlr)
		local pint = getElementInterior(plr)
		local pdim = getElementDimension(plr)
		
		if(wint ~= pint) or (wdim ~= pdim) or exports.freecam:isPlayerFreecamEnabled(warpedPlr) or exports.freecam:isPlayerFreecamEnabled(plr) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Данного игрока невозможно телепортировать. Возможно, он находится в другом интерьере.")
			return
		end
		
		removePedFromVehicle(warpedPlr)
		local veh = getPedOccupiedVehicle(plr)
		local warped = false
		
		if veh then
			for i=1,getVehicleMaxPassengers(veh) do
				if not getVehicleOccupant(veh, i-1) then
					warpPedIntoVehicle(warpedPlr, veh, i-1)
					warped = true
					break
				end
			end
		end
		
		if not warped then
			local wx, wy, wz = getElementPosition(plr)
			setElementGhostMode(warpedPlr, 3000)
			setElementPosition(warpedPlr, wx, wy, wz)
		end
		
		triggerClientEvent(warpedPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." телепортировал вас к себе")
	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, warpedPlr)
	end
end

function adminCMDjail(plr, nickname, secondsText, ...)
	local jailPlr = findPlayerByNamePattern(nickname)
	
	if isElement(jailPlr) then
		local arrested = getElementData(jailPlr, "arrested")
		
		if arrested and(arrested > 0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Этот игрок уже находится под арестом и освободится через "..getTimeString(arrested*1000, "r"))
			return
		end
		
		arrested = tonumber(secondsText)
		
		if(not arrested) or (arrested < 1.0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Количество секунд введено неверно")
			return
		end
		
		arrested = math.floor(arrested)
		
		if(arrested > 10800) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете назначить тюремный срок игроку дольше, чем 3 часов")
			return
		end
		
		local jailName = getPlayerName(jailPlr)
		
		if dbExec(db, "UPDATE users SET arrested=? WHERE name=?", arrested, getHash(jailName)) then
			local jailTime = getTimeString(arrested*1000, "v", true)
			setElementData(jailPlr, "arrested", arrested)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы посадили игрока "..jailName.." в тюрьму на "..jailTime)
			triggerClientEvent(jailPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." посадил вас в тюрьму на "..jailTime.." с причиной '"..table.concat({...}, " ").."'")
            outputChatBox(generateTimeString().."Администратор "..getPlayerName(plr).." посадил в тюрьму игрока "..jailName.. " по причине "..table.concat({...}, " ").. " на "..jailTime..".", getRootElement(), 255, 0, 0, true)
			spawnPlayerEx(jailPlr)
		end
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, jailPlr)
	end
end

function adminCMDrenameaccount(plr, nickname, newnick)
	local playerKick = getPlayerFromName(nickname)
	local oldHash = getHash(nickname)
	local newHash = getHash(newnick)
	
	repeat
		local dbq = dbQuery(db, "SELECT name FROM users WHERE name=?", newHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 2)
	
	elseif(oldHash == newHash) then
		triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 2)
	
	elseif dbExec(db, "UPDATE users SET name=? WHERE name=?", newHash, oldHash) then
		kickPlayer(playerKick, "Ник сменен. Перезайдите на сервер под новым никнеймом.")
        triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы изменили никнейм на аккаунте.")
		dbExec(db, "UPDATE friends SET friend=? WHERE friend=?", newnick, oldHash)
		
		for i,house in pairs(houses) do
			if(house[11] == oldHash) then
				houses[i][11] = newHash
			end
		end
		
		for i,frac in ipairs(fractions) do
			if(frac[3] == oldHash) then
				fractions[i][3] = newHash
			end
		end
		
		for i,lead in pairs(clanLeaders) do
			if(lead == oldHash) then
				clanLeaders[i] = newHash
			end
		end
		
		for i,leadArray in pairs(clanColeaders) do
			for i2,lead in ipairs(leadArray) do
				if(lead == oldHash) then
					clanColeaders[i][i2] = newHash
				end
			end
		end
		
	else
		triggerClientEvent(plr, "onChangeNicknameResult", resourceRoot, 3)
	end
end

function adminCMDunjail(plr, nickname)
	local unjailPlr = findPlayerByNamePattern(nickname)
	
	if isElement(unjailPlr) then
		local arrested = getElementData(unjailPlr, "arrested")
		local unjailName = getPlayerName(unjailPlr)
        arrested = 0
		
		if dbExec(db, "UPDATE users SET arrested=? WHERE name=?", arrested, getHash(unjailName)) then
			setElementData(unjailPlr, "arrested", arrested)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы выпустили игрока "..unjailName.." из тюрьмы")
			triggerClientEvent(unjailPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." выпустил вас из тюрьмы.")
			setElementPosition(unjailPlr, 1545.3, -1675.5, 13.5)
			setElementRotation(unjailPlr, 0.0, 0.0, 90.0)
			setElementDimension(unjailPlr, 0)
			setElementInterior(unjailPlr, 0)
		end
		
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, unjailPlr)
	end
end

function split(s, delimiter)
    result = {}
   
    for match in(s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
	
    return result
end

function adminCMDacc(plr, nickname)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local dbInfo = {}
		
		for key,info in pairs(dbqueryresult[1]) do
			dbInfo[key] = info
		end
		
		local infoPlr = getPlayerFromName(nickname)
		local plrSerial, plrIP, plrHp, plrArmor
		
		if infoPlr then
			plrSerial = getPlayerSerial(infoPlr)
			plrIP = getPlayerIP(infoPlr)
			plrHp = getElementHealth(infoPlr)
			plrArmor = getPedArmor(infoPlr)
		end
		
		local plrBans = resplayGetAllBans("player", nickname)
		local plrBansEx = resplayGetAllBans("ip", dbInfo["regip"])
		
		for _,curBan in ipairs(plrBansEx) do
			table.insert(plrBans, curBan)
		end
		
		plrBansEx = resplayGetAllBans("serial", dbInfo["serial"])
		
		for _,curBan in ipairs(plrBansEx) do
			table.insert(plrBans, curBan)
		end
		
		local plrBansCount = #plrBans
		local infoStr = "ID: "..tostring(pHash).."\r\nСтатус: "..(infoPlr and "онлайн" or "оффлайн").."\r\nПоследняя авторизация: "..timeToString(getRealTime(tonumber(dbInfo["lastLogin"]))).."\r\n"
		infoStr = infoStr.."IP при регистрации: "..dbInfo["regip"].."\r\nСерийный номер при регистрации: "..dbInfo["serial"].."\r\n"
		infoStr = infoStr.."Текущий IP: "..(plrIP or "нет").."\r\nПоследний использованный с/н: "..dbInfo["lastSerial"].."\r\n"
		
		if plrIP then
			infoStr = infoStr.."Аккаунтов с этим IP: "
			
			repeat
				local dbq = dbQuery(db, "SELECT COUNT(*) AS accCount FROM users WHERE regip=?", plrIP)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			infoStr = infoStr..dbqueryresult[1]["accCount"].."\r\n"
			
			if plrIP ~= dbInfo["regip"] then
				local plrBansEx = resplayGetAllBans("ip", plrIP)
				for _,curBan in ipairs(plrBansEx) do
					table.insert(plrBans, curBan)
				end
			end
			
		end
		
		if plrSerial then
			infoStr = infoStr.."Аккаунтов с этим с/н: "
			
			repeat
				local dbq = dbQuery(db, "SELECT COUNT(*) AS accCount FROM users WHERE serial=?", plrSerial)
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			infoStr = infoStr..dbqueryresult[1]["accCount"].."\r\n"
			
			if plrSerial ~= dbInfo["serial"] then
				plrBansEx = resplayGetAllBans("serial", plrSerial)
				for _,curBan in ipairs(plrBansEx) do
					table.insert(plrBans, curBan)
				end
			end
			
		end
		
		plrBansEx = nil
		infoStr = infoStr.."Уважение: "..string.format("%.2f", tonumber(dbInfo["respect"]) * 100.0).."%\r\nГруппа: "..playerGroups[tonumber(dbInfo["usergroup"])][1].."\r\n"
		infoStr = infoStr.."Фракция: "
		dbInfo["fraction"] = tonumber(dbInfo["fraction"])
		dbInfo["rank"] = tonumber(dbInfo["rank"])
		
		if dbInfo["fraction"] ~= 0 then
			repeat
				local dbq = dbQuery(db, "SELECT fractions.leader,fractions.ranks,COUNT(users.name) AS pCount FROM fractions JOIN users ON users.fraction=fractions.name WHERE fractions.name=?", dbInfo["fraction"])
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			local fId, fName = fractionGetFractionByHash(dbInfo["fraction"])
			local rName
			
			if(tonumber(dbqueryresult[1]["leader"]) == pHash) then
				rName = "Лидер"
			else
				rName = fractionGetRankName(fId, dbInfo["rank"]).."("..tostring(dbInfo["rank"]).."/"..tostring(dbqueryresult[1]["ranks"])..")"
			end
			
			infoStr = infoStr..tostring(fName).."\r\nРанг во фракции: "..rName.."\r\nИгроков во фракции: "..tostring(dbqueryresult[1]["pCount"]).."\r\n"
		else
			infoStr = infoStr.."нет\r\n"
		end
		
		infoStr = infoStr.."Клан: "
		dbInfo["clan"] = tonumber(dbInfo["clan"])
		
		if dbInfo["clan"] and(dbInfo["clan"] ~= 0) then
			repeat
				local dbq = dbQuery(db, "SELECT clans.name AS cName, COUNT(users.name) AS pCount FROM clans JOIN users ON users.clan=clans.id WHERE clans.id=?", dbInfo["clan"])
				dbqueryresult = dbPoll(dbq, 30000)
				dbFree(dbq)
			until dbqueryresult
			
			infoStr = infoStr..dbqueryresult[1]["cName"].."\r\nИгроков в клане: "..tostring(dbqueryresult[1]["pCount"]).."\r\nРанг в клане: "
			infoStr = infoStr..(((dbInfo["leader"] > 0) and "лидер") or ((dbInfo["coleader"] > 0) and "ко-лидер") or "рядовой").."\r\n"
		
		else
			infoStr = infoStr.."нет\r\n"
		end
		
		infoStr = infoStr.."Прокачка(здоровье): "..string.format("%.2f",(tonumber(dbInfo["maxhp"])-569.0) / (1000.0 - 569.0) * 100.0) .."%\r\n"
		infoStr = infoStr.."Прокачка(выносливость): "..string.format("%.2f", tonumber(dbInfo["stamina"]) / 1000.0 * 100.0) .."%\r\n"
		infoStr = infoStr.."Прокачка(вождение): "..string.format("%.2f", tonumber(dbInfo["driving"]) / 1000.0 * 100.0) .."%\r\n"
		infoStr = infoStr.."Прокачка(велосипед): "..string.format("%.2f", tonumber(dbInfo["cycling"]) / 1000.0 * 100.0) .."%\r\n"
		infoStr = infoStr.."Прокачка(мотоцикл): "..string.format("%.2f", tonumber(dbInfo["biking"]) / 1000.0 * 100.0) .."%\r\n"
		infoStr = infoStr.."Прокачка(воздушные ТС): "..string.format("%.2f", tonumber(dbInfo["flying"]) / 1000.0 * 100.0) .."%\r\n"
		infoStr = infoStr.."Сытость: "..string.format("%.2f", tonumber(dbInfo["hungry"]) * 100.0) .."%\r\n"
		infoStr = infoStr.."Питьё: "..string.format("%.2f", tonumber(dbInfo["thirst"]) * 100.0) .."%\r\n"
		infoStr = infoStr.."Здоровье: "..string.format("%.2f",(plrHp or tonumber(dbInfo["health"]))).."%\r\n"
		infoStr = infoStr.."Броня: "..string.format("%.2f",(plrArmor or tonumber(dbInfo["armor"]))).."%\r\n"
		infoStr = infoStr.."Кол-во денег: "..((plrMoney or tonumber(dbInfo["money"]))).."\r\n"
		infoStr = infoStr.."Баны: "
		
		if plrBansCount > 0 then
			infoStr = infoStr.."\r\n - "
			infoStr = infoStr..table.concat(plrBans, ";\r\n - ")
			infoStr = infoStr.."."
		else
			infoStr = infoStr.."отсутствуют"
		end
		
		--triggerClientEvent(plr, "onMessageBox", resourceRoot, infoStr, "info", "Аккаунт "..nickname)
		local infoTbl = split(infoStr, "\r\n")
		
		for _,infoStr in ipairs(infoTbl) do
			outputConsole(infoStr, plr)
		end
		
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Информация по аккаунту "..nickname.." выведена в консоль")
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end
end

function adminCMDrespect(plr, nickname, newRespect)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local respect = tonumber(newRespect)
		
		if not respect then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Неправильно введена репутация")
			return
		end
		respect = math.max(-1.0, math.min(1.0, respect/100.0))
		
		local respPlr = getPlayerFromName(nickname)
		
		if respPlr and getElementData(respPlr, "spawned") then
			respectSet(respPlr, respect, -1.0, 1.0)
			triggerClientEvent(respPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." обновил вам репутацию")
		
		else
			dbExec(db, "UPDATE users SET respect=? WHERE name=?", respect, pHash)
		end
		
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили репутацию на аккаунте "..nickname)
	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end
end

function adminCMDspec(plr, nickname)
	local specPlr = findPlayerByNamePattern(nickname)
	
	if not isElement(specPlr) then
		if nickname then
			triggerClientEvent(plr, "onServerMsgAdd", plr, specPlr)
			return
		
		else
			specPlr = plr
		end
	end
	
	local sx, sy, sz = getElementPosition(specPlr)
	setElementInterior(plr, getElementInterior(specPlr))
	setElementDimension(plr, getElementDimension(specPlr))
	
	if exports.freecam:isPlayerFreecamEnabled(plr) then
		exports.freecam:setPlayerFreecamDisabled(plr)
	
	else
		local px, py, pz = getElementPosition(plr)
		specStates[plr] = { px, py, pz, getElementInterior(plr), getElementDimension(plr), getPedOccupiedVehicle(plr), getPedOccupiedVehicleSeat(plr) }
		removePedFromVehicle(plr)
		setElementPosition(plr, 10000.0, 10000.0, 10000.0)
		setElementFrozen(plr, true)
	end
	
	exports.freecam:setPlayerFreecamEnabled(plr, sx, sy, sz)
end

function adminCMDspecoff(plr)
	if exports.freecam:isPlayerFreecamEnabled(plr) then
		local specState = specStates[plr]
		exports.freecam:setPlayerFreecamDisabled(plr)
		
		if specState then
			setElementPosition(plr, specState[1], specState[2], specState[3])
			--setElementInterior(plr, specState[4])
			--setElementDimension(plr, specState[5])
			
			if isElement(specState[6]) then
				warpPedIntoVehicle(plr, specState[6], specState[7])
			end
			
			specStates[plr] = nil
		
		else
			spawnPlayerEx(plr)
		end
		
		setTimer(setElementFrozen, 1000, 1, plr, false)
		setCameraTarget(plr)
	end
end

function adminCMDreports(plr)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 107)
end

function adminCMDquestions(plr)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 72)
end

function adminCMDsetleader(plr, nickname, ...)
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 126, { table.concat({...}, " "), nickname })
end

function adminCMDsethelper(plr, nickname)
	if not doesPlayerHaveRPName(nil, nickname) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Никнейм не соответствует шаблону 'Имя_Фамилия'")
		return
	end
	
	local aclHelper = aclGetGroup("Helper")
	
	if not aclHelper then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На сервере не настроена группа хелперов")
		return
	end
	
	local objName = "user."..nickname
	
	if isObjectInACLGroup(objName, aclHelper) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Хелпер с никнеймом "..nickname.." уже существует")
		return
	end
	
	aclGroupAddObject(aclHelper, objName)
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." добавлен в состав хелперов")
end

function adminCMDsetmoderator(plr, nickname)
	if not doesPlayerHaveRPName(nil, nickname) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Никнейм не соответствует шаблону 'Имя_Фамилия'")
		return
	end
	
	local aclModerator = aclGetGroup("Moderator")
	
	if not aclModerator then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На сервере не настроена группа модераторов")
		return
	end
	
	local objName = "user."..nickname
	
	if isObjectInACLGroup(objName, aclModerator) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Модератор с никнеймом "..nickname.." уже существует")
		return
	end
	
	aclGroupAddObject(aclModerator, objName)
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." добавлен в состав модераторов")
end

function adminCMDremovemoderator(plr, nickname)
	if not doesPlayerHaveRPName(nil, nickname) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Никнейм не соответствует шаблону 'Имя_Фамилия'")
		return
	end
	
	local aclModerator = aclGetGroup("Moderator")
	
	if not aclModerator then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На сервере не настроена группа модераторов")
		return
	end
	
	local objName = "user."..nickname
	
	if not isObjectInACLGroup(objName, aclModerator) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Модератора с никнеймом "..nickname.." не существует")
		return
	end
	
	aclGroupRemoveObject(aclModerator, objName)
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." убран из состава модераторов")
end

function adminCMDremovehelper(plr, nickname)
	if not doesPlayerHaveRPName(nil, nickname) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Никнейм не соответствует шаблону 'Имя_Фамилия'")
		return
	end
	
	local aclHelper = aclGetGroup("Helper")
	
	if not aclHelper then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "На сервере не настроена группа хелперов")
		return
	
	end
	local objName = "user."..nickname
	
	if not isObjectInACLGroup(objName, aclHelper) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Хелпера с никнеймом "..nickname.." не существует")
		return
	end
	
	aclGroupRemoveObject(aclHelper, objName)
	triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." убран из состава хелперов")
end

function adminCMDresetpass(plr, nickname, email)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT pass, email FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if not dbqueryresult[1] then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Игрок с никнеймом "..nickname.." не зарегистрирован на сервере")
		return
	end
	
	if email and(string.upper(dbqueryresult[1]["email"]) == string.upper(email)) and dbExec(db, "UPDATE users SET pass=0 WHERE name=?", pHash) then
		local passPlr = getPlayerFromName(nickname)
		
		if passPlr then
			kickPlayer(passPlr, plr, "Пароль сброшен. Перезайдите на сервер.")
		end
		
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы успешно сбросили пароль игроку "..nickname)	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Не удалось сбросить пароль игроку "..nickname..". Возможно, почта введена неправильно.")
	end

end

function adminCMDheal(plr, nickname)
	local healPlr = findPlayerByNamePattern(nickname)
	
	if isElement(healPlr) then
		setElementHealth(healPlr, 1000.0)
		local healVeh = getPedOccupiedVehicle(healPlr)
		
		if healVeh then
			local rx, ry, rz = getElementRotation(healVeh)
			
			if(rx > 90.0) and(rx < 270.0) or (ry > 90.0) and(ry < 270.0) then
				setElementRotation(healVeh, 0.0, 0.0, rz)
			end
			local hp = getElementData(healVeh, "hp")
			
			if hp then
				setElementHealth(healVeh, hp)
                setElementData(healVeh, "fuelLevel", 1.0)
				fixVehicle(healVeh)
			end
			
		end
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы полностью вылечили и починили транспорт игрока "..getPlayerName(healPlr))
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, healPlr)
	end

end

-- Команда на смену скинов (бандиты, бизнесмены и др)
function adminCMDsetfracskin(plr, nickname, newSkin)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local skin = tonumber(newSkin)
		local sknPlr = getPlayerFromName(nickname)
		setPedSkin(sknPlr, skin)
		triggerClientEvent(sknPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." обновил вам cкин")
		dbExec(db, "UPDATE users SET skin=?, fraction_skin=? WHERE name=?", skin, skin, pHash)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили скин на аккаунте "..nickname)	
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end

end

-- Команда на смену скина у гражданских.
function adminCMDsetdefskin(plr, nickname, newSkin)
	local pHash = getHash(nickname)
	
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local skin = tonumber(newSkin)
		local sknPlr = getPlayerFromName(nickname)
		setPedSkin(sknPlr, skin)
		triggerClientEvent(sknPlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." обновил вам cкин")
		dbExec(db, "UPDATE users SET skin=?, default_skin=? WHERE name=?", skin, skin, pHash)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили скин на аккаунте "..nickname)
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end

end

function adminCMDsetrace(plr, nickname, newRace)
	local pHash = getHash(nickname)
	repeat
		local dbq = dbQuery(db, "SELECT * FROM users WHERE name=?", pHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	
	if dbqueryresult[1] then
		local race = tonumber(newRace)
		dbExec(db, "UPDATE users SET race=? WHERE name=?", race, pHash)
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы обновили расу на аккаунте "..nickname)
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Аккаунт "..nickname.." не зарегистрирован на сервере")
	end

end

function adminCMDsetfraction(plr, nickname, ... )
    triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 700, { table.concat( {...}, " " ), nickname })
end

function adminCMDremovefraction(plr, nickname, ... )
    triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 701, { table.concat( {...}, " " ), nickname })
end

function adminCMDmute(plr, nickname, secondsText, ...)
	local mutePlr = findPlayerByNamePattern(nickname)
	
	if isElement(mutePlr) then
		local muted = getElementData(mutePlr, "muted")
		
		if muted and(muted > 0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Этому игрок уже замучен и мут будет снят через "..getTimeString(muted*1000, "r"))
			return
		end
		
		muted = tonumber(secondsText)
		
		if(not muted) or (muted < 1.0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Количество секунд введено неверно")
			return
		end
		
		muted = math.floor(muted)
		
		if(muted > 10800) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете выдать мут игроку больше, чем 3 часов")
			return
		end
		
		local muteName = getPlayerName(mutePlr)
		
		if dbExec(db, "UPDATE users SET muted=? WHERE name=?", muted, getHash(muteName)) then
			local muteTime = getTimeString(muted*1000, "v", true)
			setElementData(mutePlr, "muted", muted)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы выдали мут игроку "..muteName.." на "..muteTime)
			triggerClientEvent(mutePlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." выдал вам мут на "..muteTime.." с причиной '"..table.concat({...}, " ").."'")
            outputChatBox(generateTimeString().."Администратор "..getPlayerName(plr).." выдал мут игроку "..muteName.. " по причине "..table.concat({...}, " ").. " на "..muteTime..".", getRootElement(), 255, 0, 0, true)
			setPlayerMuted(mutePlr, true)
			exports.voice:setPlayerVoiceMuted(mutePlr, true)
		end
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, mutePlr)
	end
end

function adminCMDunmute(plr, nickname)
	local unmutePlr = findPlayerByNamePattern(nickname)
	
	if isElement(unmutePlr) then
		local muted = getElementData(unmutePlr, "muted")
		local unmutelName = getPlayerName(unmutePlr)
        muted = 0
		
		if dbExec(db, "UPDATE users SET muted=? WHERE name=?", muted, getHash(unmutelName)) then
			setElementData(unmutePlr, "muted", muted)
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы сняли мут игроку "..unmutelName)
			triggerClientEvent(unmutePlr, "onServerMsgAdd", plr, "Администратор "..getPlayerName(plr).." снял с вас мут")
			setPlayerMuted(unmutePlr, false)
			exports.voice:setPlayerVoiceMuted(unmutePlr, false)
		end
		
	else
		triggerClientEvent(plr, "onServerMsgAdd", plr, unmutePlr)
	end
end

function adminCMDahelp(plr)
	outputConsole("ДОСТУПНЫЕ АДМИН-КОМАНДЫ:", plr)
	for _,curCmd in pairs(adminCmds) do
		if curCmd["description"] then
			if((curCmd["level"] == "1") and(isAdmin(plr) or isModerator(plr) or isHelper(plr)))
			
			or((curCmd["level"] == "2") and(isAdmin(plr) or isModerator(plr)))
			
			or((curCmd["level"] == "3") and isAdmin(plr)) then
				outputConsole("  "..curCmd["description"], plr)
			end
		end
	end
end

--[[ ADMIN COMMANDS ( Админские комманды )
	/kick [часть ника] [причина] - Кикнуть игрока
	/ban [Никнейм] [Серийный номер] [часы] [причина] - Забанить игрока
	/banip [IP] [часы] [причина] - Забанить игрока по IP
	/banaccount [ник аккаунта] [часы] [причина] - Забанить аккаунт
	/unban [серийный номер] - Разбанить игрока
	/unbanip [IP] - Разбанить игрока по IP
	/unbanaccount [аккаунт игрока] - разбанить аккаунт игрока
	/slap [часть ника] - Пнуть игрока
	/warp [часть ника] - Переместить игрока к себе
	/warpto [часть ника] - Переместиться к игроку
	/jail [часть ника] [секунды] [причина] - Посадить игрока
	/acc [ник полностью] - Вывести информацию по аккаунту в консоль
	/respect [ник полностью] [проценты] - Установить уважение игроку
	/reports - Жалобы
	/questions - Вопросы
	/spec [часть ника] - Наблюдать за игроком
	/specoff - Выйти из наблюдения
	/setleader [ник полностью] [фракция] - Назначить лидера фракции
	/sethelper [ник полностью] - Назначить хелпера
	/removehelper [ник полностью] - Убрать хелпера
	/resetpass [ник полностью] - Сбросить пароль
	/heal [часть ника] - Починить транспорт и восполнить здоровье игрока
	/renameaccount [Старый никнейм] [новый никнейм] - Переименовать никнейм на аккаунте.
    /unjail [ник полностью] - Выпустить игрока из тюрьмы.
    /setmoney [кол-во денег] - Обновить кол-во денег игроку (дать кол-во денег, если игрок в онлайне)
    /removemoney [кол-во денег] - Обновить кол-во денег игроку (удалить кол-во денег, если игрок в онлайне)
    /removemoderator [ник полностью] - Убрать модератора
    /setmoderator [ник полностью] - Назначить модератора
    /setdefskin [ник] [ид скина] - Изменить скин на гражданский статус
	/setfracskin [ник] [ид скина] - Изменить фракционный скин (бандит, бизнесмен и др.)
	/setrace [ник] [ид] - изменить расу
	/setfraction [ник] [название фракции] - принять игрока во фракцию
    /removefraction [ник] - уволить игрока из фракции.
	/mute [ник] [секунды] [причина] - Выдать мут игроку (ограничить возможность чата)
	/unmute [ник] - Снять мут игроку
]]

mutedTime = nil

function updateMute()

	if not mutedTime then
		mutedTime = coroutine.create(mutefnc)
	end

	coroutine.resume(mutedTime)
end

function mutefnc()
	local allPlayers
	local muted

	while true do
		allPlayers = getElementsByType("player")

		for _,plr in ipairs(allPlayers) do
			muted = getElementData(plr, "muted")

			if muted and(muted > 0) then
				muted = math.max(0, muted-1)
				setElementData(plr, "muted", muted)
				dbExec(db, "UPDATE users SET muted=? WHERE name=?", muted, getHash(getPlayerName(plr)))

				if(muted <= 0) then
                    setPlayerMuted(plr, false)
					exports.voice:setPlayerVoiceMuted(plr, false)
					triggerClientEvent(plr, "onServerMsgAdd", plr, "Ваш срок мута истёк, с вас снят мут.")
				end

			end

		end

		coroutine.yield()
	end
end
function muteTimerCommand(plr)
	if isElement(plr) then
		local muted = getElementData(plr, "muted")
		
		if muted and(muted > 0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "С вас мут будет снят через "..getTimeString(muted*1000, "r"))
	    end
	end
end
addCommandHandler("mutetime", muteTimerCommand)

--Comamnd for show how long sit in jail (time).
function JailTimer(plr)
	if isElement(plr) then
		local arrested = getElementData(plr, "arrested")
		
		if arrested and(arrested > 0) then
			triggerClientEvent(plr, "onServerMsgAdd", plr, "Вам осталось сидеть в тюрьме "..getTimeString(arrested*1000, "r"))
	    end
	end
end
addCommandHandler("jailtime", JailTimer)


gender = 1
race = 1
------------ SKIN SELECTOR --------
function startSkinSelectorCamera(plr)
	--- Find gender ---
	local sHash = getHash(getPlayerName(plr))
	repeat
		dbq = dbQuery(db, "SELECT gender, race FROM users WHERE name=?", sHash)
		dbqueryresult = dbPoll(dbq, 30000)
		dbFree(dbq)
	until dbqueryresult
	gender = dbqueryresult[1]["gender"]
	race = dbqueryresult[1]["race"] + 1

	--- Start selection ---
	if (client) then
		setPedSkin(plr, playerGroups[1][2][race][gender][1])
		
        local px, py, pz = getElementPosition( plr )
        local rot = setPedRotation(plr, 1)
        setCameraMatrix(plr, px, py+4, pz, px, py, pz)
    end
end
addEvent("FrontCamera", true)
addEventHandler("FrontCamera", getRootElement(), startSkinSelectorCamera)

function skinSelected(plr)
    if (client) then
        fadeCamera(client, true)
        setCameraTarget(client, client)
		
		-- Change skin in the db
		local pHash = getHash(getPlayerName(plr))
		local skinId = getPedSkin(client)
		if dbExec(db, "UPDATE users SET skin=?, default_skin=?, skin_inited=1 WHERE name=?", skinId, skinId, pHash) then
			outputServerLog("RESPLAY: Player has changed his/her skin - "..accName)
		else
			outputServerLog("RESPLAY: Error while updaing a player info into database ("..accName..")")
		end
    end
end
addEvent("SkinSelected", true)
addEventHandler("SkinSelected", getRootElement(), skinSelected)

function skinRight()
	local skin = getPedSkin(client)
	local skinArray = playerGroups[1][2][race][gender]
	
	-- Next skin
	local nextSkin = indexOf(skinArray, skin)
	if (nextSkin ~= nil) and (nextSkin < table.getn(skinArray)) then
		nextSkin = skinArray[nextSkin + 1]
	else
		nextSkin = skinArray[1]
	end

	if client then
		setPedSkin(client, nextSkin)
    end
end
addEvent("SkinRight", true)
addEventHandler("SkinRight", getRootElement(), skinRight)

function skinLeft()	
	local skin = getPedSkin(client)
	local skinArray = playerGroups[1][2][race][gender]

	-- Previous skin
	local nextSkin = indexOf(skinArray, skin)
	if (nextSkin ~= nil) and (nextSkin > 1) then
		nextSkin = skinArray[nextSkin - 1]
	else
		nextSkin = skinArray[table.getn(skinArray)]
	end

	if (client) then
		setPedSkin(client, nextSkin)
    end
end
addEvent("SkinLeft", true)
addEventHandler("SkinLeft", getRootElement(), skinLeft)

----- indexOf for tables ----
function indexOf(t, object)
    if type(t) ~= "table" then error("table expected, got " .. type(t), 2) end

    for i, v in pairs(t) do
        if object == v then
            return i
        end
    end
end

function hasValueInTable(val, tab)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end
--------------

---- Position command ----
function savePos(player, command, ...)
    local x, y, z = getElementPosition(player)
    local rot = getPedRotation(player)
	local str = "x: " .. tostring(x) .. ", y: " .. tostring(y) .. ", z: " .. tostring(z) .. ", rot: " .. tostring(rot) .. " ";

	outputChatBox(str, source)
end
addCommandHandler("position", savePos)

--SaNews group init
function getSaNewsGrp()
	return { 18 }
end

function PlayerFromSaNews(plr)
	local plrGrp = getElementData(plr, "usergroup")
	local SaNewsg = getSaNewsGrp()
	
	if plrGrp then
		for _,SMIGrp in ipairs(SaNewsg) do
			if(SMIGrp == plrGrp) then
				return true
			end
		end
	end
	
	return false
end

saNewsPrice = 35 -- price for SaNews by command "/mm"

function gangAccept(plr) --(становление бандитом)
    local pGrp = getElementData(plr, "usergroup")
	if pGrp and (pGrp == 4) or PlayerFromSaNews(plr) or isPlayerFromPolice(plr) then
	    triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы не можете стать бандитом, когда состоите в гос.фракции.")
	elseif isPlayerBusy(plr) then
		triggerClientEvent(plr, "onServerMsgAdd", plr, "Закончите остальные дела, прежде чем стать бандитом.")
	else
        local respect = getElementData(plr, "respect")
        respectSet(plr, math.min(respect, -0.0001), -1.0, 1.0)
	    triggerClientEvent(plr, "onServerMsgAdd", plr, "Вы стали бандитом.")
	end
end

addEvent("onGangServerAccept", true)
addEventHandler("onGangServerAccept", root, gangAccept)

function playerDisconnectLocal(playerNick, reason) -- локальные сообщения о выходе из игры, работает если игрок в радиусе 60 метров.
	local players = getNearbyElementsByType(source, "player", 60.0)
	local connectStr = playerNick.." покинул игру. Причина: "..reason.." "
	local timeStr = generateTimeString()
	
	for _,plr in ipairs(players) do
		if(getPlayerName(plr) ~= playerNick) and not (isAdmin(plr) or isModerator(plr) or isHelper(plr)) then --  у админов и хелперов свои сообщения, у них показывает ип и серийник при выходе и распространяется на всю карту.
			outputConsole(connectStr, plr)
			outputChatBox(timeStr..connectStr, plr, 203, 14, 14)
		end
	end
	
end

--Покупка дома
function houseBuyGosAccept(plr, houseId)
	-- Триггер actionid == 1
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 1, { houseId })
end

addEvent("onHouseBuyGosAccept", true)
addEventHandler("onHouseBuyGosAccept", root, houseBuyGosAccept)

function houseBuyGosDecline(plr)
	triggerEvent("onPlayerChat", plr, "отказался от покупки дома.", 1)
	return false
end

addEvent("onHouseBuyGosDeclineServer", true)
addEventHandler("onHouseBuyGosDeclineServer", root, houseBuyGosDecline)

-- Продажа дома
function houseSellGosAccept(plr, houseId)
	-- Триггер actionid == 2 
	triggerEvent("onPlayerSelectAction", getResourceRootElement(getResourceFromName("resplay")), plr, 2, { houseId })
end

addEvent("onHouseSellGosAccept", true)
addEventHandler("onHouseSellGosAccept", root, houseSellGosAccept)

function houseSellGosDecline(plr)
	triggerEvent("onPlayerChat", plr, "отказался от продажи дома.", 1)
	return false
end

addEvent("onHouseSellGosDecline", true)
addEventHandler("onHouseSellGosDecline", root, houseSellGosDecline)

addEvent("onPlayerCheckIfRegistered", true)
addEvent("onPlayerReg", true)
addEvent("onPlayerGetHash", true)
addEvent("onPlayerGetAssigned", true)
addEvent("onRequestUserData", true)
addEvent("onRequestActionsList", true)
addEvent("onPlayerSelectAction", true)
addEvent("onJobTrashmasterTimesup", true)
addEvent("onJobTrashmasterGetMoney", true)
addEvent("onJobTrashmasterFilledMax", true)
addEvent("onJobTrashmasterLeftVehicle", true)
addEvent("onJobTrashmasterNowInVehicle", true)
addEvent("onJobWashroadsTimesup", true)
addEvent("onJobWashroadsLeftVehicle", true)
addEvent("onJobWashroadsNowInVehicle", true)
addEvent("onJobLawnmowDoneWithLawn", true)
addEvent("onJobLawnmowLeftVehicle", true)
addEvent("onJobLawnmowNowInVehicle", true)
addEvent("onJobLawnmowGrassPickedup", true)
addEvent("onJobEvacuatorFillAccept", true)
addEvent("onJobEvacuatorFillDecline", true)
addEvent("onJobEvacuatorFixAccept", true)
addEvent("onJobEvacuatorFixDecline", true)
addEvent("onJobEvacuatorLeftVehicle", true)
addEvent("onJobEvacuatorNowInVehicle", true)
addEvent("onJobTruckerLeftVehicle", true)
addEvent("onJobTruckerNowInVehicle", true)
addEvent("onJobTruckerTimesup", true)
addEvent("onFriendRequestAdd", true)
addEvent("onFriendDel", true)
addEvent("onAcceptFriendRequest", true)
addEvent("onJobTruckerFinish", true)
addEvent("onElementGhostMode", true)
addEvent("onCarTuneApplyUpgrade", true)
addEvent("onCarTuneRemoveUpgrade", true)
addEvent("onCarTuneExit", true)
addEvent("onCarTuneSetColor", true)
addEvent("onJobPoliceNewOrder", true)
addEvent("onInventoryUseSlot", true)
addEvent("onInventoryDropSlot", true)
addEvent("onAmmuBuyWeapon", true)
addEvent("onAmmuExit", true)
addEvent("onUniqueJumpSuccess", true)
addEvent("onRaceExit", true)
addEvent("onJobAmbulanceNewOrder", true)
addEvent("onJobAmbulanceAccept", true)
addEvent("onJobAmbulanceDecline", true)
addEvent("onJobFarmLeftVehicle", true)
addEvent("onJobFarmNowInVehicle", true)
addEvent("onJobFarm2LeftVehicle", true)
addEvent("onJobFarm2NowInVehicle", true)
addEvent("onPlayerShoot", true)
addEvent("onRacketFinish", true)
addEvent("onCarTuneBoost", true)
addEvent("onCarTuneArmor", true)
addEvent("onCarTuneFlyAbility", true)
addEvent("onMilitaryGeneralLeftVehicle", true)
addEvent("onMilitaryGeneralNowInVehicle", true)
addEvent("onMilitaryGeneralTimesup", true)
addEvent("onPedDamage", true)
addEvent("onJobTaxiLeftVehicle", true)
addEvent("onJobTaxiNowInVehicle", true)
addEvent("onFriendPMSend", true)
addEvent("onPlayerChangePassword", true)
addEvent("onJobTruckerFinishReturn", true)
addEvent("onTaxiAccept", true)
addEvent("onTaxiDecline", true)
addEvent("onLowriderAddScore", true)
addEvent("onHeaverDrop", true)
--addEvent("onPlayerDamage", true)
addEvent("onAnimPlay", true)
addEvent("onJobFoodLeftVehicle", true)
addEvent("onJobFoodNowInVehicle", true)
addEvent("onDerbyGo", true)
addEvent("onDerbyExit", true)
addEvent("onPlayerLoadFace", true)
addEvent("onPlayerCustomWalkSelect", true)
addEvent("onPlayerCustomFightSelect", true)
addEvent("onDonateActivate", true)
addEvent("onClanInvite", true)
addEvent("onClanSetColeader", true)
addEvent("onClanSetLeader", true)
addEvent("onClanLeave", true)
addEvent("onClanRemoveMember", true)
addEvent("onQueryAnswer", true)
addEvent("onClanBaseBuy", true)
addEvent("onClanBaseSell", true)
addEvent("onQuestionTake", true)
addEvent("onQuestionAnswer", true)
addEvent("onQuestionDeny", true)
addEvent("onFineAccept", true)
addEvent("onFineDecline", true)
addEvent("onSpecialEventCreateElement", true)
addEvent("onSpecialEventRemoveElement", true)
addEvent("onSpecialEventSetElementModel", true)
addEvent("onSpecialEventUpdateInfo", true)
addEvent("onFractionAddMember", true)
addEvent("onFractionUpgradeMember", true)
addEvent("onFractionDowngradeMember", true)
addEvent("onFractionAddRank", true)
addEvent("onFractionRemoveRank", true)
addEvent("onFractionRenameRank", true)
addEvent("onVehicleSellAccept", true)
addEvent("onVehicleSellDecline", true)
addEvent("onHouseSellAccept", true)
addEvent("onHouseSellDecline", true)
addEvent("onGangsterStealInterrupt", true)
addEvent("onChatBubbleChangeState", true)
addEvent("onPlayerChangeNickname", true)
addEvent("onPlayerLookAt", true)
addEvent("onDerbyLose")
addEvent("onGangsterStealInterruptCar", true)
addEvent("onPlayerFurnitureAccept", true)
addEvent("onPlayerFurnitureDecline", true)
addEvent("onWeaponDataReceive", true)
addEventHandler("onPlayerCheckIfRegistered", root, playerCheckIfRegistered)
addEventHandler("onPlayerReg", root, registerPlayer)
addEventHandler("onPlayerGetHash", root, getPlayerHash)
addEventHandler("onPlayerGetAssigned", root, getPlayerAssigned)
addEventHandler("onResourceStart", resourceRoot, resourceStart)
addEventHandler("onResourceStop", resourceRoot, resourceStop)
addEventHandler("onPlayerJoin", root, joinHandler)
addEventHandler("onRequestUserData", root, requestUserData)
addEventHandler("onRequestActionsList", root, requestActionsList)
addEventHandler("onPlayerSelectAction", resourceRoot, executeAction, false)
addEventHandler("onJobTrashmasterTimesup", root, jobTrashmasterTimesup)
addEventHandler("onJobTrashmasterGetMoney", root, jobTrashmasterGetMoney)
addEventHandler("onJobTrashmasterFilledMax", root, jobTrashmasterFilledMax)
addEventHandler("onJobTrashmasterLeftVehicle", root, jobTrashmasterLeftVehicle)
addEventHandler("onJobTrashmasterNowInVehicle", root, jobTrashmasterNowInVehicle)
addEventHandler("onJobWashroadsTimesup", root, jobWashroadsTimesup)
addEventHandler("onJobWashroadsLeftVehicle", root, jobWashroadsLeftVehicle)
addEventHandler("onJobWashroadsNowInVehicle", root, jobWashroadsNowInVehicle)
addEventHandler("onJobLawnmowDoneWithLawn", root, jobLawnmowDoneWithLawn)
addEventHandler("onJobLawnmowGrassPickedup", root, jobLawnmowGrassPickedup)
addEventHandler("onJobLawnmowLeftVehicle", root, jobLawnmowLeftVehicle)
addEventHandler("onJobLawnmowNowInVehicle", root, jobLawnmowNowInVehicle)
addEventHandler("onJobEvacuatorFillAccept", root, jobEvacuatorFillAccept)
addEventHandler("onJobEvacuatorFillDecline", root, jobEvacuatorFillDecline)
addEventHandler("onJobEvacuatorFixAccept", root, jobEvacuatorFixAccept)
addEventHandler("onJobEvacuatorFixDecline", root, jobEvacuatorFixDecline)
addEventHandler("onJobEvacuatorLeftVehicle", root, jobEvacuatorLeftVehicle)
addEventHandler("onJobEvacuatorNowInVehicle", root, jobEvacuatorNowInVehicle)
addEventHandler("onJobTruckerLeftVehicle", root, jobTruckerLeftVehicle)
addEventHandler("onJobTruckerNowInVehicle", root, jobTruckerNowInVehicle)
addEventHandler("onFriendRequestAdd", root, friendRequestAdd)
addEventHandler("onAcceptFriendRequest", root, friendRequestAccept)
addEventHandler("onFriendDel", root, friendDel)
addEventHandler("onJobTruckerFinish", root, jobTruckerFinish)
addEventHandler("onJobTruckerTimesup", root, jobTruckerTimesup)
addEventHandler("onVehicleStartEnter", root, vehicleStartEnter)
addEventHandler("onVehicleStartExit", root, vehicleStartExit)
addEventHandler("onCarTuneApplyUpgrade", root, carTuneApplyUpgrade)
addEventHandler("onCarTuneRemoveUpgrade", root, carTuneRemoveUpgrade)
addEventHandler("onCarTuneExit", root, carTuneExit)
addEventHandler("onCarTuneSetColor", root, carTuneSetColor)
addEventHandler("onInventoryUseSlot", root, inventoryUseSlot)
addEventHandler("onInventoryDropSlot", root, inventoryDropSlot)
addEventHandler("onPlayerWasted", root, playerWasted)
addEventHandler("onAmmuBuyWeapon", root, ammuBuyWeapon)
addEventHandler("onAmmuExit", root, ammuExit)
addEventHandler("onPlayerQuit", root, playerQuit)
addEventHandler("onPlayerChangeNick", root, function()
												cancelEvent()
											end)
addEventHandler("onUniqueJumpSuccess", root, uniqueJumpSuccess)
addEventHandler("onRaceExit", root, raceExit)
addEventHandler("onJobAmbulanceNewOrder", root, jobAmbulanceNewOrder)
addEventHandler("onJobAmbulanceAccept", root, jobAmbulanceAccept)
addEventHandler("onJobAmbulanceDecline", root, jobAmbulanceDecline)
addEventHandler("onJobFarmLeftVehicle", root, jobFarmLeftVehicle)
addEventHandler("onJobFarmNowInVehicle", root, jobFarmNowInVehicle)
addEventHandler("onJobFarm2LeftVehicle", root, jobFarm2LeftVehicle)
addEventHandler("onJobFarm2NowInVehicle", root, jobFarm2NowInVehicle)
addEventHandler("onPlayerShoot", root, playerShoot)
addEventHandler("onCarTuneBoost", root, carTuneBoost)
addEventHandler("onCarTuneArmor", root, carTuneArmor)
addEventHandler("onJobPoliceNewOrder", root, jobPoliceNewOrder)
addEventHandler("onCarTuneFlyAbility", root, carTuneFlyAbility)
addEventHandler("onMilitaryGeneralLeftVehicle", root, militaryGeneralLeftVehicle)
addEventHandler("onMilitaryGeneralNowInVehicle", root, militaryGeneralNowInVehicle)
addEventHandler("onMilitaryGeneralTimesup", root, militaryGeneralTimesup)
addEventHandler("onVehicleExplode", root, vehicleExplode)
addEventHandler("onPedDamage", root, pedDamage)
addEventHandler("onJobTaxiLeftVehicle", root, jobTaxiLeftVehicle)
addEventHandler("onJobTaxiNowInVehicle", root, jobTaxiNowInVehicle)
addEventHandler("onFriendPMSend", resourceRoot, friendPMSend)
addEventHandler("onPlayerChat", root, playerChat)
addEventHandler("onPlayerChangePassword", root, changePassword)
addEventHandler("onPlayerLogin", root, playerLogin)
addEventHandler("onPlayerLogout", root, playerLogout)
addEventHandler("onJobTruckerFinishReturn", root, jobTruckerFinishReturn)
addEventHandler("onTaxiAccept", root, jobTaxiAcceptClient)
addEventHandler("onTaxiDecline", root, jobTaxiDeclineClient)
addEventHandler("onLowriderAddScore", root, lowriderAddScore)
addEventHandler("onHeaverDrop", root, heaverDropCargo)
addEventHandler("onPlayerDamage", root, playerDamage)
addEventHandler("onAnimPlay", root, animPlay)
addEventHandler("onJobFoodLeftVehicle", root, jobFoodLeftVehicle)
addEventHandler("onJobFoodNowInVehicle", root, jobFoodNowInVehicle)
addEventHandler("onDerbyGo", root, derbyGo)
addEventHandler("onDerbyExit", root, derbyPlayerLose)
addEventHandler("onPlayerLoadFace", root, playerLoadFace)
addEventHandler("onPlayerCustomWalkSelect", resourceRoot, customWalkSelect, false)
addEventHandler("onPlayerCustomFightSelect", resourceRoot, customFightSelect, false)
addEventHandler("onDonateActivate", resourceRoot, activateDonate, false)
addEventHandler("onClanInvite", resourceRoot, clanInviteSend, false)
addEventHandler("onClanSetColeader", resourceRoot, clanSetColeader, false)
addEventHandler("onClanSetLeader", resourceRoot, clanSetLeader, false)
addEventHandler("onClanLeave", resourceRoot, clanLeave, false)
addEventHandler("onClanRemoveMember", resourceRoot, clanRemoveMember, false)
addEventHandler("onQueryAnswer", resourceRoot, queryAnswer, false)
addEventHandler("onClanBaseBuy", resourceRoot, clanBaseCheckBuy, false)
addEventHandler("onClanBaseSell", resourceRoot, clanBaseCheckSell, false)
addEventHandler("onQuestionTake", resourceRoot, questionTake, false)
addEventHandler("onQuestionAnswer", resourceRoot, questionAnswer, false)
addEventHandler("onQuestionDeny", resourceRoot, questionDeny, false)
--addEventHandler("onVehicleDamage", root, vehicleDamage)
addEventHandler("onFineAccept", root, fineAccept)
addEventHandler("onFineDecline", root, fineDecline)
addEventHandler("onVehicleEnter", root, vehicleEnter)
addEventHandler("onVehicleExit", root, vehicleExit)
addEventHandler("onSpecialEventCreateElement", resourceRoot, specialEventClientCreateElement, false)
addEventHandler("onSpecialEventRemoveElement", resourceRoot, specialEventClientRemoveElement, false)
addEventHandler("onSpecialEventSetElementModel", resourceRoot, specialEventSetElementModel, false)
addEventHandler("onSpecialEventUpdateInfo", resourceRoot, specialEventUpdateInfo, false)
addEventHandler("onFractionAddMember", resourceRoot, fractionClientAddMember, false)
addEventHandler("onFractionUpgradeMember", resourceRoot, fractionClientUpgradeMember, false)
addEventHandler("onFractionDowngradeMember", resourceRoot, fractionClientDowngradeMember, false)
addEventHandler("onFractionAddRank", resourceRoot, fractionClientAddRank, false)
addEventHandler("onFractionRemoveRank", resourceRoot, fractionClientRemoveRank, false)
addEventHandler("onFractionRenameRank", resourceRoot, fractionClientRenameRank, false)
addEventHandler("onPlayerConnect", root, playerConnect, false)
addEventHandler("onVehicleSellAccept", resourceRoot, vehicleSellAccept, false)
addEventHandler("onVehicleSellDecline", resourceRoot, vehicleSellDecline, false)
addEventHandler("onHouseSellAccept", resourceRoot, houseSellAccept, false)
addEventHandler("onHouseSellDecline", resourceRoot, houseSellDecline, false)
addEventHandler("onGangsterStealInterrupt", resourceRoot, gangsterStealInterrupt, false)
addEventHandler("onChatBubbleChangeState", resourceRoot, chatBubbleChangeState, false)
addEventHandler("onPlayerChangeNickname", resourceRoot, playerChangeNickname, false)
addEventHandler("onPlayerLookAt", resourceRoot, processLookPoint, false)
addEventHandler("onElementDestroy", root, clearActionsFromDestroyedElement)
addEventHandler("onPlayerSpawn", root, playerSpawn)
addEventHandler("onPlayerPrivateMessage", root, playerPM)
addEventHandler("onPlayerWeaponSwitch", root, weaponSwitch)
addEventHandler("onGangsterStealInterruptCar", root, gangsterStealInterruptCar)
addEventHandler("onPlayerModInfo", root, playerModInfo)
addEventHandler("onPlayerFurnitureAccept", resourceRoot, furnitureAccept, false)
addEventHandler("onPlayerFurnitureDecline", resourceRoot, furnitureDecline, false)
addEventHandler("onWeaponDataReceive", resourceRoot, receiveClientWeaponData, false)
--addEventHandler("onPlayerCommand", root, playerCmd)

addCommandHandler("a", chatCmdMessage, true, false) -- Admin command for announcements to global chat
addCommandHandler("do", chatCmdMessage, false, false) -- RP command
addCommandHandler("b", chatCmdMessage, false, false) --OOC Chat
addCommandHandler("mm", chatCmdMessage, false, false) --Command for SaNews status (СМИ). Writes text to global chat like as /a.
addCommandHandler("bt", chatCmdMessage, false, false) --OOC Chat in teamsay
addCommandHandler("try", chatCmdMessage, false, false) --RP Command for trying. 
--addCommandHandler("admins", outputAdmins, false, false) --cut command for show who is online from administrators.

setTimer(collectgarbage, 60000, 0, "collect")