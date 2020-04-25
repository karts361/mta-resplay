sW, sH = guiGetScreenSize()
scaleMult = sH/720.0
localCamera = getCamera()
firstTime = false
startSkinChosen = false
firstTimeTutorial = { "Введение", "BPpc92KssEM" }
accountPass = nil
introMusic = nil
tickStart = nil
loginWindowOpened = false
loginRegWin = nil
passLoginReg = nil
eMailLoginReg = nil
referrerLoginReg = nil
manRadioButton = nil
womanRadioButton = nil
lsRadioButton = nil
sfRadioButton = nil
lvRadioButton = nil
btnLoginReg = nil
msgLoginReg = nil
actionsList = nil
actionsMenuShow = false
actionsMenuAvailable = true
actionsMenuWin = nil
actionsMenuList = nil
actionsMenuBtnBack = nil
actionExtraParamsWin = nil
actionExtraParamsInputs = nil
actionExtraParamsBtnOK = nil
actionExtraParamsColorElem = nil
selAction = nil
debugGuiStr = nil
debugModeEnabled = false
drawNicknamesCol = nil

gameSoundVolume = 1.0

playerGroups = {
	{ "Гражданин", 255, 255, 255 },
	{ "Полицейский", 0, 0, 255 },
	{ "Пожарный", 255, 0, 0 },
	{ "Медик", 255, 255, 0 },
	{ "Военный", 0, 128, 0 },
	{ "Спортсмен", 255, 128, 0 },
	{ "Пилот", 128, 128, 255 },
	{ "Фермер", 0, 127, 127 },
	{ "Водитель", 100, 66, 255 },
	{ "Бандит", 128, 128, 128 },
	{ "Коммунальные службы", 255, 128, 114 },
	{ "Бомж", 84, 84, 84 },
	{ "Бизнесмен", 225, 225, 255 },
	{ "Спецназ", 0, 0, 255 },
	{ "Администрация", 255, 0, 0 },
	{ "Продавец", 255, 64, 16 },
	{ "ФБР", 39, 107, 235 },
	{ "СМИ", 0, 255, 147},
	{ "Bloods", 167, 0, 0},	
	{ "Crips", 1, 81, 136},
	{ "Latin Kings", 253, 182, 3},
	{ "MS-13", 0, 243, 224},
	{ "Хелпер", 255, 160, 160}
}

customDff = { -- { "Имя файла", { ID моделей через запятую } }
	{ "torus", { 2218 } },
	{ "polmav", { 447 } },
	{ "rhino", { 432 } },
	{ "hunter", { 425 } },
	{ "bandito", { 568 } },
	{ "hotknife", { 434 } },
	{ "patriot", { 470 } },
	{ "furn2", { 3967 } },
	{ "furn4", { 14771 } },
	{ "furn1", { 2147 } },
	{ "furn3", { 1780 } },
	{ "furn5", { 1990 } },
	{ "furn6", { 1610 } },
	{ "hp", { 14801 } },
	{ "dodo", { 593 } },
	{ "shamal", { 519 } },
	{ "fbicheetah", { 528 } },
	{ "FBI", { 5463} },
    { "landstalker", { 400 } },
    { "minigun", { 362 } },
	{ "micro_uzi", { 352 } },
	{ "sawnoff", { 350 } },
    { "python", { 348 } },
	{ "ak47", { 355 } },
	{ "sniper", { 358 } },
	{ "6490", { 14802 } },
	{ "14483", { 14483 } },
	{ "2656", { 3968 } },
	{ "camera", { 359 } },
	{ "door", { 1494 } },
	{ "machette", { 339 } },
	{ "9585", { 9585 } },
	{ "9", { 9 } },
	--{ "56", { 56 } },
	--{ "151", { 151 } },
	--{ "218", { 218 } },
	--{ "309", { 309 } },
	--{ "27", { 27 } },
	--{ "144", { 144 } },
	--{ "266", { 266 } },
	{ "145", { 145 } },
	--{ "39", { 39 } },
	--{ "38", { 38 } },
	--{ "31", { 31 } },
	--{ "53", { 53 } },
	{ "77", { 77 } },
	--{ "75", { 75 } },
	--{ "88", { 88 } },
	{ "62", { 62 } },
	{ "213", {213} },
	{ "129", {129} },
	{ "263", {263} },
	{ "tenpen", { 146 } },
	{ "14", { 14 } },
	{ "empty", { 5083 } },
	--{ "231", { 231 } },
	{ "182", { 182 } },
	{ "232", { 232 } },
	{ "197", { 197 } },
	{ "274", { 274 } },
	--{ "196", { 196 } },
	--банды
	{ "ballas1", { 102 } },
	{ "ballas2", { 103 } },
	{ "ballas3", { 104} },
    { "fam1", { 105 } },
    { "fam2", { 106 } },
	{ "fam3", { 107 } },
	{ "lsv1", { 108 } },
    { "lsv2", { 109 } },
	{ "lsv3", { 110 } },
	{ "sfr1", { 173 } },
	{ "sfr2", { 174 } },
	{ "sfr3", { 175 } },
--[[
	{ "stt_prop_track_bend_5d", { 2122 } },
	{ "stt_prop_track_bend_5d_bar", { 2123 } },
	{ "stt_prop_track_bend_15d", { 1683 } },
	{ "stt_prop_track_bend_15d_bar", { 1681 } },
	{ "stt_prop_track_bend_30d", { 2054 } },
	{ "stt_prop_track_straight_s", { 2064 } },
	{ "stt_prop_track_bend_180d", { 2237 } },
	{ "stt_prop_track_bend_180d_bar", { 2388 } },
	{ "stt_prop_track_bend_bar_l", { 2402 } },
	{ "stt_prop_track_bend_bar_l_b", { 2408 } },
	{ "stt_prop_track_bend2_l", { 2409 } },
	{ "stt_prop_track_bend2_l_b", { 2953 } },
	{ "stt_prop_track_block_01", { 2411 } },
	{ "stt_prop_track_block_02", { 3073 } },
	{ "stt_prop_track_block_03", { 3097 } },
	{ "stt_prop_track_chicane_l", { 3098 } },
	{ "stt_prop_track_chicane_l_02", { 3099 } },
	{ "stt_prop_track_chicane_r", { 3107 } },
	{ "stt_prop_track_chicane_r_02", { 3119 } },
	{ "stt_prop_track_cross", { 911 } },
	{ "stt_prop_track_cross_bar", { 913 } },
	{ "stt_prop_track_fork", { 1366 } },
	{ "stt_prop_track_fork_bar", { 1571 } },
	{ "stt_prop_track_funnel", { 1574 } },
	{ "stt_prop_track_link", { 1630 } },
	{ "stt_prop_track_start", { 1626 } },
	{ "stt_prop_track_start_02", { 1627 } },
	{ "stt_prop_track_straight_bar_l", { 2038 } },
	{ "stt_prop_track_straight_bar_m", { 2037 } },
	{ "stt_prop_track_straight_bar_s", { 3193 } },
	{ "stt_prop_track_straight_l", { 3927 } },
	{ "stt_prop_track_straight_lm", { 3926 } },
	{ "stt_prop_track_straight_lm_bar", { 14553 } },
	{ "stt_prop_track_straight_m", { 2669 } },
	{ "stt_prop_track_straight_s", { 2617 } },
]]
	{ "5403", { 1773 } },
	{ "5708", { 1777 } },
	{ "8035", { 1638 } },
	{ "8079", { 2144 } },
	{ "9593", { 2228 } },
	{ "road_lawn03", { 5707 } },
	{ "copcar", { 598 } },
	{ "polaris", { 604 } },
	{ "polaris_turbo", { 466 } },
	{ "deluxo", { 494 } },
	{ "cheetah", { 415 } },
	{ "hellraiser", { 556 } },
	{ "APC", { 413 } },
	{ "chopper", { 469 } },
	--{ "bfinject", { 604 } }, -- NEW YEAR
	--{ "swmo", { 310 } }, -- NEW YEAR
	--{ "swmotr2", { 311 } } -- NEW YEAR
	{ "BTOLAND8_LAS", { 4806 } },
	{ "LApedhusrea_LAs", { 4837 } },
	{ "lstrud_las", { 4895 } },
	{ "snpedland2_LAS", { 4859 } },
	{ "snpedteew3_LAS", { 4982 } },
	{ "TRNTRK5_LAS", { 4819 } },
	{ "154", { 154 } },
	{ "68", { 68 } },
	{ "90", { 90 } },
	{ "203", { 203 } },
	{ "87", { 87 } },
}

customTxd = { -- { "Имя файла", { ID моделей через запятую } }
    { "sniper", { 358 } },
	{ "torus", { 2218 } },
	{ "polmav", { 447 } },
	{ "rhino", { 432 } },
	{ "fbi", { 5463} },
	{ "fbicheetah", { 528} },
	{ "bandito", { 568 } },
	{ "hotknife", { 434 } },
	{ "hunter", { 425 } },
	{ "furn2", { 3967 } },
	{ "furn4", { 14771 } },
	{ "furn1", { 2147 } },
	{ "furn3", { 1780 } },
	{ "furn5", { 1990 } },
	{ "furn6", { 1610 } },
	--банды
	{ "ballas1", { 102 } },
	{ "ballas2", { 103 } },
	{ "ballas3", { 104} },
    { "fam1", { 105 } },
    { "fam2", { 106 } },
	{ "fam3", { 107 } },
	{ "lsv1", { 108 } },
    { "lsv2", { 109 } },
	{ "lsv3", { 110 } },
	{ "sfr1", { 173 } },
	{ "sfr2", { 174 } },
	{ "sfr3", { 175 } },
	--{ "mp", { 2617, 2122, 2123, 1683, 1681, 2054, 2064, 2237, 2388, 2402, 2408, 2409, 2953, 2411, 3073, 3097, 3098, 3099, 3107 , 3119, 911, 913, 1366, 1571, 1574, 1630, 1626, 1627, 2038, 2037, 3193, 3927, 3926, 14553, 2669 } },
	{ "5403", { 1773 } },
	{ "5708", { 1777 } },
	{ "8035", { 1638 } },
	{ "8079", { 2144 } },
	{ "9593", { 2228 } },
	{ "213", {213} },
	{ "129", {129} },
	{ "263", {263} },
	{ "copcarsa", { 596 } },
	{ "copcar", { 598 } },
	{ "polaris", { 604 } },
	{ "polaris_turbo", { 466 } },
	{ "cheetah", { 415 } },
	{ "deluxo", { 494 } },
	{ "hellraiser", { 556 } },
	{ "hp", { 14801 } },
	{ "APC", { 413 } },
    { "chopper", { 469 } },
    { "landstalker", { 400 } },
    { "minigun", { 362 } },
    { "micro_uzi", { 352 } },
	{ "sawnoff", { 350 } },
	{ "python", { 348 } },
	{ "ak47", { 355 } },
	{ "6490", { 14802 } },
	{ "14483", { 14483 } },
	{ "2656", { 3968 } },
    { "camera", { 359 } },
	{ "hp", { 1494 } },
	{ "machette", { 339 } },
	{ "ship_brijsfw", { 9585 } },
	--{ "bfinject", { 604 } }, -- NEW YEAR
	--{ "swmo", { 310 } }, -- NEW YEAR
	--{ "swmotr2", { 311 } } -- NEW YEAR
	{ "traintrack_las", { 4806 } },
	{ "traintrack_las", { 4837 } },
	{ "traintrack_las", { 4895 } },
	{ "traintrack_las", { 4859 } },
	{ "traintrack_las", { 4982 } },
	{ "traintrack_las", { 4819 } },
	{ "9", { 9 } },
	--{ "56", { 56 } },
	--{ "151", { 151 } },
	--{ "218", { 218 } },
	--{ "309", { 309 } },
	--{ "27", { 27 } },
	--{ "144", { 144 } },
	--{ "266", { 266 } },
	{ "145", { 145 } },
	--{ "39", { 39 } },
	--{ "38", { 38 } },
	--{ "31", { 31 } },
	--{ "53", { 53 } },
	{ "77", { 77 } },
	--{ "75", { 75 } },
	--{ "88", { 88 } },
	{ "62", { 62 } },
	{ "tenpen", { 146 } },
	{ "14", { 14 } },
	--{ "276", { 276 } },
	--{ "231", { 231 } },
	{ "182", { 182 } },
	{ "232", { 232 } },
	{ "275", { 275 } },
	{ "197", { 197 } },
	{ "154", { 154 } },
	{ "68", { 68 } },
	{ "90", { 90 } },
	{ "203", { 203 } },
	{ "87", { 87 } },
}
customCol = { -- { "Имя файла", { ID моделей через запятую } }
	{ "furn2", { 3967 } },
	{ "furn4", { 14771 } },
	{ "furn1", { 2147 } },
	{ "furn3", { 1780 } },
	{ "furn5", { 1990 } },
	{ "furn6", { 1610 } },
	{ "fbi", { 5463 } },
	{ "lasntrk1im03", { 5244 } },
	{ "hp", { 14801 } },
	{ "6490", { 14802 } },
	{ "14483", { 14483 } },
	{ "2656", { 3968 } },
	{ "door", { 1494 } },
	{ "9585", { 9585 } },
--[[
	{ "1", { 2122 } },
	{ "2", { 2123 } },
	{ "3", { 1683 } },
	{ "4", { 1681 } },
	{ "5", { 2054 } },
	{ "6", { 2064 } },
	{ "7", { 2237 } },
	{ "8", { 2388 } },
	{ "9", { 2402 } },
	{ "10", { 2408 } },
	{ "11", { 2409 } },
	{ "12", { 2953 } },
	{ "13", { 2411 } },
	{ "14", { 3073 } },
	{ "15", { 3097 } },
	{ "16", { 3098 } },
	{ "17", { 3099 } },
	{ "18", { 3107 } },
	{ "19", { 3119 } },
	{ "20", { 911 } },
	{ "21", { 913 } },
	{ "22", { 1366 } },
	{ "23", { 1571 } },
	{ "24", { 1574 } },
	{ "25", { 1630 } },
	{ "26", { 1626 } },
	{ "27", { 1627 } },
	{ "28", { 2038 } },
	{ "29", { 2037 } },
	{ "30", { 3193 } },
	{ "31", { 3927 } },
	{ "32", { 3926 } },
	{ "33", { 14553 } },
	{ "34", { 2669 } },
	{ "35", { 2617 } },
]]
	{ "5403", { 1773 } },
	{ "5708", { 1777 } },
	{ "8035", { 1638 } },
	{ "8079", { 2144 } },
	{ "9593", { 2228 } },
	--{ "elecfence_bar", { 987 } }
	{ "BTOLAND8_LAS", { 4806 } },
	{ "LApedhusrea_LAs", { 4837 } },
	{ "lstrud_las", { 4895 } },
	{ "snpedland2_LAS", { 4859 } },
	{ "snpedteew3_LAS", { 4982 } },
	{ "TRNTRK5_LAS", { 4819 } }
}

isOnJob = false
curJobId = nil
jobTimeCur = nil
jobTimer = nil
jobTimerGuiId = nil
jobStateCur = nil
jobTimerBackToVeh = nil
jobGuiTimerBackToVeh = nil
jobVehMarker = nil

jobTrashmasterFilled = nil
jobTrashmasterMaxFillness = nil
jobTrashmasterGuiFillId = nil

jobLawnmowPickupsMax = nil
jobLawnmowPickupsCur = nil
jobLawnmowCurLawnId = nil
jobLawnmowPickupTimer = nil
jobLawnmowPickups = {}
jobLawnmowPickupBlips = {}
jobEvacuatorFinishOrderWin = nil
jobEvacuatorFinishOrderBtnYes = nil
jobEvacuatorFinishOrderBtnNo = nil
jobEvacuatorFinishOrderLabel = nil
jobEvacuatorEvacId = nil
jobEvacuatorFinishOrderShow = false

jobTruckerFinishCp = nil
jobTruckerFinishBlip = nil
jobTruckerMoneyForDelivery = nil
jobTruckerRenderTargets = {}
jobTruckerAvailableTrucks = {}

jobGui = {}
jobGuiLogoW = scaleMult*47
jobGuiLogoH = scaleMult*20
jobGuiItemW = scaleMult*116
jobGuiItemH = scaleMult*26
jobGuiContW = scaleMult*60
jobGuiContH = scaleMult*20
jobGuiValueStr = nil

busStops = {}

curMsg = nil
msgQueue = {}
--msgTime = 7500

friends = nil
friendMarkers = {}
friendRequests = {}
friendsMenuShow = false
friendsMenuAvailable = true
friendsMenuWin = nil
friendsMenuInputAddFriend = nil
friendsMenuBtnAddFriend = nil
friendsMenuListFriends = nil
friendsMenuListFriendsColumn = nil
friendsMenuBtnDelFriend = nil
friendsMenuListRequests = nil
friendsMenuListRequestsColumn = nil
friendsMenuBtnRequestAccept = nil
friendsMenuBtnRequestDecline = nil
friendsMenuTabFriends = nil
friendsMenuTabRequests = nil

carSellAvailableCars = nil
carSellRenderTargets = {}

drawingFaces = {}

progressPopupMaxTime = 1000
progressPopupMaxHeight = 2.0
progressPopupTexPlus = dxCreateTexture("images/progress_plus.png")
progressPopupTexMinus = dxCreateTexture("images/progress_minus.png")
progressPopups = {}

misPassedGuiTime = 0
misPassedGuiDefaultTime = 6000

fuelRectW = scaleMult*40.0
fuelRectH = scaleMult*150.0
fuelIconW = scaleMult*32.0
fuelIconH = fuelIconW

attachedEffects = {}

luckyPhoneSound = nil
luckyPhoneObj = nil

carTuneWindowW = 230
carTuneWindowH = 605
carTuneBtnW = 220
carTuneBtnH = 20
carTuneNotBlocked = true
carTunePrice = nil
carTuneColorPrice = nil
carTuneColorNames = nil
carTuneColorId = 0
carTuneCompUpgrades = nil
carTuneUpgradePrices = nil
carTuneWindow = nil
carTuneGroupWindow = nil
carTuneColorWindow = nil
carTuneLabelColors = nil
carTuneBtnColorPrevs = nil
carTuneBtnColorNexts = nil
carTuneCurPJ = nil
carTuneBtns = nil
carTuneGroupBtns = nil
carTuneBtnColorSet = nil
carTuneBtnColorExit = nil
carTuneCurVeh = nil
carTuneCurUpgrades = nil
carTuneCurGroup = nil
carTuneCurColors = nil
carTuneMousePressed = false
carTuneMouseMoveStartX = nil
carTuneMouseMoveStartY = nil
carTuneCameraAngle = nil
carTuneCameraHeight = nil
carTuneVehX = nil
carTuneVehY = nil
carTuneVehZ = nil

carTunePaintjobs = {
    [483]=0,
    [534]=2,
    [535]=2,
    [536]=2,
    [558]=2,
    [559]=2,
    [560]=2,
    [561]=2,
    [562]=2,
    [565]=2,
    [567]=2,
    [575]=1,
    [576]=2
}

houseExitPickup = nil

inventoryAvailable = true
inventoryShown = false
inventoryWin = nil
inventorySlots = {}
inventoryBtnCancel = nil
inventorySlotWH = 64
inventorySlotsPerLine = 6
inventorySpaceBtwSlots = 10
inventorySlotsNum = 6
inventoryCancelBtnH = 25

inventorySellable = {
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

inventoryItems = {
	{ "Газировка Sprunk", "images/inv_sprunk.dds", 10 },
	{ "Канистра с топливом(+10%)", "images/inv_petrolcan.dds", 90 },
	{ "Бургер", "images/inv_burger.dds", 20 },
	{ "Пицца", "images/inv_pizza.dds", 25 },
	{ "Тортилья", "images/inv_chicken.dds", 25 },
	{ "Пиво", "images/inv_beer.dds", 10 },
	{ "Магнитола", "images/inv_boombox.dds", 100 },
	{ "Аптечка", "images/inv_health.dds", 500 },
	{ "Пончик", "images/inv_donut.dds", 20 },
	{ "Коробка с оружием", "images/inv_box.dds", 200 },
	{ "Орешки", "images/inv_nuts.dds", 5 },
	{ "RC Вертолёт", "images/inv_box.dds", 200 },
	{ "RC Автомобиль", "images/inv_box.dds", 200 },
	{ "RC Танк", "images/inv_box.dds", 200 },
	{ "RC Самолёт", "images/inv_box.dds", 200 },
	{ "Набор отмычек", "images/inv_jimmy.dds", 100 },
	{ "Ворованная игровая приставка", "images/inv_1719.dds", 50 },
	{ "Ворованный телевизор", "images/inv_1748.dds", 30 },
	{ "Ворованный телевизор", "images/inv_1749.dds", 45 },
	{ "Ворованная магнитола", "images/inv_2102.dds", 45 },
	{ "Ворованный телевизор", "images/inv_1752.dds", 45 },
	{ "Ворованная игровая приставка", "images/inv_1719.dds", 50 },
	{ "Ворованная магнитола", "images/inv_2103.dds", 75 },
	{ "Ворованный компьютер", "images/inv_2190.dds", 120 },
	{ "Ворованный телевизор", "images/inv_1792.dds", 200 },
	{ "Ворованный телефон", "images/inv_2967.dds", 200 },
	{ "Ворованный видеомагнитофон", "images/inv_1783.dds", 120 },
	{ "Ворованный телевизор", "images/inv_1518.dds", 100 },
	{ "Ворованный телевизор", "images/inv_1786.dds", 350 },
	{ "Ворованный телефон", "images/inv_2966.dds", 175 },
	{ "Ворованная магнитола", "images/inv_2226.dds", 150 },
	{ "Ворованная игровая приставка", "images/inv_2028.dds", 300 },
	{ "Ворованная аудиосистема", "images/inv_1809.dds", 300 },
	{ "Ворованный телевизор", "images/inv_1791.dds", 150 },
	{ "Ворованный видеомагнитофон", "images/inv_1785.dds", 130 },
	{ "Ворованный телевизор", "images/inv_2316.dds", 200 },
	{ "Ворованный телевизор", "images/inv_1781.dds", 120 },
	{ "Ворованный видеомагнитофон", "images/inv_1788.dds", 140 },
	{ "Ворованный видеомагнитофон", "images/inv_1782.dds", 200 },
	{ "Ворованный сейф", "images/inv_2332.dds", 500 },
	{ "Доска для серфинга", "images/inv_box.dds", 100 },
	{ "Доска для серфинга", "images/inv_box.dds", 110 },
	{ "Доска для серфинга", "images/inv_box.dds", 105 },
	{ "Доска для серфинга", "images/inv_box.dds", 115 },
	{ "Голова Оленя", "images/inv_box.dds", 50 },
	{ "Каска", "images/inv_box.dds", 10 },
	{ "Каска", "images/inv_box.dds", 10 },
	{ "Пепельница", "images/inv_box.dds", 2 },
	{ "Ковер-тигр", "images/inv_box.dds", 25 },
	{ "Баскетбольная корзина", "images/inv_box.dds", 55 },
	{ "Картина 'Сан Андреас'", "images/inv_box.dds", 10 },
	{ "Картина 'Грузовой док'", "images/inv_box.dds", 10 },
	{ "Картина 'Безумие'", "images/inv_box.dds", 10 },
	{ "Картина 'Общее начало'", "images/inv_box.dds", 10 },
	{ "Картина 'Пальмы'", "images/inv_box.dds", 10 },
	{ "Картина 'Кенди'", "images/inv_box.dds", 100 },
	{ "Картина 'Колор'", "images/inv_box.dds", 50 },
	{ "Баскетбольный мяч", "images/inv_box.dds", 25 },
	{ "Коврик коричневый", "images/inv_box.dds", 13 },
	{ "Коврик зеленый", "images/inv_box.dds", 13 },
	{ "Коврик бордовый", "images/inv_box.dds", 13 },
	{ "Коврик квадратный песочный", "images/inv_box.dds", 13 },
	{ "Коврик круглый песочный", "images/inv_box.dds", 13 },
	{ "Коврик грязно-коричневый", "images/inv_box.dds", 13 },
	{ "Коврик с орнаментом", "images/inv_box.dds", 13 },
	{ "Мячик для гольфа", "images/inv_box.dds", 5 },
	{ "Флаг USA", "images/inv_box.dds", 1 },
	{ "Флаг USA двойной", "images/inv_box.dds", 2 },
	{ "Ваза", "images/inv_box.dds", 5 },
	{ "Модель кораблика", "images/inv_box.dds", 7 },
	{ "Доска", "images/inv_box.dds", 500 },
	{ "Телевизор LD FATRON 190", "images/inv_box.dds", 900 },
	{ "Телевизор LD FATRON 80", "images/inv_box.dds", 400 },
	{ "Телевизор LD FATRON 133", "images/inv_box.dds", 550 },
	{ "Телевизор LD FATRON 600", "images/inv_box.dds", 2000 },
	{ "Телевизор SUNNY WISTRON 10", "images/inv_box.dds", 200 },
	{ "Телевизор SUNNY WISTRON 13", "images/inv_box.dds", 200 },
	{ "Телевизор MISUSISI OR 806", "images/inv_box.dds", 340 },
	{ "Телевизор MISUSISI OR 50", "images/inv_box.dds", 100 },
	{ "Parasanic MEGA D22", "images/inv_box.dds", 450 },
	{ "Sunny ES100", "images/inv_box.dds", 550 },
	{ "LD EVO 51", "images/inv_box.dds", 300 },
	{ "Sunny ES410", "images/inv_box.dds", 600 },
	{ "Приставка Pipboy", "images/inv_box.dds", 500 },
	{ "Приставка Super Playboy", "images/inv_box.dds", 500 },
	{ "Приставка Cjd 500", "images/inv_box.dds", 1000 },
	{ "Компьютер", "images/inv_box.dds", 1500 },
	{ "Радио Shark GF90", "images/inv_box.dds", 250 },
	{ "Радио Boomster OVB", "images/inv_box.dds", 300 },
	{ "Радио Boomster HOM", "images/inv_box.dds", 600 },
	{ "Радио Sunny Liberty CD", "images/inv_box.dds", 1000 },
	{ "Радио Hilips DOF33", "images/inv_box.dds", 700 },
	{ "Радио Sunny Mix3D", "images/inv_box.dds", 800 },
	{ "Радио Sunny Platinum", "images/inv_box.dds", 900 },
	{ "Радио Sunny BigStation", "images/inv_box.dds", 2000 },
	{ "Колонка Hilips", "images/inv_box.dds", 100 },
	{ "Колонка Sunny BigTech", "images/inv_box.dds", 300 },
	{ "Колонка Sunny MedTech", "images/inv_box.dds", 200 },
	{ "Колонка Shark Midi100", "images/inv_box.dds", 100 },
	{ "Колонка Shark Midi120", "images/inv_box.dds", 100 },
	{ "Ванна Fletis Ultra", "images/inv_box.dds", 300 },
	{ "Ванна Fletis Norma", "images/inv_box.dds", 200 },
	{ "Ванна Fletis Omega", "images/inv_box.dds", 400 },
	{ "Кабинка Fletis Nigma", "images/inv_box.dds", 340 },
	{ "Кабинка Fletis Dix", "images/inv_box.dds", 100 },
	{ "Раковина", "images/inv_box.dds", 30 },
	{ "Сейф", "images/inv_box.dds", 1000 },
	{ "Стиральная машинка", "images/inv_box.dds", 450 },
	{ "Микроволновка", "images/inv_box.dds", 150 },
	{ "Водяной куллер черный", "images/inv_box.dds", 500 },
	{ "Водяной куллер белый", "images/inv_box.dds", 500 },
	{ "Стойка низкая тип С", "images/inv_box.dds", 100 },
	{ "Стойка высокая тип С", "images/inv_box.dds", 1000 },
	{ "Столик бордовый", "images/inv_box.dds", 200 },
	{ "Обеденный стол", "images/inv_box.dds", 2000 },
	{ "Столик коричневый", "images/inv_box.dds", 200 },
	{ "Стол журнальный тип О", "images/inv_box.dds", 400 },
	{ "Стол обеденный складной", "images/inv_box.dds", 500 },
	{ "Стол журнальный", "images/inv_box.dds", 400 },
	{ "Стол мраморный", "images/inv_box.dds", 3000 },
	{ "Столик коричневый гладкий", "images/inv_box.dds", 200 },
	{ "Кухонная стойка, центр, черный", "images/inv_box.dds", 500 },
	{ "Столик овальный коричневый", "images/inv_box.dds", 110 },
	{ "Кухонная стойка, центр, белый", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, угол, белый", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, угол, хром", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, центр, хром", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, угол, черный", "images/inv_box.dds", 500 },
	{ "Витрина", "images/inv_box.dds", 700 },
	{ "Кухонная стойка, центр, камень", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, угол, камень", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, центр, камень", "images/inv_box.dds", 500 },
	{ "Столик стеклянный", "images/inv_box.dds", 400 },
	{ "Кухонная стойка, центр, плитка", "images/inv_box.dds", 500 },
	{ "ТВ стол из фанеры", "images/inv_box.dds", 230 },
	{ "Обеденный столик из фанеры", "images/inv_box.dds", 310 },
	{ "Обеденный стол из фанеры", "images/inv_box.dds", 350 },
	{ "Итальянский секретер", "images/inv_box.dds", 500 },
	{ "Тв стол из дуба", "images/inv_box.dds", 400 },
	{ "Кухонная стойка, витрина, красный", "images/inv_box.dds", 1000 },
	{ "Кухонная стойка, центр, красный", "images/inv_box.dds", 500 },
	{ "Стол из фанеры круглый", "images/inv_box.dds", 300 },
	{ "Тв столик из дуба", "images/inv_box.dds", 450 },
	{ "Квадратный столик", "images/inv_box.dds", 240 },
	{ "Длинный Тв стол", "images/inv_box.dds", 410 },
	{ "Кухонная стойка, середина, камень", "images/inv_box.dds", 500 },
	{ "Стол D-образный", "images/inv_box.dds", 310 },
	{ "Столик со стеклянной вставкой", "images/inv_box.dds", 245 },
	{ "Кофейный столик", "images/inv_box.dds", 320 },
	{ "Кухонная стойка, середина, красный", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, витрина, красный", "images/inv_box.dds", 500 },
	{ "Кухонная стойка, угол, красный", "images/inv_box.dds", 500 },
	{ "Круглый столик со стеклом", "images/inv_box.dds", 435 },
	{ "Квадратная Тв тумба", "images/inv_box.dds", 360 },
	{ "Пеленальный столик", "images/inv_box.dds", 80 },
	{ "Массивный Тв стол", "images/inv_box.dds", 500 },
	{ "Круглый каменный стол", "images/inv_box.dds", 1300 },
	{ "Обеденный дубовый столик", "images/inv_box.dds", 560 },
	{ "Складной овальный стол", "images/inv_box.dds", 350 },
	{ "Классический стол", "images/inv_box.dds", 750 },
	{ "Классический стол большой", "images/inv_box.dds", 1000 },
	{ "Кофейный столик", "images/inv_box.dds", 560 },
	{ "Дубовый кофейный столик", "images/inv_box.dds", 320 },
	{ "Масивный стол", "images/inv_box.dds", 1300 },
	{ "Кухоный уголок", "images/inv_box.dds", 4000 },
	{ "Кухонная стойка, угол, плитка", "images/inv_box.dds", 500 },
	{ "Круглый стол", "images/inv_box.dds", 430 },
	{ "Кухонная стойка, раздача, плитка", "images/inv_box.dds", 500 },
	{ "Стол круглый деревянный", "images/inv_box.dds", 380 },
	{ "Круглый сегментный стол", "images/inv_box.dds", 600 },
	{ "Кофейный стол", "images/inv_box.dds", 755 },
	{ "Обеденный сосновый стол", "images/inv_box.dds", 430 },
	{ "Барная стойка", "images/inv_box.dds", 4000 },
	{ "Сосновая стойка", "images/inv_box.dds", 300 },
	{ "Бильярдный стол", "images/inv_box.dds", 10000 },
	{ "Хай фай столик", "images/inv_box.dds", 300 },
	{ "Офисный стол", "images/inv_box.dds", 900 },
	{ "Ресепшн", "images/inv_box.dds", 6000 },
	{ "Круглый стеклянный столик", "images/inv_box.dds", 2000 },
	{ "Холодильник средний", "images/inv_box.dds", 470 },
	{ "Холодильник большой", "images/inv_box.dds", 2000 },
	{ "Холодильник спранк", "images/inv_box.dds", 1500 },
	{ "Кровать одноместная", "images/inv_box.dds", 150 },
	{ "Матрас", "images/inv_box.dds", 100 },
	{ "Белая кровать", "images/inv_box.dds", 340 },
	{ "Лава лампа", "images/inv_box.dds", 150 },
	{ "Ночник напольный", "images/inv_box.dds", 150 },
	{ "Ночник многонаправленный", "images/inv_box.dds", 170 },
	{ "Торшер", "images/inv_box.dds", 130 },
	{ "Офисный шкафчик", "images/inv_box.dds", 100 },
	{ "Офисный шкафчик зеленый", "images/inv_box.dds", 100 },
	{ "Офисный шкафчик двойной", "images/inv_box.dds", 180 },
	{ "Стеллаж", "images/inv_box.dds", 400 },
	{ "Офисный шкафчик металлик", "images/inv_box.dds", 100 },
	{ "Офисный шкаф", "images/inv_box.dds", 1200 },
	{ "Офисный стеллажик", "images/inv_box.dds", 450 },
	{ "Верстак", "images/inv_box.dds", 3000 },
	{ "Верстак открытый", "images/inv_box.dds", 3000 },
	{ "Книжный шкаф", "images/inv_box.dds", 500 },
	{ "Организация", "images/inv_box.dds", 500 },
	{ "Организация большая", "images/inv_box.dds", 500 },
	{ "Диван кож.зам.", "images/inv_box.dds", 230 },
	{ "Элитная кровать", "images/inv_box.dds", 5000 },
	{ "Бежевый диван", "images/inv_box.dds", 550 },
	{ "Бежевый диван", "images/inv_box.dds", 550 },
	{ "Бежевый диван большой", "images/inv_box.dds", 1200 },
	{ "Кожаный диван", "images/inv_box.dds", 780 },
	{ "Стул", "images/inv_box.dds", 120 },
	{ "Стул готический", "images/inv_box.dds", 670 },
	{ "Диван в клеточку", "images/inv_box.dds", 300 },
	{ "Диван коричневый", "images/inv_box.dds", 410 },
	{ "Кресло качалка", "images/inv_box.dds", 340 },
	{ "Красный барный стул", "images/inv_box.dds", 150 },
	{ "Кожаный барный стул", "images/inv_box.dds", 300 },
	{ "Сетчатый диван", "images/inv_box.dds", 550 },
	{ "Офисный стул", "images/inv_box.dds", 270 },
	{ "Кресло бежевое", "images/inv_box.dds", 200 },
	{ "Квадратное кресло", "images/inv_box.dds", 240 },
	{ "Садовый стул", "images/inv_box.dds", 20 },
	{ "Стриптиз стул", "images/inv_box.dds", 550 },
	{ "Дубовый стул", "images/inv_box.dds", 600 },
	{ "Дубовый стул высокий", "images/inv_box.dds", 650 },
	{ "Бабушкино кресло", "images/inv_box.dds", 110 },
	{ "Бурый диван", "images/inv_box.dds", 390 },
	{ "Садовый диван", "images/inv_box.dds", 455 },
	{ "Ресторанный стул", "images/inv_box.dds", 120 },
	{ "Рабочий стул без ручек", "images/inv_box.dds", 230 },
	{ "Рабочий стул", "images/inv_box.dds", 230 },
	{ "Большой бурый диван", "images/inv_box.dds", 710 },
	{ "Синий рабочий стул", "images/inv_box.dds", 230 },
	{ "Темно-синий рабочий стул", "images/inv_box.dds", 230 },
	{ "Стриптиз стул со спинкой", "images/inv_box.dds", 550 },
	{ "Бордовый стул", "images/inv_box.dds", 320 },
	{ "Офисное кресло", "images/inv_box.dds", 600 },
	{ "Гостевой диван", "images/inv_box.dds", 10000 },
	{ "Семейный набор", "images/inv_box.dds", 730 },
	{ "Серый диван", "images/inv_box.dds", 660 },
	{ "Офисное коричневое кресло", "images/inv_box.dds", 600 },
	{ "Элитное кресло", "images/inv_box.dds", 750 },
	{ "Стул руководителя", "images/inv_box.dds", 1300 },
	{ "Красный низкий барный стул", "images/inv_box.dds", 300 },
	{ "Диван из автомобиля", "images/inv_box.dds", 3400 },
	{ "Красный обеденный стул", "images/inv_box.dds", 150 },
	{ "Бордовое кресло", "images/inv_box.dds", 200 },
	{ "Кабинетное кресло", "images/inv_box.dds", 500 },
	{ "Бордовый диван", "images/inv_box.dds", 350 },
	{ "Кожанный пуфик", "images/inv_box.dds", 240 },
	{ "Дедушкино кресло", "images/inv_box.dds", 100 },
	{ "Кабинетный диван", "images/inv_box.dds", 1000 },
	{ "Бурый диван", "images/inv_box.dds", 600 },
	{ "Кожанный диван центр", "images/inv_box.dds", 1000 },
	{ "Кожанный диван угол", "images/inv_box.dds", 1000 },
	{ "Биван", "images/inv_box.dds", 300 },
	{ "Хромакей", "images/inv_box.dds", 4000 },
	{ "Холодильник", "images/inv_box.dds", 3000 },
	{ "Дешевая двухместная кровать", "images/inv_box.dds", 700 },
	{ "Дорогая ортопедическая кровать", "images/inv_box.dds", 2000 },
	{ "Дешевая одноместная кровать", "images/inv_box.dds", 500 },
	{ "Дорогая двухместная кровать", "images/inv_box.dds", 2000 },
	{ "Средняя ортопедическая кровать", "images/inv_box.dds", 1600 },
	{ "Средняя кровать двухместная", "images/inv_box.dds", 1200 },
	{ "Железная двухместная кровать", "images/inv_box.dds", 3000 },
	{ "Средняя девичья кровать", "images/inv_box.dds", 1100 },
	{ "Средняя девичья кровать + навес", "images/inv_box.dds", 1300 },
	{ "Кровать + шкаф", "images/inv_box.dds", 2000 },
	{ "Кровать из массива", "images/inv_box.dds", 3000 },
	{ "Наркотики", "images/drugs.png", 3000}
}

inventoryEmptyItem = { "Пусто", "images/inv_null.dds" }
inventorySelectedSlot = 0

ammuMenuOpened = false
ammuExit = nil
ammuSeller = nil
ammuWeapons = nil
ammuCurWeap = 1
ammuMenuW = 320
ammuMenuH = 42
ammuMenuPreview = nil
ammuMenuWin = nil
ammuMenuWpName = nil
ammuMenuWpNext = nil
ammuMenuWpPrev = nil
ammuMenuCancel = nil
ammuMenuBuy = nil

eatExit = nil
eatSeller = nil
eatAvailableFood = nil

uniqueJumps = {
	{1939.136,-1968.052,17.6649,2.5,2.728,3.17,1989.958,-1971.951,28.7249,11.134,5.398,7.23,1960.545,-1963.571,25.3229},
	{2209.275,-1843.686,19.0964,2.5,4.28,3.83,2215.124,-1889.359,17.7864,15.36,7.01,11.05,2203.34,-1861.524,21.8367},
	{1177.215,-1696.761,21.368,2.22,2.5,5.1,1177.972,-1626.719,32.8079,18.2,7.23,12.36,1182.92,-1659.431,29.1115},
	{2278.29,-1357.857,31.3255,2.5,2.5,3.96,2275.299,-1310.756,30.9555,10.69,2.5,9.36,2271.681,-1331.282,32.6621},
	{2335.351,-2163.947,18.5147,3.52,2.5,3.44,2344.419,-2178.703,24.2546,15.64,3.05,11.96,2336.89,-2190.321,22.4292},
	{2825.933,-1582.66,18.126,2.5,4.22,4.92,2787.504,-1569.318,27.776,2.704,19.16,14.15,2805.121,-1579.892,20.7985},
	{2460.177,-2567.911,18.8162,2.5,2.5,3.65,2464.206,-2597.455,25.8862,8.89,0.82,6.26,2454.878,-2593.787,23.9707},
	{1832.453,-2386.805,17.9247,2.5,2.5,3.01,1833.612,-2372.385,17.9247,6.57,0.5,6.65,1840.288,-2367.095,19.4731},
	{1839.745,-2514.477,16.1769,2.5,2.34,2.77,1921.679,-2517.896,20.6069,2.512,6.42,8.6999,1879.752,-2529.894,22.7841},
	{2634.397,-2107.984,17.0887,4.172,2.5,5.06,2595.646,-2109.055,25.7387,9.592,4.178,6.1,2608.7,-2117.174,21.6272},
	{2352.3,-1259.068,28.9962,2.5,2.5,2.76,2298.204,-1257.677,28.7062,2.62,20.04,9.96,2312.838,-1265.614,37.7793},
	{1013.163,-1270.362,24.4456,2.0,2.0,4.05,1045.359,-1273.475,32.9636,2.0,14.304,13.14,1037.356,-1264.502,25.3721},
	{-973.357,-223.2307,53.3717,5.35,29.1299,15.98,-1116.028,-211.0103,30.6016,49.9398,32.2599,27.0399,-1038.667,-187.1254,54.0},
	{-2637.069,780.3949,50.0166,6.76,2.52,9.29,-2639.577,733.2753,44.1565,9.91,2.52,9.29,-2633.359,757.9172,52.0809},
	{-2520.199,1169.203,59.5525,6.54,3.09,5.97,-2520.199,1202.12,53.4025,33.5399,6.21,17.66,-2513.778,1193.925,57.4115},
	{-1794.982,1211.612,35.6794,3.02,2.58,4.75,-1795.802,1258.197,32.5394,19.51,5.13,19.69,-1797.49,1238.395,37.9679},
	{-2659.551,1533.67,53.2004,2.5,2.62,4.73,-2659.551,1551.645,45.5003,7.26,11.79,18.54,-2658.426,1531.631,60.6476},
	{-1690.662,1110.392,57.2776,2.3,2.98,5.08,-1662.512,1110.392,57.2776,2.3,18.12,12.26,-1649.676,1114.14,50.8559},
	{-2145.461,-112.0259,44.3452,7.24,3.3,5.49,-2146.82,-89.4659,54.3752,4.36,3.3,14.28,-2141.051,-89.1471,45.6462},
	{-267.7739,2662.036,68.7405,3.53,4.02,6.0,-237.1135,2661.936,79.7505,7.28,12.06,8.14,-253.199,2654.016,72.7989},
	{-249.6904,2590.805,66.1194,3.68,2.96,3.96,-249.6904,2575.325,66.1194,12.66,5.21,9.68,-256.2141,2555.207,64.5246},
	{-871.5031,2308.79,164.5739,3.39,2.87,4.86,-981.079,2300.913,111.7538,18.77,40.02,69.5898,-905.3314,2315.064,163.7206},
	{2073.713,2366.653,50.8534,5.54,3.45,2.18,2050.73,2313.709,31.8133,29.69,11.19,26.09,2077.486,2318.872,26.9287},
	{2170.947,2402.609,62.2905,2.78,3.59,3.62,2183.67,2402.609,62.2905,4.92,9.2,9.8,2232.11,2387.587,50.9115},
	{2418.056,1353.234,12.3641,2.2,5.014,3.98,2481.923,1346.354,25.664,5.01,19.984,11.63,2462.313,1362.702,19.7672},
	{2407.308,1364.379,14.5734,5.16,2.72,6.0,2399.12,1386.524,25.4934,18.57,4.61,11.62,2412.772,1392.431,22.3043},
	{2784.763,2208.72,15.1934,3.05,1.76,4.33,2738.984,2208.72,21.8434,3.24,24.23,16.15,2758.656,2201.665,18.3639},
	{1482.383,2037.004,17.0576,2.09,2.69,5.58,1482.875,2077.978,23.8776,3.284,4.09,7.07,1489.125,2065.024,20.6514},
	{1976.397,2593.686,17.2126,3.67,2.0,5.44,2041.191,2593.686,30.4425,5.05,32.8,20.5,2007.676,2596.314,28.1338},
	{1636.264,2399.712,15.8903,2.5,2.5,5.08,1636.264,2449.071,15.8903,21.33,2.0,13.95,1642.17,2440.29,18.5118},
	{2119.23,2385.213,33.7094,2.1,3.36,2.6,2151.891,2385.601,30.8958,3.51,13.42,9.04,2128.102,2392.048,32.2357},
	{-2082.529,-2498.932,33.9682,2.34,2.4,3.55,-2110.031,-2479.709,40.8882,4.42,4.08,5.94,-2101.418,-2496.468,37.1704},
	{2112.408,97.9,39.993,5.64,10.28,8.05,2152.117,91.33,39.993,14.95,26.95,16.22,2149.933,76.6566,44.9509},
	{-2100.413,-1743.595,199.7312,2.94,4.27,4.96,-2082.491,-1718.923,199.7312,10.8,9.39,17.62,-2096.167,-1714.572,201.0246},
	{-2287.671,-2800.779,22.0541,5.81,13.66,5.57,-2255.133,-2800.779,22.0541,12.56,28.68,14.69,-2253.319,-2814.645,22.8247},
	{110.8902,2428.049,23.7936,3.58,3.15,4.2,132.64,2445.781,32.7336,4.38,16.62,15.35,119.7758,2449.64,27.7167},
	{-894.4963,2693.199,44.7303,3.58,2.63,2.44,-941.4026,2662.939,55.7302,29.14,16.02,19.74,-931.5991,2647.995,51.4501},
	{89.9936,-243.2046,7.5581,3.96,4.46,4.48,101.5435,-255.4345,7.5581,7.39,11.31,14.99,87.0604,-266.0403,9.8153},
	{160.7991,-160.2479,6.1453,2.12,1.452,2.23,171.8147,-162.405,12.321,2.0,7.2,7.18,183.2545,-151.314,13.5961},
	{-72.3,17.7,8.4132,2.81,2.4,4.48,-65.1154,35.7188,16.6432,7.71,2.0,7.27,-70.4781,55.8289,15.0868},
	{-39.7989,53.3007,6.9223,3.15,2.76,2.35,-36.4289,76.6106,6.9223,12.51,4.48,9.67,-42.5507,77.3671,7.8899},
	{638.7504,-520.0714,18.8519,2.0,2.15,2.34,639.8602,-545.0903,22.7619,10.97,3.01,8.26,629.1661,-542.9603,24.9594},
	{1749.723,779.6028,13.4757,1.68,2.616,2.164,1749.723,825.0914,14.2657,10.718,2.616,5.824,1744.046,799.4149,12.6554},
	{110.2446,-257.9929,6.2739,3.36,3.32,2.93,92.4846,-245.6928,11.0439,8.43,6.92,3.99,92.9552,-254.6195,10.1539},
	{2125.642,95.2542,37.3959,3.83,4.09,2.57,2098.51,99.5841,35.8559,3.83,8.46,5.72,2116.393,88.0306,40.2113},
	{-344.6466,-9.8812,44.9609,14.26,3.45,3.8,-336.1166,28.7688,37.7609,16.09,4.55,6.29,-358.2565,15.6353,41.7241},
	{-2589.18,1164.37,59.8256,2.84,2.77,2.23,-2567.125,1231.183,47.0362,18.9,9.04,6.05,-2576.06,1209.225,53.549},
	{-2292.044,1097.71,84.7347,2.082,2.074,2.02,-2350.591,1101.928,64.1846,4.522,14.204,9.03,-2323.731,1106.665,77.177},
	{-2408.285,723.2977,38.6835,2.62,2.5,1.69,-2408.285,723.2977,38.6835,22.41,2.58,4.06,-2407.981,716.5809,38.4334},
	{-2116.356,925.6832,87.819,2.68,1.99,2.48,-2069.565,925.433,76.689,2.68,15.26,14.46,-2085.629,935.5674,85.4677},
	{-1903.192,223.3468,37.7965,1.75,1.84,1.7,-1874.382,223.3467,42.4064,1.75,8.13,4.67,-1897.039,219.1329,39.911},
	{-1687.323,-162.201,17.8603,2.68,3.19,2.2,-1722.537,-126.391,14.9903,9.09,7.13,13.07,-1716.878,-142.6182,14.6114},
	{-1729.924,-364.5276,18.2246,2.268,2.51,2.148,-1777.487,-364.2776,17.9446,2.268,15.33,7.068,-1745.84,-355.4089,14.2197},
	{-1972.099,-543.0899,38.9862,1.96,2.01,1.77,-1912.318,-543.0899,45.3462,7.58,14.78,8.69,-1942.915,-539.1157,40.2453},
	{2770.214,-1177.477,70.7527,2.344,1.99,2.172,2814.468,-1182.996,55.7938,5.94,17.38,31.52,2766.031,-1184.692,74.9193},
	{2248.838,-2463.258,15.1049,5.18,2.26,2.59,2247.468,-2432.427,21.8068,12.44,2.26,9.32,2240.757,-2446.201,16.8109},
	{2248.832,-2627.623,15.1806,4.862,2.144,2.556,2248.832,-2655.498,21.2585,8.68,2.144,8.498,2237.695,-2650.768,16.3791},
	{2326.122,-1508.751,27.0066,2.242,1.728,2.08,2286.813,-1508.732,30.3748,3.86,9.38,8.99,2299.404,-1514.596,29.8683},
	{1623.574,-1110.956,61.8178,1.656,2.014,1.836,1623.574,-1079.265,61.8178,17.246,2.014,22.1459,1615.633,-1093.8,64.8724},
	{1679.646,-962.2209,65.6737,1.694,2.49,1.94,1679.646,-988.7401,65.6737,13.124,2.49,16.74,1683.881,-977.1464,65.7485},
	{1667.167,-992.8579,32.7591,6.32,3.768,2.48,1675.805,-1008.297,32.7591,18.7479,2.438,9.79,1689.156,-1013.63,35.6715},
	{347.0,-1662.299,35.8218,3.12,2.65,2.61,351.6596,-1700.264,35.8218,19.91,4.13,29.76,337.9746,-1676.993,36.7335},
	{743.1525,-1132.819,25.7991,1.834,3.606,2.35,710.0014,-1132.989,25.7991,1.834,11.096,10.0,717.1129,-1136.549,25.5161},
	{1395.562,-1460.566,12.3906,1.672,1.97,1.75,1402.96,-1447.466,17.7266,10.062,1.97,5.15,1395.023,-1450.836,17.1621},
	{1586.489,312.8876,23.9965,2.15,6.38,1.99,1540.208,325.3573,28.9665,2.15,32.8899,11.37,1562.912,331.3251,23.6496},
	{2058.1,-2677.517,15.4946,3.1,2.48,2.6,2009.261,-2677.517,20.8946,1.93,16.5499,11.26,2036.566,-2685.281,13.2053},
	{586.0102,-1773.769,15.2312,2.0,2.27,1.78,627.7189,-1781.119,22.6912,2.0,7.06,9.94,598.5319,-1778.481,17.0529},
	{2172.078,2430.507,61.747,2.12,3.3,2.35,2191.592,2436.304,53.057,2.5,12.57,25.22,2227.234,2436.885,37.788},
	{2176.133,2268.196,13.4683,2.286,1.934,1.938,2137.272,2268.246,16.7183,2.286,10.554,6.458,2148.601,2264.892,13.6634},
	{-2213.773,-311.0786,38.5339,1.15,3.04,2.59,-2213.773,-327.8282,44.6738,10.374,3.04,5.93,-2215.977,-325.7729,42.5119}
}

jumpIndex = nil
jumpSuccess = false

raceLobbyWinW = 400
raceLobbyWinH = 400
raceLobbyWin = nil
raceLobbyTime = nil
raceLobbyBtnCancel = nil
raceLobbyRacersList = nil
raceLobbyRacersClmnPos = nil
raceLobbyRacersClmnRacer = nil
raceLobbyRacersClmnVeh = nil
raceCurInfo = nil
raceCounter = nil
raceCounterColor = nil
raceLocalInfo = {}

curRespect = 0
respectDrawTime = 0
respectDrawStart = nil

saveHouseBlip = nil

--debugHouses = nil

ferrisWheelCamOffset = { -0.6, 0.0, 0.6 }
ferrisWheelObj = nil
ferrisWheelCamAngleZ = 270.0
ferrisWheelOldPos = {}

gangHelps = {}

otbExit = nil

militaryBaseAlarms = {}

fuelWarning = false

browserWin = nil
browserObj = nil
bW = 580*scaleMult
bH = 380*scaleMult
browserVideoId = nil
browserExitBtn = nil
browserExitBtnTime = 0

drunkLevel = 1

moneyChangeValue = "+0"
moneyChangeRenderTime = 0
moneyChangeColorR = 0
moneyChangeColorG = 255
moneyChangeColorB = 0

taxiCars = {}
taxiMapWin = nil
taxiMapList = nil
taxiSrc = nil
taxiMarker = nil
taxiBlip = nil
taxiLocations = {}

requestWin = nil
requestSrc = nil
requestDestroyTimer = nil

lowriderId = 0
lowriderMusicElements = {}
lowriderMusicInfo = nil
lowriderMusicMoveCur = 1
lowriderCameraTimer = nil
lowriderCameraCurrent = 1
lowriderCameraInfo = nil
lowriderMyScore = 0
lowriderEnemyScore = 0
lowriderHitAlpha = 0
lowriderHitColorR = 255
lowriderHitColorG = 255
lowriderHitColorB = 255
lowriderMyX = nil
lowriderMyY = nil
lowriderMyZ = nil
lowriderMyRX = nil
lowriderMyRY = nil
lowriderMyRZ = nil

attachedLights = {}

heaverText = "Q - Выбросить ящик"

workWin = nil

animMenu = nil
animShow = false
animList = nil

rcVehicle = nil
rcX = 0
rcY = 0
rcZ = 0

jobFoodVehicles = {}

derbyCountdownSec = 3
derbyLobbyWinW = 400
derbyLobbyWinH = 400
derbyLobbyWin = nil
derbyLobbyTime = nil
derbyLobbyBtnCancel = nil
derbyLobbyRacersList = nil
derbyLobbyRacersClmnPos = nil
derbyLobbyRacersClmnRacer = nil
derbyLobbyRacersClmnVeh = nil

trainElements = {}
trainRoutes = {}
trainSpeedFast = 0.3
trainSpeedSlow = 0.1
trainMsStop = 60000
trainTickLast = -1

crimeBlip = nil
crimeBlipTimer = nil

thinkBubbles = {}
thinkBubbleTime = 5000

flyAbilitySounds = {}

customWalkAnims = {
	{ "Бандит 2", 122 },
	{ "Бегущий трусцой", 125 },
	{ "Пьяница", 126 },
	{ "Слепой", 127 },
	{ "Спецназ", 128 },
	{ "Женская", 129 },
	{ "Шопоголик", 130 },
	{ "Бизнесвумен", 131 },
	{ "Красавица", 132 }
}
customWalkMenu = nil
customWalkList = nil

customFightAnims = {
	{ "По умолчанию", 4 },
	{ "Боксер", 5 },
	{ "Кун-фу", 6 },
	{ "Knee-head", 7 },
	{ "Grab-kick", 15 },
	{ "Драка локтями", 16 }
}

customFightMenu = nil
customFightList = nil

donateMenu = nil
donateList = nil
donateColumn = nil
donateLabel = nil

donateNames = {
	"Игровая валюта",
	"Реклама",
	"Лицо для персонажа",
	"Сохранение оружия после смерти",
	"Расширение инвентаря",
	"Увеличенный запас здоровья",
	"Спаун транспорта в любом месте [x10]",
	"Джетпак",
	"Выбор анимации ходьбы",
	"Огнеупорность",
	"Выбор стиля борьбы",
	"Уникальный автомобиль"
}

chatMsgs = {}
chatMsgClrBody = tocolor(64, 128, 255, 255)
chatMsgClrMeFunc = tocolor(228, 50, 255, 255)
chatMsgClrShadow = tocolor(0, 0, 0, 255)

gpsWin = nil
gpsList = nil
gpsBlip = nil
gpsMarker = nil

bots = nil
tutorialPositions = nil
botObjs = {}

clanMenu = nil
clanMenuPlrInput = nil
clanLabelLeader = nil
clanListColeaders = nil
clanListMembers = {}

clanInfoMembers = {}
clanInfoLeader = nil
clanInfoColeaders = {}

clanBaseConstructions = {}
clanBaseConstructionSound = "audio/construction.wav"
clanBaseGenerators = {}
clanBaseGeneratorSoundWork = "audio/genwork.wav"
clanBaseGeneratorSoundOn = "audio/genon.wav"
clanBaseGeneratorSoundOff = "audio/genoff.wav"

clanBaseAlarms = {}

clanBaseMenuWin = nil
clanBaseMenuBID = nil
clanBaseMenuPrice = nil

eventsLogWin = nil
eventsLogTbl = nil

queryWin = nil
queryId = nil
queryAnswerList = {}

reportWin = nil
reportList = nil

questionWin = nil
questionList = nil

answerWin = nil
answerQId = nil
answerMemo = nil

clrWin = nil
clrImg = nil
clrBtn = nil
clrSelX = 0
clrSelY = 0
clrSelR = 0
clrSelG = 0
clrSelB = 0
clrTex = nil

clanBaseCaptureInfo = nil

pickupTextArray = {}

policeMessages = {}

killOrderMarker = nil
killOrderTimer = nil

gangsterStealOpenTimeId = nil
gangsterStealOpenTimeMax = nil

chatBubbleOldState = false

eventModeOn = false

introCameras = {
	{ 1565.8000488281, -2188, 80.5, 1740.69812, -2339.38770, 23.6 },
	{ -1525.7, -409.7, 46.5, -1412.0, -296.7, 14.1 },
	{ 1752.4, 1422.4, 10.8, 1665.6, 1475.5, 10.8 }
}

skillsStatIds = {
	--[21] = { 1, 0, 1000 },
	[22] = { 2, 0, 1000 },
	--[23] = { 3, 0 },
	[24] = { 4, 569, 1000 },
	[160] = { 5, 0, 1000 },
	[230] = { 7, 0, 1000 },
	[229] = { 8, 0, 1000 },
	[169] = { 6, 0, 1000 }
}
skillsTex = nil
skillsStatNum = #skillsStatIds
skillsW = scaleMult*32.0
skillsH = skillsW
skillsArray = {}
skillsWTotal = 0
skillsY = sH-3.0*scaleMult-skillsH
skillsYTxt = skillsY-3.0*scaleMult
skillsStaminaLevel = 100.0
skillsStaminaBlocked = false

furnitureSelectedObj = nil
furnitureRot = 0.0
furnitureRotMult = 1.0
furnitureHeight = 0.0
furnitureHeightMult = 0.02

msgSounds = {
	["назначил за вашу голову награду"] = "priceonyourhead.wav",
	["сработала тревога"] = "alarm.wav",
	["Одна из ваших баз подверглась нападению"] = "alarm.wav",
	["Одна из ваших территорий подверглась нападению банды"] = "alarm.wav"
}

-- Render variables blob
local imgrot, rotdiff, px, py, pz, myx, myy, myz, pint, pdim, cint, cdim, imgx, imgy, imgz, imgdirx, imgdiry, popupsToDelete, tmpz, popupTime,
      cx, cy, cz, ex, ey, ez, emaxz, pixels, alphaLevel, progress, texToDraw, texCont, players, timeVal, timeMin, timeSec, artTex, drunkTex, startTex,
	  respectTex, fuelTex, curRespectStr, veh, vx, vy, vz, tx, ty, tz, dist, startX, startY, curW, curH, isTextDrawing, fuel, colorRectIn, puptext, pupx,
	  pupy, pupz, scrx, scry, iX, iY, iW, iH, selCircleTex, slotx, sloty, winx, winy, lineClr, numx, numy, slotName, myScoreText, enemyScoreText,
	  lowriderChitTex, lowriderUpTex, lowriderDownTex, lowriderLeftTex, lowriderRightTex, lowriderRingTex, imgName, mult, musicSeek, ctrlName, ctrlKeys,
	  correctKey, derbyCounterText, derbyCounterColor, pVehType, usergrp, pname, protected, grpstr, grpr, grpg, grpb, teamname, pwanted, wantedOnTex,
	  wantedOffTex, sound, vehSpeed, sampleRate, tempo, pitch, isReversed, pitchMult, plr, gx, gy, gz, statusStr, statusColorStr, captureInProc,
	  statusW, statusH, ownerR, ownerG, ownerB, clanR, clanG, clanB, teamsStr, teamsW, teamsH, timeW, timeH, playersNumStr, playersNumW, playersNumH,
	  rX, rY, rW, rH
	  
local dw, dh = 130, 20
carSellRenderH = 58
carSellRenderW = 240
carSellPhysicalH = 0.5
carSellPhysicalW = 2.067
numClr = tocolor(64,64,64,255)
numTxtClr = tocolor(255,255,255,255)
numWH = 18
-- End of render variables blob

---------------------------------------------------------------------------------------
--Слоты
function ToolTip(message)
	outputChatBox(message)
end

addEvent("ToolTip", true)
addEventHandler("ToolTip", root, ToolTip)

function onClientColShapeHit(thePlayer)
    if(thePlayer == getLocalPlayer()) then
        if(getElementData(source, "Casino")) then
            local dat = fromJSON(getElementData(source, "Casino"))
            
			if(dat[2] == "SLOT") then
                triggerEvent("ToolTip", localPlayer, "Однорукий бандит $"..dat[4].."\nНажми Enter чтобы сыграть")
                bindKey("enter", "down", PlayCasino) 
                ActionCasinoMarker = source

            end
        end
    end
end

addEventHandler("onClientColShapeHit", getRootElement(), onClientColShapeHit)

function PlayCasino(casino, game)
    triggerServerEvent("PlayCasino", localPlayer, localPlayer, getElementData(ActionCasinoMarker, "Casino"))
end

function RouletteKey(button, press)
    if(press) then
        if(button == "escape") then
            setPlayerHudComponentVisible("radar", true)
            RoulTick = {}
            RouletteInfo = {0,0,0}
            setCameraTarget(localPlayer)
            destroyElement(RouletteRing)
            destroyElement(RouletteLight)
            removeEventHandler("onClientKey", root, RouletteKey)
            removeEventHandler("onClientHUDRender", root, DrawRoulette)
            
            triggerServerEvent("EndRoulette", localPlayer, localPlayer)
            cancelEvent()

        elseif(button == "w") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "up")
            cancelEvent()
        
		elseif(button == "s") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "down")
            cancelEvent()
        
		elseif(button == "a") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "left")
            cancelEvent()
       
	    elseif(button == "d") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "right")
            cancelEvent()
        
		elseif(button == "enter") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "push")
		--[[elseif(button == "backspace") then
            triggerServerEvent("RouletteControl", localPlayer, localPlayer, "reduce")-]]
        end

    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------
function pedNfale() 
    local AllPeds = getElementsByType("ped") 
    
	for _, ped in ipairs(AllPeds) do 
        setPedVoice(ped, "PED_TYPE_DISABLED") 
    end
	
end

addEventHandler("onClientResourceStart", resourceRoot, pedNfale) 

function playSuccessMusic()
	setSoundVolume(playSFX("radio", "Beats", 9, false), gameSoundVolume)
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

_set_element_collidable_with = setElementCollidableWith
function setElementCollidableWith(theElement, withElement, enabled)
	if eventModeOn and(theElement == localPlayer) and(getElementType(withElement) == "player") and enabled then
		return _set_element_collidable_with(theElement, withElement, false)

	elseif getElementData(theElement, "noCollisions") then
		return _set_element_collidable_with(theElement, withElement, false)
	end

	return _set_element_collidable_with(theElement, withElement, enabled)
end

function wavelengthToRGBA(length)
	local r, g, b, factor

	if(length >= 380 and length < 440) then
		r, g, b = - (length - 440)/ (440 - 380), 0, 1

	elseif(length < 489) then
		r, g, b = 0,(length - 440)/ (490 - 440), 1

	elseif(length < 510) then
		r, g, b = 0, 1, - (length - 510)/ (510 - 490)

	elseif(length < 580) then
		r, g, b = (length - 510)/ (580 - 510), 1, 0

	elseif(length < 645) then
		r, g, b = 1, - (length - 645)/ (645 - 580), 0

	elseif(length < 780) then
		r, g, b = 1, 0, 0

	else
		r, g, b = 0, 0, 0
	end

	if(length >= 380 and length < 420) then
		factor = 0.3 + 0.7* (length - 380)/ (420 - 380)
	
	elseif(length < 701) then
		factor = 1
	
	elseif(length < 780) then
		factor = 0.3 + 0.7* (780 - length)/ (780 - 700)
	
	else
		factor = 0
	end
	
	return r*255, g*255, b*255, factor*255
end

function RGBToHex(red, green, blue, alpha)
	
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and(alpha < 0 or alpha > 255))) then
		return nil
	end
	
	if(alpha) then
		return string.format("%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	
	else
		return string.format("%.2X%.2X%.2X", red,green,blue)
	end
end

function getPlayersFromPartialName(name)
    name = string.lower(name)
	local players = {}
    
	if name then
        for _,player in ipairs(getElementsByType("player")) do
            if string.find(string.lower(getPlayerName(player)), name) then
                table.insert(players, player)
            end
        end
    end
	
	return players
end

function gpsInit()
	local wW = 320
	local wH = 365
	gpsWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "GPS", false)
	gpsList = guiCreateGridList(10, 25, 300, 300, false, gpsWin)
	local column = guiGridListAddColumn(gpsList, "Локация", 0.85)
	local row
	
	for _,loc in ipairs(taxiLocations) do
		row = guiGridListAddRow(gpsList)
		guiGridListSetItemText(gpsList, row, column, loc[1], false, false)
		guiGridListSetItemData(gpsList, row, column, loc[2])
	end
	
	guiGridListSetSortingEnabled(gpsList, false)
	addEventHandler("onClientGUIDoubleClick", gpsList, gpsSelect, false)
	local wBtn = guiCreateButton(wW/2-60, wH-30, 120, 20, "Отмена", false, gpsWin)
	addEventHandler("onClientGUIClick", wBtn, gpsClose, false)
	guiWindowSetMovable(gpsWin, false)
	guiWindowSetSizable(gpsWin, false)
	guiSetVisible(gpsWin, false)
end

function gpsOpen()
	if isElement(gpsMarker) then
		gpsTurnOff()
		msgAdd("GPS был отключён")
	
	elseif not guiGetVisible(gpsWin) then
		guiSetVisible(gpsWin, true)
		addCommandHandler("Select previous", gpsPrev)
		addCommandHandler("Select next", gpsNext)
		addCommandHandler("Accept", gpsSelect)
		addCommandHandler("Decline", gpsClose)
		showCursor(true)
	end
end

function gpsPrev()
	local row, clmn = guiGridListGetSelectedItem(gpsList)
	local maxRow = guiGridListGetRowCount(gpsList)
	row = math.min(maxRow-1, math.max(0, row-1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(gpsList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(gpsList, row, clmn)
end

function gpsNext()
	local row, clmn = guiGridListGetSelectedItem(gpsList)
	local maxRow = guiGridListGetRowCount(gpsList)
	row = math.min(maxRow-1, math.max(0, row+1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(gpsList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(gpsList, row, clmn)
end

function gpsSelect()
	local selectedRow, selectedCol = guiGridListGetSelectedItem(gpsList)
	
	if selectedRow and(selectedRow >= 0) then
		local posData = guiGridListGetItemData(gpsList, selectedRow, selectedCol)
		gpsClose()
		playSFX("genrl", 53, 7, false)
		local minDist, curDist
		local px, py, pz = getElementPosition(localPlayer)
		local minIndex = 0
		
		for i,pos in ipairs(posData) do
			if(minIndex == 0) then
				minDist = getDistanceBetweenPoints3D(px, py, pz, pos[1], pos[2], pos[3])
				minIndex = i
			else
				curDist = getDistanceBetweenPoints3D(px, py, pz, pos[1], pos[2], pos[3])
				if(minDist > curDist) then
					minDist = curDist
					minIndex = i
				end
			end
		end
		
		if(minIndex > 0) then
			local posDistX, posDistY, posDistZ = posData[minIndex][1], posData[minIndex][2], posData[minIndex][3]
			gpsTurnOff()
			gpsBlip = createBlip(posDistX, posDistY, posDistZ, 41, 2, 255, 255, 255, 255, 32767)
			gpsMarker = createMarker(posDistX, posDistY, posDistZ, "checkpoint", 15.0, 255, 0, 0, 128)
			addEventHandler("onClientMarkerHit", gpsMarker, gpsMarkerHit)
			msgAdd("Пункт назначения установлен на карте.")
		end
		
	end
end

function gpsMarkerHit(hitPlayer, matchingDimension)
	if(hitPlayer == localPlayer) and matchingDimension then
		msgAdd("Вы прибыли в пункт назначения.")
		gpsTurnOff()
	end
end

function gpsTurnOff()
	if isElement(gpsBlip) then
		destroyElement(gpsBlip)
	end
	
	if isElement(gpsMarker) then
		destroyElement(gpsMarker)
	end
	
end

function gpsClose()
	if guiGetVisible(gpsWin) then
		guiSetVisible(gpsWin, false)
		removeCommandHandler("Select previous", gpsPrev)
		removeCommandHandler("Select next", gpsNext)
		removeCommandHandler("Accept", gpsSelect)
		removeCommandHandler("Decline", gpsClose)
		checkCursor()
	end
end

function removeHex(text, digits)
    assert(type(text) == "string", "Bad argument 1 @ removeHex [String expected, got " .. tostring(text) .. "]")
    assert(digits == nil or (type(digits) == "number" and digits > 0), "Bad argument 2 @ removeHex [Number greater than zero expected, got " .. tostring(digits) .. "]")
    return string.gsub(text, "#" ..(digits and string.rep("%x", digits) or "%x+"), "")
end

function chatMsgAdd(timeStr, playerid, police, medic, soldier, fbi, sanews, isAdmin, isHelper, msg, isMeFunc, isRpFunc, isOOCfunc)
	local sendMsg = true
	local playerid = getElementData(source, "ID")
	
	if(source ~= localPlayer) then
		local sx, sy, sz = getElementPosition(source)
		local px, py, pz = getElementPosition(localPlayer)
		sendMsg = isLineOfSightClear(px, py, pz, sx, sy, sz, true, false, false, false, false, false, false)
				  or (getDistanceBetweenPoints3D(px,py,pz,sx,sy,sz) < 15.0)
	end
	
	if sendMsg then
		if(source ~= localPlayer) then
			chatMsgs[source] = { source, msg, getTickCount(), isMeFunc }
		end
		
		if isRpFunc then
			outputChatBox(timeStr..msg, 200, 130, 210, true)
		
		elseif isMeFunc then
			outputChatBox(timeStr..getPlayerName(source).." "..msg, 200, 130, 210, true)
			
		elseif isOOCfunc then
		    outputChatBox(timeStr.."(( "..getPlayerName(source).."["..playerid.."] "..msg.." ))", 147, 147, 147, true)

		elseif isAdmin then
			outputChatBox(timeStr.."[АДМИН] "..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 255, 70, 0, true)
			
		elseif isHelper then
		    outputChatBox(timeStr.."[ХЕЛПЕР] "..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 255, 160, 160, true)
			
		elseif police then
		    outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 0, 0, 255, true)
		elseif medic then
		    outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 255, 255, 0, true)
		elseif soldier then
		    outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 0, 128, 0, true)
		elseif fbi then
		    outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 39, 107, 235, true)
		elseif sanews then
		    outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 0, 255, 147, true)

		else
			outputChatBox(timeStr..getPlayerName(source).."["..playerid.."]"..": #FFFFFF"..msg, 255, 255, 255, true)
		end
		
	end
end


function chatMsgRemove(i)
	chatMsgs[i] = nil
end

function chatMsgRender()
	cx, cy, cz = getElementPosition(localCamera)
	cint = getElementInterior(localPlayer)
	cdim = getElementDimension(localPlayer)
	for plr,msg in pairs(chatMsgs) do
		if isElement(plr) and(msg ~= nil) then
			px, py, pz = getPedBonePosition(plr, 5)
			pint = getElementInterior(plr)
			pdim = getElementDimension(plr)
			pz = pz+0.2
			scrx, scry = getScreenFromWorldPosition(px, py, pz)
			
			if scrx and isLineOfSightClear(cx, cy, cz, px, py, pz, true, false, false, true, false, false, false, plr) and(pint == cint) and(pdim == cdim) then
				dxDrawText(removeHex(msg[2], 6), scrx-202, scry-2, scrx+198, scry, chatMsgClrShadow, scaleMult, "default-bold", "center", "bottom", false, true, false, true)
				
				if msg[4] then
					dxDrawText(msg[2], scrx-200, scry, scrx+200, scry, chatMsgClrMeFunc, scaleMult, "default-bold", "center", "bottom", false, true, false, true)				
				else
					dxDrawText(msg[2], scrx-200, scry, scrx+200, scry, chatMsgClrBody, scaleMult, "default-bold", "center", "bottom", false, true, false, true)
				end
				
			end
			
			if((getTickCount()-msg[3]) >(2000+string.len(msg[2])*100)) then
				chatMsgRemove(plr)
			end
			
		end
	end
end

function donateInit()
	donateMenu = guiCreateWindow(sW/2-340, sH/2-135, 680, 270, "Активация доната", false)
	donateLabel = guiCreateLabel(10, 20, 660, 195, "Список доната пуст. Подарить проекту некоторую сумму денег можно на сайте resplay.ru(пункт меню - Донат).", false, donateMenu)
	guiLabelSetHorizontalAlign(donateLabel, "center", true)
	guiLabelSetVerticalAlign(donateLabel, "center")
	donateList = guiCreateGridList(10, 20, 660, 195, false, donateMenu)
	guiGridListSetSortingEnabled(donateList, false)
	donateColumn = guiGridListAddColumn(donateList, "Донат-услуги", 0.85)
	addEventHandler("onClientGUIDoubleClick", donateList, donateSelect)
	local donateBtnBack = guiCreateButton(25, 225, 600, 35, "Отмена", false, donateMenu)
	addEventHandler("onClientGUIClick", donateBtnBack, donateClose, false)
	guiSetVisible(donateMenu, false)
	guiWindowSetMovable(donateMenu, false)
	guiWindowSetSizable(donateMenu, false)
end

function donateOpen(donateArray)
	if not guiGetVisible(donateMenu) then
		turnOffMenus()
		if(table.getn(donateArray) > 0) then
			guiSetEnabled(donateList, true)
			guiSetVisible(donateList, true)
			addCommandHandler("Select previous", donatePrev)
			addCommandHandler("Select next", donateNext)
			addCommandHandler("Accept", donateSelect)
			guiSetVisible(donateLabel, false)
			guiGridListClear(donateList)
			local row
			
			for _,donate in ipairs(donateArray) do
				row = guiGridListAddRow(donateList)
				guiGridListSetItemText(donateList, row, donateColumn, string.format("#%d", donate["id"]), false, false)
				guiGridListSetItemData(donateList, row, donateColumn, donate["id"])
			end
			
		else
			guiSetEnabled(donateList, false)
			guiSetVisible(donateList, false)
			guiSetVisible(donateLabel, true)
		end
		
		guiSetVisible(donateMenu, true)
		addCommandHandler("Decline", donateClose)
		showCursor(true)
	end
end

function donatePrev()
	local row, clmn = guiGridListGetSelectedItem(donateList)
	local maxRow = guiGridListGetRowCount(donateList)
	row = math.min(maxRow-1, math.max(0, row-1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(donateList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(donateList, row, clmn)
end

function donateNext()
	local row, clmn = guiGridListGetSelectedItem(donateList)
	local maxRow = guiGridListGetRowCount(donateList)
	row = math.min(maxRow-1, math.max(0, row+1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(donateList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(donateList, row, clmn)
end

function donateSelect(button)
	if(button == "left") or (button == "Accept") then
		local selDonate = guiGridListGetSelectedItem(donateList)
		
		if(selDonate >= 0) then
			selDonate = guiGridListGetItemData(donateList, selDonate, donateColumn)
			
			if selDonate then
				donateClose()
				triggerServerEvent("onDonateActivate", resourceRoot, localPlayer, selDonate)
			end
		end
		
	end
end

function donateClose()
	if guiGetVisible(donateMenu) then
		guiSetVisible(donateMenu, false)
		removeCommandHandler("Select previous", donatePrev)
		removeCommandHandler("Select next", donateNext)
		removeCommandHandler("Accept", donateSelect)
		removeCommandHandler("Decline", donateClose)
		playSFX("genrl", 53, 0, false)
		checkCursor()
	end
end

function customFightMenuInit()
	customFightMenu = guiCreateWindow(sW/2-175, sH/2-135, 350, 270, "Выберите анимацию борьбы", false)
	customFightList = guiCreateGridList(10, 20, 330, 195, false, customFightMenu)
	guiGridListSetSortingEnabled(customFightList, false)
	local column = guiGridListAddColumn(customFightList, "Анимации", 0.85)
	local row
	for _,anim in ipairs(customFightAnims) do
		row = guiGridListAddRow(customFightList)
		guiGridListSetItemText(customFightList, row, column, anim[1], false, false)
		guiGridListSetItemData(customFightList, row, column, anim[2])
	end
	addEventHandler("onClientGUIDoubleClick", customFightList, customFightSelect)
	local customFightBtnBack = guiCreateButton(25, 225, 300, 35, "Отмена", false, customFightMenu)
	addEventHandler("onClientGUIClick", customFightBtnBack, customFightMenuClose, false)
	guiSetVisible(customFightMenu, false)
	guiWindowSetMovable(customFightMenu, false)
	guiWindowSetSizable(customFightMenu, false)
end

function customFightMenuOpen()
	if not guiGetVisible(customFightMenu) then
		turnOffMenus()
		guiSetVisible(customFightMenu, true)
		showCursor(true)
	end
end

function customFightSelect(button)
	if(button == "left") then
		local selAnim, selCol = guiGridListGetSelectedItem(customFightList)
		if(selAnim >= 0) and (selCol >= 0) then
			selAnim = guiGridListGetItemData(customFightList, selAnim, selCol)
			if selAnim then
				customFightMenuClose()
				msgAdd("Вы выбрали новую анимацию борьбы.")
				triggerServerEvent("onPlayerCustomFightSelect", localPlayer, selAnim)
			end
		end
	end
end

function customFightMenuClose()
	if guiGetVisible(customFightMenu) then
		guiSetVisible(customFightMenu, false)
		playSFX("genrl", 53, 0, false)
		checkCursor()
	end
end

function customFightMenuClose()
	if guiGetVisible(customFightMenu) then
		guiSetVisible(customFightMenu, false)
		playSFX("genrl", 53, 0, false)
		checkCursor()
	end
end

function customWalkMenuInit()
	customWalkMenu = guiCreateWindow(sW/2-175, sH/2-135, 350, 270, "Выберите анимацию ходьбы", false)
	customWalkList = guiCreateGridList(10, 20, 330, 195, false, customWalkMenu)
	guiGridListSetSortingEnabled(customWalkList, false)
	local column = guiGridListAddColumn(customWalkList, "Анимации", 0.85)
	local row
	
	for _,anim in ipairs(customWalkAnims) do
		row = guiGridListAddRow(customWalkList)
		guiGridListSetItemText(customWalkList, row, column, anim[1], false, false)
		guiGridListSetItemData(customWalkList, row, column, anim[2])
	end
	
	addEventHandler("onClientGUIDoubleClick", customWalkList, customWalkSelect)
	local customWalkBtnBack = guiCreateButton(25, 225, 300, 35, "Отмена", false, customWalkMenu)
	addEventHandler("onClientGUIClick", customWalkBtnBack, customWalkMenuClose, false)
	guiSetVisible(customWalkMenu, false)
	guiWindowSetMovable(customWalkMenu, false)
	guiWindowSetSizable(customWalkMenu, false)
end

function customWalkMenuOpen()
	if not guiGetVisible(customWalkMenu) then
		turnOffMenus()
		guiSetVisible(customWalkMenu, true)
		addCommandHandler("Select previous", customWalkPrev)
		addCommandHandler("Select next", customWalkNext)
		addCommandHandler("Accept", customWalkSelect)
		addCommandHandler("Decline", customWalkMenuClose)
		showCursor(true)
	end
end

function customWalkPrev()
	local row, clmn = guiGridListGetSelectedItem(customWalkList)
	local maxRow = guiGridListGetRowCount(customWalkList)
	row = math.min(maxRow-1, math.max(0, row-1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(customWalkList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(customWalkList, row, clmn)
end

function customWalkNext()
	local row, clmn = guiGridListGetSelectedItem(customWalkList)
	local maxRow = guiGridListGetRowCount(customWalkList)
	row = math.min(maxRow-1, math.max(0, row+1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(customWalkList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(customWalkList, row, clmn)
end

function customWalkSelect(button)
	if(button == "left") or (button == "Accept") then
		local selAnim, selCol = guiGridListGetSelectedItem(customWalkList)
		
		if(selAnim >= 0) and(selCol >= 0) then
			selAnim = guiGridListGetItemData(customWalkList, selAnim, selCol)
			if selAnim then
				customWalkMenuClose()
				msgAdd("Вы выбрали новую анимацию ходьбы.")
				triggerServerEvent("onPlayerCustomWalkSelect", resourceRoot, localPlayer, selAnim)
			end
		end
		
	end
end

function customWalkMenuClose()
	if guiGetVisible(customWalkMenu) then
		guiSetVisible(customWalkMenu, false)
		removeCommandHandler("Select previous", customWalkPrev)
		removeCommandHandler("Select next", customWalkNext)
		removeCommandHandler("Accept", customWalkSelect)
		removeCommandHandler("Decline", customWalkMenuClose)
		playSFX("genrl", 53, 0, false)
		checkCursor()
	end
end

function thinkBubbleAdd(img, doNotDestroy)
	if(thinkBubbles[source] and(thinkBubbles[source][1] ~= img) and(thinkBubbles[source][1] ~= "images/chatbubble.dds")) or (not thinkBubbles[source]) then
		thinkBubbleDestroy(source)
		
		if doNotDestroy then
			thinkBubbles[source] = { img, nil, nil }
		else
			thinkBubbles[source] = { img, nil, setTimer(thinkBubbleDestroy, thinkBubbleTime, 1, source) }
		end
	
	elseif thinkBubbles[source] and(thinkBubbles[source][1] == img) then
		
		if isTimer(thinkBubbles[source][3]) then
			killTimer(thinkBubbles[source][3])
		end
		
		if doNotDestroy then
			thinkBubbles[source][3] = nil
		else
			thinkBubbles[source][3] = setTimer(thinkBubbleDestroy, thinkBubbleTime, 1, source)
		end
		
	end
end

function thinkBubbleDestroy(plr)
	if thinkBubbles[plr] then
		local elem = thinkBubbles[plr][2]
		local timer = thinkBubbles[plr][3]
		thinkBubbles[plr] = nil
		
		if elem then
			destroyElement(elem)
		end
		
		if isTimer(timer) then
			killTimer(timer)
		end
		
	end
end

function thinkBubbleDraw()
	players = getElementsByType("player")
	for _,plr in ipairs(players) do
		if thinkBubbles[plr] and isElement(plr) then
			px, py, pz = getElementPosition(plr)
			cx, cy, cz = getElementPosition(localCamera)
			
			if(getDistanceBetweenPoints3D(px, py, pz, cx, cy, cz) < 50.0) then
				if(getElementInterior(localPlayer) == getElementInterior(plr)) and(getElementDimension(localPlayer) == getElementDimension(plr)) then
					
					if not thinkBubbles[plr][2] then
						thinkBubbles[plr][2] = dxCreateTexture(thinkBubbles[plr][1], "dxt3", false)
					end
					
					texToDraw = thinkBubbles[plr][2]
					px, py, pz = getPedBonePosition(plr, 5)
					pz = pz+0.3
					dxDrawMaterialLine3D(px, py, pz+0.5, px, py, pz, texToDraw, 1)
				end
				
			else
				thinkBubbleDestroy(plr)
			end
			
		elseif thinkBubbles[plr] and(not isElement(plr)) then
			thinkBubbleDestroy(plr)
			
		end
	end
end

debugLawnmows = {}
local debugCurLawnmow = 1

function debugLawnmowNew(x, y, z, lawnId, grassId)
	table.insert(debugLawnmows, { x, y, z, lawnId, grassId })
end

function debugLawnmowDraw()
	local cx, cy, cz = getElementPosition(localCamera)
	local gx, gy, gz
	local dx, dy
	local drawn = 0
	for i=1,table.getn(debugLawnmows) do
		if(debugLawnmows[i][4] == debugCurLawnmow) then
			gx, gy, gz = debugLawnmows[i][1],debugLawnmows[i][2],debugLawnmows[i][3]
			dxDrawLine3D(gx, gy, gz-5.0, gx, gy, gz+100.0, tocolor(0,128,0,255), 5)
			dx, dy = getScreenFromWorldPosition(gx,gy,gz)
			if dx then
				dxDrawText(string.format("%d:%d", debugLawnmows[i][4], debugLawnmows[i][5]), dx, dy)
			end
		end
	end
end

function debugChangeLawn(cmd, lwnid)
	debugCurLawnmow = tonumber(lwnid)
	outputChatBox("lawnid="..tostring(debugCurLawnmow))
end

addEventHandler("onClientRender", root, debugLawnmowDraw)
addCommandHandler("debuglawn", debugChangeLawn)
addEvent("onLawnmowDebugNew", true)
addEventHandler("onLawnmowDebugNew", root, debugLawnmowNew)

function getElementSpeed(theElement, unit)
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed(element expected, got " .. type(theElement) .. ")")
    assert(getElementType(theElement) == "player" or getElementType(theElement) == "ped" or getElementType(theElement) == "object" or getElementType(theElement) == "vehicle", "Invalid element type @ getElementSpeed(player/ped/object/vehicle expected, got " .. getElementType(theElement) .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and(unit == nil or (tonumber(unit) and(tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed(invalid speed unit)")
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    return(Vector3(getElementVelocity(theElement)) * mult).length
end

function browserOpen(videoname, videoid, timeuntilexit)
	if not guiGetVisible(browserWin) then
		guiSetVisible(browserWin, true)
		guiSetText(browserWin, videoname)
		
		if(type(videoid) == "table") then
			local imgName = videoid[1]
			browserObj = guiCreateStaticImage(10, 25, bW-20, bH-65, "images/"..imgName, false, browserWin)
		
		else
			browserObj = guiCreateBrowser(10, 25, bW-20, bH-65, false, true, false, browserWin)
			browserVideoId = videoid
			addEventHandler("onClientBrowserCreated", browserObj, browserLoad)
			
			if timeuntilexit then
				browserExitBtnTime = timeuntilexit
			else
				browserExitBtnTime = 0
			end
			
			browserUpdateExitBtn()
			
		end
		
		showCursor(true)
	end
end

function browserUpdateExitBtn()
	if guiGetVisible(browserWin) then
		if(browserExitBtnTime > 0) then
			guiSetText(browserExitBtn, "Закрыть("..tostring(browserExitBtnTime)..")")
			guiSetEnabled(browserExitBtn, false)
			browserExitBtnTime = browserExitBtnTime-1
			setTimer(browserUpdateExitBtn, 1000, 1)
		else
			guiSetText(browserExitBtn, "Закрыть")
			guiSetEnabled(browserExitBtn, true)
			browserExitBtnTime = 0
		end
	end
end

function browserLoad()
	setBrowserVolume(source, 0.5)
	loadBrowserURL(source, "http://www.youtube.com/embed/"..browserVideoId.."?autoplay=1&showsearch=0&rel=0&showinfo=0&fs=0&allowFullScreen=false&autohide=1&modestbranding=1")
end

function browserClose()
	if(guiGetVisible(browserWin) and browserObj) then
		guiSetVisible(browserWin, false)
		playSFX("genrl", 53, 0, false)
		destroyElement(browserObj)
		checkCursor()
	end
end

function gangHelpNew()
	if not (source == localPlayer) then
		local helpBlip = createBlip(0, 0, 0, 0, 2, 255, 255, 0, 255, 32767)
		attachElements(helpBlip, source)
		table.insert(gangHelps, { helpBlip, 10000 })
		msgAdd(string.format("%s просит помощи!", getPlayerName(source)))
	end
end

function gangHelpProcess(timeSlice)
	alphaLevel = math.fmod(getTickCount(), 1000)
	
	if(alphaLevel > 500) then
		alphaLevel = 0
	else
		alphaLevel = 255
	end
	
	for i,gangHelp in ipairs(gangHelps) do
		gangHelp[2] = gangHelp[2]-timeSlice
		
		if(gangHelp[2] < 0) then
			destroyElement(gangHelp[1])
			table.remove(gangHelps, i)
			break
		else
			setBlipColor(gangHelp[1], 255, 255, 0, alphaLevel)
		end
		
	end
	
end

function saveHouseSet(bx, by, bz)
	if isElement(saveHouseBlip) then
		setElementPosition(saveHouseBlip, bx, by, bz)
	else
		saveHouseBlip = createBlip(bx, by, bz, 35)
	end
end

function saveHouseDestroy()
	destroyElement(saveHouseBlip)
end

function getPositionFromElementOffset(element,offX,offY,offZ)
	local m = getElementMatrix(element)  -- Get the matrix
	local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform
	local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
	local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
	return x, y, z  -- Return the transformed point
end

function attachEffect(effect, element, pos)
	attachedEffects[effect] = { effect = effect, element = element, pos = pos }
	addEventHandler("onClientElementDestroy", effect, function() attachedEffects[effect] = nil end)
	addEventHandler("onClientElementDestroy", element, function() attachedEffects[effect] = nil end)
	return true
end

function fuelDraw()
	local fuelLevel = false
	local occupiedVeh = getPedOccupiedVehicle(localPlayer)
	
	if(occupiedVeh) then
		fuelLevel = getElementData(occupiedVeh, "fuelLevel")
	elseif doesPedHaveJetPack(localPlayer) then
		fuel = getElementData(localPlayer, "jetpackFuel")
		if fuel and(fuel <= 200.0) then
			fuelLevel = fuel/100.0
		end
	end
	
	if(fuelLevel) then
		dxDrawRectangle(sW-10-fuelRectW, sH-10-fuelRectH, fuelRectW, fuelRectH, tocolor(0,0,0,160))
		
		if(fuelLevel <= 0.1) then
			if not fuelWarning then
				setSoundVolume(playSound("audio/fuelwarn.wav"), gameSoundVolume)
				msgAdd("Низкий запас топлива. Найдите ближайшую заправку или пополните запас топлива самостоятельно.")
				fuelWarning = true
			end
			alphaLevel = math.fmod(getTickCount(), 1000)
			if(alphaLevel > 500) then
				alphaLevel = 1000-alphaLevel
			end
			alphaLevel = alphaLevel/1000
			colorRectIn = tocolor(255,0,0,255*alphaLevel*2)
		
		elseif(fuelLevel <= 0.2) then
			colorRectIn = tocolor(255,255,0,255)
		
		else
			colorRectIn = tocolor(0,128,0,255)
		end
		
		dxDrawRectangle(sW-5-fuelRectW, sH-15- (fuelRectH-10)*fuelLevel, fuelRectW-10,(fuelRectH-10)*fuelLevel, colorRectIn)
		dxDrawImage(sW-10-fuelIconW- (fuelRectW-fuelIconW)/2, sH-15-fuelRectH-fuelIconH, fuelIconW, fuelIconH, fuelTex)
		
		if occupiedVeh and getElementData(occupiedVeh, "flyAbility") then
			if(fuelLevel > 0.0) and getElementData(occupiedVeh, "flyToggle") then
				setWorldSpecialPropertyEnabled("aircars", true)
			else
				setWorldSpecialPropertyEnabled("aircars", false)
			end
		
		else
			setWorldSpecialPropertyEnabled("aircars", false)
		end
		
		fuelLevel = math.ceil(fuelLevel*100)
		dxDrawText(string.format("%d%s", fuelLevel, "%"), sW-10-fuelRectW, sH-10-fuelRectH, sW-10, sH-10, tocolor(255,255,255,255), scaleMult, "default-bold", "center", "center")
		--local vtype = getVehicleType(occupiedVeh)
		--local fuelExists = ((((vtype == "Automobile") or (vtype == "Bike") or (vtype == "Monster Truck") or (vtype == "Quad"))) or (getElementModel(occupiedVeh) == 611))
		--if isElement(occupiedVeh) and fuelExists and((fuelLevel <= 0) or ((getElementHealth(occupiedVeh) < 500.0) and(not getElementData(occupiedVeh, "explodable")))) then
			--setVehicleEngineState(occupiedVeh, false)
		--end
	end
end

function misPassedGuiDraw(timeSlice)
	if(misPassedGuiTime > 0) then
		progress = misPassedGuiDefaultTime-misPassedGuiTime
		
		if(progress < 1000) then
			alphaLevel = progress/1000*255
		
		elseif(progress < 5000) then
			alphaLevel = 255
		
		elseif(progress < 6000) then
			alphaLevel = (misPassedGuiDefaultTime-progress)/1000*255
		
		else
			misPassedGuiTime = 0
			alphaLevel = 0
		end
		
		dxDrawText("Job Finished", sW/2-3, sH/2-3, sW/2-3, sH/2-3, tocolor(0,0,0,alphaLevel), scaleMult*2.5, "bankgothic", "center", "center")
		dxDrawText("Job Finished", sW/2+3, sH/2+3, sW/2+3, sH/2+3, tocolor(0,0,0,alphaLevel), scaleMult*2.5, "bankgothic", "center", "center")
		dxDrawText("Job Finished", sW/2-3, sH/2+3, sW/2-3, sH/2+3, tocolor(0,0,0,alphaLevel), scaleMult*2.5, "bankgothic", "center", "center")
		dxDrawText("Job Finished", sW/2+3, sH/2-3, sW/2+3, sH/2-3, tocolor(0,0,0,alphaLevel), scaleMult*2.5, "bankgothic", "center", "center")
		dxDrawText("Job Finished", sW/2, sH/2, sW/2, sH/2, tocolor(127,87,28,alphaLevel), scaleMult*2.5, "bankgothic", "center", "center")
		misPassedGuiTime = misPassedGuiTime-timeSlice
	end
end

function drawGui3DPopups()
	cx, cy, cz = getElementPosition(localCamera)
	for i,car in ipairs(carSellAvailableCars) do
		if not (car == nil) then
			if(isElement(car[1])) and isElementStreamedIn(car[1]) then
				ex, ey, ez = getElementPosition(car[1])
				if(getDistanceBetweenPoints3D(cx, cy, cz, ex, ey, ez) < 25) then
					
					if not carSellRenderTargets[i] then
						carSellRenderTargets[i] = dxCreateRenderTarget(carSellRenderW, carSellRenderH, true)
					end
					
					if(carSellRenderTargets[i]) then
						dxSetRenderTarget(carSellRenderTargets[i], true)
						dxDrawRectangle(0, 0, carSellRenderW, carSellRenderH, tocolor(0,0,0,160))
						dxDrawLine(0, 0, carSellRenderW, 0, tocolor(0,0,0,255), 2)
						dxDrawLine(0, 0, 0, carSellRenderH, tocolor(0,0,0,255), 2)
						dxDrawLine(0, carSellRenderH, carSellRenderW, carSellRenderH, tocolor(0,0,0,255), 2)
						dxDrawLine(carSellRenderW, 0, carSellRenderW, carSellRenderH, tocolor(0,0,0,255), 2)
						dxDrawText(string.format("Модель: %s", car[2]), 5, 5, 5, 5, tocolor(255,255,255,255), 1, "default-bold")
						dxDrawText(string.format("Цвет: %s", car[4]), 5, 17, 5, 17, tocolor(255,255,255,255), 1, "default-bold")
						dxDrawText(string.format("Состояние: %s", car[5]), 5, 29, 5, 29, tocolor(255,255,255,255), 1, "default-bold")
						dxDrawText(string.format("Цена: $%d", car[3]), 5, 41, 5, 41, tocolor(255,255,255,255), 1, "default-bold")
						dxSetRenderTarget()
						_, _, _, _, _, emaxz = getElementBoundingBox(car[1])
						emaxz = ez+emaxz+0.1
						dxDrawMaterialLine3D(ex, ey, emaxz+carSellPhysicalH, ex, ey, emaxz, carSellRenderTargets[i], carSellPhysicalW, tocolor(255,255,255,255))
					end
					
				end
			end
		end
	end

	
	--[[for _,stop in ipairs(busStops) do
		if(isElement(stop[1])) and isElementStreamedIn(stop[1]) then
			ex, ey, ez = getElementPosition(stop[1])
			
			if(getDistanceBetweenPoints3D(cx, cy, cz, ex, ey, ez) < 25) then
				local busStopsRenderH = 116
				local busStopsRenderW = 480
				local busStopsPhysicalH = 1
				local busStopsPhysicalW = 4.134
				
				if not stop[2] then
					stop[2] = dxCreateRenderTarget(busStopsRenderW, busStopsRenderH, true)
				end
				
				if stop[2] then
					if(isObjectBreakable(stop[1])) then
						setObjectBreakable(stop[1], false)
					end
					
					dxSetRenderTarget(stop[2], true)
					dxDrawRectangle(0, 0, busStopsRenderW, busStopsRenderH, tocolor(0,0,0,160))
					dxDrawLine(0, 0, busStopsRenderW, 0, tocolor(0,0,0,255), 2)
					dxDrawLine(0, 0, 0, busStopsRenderH, tocolor(0,0,0,255), 2)
					dxDrawLine(0, busStopsRenderH, busStopsRenderW, busStopsRenderH, tocolor(0,0,0,255), 2)
					dxDrawText("Остановка", busStopsRenderW/2, 17, busStopsRenderW/2, 17, tocolor(255,255,255,255), 2, "default-bold", "center", "center")
					dxDrawText(stop[4], busStopsRenderW/2, busStopsRenderH/2, busStopsRenderW/2, busStopsRenderH/2, tocolor(255,255,255,255), 2.5, "default-bold", "center", "center")
					dxDrawText("Пред.", 17, busStopsRenderH-34, 17, busStopsRenderH-34, tocolor(255,255,255,255), 0.75, "default-bold", "left", "center")
					dxDrawText(stop[3], 17, busStopsRenderH-17, 17, busStopsRenderH-17, tocolor(255,255,255,255), 2, "default-bold", "left", "center")
					dxDrawText("След.", busStopsRenderW-17, busStopsRenderH-34, busStopsRenderW-17, busStopsRenderH-34, tocolor(255,255,255,255), 0.75, "default-bold", "right", "center")
					dxDrawText(stop[5], busStopsRenderW-17, busStopsRenderH-17, busStopsRenderW-17, busStopsRenderH-17, tocolor(255,255,255,255), 2, "default-bold", "right", "center")
					dxSetRenderTarget()
					_, _, _, _, _, emaxz = getElementBoundingBox(stop[1])
					emaxz = ez+emaxz+0.1
					dxDrawMaterialLine3D(ex, ey, emaxz+busStopsPhysicalH, ex, ey, emaxz, stop[2], busStopsPhysicalW, tocolor(255,255,255,255))
				end
				
			end
			
		end
	end--]]
	for i,truck in pairs(jobTruckerAvailableTrucks) do
		if(not(truck == nil)) and(not truck[3]) and isElementStreamedIn(truck[1]) then
			ex, ey, ez = getElementPosition(truck[1])
			
			if(getDistanceBetweenPoints3D(cx, cy, cz, ex, ey, ez) < 25) then
				local jobTruckerRenderH = 58
				local jobTruckerRenderW = 240
				local jobTruckerPhysicalH = 0.75
				local jobTruckerPhysicalW = 3.08
				
				if not jobTruckerRenderTargets[i] then
					jobTruckerRenderTargets[i] = dxCreateRenderTarget(jobTruckerRenderW, jobTruckerRenderH, true)
				end
				
				if(jobTruckerRenderTargets[i]) then
					dxSetRenderTarget(jobTruckerRenderTargets[i], true)
					dxDrawRectangle(0, 0, jobTruckerRenderW, jobTruckerRenderH, tocolor(0,0,0,160))
					dxDrawLine(0, 0, jobTruckerRenderW, 0, tocolor(0,0,0,255), 2)
					dxDrawLine(0, 0, 0, jobTruckerRenderH, tocolor(0,0,0,255), 2)
					dxDrawLine(0, jobTruckerRenderH, jobTruckerRenderW, jobTruckerRenderH, tocolor(0,0,0,255), 2)
					dxDrawLine(jobTruckerRenderW, 0, jobTruckerRenderW, jobTruckerRenderH, tocolor(0,0,0,255), 2)
					dxDrawText(string.format("Груз: %s", truck[5]), 5, 5, 5, 5, tocolor(255,255,255,255), 1, "default-bold")
					dxDrawText(string.format("Расстояние: %s", truck[8]), 5, 17, 5, 17, tocolor(255,255,255,255), 1, "default-bold")
					dxDrawText(string.format("Время: %s", truck[7]), 5, 29, 5, 29, tocolor(255,255,255,255), 1, "default-bold")
					dxDrawText(string.format("Вознаграждение: %s", truck[6]), 5, 41, 5, 41, tocolor(255,255,255,255), 1, "default-bold")
					dxSetRenderTarget()
					_, _, _, _, _, emaxz = getElementBoundingBox(truck[1])
					emaxz = ez+emaxz+0.1
					dxDrawMaterialLine3D(ex, ey, emaxz+jobTruckerPhysicalH, ex, ey, emaxz, jobTruckerRenderTargets[i], jobTruckerPhysicalW, tocolor(255,255,255,255))
				end
				
			end
		end
	end
end

function busStopsUpdate(busStopArray)
	busStops = busStopArray
end

function isFriend(playername)
	for i,friend in ipairs(friends) do
		if(friend == playername) then
			return i
		end
	end
	return false
end

function loadFriends(friendsArray)
	friends = {}
	local friend
	for _,line in ipairs(friendsArray) do
		table.insert(friends, line["friend"])
		friend = getPlayerFromName(line["friend"])
		if(friend) then
			markPlayerWithBlip(friend)
		end
	end
end

function sendFriendRequest(newFriend)
	local friendName = getPlayerName(newFriend)
	local requestFound = false
	
	for i,req in ipairs(friendRequests) do
		if(req == friendName) then
			acceptFriendRequest(i)
			requestFound = true
			break
		end
	end
	
	
	if not requestFound then
		local friendFound = false
		
		for _,friend in ipairs(friends) do
			if(friend == friendName) then
				msgAdd(string.format("%s уже у вас в друзьях.", friendName))
				friendFound = true
				break
			end
		end
		
		if not friendFound then
			triggerServerEvent("onFriendRequestAdd", resourceRoot, localPlayer, newFriend)
			msgAdd(string.format("Запрос на добавление %s в друзья отправлен.", friendName))
		end
	end
	
end

function acceptFriendRequest(reqid)
	local friendName = friendRequests[reqid]
	table.remove(friendRequests, reqid)
	friendsUpdateRequestList()
	triggerServerEvent("onAcceptFriendRequest", resourceRoot, localPlayer, getPlayerName(localPlayer), friendName)
end

function declineFriendRequest(reqid)
	local friendName = friendRequests[reqid]
	table.remove(friendRequests, reqid)
	friendsUpdateRequestList()
end

function friendPMSend(friendName, msgText)
	triggerServerEvent("onFriendPMSend", resourceRoot, localPlayer, friendName, msgText)
end

function friendPMReceive(friendName, msgText, timeStr)
	outputChatBox(timeStr.."PM от "..friendName..": "..msgText, 255, 255, 0, false)
	playSound("audio/message.wav")
end

function friendPMSuccess(success, friendName, msgText, timeStr)
	if success then
		outputChatBox(timeStr.."PM для "..friendName..": "..msgText, 255, 255, 0, false)
	else
		msgAdd("Ошибка при отправке сообщения.")
	end
	checkCursor()
end

function friendsMenuBtnAddFriendClick(button)
	if(button == "left") then
		local players = getElementsByType("player")
		local friend = nil
		local possiblePlayersNum = 0
		
		for i=1,table.getn(players) do
			if(string.match(string.lower(getPlayerName(players[i])), string.lower(guiGetText(friendsMenuInputAddFriend)))) then
				possiblePlayersNum = possiblePlayersNum+1
				friend = players[i]
			end
		end
		
		
		if(possiblePlayersNum > 1) then
			msgAdd(string.format("Под ваш запрос подпадает %d игроков. Попробуйте уточнить никнейм.", possiblePlayersNum))
		
		elseif(friend) then
			if(friend == localPlayer) then
				msgAdd("Вы не можете добавить самого себя в друзья.")
			else
				sendFriendRequest(friend)
			end
		
		else
			msgAdd("Игрок с данным ником не найден на сервере.")
		end
	end
end

function friendsMenuBtnDelFriendClick(button)
	if(button == "left") then
		local selectedItem = guiGridListGetSelectedItem(friendsMenuListFriends)
		if(selectedItem >= 0) then
			delFriend(guiGridListGetItemText(friendsMenuListFriends, selectedItem, 1))
		end
	end
end

function friendsMenuBtnRequestAcceptClick(button)
	if(button == "left") then
		local selectedItem = guiGridListGetSelectedItem(friendsMenuListRequests)
		
		if(selectedItem >= 0) then
			acceptFriendRequest(selectedItem+1)
		end
		
	end
end

function friendsMenuBtnRequestDeclineClick(button)
	if(button == "left") then
		local selectedItem = guiGridListGetSelectedItem(friendsMenuListRequests)
		
		if(selectedItem >= 0) then
			declineFriendRequest(selectedItem+1)
		end
		
	end
end

function friendsMenuKeyPressed()
	if friendsMenuAvailable and(not isPedDead(localPlayer)) then
		if friendsMenuShow then
			turnOffMenus()
		
		elseif(not furnitureSelectedObj) then
			turnOffMenus()
			friendsUpdateFriendsList()
			friendsUpdateRequestList()
			addEventHandler("onClientGUIClick", friendsMenuBtnAddFriend, friendsMenuBtnAddFriendClick, false)
			addEventHandler("onClientGUIClick", friendsMenuBtnDelFriend, friendsMenuBtnDelFriendClick, false)
			addEventHandler("onClientGUIClick", friendsMenuBtnRequestAccept, friendsMenuBtnRequestAcceptClick, false)
			addEventHandler("onClientGUIClick", friendsMenuBtnRequestDecline, friendsMenuBtnRequestDeclineClick, false)
			guiSetSelectedTab(friendsMenuWin, friendsMenuTabFriends)
			guiSetVisible(friendsMenuWin, true)
			--guiBringToFront(friendsMenuInputAddFriend)
			--guiEditSetCaretIndex(friendsMenuInputAddFriend, 1)
			addCommandHandler("Select previous", friendsMenuPrev)
			addCommandHandler("Select next", friendsMenuNext)
			addCommandHandler("Select right", friendsMenuRight)
			addCommandHandler("Select left", friendsMenuLeft)
			addCommandHandler("Accept", friendsMenuAccept)
			addCommandHandler("Decline", friendsMenuDecline)
			friendsMenuShow = true
			guiSetInputMode("no_binds_when_editing")
			showCursor(true)
		end
		
	end
end

function friendsMenuPrev()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	if(selectedTab == friendsMenuTabFriends) then
		local maxRow = guiGridListGetRowCount(friendsMenuListFriends)
		
		if(maxRow > 0) then
			local row, clmn = guiGridListGetSelectedItem(friendsMenuListFriends)
			row = math.min(maxRow-1, math.max(-1, row-1))
			clmn = math.max(1, clmn)
			
			if(row < 0) then
				guiGridListSetVerticalScrollPosition(friendsMenuListFriends, 0)
				guiBringToFront(friendsMenuInputAddFriend)
				guiEditSetCaretIndex(friendsMenuInputAddFriend, 1)
			else
				guiGridListSetVerticalScrollPosition(friendsMenuListFriends, math.ceil(row*100.0/maxRow))
				guiGridListSetSelectedItem(friendsMenuListFriends, row, clmn)
			end
		
		else
			guiBringToFront(friendsMenuInputAddFriend)
			guiEditSetCaretIndex(friendsMenuInputAddFriend, 1)
		end
		
	elseif(selectedTab == friendsMenuTabRequests) then
		local maxRow = guiGridListGetRowCount(friendsMenuListRequests)
		
		if(maxRow > 0) then
			local row, clmn = guiGridListGetSelectedItem(friendsMenuListRequests)
			row = math.min(maxRow-1, math.max(0, row-1))
			clmn = math.max(1, clmn)
			guiGridListSetVerticalScrollPosition(friendsMenuListRequests, math.ceil(row*100.0/maxRow))
			guiGridListSetSelectedItem(friendsMenuListRequests, row, clmn)
		end
		
	end
end

function busesDrawText()
	local veh, vx, vy, vz, tx, ty, dist
	local cx, cy, cz = getElementPosition(localCamera)
	for _,bus in ipairs(buses) do
		veh = bus[8]
		vx, vy, vz = getElementPosition(veh)
		dist = getDistanceBetweenPoints3D(vx, vy, vz, cx, cy, cz)
		if(dist == 0) then
			dist = 0.001
		end
		if(isElementOnScreen(veh)) and (dist < 40) then
			if(isLineOfSightClear(vx, vy, vz, cx, cy, cz, true, true, false, false, false, false, false, veh)) then
				tx, ty = getScreenFromWorldPosition(vx, vy, vz)
				if(tx) then
					dxDrawText(string.format("Маршрут №%d", bus[4]), tx, ty, tx, ty, tocolor(255,255,0,255), 1.2, "arial", "center", "center")
					dxDrawText(string.format("Следующая остановка: %s", bus[7]), tx, ty+12, tx, ty+12, tocolor(255,255,255,255), 1.2, "arial", "center", "center")
				end
			end
		end
	end
end

function friendsMenuNext()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	
	if(selectedTab == friendsMenuTabFriends) then
		local maxRow = guiGridListGetRowCount(friendsMenuListFriends)
		
		if(maxRow > 0) then
			local row, clmn = guiGridListGetSelectedItem(friendsMenuListFriends)
			row = math.min(maxRow-1, math.max(-1, row+1))
			clmn = math.max(1, clmn)
			
			if(row < 0) then
				guiGridListSetVerticalScrollPosition(friendsMenuListFriends, 0)
				guiBringToFront(friendsMenuInputAddFriend)
				guiEditSetCaretIndex(friendsMenuInputAddFriend, 1)
			
			else
				guiGridListSetVerticalScrollPosition(friendsMenuListFriends, math.ceil(row*100.0/maxRow))
				guiGridListSetSelectedItem(friendsMenuListFriends, row, clmn)
			end
			
		else
			guiBringToFront(friendsMenuInputAddFriend)
			guiEditSetCaretIndex(friendsMenuInputAddFriend, 1)
		end
		
	elseif(selectedTab == friendsMenuTabRequests) then
		local maxRow = guiGridListGetRowCount(friendsMenuListRequests)
		
		if(maxRow > 0) then
			local row, clmn = guiGridListGetSelectedItem(friendsMenuListRequests)
			row = math.min(maxRow-1, math.max(0, row+1))
			clmn = math.max(1, clmn)
			guiGridListSetVerticalScrollPosition(friendsMenuListRequests, math.ceil(row*100.0/maxRow))
			guiGridListSetSelectedItem(friendsMenuListRequests, row, clmn)
		end
		
	end
end

function friendsMenuRight()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	
	if(selectedTab == friendsMenuTabFriends) then
		guiSetSelectedTab(friendsMenuWin, friendsMenuTabRequests)
	
	elseif(selectedTab == friendsMenuTabRequests) then
		guiSetSelectedTab(friendsMenuWin, friendsMenuTabFriends)
	end
	
end

function friendsMenuLeft()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	
	if(selectedTab == friendsMenuTabFriends) then
		guiSetSelectedTab(friendsMenuWin, friendsMenuTabRequests)
	
	elseif(selectedTab == friendsMenuTabRequests) then
		guiSetSelectedTab(friendsMenuWin, friendsMenuTabFriends)
	end
	
end

function friendsMenuAccept()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	
	if(selectedTab == friendsMenuTabFriends) then
		friendsClickFriend("left")
	
	elseif(selectedTab == friendsMenuTabRequests) then
		friendsMenuBtnRequestAcceptClick("left")
	end
	
end

function friendsMenuDecline()
	local selectedTab = guiGetSelectedTab(friendsMenuWin)
	
	if(selectedTab == friendsMenuTabFriends) then
		friendsMenuBtnDelFriendClick("left")
	
	elseif(selectedTab == friendsMenuTabRequests) then
		friendsMenuBtnRequestDeclineClick("left")
	end
	
end

function friendsCloseMenu()
	if(friendsMenuShow) then
		removeEventHandler("onClientGUIClick", friendsMenuBtnAddFriend, friendsMenuBtnAddFriendClick)
		removeEventHandler("onClientGUIClick", friendsMenuBtnDelFriend, friendsMenuBtnDelFriendClick)
		removeEventHandler("onClientGUIClick", friendsMenuBtnRequestAccept, friendsMenuBtnRequestAcceptClick)
		removeEventHandler("onClientGUIClick", friendsMenuBtnRequestDecline, friendsMenuBtnRequestDeclineClick)
		removeCommandHandler("Select previous", friendsMenuPrev)
		removeCommandHandler("Select next", friendsMenuNext)
		removeCommandHandler("Select right", friendsMenuRight)
		removeCommandHandler("Select left", friendsMenuLeft)
		removeCommandHandler("Accept", friendsMenuAccept)
		removeCommandHandler("Decline", friendsMenuDecline)
		guiSetVisible(friendsMenuWin, false)
		friendsMenuShow = false
		checkCursor()
	end
end

function friendsUpdateRequestList()
	guiGridListClear(friendsMenuListRequests)
	
	for i=1,table.getn(friendRequests) do
		guiGridListSetItemText(friendsMenuListRequests, guiGridListAddRow(friendsMenuListRequests), friendsMenuListRequestsColumn, friendRequests[i], false, false)
	end
end

function friendsUpdateFriendsList()
	guiGridListClear(friendsMenuListFriends)
	
	for i=1,table.getn(friends) do
		guiGridListSetItemText(friendsMenuListFriends, guiGridListAddRow(friendsMenuListFriends), friendsMenuListFriendsColumn, friends[i], false, false)
	end
end

function friendsClickFriend(button)
	if(button == "left") then
		local selectedItem = guiGridListGetSelectedItem(friendsMenuListFriends)
		
		if(selectedItem >= 0) then
			actionExtraParamsInputs = {}
			table.insert(actionExtraParamsInputs, guiGridListGetItemText(friendsMenuListFriends, selectedItem, 1))
			turnOffMenus()
			friendsMenuAvailable = false
			actionsMenuAvailable = false
			playSFX("genrl", 53, 7, false)
			actionExtraParamsWin = guiCreateWindow(sW/2-125, sH/2-48, 250, 96, "Сообщение(до 32 символов)", false)
			local paramLabel, paramLabelW
			paramLabel = guiCreateLabel(10, 20, 0, 20, "Текст", false, actionExtraParamsWin)
			guiLabelSetColor(paramLabel, 255, 255, 255)
			guiLabelSetVerticalAlign(paramLabel, "center")
			paramLabelW = guiLabelGetTextExtent(paramLabel)
			guiSetSize(paramLabel, paramLabelW, 20, false)
			table.insert(actionExtraParamsInputs, guiCreateEdit(20+paramLabelW, 20, 220-paramLabelW, 20, "", false, actionExtraParamsWin))
			guiEditSetMaxLength(actionExtraParamsInputs[2], 32)
			guiBringToFront(actionExtraParamsInputs[2])
			guiEditSetCaretIndex(actionExtraParamsInputs[2], 1)
			actionExtraParamsBtnOK = guiCreateButton(25, 51, 200, 35, "ОК", false, actionExtraParamsWin)
			showCursor(true)
			guiWindowSetMovable(actionExtraParamsWin, false)
			guiWindowSetSizable(actionExtraParamsWin, false)
			guiSetInputMode("no_binds_when_editing")
			addEventHandler("onClientGUIClick", actionExtraParamsBtnOK, friendPMAccept, false)
			--addEventHandler("onClientKey", root, friendPMAccept, false)
			addCommandHandler("Accept", friendPMAccept)
		end
		
	end
end

function friendPMAccept(button)
	if(button == "left") or (button == "enter") or (button == "Accept") then
		removeCommandHandler("Accept", friendPMAccept)
		friendPMSend(actionExtraParamsInputs[1], guiGetText(actionExtraParamsInputs[2]))
		friendsMenuAvailable = true
		actionsMenuAvailable = true
		removeEventHandler("onClientGUIClick", actionExtraParamsBtnOK, friendPMAccept)
		removeEventHandler("onClientKey", root, friendPMAccept)
		destroyElement(actionExtraParamsWin)
		guiSetInputMode("no_binds_when_editing")
		playSFX("genrl", 53, 7, false)
	end
end

function receiveFriendRequest()
	local friendName = getPlayerName(source)
	local requestFound = false
	
	for i=1,table.getn(friendRequests) do
		if(friendRequests[i] == friendName) then
			requestFound = true
			break
		end
	end
	
	
	if not requestFound then
		table.insert(friendRequests, friendName)
		friendsUpdateRequestList()
		msgAdd(string.format("%s хочет добавить вас в друзья. Нажмите клавишу 'o', чтобы попасть в меню друзей.", friendName))
	end
	
end

function addFriend(name)
	local friendFound = false
	
	for i=1,table.getn(friends) do
		if(friends[i] == name) then
			friendFound = true
			break
		end
	end
	
	
	if not friendFound then
		table.insert(friends, name)
		local friend = getPlayerFromName(name)
		
		if(friend) then
			markPlayerWithBlip(friend)
		end
		
		friendsUpdateFriendsList()
		msgAdd(string.format("%s был добавлен в друзья.", name))
	end
	
end

function delFriend(name)
	for i=1,table.getn(friends) do
		if(friends[i] == name) then
			table.remove(friends, i)
			local friend = getPlayerFromName(name)
			
			if(friend) then
				removePlayerBlips(friend)
			end
			
			friendsUpdateFriendsList()
			triggerServerEvent("onFriendDel", resourceRoot, localPlayer, name)
			msgAdd(string.format("%s был удален из друзей.", name))
			break
		end
	end
end

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(90 - angle);
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
    return x+dx, y+dy;
end

function jobGuiAddItem(itemType, itemLogo, beginValue)
	table.insert(jobGui, {itemType, itemLogo, beginValue, 1})
	return table.getn(jobGui)
end

function jobGuiRemoveItem(itemId)
	table.remove(jobGui, itemId)
end

function jobGuiDraw()
	for i=1,table.getn(jobGui) do
		dxDrawRectangle(sW/2-jobGuiItemW/2, 10+ (jobGuiItemH+4)* (i-1), jobGuiItemW, jobGuiItemH, tocolor(0, 0, 0, 160*jobGui[i][4]))
		dxDrawImage(sW/2-jobGuiItemW/2+3, 13+ (jobGuiItemH+4)* (i-1), jobGuiLogoW, jobGuiLogoH, jobGui[i][2], 0, 0, 0, tocolor(255, 255, 255, 255*jobGui[i][4]))
		
		if(jobGui[i][1] == 0) then
			if(isTimer(jobGui[i][3])) then
				timeVal = getTimerDetails(jobGui[i][3])
			
			else
				timeVal = jobGui[i][3]
			end
			
			timeMin, timeSec = math.modf(timeVal/60000)
			timeSec = math.floor(timeSec*60)
			
			if(timeMin < 10) then
				if(timeSec < 10) then
					jobGuiValueStr = string.format("0%d:0%d", timeMin, timeSec)
				else
					jobGuiValueStr = string.format("0%d:%d", timeMin, timeSec)
				end
			
			else
				if(timeSec < 10) then
					jobGuiValueStr = string.format("%d:0%d", timeMin, timeSec)
				else
					jobGuiValueStr = string.format("%d:%d", timeMin, timeSec)
				end
			end
			
		elseif(jobGui[i][1] == 1) then
			jobGuiValueStr = string.format("%d%s", math.floor(jobGui[i][3]*100), "%")
			dxDrawRectangle(sW/2-jobGuiItemW/2+6+jobGuiLogoW, 13+ (jobGuiItemH+4)* (i-1), jobGuiContW*jobGui[i][3], jobGuiContH, tocolor(255, 90, 0, 255*jobGui[i][4]))
		end
		
		dxDrawText(jobGuiValueStr, sW/2-jobGuiItemW/2+6+jobGuiLogoW, 13+ (jobGuiItemH+4)* (i-1), sW/2-jobGuiItemW/2+6+jobGuiLogoW+jobGuiContW, 13+ (jobGuiItemH+4)* (i-1)+jobGuiContH, tocolor(255, 255, 255, 255*jobGui[i][4]), scaleMult, "default-bold", "center", "center")
	end
end

resplayMessagesEnabled = true

function msgAdd(text)
	local msgExists = false
	if curMsg then
		msgExists = (curMsg[1] == text)
	end
	
	if not msgExists then
		
		for i=1,table.getn(msgQueue) do
			if(msgQueue[i][1] == text) then
				msgExists = true
				break
			end
		end
		
		if not msgExists then
			table.insert(msgQueue, { text, 10000, 0 })
		end
		
	end
end

function msgSkip(button, pressed)
	if((button == "0") and pressed) then
		if not (curMsg == nil) then
			curMsg[2] = 0
		end
	end
end

function msgDraw()
	if(curMsg == nil) then
		if(table.getn(msgQueue) > 0) and(not ammuMenuOpened) then
			curMsg = msgQueue[1]
			curMsg[3] = getTickCount()
			outputConsole(string.format("RESPLAY: %s", curMsg[1]))
			playSFX("genrl", 52, 14, false)
			
			for mPattern,mSound in pairs(msgSounds) do
				if string.find(curMsg[1], mPattern) then
					playSound("audio/"..mSound)
					break
				end
			end
			
			table.remove(msgQueue, 1)
		
		else
			curMsg = nil
		end
		
	else
		if(curMsg[2] > 9875) then
			progress = (10000-curMsg[2])/125
			startX = sW/2-5-130*progress*scaleMult
			startY = sH-80*scaleMult
			curW = 10+260*progress*scaleMult
			curH = 10
			isTextDrawing = false
		
		elseif(curMsg[2] > 9750) then
			progress = (9875-curMsg[2])/125
			startX = sW/2-5-130*scaleMult
			startY = sH- (80+60*progress)*scaleMult
			curW = 10+260*scaleMult
			curH = 10+120*progress*scaleMult
			isTextDrawing = false
		
		elseif(curMsg[2] > 250) then
			startX = sW/2-5-130*scaleMult
			startY = sH-140*scaleMult
			curW = 10+260*scaleMult
			curH = 10+120*scaleMult
			isTextDrawing = true
		
		elseif(curMsg[2] > 250) then
			progress = (curMsg[2]-125)/125
			startX = sW/2-5-130*scaleMult
			startY = sH- (80+60*progress)*scaleMult
			curW = 10+260*scaleMult
			curH = 10+120*progress*scaleMult
			isTextDrawing = false
		
		elseif(curMsg[2] > 0) then
			progress = curMsg[2]/125
			startX = sW/2-5-130*progress*scaleMult
			startY = sH-80*scaleMult
			curW = 10+260*progress*scaleMult
			curH = 10
			isTextDrawing = false
		
		else
			curMsg = nil
		end
		
		if not (curMsg == nil) then
			dxDrawRectangle(startX, startY, curW, curH, tocolor(0, 0, 0, 128))
			
			if((curMsg[2]/1000-math.floor(curMsg[2]/1000)) > 0.5) then
				dxDrawLine(startX, startY, startX+curW, startY, tocolor(224, 148, 26, 255))
				dxDrawLine(startX, startY, startX, startY+curH, tocolor(224, 148, 26, 255))
				dxDrawLine(startX+curW, startY, startX+curW, startY+curH, tocolor(224, 148, 26, 255))
				dxDrawLine(startX, startY+curH, startX+curW, startY+curH, tocolor(224, 148, 26, 255))
			end
			
			if(isTextDrawing) then
				dxDrawText(curMsg[1], startX+10, startY+10, startX+curW-10, startY+curH-20, tocolor(255,255,255,255), scaleMult, "default-bold", "left", "center", false, true, false, false)
				dxDrawText("0 - пропустить", startX+10, startY+curH-20, startX+curW-10, startY+curH, tocolor(255,255,255,255), scaleMult*0.75, "default-bold", "center", "center")
			end
			
			curMsg[2] = curMsg[2]- (getTickCount()-curMsg[3])
			curMsg[3] = getTickCount()
		end
	end
end

function showRespectLevel()
	respectDrawEnable(false)
end

function startIntro()
	setCameraMatrix(10000.0, 0.0, 0.0)
	local players = getElementsByType("player")
	
	for _,thePlayer in pairs(players) do
		if(localPlayer ~= thePlayer) then
			exports.voice:setPlayerVoiceMuted(thePlayer, true)
			setSoundVolume(thePlayer, 0.0)
		end
	end
	
	setElementData(localPlayer, "boombox", false)
	--artTex = dxCreateTexture("images/art1.jpg")
	drunkTex = dxCreateTexture("images/drunk16.dds")
	startTex = dxCreateTexture("images/intro_start_ls.png")
	respectTex = dxCreateTexture("images/respectline.png")
	fuelTex = dxCreateTexture("images/fuel.png")
	selCircleTex = dxCreateTexture("images/selcircle.png")
	lowriderChitTex = dxCreateTexture("images/lowrider_chit.png")
	lowriderUpTex = dxCreateTexture("images/lowrider_up.png")
	lowriderDownTex = dxCreateTexture("images/lowrider_down.png")
	lowriderLeftTex = dxCreateTexture("images/lowrider_left.png")
	lowriderRightTex = dxCreateTexture("images/lowrider_right.png")
	lowriderRingTex = dxCreateTexture("images/lowrider_ring.png")
	wantedOnTex = dxCreateTexture("images/wanted_on.png")
	wantedOffTex = dxCreateTexture("images/wanted_off.png")
	skillsTex = dxCreateTexture("images/stats.dds", "dxt3")
	bindKey("k", "down", "Actions menu")
	bindKey("l", "down", "Show respect")
	bindKey("o", "down", "Friends menu")
	bindKey("i", "down", "Inventory")
	bindKey("arrow_u", "down", "Select previous")
	bindKey("arrow_d", "down", "Select next")
	bindKey("arrow_r", "down", "Select right")
	bindKey("arrow_l", "down", "Select left")
	bindKey("enter", "down", "Accept")
	bindKey("backspace", "down", "Decline")
	bindKey("q", "down", "Rotate back")
	bindKey("mouse_wheel_up", "down", "Rotate back")
	bindKey("e", "down", "Rotate forward")
	bindKey("mouse_wheel_down", "down", "Rotate forward")
	bindKey("pgup", "down", "Move up")
	bindKey("pgdn", "down", "Move down")
	fractionInitMenu()
	gangInitMenu()
	local newdff, newtxd, newcol, origdff, origtxd, success
	
	for i=1,table.getn(customCol) do
		newcol = engineLoadCOL("imgres/"..customCol[i][1]..".col")
		
		if newcol then
			success = false
			
			for i2=1,table.getn(customCol[i][2]) do
				repeat
					success = engineReplaceCOL(newcol, customCol[i][2][i2])
				until success
			end
			
		end
	end
	
	for i=1,table.getn(customTxd) do
		newtxd = engineLoadTXD("imgres/"..customTxd[i][1]..".txd")
		
		if newtxd then
			success = false
			
			for i2=1,table.getn(customTxd[i][2]) do
				repeat
					success = engineImportTXD(newtxd, customTxd[i][2][i2])
				until success
			end
		end
		
	end
	
	for i=1,table.getn(customDff) do
		newdff = engineLoadDFF("imgres/"..customDff[i][1]..".dff")
		
		if newdff then
			success = false
			
			for i2=1,table.getn(customDff[i][2]) do
				repeat
					success = engineReplaceModel(newdff, customDff[i][2][i2])
				until success
				engineSetModelLODDistance(customDff[i][2][i2], 300)
			end

		end
		
	end
	
	local ferrisWheelSound = playSound3D("audio/furris_wheel.wav", 390.4, -2028.5, 21.9, true)
	clrTex = dxGetTexturePixels(dxCreateTexture("images/clr.png", "argb", false), 0, 0, 1024, 1024)
	setSoundMaxDistance(ferrisWheelSound, 300)

	-- DEBUG MODE OPTIONS
	debugGuiStr = guiCreateLabel(5, sH-15, sW-5, 15, "www.resplay.ru | vk.com/resplay | https://discord.gg/DVbJccw", false)
	guiLabelSetColor(debugGuiStr, 255, 127, 0)
	setDevelopmentMode(false)
	-- Окклюзии на продакшене выключены для теста
	setOcclusionsEnabled(false)
	outputConsole("SERVER MODE: PRODUCTION MODE")
	-- DEBUG MODE OPTIONS
	
	addEventHandler("onClientRender", root, jobGuiDraw)
	setCameraMatrix(0, 0, 10000, 0, 0, 0)
	tickStart = getTickCount()
	--addEventHandler("onClientRender", root, updateLogo)
	--artTex = createBrowser(sW, sH, false, true, true)
	--addEventHandler("onClientBrowserCreated", artTex, showLogin)
	setPlayerHudComponentVisible("area_name", false)
	setPlayerHudComponentVisible("vehicle_name", false)
	setPlayerHudComponentVisible("radar", false)
	local cameraInfo = introCameras[math.random(#introCameras)]
	setCameraMatrix(cameraInfo[1], cameraInfo[2], cameraInfo[3], cameraInfo[4], cameraInfo[5], cameraInfo[6])
	fadeCamera(true, 0, 0, 0, 0)
	setBlurLevel(0)
	showLogin2()
end

function respectTextFunc(respectVal)
	--outputDebugString(respectVal)
	--return tostring(math.floor(tonumber(respectVal)*100))..'%'
	return "%"
end

--[[
function showLogin()
	addEventHandler("onClientBrowserDocumentReady", artTex, showBackground)
	loadBrowserURL(artTex, "http://www.youtube.com/embed/IaHJoqETajM?start=20&autoplay=1&cc_load_policy=0&controls=0&version=3&disablekb=1&fs=0&iv_load_policy=3&loop=1&modestbranding=1&showinfo=0")
end

function showBackground()
	if artTex then
		addEventHandler("onClientRender", root, updateLogo)
	end
end
]]

function showLogin2()
	introMusic = playSFX("genrl", 75, math.random(0, 7), true)
	triggerServerEvent("onPlayerCheckIfRegistered", resourceRoot, localPlayer)
	loginWindowOpened = true
end

--[[
function updateLogo()
	setBrowserVolume(artTex, 0.0)
	dxDrawImage(0, 0, sW, sH, artTex, 0, 0, 0, tocolor(255,255,255,255))
end
]]

function updateLogoOut()
	--[[
	timeVal = getTickCount()-tickStart
	if(timeVal < 1000) then
		alphaLevel = 255-timeVal*0.255
	else
		alphaLevel = 0
		removeEventHandler("onClientRender", root, updateLogoOut)
		destroyElement(artTex)
	end
	dxDrawImage(0, 0, sW, sH, artTex, 0, 0, 0, tocolor(255,255,255,alphaLevel))
	]]

end

function receiveRegisterCheck(pass)
	local elemLoginReg, passLabelWidth, elemEMailReg, eMailLabelWidth, elemReferrerReg, referrerLabelWidth
	
	if not (pass == nil) then
		if(pass == 0) then
			loginRegWin = guiCreateWindow(sW/2-150, sH/2-67, 300, 134, "Вход", false)
			msgLoginReg = guiCreateLabel(10, 20, 280, 30, "Ваш старый пароль был сброшен. Введите новый пароль.", false, loginRegWin)
			guiLabelSetColor(msgLoginReg, 255, 255, 255)
			guiLabelSetHorizontalAlign(msgLoginReg, "center", true)
			guiLabelSetVerticalAlign(msgLoginReg, "center")
			elemLoginReg = guiCreateLabel(10, 60, 0, 20, "Новый пароль:", false, loginRegWin)
			guiLabelSetColor(elemLoginReg, 255, 255, 255)
			guiLabelSetVerticalAlign(elemLoginReg, "center")
			passLabelWidth = guiLabelGetTextExtent(elemLoginReg)
			guiSetSize(elemLoginReg, passLabelWidth, 20, false)
			passLoginReg = guiCreateEdit(passLabelWidth+20, 60, 270-passLabelWidth, 20, "", false, loginRegWin)
			guiEditSetMaxLength(passLoginReg, 32)
			guiEditSetMasked(passLoginReg, true)
			btnLoginReg = guiCreateButton(100, 90, 100, 34, "Подтвердить", false, loginRegWin)
			addEventHandler("onClientGUIClick", btnLoginReg, changePass, false)
			addEventHandler("onClientKey", root, changePass, false)
		
		else
			accountPass = pass
			loginRegWin = guiCreateWindow(sW/2-150, sH/2-67, 300, 174, "Вход", false)
			msgLoginReg = guiCreateLabel(10, 20, 280, 70, "Игрок с таким никнеймом уже зарегистрирован. Введите ваш пароль.", false, loginRegWin)
			guiLabelSetColor(msgLoginReg, 255, 255, 255)
			guiLabelSetHorizontalAlign(msgLoginReg, "center", true)
			guiLabelSetVerticalAlign(msgLoginReg, "center")
			elemLoginReg = guiCreateLabel(10, 100, 0, 20, "Пароль:", false, loginRegWin)
			guiLabelSetColor(elemLoginReg, 255, 255, 255)
			guiLabelSetVerticalAlign(elemLoginReg, "center")
			passLabelWidth = guiLabelGetTextExtent(elemLoginReg)
			guiSetSize(elemLoginReg, passLabelWidth, 20, false)
			passLoginReg = guiCreateEdit(passLabelWidth+20, 100, 270-passLabelWidth, 20, "", false, loginRegWin)
			guiEditSetMaxLength(passLoginReg, 32)
			guiEditSetMasked(passLoginReg, true)
			btnLoginReg = guiCreateButton(45, 130, 100, 34, "Войти", false, loginRegWin)
			local btnForgotPass = guiCreateButton(155, 130, 100, 34, "Забыл пароль", false, loginRegWin)
			addEventHandler("onClientGUIClick", btnLoginReg, login, false)
			addEventHandler("onClientGUIClick", btnForgotPass, forgotPass, false)
			addEventHandler("onClientKey", root, login, false)
		end
		
	else
		loginRegWin = guiCreateWindow(sW/2-150, sH/2-127, 300, 300, "Регистрация", false)
		msgLoginReg = guiCreateLabel(10, 20, 280, 30, "Добро пожаловать! Введите данные для регистрации.", false, loginRegWin)
		guiLabelSetColor(msgLoginReg, 255, 255, 255)
		guiLabelSetHorizontalAlign(msgLoginReg, "center", true)
		guiLabelSetVerticalAlign(msgLoginReg, "center")
		elemLoginReg = guiCreateLabel(10, 60, 0, 20, "Логин: "..getPlayerName(localPlayer), false, loginRegWin)
		guiLabelSetColor(elemLoginReg, 255, 255, 255)
		guiLabelSetVerticalAlign(elemLoginReg, "center")
		passLabelWidth = guiLabelGetTextExtent(elemLoginReg)
		guiSetSize(elemLoginReg, passLabelWidth, 20, false)
		elemLoginReg = guiCreateLabel(10, 90, 0, 20, "Пароль:", false, loginRegWin)
		guiLabelSetColor(elemLoginReg, 255, 255, 255)
		guiLabelSetVerticalAlign(elemLoginReg, "center")
		passLabelWidth = guiLabelGetTextExtent(elemLoginReg)
		guiSetSize(elemLoginReg, passLabelWidth, 20, false)
		passLoginReg = guiCreateEdit(passLabelWidth+20, 90, 270-passLabelWidth, 20, "", false, loginRegWin)
		guiEditSetMaxLength(passLoginReg, 32)
		guiEditSetMasked(passLoginReg, true)
		elemEMailReg = guiCreateLabel(10, 120, 0, 20, "E-Mail:", false, loginRegWin)
		guiLabelSetColor(elemEMailReg, 255, 255, 255)
		guiLabelSetVerticalAlign(elemEMailReg, "center")
		eMailLabelWidth = guiLabelGetTextExtent(elemEMailReg)
		guiSetSize(elemEMailReg, eMailLabelWidth, 20, false)
		eMailLoginReg = guiCreateEdit(eMailLabelWidth+20, 120, 270-eMailLabelWidth, 20, "", false, loginRegWin)
		guiEditSetMaxLength(eMailLoginReg, 32)

		manRadioButton = guiCreateRadioButton(eMailLabelWidth + 20, 150, 270 - eMailLabelWidth, 20, "Мужчина", false, loginRegWin)
		guiRadioButtonSetSelected(manRadioButton, true)
		womanRadioButton = guiCreateRadioButton(eMailLabelWidth + 20, 180, 270 - eMailLabelWidth, 20, "Женщина", false, loginRegWin)

		elemReferrerReg = guiCreateLabel(10, 210, 0, 20, "Referrer (если есть):", false, loginRegWin)
		guiLabelSetColor(elemReferrerReg, 255, 255, 255)
		guiLabelSetVerticalAlign(elemReferrerReg, "center")
		eMailLabelWidth = guiLabelGetTextExtent(elemReferrerReg)
		guiSetSize(elemReferrerReg, eMailLabelWidth, 20, false)
		referrerLoginReg = guiCreateEdit(eMailLabelWidth+20, 210, 270-eMailLabelWidth, 20, "", false, loginRegWin)
		guiEditSetMaxLength(referrerLoginReg, 32)
		btnLoginReg = guiCreateButton(50, 240, 200, 34, "Зарегистрироваться", false, loginRegWin)
		addEventHandler("onClientGUIClick", btnLoginReg, register, false)
		addEventHandler("onClientKey", root, register, false)
	end
	
	guiBringToFront(passLoginReg)
	guiEditSetCaretIndex(passLoginReg, 1)
	guiWindowSetMovable(loginRegWin, false)
	guiWindowSetSizable(loginRegWin, false)
	showCursor(true)
	showChat(false)
	guiSetInputEnabled(true)
end

function changePass(button, state)
	if((button == "left") or (button == "enter")) and state then
		local curPass = guiGetText(passLoginReg)
		
		if(string.len(curPass) > 0) then
			guiSetEnabled(passLoginReg, false)
			guiSetEnabled(btnLoginReg, false)
			guiLabelSetColor(msgLoginReg, 255, 255, 255)
			guiSetText(msgLoginReg, "Устанавливаю пароль...")
			triggerServerEvent("onPlayerChangePassword", resourceRoot, localPlayer, curPass)
		
		else
			guiLabelSetColor(msgLoginReg, 255, 0, 0)
			guiSetText(msgLoginReg, "Вы не ввели новый пароль")
		end
	end
end

function forgotPass(button, state)
	if(button == "left") and state then
		guiLabelSetColor(msgLoginReg, 255, 255, 255)
		guiSetText(msgLoginReg, "Отправьте письмо с заголовком 'Забыл пароль' и вашим никнеймом на почту resplaymta@gmail.com с того ящика, который был введен при регистрации.")
	end
end

curPass = nil
curEMail = nil
curReferrer = nil
curGender = nil
curCity = nil
function register(button, state)
	if((button == "left") or (button == "enter")) and state then
		curPass = guiGetText(passLoginReg)
		curEMail = guiGetText(eMailLoginReg)
		curReferrer = guiGetText(referrerLoginReg)

		curGender = 1
		if (guiRadioButtonGetSelected(womanRadioButton)) then
			curGender = 2
		end
		
		--[[curCity = 1
		if (guiRadioButtonGetSelected(sfRadioButton)) then
			curCity = 2
		elseif (guiRadioButtonGetSelected(lvRadioButton)) then
			curCity = 3
		end]]

		if((string.len(curPass) > 0) and (string.len(curEMail) > 0)) then
			if(string.lower(curReferrer) == string.lower(getPlayerName(localPlayer))) then
				guiLabelSetColor(msgLoginReg, 255, 0, 0)
				guiSetText(msgLoginReg, "Вы не можете быть сам себе реферрером")
			
			else
				guiSetEnabled(passLoginReg, false)
				guiSetEnabled(eMailLoginReg, false)
				guiSetEnabled(referrerLoginReg, false)
				guiSetEnabled(btnLoginReg, false)
				guiSetEnabled(manRadioButton, false)
				guiSetEnabled(womanRadioButton, false)
				guiLabelSetColor(msgLoginReg, 255, 255, 255)
				guiSetText(msgLoginReg, "Регистрирую...")
			    --triggerServerEvent("onPlayerReg", resourceRoot, localPlayer, curPass, curCity, curEMail, curReferrer, curGender)

				guiSetVisible(loginRegWin, false)

				showRegister2Dialog()
			end
			
		else
			guiLabelSetColor(msgLoginReg, 255, 0, 0)
			guiSetText(msgLoginReg, "Вы не ввели пароль или e-mail")
		end
	end
end

loginRegWin2 = nil
msgLoginReg2 = nil
btnLoginReg2 = nil


function showRegister2Dialog() 
	loginRegWin2 = guiCreateWindow(sW/2-150, sH/2-97, 300, 230, "Регистрация", false)
	msgLoginReg2 = guiCreateLabel(10, 20, 280, 30, "Выберите город:", false, loginRegWin2)
	guiLabelSetColor(msgLoginReg2, 255, 255, 255)
	guiLabelSetHorizontalAlign(msgLoginReg2, "center", true)
	guiLabelSetVerticalAlign(msgLoginReg2, "center")

	lsRadioButton = guiCreateRadioButton(10, 50, 280, 20, "Лос-Сантос", false, loginRegWin2)
	guiRadioButtonSetSelected(lsRadioButton, true)
	sfRadioButton = guiCreateRadioButton(10, 80, 280, 20, "Сан-Фиерро", false, loginRegWin2)
	lvRadioButton = guiCreateRadioButton(10, 110, 280, 20, "Лас-Вентурас", false, loginRegWin2)

	btnLoginReg2 = guiCreateButton(50, 180, 200, 34, "Зарегистрироваться", false, loginRegWin2)
	addEventHandler("onClientGUIClick", btnLoginReg2, register2, false)
	addEventHandler("onClientKey", root, register2, false)

	guiWindowSetMovable(loginRegWin2, false)
	guiWindowSetSizable(loginRegWin2, false)
	showCursor(true)
	showChat(false)
	guiSetInputEnabled(true)
end

function register2(button, state)
	if((button == "left") or (button == "enter")) and state then
		curCity = 1
		if (guiRadioButtonGetSelected(sfRadioButton)) then
			curCity = 2
		elseif (guiRadioButtonGetSelected(lvRadioButton)) then
			curCity = 3
		end

		guiSetEnabled(lsRadioButton, false)
		guiSetEnabled(sfRadioButton, false)
		guiSetEnabled(lvRadioButton, false)
		guiLabelSetColor(msgLoginReg2, 255, 255, 255)
		guiSetText(msgLoginReg2, "Регистрирую...")

		triggerServerEvent("onPlayerReg", resourceRoot, localPlayer, curPass, curCity, curEMail, curReferrer, curGender)
	end
end

function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
	if
		type(sEventName) == 'string' and
		isElement(pElementAttachedTo) and
		type(func) == 'function'
	then
		local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
		
		if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs(aAttachedFunctions) do
				if v == func then
					return true
				end
			end
		end
		
	end

	return false
end

function login(button, state)
	if((button == "left") or (button == "enter")) and state and(not isEventHandlerAdded("onReceiveHash", root, login2)) and(not isEventHandlerAdded("onReceiveAssigned", root, finishLogin)) then
		local curPass = guiGetText(passLoginReg)
		
		if(string.len(curPass) > 0) then
			guiLabelSetColor(msgLoginReg, 255, 255, 255)
			guiSetText(msgLoginReg, "Проверяю пароль...")
			addEventHandler("onReceiveHash", root, login2)
			triggerServerEvent("onPlayerGetHash", resourceRoot, localPlayer, curPass)
		
		else
			guiLabelSetColor(msgLoginReg, 255, 0, 0)
			guiSetText(msgLoginReg, "Вы не ввели пароль")
		end
		
	end
end

function login2(passHash)
	removeEventHandler("onReceiveHash", root, login2)
	
	if(accountPass == passHash) then
		addEventHandler("onReceiveAssigned", root, finishLogin)
		triggerServerEvent("onPlayerGetAssigned", resourceRoot, localPlayer)
	
	else
		guiLabelSetColor(msgLoginReg, 255, 0, 0)
		guiSetText(msgLoginReg, "Неправильный пароль")
	end
	
end

function finishLogin(checkPassed, newNicknameInput)
	removeEventHandler("onReceiveAssigned", root, finishLogin)
	if checkPassed then
		if newNicknameInput then
			changeNickname()
		else
			startGame()
		end
	
	else
		guiLabelSetColor(msgLoginReg, 255, 0, 0)
		guiSetText(msgLoginReg, "Аккаунт присоединен к другому устройству")
	end
end

function changeNickname()
	destroyElement(loginRegWin)
	loginRegWin = guiCreateWindow(sW/2-150, sH/2-67, 300, 134, "Вход", false)
	msgLoginReg = guiCreateLabel(10, 20, 280, 30, "Ваш ник должен соответствовать шаблону 'Имя_Фамилия'. Введите новый ник.", false, loginRegWin)
	guiLabelSetColor(msgLoginReg, 255, 255, 255)
	guiLabelSetHorizontalAlign(msgLoginReg, "center", true)
	guiLabelSetVerticalAlign(msgLoginReg, "center")
	elemLoginReg = guiCreateLabel(10, 60, 0, 20, "Новый ник:", false, loginRegWin)
	guiLabelSetColor(elemLoginReg, 255, 255, 255)
	guiLabelSetVerticalAlign(elemLoginReg, "center")
	passLabelWidth = guiLabelGetTextExtent(elemLoginReg)
	guiSetSize(elemLoginReg, passLabelWidth, 20, false)
	passLoginReg = guiCreateEdit(passLabelWidth+20, 60, 270-passLabelWidth, 20, "", false, loginRegWin)
	guiEditSetMaxLength(passLoginReg, 32)
	btnLoginReg = guiCreateButton(100, 90, 100, 34, "Подтвердить", false, loginRegWin)
	addEventHandler("onClientGUIClick", btnLoginReg, sendNewNickname, false)
	addEventHandler("onClientKey", root, sendNewNickname, false)
	guiBringToFront(passLoginReg)
	guiEditSetCaretIndex(passLoginReg, 1)
	guiWindowSetMovable(loginRegWin, false)
	guiWindowSetSizable(loginRegWin, false)
end

function sendNewNickname(button, state)
	if((button == "left") or (button == "enter")) and state then
		local newNickname = guiGetText(passLoginReg)
		
		if(string.len(newNickname) > 0) then
			if(newNickname == getPlayerName(localPlayer)) then
				guiLabelSetColor(msgLoginReg, 255, 0, 0)
				guiSetText(msgLoginReg, "Никнейм должен отличаться от старого")
			
			else
				guiSetEnabled(passLoginReg, false)
				guiSetEnabled(btnLoginReg, false)
				guiLabelSetColor(msgLoginReg, 255, 255, 255)
				guiSetText(msgLoginReg, "Проверяю никнейм...")
				triggerServerEvent("onPlayerChangeNickname", resourceRoot, localPlayer, newNickname)
			end
		
		else
			guiLabelSetColor(msgLoginReg, 255, 0, 0)
			guiSetText(msgLoginReg, "Вы не ввели новый никнейм")
		end
	end
end

function changeNicknameResult(errorCode)
	if errorCode then
		local errorText
		
		if(errorCode == 1) then
			errorText = "Никнейм не соответствует шаблону 'Имя_Фамилия'"
		
		elseif(errorCode == 2) then
			errorText = "Такой никнейм уже зарегистрирован"
		
		elseif(errorCode == 2) then
			errorText = "Ошибка БД"
		
		else
			errorText = "Неизвестная ошибка("..tostring(errorCode)..")"
		end
		
		guiSetEnabled(passLoginReg, true)
		guiSetEnabled(btnLoginReg, true)
		guiLabelSetColor(msgLoginReg, 255, 0, 0)
		guiSetText(msgLoginReg, errorText)
	end
end

function finishRegistration(success, errorCode)
	if(success) then
		firstTime = true
		startGame()
	else
		guiSetEnabled(passLoginReg, true)
		guiSetEnabled(eMailLoginReg, true)
		guiSetEnabled(referrerLoginReg, true)
		guiSetEnabled(btnLoginReg, true)
		guiLabelSetColor(msgLoginReg2, 255, 0, 0)
		local errorText = "Ошибка"
		
		if errorCode then
			errorText = errorText..": "
			
			if(errorCode == 1) then
				errorText = errorText.."не указана почта"
			
			elseif(errorCode == 2) then
				errorText = errorText.."неправильно введена почта"
			
			elseif(errorCode == 3) then
				errorText = errorText.."не указан пароль"
			
			elseif(errorCode == 4) then
				errorText = errorText.."неправильно введён пароль"
			
			elseif(errorCode == 5) then
				errorText = errorText.."проблема с БД сервера"
			
			elseif(errorCode == 6) then
				errorText = errorText.."проблема при построении данных для сайта"
			
			elseif(errorCode == 7) then
				errorText = errorText.."проблема с доступом к сайту"
			
			elseif(errorCode == 8) then
				errorText = errorText.."лимит аккаунтов для одного ПК"
				guiSetEnabled(btnLoginReg, false)
			
			elseif(errorCode == 9) then
				errorText = errorText.."такого реферрера не существует"
			
			elseif(errorCode == 10) then
				errorText = errorText.."ник не соответствует шаблону 'Имя_Фамилия'"
			
			elseif(errorCode == 11) then
				errorText = errorText.."реферрер зарегистрирован с вашего компьютера"
			
			else
				errorText = errorText.."неизвестно("..tostring(errorCode)..")"
			end
			
		end
		guiSetText(msgLoginReg2, errorText)
	end
end

function finishChangePass(success)
	if(success) then startGame()
	
	else
		guiSetEnabled(passLoginReg, true)
		guiSetEnabled(btnLoginReg, true)
		guiLabelSetColor(msgLoginReg, 255, 0, 0)
		guiSetText(msgLoginReg, "Ошибка при установке пароля")
	end
end

function startGame()
	removeEventHandler("onClientGUIClick", btnLoginReg, login)
	removeEventHandler("onClientGUIClick", btnLoginReg, register)
	removeEventHandler("onClientKey", root, login)
	removeEventHandler("onClientKey", root, register)
	removeEventHandler("onClientGUIClick", btnLoginReg2, register2)
	removeEventHandler("onClientKey", root, register2)
	--removeEventHandler("onClientRender", root, updateLogo)
	msgQueue = {}
	tickStart = getTickCount()
	--addEventHandler("onClientRender", root, updateLogoOut)
	fadeCamera(false, 1, 0, 0, 0)
	playSFX("genrl", 53, 7, false)
	showCursor(false)
	showChat(true)
	guiSetInputMode("no_binds_when_editing")
	destroyElement(loginRegWin)
	destroyElement(loginRegWin2)
	setSoundMaxDistance(playSFX3D("script", 21, 0, 2817.1, -2438.9, 43.1, true), 100)
	setTimer(function()
				addEventHandler("onClientPreRender", root, drawFaces, false)
				addEventHandler("onClientPreRender", root, drawProgressPopups, false)
				addEventHandler("onProcessUserData", root, processUserData_start)
				addEventHandler("onClientKey", root, msgSkip, false)
				addEventHandler("onClientKey", root, heaverDrop, false)
				--addEventHandler("onClientPreRender", root, procBreakableObjects)
				setTimer(drunkProc, 1000, 0)
				addEventHandler("onClientRender", root, drunkRender, false)
				destroyElement(introMusic)
				tickStart = getTickCount()
				setSoundVolume(playSound("audio/intro_out.wav"), gameSoundVolume)
				addEventHandler("onClientRender", root, drawStartGame, false)
			 end, 1250, 1)
	setTimer(function()
				setPlayerHudComponentVisible("radar", true)
				outputChatBox("Нажмите F2 для отключения/включения улучшенной графики")
				triggerServerEvent("onRequestUserData", resourceRoot, localPlayer, true, firstTime)
				setTimer(chatBubbleCheck, 250, 0)
				setTimer(nearbyVehiclesCheck, 250, 0)
				setTimer(sendLookPoint, 50, 0)
				addEventHandler("onClientRender", root, procCarObjects, false)
				addCommandHandler("Actions menu", actionsKeyPressed)
				addCommandHandler("Show respect", showRespectLevel)
				addCommandHandler("Friends menu", friendsMenuKeyPressed)
				addCommandHandler("Inventory", inventoryButtonPressed)
				skillsInit()
				addEventHandler("onClientRender", root, skillsDraw, false)
				setTimer(skillsProc, 500, 0)

				-- Start skin selection if first time entering
				if firstTime and not startSkinChosen then
					setTimer(enableSkinChooser, 2000, 1)
				end

			 end, 5250, 1)
end

-------- SKIN SELECTOR METHODS
function createSkinChooserWindow()
	wdwselector = guiCreateWindow(0.438, 0.880,0.15, 0.10, "Выберите скин", true)
	guiWindowSetMovable(wdwselector, false)
	btnLeft = guiCreateButton(0.0, 0.4, 0.200, 0.350, "<-", true, wdwselector)
	btnRight = guiCreateButton(0.76, 0.4, 0.200, 0.350, "->", true, wdwselector)
	btnSelect = guiCreateButton(0.30, 0.4, 0.400, 0.350, "Выбрать", true, wdwselector)
	guiSetVisible(wdwselector, false)
end

function enableSkinChooser()
	if startSkinChosen then
		return
	end

	createSkinChooserWindow()
	addEventHandler("onClientGUIClick", btnLeft, clientSkinLeft, false)
	addEventHandler("onClientGUIClick", btnSelect, clientSkinSelect, false)
	addEventHandler("onClientGUIClick", btnRight, clientSkinRight, false)

	if (wdwselector ~= nil) then
		guiSetVisible(wdwselector, true)
		triggerServerEvent("FrontCamera", getRootElement(),  localPlayer)
	end 
	showCursor(true)
end
-- /skin cmd for testing
--addCommandHandler("skin", enableSkinChooser, false, false)

function clientSkinSelect(button)
	if button == "left" then
		startSkinChosen = true
		guiSetVisible(wdwselector, false)
		showCursor(false)
		triggerServerEvent("SkinSelected", getRootElement(),  localPlayer)
	end
end

function clientSkinRight(button)
	if button == "left" then
		triggerServerEvent("SkinRight", getRootElement())
	end
end

function clientSkinLeft(button)
	if button == "left" then
		triggerServerEvent("SkinLeft", getRootElement())
	end
end
-------------

function updatePickupText(pup, pupinfo)
	pickupTextArray[pup] = pupinfo
end

function drawPickupText()
	cx,cy,cz = getElementPosition(localCamera)
	local pickups = getElementsWithinColShape(drawNicknamesCol, "pickup")
	local markers = getElementsWithinColShape(drawNicknamesCol, "marker")
	local objects = getElementsWithinColShape(drawNicknamesCol, "object")
	for _,marker in ipairs(markers) do
		table.insert(pickups, marker)
	end
	for _,object in ipairs(objects) do
		table.insert(pickups, object)
	end
	markers = nil
	objects = nil
	local minDist, maxDist
	
	if getElementInterior(localPlayer) == 0 then
		minDist = 10.0
		maxDist = 25.0
	
	else
		minDist = 4.0
		maxDist = 9.0
	end
	
	for i,pup in pairs(pickups) do
		if(pickupTextArray[pup] and isElement(pup) and(getElementInterior(pup) == getElementInterior(localPlayer)) and(getElementDimension(pup) == getElementDimension(localPlayer))) then
			local pupinfo = pickupTextArray[pup]
			puptext = pupinfo[1]
			
			if puptext then
				pupx,pupy,pupz = getElementPosition(pup)
				
				if(getElementType(pup) == "marker") then
					pupz = pupz + getMarkerSize(pup)*0.5
				end
				
				scrx,scry = getScreenFromWorldPosition(pupx,pupy,pupz)
				
				if scrx then
					--pupz = pupz+0.5
					alphaLevel = math.min(160, math.max(0, math.floor((maxDist-getDistanceBetweenPoints3D(cx,cy,cz,pupx,pupy,pupz))/ (maxDist-minDist)*160.0)))
					dxDrawText(puptext, scrx-2, scry-2, scrx-2, scry-2, tocolor(0,0,0,alphaLevel), scaleMult*2.5, "default-bold", "center", "center")
					dxDrawText(puptext, scrx, scry, scrx, scry, tocolor(pupinfo[2],pupinfo[3],pupinfo[4],alphaLevel), scaleMult*2.5, "default-bold", "center", "center")
				end
				
			end
		end
	end
end

function drawStartGame()
	local lW, lH = 173*scaleMult, 72*scaleMult
	timeVal = getTickCount()-tickStart
	setElementFrozen(localPlayer, true)
	
	if(timeVal < 1000) then
		alphaLevel = timeVal*0.255
	
	
	elseif(timeVal < 3000) then
		alphaLevel = 255
	
	elseif(timeVal < 4000) then
		alphaLevel = math.max(4, 5000-timeVal)*0.255
	
	else
		alphaLevel = 0
		removeEventHandler("onClientRender", root, drawStartGame)
		setElementFrozen(localPlayer, false)
	end
	
	dxDrawImage(sW/2-lW/2, sH/2-lH/2, lW, lH, startTex, 0, 0, 0, tocolor(255,255,255,alphaLevel))
end

function loadBots(intId, dimId, cX, cY, cZ)
	local animatedBot
	
	for _,bot in ipairs(bots) do
		if(intId == bot[8]) and((not cX) or (cX and(getDistanceBetweenPoints3D(cX, cY, cZ, bot[2], bot[3], bot[4]) < 100.0))) then
			animatedBot = createPed(bot[1], bot[2], bot[3], bot[4], bot[5], false)
			setElementFrozen(animatedBot, true)
			setElementRotation(animatedBot, 0, 0, bot[5], "default", true)
			setPedAnimation(animatedBot, bot[6], bot[7], -1, true, false, false, false)
			setElementInterior(animatedBot, bot[8])
			setElementDimension(animatedBot, dimId)
			setElementData(animatedBot, "godmode", true, false)
			table.insert(botObjs, animatedBot)
		end
	end
	
end

function unloadInteriorBots()
	local newBotObjs = {}
	for _,bot in ipairs(botObjs) do
		if isElement(bot) then
			if(getElementInterior(bot) == 0) then
				destroyElement(bot)
			else
				table.insert(newBotObjs, bot)
			end
		end
	end
	botObjs = newBotObjs
end

function processUserData_start(userdata, loadedSlots, curWeather, busStopsForClient, trainElementsServer, trainRoutesServer, invSlotNum, jobTaxiLocations, botsArray, pickupTexts)
    busStops = busStopsForClient
	trainElements = trainElementsServer
	trainRoutes = trainRoutesServer
	inventorySlotsNum = invSlotNum
	taxiLocations = jobTaxiLocations
	pickupTextArray = pickupTexts
	bots = botsArray
	removeEventHandler("onProcessUserData", root, processUserData_start)
	loadBots(0, 0)
	actionsMenuWin = guiCreateWindow(sW/2-325, sH/2-200, 650, 400, "Выберите действие", false)
	actionsMenuList = guiCreateGridList(10, 20, 630, 325, false, actionsMenuWin)
	guiGridListSetSortingEnabled(actionsMenuList, false)
	guiGridListAddColumn(actionsMenuList, "Действия", 0.85)
	actionsMenuBtnBack = guiCreateButton(25, 355, 600, 35, "Отмена", false, actionsMenuWin)
	guiSetVisible(actionsMenuWin, false)
	guiWindowSetMovable(actionsMenuWin, false)
	guiWindowSetSizable(actionsMenuWin, false)
	customWalkMenuInit()
	customFightMenuInit()
	gpsInit()
	donateInit()
	animMenu = guiCreateWindow(sW/2-175, sH/2-135, 350, 270, "Выберите анимацию", false)
	animList = guiCreateGridList(10, 20, 330, 195, false, animMenu)
	guiGridListSetSortingEnabled(animList, false)
	guiGridListAddColumn(animList, "Анимации", 0.85)
	local animCancelBtn = guiCreateButton(25, 225, 300, 35, "Отмена", false, animMenu)
	addEventHandler("onClientGUIDoubleClick", animList, animPlay)
	addEventHandler("onClientGUIClick", animCancelBtn, animHideMenu, false)
	guiSetVisible(animMenu, false)
	guiWindowSetMovable(animMenu, false)
	guiWindowSetSizable(animMenu, false)
	friendsMenuWin = guiCreateTabPanel(sW/2-175, sH/2-142.5, 350, 285, false)
	friendsMenuTabFriends = guiCreateTab("Друзья", friendsMenuWin)
	friendsMenuInputAddFriend = guiCreateEdit(5, 5, 260, 25, "Введите имя игрока", false, friendsMenuTabFriends)
	friendsMenuBtnAddFriend = guiCreateButton(270, 5, 75, 25, "Добавить", false, friendsMenuTabFriends)
	friendsMenuListFriends = guiCreateGridList(5, 35, 340, 185, false, friendsMenuTabFriends)
	guiGridListSetSortingEnabled(friendsMenuListFriends, false)
	friendsMenuListFriendsColumn = guiGridListAddColumn(friendsMenuListFriends, "Список друзей", 320)
	friendsMenuBtnDelFriend = guiCreateButton(70, 225, 100, 25, "Удалить", false, friendsMenuTabFriends)
	local friendsMenuBtnClose = guiCreateButton(180, 225, 100, 25, "Закрыть", false, friendsMenuTabFriends)
	addEventHandler("onClientGUIClick", friendsMenuBtnClose, friendsCloseMenu, false)
	friendsMenuTabRequests = guiCreateTab("Заявки", friendsMenuWin)
	friendsMenuListRequests = guiCreateGridList(5, 5, 340, 215, false, friendsMenuTabRequests)
	guiGridListSetSortingEnabled(friendsMenuListRequests, false)
	friendsMenuListRequestsColumn = guiGridListAddColumn(friendsMenuListRequests, "Список заявок", 320)
	friendsMenuBtnRequestAccept = guiCreateButton(5, 225, 100, 25, "Принять", false, friendsMenuTabRequests)
	friendsMenuBtnRequestDecline = guiCreateButton(245, 225, 100, 25, "Отклонить", false, friendsMenuTabRequests)
	guiSetVisible(friendsMenuWin, false)
	browserWin = guiCreateWindow(sW/2-bW/2, sH/2-bH/2, bW, bH, "Туториал", false)
	guiWindowSetMovable(browserWin, false)
	guiWindowSetSizable(browserWin, false)
	local loadingLbl = guiCreateLabel(10, 25, bW-20, bH-65, "Загрузка...", false, browserWin)
	guiLabelSetHorizontalAlign(loadingLbl, "center")
	guiLabelSetVerticalAlign(loadingLbl, "center")
	browserExitBtn = guiCreateButton(bW/2-100, bH-30, 200, 20, "Закрыть", false, browserWin)
	addEventHandler("onClientGUIClick", browserExitBtn, browserClose, false)
	guiSetVisible(browserWin, false)
	setWeather(curWeather)
	curRespect = userdata["respect"]
	addEventHandler("onClientRender", root, drawRespect, false)
	addEventHandler("onClientRender", root, busesDrawText, false)
	addEventHandler("onClientRender", root, taxiCarsRender, false)
	inventoryInit(loadedSlots)
	setTimer(function()
				drawNicknamesCol = createColSphere(0, 0, 0, 25)
				attachElements(drawNicknamesCol, localPlayer)
				addEventHandler("onClientRender", root, drawNicknames, false)
				addEventHandler("onClientRender", root, msgDraw, false)
				addEventHandler("onClientRender", root, fuelDraw, false)
				addEventHandler("onClientRender", root, drawPickupText, false)
				addEventHandler("onClientRender", root, heaverDraw, false)
				addEventHandler("onClientRender", root, drawGui3DPopups, false)
				addEventHandler("onClientPreRender", root, misPassedGuiDraw, false)
				addEventHandler("onTrainSync", root, trainMove)
				msgAdd("Добро пожаловать на сервер. Приятной игры!")
				--addEventHandler("onClientKey", root, actionsKeyPressed)
				--addEventHandler("onClientKey", root, friendsMenuKeyPressed)
				addEventHandler("onClientGUIDoubleClick", friendsMenuListFriends, friendsClickFriend, false)
				setTimer(loadFaces, 2000, 0)
				setTimer(friendBlipsProcess, 2000, 0)
				
				--[[if not firstTime then
					fadeCamera(true, 1.0)
				end--]]
				fadeCamera(true, 1.0)
				
			 end, 750, 1)
end

function firstTutorialAccept()
	destroyRequestWindow()
	triggerEvent("onTutorialShow", localPlayer, firstTimeTutorial[1], firstTimeTutorial[2])
end

function firstTutorialDecline()
	destroyRequestWindow()
end

function turnOffActionsMenu()
	if(actionsMenuShow) then
		removeEventHandler("onClientGUIDoubleClick", actionsMenuList, formActionCommand)
		removeEventHandler("onClientGUIClick", actionsMenuBtnBack, actionsMenuCancelled)
		guiSetVisible(actionsMenuWin, false)
		removeCommandHandler("Select previous", actionsMenuSelectPrev)
		removeCommandHandler("Select next", actionsMenuSelectNext)
		removeCommandHandler("Accept", formActionCommand)
		removeCommandHandler("Decline", actionsMenuCancelled)
		guiSetInputMode("no_binds_when_editing")
		actionsMenuShow = false
		checkCursor()
	end
end

formingActionsList = false

function actionsKeyPressed()
	--if((keyName == "k") and(pressed) and(not isChatBoxInputActive())) then
	
	if(actionsMenuShow) then
		turnOffActionsMenu()
	
	elseif actionsMenuAvailable and(not isPedDead(localPlayer)) and(not furnitureSelectedObj) then
		turnOffMenus()
		actionsMenuAvailable = false
		triggerServerEvent("onRequestActionsList", resourceRoot, localPlayer)
	end
	
end

function actionsMenuCancelled(button)
	if(button == "left") or (button == "Decline") then
		playSFX("genrl", 53, 0, false)
		turnOffActionsMenu()
	end
end

function formActionCommand(button)
	if(button == "left") or (button == "Accept") then
		selAction = guiGridListGetSelectedItem(actionsMenuList)+1
		
		if(selAction > 0) then
			playSFX("genrl", 53, 7, false)
			turnOffActionsMenu()
			removeEventHandler("onClientGUIDoubleClick", actionsMenuList, formActionCommand)
			
			if(actionsList[selAction][4] == nil) then
				sendActionCommand(selAction, nil)
			
			else
				local colorBtn = nil
				actionsMenuAvailable = false
				local extraParamsNum = table.getn(actionsList[selAction][4])
				local wH = 65+30*extraParamsNum
				actionExtraParamsWin = guiCreateWindow(sW/2-125, sH/2-wH/2, 250, wH, "Доп. параметры", false)
				local paramLabel, paramLabelW
				actionExtraParamsInputs = {}
				local firstInput
				
				for i=1,extraParamsNum do
					paramLabel = guiCreateLabel(10, 20+30* (i-1), 0, 20, actionsList[selAction][4][i], false, actionExtraParamsWin)
					guiLabelSetColor(paramLabel, 255, 255, 255)
					guiLabelSetVerticalAlign(paramLabel, "center")
					paramLabelW = guiLabelGetTextExtent(paramLabel)
					guiSetSize(paramLabel, paramLabelW, 20, false)
					
					if(actionsList[selAction][4][i] == "Цвет") then
						colorBtn = guiCreateButton(20+paramLabelW, 20+30* (i-1), 220-paramLabelW, 20, "255, 255, 255", false, actionExtraParamsWin)
						addEventHandler("onClientGUIClick", colorBtn, enterActionColorOpen, false)
						table.insert(actionExtraParamsInputs, colorBtn)
					
					else
						table.insert(actionExtraParamsInputs, guiCreateEdit(20+paramLabelW, 20+30* (i-1), 220-paramLabelW, 20, "", false, actionExtraParamsWin))
						
						if not firstInput then
							firstInput = i
						end
						
					end
					
				end
				
				actionExtraParamsBtnOK = guiCreateButton(25, wH-45, 200, 35, "ОК", false, actionExtraParamsWin)
				showCursor(true)
				guiWindowSetMovable(actionExtraParamsWin, false)
				guiWindowSetSizable(actionExtraParamsWin, false)
				guiSetInputMode("no_binds_when_editing")
				guiBringToFront(actionExtraParamsInputs[firstInput])
				guiEditSetCaretIndex(actionExtraParamsInputs[firstInput], 1)
				addEventHandler("onClientGUIClick", actionExtraParamsBtnOK, enterActionExtraParams, false)
				addEventHandler("onClientKey", root, enterActionExtraParams, false)
				guiSetInputMode("no_binds_when_editing")
			end
		end
	end
end

function enterActionExtraParams(button)
	if(button == "left") or (button == "enter") then
		removeEventHandler("onClientGUIClick", actionExtraParamsBtnOK, enterActionExtraParams)
		removeEventHandler("onClientKey", root, enterActionExtraParams)
		playSFX("genrl", 53, 7, false)
		
		for i=1,table.getn(actionExtraParamsInputs) do
			table.insert(actionsList[selAction][3], guiGetText(actionExtraParamsInputs[i]))
		end
		
		destroyElement(actionExtraParamsWin)
		checkCursor()
		guiSetInputMode("no_binds_when_editing")
		actionsMenuAvailable = true
		sendActionCommand(selAction)
	end
end

function enterActionColorOpen(button)
	if(button == "left") then
		actionExtraParamsColorElem = source
		wW = 300
		wH = wW
		guiSetVisible(actionExtraParamsWin, false)
		colorWindowOpen(sW/2-wW/2, sH/2-wH/2, wW, wH, enterActionColorSelect, enterActionColorCancel, nil, "Выбор цвета", 0, 0)
	end
end

function enterActionColorSelect(button)
	if(button == "left") or (button == "enter") then
		colorWindowClose()
		guiSetVisible(actionExtraParamsWin, true)
		guiSetText(actionExtraParamsColorElem, string.format("%d, %d, %d", clrSelR, clrSelG, clrSelB))
		actionExtraParamsColorElem = nil
	end
end

function enterActionColorCancel(button)
	if(button == "left") then
		guiSetVisible(actionExtraParamsWin, true)
	end
end

function colorWindowOpen(wX, wY, wW, wH, funcSelect, funcCancel, funcChange, winName, pX, pY)
	if not isElement(clrWin) then
		clrWin = guiCreateWindow(wX, wY, wW, wH, winName, false)
		clrImg = guiCreateStaticImage(10, 25, wW-10, wH-60, "images/clr.png", false, clrWin)
		addEventHandler("onClientGUIClick", clrImg, colorWindowChange, false)
		
		if funcChange then
			addEventHandler("onClientGUIClick", clrImg, funcChange, false)
		end
		
		local clrBtnCancel = guiCreateButton(wW/2+5, wH-30, wW/2-15, 25, "Отмена", false, clrWin)
		addEventHandler("onClientGUIClick", clrBtnCancel, colorWindowCancel, false)
		
		if funcCancel then
			addEventHandler("onClientGUIClick", clrBtnCancel, funcCancel, false)
		end
		
		clrBtn = guiCreateButton(10, wH-30, wW/2-15, 25, "Выбрать", false, clrWin)
		
		if funcSelect then
			addEventHandler("onClientGUIClick", clrBtn, funcSelect, false)
		end
		
		guiWindowSetMovable(clrWin, false)
		guiWindowSetSizable(clrWin, false)
		colorWindowChange("left", "down", wX+pX/512.0* (wW-10)+10, wY+pY/512.0* (wH-60)+25)
		addEventHandler("onClientRender", root, colorWindowRender)
	end
end

function colorWindowCancel(button)
	if(button == "left") and isElement(clrWin) then
		colorWindowClose()
	end
end

function colorWindowChange(button, state, cX, cY)
	if(button == "left") and isElement(clrWin) then
		local wX, wY = guiGetPosition(clrWin, false)
		local iW, iH = guiGetSize(clrImg, false)
		clrSelX = math.min(512, math.max(512/iW* (cX-wX-10), 0))
		clrSelY = math.min(512, math.max(512/iH* (cY-wY-25), 0))
		clrSelR, clrSelG, clrSelB = dxGetPixelColor(clrTex, clrSelX, clrSelY)
		guiSetProperty(clrBtn, "NormalTextColour", "FF"..RGBToHex(clrSelR, clrSelG, clrSelB))
	end
end

function colorWindowRender()
	alphaLevel = math.fmod(getTickCount(), 1000)
	
	if(alphaLevel > 500) then
		alphaLevel = 1000-alphaLevel
	end
	
	alphaLevel = alphaLevel*0.255
	iX, iY = guiGetPosition(clrWin, false)
	iW, iH = guiGetSize(clrImg, false)
	iX = iX+5+clrSelX/512.0*iW
	iY = iY+20+clrSelY/512.0*iH
	dxDrawImage(iX, iY, 10, 10, selCircleTex, 0, 0, 0, tocolor(255,255,255,alphaLevel), true)
end

function colorWindowClose()
	if isElement(clrWin) then
		removeEventHandler("onClientRender", root, colorWindowRender)
		destroyElement(clrWin)
		clrWin = nil
		clrImg = nil
	end
end

function sendActionCommand(selAction)
	triggerServerEvent("onPlayerSelectAction", resourceRoot, localPlayer, actionsList[selAction][1], actionsList[selAction][3])
end

--addEvent("onSendActionCommand", true)
--addEventHandler("onSendActionCommand", root, sendActionCommand)

-- DEBUG MODE OPTIONS
function updateMemoryMonitor(memserver)
	local dxTable = dxGetStatus()
	guiSetText(debugGuiStr, string.format("SERVER: %d KB | CLIENT: %d KB | VIDEO: %d MB free", memserver, collectgarbage("count"), dxTable["VideoMemoryFreeForMTA"]))
	
	if not debugModeEnabled then
		debugModeEnabled = true
		setDevelopmentMode(true)
		setOcclusionsEnabled(false)
		outputConsole("SERVER MODE: DEBUG ENABLED")
	end

end
-- DEBUG MODE OPTIONS

function receiveActionsList(alist)
	actionsList = alist
	local px, py, pz = getElementPosition(localPlayer)
	local _, _, prz = getElementRotation(localPlayer)
	local px2, py2 = getPointFromDistanceRotation(px, py, 1.0, -prz)
	local hit, _, _, _, _, _, _, _, _, _, _, mId = processLineOfSight(px, py, pz, px2, py2, pz, true, true, true, true, true, false, false, false, localPlayer, true, false)
	
	if not getPedOccupiedVehicle(localPlayer) then
		if hit and mId then
			
			if(mId == 955) or (mId == 1775) then
				table.insert(actionsList, { 10001, string.format("Автомат - Купить газировку($%d)", 10), { 10 }, nil, 0, 255, 0 })
			
			elseif(mId == 956) or (mId == 1776) then
				table.insert(actionsList, { 10009, string.format("Автомат - Купить орешки($%d)", 5), { 5 }, nil, 0, 255, 0 })
			end
			
		end
		
		if isElement(houseExitPickup) then
			local ex, ey, ez = getElementPosition(houseExitPickup)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 2.0) then
				table.insert(actionsList, { 10002, "Дом - Выйти", {}, nil, 0, 255, 0 })
			end
			
		end
		
		if isElement(ammuExit) then
			local ex, ey, ez = getElementPosition(ammuExit)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 2.0) then
				table.insert(actionsList, { 10003, "Аммуниция - Выйти", {}, nil, 0, 255, 0 })
			end
			
		end
		
		if isElement(ammuSeller) then
			local ex, ey, ez = getElementPosition(ammuSeller)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 3.0) then
				table.insert(actionsList, { 10004, "Аммуниция - Купить оружие", {}, nil, 0, 255, 0 })
				--table.insert(actionsList, { 10008, string.format("Продать ящик с оружием($%d)", inventoryItems[10][3]), {}, nil, 0, 255, 0 })
			end
			
		end
		
		if isElement(eatExit) then
			local ex, ey, ez = getElementPosition(eatExit)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 2.0) then
				table.insert(actionsList, { 10005, "Здание - Выйти", {}, nil, 0, 255, 0 })
			end
			
		end
		
		if isElement(eatSeller) then
			local ex, ey, ez = getElementPosition(eatSeller)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 3.0) then
				local itemId
				
				for i=1,table.getn(eatAvailableFood) do
					itemId = eatAvailableFood[i]
					
					if(itemId > 400) and(itemId < 447) then
						table.insert(actionsList, { 10006, string.format("Продавец - Купить %s($%d)", getWeaponNameFromID(itemId-400), 150), { itemId, 150 }, nil, 0, 255, 0 })
					
					else
						table.insert(actionsList, { 10006, string.format("Продавец - Купить %s($%d)", inventoryItems[itemId][1], inventoryItems[itemId][3]), { itemId, inventoryItems[itemId][3] }, nil, 0, 255, 0 })
					end
					
				end
				
				if(getElementModel(eatSeller) == 36) then
					for slotId,slotInfo in ipairs(inventorySlots) do
						if inventorySellable[slotInfo[1]] then
							table.insert(actionsList, { 10010, string.format("Продавец - Продать %s($%d)", inventoryItems[slotInfo[1]][1], inventoryItems[slotInfo[1]][3]), { slotId, slotInfo[1] }, nil, 0, 255, 0 })
						end
					end
				end
				
			end
		end
		
		if isElement(otbExit) then
			local ex, ey, ez = getElementPosition(otbExit)
			
			if(getDistanceBetweenPoints3D(ex, ey, ez, px, py, pz) < 2.0) then
				table.insert(actionsList, { 10007, "Букмекерская контора - Выйти", {}, nil, 0, 255, 0 })
			end
			
		end
	end
	
	if(table.getn(actionsList) > 0) then
		turnOffMenus()
		guiGridListClear(actionsMenuList)
		table.sort(actionsList, receiveActionsListSort)
		local i = 1
		local dup = 1
		
		repeat
			while(i < table.getn(actionsList)) and(actionsList[i][2] == actionsList[i+1][2]) do
				table.remove(actionsList, i+1)
				dup = dup + 1
			end
			
			if(dup > 1) then
				actionsList[i][2] = actionsList[i][2].." [x"..tostring(dup).."]"
				dup = 0
			end
			
			i = i + 1
		until(i >= table.getn(actionsList))
		local row
		
		for _,action in ipairs(actionsList) do
			row = guiGridListAddRow(actionsMenuList)
			guiGridListSetItemText(actionsMenuList, row, 1, action[2], false, false)
			guiGridListSetItemColor(actionsMenuList, row, 1, action[5], action[6], action[7])
		end
		
		addEventHandler("onClientGUIDoubleClick", actionsMenuList, formActionCommand)
		addEventHandler("onClientGUIClick", actionsMenuBtnBack, actionsMenuCancelled, false)
		guiSetVisible(actionsMenuWin, true)
		addCommandHandler("Select previous", actionsMenuSelectPrev)
		addCommandHandler("Select next", actionsMenuSelectNext)
		addCommandHandler("Accept", formActionCommand)
		addCommandHandler("Decline", actionsMenuCancelled)
		guiBringToFront(actionsMenuWin)
		--guiEditSetCaretIndex(actionsMenuList, 1)
		guiSetInputMode("no_binds_when_editing")
		actionsMenuShow = true
		setTimer(actionsMenuSetAvailable, 1000, 1, true)
		showCursor(true)
	end
end

function actionsMenuSelectPrev()
	if actionsMenuShow then
		local row, clmn = guiGridListGetSelectedItem(actionsMenuList)
		local maxRow = guiGridListGetRowCount(actionsMenuList)
		row = math.min(maxRow-1, math.max(0, row-1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(actionsMenuList, math.ceil(row*100.0/guiGridListGetRowCount(actionsMenuList)))
		guiGridListSetSelectedItem(actionsMenuList, row, clmn)
	end
end

function actionsMenuSelectNext()
	if actionsMenuShow then
		local row, clmn = guiGridListGetSelectedItem(actionsMenuList)
		local maxRow = guiGridListGetRowCount(actionsMenuList)
		row = math.min(maxRow-1, math.max(0, row+1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(actionsMenuList, math.ceil(row*100.0/maxRow))
		guiGridListSetSelectedItem(actionsMenuList, row, clmn)
	end
end

function actionsMenuSetAvailable(avlbl)
	if avlbl then
		actionsMenuAvailable = true
	else
		actionsMenuAvailable = false
	end
end

function receiveActionsListSort(a, b)
	if(a[5] == b[5]) and(a[6] == b[6]) and(a[7] == b[7]) then
		return string.lower(a[2]) < string.lower(b[2])
	
	else
		local lvla, lvlb
		
		if(a[5] == 255) and(a[6] == 0) and(a[7] == 0) then
			lvla = 1
		
		elseif(a[5] == 0) and(a[6] == 255) and(a[7] == 0) then
			lvla = 2
		
		elseif(a[5] == 255) and(a[6] == 255) and(a[7] == 0) then
			lvla = 3
		
		else
			lvla = 4
		end
		
		if(b[5] == 255) and(b[6] == 0) and(b[7] == 0) then
			lvlb = 1
		
		elseif(b[5] == 0) and(b[6] == 255) and(b[7] == 0) then
			lvlb = 2
		
		elseif(b[5] == 255) and(b[6] == 255) and(b[7] == 0) then
			lvlb = 3
		
		else
			lvlb = 4
		end
		
		return lvla < lvlb
		
	end
end

function startJob(jobId, params)
	if(isOnJob == false) then
		isOnJob = true
		curJobId = jobId
		
		if(jobId == 1) then -- Вывоз мусора
			jobTimeCur = params[1]
			jobTrashmasterFilled = 0
			jobTrashmasterMaxFillness = params[2]
			jobTrashmasterGuiFillId = jobGuiAddItem(1, "images/408.png", 0)
			msgAdd("Останавливайтесь на зеленых маркерах для того, чтобы собирать мусор. Время на работу ограничено.")
			msgAdd("После окончания времени верните мусоровоз на место, иначе будете оштрафованы.")
			msgAdd("Вы можете в любое время починить мусоровоз, разгрузить мусор или закончить работу, воспользовавшись маркерами на свалке")
			--jobLaunchTimer()
			addEventHandler("onJobProgress", root, jobTrashmasterProgress)
		
		elseif(jobId == 2) then -- Мойка дорог
			jobTimeCur = params[1]
			msgAdd("Останавливайтесь на голубых маркерах для мойки определенного участка дороги. Время на работу ограничено.")
			msgAdd("После окончания времени верните машину на место, иначе будете оштрафованы.")
			msgAdd("Вы можете в любое время починить машину или закончить работу, воспользовавшись маркерами на свалке")
			--jobLaunchTimer()
			addEventHandler("onJobProgress", root, jobWashroadsProgress)
		
		elseif(jobId == 3) then -- Газонокосилка
			msgAdd("Нестриженные газоны обозначены ножницами на радаре. Встаньте на зеленый маркер, чтобы начать стрижку газона.")
			msgAdd("Верните газонокосилку на место, если хотите закончить работу. Иначе будете оштрафованы.")
			msgAdd("Вы можете в любое время починить газонокосилку или закончить работу, воспользовавшись маркерами на свалке.")
			addEventHandler("onJobProgress", root, jobLawnmowProgress)
		
		elseif(jobId == 4) then -- Эвакуатор
			msgAdd("Эвакуаторщик может предложить любому игроку починить или заправить транспортное средство через меню действий.")
			msgAdd("Поступающие заказы появляются на радаре в виде временных желтых маркеров.")
			msgAdd("Верните эвакуатор на место, если хотите закончить работу. Иначе будете оштрафованы.")
			msgAdd("Вы можете в любое время починить эвакуатор или завершить работу, воспользовавшись маркерами на свалке.")
		
		elseif(jobId == 5) then -- Перевозка грузов
			jobTimeCur = params[4]
			jobTruckerFinishCp = createMarker(params[1], params[2], params[3], "checkpoint", 4.0, 255, 255, 0)
			jobTruckerFinishBlip = createBlip(0, 0, 0, 0, 2, 255, 255)
			attachElements(jobTruckerFinishBlip, jobTruckerFinishCp)
			jobTruckerMoneyForDelivery = params[5]
			addEventHandler("onClientMarkerHit", jobTruckerFinishCp, jobTruckerOnFinish)
			msgAdd("Ваша задача - доставить груз до места назначения(желтый маркер на радаре).")
			jobLaunchTimer()
		
		elseif(jobId == 6) then
			msgAdd("Временные маркеры вызова скорой помощи появляются на карте.")
			msgAdd("Вы можете вылечить игрока, когда окажетесь достаточно близко к нему.")
			msgAdd("Для предложения лечения вам необходимо воспользоваться меню действий.")
			msgAdd("Вы должны вернуть машину к госпиталю, если хотите закончить работу. Иначе вы будете оштрафованы.")
		
		elseif(jobId == 9) then
			jobTimeCur = params[1]
			jobLaunchTimer()
		
		elseif(jobId == 10) then
			msgAdd("Пока вы находитесь в такси, в чате и на радаре будут появляться заказы игроков.")
			msgAdd("Также вы можете подбирать игроков прямо на улице.")
		
		elseif(jobId == 11) then
			msgAdd("Ищите потенциальных клиентов, которым требуется еда или питьё.")
			msgAdd("Клиент, подбежав к вашему транспортному средству, сможет купить что-нибудь с помощью меню действий.")
			msgAdd("Для завершения работы встаньте в красном маркере рядом с кафе, столовой или иной забегаловкой.")
		
		else
			triggerEvent("onWorkStart", root, jobId)
		end
		
	else
		msgAdd("Вы не можете начать новую работу, пока не закончили старую")
	end
end

function endJob(jobId, reason)
	if(isOnJob == true) then
		triggerEvent("onWorkFinish", root, jobId, reason)
		isOnJob = false
		local reasonText
		
		if(reason == 1) then
			reasonText = "Успех"
			playSuccessMusic()
		
		elseif(reason == 2) then
			reasonText = "Вы погибли"
		
		elseif(reason == 3) then
			reasonText = "Вы не вернулись в транспортное средство"
		
		elseif(reason == 4) then
			reasonText = "Транспортное средство уничтожено"
		
		elseif(reason == 5) then
			reasonText = "Время вышло"
		
		elseif(reason == 6) then
			reasonText = "Недостаточно уважения или денег"
		
		elseif(reason == -1) then
			reasonText = "Ваш статус был сменён"
		
		else
			reasonText = "Причина неизвестна"
		end
		
		msgAdd("Работа окончена. "..reasonText..".")
		
		if(reason == 1) then
			misPassedGuiTime = misPassedGuiDefaultTime
		end
		
		jobStopTimer()
		for i=1,table.getn(jobGui) do
			table.remove(jobGui, i)
		end
		
		if(isElement(jobTruckerFinishCp)) then
			destroyElement(jobTruckerFinishCp)
		end
		
		if(isElement(jobTruckerFinishBlip)) then
			destroyElement(jobTruckerFinishBlip)
		end
		
		if(isElement(jobVehMarker)) then
			destroyElement(jobVehMarker)
		end
		
		if(isTimer(jobTimerBackToVeh)) then
			killTimer(jobTimerBackToVeh)
		end
		
		if(isTimer(jobLawnmowPickupTimer)) then
			killTimer(jobLawnmowPickupTimer)
		end
		
		for i=1,table.getn(jobLawnmowPickups) do
			destroyElement(jobLawnmowPickups[i])
			destroyElement(jobLawnmowPickupBlips[i])
		end
		
		jobLawnmowPickups = {}
		jobLawnmowPickupBlips = {}
		removeEventHandler("onJobProgress", root, jobTrashmasterProgress)
		removeEventHandler("onJobProgress", root, jobWashroadsProgress)
		removeEventHandler("onJobProgress", root, jobLawnmowProgress)
		
		if(isElement(jobTruckerFinishCp)) then
			removeEventHandler("onClientMarkerHit", jobTruckerFinishCp, jobTruckerOnFinish)
		end
		
	end
end

function jobTimesUp()
	msgAdd("Время вышло.")
	jobGuiRemoveItem(jobTimerGuiId)
	
	if(curJobId == 1) then
		removeEventHandler("onJobProgress", root, jobTrashmasterProgress)
		triggerServerEvent("onJobTrashmasterTimesup", resourceRoot, localPlayer)
		msgAdd("Верните мусоровоз в коммунальные службы.")
	
	elseif(curJobId == 2) then
		removeEventHandler("onJobProgress", root, jobWashroadsProgress)
		triggerServerEvent("onJobWashroadsTimesup", resourceRoot, localPlayer)
		msgAdd("Верните машину в коммунальные службы.")
	
	elseif(curJobId == 3) then
		msgAdd("Верните газонокосилку в коммунальные службы.")
	
	elseif(curJobId == 4) then
		msgAdd("Верните эвакуатор в коммунальные службы.")
	
	elseif(curJobId == 5) then
		jobTruckerMoneyForDelivery = 0
		msgAdd("Теперь вы не получите деньги за просроченный заказ.")
	
	elseif(curJobId == 9) then
		triggerServerEvent("onMilitaryGeneralTimesup", resourceRoot, localPlayer)
	end
	
end

function jobLaunchTimer()
	if(not isTimer(jobTimer)) and(jobTimeCur > 0) then
		jobTimer = setTimer(jobTimesUp, jobTimeCur, 1)
		jobTimerGuiId = jobGuiAddItem(0, "images/timer.png", jobTimer)
	end
end

function jobStopTimer()
	if(isTimer(jobTimer)) then
		jobTimeCur = getTimerDetails(jobTimer)
		jobGuiRemoveItem(jobTimerGuiId)
		killTimer(jobTimer)
	end
end

function jobTruckerOnFinish(hitPlayer)
	if(hitPlayer == localPlayer) then
		triggerServerEvent("onJobTruckerFinish", resourceRoot, localPlayer, jobTruckerMoneyForDelivery)
	end
end

function jobTruckerOnStartReturn(fx, fy, fz)
	jobStopTimer()
	jobTimeCur = 0
	removeEventHandler("onClientMarkerHit", jobTruckerFinishCp, jobTruckerOnFinish)
	setElementPosition(jobTruckerFinishCp, fx, fy, fz)
	setTimer(function()
				addEventHandler("onClientMarkerHit", jobTruckerFinishCp, jobTruckerOnFinishReturn)
			 end, 1000, 1)
	msgAdd("Верните транспортное средство на первоначальное место.")
end

function jobTruckerOnFinishReturn(hitPlayer)
	if(hitPlayer == localPlayer) then
		triggerServerEvent("onJobTruckerFinishReturn", localPlayer)
	end
end

function jobTruckerLeaveVehicle(curState, timeBackToVeh, jobVeh)
	if(isElement(jobVehMarker)) then
		destroyElement(jobVehMarker)
	end
	
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	
	if not (isTimer(jobTimerBackToVeh)) then
		msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в грузовик.", timeBackToVeh/1000))
		jobTimerBackToVeh = setTimer(function()
										destroyElement(jobVehMarker)
										triggerServerEvent("onJobTruckerLeftVehicle", localPlayer)
									 end, timeBackToVeh, 1)
	end
end

function jobTruckerLeaveTrailer(curState, timeBackToTrailer, trailer)
	if(isElement(jobVehMarker)) then
		destroyElement(jobVehMarker)
	end
	
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, trailer, 0, 0, 5)
	
	if not (isTimer(jobTimerBackToVeh)) then
		msgAdd(string.format("У вас есть %d секунд, чтобы вернуть груз.", timeBackToTrailer/1000))
		jobTimerBackToVeh = setTimer(function()
										destroyElement(jobVehMarker)
										triggerServerEvent("onJobTruckerLeftVehicle", localPlayer)
									 end, timeBackToTrailer, 1)
	end
	
end

function jobTruckerBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	
	if(jobStateCur == 0) then
		jobLaunchTimer()
	end
	
	triggerServerEvent("onJobTruckerNowInVehicle", localPlayer, jobStateCur)
end

function jobEvacuatorRequestFinishOrder(evacid)
	if not jobEvacuatorFinishOrderShow then
		jobEvacuatorEvacId = evacid
		jobEvacuatorFinishOrderWin = guiCreateWindow(sW/2-100, sH/2-50, 200, 100, "Выполнение заказа", false)
		jobEvacuatorFinishOrderLabel = guiCreateLabel(10, 25, 280, 25, "Выполнен ли заказ(эвакуатор)?", false, jobEvacuatorFinishOrderWin)
		guiLabelSetColor(jobEvacuatorFinishOrderLabel, 255, 255, 255)
		guiLabelSetVerticalAlign(jobEvacuatorFinishOrderLabel, "center")
		jobEvacuatorFinishOrderBtnYes = guiCreateButton(10, 60, 85, 30, "Да", false, jobEvacuatorFinishOrderWin)
		jobEvacuatorFinishOrderBtnNo = guiCreateButton(105, 60, 85, 30, "Нет", false, jobEvacuatorFinishOrderWin)
		showCursor(true)
		guiWindowSetMovable(jobEvacuatorFinishOrderWin, false)
		guiWindowSetSizable(jobEvacuatorFinishOrderWin, false)
		addEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnYes, jobEvacuatorAcceptFinishOrder, false)
		addEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnNo, jobEvacuatorDeclineFinishOrder, false)
		jobEvacuatorFinishOrderShow = true
	end
end

function jobEvacuatorAcceptFinishOrder()
	jobEvacuatorFinishOrderShow = false
	msgAdd("Заказчик подтвердил выполнение заказа.")
	removeEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnYes, jobEvacuatorAcceptFinishOrder)
	removeEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnNo, jobEvacuatorDeclineFinishOrder)
	destroyElement(jobEvacuatorFinishOrderWin)
	checkCursor()
	triggerServerEvent("onJobEvacuatorAcceptFinishOrder", localPlayer, jobEvacuatorEvacId)
end

function jobEvacuatorDeclineFinishOrder()
	jobEvacuatorFinishOrderShow = false
	removeEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnYes, jobEvacuatorAcceptFinishOrder)
	removeEventHandler("onClientGUIClick", jobEvacuatorFinishOrderBtnNo, jobEvacuatorDeclineFinishOrder)
	msgAdd("Заказчик отклонил запрос на завершение заказа. Возможно, заказ не был выполнен.")
	destroyElement(jobEvacuatorFinishOrderWin)
	checkCursor()
	triggerServerEvent("onJobEvacuatorDeclineFinishOrder", localPlayer, jobEvacuatorEvacId)
end

function jobEvacuatorLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в эвакуатор.", timeBackToVeh/1000))
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobEvacuatorLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobEvacuatorBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	triggerServerEvent("onJobEvacuatorNowInVehicle", localPlayer, jobStateCur)
end

function jobLawnmowBeginLawn(lawnid, lawnObjects, lawnVeh)
	local curPickup
	local curBlip
	
	for i=1,table.getn(lawnObjects) do
		curPickup = createObject(865, lawnObjects[i][1], lawnObjects[i][2], lawnObjects[i][3], 0, 0, math.random()*360.0)
		table.insert(jobLawnmowPickups, curPickup)
		curBlip = createBlip(0, 0, 0, 0, 1, 52, 114, 52, 255, 32767)
		table.insert(jobLawnmowPickupBlips, curBlip)
		attachElements(curBlip, curPickup)
	end
	
	jobLawnmowPickupsMax = table.getn(lawnObjects)
	jobLawnmowPickupsCur = 0
	jobGuiAddItem(1, "images/572.png", 0)
	jobLawnmowPickupTimer = setTimer(jobLawnmowCheckPickups, 500, 0, lawnVeh)
end

function jobLawnmowCheckPickups(lawnVeh)
	if(getPedOccupiedVehicle(localPlayer) == lawnVeh) then
		local vx, vy, vz = getElementPosition(lawnVeh)
		local px, py, pz
		
		for i=1,table.getn(jobLawnmowPickups) do
			px, py, pz = getElementPosition(jobLawnmowPickups[i])
			
			if(getDistanceBetweenPoints3D(px, py, pz, vx, vy, vz) < 4) then
				destroyElement(jobLawnmowPickupBlips[i])
				table.remove(jobLawnmowPickupBlips, i)
				destroyElement(jobLawnmowPickups[i])
				table.remove(jobLawnmowPickups, i)
				triggerServerEvent("onJobLawnmowGrassPickedup", localPlayer, vx, vy, vz)
				break
			end
			
		end
	end
end

function jobLawnmowProgress()
	jobLawnmowPickupsCur = jobLawnmowPickupsCur+1
	
	if(jobLawnmowPickupsCur < jobLawnmowPickupsMax) then
		jobGui[1][3] = jobLawnmowPickupsCur/jobLawnmowPickupsMax
	
	else
		jobGuiRemoveItem(1)
		killTimer(jobLawnmowPickupTimer)
		triggerServerEvent("onJobLawnmowDoneWithLawn", localPlayer)
	end
	
end

function jobLawnmowLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в газонокосилку.", timeBackToVeh/1000))
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobLawnmowLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobLawnmowBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	triggerServerEvent("onJobLawnmowNowInVehicle", localPlayer, jobStateCur)
end

function jobWashroadsProgress(incTime)
	jobStopTimer()
	jobTimeCur = math.min(120000, math.max(30000, jobTimeCur+incTime))
	jobLaunchTimer()
end

function jobWashroadsLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в машину.", timeBackToVeh/1000))
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobWashroadsLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobWashroadsBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	
	if(jobStateCur == 0) then
		jobLaunchTimer()
	end
	
	triggerServerEvent("onJobWashroadsNowInVehicle", localPlayer, jobStateCur)
end

function jobTrashmasterProgress(incTime)
	jobStopTimer()
	jobTimeCur = math.min(120000, math.max(30000, jobTimeCur+incTime))
	jobTrashmasterFilled = jobTrashmasterFilled+1
	jobGui[jobTrashmasterGuiFillId][3] = jobTrashmasterFilled/jobTrashmasterMaxFillness
	
	if(jobTrashmasterFilled < jobTrashmasterMaxFillness) then
		jobLaunchTimer()
	else
		triggerServerEvent("onJobTrashmasterFilledMax", localPlayer)
	end
	
end

function jobTrashmasterUnload(continueWork, unloadSpeed)
	if(continueWork) then
		if(jobTrashmasterFilled > 0) then
			local unloadAmount = math.min(unloadSpeed, jobTrashmasterFilled)
			jobTrashmasterFilled = jobTrashmasterFilled-unloadAmount
			jobGui[jobTrashmasterGuiFillId][3] = jobTrashmasterFilled/jobTrashmasterMaxFillness
			
			if(jobTrashmasterFilled == 0) then
				triggerServerEvent("onJobTrashmasterGetMoney", localPlayer, unloadAmount, true)
				jobStopTimer()
				jobTimeCur = jobTimeCur+10000
				jobLaunchTimer()
			else
				triggerServerEvent("onJobTrashmasterGetMoney", localPlayer, unloadAmount, false)
			end
			
		end
	else
		triggerServerEvent("onJobTrashmasterGetMoney", localPlayer, jobTrashmasterFilled, false)
	end
end

function jobTrashmasterLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	
	if(curState == 0) then
		jobStopTimer()
	end
	
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в мусоровоз.", timeBackToVeh/1000))
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobTrashmasterLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobTrashmasterBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	
	if(jobStateCur == 0) then
		jobLaunchTimer()
	end
	
	triggerServerEvent("onJobTrashmasterNowInVehicle", localPlayer, jobStateCur)
end

function serverPlaySound3D(soundPath, sx, sy, sz, sloop, sdist, sattachto, sPos)
	local px, py, pz = getElementPosition(localCamera)
	local lsx, lsy, lsz
	if sattachto then
		lsx, lsy, lsz = getElementPosition(sattachto)
	else
		lsx, lsy, lsz = sx, sy, sz
	end
	
	if(getDistanceBetweenPoints3D(px, py, pz, lsx, lsy, lsz) <= sdist) then
		local sdim,sint = getElementDimension(source),getElementInterior(source)
		
		if(getElementDimension(localPlayer) == sdim) and(getElementInterior(localPlayer) == sint) then
			local curSound = playSound3D(soundPath, sx, sy, sz, sloop)
			setElementDimension(curSound, sdim)
			setElementInterior(curSound, sint)
			setSoundMaxDistance(curSound, sdist)
			
			if(sattachto) then
				attachElements(curSound, sattachto)
			end
			
			
			if(sPos) then
				setSoundPosition(curSound, sPos)
			end
			
		end
	end
end

-- player, obj, sradio, sid, sprogress
local boomboxes = {}

function removeBoombox(boomboxelem)
	local attachedElem = getAttachedElements(boomboxelem)
	for elemKey,elemVal in ipairs(attachedElem) do
		if(getElementType(elemVal) == "sound") then
			destroyElement(elemVal)
			break
		end
	end
end

function switchBoombox(sradio, sid)
	for i=1,table.getn(boomboxes) do
		if(source == boomboxes[i][1]) then
			local attachedElem = getAttachedElements(boomboxes[i][2])
			
			for elemKey,elemVal in ipairs(attachedElem) do
				if(getElementType(elemVal) == "sound") then
					boomboxes[i][3] = sradio
					boomboxes[i][4] = sid
					boomboxes[i][5] = 0
					destroyElement(elemVal)
					break
				end
			end
			
			break
		end
	end
end

function updateBoombox(newArr)
	boomboxes = newArr
end

--[[
function processBoombox()
	local attachedElem, soundElem, dim, intr, spos, corrpos, bbx, bby, bbz
	local px, py, pz = getElementPosition(localCamera)
	for i=1,table.getn(boomboxes) do
		if(isElement(boomboxes[i][2])) then
			bbx,bby,bbz = getElementPosition(boomboxes[i][2])
			if(getDistanceBetweenPoints3D(px, py, pz, bbx, bby, bbz) <= 50) then
				attachedElem = getAttachedElements(boomboxes[i][2])
				soundElem = nil
				for elemKey,elemVal in ipairs(attachedElem) do
					if(getElementType(elemVal) == "sound") then
						soundElem = elemVal
						break
					end
				end
				dim = getElementDimension(boomboxes[i][1])
				intr = getElementInterior(boomboxes[i][1])
				if not soundElem then
					soundElem = playSFX3D("radio", boomboxes[i][3], boomboxes[i][4], 0, 0, 0, true)
					setElementDimension(soundElem, dim)
					setElementInterior(soundElem, intr)
					attachElements(soundElem, boomboxes[i][2])
					setSoundEffectEnabled(soundElem, "reverb", true)
					setSoundMaxDistance(soundElem, 50)
					setSoundVolume(soundElem, gameSoundVolume)
				end
				if not (dim == getElementDimension(soundElem)) then
					setElementDimension(soundElem, dim)
				end
				if not (intr == getElementInterior(soundElem)) then
					setElementInterior(soundElem, intr)
				end
				spos = getSoundPosition(soundElem)
				corrpos = math.fmod(boomboxes[i][5], getSoundLength(soundElem))
				if(math.abs(corrpos-spos) > 1.0) then
					setSoundPosition(soundElem, corrpos)
				end
			end
		end
	end
end
]]

function serverPlaySFX3D(slib, sbank, sid, sx, sy, sz, sloop, sdist, sToAttach, sPos, sTime)
	local px, py, pz = getElementPosition(localCamera)
	local lsx, lsy, lsz
	
	if sToAttach then
		lsx, lsy, lsz = getElementPosition(sToAttach)
	
	else
		lsx, lsy, lsz = sx, sy, sz
	end
	
	if(getDistanceBetweenPoints3D(px, py, pz, lsx, lsy, lsz) <= sdist) then
		local sdim,sint = getElementDimension(source),getElementInterior(source)
		if(getElementDimension(localPlayer) == sdim) and(getElementInterior(localPlayer) == sint) then
			local curSound = playSFX3D(slib, sbank, sid, sx, sy, sz, sloop)
			setElementDimension(curSound, sdim)
			setElementInterior(curSound, sint)
			setSoundMaxDistance(curSound, sdist)
			
			if(sToAttach) then
				attachElements(curSound, sToAttach)
			end
			
			if(sPos) then
				setSoundPosition(curSound, sPos)
			end
			
			if(sTime) then
				setTimer(function(curSound)
							destroyElement(curSound)
						 end, sTime, 1, curSound)
			end
		end
	end
end

function serverCreateEffect(effectname, ex, ey, ez, eden, espeed, etime, eattachto, eattachx, eattachy, eattachz)
	local effect = createEffect(effectname, ex, ey, ez)
	setEffectDensity(effect, eden)
	setEffectSpeed(effect, espeed)
	
	if(etime > 0) then
		setTimer(function(effect)
					setEffectDensity(effect, 0)
					setTimer(function(effect)
								destroyElement(effect)
							 end, 3000, 1, effect)
				 end, etime, 1, effect)
	end
	
	if(eattachto) then
		attachEffect(effect, eattachto, Vector3(eattachx, eattachy, eattachz))
	end
end

function serverDestroyAttachedEffects(eattachto)
	for fx, info in pairs(attachedEffects) do
		if(info.element == eattachto) then
			destroyElement(fx)
		end
	end
end

function loadFaces()
	local allPlayers = getElementsByType("player")
	local cx, cy, cz = getElementPosition(localCamera)
	local px, py, pz, pfacelink, pint, pdim
	local cint = getElementInterior(localPlayer)
	local cdim = getElementDimension(localPlayer)
	for _,plr in ipairs(allPlayers) do
		if not drawingFaces[plr] then
			px, py, pz = getElementPosition(plr)
			local pint = getElementInterior(plr)
			local pdim = getElementDimension(plr)
			
			if(getDistanceBetweenPoints3D(px,py,pz,cx,cy,cz) < 200.0) and(pint == cint) and(pdim == cdim) then
				triggerServerEvent("onPlayerLoadFace", localPlayer, plr)
				drawingFaces[plr] = true
			end
			
		end
	end
end

function receiveFace(imageData, plr)
	local invalidFace = true
	if imageData then
		if(imageData == "EMPTY") then
			drawingFaces[plr] = "EMPTY"
			invalidFace = false
		else
			local tex = dxCreateTexture(imageData)
			
			if tex then
				local w,h = dxGetMaterialSize(tex)
				
				if(w == 256) and(h == 256) then
					drawingFaces[plr] = tex
					invalidFace = false
				end
			end
			
		end
	end
	if invalidFace then
		drawingFaces[plr] = nil
	end
end

function drawFaces()
	cint = getElementInterior(localPlayer)
	cdim = getElementDimension(localPlayer)
	for curPlayer,tex in pairs(drawingFaces) do
		if isElement(curPlayer) and tex and(tex ~= true) and(tex ~= "EMPTY") then
			px, py, pz = getElementPosition(curPlayer)
			myx, myy, myz = getElementPosition(localCamera)
			pint = getElementInterior(curPlayer)
			pdim = getElementDimension(curPlayer)
			
			if(getDistanceBetweenPoints3D(px, py, pz, myx, myy, myz) < 100) and(pint == cint) and(pdim == cdim) then
				_, _, imgrot = getElementRotation(curPlayer)
				_, _, rotdiff = getElementRotation(localCamera)
				rotdiff = rotdiff-imgrot
				
				if(rotdiff < 0) then
					rotdiff = 360+rotdiff
				end
				
				if(rotdiff > 90) and(rotdiff < 270) then
					imgW = 0.3
					imgH = 0.3
					imgx, imgy, imgz = getPedBonePosition(curPlayer, 8)
					imgz = imgz+0.05
					imgx, imgy = getPointFromDistanceRotation(imgx, imgy, 0.15, -imgrot)
					imgdirx, imgdiry = getPointFromDistanceRotation(imgx, imgy, 1000, -imgrot)
					imgz = imgz+imgH*0.5
					dxDrawMaterialLine3D(imgx, imgy, imgz, imgx, imgy, imgz-imgH, tex, imgW, tocolor(255,255,255,getElementAlpha(curPlayer)), imgdirx, imgdiry, imgz)
				end
				
			end
		end
	end
end

function createProgressPopup(pImg, pElemToAttach, isPositive)
	if(getElementDimension(localPlayer) == getElementDimension(source)) and(getElementInterior(localPlayer) == getElementInterior(source)) then
		local pTexIcon = dxCreateTexture(pImg)
		local pTexIconPixels = dxGetTexturePixels(pTexIcon)
		local pTexIconW, pTexIconH = dxGetPixelsSize(pTexIconPixels)
		local pTexStatus
		
		if(isPositive) then
			pTexStatus = progressPopupTexPlus
		else
			pTexStatus = progressPopupTexMinus
		end
		
		local pTexStatusPixels = dxGetTexturePixels(pTexStatus)
		local pTexStatusW, pTexStatusH = dxGetPixelsSize(pTexStatusPixels)
		local pTexW = pTexIconW+pTexStatusW+5
		local pTexH = math.max(pTexIconH, pTexStatusH)
		local pTex = dxCreateTexture(pTexW, pTexH)
		dxSetTexturePixels(pTex, pTexStatusPixels, 0,(pTexH-pTexStatusH)*0.5, pTexStatusW, pTexStatusH)
		--dxSetTexturePixels(pTex, pTexIconPixels, pTexStatusW+5,(pTexH-pTexIconH)*0.5, pTexIconW, pTexIconH)
		dxSetTexturePixels(pTex, pTexIconPixels, pTexStatusW+5,(pTexH-pTexIconH)*0.5, pTexW, pTexH)
		local pDrawW = 1
		local pDrawH = pTexH/pTexW*pDrawW
		table.insert(progressPopups, { pTex, pElemToAttach, getTickCount(), pDrawW, pDrawH })
	end
end

function drawProgressPopups()
	popupsToDelete = {}
	for i=1,table.getn(progressPopups) do
		px, py, tmpz = getElementPosition(progressPopups[i][2])
		_, _, _, _, _, pz = getElementBoundingBox(progressPopups[i][2])
		popupTime = (getTickCount()-progressPopups[i][3])/progressPopupMaxTime
		
		if(popupTime < 1.0) then
			pz = pz+tmpz+popupTime*progressPopupMaxHeight
			dxDrawMaterialLine3D(px, py, pz, px, py, pz-progressPopups[i][5], progressPopups[i][1], progressPopups[i][4], tocolor(255,255,255,255* (1.0-popupTime)))
		else
			table.insert(popupsToDelete, i)
		end
		
	end
	
	for i=1,table.getn(popupsToDelete) do
		table.remove(progressPopups, i)
	end
	
end

function findRotation(x1,y1,x2,y2)
	local t = - (math.atan2(x2-x1,y2-y1)*180/math.pi)+360
	if t < 0 then t = t + 360 end
	if t > 360 then t = t - 360 end
	return t
end

function markPlayerWithBlip(markedPlayer)
	local newMarker = createBlip(0, 0, 0, 0, 2, 255, 255, 255, 255)
	attachElements(newMarker, markedPlayer)
	friendMarkers[markedPlayer] = newMarker
end

function removePlayerBlips(markedPlayer)
	local attachedElements = getAttachedElements(markedPlayer)
	for i=1,table.getn(attachedElements) do
		if(getElementType(attachedElements[i]) == "blip") then
			destroyElement(attachedElements[i])
		end
	end
	friendMarkers[markedPlayer] = nil
end

function friendBlipsProcess()
	for plr,mark in pairs(friendMarkers) do
		if not isElementAttached(mark) then
			attachElements(mark, plr)
		end
	end
end

function clientNewPlayerSpawn()
	if not (source == localPlayer) then
		local attachedElements = getAttachedElements(source)
		local markerFound = false
		
		for i=1,table.getn(attachedElements) do
			if(getElementType(attachedElements[i]) == "blip") then
				markerFound = true
				break
			end
		end
		
		if not markerFound then
			local friendid = isFriend(getPlayerName(source))
			if(friendid) then
				markPlayerWithBlip(source)
			end
		end
		
	end
end

function carSellClientUpdate(newtbl)
	carSellAvailableCars = newtbl
end

function jobTruckerClientUpdate(newtbl)
	jobTruckerAvailableTrucks = newtbl
end

function luckyPhoneRing(phone)
	luckyPhoneObj = phone
	local posx, posy, posz = getElementPosition(phone)
	luckyPhoneSound = playSound3D("audio/phonering.wav", posx, posy, posz)
	setSoundMaxDistance(luckyPhoneSound, 100)
	addEventHandler("onClientRender", root, luckyPhoneBounce)
end

function luckyPhoneBounce()
	if(isElement(luckyPhoneSound)) then
		alphaLevel = math.fmod(getTickCount(), 100)
		
		if(alphaLevel > 50) then
			alphaLevel = 100-alphaLevel
		end
		
		alphaLevel = alphaLevel/250
		setObjectScale(luckyPhoneObj, 1, 1, 1+alphaLevel)
	else
		setObjectScale(luckyPhoneObj, 1, 1, 1)
		removeEventHandler("onClientRender", root, luckyPhoneBounce)
	end
end

function luckyPhoneWin(winMoney)
	if(isElement(luckyPhoneSound)) then
		destroyElement(luckyPhoneSound)
	end
	
	if(localPlayer == source) then
		playSFX("script", 8, 0, false)
		playSuccessMusic()
		msgAdd(string.format("Счастливый звонок! Вы получили $%d.", winMoney))
	end
	
end

function setElementGhostMode(enabled)
	if isElement(getElementData(source, "RC")) then
		setElementAlpha(source, 0)
	
	else
		if enabled then
			setElementAlpha(source, 160)
		else
			setElementAlpha(source, 255)
		end
	end
	
	local allPlayers = getElementsByType("player")
	local allVehicles = getElementsByType("vehicle")
	
	for i=1,table.getn(allPlayers) do
		setElementCollidableWith(source, allPlayers[i], not enabled)
	end
	
	for i=1,table.getn(allVehicles) do
		setElementCollidableWith(source, allVehicles[i], not enabled)
	end
	
end

function carTuneEnter(slotNames, upgradePrices, colorNames, colorPrice, srvCarTuneCompUpgrades)
	playSFX("genrl", 53, 6, false)
	carTuneCameraAngle = 0.0
	carTuneCameraHeight = 2.0
	carTuneMousePressed = false
	carTuneCompUpgrades = srvCarTuneCompUpgrades
	carTuneBtns = {}
	carTuneCurUpgrades = {}
	carTuneUpgradePrices = upgradePrices
	carTuneColorPrice = colorPrice
	carTuneColorNames = colorNames
	carTuneCurVeh = source
	carTuneCurColors = {}
	carTuneCurColors[1], carTuneCurColors[2], carTuneCurColors[3], carTuneCurColors[4], carTuneCurColors[5], carTuneCurColors[6], carTuneCurColors[7], carTuneCurColors[8], carTuneCurColors[9], carTuneCurColors[10], carTuneCurColors[11], carTuneCurColors[12] = getVehicleColor(source, true)
	carTuneCurPJ = getVehiclePaintjob(source)
	carTunePrice = 0
	carTuneUpdateCamera()
	carTuneWindow = guiCreateWindow(10, sH/2-carTuneWindowH/2, carTuneWindowW, carTuneWindowH, "Тюнинг", false)
	
	for i=0,16 do
		carTuneCurUpgrades[i] = getVehicleUpgradeOnSlot(source, i)
		
		if(carTuneCurUpgrades[i] < 1000) then
			carTuneCurUpgrades[i] = nil
		end
		
		carTuneBtns[i] = guiCreateButton(5, 20+ (5+carTuneBtnH)*i, carTuneBtnW, carTuneBtnH, slotNames[i+1], false, carTuneWindow)
		
		if(table.getn(carTuneCompUpgrades[i]) > 0) then
			addEventHandler("onClientGUIClick", carTuneBtns[i], carTuneGroupSelected, false)
		else
			guiSetEnabled(carTuneBtns[i], false)
		end
		
	end
	
	carTuneBtns[17] = guiCreateButton(5, 20+ (5+carTuneBtnH)*17, carTuneBtnW, carTuneBtnH, "Покраска", false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[17], carTuneShowColorMenu, false)
	carTuneBtns[18] = guiCreateButton(5, 20+ (5+carTuneBtnH)*18, carTuneBtnW, carTuneBtnH, "Спец. покраска", false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[18], carTuneColorSpecialOpen, false)
	local engineBoost = getElementData(carTuneCurVeh, "engineBoost")
	local boostText
	
	if engineBoost and(engineBoost < 2) then
		if(engineBoost <= 0) then
			boostText = "Буст: уровень 1($1000)"
		elseif(engineBoost == 1) then
			boostText = "Буст: уровень 2($2500)"
		end
	
	else
		boostText = "Буст: уровень 3($5000)"
	end
	
	carTuneBtns[19] = guiCreateButton(5, 20+ (5+carTuneBtnH)*19, carTuneBtnW, carTuneBtnH, boostText, false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[19], carTuneBoost, false)
	
	if(engineBoost >= 3) then
		guiSetEnabled(carTuneBtns[19], false)
	end
	
	local armorLevel = getElementData(carTuneCurVeh, "armorLevel")
	local armorText
	
	if armorLevel and(armorLevel < 2) then
		if(armorLevel <= 0) then
			armorText = "Пуленепробиваемые колеса($10000)"
		elseif(armorLevel == 1) then
			armorText = "Усиленный кузов($50000)"
		end
	else
		armorText = "Огнеупорный кузов($100000)"
	end

	carTuneBtns[20] = guiCreateButton(5, 20+ (5+carTuneBtnH)*20, carTuneBtnW, carTuneBtnH, armorText, false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[20], carTuneArmor, false)
	
	if(armorLevel >= 3) then
		guiSetEnabled(carTuneBtns[20], false)
	end
	
	--[[local flyAbility = getElementData(carTuneCurVeh, "flyAbility")
	carTuneBtns[21] = guiCreateButton(5, 20+ (5+carTuneBtnH)*21, carTuneBtnW, carTuneBtnH, "Летающее авто($750000)", false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[21], carTuneFlyAbility, false)
	if flyAbility then
		guiSetEnabled(carTuneBtns[21], false)-
	end
	]]
	carTuneBtns[21] = guiCreateButton(5, 20+ (5+carTuneBtnH)*21, carTuneBtnW, carTuneBtnH, "Закончить", false, carTuneWindow)
	addEventHandler("onClientGUIClick", carTuneBtns[21], carTuneExit, false)
	addCommandHandler("Decline", carTuneExit)
	addEventHandler("onClientClick", root, carTuneChangeMousePressed, false)
	addEventHandler("onClientCursorMove", root, carTuneCursorMoved, false)
	addEventHandler("onClientElementDataChange", source, carTuneChangeVehicleData, false)
	showCursor(true)
	msgAdd("Используйте мышь, чтобы вращать камеру вокруг автомобиля.")
end

--[[
function carTuneFlyAbility(button)
	if(button == "left") then
		local price = 750000
		if(getPlayerMoney(localPlayer) < price) then
			msgAdd("У вас недостаточно денег.")
		else
			triggerServerEvent("onCarTuneFlyAbility", localPlayer, carTuneCurVeh, price)
			guiSetEnabled(source, false)
			setWorldSpecialPropertyEnabled("aircars", true)
		end
	end
end
]]

function carTuneBlock()
	if carTuneNotBlocked then
		carTuneNotBlocked = false
	end
end

function carTuneUnblock()
	if not carTuneNotBlocked then
		carTuneNotBlocked = true
	end
end

function carTuneBoost(button)
	if(button == "left") and carTuneNotBlocked then
		local price
		local boostLevel = getElementData(carTuneCurVeh, "engineBoost")
		
		if boostLevel and(boostLevel < 3) then
			boostLevel = math.max(1, boostLevel+1)
			
			if(boostLevel == 1) then
				price = 1000
			
			elseif(boostLevel == 2) then
				price = 2500
			
			elseif(boostLevel == 3) then
				price = 5000
			end
			
			if(getPlayerMoney(localPlayer) < price) then
				msgAdd("У вас недостаточно денег.")
			
			else
				carTuneBlock()
				takePlayerMoney(price)
				triggerServerEvent("onCarTuneBoost", localPlayer, carTuneCurVeh, boostLevel, price)
				playSFX("genrl", 52, 9, false)
				
				if(boostLevel == 1) then
					guiSetText(source, "Буст: уровень 2($2500)")
				
				elseif(boostLevel == 2) then
					guiSetText(source, "Буст: уровень 3($5000)")
				
				elseif(boostLevel == 3) then
					guiSetText(source, "Буст: уровень 3($5000)")
					guiSetEnabled(source, false)
				end
				
			end
			
		end
		
	end
end

function carTuneChangeVehicleData(dataName, oldValue)
	if((dataName == "engineBoost") or (dataName == "armorLevel")) then
		carTuneUnblock()
	end
end

function carTuneArmor(button)
	if(button == "left") and carTuneNotBlocked then
		local price
		local armorLevel = getElementData(carTuneCurVeh, "armorLevel")
		if armorLevel and(armorLevel < 3) then
			armorLevel = math.max(1, armorLevel+1)
			
			if(armorLevel == 1) then
				price = 10000
			
			elseif(armorLevel == 2) then
				price = 50000
			
			elseif(armorLevel == 3) then
				price = 100000
			end
			
			if(getPlayerMoney(localPlayer) < price) then
				msgAdd("У вас недостаточно денег.")
			else
				carTuneBlock()
				takePlayerMoney(price)
				triggerServerEvent("onCarTuneArmor", localPlayer, carTuneCurVeh, armorLevel, price)
				playSFX("genrl", 52, 9, false)
				
				if(armorLevel == 1) then
					guiSetText(source, "Усиленный кузов($50000)")
				
				elseif(armorLevel == 2) then
					guiSetText(source, "Огнеупорный кузов($100000)")
				
				elseif(armorLevel == 3) then
					guiSetText(source, "Огнеупорный кузов($100000)")
					guiSetEnabled(source, false)
				end
				
			end
		end
	end
end

function carTuneShowColorMenu(button)
	if(button == "left") then
		playSFX("genrl", 53, 6, false)
		guiSetVisible(carTuneWindow, false)
		wW = carTuneWindowW
		wH = carTuneWindowW+10
		carTuneColorId = 1
		colorWindowOpen(10, sH/2-wH/2, wW, wH, carTuneColorSelect, carTuneColorCancel, carTuneColorChange, "Цвет 1", 0, 0)
	end
end

function carTuneColorSelect(button)
	if(button == "left") or (button == "enter") then
		if(getPlayerMoney() >= carTuneColorPrice) then
			colorWindowClose()
			playSFX("genrl", 53, 6, false)
			
			if(carTuneColorId < 4) then
				wW = carTuneWindowW
				wH = carTuneWindowW+10
				carTuneColorId = carTuneColorId+1
				colorWindowOpen(10, sH/2-wH/2, wW, wH, carTuneColorSelect, carTuneColorCancel, carTuneColorChange, "Цвет "..tostring(carTuneColorId), clrSelX, clrSelY)

			else
				takePlayerMoney(carTuneColorPrice)
				local clrs = {}
				clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12] = getVehicleColor(carTuneCurVeh, true)
				local pj = getVehiclePaintjob(carTuneCurVeh)
				triggerServerEvent("onCarTuneSetColor", localPlayer, carTuneCurVeh, clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12], pj)
				carTuneCurColors = clrs
				carTuneCurPJ = pj
				guiSetVisible(carTuneWindow, true)
			end

		else
			msgAdd("У вас недостаточно денег.")
		end

	end
end

function carTuneColorChange(button)
	if(button == "left") then
		local clrs = {}
		clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12] = getVehicleColor(carTuneCurVeh, true)
		clrs[(carTuneColorId-1)*3+1] = clrSelR
		clrs[(carTuneColorId-1)*3+2] = clrSelG
		clrs[(carTuneColorId-1)*3+3] = clrSelB
		
		for i=carTuneColorId,3 do
			clrs[i*3+1] = clrSelR
			clrs[i*3+2] = clrSelG
			clrs[i*3+3] = clrSelB
		end

		setVehicleColor(carTuneCurVeh, clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12])
		setVehiclePaintjob(carTuneCurVeh, 3)
	end
end

function carTuneColorCancel(button)
	if(button == "left") then
		playSFX("genrl", 53, 0, false)
		guiSetVisible(carTuneWindow, true)
		setVehicleColor(carTuneCurVeh, carTuneCurColors[1], carTuneCurColors[2], carTuneCurColors[3], carTuneCurColors[4], carTuneCurColors[5], carTuneCurColors[6], carTuneCurColors[7], carTuneCurColors[8], carTuneCurColors[9], carTuneCurColors[10], carTuneCurColors[11], carTuneCurColors[12])
		setVehiclePaintjob(carTuneCurVeh, carTuneCurPJ)
	end
end

function carTuneColorSpecialOpen(button)
	if(button == "left") and(not isElement(carTuneColorWindow)) then
		local vehMdl = getElementModel(carTuneCurVeh)
		
		if carTunePaintjobs[vehMdl] then
			wW = carTuneWindowW
			wH = 100
			playSFX("genrl", 53, 6, false)
			guiSetVisible(carTuneWindow, false)
			carTuneColorWindow = guiCreateWindow(10, sH/2-wH/2, wW, wH, "Спец. покраска", false)
			guiWindowSetMovable(carTuneColorWindow, false)
			guiWindowSetSizable(carTuneColorWindow, false)
			local curBtn = guiCreateButton(5, 20, wW/4-10, wH-25, "<<", false, carTuneColorWindow)
			addEventHandler("onClientGUIClick", curBtn, carTuneColorSpecialPrev, false)
			curBtn = guiCreateButton(wW-wW/4+5, 20, wW/4-10, wH-25, ">>", false, carTuneColorWindow)
			addEventHandler("onClientGUIClick", curBtn, carTuneColorSpecialNext, false)
			curBtn = guiCreateButton(wW/2-wW/4, 20, wW/2, wH/2-20, "Выбрать", false, carTuneColorWindow)
			addEventHandler("onClientGUIClick", curBtn, carTuneColorSpecialApply, false)
			curBtn = guiCreateButton(wW/2-wW/4, wH/2+5, wW/2, wH/2-20, "Отмена", false, carTuneColorWindow)
			addEventHandler("onClientGUIClick", curBtn, carTuneColorSpecialDecline, false)
		else
			msgAdd("Данный транспорт не поддерживает спецпокраску")
		end

	end
end

function carTuneColorSpecialNext(button)
	if(button == "left") then
		local pj = getVehiclePaintjob(carTuneCurVeh)
		local mdl = getElementModel(carTuneCurVeh)
		
		if(pj == 3) then
			pj = 0
		
		elseif(pj >= carTunePaintjobs[mdl]) then
			pj = 3
		
		else
			pj = pj+1
		end
		
		if(pj < 3) then
			setVehicleColor(carTuneCurVeh, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)
		
		else
			local clrs = carTuneCurColors
			setVehicleColor(carTuneCurVeh, clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12])
		end
		
		setVehiclePaintjob(carTuneCurVeh, pj)
	end
end

function carTuneColorSpecialPrev(button)
	if(button == "left") then
		local pj = getVehiclePaintjob(carTuneCurVeh)
		local mdl = getElementModel(carTuneCurVeh)
		
		if(pj > 0) then
			setVehicleColor(carTuneCurVeh, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)
			setVehiclePaintjob(carTuneCurVeh, math.min(pj-1, carTunePaintjobs[mdl]))
		else
			local clrs = carTuneCurColors
			setVehicleColor(carTuneCurVeh, clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12])
			setVehiclePaintjob(carTuneCurVeh, 3)
		end

	end
end

function carTuneColorSpecialApply(button)
	if(button == "left") then
		if(getPlayerMoney() >= carTuneColorPrice) then
			takePlayerMoney(carTuneColorPrice)
			playSFX("genrl", 53, 6, false)
			local clrs = {}
			clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12] = getVehicleColor(carTuneCurVeh, true)
			local pj = getVehiclePaintjob(carTuneCurVeh)
			triggerServerEvent("onCarTuneSetColor", localPlayer, carTuneCurVeh, clrs[1], clrs[2], clrs[3], clrs[4], clrs[5], clrs[6], clrs[7], clrs[8], clrs[9], clrs[10], clrs[11], clrs[12], pj)
			carTuneCurColors = clrs
			carTuneCurPJ = pj
			carTuneColorSpecialClose("left")
		else
			msgAdd("У вас недостаточно денег.")
		end

	end
end

function carTuneColorSpecialDecline(button)
	if(button == "left") then
		playSFX("genrl", 53, 0, false)
		carTuneColorSpecialClose("left")
	end
end

function carTuneColorSpecialClose(button)
	if(button == "left") then
		destroyElement(carTuneColorWindow)
		guiSetVisible(carTuneWindow, true)
		setVehicleColor(carTuneCurVeh, carTuneCurColors[1], carTuneCurColors[2], carTuneCurColors[3], carTuneCurColors[4], carTuneCurColors[5], carTuneCurColors[6], carTuneCurColors[7], carTuneCurColors[8], carTuneCurColors[9], carTuneCurColors[10], carTuneCurColors[11], carTuneCurColors[12])
		setVehiclePaintjob(carTuneCurVeh, carTuneCurPJ)
	end
end

function carTuneCursorMoved(cursorX, cursorY, absoluteX, absoluteY)
	if(carTuneMousePressed) then
		carTuneCameraHeight = math.max(0.0, math.min(2.0, carTuneCameraHeight+ (absoluteY-carTuneMouseMoveStartY)*0.01))
		carTuneCameraAngle = carTuneCameraAngle+ (absoluteX-carTuneMouseMoveStartX)*0.1
		
		if(carTuneCameraAngle > 360.0) then
			carTuneCameraAngle = carTuneCameraAngle-360.0

		elseif(carTuneCameraAngle < 0.0) then
			carTuneCameraAngle = carTuneCameraAngle+360.0
		end
		
		carTuneUpdateCamera()
		carTuneMouseMoveStartX = absoluteX
		carTuneMouseMoveStartY = absoluteY
	end
end

function carTuneUpdateCamera()
	carTuneVehX, carTuneVehY, carTuneVehZ = getElementPosition(carTuneCurVeh)
	local camx, camy = getPointFromDistanceRotation(carTuneVehX, carTuneVehY, 6, carTuneCameraAngle)
	local camz = carTuneVehZ+carTuneCameraHeight
	local hit, hitX, hitY, hitZ = processLineOfSight(camx, camy, camz, carTuneVehX, carTuneVehY, carTuneVehZ, true, false, false, false, false)
	
	if(hit) then
		camx, camy, camz = hitX, hitY, hitZ
	end
	
	setCameraMatrix(camx, camy, camz, carTuneVehX, carTuneVehY, carTuneVehZ)
end

function carTuneChangeMousePressed(button, state, absoluteX, absoluteY)
	if(button == "left") then
		if(state == "down") then
			carTuneMouseMoveStartX = absoluteX
			carTuneMouseMoveStartY = absoluteY
			carTuneMousePressed = true
		else
			carTuneMousePressed = false
		end
	end
end

function carTuneGroupSelected(button)
	if(button == "left") then
		playSFX("genrl", 53, 6, false)
		guiSetVisible(carTuneWindow, false)

		for i=0,16 do
			if(carTuneBtns[i] == source) then
				carTuneCurGroup = i
				break
			end
		end

		local upgradesNum = table.getn(carTuneCompUpgrades[carTuneCurGroup])
		local winW = carTuneWindowW
		local winH = 25+ (upgradesNum+1)* (5+carTuneBtnH)
		carTuneGroupWindow = guiCreateWindow(10, sH/2-winH/2, winW, winH, guiGetText(carTuneBtns[carTuneCurGroup]), false)
		local curUpgrade
		carTuneGroupBtns = {}

		for i=1,upgradesNum do
			curUpgrade = carTuneCompUpgrades[carTuneCurGroup][i]
			carTuneGroupBtns[i] = guiCreateButton(5, 20+ (5+carTuneBtnH)* (i-1), carTuneBtnW, carTuneBtnH, string.format("%s($%d)", getVehicleUpgradeSlotName(curUpgrade), carTuneUpgradePrices[curUpgrade-999]), false, carTuneGroupWindow)

			if(curUpgrade == carTuneCurUpgrades[carTuneCurGroup]) then
				guiSetProperty(carTuneGroupBtns[i], "NormalTextColour", "FF00FF00")
			else
				guiSetProperty(carTuneGroupBtns[i], "NormalTextColour", "FF7C7C7C")
			end

			addEventHandler("onClientGUIClick", carTuneGroupBtns[i], carTuneBuyUpgrade, false)
			addEventHandler("onClientMouseEnter", carTuneGroupBtns[i], carTuneApplyUpgradePreview)
			addEventHandler("onClientMouseLeave", carTuneGroupBtns[i], carTuneRemoveUpgradePreview)
		end

		carTuneGroupBtns[upgradesNum+1] = guiCreateButton(5, 20+ (5+carTuneBtnH)*upgradesNum, carTuneBtnW, carTuneBtnH, "Назад", false, carTuneGroupWindow)
		addEventHandler("onClientGUIClick", carTuneGroupBtns[upgradesNum+1], carTuneGroupExit, false)
	end
end

function carTuneGroupExit(button)
	if(button == "left") then
		playSFX("genrl", 53, 0, false)
		destroyElement(carTuneGroupWindow)
		guiSetVisible(carTuneWindow, true)
	end
end

function carTuneApplyUpgradePreview()
	for i=1,table.getn(carTuneCompUpgrades[carTuneCurGroup]) do
		if(source == carTuneGroupBtns[i]) then
			addVehicleUpgrade(carTuneCurVeh, carTuneCompUpgrades[carTuneCurGroup][i])
			break
		end
	end
end

function carTuneRemoveUpgradePreview()
	if(carTuneCurUpgrades[carTuneCurGroup] == nil) then
		for i=1,table.getn(carTuneCompUpgrades[carTuneCurGroup]) do
			if(source == carTuneGroupBtns[i]) then
				removeVehicleUpgrade(carTuneCurVeh, carTuneCompUpgrades[carTuneCurGroup][i])
				break
			end
		end
	else
		addVehicleUpgrade(carTuneCurVeh, carTuneCurUpgrades[carTuneCurGroup])
	end
end

function carTuneBuyUpgrade(button)
	if(button == "left") then
		for i=1,table.getn(carTuneCompUpgrades[carTuneCurGroup]) do
			if(carTuneGroupBtns[i] == source) then
				local price = carTuneUpgradePrices[carTuneCompUpgrades[carTuneCurGroup][i]-999]

				if(carTuneCompUpgrades[carTuneCurGroup][i] == carTuneCurUpgrades[carTuneCurGroup]) then
					givePlayerMoney(price)
					triggerServerEvent("onCarTuneRemoveUpgrade", localPlayer, carTuneCurVeh, carTuneCurGroup, carTuneCurUpgrades[carTuneCurGroup])
					playSFX("genrl", 52, 9, false)
					guiSetProperty(source, "NormalTextColour", "FF7C7C7C")
					carTuneCurUpgrades[carTuneCurGroup] = nil

				else
					if(getPlayerMoney() >= price) then
						takePlayerMoney(price)
						carTuneCurUpgrades[carTuneCurGroup] = carTuneCompUpgrades[carTuneCurGroup][i]
						playSFX("genrl", 52, 9, false)
						guiSetProperty(source, "NormalTextColour", "FF00FF00")
						triggerServerEvent("onCarTuneApplyUpgrade", localPlayer, carTuneCurVeh, carTuneCurGroup, carTuneCurUpgrades[carTuneCurGroup])
					else
						msgAdd("У вас недостаточно денег.")
					end
				end

			else
				guiSetProperty(carTuneGroupBtns[i], "NormalTextColour", "FF7C7C7C")
			end
		end
	end
end

function carTuneExit(button)
	if((button == "left") or (button == "Decline")) then
		
		if(isElement(carTuneGroupWindow)) then
			carTuneGroupExit("left")
		end
		
		if(isElement(carTuneColorWindow)) then
			carTuneColorSpecialClose("left")
		end
		
		if(isElement(clrWin)) then
			colorWindowClose("left")
			carTuneColorCancel("left")
		end
		
		playSFX("genrl", 53, 0, false)
		destroyElement(carTuneWindow)
		removeCommandHandler("Decline", carTuneExit)
		triggerServerEvent("onCarTuneExit", localPlayer, carTuneCurVeh)
		checkCursor()
		removeEventHandler("onClientClick", root, carTuneChangeMousePressed)
		removeEventHandler("onClientCursorMove", root, carTuneCursorMoved)
		removeEventHandler("onClientElementDataChange", carTuneCurVeh, carTuneChangeVehicleData)
		setCameraTarget(localPlayer)
	end
end

function inventoryInit(loadedSlots)
	local winW = inventorySpaceBtwSlots+ (inventorySpaceBtwSlots+inventorySlotWH)*inventorySlotsPerLine
	local winH = 15+inventorySpaceBtwSlots*2+ (inventorySpaceBtwSlots+inventorySlotWH)* (inventorySlotsNum/inventorySlotsPerLine)+inventoryCancelBtnH
	inventoryWin = guiCreateWindow(sW/2-winW/2, sH/2-winH/2, winW, winH, "Инвентарь", false)
	guiWindowSetMovable(inventoryWin, false)
	guiWindowSetSizable(inventoryWin, false)
	local slotX, slotY
	
	for i=1,inventorySlotsNum do
		slotX = inventorySpaceBtwSlots+ (inventorySpaceBtwSlots+inventorySlotWH)*math.fmod((i-1), inventorySlotsPerLine)
		slotY = 15+inventorySpaceBtwSlots+ (inventorySpaceBtwSlots+inventorySlotWH)*math.floor((i-1)/inventorySlotsPerLine)
		
		if(loadedSlots[i][1] > 0) then
			table.insert(inventorySlots, { loadedSlots[i][1], guiCreateStaticImage(slotX, slotY, inventorySlotWH, inventorySlotWH, inventoryItems[loadedSlots[i][1]][2], false, inventoryWin), loadedSlots[i][2] })
		else
			table.insert(inventorySlots, { 0, guiCreateStaticImage(slotX, slotY, inventorySlotWH, inventorySlotWH, inventoryEmptyItem[2], false, inventoryWin), 0 })
		end
		
		addEventHandler("onClientGUIClick", inventorySlots[i][2], inventoryUseItem)
	end
	
	local lbl = guiCreateLabel(inventorySpaceBtwSlots, winH-inventorySpaceBtwSlots-inventoryCancelBtnH, winW-inventorySpaceBtwSlots-8, inventoryCancelBtnH, "ЛКМ - Использовать", false, inventoryWin)
	guiLabelSetVerticalAlign(lbl, "center")
	guiLabelSetHorizontalAlign(lbl, "left")
	lbl = guiCreateLabel(inventorySpaceBtwSlots, winH-inventorySpaceBtwSlots-inventoryCancelBtnH, winW-inventorySpaceBtwSlots-8, inventoryCancelBtnH, "ПКМ - Выбросить", false, inventoryWin)
	guiLabelSetVerticalAlign(lbl, "center")
	guiLabelSetHorizontalAlign(lbl, "right")
	inventoryBtnCancel = guiCreateButton(winW/2-50, winH-inventorySpaceBtwSlots-inventoryCancelBtnH, 100, inventoryCancelBtnH, "Отмена", false, inventoryWin)
	addEventHandler("onClientGUIClick", inventoryBtnCancel, inventoryHide, false)
	guiSetVisible(inventoryWin, false)
	addEventHandler("onClientRender", root, inventoryDrawDXStuff)
	--addEventHandler("onClientKey", root, inventoryButtonPressed)
end

function inventoryUseItem(button, state)
	if(state == "up") then
		if(button == "left") then
			if(inventorySelectedSlot > 0) and(inventorySlots[inventorySelectedSlot][1] > 0) then
				--inventoryAvailable = false
				inventoryHide()
				triggerServerEvent("onInventoryUseSlot", localPlayer, inventorySelectedSlot)
			end
			
		elseif(button == "right") then
			if(inventorySelectedSlot > 0) and(inventorySlots[inventorySelectedSlot][1] > 0) then
				--inventoryAvailable = false
				inventoryHide()
				local px, py, pz = getElementPosition(localPlayer)
				triggerServerEvent("onInventoryDropSlot", localPlayer, inventorySelectedSlot, px, py, pz)
			end
		end
	end
end

function inventoryUpdateSlot(slotId, slotItem, slotItemNum)
	inventorySlots[slotId][1] = slotItem
	
	if(slotItem > 0) then
		guiStaticImageLoadImage(inventorySlots[slotId][2], inventoryItems[slotItem][2])
	else
		guiStaticImageLoadImage(inventorySlots[slotId][2], inventoryEmptyItem[2])
	end
	
	inventorySlots[slotId][3] = slotItemNum
	inventoryAvailable = true
end

function inventoryButtonPressed(button, pressed)
	--if(button == "i") and pressed and(not isChatBoxInputActive()) then
	if not isChatBoxInputActive() then
		if(inventoryShown) then
			inventoryHide()
		else
			if not guiGetInputEnabled() then
				turnOffMenus()
				inventoryShow()
			end
		end
	end
end

function inventoryShow()
	if(inventoryAvailable) and(not inventoryShown) and(getElementHealth(localPlayer) > 0.0) and(not furnitureSelectedObj) then
		guiSetVisible(inventoryWin, true)
		showCursor(true)
		inventoryShown = true
	end
end

function inventoryHide()
	if inventoryShown then
		guiSetVisible(inventoryWin, false)
		inventoryShown = false
		checkCursor()
	end
end

function inventoryDrawDXStuff()
	inventorySelectedSlot = 0
	if(inventoryShown) then
		scrx, scry = getCursorPosition()
		scrx = scrx*sW
		scry = scry*sH
		winx, winy = guiGetPosition(inventoryWin, false)
		
		for i=1,inventorySlotsNum do
			slotx, sloty = guiGetPosition(inventorySlots[i][2], false)
			slotx = winx+slotx
			sloty = winy+sloty
			
			if(slotx < scrx) and((slotx+inventorySlotWH) > scrx) and(sloty < scry) and((sloty+inventorySlotWH) > scry) then
				inventorySelectedSlot = i
				lineClr = tocolor(255,255,255,255)
			else
				lineClr = tocolor(128,128,128,255)
			end
			
			if(inventorySlots[i][1] > 0) and(inventorySlots[i][3] > 1) then
				numx = slotx+inventorySlotWH-numWH
				numy = sloty+inventorySlotWH-numWH
				dxDrawRectangle(numx, numy, numWH, numWH, numClr, true)
				dxDrawLine(numx, numy, numx+numWH, numy, lineClr, 1, true)
				dxDrawLine(numx, numy, numx, numy+numWH, lineClr, 1, true)
				dxDrawText(tostring(inventorySlots[i][3]), numx+2, numy+1, numx+numWH, numy+numWH, numTxtClr, 1, "default-bold", "center", "center", false, false, true)
			end
			
			dxDrawLine(slotx, sloty, slotx+inventorySlotWH, sloty, lineClr, 1, true)
			dxDrawLine(slotx, sloty, slotx, sloty+inventorySlotWH, lineClr, 1, true)
			dxDrawLine(slotx+inventorySlotWH, sloty, slotx+inventorySlotWH, sloty+inventorySlotWH, lineClr, 1, true)
			dxDrawLine(slotx, sloty+inventorySlotWH, slotx+inventorySlotWH, sloty+inventorySlotWH, lineClr, 1, true)
		end
		
		if(inventorySelectedSlot > 0) then
			if(inventorySlots[inventorySelectedSlot][1] > 0) then
				slotName = inventoryItems[inventorySlots[inventorySelectedSlot][1]][1]
			else
				slotName = inventoryEmptyItem[1]
			end
			
			dxDrawText(slotName, scrx-sW+1, scry-13, scrx+sW+1, scry-1, tocolor(0,0,0,255), 1, "default-bold", "center", "center", false, false, true)
			dxDrawText(slotName, scrx-sW, scry-14, scrx+sW, scry-2, tocolor(255,255,255,255), 1, "default-bold", "center", "center", false, false, true)
		end
	end
end

function debugDrawHouses()
	local hx, hy, hz
	local px, py, pz = getElementPosition(localCamera)
	
	for i=1,table.getn(debugHouses) do
		hx, hy, hz = getElementPosition(debugHouses[i][4])
		if(getDistanceBetweenPoints3D(px,py,pz,hx,hy,hz) < 100) then
			dxDrawLine3D(hx,hy,hz,debugHouses[i][5],debugHouses[i][6],debugHouses[i][7],tocolor(255,0,0,255))
			dxDrawLine3D(debugHouses[i][5],debugHouses[i][6],debugHouses[i][7]-1,debugHouses[i][5],debugHouses[i][6],debugHouses[i][7]+1,tocolor(0,0,255,255),2)
		end
	end
	
end

local houseObjs = {}

function houseEnter(intInfo, toPlaySound, frozenObjs)
	local curObj
	local dim = getElementDimension(localPlayer)
	
	if toPlaySound then
		playSFX("genrl", 44, 1, false)
	end
	
	for _,hobjinfo in ipairs(intInfo[5]) do
		curObj = createObject(hobjinfo[1], hobjinfo[2], hobjinfo[3], hobjinfo[4], hobjinfo[5], hobjinfo[6], hobjinfo[7])
		setElementInterior(curObj, intInfo[4])
		setElementDimension(curObj, dim)
		
		if frozenObjs[hobjinfo[1]] then
			setElementFrozen(curObj, true)
		end
		
		table.insert(houseObjs, curObj)
	end
	
	houseExitPickup = createPickup(intInfo[1], intInfo[2], intInfo[3], 3, 1318, 0, 1)
	setElementDimension(houseExitPickup, dim)
	setElementInterior(houseExitPickup, intInfo[4])
end

function houseExit()
	for _,curObj in ipairs(houseObjs) do
		destroyElement(curObj)
	end
	
	houseObjs = {}
	playSFX("genrl", 44, 1, false)
	destroyElement(houseExitPickup)
end

function ammuEnter(ammuInt)
	playSFX("genrl", 44, 1, false)
	ammuExit = createPickup(ammuInt[2], ammuInt[3], ammuInt[4], 3, 1318, 0, 1)
	setElementInterior(ammuExit, ammuInt[1])
	local dimId = getElementDimension(localPlayer)
	setElementDimension(ammuExit, dimId)
	loadBots(ammuInt[1], dimId, ammuInt[2], ammuInt[3], ammuInt[4])
	ammuSeller = createPed(179, ammuInt[6], ammuInt[7], ammuInt[8], ammuInt[9])
	setElementData(ammuSeller, "godmode", true, false)
	setElementInterior(ammuSeller, ammuInt[1])
	setElementDimension(ammuSeller, getElementDimension(localPlayer))
	setElementFrozen(ammuSeller, true)
	--setElementCollisionsEnabled(ammuSeller, false)
end

function ammuOpenMenu(curAmmuWeap)
	if(not ammuMenuOpened) and(getElementHealth(localPlayer) > 0.0) then
		friendsMenuAvailable = false
		actionsMenuAvailable = false
		inventoryAvailable = false
		ammuMenuOpened = true
		ammuWeapons = curAmmuWeap
		ammuCurWeap = 1
		setElementAlpha(localPlayer, 0)
		local asx, asy, asz = getElementPosition(ammuSeller)
		local asrot = getElementRotation(ammuSeller, "ZXY")
		asx, asy = getPointFromDistanceRotation(asx, asy, 0.3, -asrot)
		asz = asz+0.4
		ammuMenuPreview = createPickup(asx, asy, asz, 3, ammuWeapons[ammuCurWeap][2], 0, 1)
		setElementInterior(ammuMenuPreview, getElementInterior(localPlayer))
		setElementDimension(ammuMenuPreview, getElementDimension(localPlayer))
		local camx, camy = getPointFromDistanceRotation(asx, asy, 1.7, -asrot)
		setCameraMatrix(camx, camy, asz, asx, asy, asz)
		ammuMenuWin = guiCreateWindow(sW/2-ammuMenuW/2, sH-20-ammuMenuH, ammuMenuW, ammuMenuH, "Оружие", false)
		ammuMenuWpPrev = guiCreateButton(10, 20, 32, 16, "<", false, ammuMenuWin)
		local weapName
		
		if(ammuWeapons[ammuCurWeap][1] == 1242) then
			weapName = "Armour"
		else
			weapName = getWeaponNameFromID(ammuWeapons[ammuCurWeap][1])
		end
		
		ammuMenuWpName = guiCreateLabel(27, 20, ammuMenuW-74, 16, string.format("%s($%d)", weapName, ammuWeapons[ammuCurWeap][4]), false, ammuMenuWin)
		ammuMenuWpNext = guiCreateButton(ammuMenuW-38, 20, 32, 16, ">", false, ammuMenuWin)
		ammuMenuCancel = guiCreateButton(sW/2-ammuMenuW/2-70, sH-20-ammuMenuH, 60, ammuMenuH, "Выйти", false)
		ammuMenuBuy = guiCreateButton(sW/2+ammuMenuW/2+10, sH-20-ammuMenuH, 60, ammuMenuH, "Купить", false)
		guiLabelSetHorizontalAlign(ammuMenuWpName, "center")
		guiLabelSetVerticalAlign(ammuMenuWpName, "center")
		guiWindowSetMovable(ammuMenuWin, false)
		guiWindowSetSizable(ammuMenuWin, false)
		addEventHandler("onClientGUIClick", ammuMenuWpPrev, ammuPrev, false)
		addEventHandler("onClientGUIClick", ammuMenuWpNext, ammuNext, false)
		addEventHandler("onClientGUIClick", ammuMenuCancel, ammuCloseMenu, false)
		addEventHandler("onClientGUIClick", ammuMenuBuy, ammuBuy, false)
		addCommandHandler("Select right", ammuNext)
		addCommandHandler("Select left", ammuPrev)
		addCommandHandler("Accept", ammuBuy)
		addCommandHandler("Decline", ammuCloseMenu)
		showCursor(true)
	end
end

function ammuBuy()
	playSFX("genrl", 53, 7, false)
	triggerServerEvent("onAmmuBuyWeapon", localPlayer, ammuCurWeap)
end

function ammuPrev()
	ammuCurWeap = ammuCurWeap-1
	
	if(ammuCurWeap < 1) then
		ammuCurWeap = table.getn(ammuWeapons)
	end
	
	ammuUpdate()
end

function ammuNext()
	ammuCurWeap = ammuCurWeap+1
	
	if(ammuCurWeap > table.getn(ammuWeapons)) then
		ammuCurWeap = 1
	end
	
	ammuUpdate()
end

function ammuUpdate()
	playSFX("genrl", 52, math.random(20, 22), false)
	local wx, wy, wz = getElementPosition(ammuMenuPreview)
	destroyElement(ammuMenuPreview)
	ammuMenuPreview = createPickup(wx, wy, wz, 3, ammuWeapons[ammuCurWeap][2], 0, 1)
	setElementInterior(ammuMenuPreview, getElementInterior(localPlayer))
	setElementDimension(ammuMenuPreview, getElementDimension(localPlayer))
	local weapName
	
	if(ammuWeapons[ammuCurWeap][1] == 1242) then
		weapName = "Armour"
	else
		weapName = getWeaponNameFromID(ammuWeapons[ammuCurWeap][1])
	end
	
	guiSetText(ammuMenuWpName, string.format("%s($%d)", weapName, ammuWeapons[ammuCurWeap][4]))
end

function ammuCloseMenu()
	if ammuMenuOpened then
		friendsMenuAvailable = true
		actionsMenuAvailable = true
		inventoryAvailable = true
		ammuMenuOpened = false
		playSFX("genrl", 53, 0, false)
		triggerServerEvent("onAmmuExit", localPlayer)
		destroyElement(ammuMenuPreview)
		destroyElement(ammuMenuWin)
		destroyElement(ammuMenuCancel)
		destroyElement(ammuMenuBuy)
		removeCommandHandler("Select right", ammuNext)
		removeCommandHandler("Select left", ammuPrev)
		removeCommandHandler("Accept", ammuBuy)
		removeCommandHandler("Decline", ammuCloseMenu)
		setElementAlpha(localPlayer, 255)
		setCameraTarget(localPlayer)
		checkCursor()
	end
end

function ammuExit()
	unloadInteriorBots()
	playSFX("genrl", 44, 1, false)
	destroyElement(ammuExit)
	destroyElement(ammuSeller)
end

function eatEnter(eatInfo, turnOffSound)
	if not turnOffSound then
		playSFX("genrl", 44, 1, false)
	end
	eatExit = createPickup(eatInfo[4], eatInfo[5], eatInfo[6], 3, 1318, 0, 1)
	setElementInterior(eatExit, eatInfo[3])
	local dimId = getElementDimension(localPlayer)
	setElementDimension(eatExit, dimId)
	loadBots(eatInfo[3], dimId, eatInfo[4], eatInfo[5], eatInfo[6])
	eatAvailableFood = eatInfo[12]
	eatSeller = createPed(eatInfo[13], eatInfo[8], eatInfo[9], eatInfo[10], eatInfo[11])
	setElementData(eatSeller, "godmode", true, false)
	setElementInterior(eatSeller, eatInfo[3])
	setElementDimension(eatSeller, getElementDimension(localPlayer))
	setElementFrozen(eatSeller, true)
	--setElementCollisionsEnabled(eatSeller, false)
end

function eatExit()
	unloadInteriorBots()
	playSFX("genrl", 44, 1, false)
	destroyElement(eatExit)
	destroyElement(eatSeller)
end

function checkCursor()
	showCursor((guiGetVisible(browserWin) or guiGetVisible(donateMenu) or guiGetVisible(fractionWin) or (isElement(specialEventWin) and guiGetVisible(specialEventWin)) or isElement(queryWin) or isElement(clanMenu) or isElement(eventsLogWin) or isElement(reportWin) or isElement(questionWin) or isElement(answerWin) or guiGetVisible(gpsWin) or guiGetVisible(customFightMenu) or guiGetVisible(customWalkMenu) or isElement(workWin) or isElement(derbyLobbyWin) or animShow or isElement(ferrisWheelObj) or isElement(taxiMapWin) or isElement(requestWin) or friendsMenuShow or actionsMenuShow or jobEvacuatorFinishOrderShow or isElement(carTuneWindow) or isElement(raceLobbyWin) or inventoryShown or ammuMenuOpened))
end

function playerWasted()
	turnOffMenus()
	setTimer(function(houseObjs)
				for _,curObj in ipairs(houseObjs) do
					destroyElement(curObj)
				end
				houseObjs = {}
			 end, 5000, 1, houseObjs)
	
	if isElement(eatExit) then
		destroyElement(eatExit)
		destroyElement(eatSeller)
	end
	
	if isElement(ammuExit) then
		destroyElement(ammuExit)
		destroyElement(ammuSeller)
	end
	
	if isElement(houseExitPickup) then
		destroyElement(houseExitPickup)
	end
	
	if isElement(otbExit) then
		destroyElement(otbExit)
	end
	
	crimeDestroyBlip()
end

function otherPlayerWasted()
	if(source ~= localPlayer) then
		if crimeBlip then
			local suspect = getElementAttachedTo(crimeBlip)
			
			if suspect and(source == suspect) then
				crimeDestroyBlip()
				msgAdd("Отмеченный на карте преступник "..getPlayerName(source).." был убит.")
			end
			
		end
	end
end

function turnOffMenus()
	if(actionsMenuShow) then
		turnOffActionsMenu()
	end
	
	inventoryHide()
	ammuCloseMenu()
	animHideMenu()
	clanCloseMenu()
	friendsCloseMenu()
	
	if(isElement(carTuneWindow)) then
		carTuneExit("left")
	end
	
	browserClose()
	customWalkMenuClose()
	customFightMenuClose()
	donateClose()
	reportClose("left")
	questionClose("left")
	answerClose("left")
	eventsLogClose("left")
	checkCursor()
end

function vehicleEnterExit(thePlayer)
	if(thePlayer == localPlayer) then
		setVehicleEngineState(source, false)
		fuelWarning = false
		turnOffMenus()
		--setWorldSpecialPropertyEnabled("aircars",((getPedOccupiedVehicle(localPlayer) == source) and getElementData(source, "flyAbility")))
	end
end

function flyAbilityProcess()
	players = getElementsByType("vehicle")
	cx, cy, cz = getElementPosition(localCamera)
	for _,veh in ipairs(players) do
		vx, vy, vz = getElementPosition(veh)
		vehSpeed = getElementSpeed(veh)
		if(getDistanceBetweenPoints3D(cx,cy,cz,vx,vy,vz) < 200.0) and(vehSpeed > 10.0) and getElementData(veh, "flyToggle") and getElementData(veh, "flyAbility") and getVehicleEngineState(veh) then
			if flyAbilitySounds[veh] then
				sound = flyAbilitySounds[veh]
			
			else
				sound = playSound3D("audio/flyability.wav", vx, vy, vz, true)
				setSoundMaxDistance(sound, 199.0)
				flyAbilitySounds[veh] = sound
				addEventHandler("onElementDestroy", veh, flyAbilityDestroySound)
			end
			
			sampleRate, tempo, pitch, isReversed = getSoundProperties(sound)
			pitchMult = math.max(0.1, math.min(1.0, vehSpeed/100.0))
			setSoundProperties(sound, sampleRate, tempo, 12.5*pitchMult, isReversed)
			setSoundVolume(sound, gameSoundVolume * pitchMult)
			setElementPosition(sound, vx, vy, vz)
		
		elseif flyAbilitySounds[veh] then
			destroyElement(flyAbilitySounds[veh])
			flyAbilitySounds[veh] = nil
			removeEventHandler("onElementDestroy", veh, flyAbilityDestroySound)
		end
	end
end

function flyAbilityDestroySound()
	destroyElement(flyAbilitySounds[source])
	flyAbilitySounds[source] = nil
	removeEventHandler("onElementDestroy", source, flyAbilityDestroySound)
end

function uniqueJumpProcess()
	veh = getPedOccupiedVehicle(localPlayer)
	if(veh) then
		pVehType = getVehicleType(veh)
		
		if(pVehType == "Plane") or (pVehType == "Helicopter") or (pVehType == "Train") or (pVehType == "Monster Truck") or getElementData(veh, "flyToggle") or (not(getVehicleOccupant(veh) == localPlayer)) then
			veh = nil
		end
		
	end
	if not jumpIndex then
		if(veh) and(getPedOccupiedVehicleSeat(localPlayer) == 0) then
			if not isVehicleOnGround(veh) then
				vx, vy, vz = getElementPosition(veh)
				
				for i=1,table.getn(uniqueJumps) do
					if(math.abs(vx-uniqueJumps[i][1])<=uniqueJumps[i][4]) and(math.abs(vy-uniqueJumps[i][2])<=uniqueJumps[i][5]) and(math.abs(vz-uniqueJumps[i][3])<=uniqueJumps[i][6]) then
						jumpIndex = i
						jumpSuccess = false
					end
				end
				
			end
		end
	end
	if jumpIndex then
		if(veh and isVehicleOnGround(veh)) or isPedDead(localPlayer) or (not isPedInVehicle(localPlayer)) then
			setCameraTarget(localPlayer)
			
			if(veh) then
				cx, cy, cz = getElementRotation(veh)
				if jumpSuccess and(not isPedDead(localPlayer)) and(isPedInVehicle(localPlayer)) and((math.abs(cx) < 45.0) or (math.abs(cx) > 315.0)) and((math.abs(cy) < 45.0) or (math.abs(cy) > 315.0)) then
					triggerServerEvent("onUniqueJumpSuccess", resourceRoot, localPlayer, jumpIndex)
				end
			end
			
			jumpIndex = nil
		else
			cx, cy, cz = getElementPosition(veh)
			
			if(math.abs(cx-uniqueJumps[jumpIndex][7])<=uniqueJumps[jumpIndex][10]) and(math.abs(cy-uniqueJumps[jumpIndex][8])<=uniqueJumps[jumpIndex][11]) and(math.abs(cz-uniqueJumps[jumpIndex][9])<=uniqueJumps[jumpIndex][12]) then
				jumpSuccess = true
			end
			
			setCameraMatrix(uniqueJumps[jumpIndex][13], uniqueJumps[jumpIndex][14], uniqueJumps[jumpIndex][15], cx, cy, cz)
		end
	end
end

function msecToStringTime(timeMs)
	timeSec = math.floor(timeMs/1000)
	timeMin = math.floor(timeSec/60)
	timeSec = math.fmod(timeSec, 60)
	return string.format("%02d:%02d", timeMin, timeSec)
end

function raceEnter(curRaceInfo)
	actionsMenuAvailable = false
	inventoryAvailable = false
	setPedCanBeKnockedOffBike(localPlayer, false)
	raceCurInfo = curRaceInfo
	raceLobbyWin = guiCreateWindow(sW/2-raceLobbyWinW/2, sH/2-raceLobbyWinH/2, raceLobbyWinW, raceLobbyWinH, string.format("Гонка #%d", raceCurInfo[1]), false)
	guiWindowSetMovable(raceLobbyWin, false)
	guiWindowSetSizable(raceLobbyWin, false)
	raceLobbyTime = guiCreateLabel(10, 25, raceLobbyWinW-20, 25, "Время на сбор:", false, raceLobbyWin)
	guiLabelSetHorizontalAlign(raceLobbyTime, "center")
	guiLabelSetVerticalAlign(raceLobbyTime, "center")
	raceLobbyRacersList = guiCreateGridList(10, 60, raceLobbyWinW-20, raceLobbyWinH-105, false, raceLobbyWin)
	guiGridListSetSortingEnabled(raceLobbyRacersList, false)
	raceLobbyRacersClmnPos = guiGridListAddColumn(raceLobbyRacersList, "Поз", 0.1)
	raceLobbyRacersClmnRacer = guiGridListAddColumn(raceLobbyRacersList, "Игрок", 0.4)
	raceLobbyRacersClmnVeh = guiGridListAddColumn(raceLobbyRacersList, "Транспорт", 0.4)
	raceLobbyBtnCancel = guiCreateButton(10, raceLobbyWinH-35, raceLobbyWinW-20, 25, "Покинуть гонку", false, raceLobbyWin)
	addEventHandler("onClientGUIClick", raceLobbyBtnCancel, raceExit, false)
	addCommandHandler("Decline", raceExit)
	raceUpdateInfo()
	showCursor(true)
end

function raceDrawCounter()
	dxDrawText(raceCounter, sW/2-3, sH/2-3, sW/2-3, sH/2-3, tocolor(0,0,0,255), scaleMult*2.5, "bankgothic", "center", "center")
	dxDrawText(raceCounter, sW/2+3, sH/2+3, sW/2+3, sH/2+3, tocolor(0,0,0,255), scaleMult*2.5, "bankgothic", "center", "center")
	dxDrawText(raceCounter, sW/2-3, sH/2+3, sW/2-3, sH/2+3, tocolor(0,0,0,255), scaleMult*2.5, "bankgothic", "center", "center")
	dxDrawText(raceCounter, sW/2+3, sH/2-3, sW/2+3, sH/2-3, tocolor(0,0,0,255), scaleMult*2.5, "bankgothic", "center", "center")
	dxDrawText(raceCounter, sW/2, sH/2, sW/2, sH/2, raceCounterColor, scaleMult*2.5, "bankgothic", "center", "center")
end

function raceDrawHud()
	--dxDrawText(string.format("PLACE: %d/%d | LAP: %d/%d | TIME: %s", raceLocalInfo[1], raceLocalInfo[2], raceLocalInfo[3], raceLocalInfo[4], msecToStringTime(raceLocalInfo[5])), sW/2, sH-20, sW/2, sH-3, tocolor(255,255,255,255), 2.5, "default-bold", "center", "center")
	local hW, hH = 192*scaleMult, 64*scaleMult
	dxDrawRectangle(sW/2-hW/2, 15*scaleMult, hW, hH, tocolor(0,0,0,160))
	dxDrawLine(sW/2-96*scaleMult, 15*scaleMult, sW/2+96*scaleMult, 15*scaleMult, tocolor(0,0,0,255), 2)
	dxDrawLine(sW/2-96*scaleMult, 15*scaleMult, sW/2-96*scaleMult, 15*scaleMult+hH, tocolor(0,0,0,255), 2)
	dxDrawLine(sW/2+96*scaleMult, 15*scaleMult, sW/2+96*scaleMult, 15*scaleMult+hH, tocolor(0,0,0,255), 2)
	dxDrawLine(sW/2-96*scaleMult, 15*scaleMult+hH, sW/2+96*scaleMult, 15*scaleMult+hH, tocolor(0,0,0,255), 2)
	dxDrawLine(sW/2-32*scaleMult, 15*scaleMult, sW/2-32*scaleMult, 15*scaleMult+hH, tocolor(0,0,0,255), 2)
	dxDrawLine(sW/2+32*scaleMult, 15*scaleMult, sW/2+32*scaleMult, 15*scaleMult+hH, tocolor(0,0,0,255), 2)
	dxDrawText("Круг", sW/2-hW/2, 15*scaleMult, sW/2-32*scaleMult, 47*scaleMult, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "center", "center")
	dxDrawText("Время", sW/2-32*scaleMult, 15*scaleMult, sW/2+32*scaleMult, 47*scaleMult, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "center", "center")
	dxDrawText("Место", sW/2+32*scaleMult, 15*scaleMult, sW/2+96*scaleMult, 47*scaleMult, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "center", "center")
	dxDrawText(msecToStringTime(raceLocalInfo[5]), sW/2-32*scaleMult, 47*scaleMult, sW/2+32*scaleMult, 15*scaleMult+hH, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "center", "center")
	local textCur, textAll = tostring(raceLocalInfo[3]), "/"..tostring(raceLocalInfo[4])
	local textW = dxGetTextWidth(textCur, 2*scaleMult, "default-bold")+dxGetTextWidth(textAll, 1.25*scaleMult, "default-bold")
	dxDrawText(textCur, sW/2-hH-textW/2, 47*scaleMult, sW/2-64*scaleMult, 15*scaleMult+hH, tocolor(255,255,255,255), 2*scaleMult, "default-bold", "right", "center")
	dxDrawText(textAll, sW/2-hH, 47*scaleMult, sW/2-64*scaleMult+textW/2, 15*scaleMult+hH, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "left", "center")
	textCur, textAll = tostring(raceLocalInfo[1]), "/"..tostring(raceLocalInfo[2])
	textW = dxGetTextWidth(textCur, 2*scaleMult, "default-bold")+dxGetTextWidth(textAll, 1.25*scaleMult, "default-bold")
	dxDrawText(textCur, sW/2+64*scaleMult-textW/2, 47*scaleMult, sW/2+64*scaleMult, 79*scaleMult, tocolor(255,255,255,255), 2*scaleMult, "default-bold", "right", "center")
	dxDrawText(textAll, sW/2+64*scaleMult, 47*scaleMult, sW/2+64*scaleMult+textW/2, 79*scaleMult, tocolor(255,255,255,255), 1.25*scaleMult, "default-bold", "left", "center")
end

function raceStart(counterVal)
	if(counterVal > 0) then
		setPedCanBeKnockedOffBike(localPlayer, false)
		raceCounter = tostring(counterVal)
		playSFX("genrl", 52, 7, false)
		
		if(counterVal == 3) then
			if(isElement(raceLobbyWin)) then
				destroyElement(raceLobbyWin)
				removeCommandHandler("Decline", raceExit)
				checkCursor()
			end
			raceCounterColor = tocolor(255,0,0,255)
			actionsMenuAvailable = true
			inventoryAvailable = true
			addEventHandler("onClientRender", root, raceDrawCounter)
		end
	else
		setPedCanBeKnockedOffBike(localPlayer, true)
		raceCounter = "GO!"
		playSFX("genrl", 52, 12, false)
		addEventHandler("onClientRender", root, raceDrawHud)
		raceCounterColor = tocolor(0,255,0,255)
		setTimer(function()
					removeEventHandler("onClientRender", root, raceDrawCounter)
				 end, 1000, 1)
	end
end

function raceUpdateInfo(newInfo)
	if newInfo then
		raceCurInfo = newInfo
	end
	if raceCurInfo[4] then
		raceLocalInfo[2] = table.getn(raceCurInfo[3])+table.getn(raceCurInfo[6])
		
		for i=1,raceLocalInfo[2] do
			if(localPlayer == raceCurInfo[3][i][1]) then
				raceLocalInfo[1] = i+table.getn(raceCurInfo[6])
				raceLocalInfo[3] = raceCurInfo[3][i][4]
				break
			end
		end
		
		raceLocalInfo[5] = raceCurInfo[2]
		raceLocalInfo[4] = raceCurInfo[5]
	else
		guiSetText(raceLobbyTime, string.format("Время на сбор: %s", msecToStringTime(raceCurInfo[2])))
		guiGridListClear(raceLobbyRacersList)
		local row
		
		for i=1,table.getn(raceCurInfo[3]) do
			row = guiGridListAddRow(raceLobbyRacersList)
			guiGridListSetItemText(raceLobbyRacersList, row, raceLobbyRacersClmnPos, tostring(i), false, false)
			guiGridListSetItemText(raceLobbyRacersList, row, raceLobbyRacersClmnRacer, getPlayerName(raceCurInfo[3][i][1]), false, false)
			guiGridListSetItemText(raceLobbyRacersList, row, raceLobbyRacersClmnVeh, getVehicleName(raceCurInfo[3][i][2]), false, false)
		end
		
	end
end

function raceExit()
	if raceCurInfo[4] then
		removeEventHandler("onClientRender", root, raceDrawHud)
	else
		actionsMenuAvailable = true
		inventoryAvailable = true
		destroyElement(raceLobbyWin)
		removeCommandHandler("Decline", raceExit)
		checkCursor()
	end
	setPedCanBeKnockedOffBike(localPlayer, true)
	triggerServerEvent("onRaceExit", localPlayer)
end

function drawNicknamesSort(a, b)
	local px, py, pz = getCameraMatrix()
	local ax, ay, az = getElementPosition(a)
	local bx, by, bz = getElementPosition(b)
	return getDistanceBetweenPoints3D(px, py, pz, bx, by, bz) < getDistanceBetweenPoints3D(px, py, pz, ax, ay, az)
end

function drawNicknames()
	local nearbyPlr
	local scaleWanted = scaleMult*0.67
	px, py, pz = getCameraMatrix()
	setElementPosition(drawNicknamesCol, px, py, pz)
	players = getElementsWithinColShape(drawNicknamesCol, "player")
	table.sort(players, drawNicknamesSort)
	local playersCount = table.maxn(players)
	local playersFrom = math.max(1, playersCount-9)
	cdim = getElementDimension(localPlayer)
	cint = getElementInterior(localPlayer)
	
	for i=playersFrom,playersCount do
		nearbyPlr = players[i]
		usergrp = getElementData(nearbyPlr, "usergroup")
		
		if(not(nearbyPlr == localPlayer)) and usergrp then
			tx, ty, tz = getElementPosition(nearbyPlr)
			pdim = getElementDimension(nearbyPlr)
			pint = getElementInterior(nearbyPlr)
			
			if(pdim == cdim) and(pint == cint) then
				if isLineOfSightClear(px, py, pz, tx, ty, tz, true, false, false, true, false, false, false, localPlayer) then
					--local sx, sy, sz = getPedBonePosition(nearbyPlr, 5)
					cx, cy, cz = tx, ty, tz
					local x, y = getScreenFromWorldPosition(cx, cy, cz+0.3)
					
					if x then
						local uteam = getPlayerTeam(nearbyPlr)
						
						if uteam then
							pname = getPlayerName(nearbyPlr)
							protected = getElementData(nearbyPlr, "protected")
							teamname = getTeamName(uteam)
							playerid = getElementData(nearbyPlr, "ID")
							
							if(teamname ~= "Граждане") and(getElementData(nearbyPlr, "usergroup") == 10) then
								grpstr = "Клан ["..teamname.."]"
								grpr, grpg, grpb = getTeamColor(uteam)
							else
								--grpstr = playerGroups[usergrp][1]
								grpstr = getElementData(nearbyPlr, "usergroupname")
								grpr, grpg, grpb = playerGroups[usergrp][2],playerGroups[usergrp][3],playerGroups[usergrp][4]
							end
							
							dxDrawText(grpstr, x-2*scaleWanted, y-17*scaleWanted, x-2*scaleWanted, y-17*scaleWanted, tocolor(0,0,0,128), 0.5*scaleWanted, "bankgothic", "center", "center")
							dxDrawText(pname.." ("..playerid..")", x-2*scaleWanted, y-2*scaleWanted, x-2*scaleWanted, y-2*scaleWanted, tocolor(0,0,0,128), 0.75*scaleWanted, "bankgothic", "center", "center")
							
							if protected then
								dxDrawText("(спаун-защита)", x-2*scaleWanted, y+8*scaleWanted, x-2*scaleWanted, y+8*scaleWanted, tocolor(0,0,0,128), 0.4*scaleWanted, "bankgothic", "center", "center")
							end
							
							dxDrawText(grpstr, x, y-15*scaleWanted, x, y-15*scaleWanted, tocolor(grpr,grpg,grpb,255), 0.5*scaleWanted, "bankgothic", "center", "center")
							dxDrawText(pname.." ("..playerid..")", x, y, x, y, tocolor(grpr,grpg,grpb,255), 0.75*scaleWanted, "bankgothic", "center", "center")
							
							if protected then
								dxDrawText("(спаун-защита)", x, y+10*scaleWanted, x, y+10*scaleWanted, tocolor(64,255,64,255), 0.4*scaleWanted, "bankgothic", "center", "center")
							end
							
							pwanted = getElementData(nearbyPlr, "wantedLevel")
							
							if pwanted and(pwanted > 0) then
								for i=1,pwanted do
									dxDrawImage(x- (64-i*16)*scaleWanted, y-42*scaleWanted, 16*scaleWanted, 16*scaleWanted, wantedOnTex)
								end
								
								for i=(pwanted+1),6 do
									dxDrawImage(x- (64-i*16)*scaleWanted, y-42*scaleWanted, 16*scaleWanted, 16*scaleWanted, wantedOffTex)
								end
							end
							
						end
					end
				end
			end
		end
	end
	local uteam = getPlayerTeam(localPlayer)
	
	if uteam then
		usergrp = getElementData(localPlayer, "usergroup")
		teamname = getTeamName(uteam)
		
		if(teamname ~= "Граждане") and(usergrp == 10) then
			grpstr = "Клан ["..teamname.."]"
			grpr, grpg, grpb = getTeamColor(uteam)
		else
			--grpstr = playerGroups[usergrp][1]
			grpstr = getElementData(localPlayer, "usergroupname")
			grpr, grpg, grpb = playerGroups[usergrp][2],playerGroups[usergrp][3],playerGroups[usergrp][4]
		end
		
		dxDrawText(grpstr, 0, 5*scaleWanted, sW-7*scaleWanted, sH, tocolor(0,0,0,160), 2.5*scaleWanted, "default-bold", "right", "top")
		dxDrawText(grpstr, 0, 7*scaleWanted, sW-5*scaleWanted, sH, tocolor(grpr,grpg,grpb,160), 2.5*scaleWanted, "default-bold", "right", "top")
	end
end


function drawRespect()
	if(respectDrawTime > 0) then
		curRespect = getElementData(localPlayer, "respect")
		dxDrawImage(sW/2-192*scaleMult, 10*scaleMult, 384*scaleMult, 32*scaleMult, respectTex)
		timeVal = getTickCount()
		alphaLevel = math.fmod(timeVal, 1000)
		
		if(alphaLevel > 500) then
			alphaLevel = 1000-alphaLevel
		end
		
		alphaLevel = alphaLevel/1000
		px = sW/2+curRespect*96*scaleMult
		dxDrawLine(px, 14*scaleMult, px, 38*scaleMult, tocolor(255, 255, 255, 255*alphaLevel*2), 3*scaleMult)
		curRespectStr = string.format("%.2f", curRespect*100.0).."%"
		dxDrawText(curRespectStr, px-dxGetTextWidth(curRespectStr, scaleMult, "default-bold")/2, 43*scaleMult, px, 43*scaleMult, tocolor(255,255,255,255), scaleMult, "default-bold")
		respectDrawTime = respectDrawTime- (timeVal-respectDrawStart)
		respectDrawStart = timeVal
	
	else
		local newRespect = getElementData(localPlayer, "respect")
		
		if(math.abs(math.floor(newRespect*100.0)-math.floor(curRespect*100.0)) >= 0.01) then
			respectDrawEnable(true)
		end
		
	end
	--if getKeyState("l") and(not isChatBoxInputActive()) and(not guiGetInputEnabled()) then
	--	respectDrawEnable(false)
	--end
end

function respectDrawEnable(enableSound)
	respectDrawTime = 5000
	respectDrawStart = getTickCount()
	
	if(enableSound) then
		playSFX("genrl", 52, 14, false)
	end
end

function respectDrawDisable()
	respectDrawTime = 0
end

function jobEnterCp()
	playSFX("genrl", 52, 18, false)
end

function jobFarmLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в комбайн.", timeBackToVeh/1000))
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobFarmLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobFarmBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	triggerServerEvent("onJobFarmNowInVehicle", localPlayer, jobStateCur)
end

function jobFarm2LeaveVehicle(curState, timeBackToVeh, jobVeh)
	if(isElement(jobVehMarker)) then
		destroyElement(jobVehMarker)
	end
	
	jobStateCur = curState
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	
	if not (isTimer(jobTimerBackToVeh)) then
		msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в трактор.", timeBackToVeh/1000))
		jobTimerBackToVeh = setTimer(function()
										destroyElement(jobVehMarker)
										triggerServerEvent("onJobFarm2LeftVehicle", localPlayer)
									 end, timeBackToVeh, 1)
	end
end

function jobFarm2LeaveTrailer(curState, timeBackToTrailer, trailer)
	if(isElement(jobVehMarker)) then
		destroyElement(jobVehMarker)
	end
	
	jobStateCur = curState
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, trailer, 0, 0, 5)
	
	if not (isTimer(jobTimerBackToVeh)) then
		msgAdd(string.format("У вас есть %d секунд, чтобы вернуть прицепной плуг.", timeBackToTrailer/1000))
		jobTimerBackToVeh = setTimer(function()
										destroyElement(jobVehMarker)
										triggerServerEvent("onJobFarm2LeftVehicle", localPlayer)
									 end, timeBackToTrailer, 1)
	end
end

function jobFarm2BackToVehicle()
	if(isTimer(jobTimerBackToVeh)) then
		killTimer(jobTimerBackToVeh)
	end
	
	if(isElement(jobVehMarker)) then
		destroyElement(jobVehMarker)
	end
	
	triggerServerEvent("onJobFarm2NowInVehicle", localPlayer, jobStateCur)
end

function ferrisWheelEnter(seatObj)
	ferrisWheelObj = seatObj
	addEventHandler("onClientRender", root, ferrisWheelUpdateCam)
	addEventHandler("onClientCursorMove", root, ferrisWheelChangeCamAngle)
	setElementAlpha(localPlayer, 0)
	showCursor(true)
end

function ferrisWheelChangeCamAngle(cursorX, cursorY, absoluteX, absoluteY)
	local deltaX, deltaY
	
	if(table.getn(ferrisWheelOldPos) < 2) then
		ferrisWheelOldPos = { absoluteX, absoluteY }
		deltaX, deltaY = 0.0, 0.0
	
	else
		deltaX = absoluteX-ferrisWheelOldPos[1]
		deltaY = absoluteY-ferrisWheelOldPos[2]
		ferrisWheelOldPos[1], ferrisWheelOldPos[2] = absoluteX, absoluteY
	end
	
	ferrisWheelCamAngleZ = ferrisWheelCamAngleZ+deltaX*0.3
	
	while(ferrisWheelCamAngleZ > 360.0) do
		ferrisWheelCamAngleZ = ferrisWheelCamAngleZ-360.0
	end
	
	while(ferrisWheelCamAngleZ < 0.0) do
		ferrisWheelCamAngleZ = ferrisWheelCamAngleZ+360.0
	end
end

function ferrisWheelUpdateCam()
	cx, cy, cz = getElementPosition(ferrisWheelObj)
	cx = cx+ferrisWheelCamOffset[1]
	cy = cy+ferrisWheelCamOffset[2]
	cz = cz+ferrisWheelCamOffset[3]
	scrx, scry = getPointFromDistanceRotation(cx, cy, 1.0, ferrisWheelCamAngleZ)
	setCameraMatrix(cx, cy, cz, scrx, scry, cz)
end

function ferrisWheelExit()
	removeEventHandler("onClientRender", root, ferrisWheelUpdateCam)
	removeEventHandler("onClientCursorMove", root, ferrisWheelChangeCamAngle)
	setCameraTarget(localPlayer)
	ferrisWheelCamAngleZ = 90.0
	ferrisWheelObj = nil
	setElementAlpha(localPlayer, 255)
	checkCursor()
end

function pedDamage(attacker, weapon)
	if isPedInVehicle(source) or getElementData(source, "godmode") then
		if(attacker == localPlayer) then
			triggerServerEvent("onPedDamage", source, localPlayer, weapon)
		end
		cancelEvent()
	end
end

function otbEnter(otbInfo)
	playSFX("genrl", 44, 1, false)
	otbExit = createPickup(otbInfo[1], otbInfo[2], otbInfo[3], 3, 1318, 0, 1)
	setElementInterior(otbExit, otbInfo[5])
	setElementDimension(otbExit, getElementDimension(localPlayer))
end

function otbExit()
	playSFX("genrl", 44, 1, false)
	destroyElement(otbExit)
end

function otbWin()
	playSuccessMusic()
end

function playerShoot(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement, startX, startY, startZ)
	triggerServerEvent("onPlayerShoot", source, weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement, startX, startY, startZ)
end

function militaryBaseAlarm(baseid, enabled, x, y, z)
	if militaryBaseAlarms then
		if isElement(militaryBaseAlarms[baseid]) and(not enabled) then
			destroyElement(militaryBaseAlarms[baseid])
			militaryBaseAlarms[baseid] = nil
		elseif(not militaryBaseAlarms[baseid]) and enabled then
			militaryBaseAlarms[baseid] = playSFX3D("script", 64, 0, x, y, z, true)
			setSoundVolume(militaryBaseAlarms[baseid], gameSoundVolume)
			setSoundMaxDistance(militaryBaseAlarms[baseid], 300)
		end
	end
end

militaryCargoBoxes = {}

function militaryCargoUpdate(newarr)
	militaryCargoBoxes = newarr
end

function militaryCargoRender()
	for klift,cargo in pairs(militaryCargoBoxes) do
		if isElement(cargo) then
			cx,cy,cz = getPositionFromElementOffset(klift,0,1.5,0.08+1.5* (getVehicleAdjustableProperty(klift)/2500))
			ex,ey,ez = getElementRotation(klift)
			setElementPosition(cargo, cx, cy, cz)
			setElementRotation(cargo, ex, ey, ez)
		end
	end
end

function militaryGeneralArrive()
	jobStopTimer()
	jobTimeCur = 0
end

function militaryGeneralLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	if(curState == 0) then
		jobStopTimer()
	end
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в автомобиль генерала.", timeBackToVeh/1000))
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onMilitaryGeneralLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function militaryGeneralBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	
	if(jobTimeCur > 0) then
		jobLaunchTimer()
	end
	
	triggerServerEvent("onMilitaryGeneralNowInVehicle", localPlayer, jobStateCur)
end

function jobTaxiLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в такси.", timeBackToVeh/1000))
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobTaxiLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobTaxiBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	triggerServerEvent("onJobTaxiNowInVehicle", localPlayer, jobStateCur)
end

function drunkInc(incVal)
	drunkLevel = math.min(255, drunkLevel+incVal)
	setCameraShakeLevel(drunkLevel)
end

function drunkProc()
	drunkLevel = math.max(1, drunkLevel-1)
	local curLevel = getCameraShakeLevel()
	if not (curLevel == drunkLevel) then
		setCameraShakeLevel(drunkLevel)
	end
end

function drunkRender()
	if(drunkLevel > 1) then
		dxDrawImage(0, 0, sW, sH, drunkTex, 0, 0, 0, tocolor(255,255,255,drunkLevel))
	end
end

-- функции вызова такси
function taxiOrderCreate(ox, oy, oz)
	setTimer(taxiOrderDestroy, 60000, 1, createBlip(ox, oy, oz, 0, 2, 255, 255, 0, 255, 32767))
end

function taxiOrderDestroy(orderBlip)
	destroyElement(orderBlip)
end

-- функции вызова скорой
function ambOrderCreate(ox, oy, oz)
	setTimer(ambOrderDestroy, 60000, 1, createBlip(ox, oy, oz, 0, 2, 255, 255, 0, 255, 32767))
end

function ambOrderDestroy(orderBlip)
	destroyElement(orderBlip)
end

--функции вызова полиции
function polOrderCreate(ox, oy, oz)
	setTimer(polOrderDestroy, 60000, 1, createBlip(ox, oy, oz, 0, 2, 255, 255, 0, 255, 32767))
end

function polOrderDestroy(orderBlip)
	destroyElement(orderBlip)
end

function moneyChange(moneyDelta)
	if(moneyDelta >= 0) then
		moneyChangeValue = "+$"..tostring(moneyDelta)
		moneyChangeColorR = 0
		moneyChangeColorG = 255
	
	else
		moneyChangeValue = "-$"..tostring(-moneyDelta)
		moneyChangeColorR = 255
		moneyChangeColorG = 0
	end
	
	moneyChangeRenderTime = getTickCount()+6000
end

function moneyChangeRender()
	timeVal = moneyChangeRenderTime-getTickCount()
	if(timeVal > 0) then
		iW = sW-60*scaleMult
		
		if(timeVal < 1000) then
			mult = (1000.0-timeVal)/1000.0
			iH = sH-200*mult*scaleMult
			alphaLevel = 255-255*mult
		
		else
			iH = sH
			alphaLevel = 255
		end
		
		dxDrawText(moneyChangeValue, 2*scaleMult, 2*scaleMult, iW+2*scaleMult, iH+2*scaleMult, tocolor(0, 0, 0, alphaLevel), 2*scaleMult, "bankgothic", "right", "center")
		dxDrawText(moneyChangeValue, 0, 0, iW, iH, tocolor(moneyChangeColorR, moneyChangeColorG, moneyChangeColorB, alphaLevel), 2*scaleMult, "bankgothic", "right", "center")
	end
end

function taxiCarsUpdate(newTaxiCars)
	taxiCars = newTaxiCars
end

function taxiCarsRender()
	cx, cy, cz = getElementPosition(localCamera)
	
	for i=1,table.getn(taxiCars) do
		veh = taxiCars[i][1]
		vx, vy, vz = getElementPosition(veh)
		dist = getDistanceBetweenPoints3D(vx, vy, vz, cx, cy, cz)
		
		if(dist == 0) then
			dist = 0.001
		end
		
		if(isElementOnScreen(veh)) and(dist < 40) then
			if(isLineOfSightClear(vx, vy, vz, cx, cy, cz, true, true, false, false, false, false, false, veh)) then
				tx, ty = getScreenFromWorldPosition(vx, vy, vz)
				if(tx) then
					dxDrawText(string.format("Цена: $%d за поездку", taxiCars[i][2]), tx, ty, tx, ty, tocolor(255,255,0,255), 1.0*sH/720.0, "default-bold", "center", "center")
					dxDrawText("Пассажир на переднем сидении оплачивает проезд!", tx, ty+8, tx, ty+8, tocolor(255,255,255,255), 0.75*sH/720.0, "default-bold", "center", "center")
				end
			end
		end
	end
	
end

function taxiUse()
	if not isElement(taxiMapWin) then
		local wW = 320
		local wH = 365
		taxiMapWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Куда едем?", false)
		taxiSrc = source
		taxiMapList = guiCreateGridList(10, 25, 300, 300, false, taxiMapWin)
		local column = guiGridListAddColumn(taxiMapList, "Локация", 0.85)
		local row
		
		for _,loc in ipairs(taxiLocations) do
			row = guiGridListAddRow(taxiMapList)
			guiGridListSetItemText(taxiMapList, row, column, loc[1], false, false)
			guiGridListSetItemData(taxiMapList, row, column, loc[2])
		end
		
		guiGridListSetSortingEnabled(taxiMapList, false)
		addEventHandler("onClientGUIDoubleClick", taxiMapList, taxiAccept, false)
		local wBtn = guiCreateButton(wW/2-130, wH-30, 120, 20, "Отмена", false, taxiMapWin)
		addEventHandler("onClientGUIClick", wBtn, taxiDecline, false)
		wBtn = guiCreateButton(wW/2+10, wH-30, 120, 20, "Другое место", false, taxiMapWin)
		addEventHandler("onClientGUIClick", wBtn, taxiAcceptWithoutPosition, false)
		addCommandHandler("Select previous", taxiPrev)
		addCommandHandler("Select next", taxiNext)
		addCommandHandler("Accept", taxiAccept)
		addCommandHandler("Decline", taxiDecline)
		guiWindowSetMovable(taxiMapWin, false)
		guiWindowSetSizable(taxiMapWin, false)
		showCursor(true)
	end
end

function taxiPrev()
	local row, clmn = guiGridListGetSelectedItem(taxiMapList)
	local maxRow = guiGridListGetRowCount(taxiMapList)
	row = math.min(maxRow-1, math.max(0, row-1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(taxiMapList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(taxiMapList, row, clmn)
end

function taxiNext()
	local row, clmn = guiGridListGetSelectedItem(taxiMapList)
	local maxRow = guiGridListGetRowCount(taxiMapList)
	row = math.min(maxRow-1, math.max(0, row+1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(taxiMapList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(taxiMapList, row, clmn)
end

function taxiAccept(button, state)
	local selectedRow, selectedCol = guiGridListGetSelectedItem(taxiMapList)
	
	if selectedRow and(selectedRow >= 0) then
		local posData = guiGridListGetItemData(taxiMapList, selectedRow, selectedCol)
		destroyElement(taxiMapWin)
		removeCommandHandler("Select previous", taxiPrev)
		removeCommandHandler("Select next", taxiNext)
		removeCommandHandler("Accept", taxiAccept)
		removeCommandHandler("Decline", taxiDecline)
		local minDist, curDist
		local px, py, pz = getElementPosition(localPlayer)
		local minIndex = 0
		
		for i,pos in pairs(posData) do
			if(minIndex == 0) then
				minDist = getDistanceBetweenPoints3D(px, py, pz, pos[1], pos[2], pos[3])
				minIndex = i
			else
				curDist = getDistanceBetweenPoints3D(px, py, pz, pos[1], pos[2], pos[3])
				
				if(minDist > curDist) then
					minDist = curDist
					minIndex = i
				end
				
			end
		end
		
		if(minIndex == 0) then
			taxiDecline(button, state)
		
		else
			local posDistX, posDistY, posDistZ = posData[minIndex][1], posData[minIndex][2], posData[minIndex][3]
			triggerServerEvent("onTaxiAccept", taxiSrc, localPlayer, posDistX, posDistY, posDistZ)
			taxiCreateMarker(posDistX, posDistY, posDistZ)
			checkCursor()
		end
		
	end
end

function taxiAcceptWithoutPosition(button, state)
	destroyElement(taxiMapWin)
	removeCommandHandler("Select previous", taxiPrev)
	removeCommandHandler("Select next", taxiNext)
	removeCommandHandler("Accept", taxiAccept)
	removeCommandHandler("Decline", taxiDecline)
	triggerServerEvent("onTaxiAccept", taxiSrc, localPlayer, false)
	checkCursor()
end

function taxiDecline(button, state)
	destroyElement(taxiMapWin)
	removeCommandHandler("Select previous", taxiPrev)
	removeCommandHandler("Select next", taxiNext)
	removeCommandHandler("Accept", taxiAccept)
	removeCommandHandler("Decline", taxiDecline)
	triggerServerEvent("onTaxiDecline", taxiSrc, localPlayer)
	checkCursor()
end

function taxiCreateMarker(mx, my, mz)
	taxiRemoveMarker()
	taxiMarker = createMarker(mx, my, mz, "checkpoint", 10.0, 255, 0, 0, 255)
	taxiBlip = createBlip(0, 0, 0, 0, 2, 255, 0, 0, 255, 32767)
	attachElements(taxiBlip, taxiMarker)
end

function taxiRemoveMarker()
	if isElement(taxiMarker) then
		destroyElement(taxiMarker)
	end
	
	if isElement(taxiBlip) then
		destroyElement(taxiBlip)
	end
end

function createRequestWindow(titleText, requestText, requestSource, funcYes, funcNo)
	if not isElement(requestWin) then
		local wW = 500
		local wH = 100
		requestWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, titleText, false)
		requestSrc = requestSource
		local wLbl = guiCreateLabel(10, 25, wW-20, wH-35, requestText, false, requestWin)
		guiLabelSetHorizontalAlign(wLbl, "center")
		local wBtn = guiCreateButton(wW/2-120, wH-50, 110, 40, "Нет", false, requestWin)
		addEventHandler("onClientGUIClick", wBtn, funcNo, false)
		wBtn = guiCreateButton(wW/2+10, wH-50, 110, 40, "Да", false, requestWin)
		addEventHandler("onClientGUIClick", wBtn, funcYes, false)
		addCommandHandler("Accept", funcYes)
		addCommandHandler("Decline", funcNo)
		guiWindowSetMovable(requestWin, false)
		guiWindowSetSizable(requestWin, false)
		showCursor(true)
		requestDestroyTimer = setTimer(destroyRequestWindow, 30000, 1)
		return true
	end
	
	return false
end

function destroyRequestWindow()
	if isElement(requestWin) then
		destroyElement(requestWin)
		checkCursor()
	end
	
	if isTimer(requestDestroyTimer) then
		killTimer(requestDestroyTimer)
	end
	
	removeCommandHandler("Accept", funcYes)
	removeCommandHandler("Decline", funcNo)
end

function ambulanceRequest(price)
	createRequestWindow("Запрос на лечение", string.format("Игрок %s предлагает вас вылечить за $%d. Вы согласны?", getPlayerName(source), price), source, ambulanceAccept, ambulanceDecline)
end

function ambulanceAccept()
	destroyRequestWindow()
	triggerServerEvent("onJobAmbulanceAccept", localPlayer, requestSrc)
end

function ambulanceDecline()
	destroyRequestWindow()
	triggerServerEvent("onJobAmbulanceDecline", localPlayer, requestSrc)
end

function evacOrderCreate(ox, oy, oz)
	setTimer(evacOrderDestroy, 60000, 1, createBlip(ox, oy, oz, 0, 2, 255, 255, 0, 255, 32767))
end

function evacOrderDestroy(orderBlip)
	destroyElement(orderBlip)
end

function evacuatorFillRequest(price)
	createRequestWindow("Запрос на заправку транспорта", string.format("Игрок %s предлагает вам заправиться за $%d. Вы согласны?", getPlayerName(source), price), source, evacuatorFillAccept, evacuatorFillDecline)
end

function evacuatorFillAccept()
	destroyRequestWindow()
	triggerServerEvent("onJobEvacuatorFillAccept", localPlayer, requestSrc)
end

function evacuatorFillDecline()
	destroyRequestWindow()
	triggerServerEvent("onJobEvacuatorFillDecline", localPlayer, requestSrc)
end

function evacuatorFixRequest(price)
	createRequestWindow("Запрос на починку транспорта", string.format("Игрок %s предлагает вам ремонт за $%d. Вы согласны?", getPlayerName(source), price), source, evacuatorFixAccept, evacuatorFixDecline)
end

function evacuatorFixAccept()
	destroyRequestWindow()
	triggerServerEvent("onJobEvacuatorFixAccept", localPlayer, requestSrc)
end

function evacuatorFixDecline()
	destroyRequestWindow()
	triggerServerEvent("onJobEvacuatorFixDecline", localPlayer, requestSrc)
end

function playerDamage(attacker, weapon, bodypart, loss)
	if source ~= localPlayer then
		return
	end
	
	local alpha = getElementAlpha(localPlayer)
	
	if(alpha < 255) then
		cancelEvent()
	elseif eventModeOn then
		cancelEvent()
	else
		local arrested = getElementData(source, "arrested")
		local rcVeh = getElementData(source, "RC")
		local attackerPlr
		
		if attacker and(getElementType(attacker) == "vehicle") then
			attackerPlr = getVehicleController(attacker)
			
			if(getElementType(attacker) ~= "player") or (attacker == localPlayer) then
				attackerPlr = nil
			end
			
		
		elseif attacker and(attacker ~= localPlayer) then
			attackerPlr = attacker
		
		else
			attackerPlr = nil
		end
		
		if(arrested and(arrested > 0)) or (isElement(rcVeh)) or getElementData(localPlayer, "protected") or getElementData(localPlayer, "godMode") or exports.freecam:isFreecamEnabled() then
			cancelEvent()
		
		else
			local fireproof = getElementData(source, "fireproof")
			
			if fireproof and(weapon == 37) then
				cancelEvent()
			end
			
		end
	end
end

function lowriderMusicStart(lid, lx, ly, lz, musicId)
	lowriderMusicStop(lid)
	lowriderMusicElements[lid] = playSFX3D("radio", "Beats", musicId, lx, ly, lz)
	setSoundMaxDistance(lowriderMusicElements[lid], 150)
	setSoundVolume(lowriderMusicElements[lid], gameSoundVolume)
end

function lowriderMusicStop(lid)
	if lowriderMusicElements[lid] and isElement(lowriderMusicElements[lid]) then
		destroyElement(lowriderMusicElements[lid])
		lowriderMusicElements[lid] = nil
	end
end

function lowriderWait()
	toggleAllControls(false, true, false)
	addEventHandler("onClientRender", root, lowriderWaitRender)
end

function lowriderWaitRender()
	dxDrawText("Ждём второго игрока...", -2, -2, sW-2, sH-2, tocolor(0,0,0,255), 4*sH/720.0, "default-bold", "center", "center")
	dxDrawText("Ждём второго игрока...", 0, 0, sW, sH, tocolor(255,255,255,255), 4*sH/720.0, "default-bold", "center", "center")
end

function lowriderStart(lid, musicInfo, cameraInfo)
	toggleAllControls(false, true, false)
	toggleControl("special_control_up", true)
	toggleControl("special_control_down", true)
	toggleControl("special_control_left", true)
	toggleControl("special_control_right", true)
	toggleControl("horn", true)
	removeEventHandler("onClientRender", root, lowriderWaitRender)
	lowriderId = lid
	lowriderMyScore = 0
	lowriderEnemyScore = 0
	lowriderMusicInfo = musicInfo
	lowriderCameraInfo = cameraInfo
	lowriderCameraCurrent = 1
	lowriderHitAlpha = 0
	lowriderSwitchCamera()
	local veh = getPedOccupiedVehicle(localPlayer)
	lowriderMyX, lowriderMyY, lowriderMyZ = getElementPosition(veh)
	lowriderMyRX, lowriderMyRY, lowriderMyRZ = getElementRotation(veh)
	addEventHandler("onClientRender", root, lowriderProc)
	addEventHandler("onClientKey", root, lowriderHitKey)
end

--*sH/720.0--

function lowriderProc()
	setRadioChannel(0)
	local veh = getPedOccupiedVehicle(localPlayer)
	local px, py, pz = getElementPosition(veh)
	setElementPosition(veh, lowriderMyX, lowriderMyY, pz)
	setElementVelocity(veh, 0.0, 0.0, 0.0)
	px, py, pz = getElementRotation(veh)
	if(px > 45.0) and(px < 315.0) or (py > 45.0) and(py < 315.0) then
		setElementAngularVelocity(veh, 0.0, 0.0, 0.0)
		px = 0.0
		py = 0.0
	end
	setElementRotation(veh, px, py, lowriderMyRZ)
	myScoreText = string.format("Мой счёт: %d", lowriderMyScore)
	enemyScoreText = string.format("Счёт противника: %d", lowriderEnemyScore)
	dxDrawText(myScoreText, -2, -2, sW-2, sH/2-2, tocolor(0,0,0,255), 3, "default-bold", "center", "center")
	dxDrawText(myScoreText, 0, 0, sW, sH/2, tocolor(94,193,255,255), 3, "default-bold", "center", "center")
	dxDrawText(enemyScoreText, -2, 28, sW-2, sH/2+28, tocolor(0,0,0,255), 1.5, "default-bold", "center", "center")
	dxDrawText(enemyScoreText, 0, 30, sW, sH/2+30, tocolor(94,193,255,255), 1.5, "default-bold", "center", "center")
	if(lowriderHitAlpha > 0) then
		dxDrawImage(sW/2-32, sH-264, 64, 64, lowriderChitTex, 0, 0, 0, tocolor(lowriderHitColorR, lowriderHitColorG, lowriderHitColorB, lowriderHitAlpha))
	end
	lowriderHitAlpha = math.max(0, lowriderHitAlpha-10)
	
	if lowriderMusicElements[lowriderId] and isElement(lowriderMusicElements[lowriderId]) then
		musicSeek = getSoundPosition(lowriderMusicElements[lowriderId])
	else
		musicSeek = 0
	end
	
	for i=1,table.getn(lowriderMusicInfo) do
		if(musicSeek >=(lowriderMusicInfo[i][2]-2.0)) and(musicSeek <(lowriderMusicInfo[i][2]+2.0)) then
			mult = (lowriderMusicInfo[i][2]-musicSeek)/2.0
			alphaLevel = (1.0-math.abs(mult))*255
			
			if(alphaLevel > 0) then
				px = sW/2-32+mult*200
				py = sH-264
				
				if(lowriderMusicInfo[i][1] == 1) then
					imgName = lowriderUpTex
				
				elseif(lowriderMusicInfo[i][1] == 2) then
					imgName = lowriderDownTex
				
				elseif(lowriderMusicInfo[i][1] == 3) then
					imgName = lowriderLeftTex
				
				else
					imgName = lowriderRightTex
				end
				
				dxDrawImage(px, py, 64, 64, imgName, 0, 0, 0, tocolor(255, 255, 255, alphaLevel))
				--local multKey = math.max(0.0, 1.0- (math.abs(lowriderMusicInfo[i][2]-musicSeek)/0.32))
			end
		end
	end
	dxDrawImage(sW/2-32, sH-264, 64, 64, lowriderRingTex)
end

function lowriderHitKey(button, pressed)
	if pressed and(not isCursorShowing()) then
		if lowriderMusicElements[lowriderId] and isElement(lowriderMusicElements[lowriderId]) then
			musicSeek = getSoundPosition(lowriderMusicElements[lowriderId])
		else
			musicSeek = 0
		end
		
		correctKey = false
		for i=1,table.getn(lowriderMusicInfo) do
			if(not lowriderMusicInfo[i][3]) and(musicSeek >=(lowriderMusicInfo[i][2]-0.32)) and(musicSeek <(lowriderMusicInfo[i][2]+0.32)) then
				if(lowriderMusicInfo[i][1] == 1) then
					ctrlName = "special_control_up"
				
				elseif(lowriderMusicInfo[i][1] == 2) then
					ctrlName = "special_control_down"
				
				elseif(lowriderMusicInfo[i][1] == 3) then
					ctrlName = "special_control_left"
				
				else
					ctrlName = "special_control_right"
				end
				
				ctrlKeys = getBoundKeys(ctrlName)
				if ctrlKeys and ctrlKeys[button] then
					table.insert(lowriderMusicInfo[i], true)
					mult = 1.0- (math.abs(lowriderMusicInfo[i][2]-musicSeek)/0.32)
					triggerServerEvent("onLowriderAddScore", localPlayer, lowriderId, math.floor(mult*100.0))
					lowriderHitColorR = 255
					lowriderHitColorG = 255
					lowriderHitColorB = 255
					lowriderHitAlpha = 255
					correctKey = true
				end
			end
		end
		if not correctKey then
			ctrlKeys = getBoundKeys("special_control_up")
			
			if ctrlKeys and ctrlKeys[button] then
				triggerServerEvent("onLowriderAddScore", localPlayer, lowriderId, -20)
				lowriderHitColorR = 255
				lowriderHitColorG = 0
				lowriderHitColorB = 0
				lowriderHitAlpha = 255
			end
			
			ctrlKeys = getBoundKeys("special_control_down")
			
			if ctrlKeys and ctrlKeys[button] then
				triggerServerEvent("onLowriderAddScore", localPlayer, lowriderId, -20)
				lowriderHitColorR = 255
				lowriderHitColorG = 0
				lowriderHitColorB = 0
				lowriderHitAlpha = 255
			end
			
			ctrlKeys = getBoundKeys("special_control_left")
			
			if ctrlKeys and ctrlKeys[button] then
				triggerServerEvent("onLowriderAddScore", localPlayer, lowriderId, -20)
				lowriderHitColorR = 255
				lowriderHitColorG = 0
				lowriderHitColorB = 0
				lowriderHitAlpha = 255
			end
			
			ctrlKeys = getBoundKeys("special_control_right")
			
			if ctrlKeys and ctrlKeys[button] then
				triggerServerEvent("onLowriderAddScore", localPlayer, lowriderId, -20)
				lowriderHitColorR = 255
				lowriderHitColorG = 0
				lowriderHitColorB = 0
				lowriderHitAlpha = 255
			end
		end
	end
end

function lowriderSwitchCamera()
	lowriderCameraCurrent = lowriderCameraCurrent+1
	
	if(lowriderCameraCurrent > table.getn(lowriderCameraInfo)) then
		lowriderCameraCurrent = 1
	end
	
	local lowriderCameraInfoCur = lowriderCameraInfo[lowriderCameraCurrent]
	
	setCameraMatrix(lowriderCameraInfoCur[1], lowriderCameraInfoCur[2], lowriderCameraInfoCur[3], lowriderCameraInfoCur[4], lowriderCameraInfoCur[5], lowriderCameraInfoCur[6])
	lowriderCameraTimer = setTimer(lowriderSwitchCamera, 10000, 1)
end

function lowriderSetScores(myScore, enemyScore)
	lowriderMyScore = myScore
	lowriderEnemyScore = enemyScore
end

function lowriderFinish()
	toggleAllControls(true, true, false)
	
	if isTimer(lowriderCameraTimer) then
		killTimer(lowriderCameraTimer)
	end
	
	removeEventHandler("onClientRender", root, lowriderWaitRender)
	removeEventHandler("onClientRender", root, lowriderProc)
	removeEventHandler("onClientKey", root, lowriderHitKey)
	setCameraTarget(localPlayer)
	endJob(0, 0)
end

function heaverDraw()
	if getElementData(localPlayer, "heaverCargo") then
		dxDrawText(heaverText, -2, 28, sW-2, sH/2+28, tocolor(0,0,0,255), 1.5, "default-bold", "center", "center")
		dxDrawText(heaverText, 0, 30, sW, sH/2+30, tocolor(255,255,255,255), 1.5, "default-bold", "center", "center")
	end
end

function heaverDrop(button, pressed)
	if(button == "q") and pressed and getElementData(localPlayer, "heaverCargo") then
		triggerServerEvent("onHeaverDrop", localPlayer)
	end
end

function policeBackup()
	local bMarker = createBlip(0, 0, 0, 0, 2, 255, 255, 0, 255, 32767)
	attachElements(bMarker, source)
	msgAdd("Полицейский "..getPlayerName(source).." вызывает подкрепление. Местоположение обозначено желтым маркером на радаре.")
	setTimer(policeBackupDestroy, 60000, 1, bMarker)
end

function policeBackupDestroy(bMarker)
	if isElement(bMarker) then
		destroyElement(bMarker)
	end
end

function availableWorkShow(workList)
	table.insert(workList, { "Грузчик", -100 })
	local wW = 250
	local wH = table.getn(workList)*20+65
	local respect = getElementData(localPlayer, "respect")
	respect = respect*100.0
	workWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Список карьер", false)
	guiWindowSetMovable(workWin, false)
	guiWindowSetSizable(workWin, false)
	local workLabel, workColor, workBorderLabel
	
	for i,work in ipairs(workList) do
		if work[3] then
			workBorderLabel = tostring(work[2]).."%, фракция"
		
		elseif(work[2] <= -100) then
			workBorderLabel = "без ограничений"
			
		else
			workBorderLabel = tostring(work[2]).."%"
		end
		
		workLabel = guiCreateLabel(10, 25+ (i-1)*20, wW-10, 15, work[1].."("..workBorderLabel..")", false, workWin)
		
		if(respect < work[2]) then
			guiLabelSetColor(workLabel, 255, 0, 0)
		
		else
			guiLabelSetColor(workLabel, 0, 255, 0)
		end
	end
	
	local wButton = guiCreateButton(wW/2-60, wH-30, 120, 20, "Закрыть", false, workWin)
	addEventHandler("onClientGUIClick", wButton, availableWorkHide, false)
	addCommandHandler("Accept", availableWorkHide)
	addCommandHandler("Decline", availableWorkHide)
	showCursor(true)
end

function availableWorkHide()
	if isElement(workWin) then
		destroyElement(workWin)
		removeCommandHandler("Accept", availableWorkHide)
		removeCommandHandler("Decline", availableWorkHide)
		playSFX("genrl", 53, 0, false)
	end
	checkCursor()
end

function animShowMenu(alist)
	if not animShow then
		guiGridListClear(animList)
		local row
		
		for i,anim in ipairs(alist) do
			row = guiGridListAddRow(animList)
			guiGridListSetItemText(animList, row, 1, anim[1], false, false)
			guiGridListSetItemData(animList, row, 1, anim)
		end
		
		guiSetVisible(animMenu, true)
		addCommandHandler("Select previous", animPrev)
		addCommandHandler("Select next", animNext)
		addCommandHandler("Accept", animPlay)
		addCommandHandler("Decline", animHideMenu)
		animShow = true
		showCursor(true)
	end
end

function animPrev()
	local row, clmn = guiGridListGetSelectedItem(animList)
	local maxRow = guiGridListGetRowCount(animList)
	row = math.min(maxRow-1, math.max(0, row-1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(animList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(animList, row, clmn)
end

function animNext()
	local row, clmn = guiGridListGetSelectedItem(animList)
	local maxRow = guiGridListGetRowCount(animList)
	row = math.min(maxRow-1, math.max(0, row+1))
	clmn = math.max(1, clmn)
	guiGridListSetVerticalScrollPosition(animList, math.ceil(row*100.0/maxRow))
	guiGridListSetSelectedItem(animList, row, clmn)
end

function animPlay(button)
	if animShow and((button == "left") or (button == "Accept")) then
		local row = guiGridListGetSelectedItem(animList)
		
		if row and(row >= 0) then
			animHideMenu()
			triggerServerEvent("onAnimPlay", localPlayer, guiGridListGetItemData(animList, row, 1))
		end
		
	end
end

function animHideMenu()
	if animShow then
		guiSetVisible(animMenu, false)
		removeCommandHandler("Select previous", animPrev)
		removeCommandHandler("Select next", animNext)
		removeCommandHandler("Accept", animPlay)
		removeCommandHandler("Decline", animHideMenu)
		animShow = false
		checkCursor()
	end
end

function fakeExplosion(ex, ey, ez, eint, edim, etype)
	local pint = getElementInterior(localPlayer)
	local pdim = getElementDimension(localPlayer)
	
	if(pint == eint) and(pdim == edim) then
		createExplosion(ex, ey, ez, etype, true, -1.0, false)
	end
	
end

function rcStart(rcVeh, sx, sy, sz)
	setHeliBladeCollisionsEnabled(rcVeh, false)
	if(source == localPlayer) then
		rcVehicle = rcVeh
		rcX = sx
		rcY = sy
		rcZ = sz
		addEventHandler("onClientRender", root, rcRender)
	end
end

function rcRender()
	px, py, pz = getElementPosition(rcVehicle)
	setCameraMatrix(rcX, rcY, rcZ+1, px, py, pz)
end

function rcStop()
	removeEventHandler("onClientRender", root, rcRender)
	setCameraTarget(localPlayer)
end

function jobFoodLeaveVehicle(curState, timeBackToVeh, jobVeh)
	jobStateCur = curState
	msgAdd(string.format("У вас есть %d секунд, чтобы вернуться в транспортное средство.", timeBackToVeh/1000))
	jobVehMarker = createMarker(0, 0, 0, "arrow", 2.0, 255, 255, 0, 255)
	attachElements(jobVehMarker, jobVeh, 0, 0, 5)
	jobTimerBackToVeh = setTimer(function()
									destroyElement(jobVehMarker)
									triggerServerEvent("onJobFoodLeftVehicle", localPlayer)
								 end, timeBackToVeh, 1)
end

function jobFoodBackToVehicle()
	killTimer(jobTimerBackToVeh)
	destroyElement(jobVehMarker)
	triggerServerEvent("onJobFoodNowInVehicle", localPlayer, jobStateCur)
end

function jobFoodUpdate(vehArray)
	jobFoodVehicles = vehArray
end

function jobFoodRender()
	cx, cy, cz = getElementPosition(localCamera)
	for _,veh in ipairs(jobFoodVehicles) do
		vx, vy, vz = getElementPosition(veh)
		dist = getDistanceBetweenPoints3D(vx, vy, vz, cx, cy, cz)
		
		if(dist == 0) then
			dist = 0.001
		end
		
		if(isElementOnScreen(veh)) and(dist < 40) then
			if(isLineOfSightClear(vx, vy, vz, cx, cy, cz, true, true, false, false, false, false, false, veh)) then
				tx, ty = getScreenFromWorldPosition(vx, vy, vz)
				if(tx) then
					dxDrawText("Продажа еды", tx, ty, tx, ty, tocolor(255,255,0,255), 1.2, "default-bold", "center", "center")
				end
			end
		end
	end
end

function derbyEnter(lobbyInfo)
	actionsMenuAvailable = false
	inventoryAvailable = false
	derbyLobbyWin = guiCreateWindow(sW/2-derbyLobbyWinW/2, sH/2-derbyLobbyWinH/2, derbyLobbyWinW, derbyLobbyWinH, "Дерби", false)
	guiWindowSetMovable(derbyLobbyWin, false)
	guiWindowSetSizable(derbyLobbyWin, false)
	derbyLobbyTime = guiCreateLabel(10, 25, derbyLobbyWinW-20, 25, "Время до дерби:", false, derbyLobbyWin)
	guiLabelSetHorizontalAlign(derbyLobbyTime, "center")
	guiLabelSetVerticalAlign(derbyLobbyTime, "center")
	derbyLobbyRacersList = guiCreateGridList(10, 60, derbyLobbyWinW-20, derbyLobbyWinH-105, false, derbyLobbyWin)
	guiGridListSetSortingEnabled(derbyLobbyRacersList, false)
	derbyLobbyRacersClmnPos = guiGridListAddColumn(derbyLobbyRacersList, "Поз", 0.3)
	derbyLobbyRacersClmnRacer = guiGridListAddColumn(derbyLobbyRacersList, "Игрок", 0.7)
	derbyLobbyBtnCancel = guiCreateButton(10, derbyLobbyWinH-35, derbyLobbyWinW-20, 25, "Покинуть дерби", false, derbyLobbyWin)
	addEventHandler("onClientGUIClick", derbyLobbyBtnCancel, derbyExit, false)
	addCommandHandler("Decline", derbyExit)
	derbyLobbyUpdate(lobbyInfo)
	showCursor(true)
end

function derbyExit()
	triggerServerEvent("onDerbyExit", localPlayer)
end

function derbyLobbyUpdate(lobbyInfo)
	guiGridListClear(derbyLobbyRacersList)
	local row
	
	for i,racer in ipairs(lobbyInfo[1]) do
		row = guiGridListAddRow(derbyLobbyRacersList)
		guiGridListSetItemText(derbyLobbyRacersList, row, derbyLobbyRacersClmnPos, tostring(i), false, false)
		guiGridListSetItemText(derbyLobbyRacersList, row, derbyLobbyRacersClmnRacer, getPlayerName(racer), false, false)
	end
	
	guiSetText(derbyLobbyTime, "Время до дерби: "..msecToStringTime(lobbyInfo[2]))
end

function derbyStart()
	actionsMenuAvailable = false
	inventoryAvailable = false
	
	if isElement(derbyLobbyWin) then
		destroyElement(derbyLobbyWin)
		removeCommandHandler("Decline", derbyExit)
		checkCursor()
	end
	
	addEventHandler("onClientRender", root, derbyCountdownRender)
	derbyCountdown(3)
end

function derbyCountdown(startSec)
	derbyCountdownSec = startSec
	
	if(startSec > 0) then
		playSFX("genrl", 52, 7, false)
		setTimer(derbyCountdown, 1000, 1, startSec-1)
	
	elseif(startSec == 0) then
		playSFX("genrl", 52, 12, false)
		triggerServerEvent("onDerbyGo", localPlayer)
		setTimer(derbyCountdown, 1000, 1, -1)
	
	else
		removeEventHandler("onClientRender", root, derbyCountdownRender)
	end
end

function derbyCountdownRender()
	if(derbyCountdownSec > 0) then
		derbyCounterText = tonumber(derbyCountdownSec)
		derbyCounterColor = tocolor(255,0,0,255)
	
	else
		derbyCounterText = "GO!"
		derbyCounterColor = tocolor(0,255,0,255)
	end
	
	dxDrawText(derbyCounterText, sW/2-3, sH/2-3, sW/2-3, sH/2-3, tocolor(0,0,0,255), 2.5, "bankgothic", "center", "center")
	dxDrawText(derbyCounterText, sW/2+3, sH/2+3, sW/2+3, sH/2+3, tocolor(0,0,0,255), 2.5, "bankgothic", "center", "center")
	dxDrawText(derbyCounterText, sW/2-3, sH/2+3, sW/2-3, sH/2+3, tocolor(0,0,0,255), 2.5, "bankgothic", "center", "center")
	dxDrawText(derbyCounterText, sW/2+3, sH/2-3, sW/2+3, sH/2-3, tocolor(0,0,0,255), 2.5, "bankgothic", "center", "center")
	dxDrawText(derbyCounterText, sW/2, sH/2, sW/2, sH/2, derbyCounterColor, 2.5, "bankgothic", "center", "center")
end

function derbyLeave()
	actionsMenuAvailable = true
	inventoryAvailable = true
	
	if isElement(derbyLobbyWin) then
		destroyElement(derbyLobbyWin)
		removeCommandHandler("Decline", derbyExit)
		checkCursor()
	end
end

function derbyWin()
	playSuccessMusic()
end

function reportShow(reportText)
	outputChatBox(reportText, 0, 160, 0)
	playSound("audio/message.wav")
end

function trainMove(trainData, trainId)
	trainElements[trainId] = trainData
	local targetPoint, trainRoute, trainSpeed, curSpeed
	for trainId=1,table.getn(trainElements) do
		trainRoute = trainRoutes[trainElements[trainId][3]]
		targetPoint = trainRoute[trainElements[trainId][4]]
		if(trainElements[trainId][5] > 0) then
			setTrainSpeed(trainElements[trainId][1], 0)
			setPedAnalogControlState(trainElements[trainId][2], "accelerate", 0)
			setPedAnalogControlState(trainElements[trainId][2], "brake_reverse", 0)
		else
			if targetPoint[5] then
				trainSpeed = trainSpeedSlow
			else
				trainSpeed = trainSpeedFast
			end
			curSpeed = getTrainSpeed(trainElements[trainId][1])
			if(curSpeed > (trainSpeed+0.05)) then
				setPedAnalogControlState(trainElements[trainId][2], "accelerate", 0)
				setPedAnalogControlState(trainElements[trainId][2], "brake_reverse", 1)
			elseif(curSpeed < (trainSpeed-0.05)) then
				setPedAnalogControlState(trainElements[trainId][2], "accelerate", 1)
				setPedAnalogControlState(trainElements[trainId][2], "brake_reverse", 0)
			else
				setPedAnalogControlState(trainElements[trainId][2], "accelerate", 0)
				setPedAnalogControlState(trainElements[trainId][2], "brake_reverse", 0)
			end
		end
	end
end

function vehicleDamage(theAttacker, theWeapon, loss, damagePosX, damagePosY, damagePosZ, tyreID)
	local broken = getElementData(source, "broken")
	
	if broken then
		cancelEvent()
	
	elseif eventModeOn and(getVehicleOccupant(source) == localPlayer) then
		cancelEvent()
	
	else
		local armorLevel = getElementData(source, "armorLevel")
		
		if armorLevel then
			if(armorLevel > 0) then
				if tyreID then
					cancelEvent()
				end
				
				if(armorLevel > 2) and(theWeapon == 37) then
					cancelEvent()
				end
			end
		end
	end
end

function vehicleCollision(theHitElement, force, bodypart, collisionX, collisionY, collisionZ, normalX, normalY, normalZ, hitElementForce, model)
	local armorLevel = getElementData(source, "armorLevel")
	
	if armorLevel and(armorLevel > 1) then
		cancelEvent()
	end
end

function receivePoliceMessage(msg)
	if isElement(source) then
		local srtpos, endpos = string.find(msg, "[Полиция] ")
		
		if srtpos then
			local msgIndex = string.sub(msg, endpos+1)
			
			if policeMessages[msgIndex] and isTimer(policeMessages[msgIndex]) then
				deletePoliceMessage(msgIndex)
			else
				setSoundVolume(playSound("audio/police.wav"), gameSoundVolume)
				outputChatBox(msg, 0, 0, 255, true)
			end
			
			policeMessages[msgIndex] = setTimer(deletePoliceMessage, 30000, 1, msgIndex)
		end
	end
end

function deletePoliceMessage(msg)
	if policeMessages[msg] and isTimer(policeMessages[msg]) then
		killTimer(policeMessages[msg])
	end
	policeMessages[msg] = nil
end

function crimeCreateBlip(suspect)
	crimeDestroyBlip()
	crimeBlip = createBlip(0, 0, 0, 0, 2, 255, 0, 0, 255, 32767)
	attachElements(crimeBlip, suspect)
	crimeBlipTimer = setTimer(crimeDestroyBlip, 120000, 1)
	addEventHandler("onClientVehicleExit", root, crimeVehicleExit)
	msgAdd("Преступник "..getPlayerName(suspect).." отмечен на карте красной точкой на две минуты.")
end

function crimeVehicleExit(thePlayer)
	if isElement(crimeBlip) then
		if(thePlayer == localPlayer) then
			crimeDestroyBlip()
		end
	
	else
		removeEventHandler("onClientVehicleExit", root, crimeVehicleExit)
	end
end

function crimeDestroyBlip()
	if isElement(crimeBlip) then
		removeEventHandler("onClientVehicleExit", root, crimeVehicleExit)
		
		if isTimer(crimeBlipTimer) then
			killTimer(crimeBlipTimer)
		end
		
		destroyElement(crimeBlip)
		crimeBlip = nil
		crimeBlipTimer = nil
	end
end

function clanBaseConstructionStart(baseid, objmdl, coordx, coordy, coordz, rotx, roty, rotz, buildTime)
	local obj = createObject(objmdl, coordx, coordy, coordz, rotx, roty, rotz)
	local _,_,startz,_,_,maxz = getElementBoundingBox(obj)
	startz = coordz-maxz+startz
	setElementPosition(obj, coordx, coordy, startz)
	moveObject(obj, buildTime, coordx, coordy, coordz)
	table.insert(clanBaseConstructions, { baseid, obj, nil, coordx, coordy, coordz })
	clanBaseConstructionProc()
end

function clanBaseConstructionProc()
	local cx, cy, cz = getElementPosition(localCamera)
	local sx, sy, sz
	
	for i,construction in ipairs(clanBaseConstructions) do
		if not construction[3] then
			sx, sy, sz = construction[4], construction[5], construction[6]
			
			if(getDistanceBetweenPoints3D(cx,cy,cz,sx,sy,sz) <= 300.0) then
				local soundObj = playSound3D(clanBaseConstructionSound, sx, sy, sz, true)
				setSoundMaxDistance(soundObj, 300)
				clanBaseConstructions[i][3] = soundObj
			end
			
		end
	end
	
end

function clanBaseConstructionFinish(baseid)
	for i,construction in ipairs(clanBaseConstructions) do
		if(construction[1] == baseid) then
			if isElement(construction[3]) then
				destroyElement(construction[3])
			end
			
			if isElement(construction[2]) then
				destroyElement(construction[2])
			end
			
			table.remove(clanBaseConstructions, i)
			break
		end
	end
end

function clanInfoUpdate(leader, coleaders, members)
	clanInfoLeader = leader
	clanInfoMembers = members
	clanInfoColeaders = coleaders
	
	if clanMenu then
		clanUpdateMenu()
	end
end

function clanOpenMenu(clan)
	if not clanMenu then
		local clanName = getTeamName(clan)
		local clanR, clanG, clanB = getTeamColor(clan)
		local curButton
		clanMenu = guiCreateWindow(sW/2-300, sH/2-300, 600, 600, "Меню клана "..clanName, false)
		guiSetVisible(clanMenu, false)
		guiWindowSetMovable(clanMenu, false)
		guiWindowSetSizable(clanMenu, false)
		clanLabelLeader = guiCreateLabel(10, 20, 580, 35, clanName, false, clanMenu)
		guiLabelSetHorizontalAlign(clanLabelLeader, "center", true)
		guiLabelSetVerticalAlign(clanLabelLeader, "center")
		guiSetFont(clanLabelLeader, "sa-header")
		guiLabelSetColor(clanLabelLeader, clanR, clanG, clanB)
		clanLabelLeader = guiCreateLabel(10, 60, 290, 15, "Лидер клана:", false, clanMenu)
		guiLabelSetHorizontalAlign(clanLabelLeader, "right", true)
		guiLabelSetVerticalAlign(clanLabelLeader, "center")
		clanLabelLeader = guiCreateLabel(300, 60, 290, 15, "", false, clanMenu)
		guiLabelSetHorizontalAlign(clanLabelLeader, "left", true)
		guiLabelSetVerticalAlign(clanLabelLeader, "center")
		clanListColeaders = guiCreateLabel(10, 95, 285, 15, "Список ко-лидеров клана:", false, clanMenu)
		guiLabelSetHorizontalAlign(clanListColeaders, "left", true)
		guiLabelSetVerticalAlign(clanListColeaders, "center")
		clanListColeaders = guiCreateGridList(10, 110, 285, 225, false, clanMenu)
		guiGridListSetSortingEnabled(clanListColeaders, false)
		guiGridListAddColumn(clanListColeaders, "Игрок", 0.85)
		addEventHandler("onClientGUIClick", clanListColeaders, clanMenuInsertPlayer, false)
		clanListMembers = guiCreateLabel(305, 95, 285, 15, "Список членов клана:", false, clanMenu)
		guiLabelSetHorizontalAlign(clanListMembers, "left", true)
		guiLabelSetVerticalAlign(clanListMembers, "center")
		clanListMembers = guiCreateGridList(305, 110, 285, 225, false, clanMenu)
		guiGridListSetSortingEnabled(clanListMembers, false)
		guiGridListAddColumn(clanListMembers, "Игрок", 0.85)
		addEventHandler("onClientGUIClick", clanListMembers, clanMenuInsertPlayer, false)
		clanMenuPlrInput = guiCreateLabel(10, 345, 50, 20, "Игрок:", false, clanMenu)
		guiLabelSetHorizontalAlign(clanMenuPlrInput, "left", true)
		guiLabelSetVerticalAlign(clanMenuPlrInput, "center")
		clanMenuPlrInput = guiCreateEdit(60, 345, 530, 20, "", false, clanMenu)
		curButton = guiCreateButton(10, 370, 580, 20, "Пригласить в клан", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanMenuInvite, false)
		curButton = guiCreateButton(10, 395, 580, 20, "Сделать ко-лидером / убрать из ко-лидеров клана", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanMenuSetColeader, false)
		curButton = guiCreateButton(10, 420, 580, 20, "Сделать лидером клана", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanMenuSetLeader, false)
		curButton = guiCreateButton(10, 445, 580, 20, "Исключить из клана", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanMenuRemoveMember, false)
		curButton = guiCreateButton(10, 470, 580, 20, "Покинуть клан", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanMenuLeave, false)
		curButton = guiCreateButton(10, 550, 580, 40, "Закрыть", false, clanMenu)
		addEventHandler("onClientGUIClick", curButton, clanCloseMenu, false)
		clanUpdateMenu()
		guiSetVisible(clanMenu, true)
		guiSetInputMode("no_binds_when_editing")
		showCursor(true)
	end
end

function clanMenuInvite(button)
	if(button == "left") then
		local players = getPlayersFromPartialName(guiGetText(clanMenuPlrInput))
		clanCloseMenu()
		local playersNum = table.getn(players)
		
		if(playersNum == 0) then
			msgAdd("Вашему запросу не соответствует ни один игрок на сервере.")
		
		elseif(playersNum > 1) then
			msgAdd("Вашему запросу соответствует "..tostring(playersNum).." игрокам на сервере. Попробуйте конкретизировать имя игрока.")
		
		else
			triggerServerEvent("onClanInvite", resourceRoot, localPlayer, players[1])
		end
	end
end

function clanMenuInsertPlayer(button)
	if(button == "left") then
		local curRow, curColumn = guiGridListGetSelectedItem(source)
		
		if curRow and(curRow >= 0) then
			guiSetText(clanMenuPlrInput, guiGridListGetItemText(source, curRow, curColumn))
		end
	end
end

function clanMenuSetColeader(button)
	if(button == "left") then
		local players = getPlayersFromPartialName(guiGetText(clanMenuPlrInput))
		clanCloseMenu()
		local playersNum = table.getn(players)
		
		if(playersNum == 0) then
			msgAdd("Вашему запросу не соответствует ни один игрок на сервере.")
		
		elseif(playersNum > 1) then
			msgAdd("Вашему запросу соответствует "..tostring(playersNum).." игрокам на сервере. Попробуйте конкретизировать имя игрока.")
		
		else
			triggerServerEvent("onClanSetColeader", resourceRoot, localPlayer, players[1])
		end
	end
end

function clanMenuSetLeader(button)
	if(button == "left") then
		local players = getPlayersFromPartialName(guiGetText(clanMenuPlrInput))
		clanCloseMenu()
		local playersNum = table.getn(players)
		
		if(playersNum == 0) then
			msgAdd("Вашему запросу не соответствует ни один игрок на сервере.")
		
		elseif(playersNum > 1) then
			msgAdd("Вашему запросу соответствует "..tostring(playersNum).." игрокам на сервере. Попробуйте конкретизировать имя игрока.")
		
		else
			triggerServerEvent("onClanSetLeader", resourceRoot, localPlayer, players[1])
		end
	end
end

function clanMenuRemoveMember(button)
	if(button == "left") then
		local players = getPlayersFromPartialName(guiGetText(clanMenuPlrInput))
		clanCloseMenu()
		local playersNum = table.getn(players)
		
		if(playersNum == 0) then
			msgAdd("Вашему запросу не соответствует ни один игрок на сервере.")
		
		elseif(playersNum > 1) then
			msgAdd("Вашему запросу соответствует "..tostring(playersNum).." игрокам на сервере. Попробуйте конкретизировать имя игрока.")
		
		else
			triggerServerEvent("onClanRemoveMember", resourceRoot, localPlayer, players[1])
		end
	end
end

function clanMenuLeave(button)
	if(button == "left") then
		clanCloseMenu()
		triggerServerEvent("onClanLeave", resourceRoot, localPlayer)
	end
end

function clanUpdateMenu()
	if clanMenu then
		if clanInfoLeader then
			guiSetText(clanLabelLeader, " "..getPlayerName(clanInfoLeader))
			guiLabelSetColor(clanLabelLeader, 0, 200, 0)
		
		else
			guiSetText(clanLabelLeader, " offline")
			guiLabelSetColor(clanLabelLeader, 200, 0, 0)
		end
		
		local row
		guiGridListClear(clanListColeaders)
		
		for _,plr in ipairs(clanInfoColeaders) do
			row = guiGridListAddRow(clanListColeaders)
			guiGridListSetItemText(clanListColeaders, row, 1, getPlayerName(plr), false, false)
		end
		
		guiGridListClear(clanListMembers)
		
		for _,plr in ipairs(clanInfoMembers) do
			row = guiGridListAddRow(clanListMembers)
			guiGridListSetItemText(clanListMembers, row, 1, getPlayerName(plr), false, false)
		end
		
	end
end

function clanCloseMenu()
	if clanMenu then
		destroyElement(clanMenu)
		clanMenu = nil
		checkCursor()
		guiSetInputMode("no_binds_when_editing")
	end
end

function clanBaseGeneratorUpdate(baseId, info)
	if baseId then
		clanBaseGenerators[baseId][2] = info
	else
		clanBaseGenerators = info
	end
end

function clanBaseGeneratorProcess()
	cx, cy, cz = getElementPosition(localCamera)
	for baseId,gen in ipairs(clanBaseGenerators) do
		gx, gy, gz = getElementPosition(gen[1])
		dist = getDistanceBetweenPoints3D(cx,cy,cz,gx,gy,gz)
		if(dist <= 12.0) and isLineOfSightClear(cx,cy,cz,gx,gy,gz,true,true,false,true,false,false,false,gen[1]) then
			dx, dy = getScreenFromWorldPosition(gx,gy,gz)
			
			if dx then
				fuel = dw*getElementData(gen[1], "fuelLevel")
				dx = dx-dw/2
				dy = dy-dh/2
				dxDrawRectangle(dx, dy, dw, dh, tocolor(255,0,0,96))
				dxDrawRectangle(dx, dy, fuel, dh, tocolor(0,0,255,200))
				dxDrawLine(dx, dy, dx+dw, dy, tocolor(0,0,0,255), 2)
				dxDrawLine(dx, dy, dx, dy+dh, tocolor(0,0,0,255), 2)
				dxDrawLine(dx+dw, dy, dx+dw, dy+dh, tocolor(0,0,0,255), 2)
				dxDrawLine(dx, dy+dh, dx+dw, dy+dh, tocolor(0,0,0,255), 2)
			end
			
		end
		
		if(gen[2] == "on") then
			if(dist <= 100.0) and(not gen[3]) then
				setSoundMaxDistance(playSound3D(clanBaseGeneratorSoundOn, gx, gy, gz), 100)
				sound = playSound3D(clanBaseGeneratorSoundWork, gx, gy, gz, true)
				setSoundMaxDistance(sound, 100)
				clanBaseGenerators[baseId][3] = sound
			end
			
		elseif(gen[2] == "off") then
			if gen[3] then
				destroyElement(gen[3])
				clanBaseGenerators[baseId][3] = nil
				gx, gy, gz = getElementPosition(gen[1])
				setSoundMaxDistance(playSound3D(clanBaseGeneratorSoundOff, gx, gy, gz), 100)
			end
		end
	end
end

function clanBaseAlarmUpdate(baseId, info)
	if baseId then
		clanBaseAlarms[baseId][2] = info
	else
		clanBaseAlarms = info
	end
end

function clanBaseAlarmProcess()
	cx, cy, cz = getElementPosition(localCamera)
	for baseId,alarm in ipairs(clanBaseAlarms) do
		if alarm[2] and(not alarm[3]) then
			px, py, pz = getElementPosition(alarm[1])
			
			if(getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz) <= 300.0) then
				sound = playSFX3D("script", 64, 0, px, py, pz, true)
				setSoundMaxDistance(sound, 150)
				setSoundVolume(sound, gameSoundVolume)
				clanBaseAlarms[baseId][3] = sound
			end
			
		elseif(not alarm[2]) and alarm[3] then
			destroyElement(alarm[3])
			clanBaseAlarms[baseId][3] = nil
		end
	end
end

function clanBaseCaptureRender()
	if clanBaseCaptureInfo then
		captureInProc = clanBaseCaptureInfo[4]
		
		if captureInProc then
			statusColorStr = "#00FF00"
			statusStr = "#FFFFFFСтатус: #00FF00захват"
		else
			statusColorStr = "#FF0000"
			statusStr = "#FFFFFFСтатус: #FF0000ожидание"
		end
		
		statusW = dxGetTextWidth(statusStr, 1, "default-bold", true)
		statusH = dxGetFontHeight(1, "default-bold")
		ownerR, ownerG, ownerB = getTeamColor(clanBaseCaptureInfo[1])
		clanR, clanG, clanB = getTeamColor(clanBaseCaptureInfo[2])
		teamsStr = "#"..RGBToHex(ownerR, ownerG, ownerB)..getTeamName(clanBaseCaptureInfo[1]).." #FFFFFFvs. #"..RGBToHex(clanR, clanG, clanB)..getTeamName(clanBaseCaptureInfo[2])
		teamsW = dxGetTextWidth(teamsStr, 2, "default-bold", true)
		teamsH = dxGetFontHeight(2, "default-bold")
		timeVal = "#FFFFFFВремя: "..msecToStringTime(clanBaseCaptureInfo[3])
		timeW = dxGetTextWidth(timeVal, 1, "default-bold", true)
		timeH = dxGetFontHeight(1, "default-bold")
		playersNumStr = "Захватчики: "..statusColorStr..tostring(clanBaseCaptureInfo[5]).."/"..tostring(clanBaseCaptureInfo[6])
		playersNumW = dxGetTextWidth(playersNumStr, 1, "default-bold", true)
		playersNumH = dxGetFontHeight(1, "default-bold")
		rW = 20+math.max(math.max(math.max(teamsW, statusW), timeW), playersNumW)
		rH = 25+teamsH+statusH+timeH+playersNumH
		rX = sW/2-rW/2
		rY = 10
		dxDrawRectangle(rX, rY, rW, rH, tocolor(0, 0, 0, 128))
		dxDrawLine(rX, rY, rX+rW, rY, tocolor(0, 0, 0, 255))
		dxDrawLine(rX, rY, rX, rY+rH, tocolor(0, 0, 0, 255))
		dxDrawLine(rX+rW, rY, rX+rW, rY+rH, tocolor(0, 0, 0, 255))
		dxDrawLine(rX, rY+rH, rX+rW, rY+rH, tocolor(0, 0, 0, 255))
		rX = rX+10
		rY = rY+5
		rW = rX+teamsW
		rH = rY+teamsH
		dxDrawText(teamsStr, rX, rY, rW, rH, tocolor(255,255,255,255), 2, "default-bold", "center", "top", false, false, false, true)
		rY = rH+5
		rW = rX+statusW
		rH = rY+statusH
		dxDrawText(statusStr, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
		rY = rH+5
		rW = rX+timeW
		rH = rY+timeH
		dxDrawText(timeVal, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
		rY = rH+5
		rW = rX+playersNumW
		rH = rY+playersNumH
		dxDrawText(playersNumStr, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
	end
end

function clanBaseCaptureUpdate(info)
	clanBaseCaptureInfo = info
end

function fillIntegerByZeros(ival)
	if(ival > 9) then
		return tostring(ival)
	else
		return "0"..tostring(ival)
	end
end

function string:split(inSplitPattern, outResults)
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
  while theSplitStart do
    table.insert(outResults, string.sub(self, theStart, theSplitStart-1))
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
  end
  table.insert(outResults, string.sub(self, theStart))
  return outResults
end

function eventsLogOpen(pName, events)
	if not isElement(eventsLogWin) then
		turnOffMenus()
		local wW = 800
		local wH = 600
		eventsLogWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Лог игрока "..pName, false)
		guiSetVisible(eventsLogWin, false)
		eventsLogTbl = guiCreateGridList(10, 25, wW-20, wH-75, false, eventsLogWin)
		local clmnDate = guiGridListAddColumn(eventsLogTbl, "Дата", 0.12)
		local clmnTime = guiGridListAddColumn(eventsLogTbl, "Время", 0.08)
		local clmnGrp = guiGridListAddColumn(eventsLogTbl, "Группа", 0.15)
		local clmnEvt = guiGridListAddColumn(eventsLogTbl, "Событие", 0.2)
		local clmnInfo = guiGridListAddColumn(eventsLogTbl, "Информация", 0.4)
		local clmnRes = guiGridListAddColumn(eventsLogTbl, "Р-т", 0.05)
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-40, wW-20, 30, "Отмена", false, eventsLogWin), eventsLogClose, false)
		guiWindowSetMovable(eventsLogWin, false)
		guiWindowSetSizable(eventsLogWin, false)
		local row, evtDateTime
		local subStrs
		
		for _,evt in ipairs(events) do
			row = guiGridListAddRow(eventsLogTbl)
			evtDateTime = getRealTime(evt["eventDate"]+10800, false)
			subStrs = evt["event"]:split("%s%-%s")
			guiGridListSetItemText(eventsLogTbl, row, clmnDate, fillIntegerByZeros(evtDateTime.monthday).."/"..fillIntegerByZeros(evtDateTime.month+1).."/"..tostring(evtDateTime.year+1900), false, false)
			guiGridListSetItemText(eventsLogTbl, row, clmnTime, fillIntegerByZeros(evtDateTime.hour)..":"..fillIntegerByZeros(evtDateTime.minute)..":"..fillIntegerByZeros(evtDateTime.second), false, false)
			guiGridListSetItemText(eventsLogTbl, row, clmnGrp, subStrs[1], false, false)
			guiGridListSetItemText(eventsLogTbl, row, clmnEvt, subStrs[2], false, false)
			
			if(subStrs[3] == "nil") then
				guiGridListSetItemText(eventsLogTbl, row, clmnInfo, "Пусто", false, false)
			else
				guiGridListSetItemText(eventsLogTbl, row, clmnInfo, subStrs[3], false, false)
			end
			
			if(evt["success"] > 0) then
				guiGridListSetItemText(eventsLogTbl, row, clmnRes, "X", false, false)
			else
				guiGridListSetItemText(eventsLogTbl, row, clmnRes, " ", false, false)
			end
			
		end
		guiSetVisible(eventsLogWin, true)
		showCursor(true)
	end
end

function eventsLogClose(button)
	if(button == "left") and isElement(eventsLogWin) then
		destroyElement(eventsLogWin)
		eventsLogWin = nil
		checkCursor()
	end
end

function queryOpen(qid, question, answers)
	if not isElement(queryWin) then
		turnOffMenus()
		queryId = qid
		wW = 400
		wH = 115+20*table.getn(answers)
		queryWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Опрос", false)
		guiSetVisible(queryWin, false)
		guiWindowSetMovable(queryWin, false)
		guiWindowSetSizable(queryWin, false)
		local queryQuestion = guiCreateLabel(10, 25, wW-20, 40, question, false, queryWin)
		guiLabelSetHorizontalAlign(queryQuestion, "center", true)
		guiLabelSetVerticalAlign(queryQuestion, "center")
		
		for i,answer in ipairs(answers) do
			table.insert(queryAnswerList, guiCreateRadioButton(10, 75+ (i-1)*20, wW-20, 15, answer, false, queryWin))
		end
		
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-30, wW/2-15, 20, "Ответить", false, queryWin), queryAnswer, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, wH-30, wW/2-15, 20, "Отмена", false, queryWin), queryClose, false)
		addCommandHandler("Accept", queryAnswer)
		addCommandHandler("Decline", queryClose)
		guiRadioButtonSetSelected(queryAnswerList[1], true)
		guiSetVisible(queryWin, true)
		showCursor(true)
	end
end

function queryAnswer(button)
	if((button == "left") or (button == "Accept")) and isElement(queryWin) then
		for i,answer in ipairs(queryAnswerList) do
			if guiRadioButtonGetSelected(answer) then
				queryClose("left")
				triggerServerEvent("onQueryAnswer", resourceRoot, localPlayer, queryId, i)
				break
			end
		end
	end
end

function queryClose(button)
	if((button == "left") or (button == "Decline")) and isElement(queryWin) then
		queryAnswerList = {}
		destroyElement(queryWin)
		removeCommandHandler("Accept", queryAnswer)
		removeCommandHandler("Decline", queryClose)
		queryWin = nil
		checkCursor()
	end
end

function clanBaseMenuOpen(baseInfo)
	if not isElement(clanBaseMenuWin) then
		turnOffMenus()
		clanBaseMenuBID = baseInfo[1]
		clanBaseMenuPrice = baseInfo[2]
		wW = 300
		wH = 145
		clanBaseMenuWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "База #"..tostring(clanBaseMenuBID), false)
		guiSetVisible(clanBaseMenuWin, false)
		guiWindowSetMovable(clanBaseMenuWin, false)
		guiWindowSetSizable(clanBaseMenuWin, false)
		local lbl = guiCreateLabel(10, 25, wW-20, 15, "Цена: $"..tostring(baseInfo[2]), false, clanBaseMenuWin)
		guiSetFont(lbl, "default-bold-small")
		guiLabelSetColor(lbl, 0, 200, 0)
		guiLabelSetVerticalAlign(lbl, "center")
		lbl = guiCreateLabel(10, 45, wW-20, 15, "Размер: "..baseInfo[3], false, clanBaseMenuWin)
		guiSetFont(lbl, "default-bold-small")
		guiLabelSetVerticalAlign(lbl, "center")
		lbl = guiCreateLabel(10, 65, wW-20, 15, "Откаты от бизнеса: ", false, clanBaseMenuWin)
		guiSetFont(lbl, "default-bold-small")
		guiLabelSetVerticalAlign(lbl, "center")
		local iX = guiLabelGetTextExtent(lbl)+10
		local iY = 65
		local iWH = 15
		
		for i=1,5 do
			if(i > baseInfo[4]) then
				guiCreateStaticImage(iX+ (i-1)*iWH, iY, iWH, iWH, "images/blankicon.png", false, clanBaseMenuWin)
			else
				guiCreateStaticImage(iX+ (i-1)*iWH, iY, iWH, iWH, "images/moneyicon.png", false, clanBaseMenuWin)
			end
		end
		
		lbl = guiCreateLabel(10, 85, wW-20, 15, "Владелец: "..baseInfo[5], false, clanBaseMenuWin)
		guiSetFont(lbl, "default-bold-small")
		guiLabelSetVerticalAlign(lbl, "center")
		local btnW = (wW-30)/3.0
		local btnH = 20
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-30, btnW, btnH, "Купить", false, clanBaseMenuWin), clanBaseMenuBuy, false)
		addEventHandler("onClientGUIClick", guiCreateButton(15+btnW, wH-30, btnW, btnH, "Продать", false, clanBaseMenuWin), clanBaseMenuSell, false)
		addEventHandler("onClientGUIClick", guiCreateButton(20+btnW*2, wH-30, btnW, btnH, "Отмена", false, clanBaseMenuWin), clanBaseMenuClose, false)
		guiSetVisible(clanBaseMenuWin, true)
		showCursor(true)
	end
end

function clanBaseMenuBuy(button)
	if(button == "left") and isElement(clanBaseMenuWin) then
		triggerServerEvent("onClanBaseBuy", resourceRoot, localPlayer, clanBaseMenuBID, clanBaseMenuPrice)
		clanBaseMenuClose("left")
	end
end

function clanBaseMenuSell(button)
	if(button == "left") and isElement(clanBaseMenuWin) then
		triggerServerEvent("onClanBaseSell", resourceRoot, localPlayer, clanBaseMenuBID, clanBaseMenuPrice)
		clanBaseMenuClose("left")
	end
end

function clanBaseMenuClose(button)
	if(button == "left") and isElement(clanBaseMenuWin) then
		destroyElement(clanBaseMenuWin)
		clanBaseMenuWin = nil
		checkCursor()
	end
end

function reportOpen(reportsArray)
	if not isElement(reportWin) then
		turnOffMenus()
		wW = 600
		wH = 600
		reportWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Жалобы на игроков", false)
		guiSetVisible(reportWin, false)
		guiWindowSetMovable(reportWin, false)
		guiWindowSetSizable(reportWin, false)
		reportList = guiCreateGridList(10, 25, wW-20, wH-60, false, reportWin)
		guiGridListAddColumn(reportList, "#", 0.1)
        guiGridListAddColumn(reportList, "От кого", 0.2)
		guiGridListAddColumn(reportList, "На кого", 0.2)
		guiGridListAddColumn(reportList, "Причина", 0.5)
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-30, wW-20, 20, "Отмена", false, reportWin), reportClose, false)
		addCommandHandler("Select previons", reportPrev)
		addCommandHandler("Select next", reportNext)
		addCommandHandler("Accept", reportClick)
		addCommandHandler("Decline", reportClose)
		reportUpdate(reportsArray)
		guiSetVisible(reportWin, true)
		showCursor(true)
	end
end

function reportPrev()
	local row, clmn = guiGridListGetSelectedItem(reportList)
	local maxRow = guiGridListGetRowCount(reportList)
	
	if(maxRow > 0) then
		row = math.min(maxRow-1, math.max(0, row-1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(reportList, math.ceil(row*100.0/maxRow))
		guiGridListSetSelectedItem(reportList, row, clmn)
	end
end

function reportNext()
	local row, clmn = guiGridListGetSelectedItem(reportList)
	local maxRow = guiGridListGetRowCount(reportList)
	
	if(maxRow > 0) then
		row = math.min(maxRow-1, math.max(0, row+1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(reportList, math.ceil(row*100.0/maxRow))
		guiGridListSetSelectedItem(reportList, row, clmn)
	end
end

function reportUpdate(reportsArray)
	if isElement(reportList) then
		guiGridListClear(reportList)
		local row
		
		for rnum,report in pairs(reportsArray) do
			row = guiGridListAddRow(reportList)
			guiGridListSetItemText(reportList, row, 1, tostring(rnum), false, false)
			guiGridListSetItemText(reportList, row, 2, report[1], false, false)
			guiGridListSetItemText(reportList, row, 3, report[2], false, false)
			guiGridListSetItemText(reportList, row, 4, report[3], false, false)
		end
		
		addEventHandler("onClientGUIDoubleClick", reportList, reportClick, false)
	end
end

function reportClick(button)
	if((button == "left") or (button == "Accept")) and isElement(reportList) then
		local row = guiGridListGetSelectedItem(reportList)
		
		if(row >= 0) then
			executeCommandHandler("spectate", guiGridListGetItemText(reportList, row, 3))
			reportClose("left")
		end
		
	end
end

function reportClose(button)
	if((button == "left") or (button == "Decline")) and isElement(reportWin) then
		destroyElement(reportList)
		destroyElement(reportWin)
		removeCommandHandler("Select previons", reportPrev)
		removeCommandHandler("Select next", reportNext)
		removeCommandHandler("Accept", reportClick)
		removeCommandHandler("Decline", reportClose)
		reportWin = nil
		reportList = nil
		checkCursor()
	end
end

function questionOpen(questionsArray)
	if not isElement(questionWin) then
		turnOffMenus()
		wW = 600
		wH = 600
		questionWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Вопросы от игроков", false)
		guiSetVisible(questionWin, false)
		guiWindowSetMovable(questionWin, false)
		guiWindowSetSizable(questionWin, false)
		questionList = guiCreateGridList(10, 25, wW-20, wH-60, false, questionWin)
		guiGridListAddColumn(questionList, "#", 0.1)
        guiGridListAddColumn(questionList, "От кого", 0.2)
		guiGridListAddColumn(questionList, "Вопрос", 0.7)
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-30, wW-20, 20, "Отмена", false, questionWin), questionClose, false)
		questionUpdate(questionsArray)
		guiSetVisible(questionWin, true)
		addCommandHandler("Select previons", questionPrev)
		addCommandHandler("Select next", questionNext)
		addCommandHandler("Accept", questionClick)
		addCommandHandler("Decline", questionClose)
		showCursor(true)
	end
end

function questionPrev()
	local row, clmn = guiGridListGetSelectedItem(questionList)
	local maxRow = guiGridListGetRowCount(questionList)
	
	if(maxRow > 0) then
		row = math.min(maxRow-1, math.max(0, row-1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(questionList, math.ceil(row*100.0/maxRow))
		guiGridListSetSelectedItem(questionList, row, clmn)
	end
end

function questionNext()
	local row, clmn = guiGridListGetSelectedItem(questionList)
	local maxRow = guiGridListGetRowCount(questionList)
	
	if(maxRow > 0) then
		row = math.min(maxRow-1, math.max(0, row+1))
		clmn = math.max(1, clmn)
		guiGridListSetVerticalScrollPosition(questionList, math.ceil(row*100.0/maxRow))
		guiGridListSetSelectedItem(questionList, row, clmn)
	end
end

function questionUpdate(questionsArray)
	if isElement(questionList) then
		guiGridListClear(questionList)
		local row
		
		for qnum,question in pairs(questionsArray) do
			row = guiGridListAddRow(questionList)
			guiGridListSetItemText(questionList, row, 1, tostring(qnum), false, false)
			guiGridListSetItemText(questionList, row, 2, question[1], false, false)
			guiGridListSetItemText(questionList, row, 3, question[2], false, false)
		end
		
		addEventHandler("onClientGUIDoubleClick", questionList, questionClick, false)
	end
end

function questionClick(button)
	if((button == "left") or (button == "Accept")) and isElement(questionList) then
		local row = guiGridListGetSelectedItem(questionList)
		
		if(row >= 0) then
			triggerServerEvent("onQuestionTake", resourceRoot, tonumber(guiGridListGetItemText(questionList, row, 1)), localPlayer)
			questionClose("left")
		end
	end
end

function questionClose(button)
	if((button == "left") or (button == "Decline")) and isElement(questionWin) then
		removeEventHandler("onClientGUIDoubleClick", questionList, questionClick, false)
		removeCommandHandler("Select previons", questionPrev)
		removeCommandHandler("Select next", questionNext)
		removeCommandHandler("Accept", questionClick)
		removeCommandHandler("Decline", questionClose)
		destroyElement(questionList)
		destroyElement(questionWin)
		questionWin = nil
		questionList = nil
		checkCursor()
	end
end

function answerOpen(qnum, plrName, questionText)
	if not isElement(answerWin) then
		turnOffMenus()
		answerQId = qnum
		wW = 350
		wH = 160
		answerWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Вопрос от "..plrName, false)
		guiSetVisible(answerWin, false)
		guiWindowSetMovable(answerWin, false)
		guiWindowSetSizable(answerWin, false)
		local lbl = guiCreateLabel(10, 20, wW-20, 40, "Вопрос: "..questionText, false, answerWin)
		guiLabelSetHorizontalAlign(lbl, "center", true)
		guiLabelSetVerticalAlign(lbl, "center")
		answerMemo = guiCreateMemo(10, 65, wW-20, 60, "", false, answerWin)
		guiSetProperty(answerMemo, "MaxTextLength", "90")
		addEventHandler("onClientGUIClick", guiCreateButton(10, wH-30, wW/2-15, 20, "Оставить без ответа", false, answerWin), answerDeny, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, wH-30, wW/2-15, 20, "Ответить", false, answerWin), answerSend, false)
		addCommandHandler("Accept", answerSend)
		addCommandHandler("Decline", answerDeny)
		guiSetVisible(answerWin, true)
		showCursor(true)
		guiSetInputMode("no_binds_when_editing")
	end
end

function answerSend(button)
	if((button == "left") or (button == "Accept")) and isElement(answerWin) then
		local answerText = string.gsub(guiGetText(answerMemo), "^%s* (.-)%s*$", "%1")
		answerText = string.gsub(answerText, "%s+", " ")
		
		if(string.len(answerText) > 1) then
			triggerServerEvent("onQuestionAnswer", resourceRoot, answerQId, localPlayer, answerText)
			answerClose()
		else
			msgAdd("Сперва введите ответ на вопрос.")
		end
		
	end
end

function answerDeny(button)
	if((button == "left") or (button == "Decline")) and isElement(answerWin) then
		triggerServerEvent("onQuestionDeny", resourceRoot, answerQId, localPlayer)
		answerClose()
	end
end

function answerClose()
	if isElement(answerWin) then
		destroyElement(answerWin)
		guiSetInputMode("no_binds_when_editing")
		removeCommandHandler("Accept", answerSend)
		removeCommandHandler("Decline", answerDeny)
		answerWin = nil
		answerMemo = nil
		answerQId = nil
		checkCursor()
	end
end

function playerTeamChat(timeStr, playerid, grp, msg, clrr, clrg, clrb)
    local playerid = getElementData(source, "ID")
	if isElement(grp) then
		local r, g, b = getTeamColor(grp)
		outputChatBox(timeStr.."["..getTeamName(grp).."] "..getPlayerName(source).."["..playerid.."]: #FFFFFF"..msg, r, g, b, true)
	
	elseif playerGroups[grp] then
		outputChatBox(timeStr.."РАЦИЯ: ["..playerGroups[grp][1].."] "..getPlayerName(source).."["..playerid.."]: #FFFFFF"..msg, playerGroups[grp][2], playerGroups[grp][3], playerGroups[grp][4], true)
	
	elseif clrr and clrg and clrb then
		outputChatBox(timeStr.."["..tostring(grp).."] "..getPlayerName(source).."["..playerid.."]: #FFFFFF"..msg, clrr, clrg, clrb, true)
	
	else
		outputChatBox(timeStr.."["..tostring(grp).."] "..getPlayerName(source).."["..playerid.."]: #FFFFFF"..msg, 255, 255, 255, true)
	end
end

function killOrderFound(plr, killPrice)
	if plr and isElement(plr) then
		killOrderRemove()
		killOrderMarker = createBlip(0, 0, 0, 0, 2, 255, 0, 0, 255, 32767)
		addEventHandler("onClientPlayerWasted", plr, killOrderRemove)
		attachElements(killOrderMarker, plr)
		killOrderTimer = setTimer(killOrderRemove, 60000, 1)
		msgAdd(string.format("На карте красным маркером на 60 секунд обозначена позиция игрока %s. Цена за голову - $%d.", getPlayerName(plr), killPrice))
	
	else
		msgAdd("Игрок с ценой на голову не найден на сервере.")
	end
end

function killOrderRemove()
	if isTimer(killOrderTimer) then
		killTimer(killOrderTimer)
	end
	
	if isElement(killOrderMarker) then
		removeEventHandler("onClientPlayerWasted", plr, killOrderRemove)
		destroyElement(killOrderMarker)
	end
end

function procBreakableObjects()
	local x, y, z = getElementPosition(localPlayer)
	local objSphere = createColSphere(x, y, z, 300)
	local objs = getElementsWithinColShape(objSphere, "object")
	destroyElement(objSphere)
	
	for _,obj in ipairs(objs) do
		setElementVelocity(obj, 0, 0, 0)
	end
end

function fineRequest(pricePerStar)
	local amount = getPlayerWantedLevel()*pricePerStar
	createRequestWindow("Штраф", string.format("%s выписывает вам штраф $%d($%d за 1 звезду). Оплатить?", getPlayerName(source), amount, pricePerStar), source, fineAccept, fineDecline)
end

function fineAccept()
	destroyRequestWindow()
	triggerServerEvent("onFineAccept", localPlayer, requestSrc)
end

function fineDecline()
	destroyRequestWindow()
	triggerServerEvent("onFineDecline", localPlayer, requestSrc)
end

function gangsterStealOpenStart(openTime)
	if not gangsterStealOpenTimeId then
		gangsterStealOpenTimeId = jobGuiAddItem(1, "images/timer.png", 0)
		gangsterStealOpenTimeMax = openTime
		bindKey("forwards", "down", gangsterStealCheckInterruption)
		bindKey("backwards", "down", gangsterStealCheckInterruption)
		bindKey("left", "down", gangsterStealCheckInterruption)
		bindKey("right", "down", gangsterStealCheckInterruption)
		bindKey("jump", "down", gangsterStealCheckInterruption)
	end
end

function gangsterStealCheckInterruption()
	unbindKey("forwards", "down", gangsterStealCheckInterruption)
	unbindKey("backwards", "down", gangsterStealCheckInterruption)
	unbindKey("left", "down", gangsterStealCheckInterruption)
	unbindKey("right", "down", gangsterStealCheckInterruption)
	unbindKey("jump", "down", gangsterStealCheckInterruption)
	triggerServerEvent("onGangsterStealInterrupt", resourceRoot, localPlayer)
end

function gangsterStealOpenUpdate(curTime)
	jobGui[gangsterStealOpenTimeId][3] = (gangsterStealOpenTimeMax-curTime)/gangsterStealOpenTimeMax
end

function gangsterStealCarStart(openTime)
	if not gangsterStealOpenTimeId then
		gangsterStealOpenTimeId = jobGuiAddItem(1, "images/timer.png", 0)
		gangsterStealOpenTimeMax = openTime
		bindKey("forwards", "down", gangsterStealCheckCarInterruption)
		bindKey("backwards", "down", gangsterStealCheckCarInterruption)
		bindKey("left", "down", gangsterStealCheckCarInterruption)
		bindKey("right", "down", gangsterStealCheckCarInterruption)
		bindKey("jump", "down", gangsterStealCheckCarInterruption)
	end
end

function gangsterStealCheckCarInterruption()
	unbindKey("forwards", "down", gangsterStealCheckInterruption)
	unbindKey("backwards", "down", gangsterStealCheckInterruption)
	unbindKey("left", "down", gangsterStealCheckInterruption)
	unbindKey("right", "down", gangsterStealCheckInterruption)
	unbindKey("jump", "down", gangsterStealCheckInterruption)
	triggerServerEvent("onGangsterStealInterruptCar", resourceRoot, localPlayer)
end

function gangsterStealCarUpdate(curTime)
	jobGui[gangsterStealOpenTimeId][3] = (gangsterStealOpenTimeMax-curTime)/gangsterStealOpenTimeMax
end

function gangsterStealCarStop()
	if gangsterStealOpenTimeId then
		jobGuiRemoveItem(gangsterStealOpenTimeId)
		gangsterStealOpenTimeId = nil
		unbindKey("forwards", "down", gangsterStealCheckInterruption)
		unbindKey("backwards", "down", gangsterStealCheckInterruption)
		unbindKey("left", "down", gangsterStealCheckInterruption)
		unbindKey("right", "down", gangsterStealCheckInterruption)
		unbindKey("jump", "down", gangsterStealCheckInterruption)
	end
end

function gangsterStealOpenStop()
	if gangsterStealOpenTimeId then
		jobGuiRemoveItem(gangsterStealOpenTimeId)
		gangsterStealOpenTimeId = nil
		unbindKey("forwards", "down", gangsterStealCheckInterruption)
		unbindKey("backwards", "down", gangsterStealCheckInterruption)
		unbindKey("left", "down", gangsterStealCheckInterruption)
		unbindKey("right", "down", gangsterStealCheckInterruption)
		unbindKey("jump", "down", gangsterStealCheckInterruption)
	end
end

specialEventInfo = nil
specialEventWin = nil
specialEventLabelElements = nil
specialEventListElements = nil
specialEventListBotScenarios = nil
specialEventListBotSkins = nil
specialEventSkins = {0, 1, 2, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68, 69, 70, 71, 72, 73, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312}
specialEventVehicles = {
    602, 545, 496, 517, 401, 410, 518, 600, 527, 436, 589, 580, 419, 439, 533, 549, 526, 491, 474, 445, 467, 604, 426, 507, 547, 585, 405, 587,
    409, 466, 550, 492, 566, 546, 540, 551, 421, 516, 529, 592, 553, 577, 488, 511, 497, 548, 563, 512, 476, 593, 447, 425, 519, 520, 460, 417,
    469, 487, 513, 581, 510, 509, 522, 481, 461, 462, 448, 521, 468, 463, 586, 472, 473, 493, 595, 484, 430, 453, 452, 446, 454, 485, 552, 431,
    438, 437, 574, 420, 525, 408, 416, 596, 433, 597, 427, 599, 490, 432, 528, 601, 407, 428, 544, 523, 470, 598, 499, 588, 609, 403, 498, 514,
    524, 423, 532, 414, 578, 443, 486, 515, 406, 531, 573, 456, 455, 459, 543, 422, 583, 482, 478, 605, 554, 530, 418, 572, 582, 413, 440, 536,
    575, 534, 567, 535, 576, 412, 402, 542, 603, 475, 568, 557, 424, 471, 504, 495, 457, 539, 483, 508, 571, 500, 444, 556, 429, 411, 541, 559,
	415, 561, 480, 560, 562, 506, 565, 451, 434, 558, 494, 555, 502, 477, 503, 579, 400, 404, 489, 505, 479, 442, 458, 606, 607, 610, 611, 584,
	608, 435, 450, 591
}
specialEventWeapons = { 2, 3, 5, 6, 7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 32, 30, 31, 33, 34, 35, 36, 37, 38, 16, 17, 18, 41, 42, 43, 10, 11, 12, 14, 15 }
specialEventBotScenarios = {
	["Ожидать"] = { "waiting", 0 },
	["Следовать за ближайшим участником"] = { "following", 2 },
	["Следовать за организатором"] = { "following", 1 },
	["Охранять от участников"] = { "guarding", 0 },
	["Атаковать организатора"] = { "chasing", 1 },
	["Атаковать участников"] = { "chasing", 2 }
}
specialEventListVehicles = nil
specialEventListBotWeapons = nil
specialEventBtnVehClr = nil
specialEventInputObjMdl = nil
specialEventInputMapFile = nil
specialEventNewElement = nil
specialEventElementRot = nil
specialEventElementDelta = nil
specialEventMoveTimer = nil
specialEventScrollZone = nil

function specialEventCreate(eventInfo)
	if not specialEventInfo then
		local wW = 450
		local wH = 500
		local veh
		specialEventWin = guiCreateWindow(sW/2-wW/2, sH/2-wH/2, wW, wH, "Мероприятие", false)
		guiWindowSetMovable(specialEventWin, false)
		guiWindowSetSizable(specialEventWin, false)
		specialEventLabelElements = guiCreateLabel(10, 25, wW-10, 15, "Элементы(0):", false, specialEventWin)
		guiLabelSetVerticalAlign(specialEventLabelElements, "center")
		specialEventListElements = guiCreateGridList(10, 40, wW/2-15, wH-50, false, specialEventWin)
		guiGridListSetSortingEnabled(specialEventListElements, false)
		guiGridListAddColumn(specialEventListElements, "Элемент", 0.85)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 25, wW/2-15, 20, "Создать ТС", false, specialEventWin), specialEventCreateVehicle, false)
		specialEventListVehicles = guiCreateComboBox(wW/2+5, 50, wW/2-15, 180, "Выберите модель ТС", false, specialEventWin)
		table.sort(specialEventVehicles)
		
		for _,mdl in ipairs(specialEventVehicles) do
			veh = createVehicle(mdl, 0, 0, 0)
			guiComboBoxAddItem(specialEventListVehicles, "["..tostring(mdl).."] "..getVehicleName(veh))
			destroyElement(veh)
		end
		
		specialEventBtnVehClr = guiCreateButton(wW/2+5, 75, wW/2-15, 20, "Выберите цвет ТС", false, specialEventWin)
		addEventHandler("onClientGUIClick", specialEventBtnVehClr, specialEventVehicleColorOpen, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 125, wW/2-15, 20, "Создать объект", false, specialEventWin), specialEventCreateObject, false)
		specialEventInputObjMdl = guiCreateEdit(wW/2+5, 150, wW/2-15, 20, "Введите ID объекта", false, specialEventWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 200, wW/2-15, 20, "Загрузить MAP файл", false, specialEventWin), specialEventSelectMapFile, false)
		specialEventInputMapFile = guiCreateEdit(wW/2+5, 225, wW/2-15, 20, "Введите имя файла(без расширения)", false, specialEventWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, wH-55, wW/2-15, 20, "Удалить выбранный элемент", false, specialEventWin), specialEventRemoveSelectedElement, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, wH-30, wW/2-15, 20, "Закрыть", false, specialEventWin), specialEventClose, false)
		specialEventUpdate(eventInfo)
		guiSetInputMode("no_binds_when_editing")
		showCursor(true)
	end
end

function specialEventClose(btn)
	if(btn == "left") and isElement(specialEventWin) and guiGetVisible(specialEventWin) then
		guiSetVisible(specialEventWin, false)
		guiSetInputMode("no_binds_when_editing")
		checkCursor()
	end
end

function specialEventSelectMapFile(button, state)
	if(button == "left") then
		local mapFile = guiGetText(specialEventInputMapFile)
		
		if(string.len(mapFile) <= 0) then
			msgAdd("Вы не ввели имя MAP файла")
			return nil
		end
		
		local elemCountAll, elemCountSuc = specialEventLoadMapFile(mapFile)
		
		if not elemCountAll then
			msgAdd("Возникла ошибка при открытии MAP файла. Проверьте его наличие в директории 'resplay/semaps'.")
			return nil
		end
		
		msgAdd("MAP файл успешно загружен. Всего было загружено "..tostring(elemCountSuc).." из "..tostring(elemCountAll).." элементов в файле.")
	end
end

function specialEventLoadMapFile(fileName)
	if not specialEventInfo then
		return false
	end
	
	local mapFile = xmlLoadFile("semaps/"..fileName..".map")
	
	if not mapFile then
		return false
	end
	
	local elements = xmlNodeGetChildren(mapFile)
	
	if not elements then
		return false
	end
	
	local elemType, ex, ey, ez, erx, ery, erz, mdl, clr, clrr, clrg, clrb, elemParams
	local elemSuccessful = 0
	
	for _,elem in ipairs(elements) do
		elemType = xmlNodeGetName(elem)
		elemParams = nil
		
		if(string.lower(elemType) == "vehicle") then
			mdl = tonumber(xmlNodeGetAttribute(elem, "model"))
			clr = xmlNodeGetAttribute(elem, "color")
			
			if clr and mdl then
				clrr, clrg, clrb = string.match(clr, "(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
				elemParams = { mdl, tonumber(clrr), tonumber(clrg), tonumber(clrb) }
			end
		
		elseif(string.lower(elemType) == "object") then
			mdl = tonumber(xmlNodeGetAttribute(elem, "model"))
			
			if mdl then
				elemParams = { mdl }
			end
		
		elseif(string.lower(elemType) == "marker") then
			mdl = tonumber(xmlNodeGetAttribute(elem, "size"))
			
			if mdl then
				elemParams = { mdl }
			end
		end
		
		if elemParams then
			ex = tonumber(xmlNodeGetAttribute(elem, "posX"))
			ey = tonumber(xmlNodeGetAttribute(elem, "posY"))
			ez = tonumber(xmlNodeGetAttribute(elem, "posZ"))
			erx = tonumber(xmlNodeGetAttribute(elem, "rotX"))
			ery = tonumber(xmlNodeGetAttribute(elem, "rotY"))
			erz = tonumber(xmlNodeGetAttribute(elem, "rotZ"))
			triggerServerEvent("onSpecialEventCreateElement", resourceRoot, specialEventInfo[1], elemType, ex, ey, ez, erx, ery, erz, elemParams)
			elemSuccessful = elemSuccessful+1
		end
	end
	xmlUnloadFile(mapFile)
	return table.getn(elements), elemSuccessful
end

function specialEventTriggerWindow()
	if specialEventInfo then
		if(not guiGetVisible(specialEventWin)) and(not specialEventNewElement) then
			guiSetInputMode("no_binds_when_editing")
			guiSetVisible(specialEventWin, true)
		
		elseif guiGetVisible(specialEventWin) then
			guiSetInputMode("no_binds_when_editing")
			guiSetVisible(specialEventWin, false)
		end
		
		checkCursor()
	end
end

function specialEventCreateObject(btn)
	if(btn == "left") and(not isElement(specialEventNewElement)) then
		local mdl = tonumber(guiGetText(specialEventInputObjMdl))
		
		if mdl then
			specialEventNewElement = createObject(mdl, 0, 0, 0)
			
			if isElement(specialEventNewElement) then
				specialEventCreateElement()
			else
				msgAdd("Не удалось создать объект c данным ID.")
			end
			
		else
			msgAdd("Вы не ввели корректный ID объекта.")
		end
	end
end

function specialEventCreateVehicle(btn)
	if(btn == "left") and(not isElement(specialEventNewElement)) then
		local selectedItem = guiComboBoxGetSelected(specialEventListVehicles)
		if selectedItem and(selectedItem >= 0) then
			local mdl = tonumber(string.sub(guiComboBoxGetItemText(specialEventListVehicles, selectedItem), 2, 4))
			
			if mdl then
				local vehR, vehG, vehB
				
				for clrStrR, clrStrG, clrStrB in string.gmatch(guiGetText(specialEventBtnVehClr), "(%d+),%s(%d+),%s(%d+)") do
					vehR = tonumber(clrStrR)
					vehG = tonumber(clrStrG)
					vehB = tonumber(clrStrB)
					break
				end
				
				if vehR then
					specialEventNewElement = createVehicle(mdl, 0, 0, 0)
					setTimer(setVehicleColor, 100, 1, specialEventNewElement, vehR, vehG, vehB, vehR, vehG, vehB, vehR, vehG, vehB, vehR, vehG, vehB)
					specialEventCreateElement()
				else
					msgAdd("Вы не выбрали цвет ТС")
				end
				
			end
		else
			msgAdd("Вы не выбрали модель ТС.")
		end
	end
end

function specialEventVehicleColorOpen(btn)
	if(btn == "left") and(not isElement(specialEventNewElement)) then
		wW = 500
		wH = wW
		colorWindowOpen(sW/2-wW/2, sH/2-wH/2, wW, wH, specialEventVehicleColorSelect, nil, nil, "Цвет ТС", 1, 1)
	end
end

function specialEventVehicleColorSelect(btn)
	if(btn == "left") or (btn == "enter") then
		colorWindowClose()
		guiSetText(specialEventBtnVehClr, string.format("%d, %d, %d", clrSelR, clrSelG, clrSelB))
	end
end

function specialEventRemoveSelectedElement(btn)
	if(btn == "left") and(not isElement(specialEventNewElement)) then
		local row = guiGridListGetSelectedItem(specialEventListElements)
		
		if row and(row >= 0) then
			local elem = guiGridListGetItemData(specialEventListElements, row, 1)
			
			if elem then
				triggerServerEvent("onSpecialEventRemoveElement", resourceRoot, specialEventInfo[1], elem)
			end
		else
			msgAdd("Вы не выбрали элемент.")
		end
		
	end
end

function specialEventCreateElement()
	if isElement(specialEventNewElement) then
		guiSetVisible(specialEventWin, false)
		showCursor(true)
		setElementCollisionsEnabled(specialEventNewElement, false)
		specialEventElementRot = { 0.0, 0.0, 0.0 }
		specialEventScrollZone = guiCreateStaticImage(0, 0, 1, 1, "images/drunk16.dds", true)
		guiSetAlpha(specialEventScrollZone, 0)
		local cX, cY, cZ = getElementPosition(localCamera)
		setElementPosition(specialEventNewElement, cX, cY, cZ)
		setTimer(specialEventCreateElement2, 250, 1)
	end
end

function specialEventCreateElement2()
	if isElement(specialEventNewElement) then
		local _, _, deltaz = getElementBoundingBox(specialEventNewElement)
		specialEventElementDelta = { 0.0, 0.0, math.abs(deltaz) }
		addEventHandler("onClientRender", root, specialEventProcElement)
		addEventHandler("onClientMouseWheel", specialEventScrollZone, specialEventRotateElement)
		addEventHandler("onClientClick", root, specialEventAcceptElement)
		addEventHandler("onClientPlayerWasted", localPlayer, specialEventDeclineElement)
		setElementAlpha(localPlayer, 160)
		setElementFrozen(localPlayer, true)
		setElementCollisionsEnabled(localPlayer, false)
	end
end

function specialEventRotateElement(delta)
	if isElement(specialEventNewElement) then
		specialEventElementRot[3] = specialEventElementRot[3]+delta*5
		
		if(specialEventElementRot[3] > 180.0) then
			specialEventElementRot[3] = -360.0+specialEventElementRot[3]
		elseif(specialEventElementRot[3] < -180.0) then
			specialEventElementRot[3] = 360.0+specialEventElementRot[3]
		end
		
	end
end

function specialEventProcElement()
	if isElement(specialEventNewElement) then
		local eType = getElementType(specialEventNewElement)
		local startX, startY, startZ = getElementPosition(localCamera)
		local cX, cY = getCursorPosition()
		local endX, endY, endZ = getWorldFromScreenPosition(cX*sW, cY*sH, 50.0)
		local lHit, eX, eY, eZ, _, nX, nY, nZ = processLineOfSight(startX, startY, startZ, endX, endY, endZ, true, false, false, true, false, false, true)
		
		if not eX then
			eX, eY, eZ = endX, endY, endZ
		end
		
		setElementPosition(specialEventNewElement, eX+specialEventElementDelta[1], eY+specialEventElementDelta[2], eZ+specialEventElementDelta[3])
		local conformPedRotation = (getElementType(specialEventNewElement) == "ped")
		setElementRotation(specialEventNewElement, specialEventElementRot[1], specialEventElementRot[2], specialEventElementRot[3], "default", conformPedRotation)
	end
end

function specialEventAcceptElement(button, state)
	if(state == "down") and isElement(specialEventNewElement) then
		if(button == "left") or (button == "right") then
			if(button == "left") then
				local elemType = getElementType(specialEventNewElement)
				local ex, ey, ez = getElementPosition(specialEventNewElement)
				local erx, ery, erz = getElementRotation(specialEventNewElement)
				local elemParams
				
				if(string.lower(elemType) == "vehicle") then -- Параметры:(1) Модель,(2,3,4) Цвет
					local clrr, clrg, clrb = getVehicleColor(specialEventNewElement, true)
					elemParams = { getElementModel(specialEventNewElement), clrr, clrg, clrb }
				
				elseif(string.lower(elemType) == "object") then -- Параметры:(1) Модель
					elemParams = { getElementModel(specialEventNewElement) }
				
				elseif(string.lower(elemType) == "marker") then -- Параметры:(1) Тип,(2,3,4) Цвет
					local clrr, clrg, clrb = getMarkerColor(specialEventNewElement)
					elemParams = { getMarkerType(specialEventNewElement), clrr, clrg, clrb }
				
				elseif(string.lower(elemType) == "ped") then -- Параметры:(1) Скин
					elemParams = { getElementModel(specialEventNewElement), getElementData(specialEventNewElement, "scenario"), getElementData(specialEventNewElement, "weapon") }
				
				else
					elemParams = {}
				end
				
				triggerServerEvent("onSpecialEventCreateElement", resourceRoot, specialEventInfo[1], elemType, ex, ey, ez, erx, ery, erz, elemParams)
				msgAdd("Элемент добавлен на мероприятие")
			
			else
				msgAdd("Элемент удалён")
			end
			
			specialEventDeclineElement()
			specialEventTriggerWindow()
		end
	end
end

function specialEventDeclineElement()
	if isElement(specialEventNewElement) then
		destroyElement(specialEventNewElement)
		specialEventNewElement = nil
		removeEventHandler("onClientRender", root, specialEventProcElement)
		removeEventHandler("onClientMouseWheel", specialEventScrollZone, specialEventRotateElement)
		removeEventHandler("onClientClick", root, specialEventAcceptElement)
		removeEventHandler("onClientPlayerWasted", localPlayer, specialEventDeclineElement)
		destroyElement(specialEventScrollZone)
		setElementAlpha(localPlayer, 255)
		setElementFrozen(localPlayer, false)
		setElementCollisionsEnabled(localPlayer, true)
		checkCursor()
	end
end

function specialEventUpdate(eventInfo)
	specialEventInfo = eventInfo
	--table.sort(specialEventInfo)
	if isElement(specialEventLabelElements) then
		guiSetText(specialEventLabelElements, "Элементы("..tostring(table.getn(specialEventInfo[2])).."):")
	end
	if isElement(specialEventListElements) then
		local row
		guiGridListClear(specialEventListElements)
		
		for elem,elemStr in pairs(specialEventInfo[2]) do
			row = guiGridListAddRow(specialEventListElements, elemStr)
			guiGridListSetItemData(specialEventListElements, row, 1, elem)
		end
	end
end

function specialEventDestroy()
	if specialEventInfo then
		destroyElement(specialEventWin)
		msgAdd("Мероприятие завершено")
		specialEventInfo = nil
	end
end

fractionWin = nil
fractionMembersList = nil
fractionMembersColName = nil
fractionMembersColRank = nil
fractionPlayerName = nil
fractionRankList = nil
fractionRankColId = nil
fractionRankColName = nil
fractionRankName = nil

function fractionInitMenu()
	if not fractionWin then
		local wW = 600
		fractionWin = guiCreateWindow(sW/2-wW/2, sH/2-300, wW, 600, "Фракция", false)
		guiWindowSetMovable(fractionWin, false)
		guiWindowSetSizable(fractionWin, false)
		guiSetVisible(fractionWin, false)
		guiCreateLabel(10, 25, wW-20, 20, "Члены фракции(онлайн):", false, fractionWin)
		fractionMembersList = guiCreateGridList(10, 45, wW-20, 255, false, fractionWin)
		guiGridListSetSortingEnabled(fractionMembersList, false)
		fractionMembersColName = guiGridListAddColumn(fractionMembersList, "Член", 0.3)
		fractionMembersColRank = guiGridListAddColumn(fractionMembersList, "Ранг", 0.55)
		fractionPlayerName = guiCreateEdit(10, 310, wW/4-20, 20, "Имя игрока", false, fractionWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/4, 310, wW/4-40, 20, "Добавить", false, fractionWin), fractionAddMember, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2-10, 310, wW/4-20, 20, "Повысить", false, fractionWin), fractionUpgradeMember, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/4*3-20, 310, wW/4-20, 20, "Понизить", false, fractionWin), fractionDowngradeMember, false)
		guiCreateLabel(10, 340, wW/2-15, 20, "Члены фракции(онлайн):", false, fractionWin)
		fractionRankList = guiCreateGridList(10, 360, wW/2-15, 190, false, fractionWin)
		fractionRankColId = guiGridListAddColumn(fractionRankList, "#", 0.1)
		fractionRankColName = guiGridListAddColumn(fractionRankList, "Ранг", 0.75)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 360, wW/2-15, 20, "Добавить ранг", false, fractionWin), fractionAddRank, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 385, wW/2-15, 20, "Удалить ранг", false, fractionWin), fractionRemoveRank, false)
		fractionRankName = guiCreateEdit(wW/2+5, 435, wW/2-15, 20, "Имя ранга", false, fractionWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 460, wW/2-15, 20, "Переименовать", false, fractionWin), fractionRenameRank, false)
		addEventHandler("onClientGUIClick", guiCreateButton(10, 570, wW-20, 20, "Закрыть", false, fractionWin), fractionBtnClose, false)
	end
end

function fractionOpenMenu()
	if fractionWin and(not guiGetVisible(fractionWin)) then
		guiSetVisible(fractionWin, true)
		guiSetInputMode("no_binds_when_editing")
		showCursor(true)
	end
end

function fractionBtnClose(btn)
	if(btn == "left") then
		fractionCloseMenu()
	end
end

function fractionCloseMenu()
	if fractionWin and guiGetVisible(fractionWin) then
		guiSetVisible(fractionWin, false)
		guiSetInputMode("no_binds_when_editing")
		checkCursor()
	end
end

function fractionRefreshMenu(newInfo)
	if fractionWin then
		local row, rowText
		if newInfo[1] then
			row = guiGridListGetSelectedItem(fractionMembersList)
			
			if row and(row >= 0) then
				rowText = guiGridListGetItemText(fractionMembersList, row, fractionMembersColName)
			end
			
			guiGridListClear(fractionMembersList)
			
			for _,memberInfo in ipairs(newInfo[1]) do
				row = guiGridListAddRow(fractionMembersList, memberInfo[1], memberInfo[2])
				
				if rowText and(rowText == memberInfo[1]) then
					guiGridListSetSelectedItem(fractionMembersList, row, fractionMembersColName)
				end
				
			end
			
		end
		rowText = nil
		
		if newInfo[2] then
			row = guiGridListGetSelectedItem(fractionRankList)
			
			if row and(row >= 0) then
				rowText = guiGridListGetItemText(fractionRankList, row, fractionRankColId)
			end
			guiGridListClear(fractionRankList)
			
			for _,rankInfo in ipairs(newInfo[2]) do
				row = guiGridListAddRow(fractionRankList, rankInfo[1], rankInfo[2])
				
				if rowText and(rowText == rankInfo[1]) then
					guiGridListSetSelectedItem(fractionRankList, row, fractionRankColId)
				end
				
			end
			
		end
	end
end

function fractionAddMember(btn)
	if(btn == "left") then
		local pName = guiGetText(fractionPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onFractionAddMember", resourceRoot, localPlayer, plr)
	end
end

function fractionUpgradeMember(btn)
	if(btn == "left") then
		local pName = guiGetText(fractionPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onFractionUpgradeMember", resourceRoot, localPlayer, plr)
	end
end

function fractionDowngradeMember(btn)
	if(btn == "left") then
		local pName = guiGetText(fractionPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onFractionDowngradeMember", resourceRoot, localPlayer, plr)
	end
end

function fractionAddRank(btn)
	if(btn == "left") then
		triggerServerEvent("onFractionAddRank", resourceRoot, localPlayer)
	end
end

function fractionRemoveRank(btn)
	if(btn == "left") then
		local row = guiGridListGetSelectedItem(fractionRankList)
		
		if(not row) or (row < 0) then
			msgAdd("Выберите ранг для удаления.")
			return false
		end
		
		local rankId = tonumber(guiGridListGetItemText(fractionRankList, row, fractionRankColId))
		
		if not rankId then
			return false
		end
		
		triggerServerEvent("onFractionRemoveRank", resourceRoot, localPlayer, rankId)
	end
end

function fractionRenameRank(btn)
	if(btn == "left") then
		local row = guiGridListGetSelectedItem(fractionRankList)
		
		if(not row) or (row < 0) then
			msgAdd("Выберите ранг для переименования.")
			return false
		end
		
		local rankId = tonumber(guiGridListGetItemText(fractionRankList, row, fractionRankColId))
		
		if not rankId then
			return false
		end
		
		local rankName = guiGetText(fractionRankName)
		
		if(string.len(rankName) == 0) then
			msgAdd("Введите имя ранга.")
			return false
		end
		
		triggerServerEvent("onFractionRenameRank", resourceRoot, localPlayer, rankId, rankName)
	end
end

vehicleSellRequestVeh = nil
vehicleSellRequestPrice = nil

function vehicleSellRequest(veh, price)
	if isElement(veh) and(price >= 0) then
		if createRequestWindow("Купить ТС", string.format("%s предложил вам купить ТС %s за $%d. Вы согласны?", getPlayerName(source), getVehicleName(veh), price), source, vehicleSellAccept, vehicleSellDecline) then
			vehicleSellRequestVeh = veh
			vehicleSellRequestPrice = price
		end
	end
end

function vehicleSellAccept()
	destroyRequestWindow()
	triggerServerEvent("onVehicleSellAccept", resourceRoot, localPlayer, requestSrc, vehicleSellRequestVeh, vehicleSellRequestPrice)
end

function vehicleSellDecline()
	destroyRequestWindow()
	triggerServerEvent("onVehicleSellDecline", resourceRoot, localPlayer)
end

houseSellId = nil
houseSellPrice = nil

function houseSellRequest(houseid, price)
	if houseid and(price >= 0) then
		if createRequestWindow("Купить дом", string.format("%s предложил вам купить дом за $%d. Вы согласны?", getPlayerName(source), price), source, houseSellAccept, houseSellDecline) then
			houseSellId = houseid
			houseSellPrice = price
		end
	end
end

function houseSellAccept()
	destroyRequestWindow()
	triggerServerEvent("onHouseSellAccept", resourceRoot, localPlayer, requestSrc, houseSellId, houseSellPrice)
end

function houseSellDecline()
	destroyRequestWindow()
	triggerServerEvent("onHouseSellDecline", resourceRoot, localPlayer)
end

criminalActivityZones = {}

function criminalActivityNew(zoneIndex, x1, y1, x2, y2, outputAlert, timeStr)
	criminalActivityZones[zoneIndex] = createRadarArea(x1, y1, x2-x1, y2-y1, 255, 0, 0, 128)
	if outputAlert then
		triggerEvent("onReceivePoliceMessage", resourceRoot, timeStr.."[Полиция] ДИСПЕТЧЕР: #FFFFFFВ районе города "..getZoneName(x1, y1, 20.0, true).." повысилась криминальная активность.")
	end
end

function criminalActivityProc()
	local bColor = getTickCount()%1000
	
	if(bColor >= 500) then
		bColor = 1000-bColor
	end
	
	bColor = math.max(0, math.min(255, bColor*0.51))
	
	for zoneIndex,zoneArea in pairs(criminalActivityZones) do
		setRadarAreaColor(zoneArea, 255-bColor, 0, bColor, 128)
	end
end

function criminalActivityDestroy(zoneIndex)
	if criminalActivityZones[zoneIndex] then
		destroyElement(criminalActivityZones[zoneIndex])
		criminalActivityZones[zoneIndex] = nil
	end
end

function chatBubbleCheck()
	local chatBubbleCurState = isChatBoxInputActive()
	if(chatBubbleCurState ~= chatBubbleOldState) then
		triggerServerEvent("onChatBubbleChangeState", resourceRoot, localPlayer, chatBubbleCurState)
		chatBubbleOldState = chatBubbleCurState
	end
end

function chatBubbleSetState(newState)
	thinkBubbleDestroy(source)
	if newState then
		triggerEvent("onThinkBubbleCreate", source, "images/chatbubble.dds", true)
	end
end

carObjects = {}

function attachCarObjects(attachCars, attachObjDef)
	local px, py, pz, pint, pdim, newObj
	for _,car in ipairs(attachCars) do
		if not carObjects[car] then
			carObjects[car] = {}
		end
		
		px, py, pz = getElementPosition(car)
		pint = getElementInterior(car)
		pdim = getElementDimension(car)
		
		for _,objdef in ipairs(attachObjDef) do
			newObj = createObject(objdef[1], px, py, pz)
			setElementInterior(newObj, pint)
			setElementDimension(newObj, pdim)
			table.insert(carObjects[car], { newObj, objdef[2], objdef[3], objdef[4], objdef[5], objdef[6], objdef[7] })
		end
	end
end

function procCarObjects()
	local ox, oy, oz, rx, ry, rz
	for car,carobjs in pairs(carObjects) do
		rx, ry, rz = getElementRotation(car)
		
		for _,obj in ipairs(carobjs) do
			ox, oy, oz = getPositionFromElementOffset(car, obj[2], obj[3], obj[4])
			setElementPosition(obj[1], ox, oy, oz)
			setElementRotation(obj[1], obj[5]+rx, obj[6]+ry, obj[7]+rz)
		end
	end
end

function removeCarObjects()
	if carObjects[source] then
		
		for _,obj in ipairs(carObjects[source]) do
			destroyElement(obj[1])
		end
		
		carObjects[source] = nil
	end
end

banHammers = {}

function clientPlayerQuit(reason)
	removePlayerBlips(source)
	if(reason == "Banned") and(getElementInterior(source) == getElementInterior(localPlayer))
	and(getElementDimension(source) == getElementDimension(localPlayer))
	and(localPlayer ~= source) then
		local px, py, pz = getElementPosition(localCamera)
		local sx, sy, sz = getElementPosition(source)
		
		if(getDistanceBetweenPoints3D(px,py,pz,sx,sy,sz) < 100.0) then
			local _, _, srot = getElementRotation(source)
			local sName = getPlayerName(source)
			local hx, hy = getPointFromDistanceRotation(sx, sy, 3.4, 360.0-srot)
			local hz = sz-1.0
			setSoundMaxDistance(playSound3D("audio/banhammer.wav", sx, sy, sz), 100)
			banHammers[sName] = { createPed(getElementModel(source), sx, sy, sz, srot), createObject(3407, hx, hy, hz, 0, 0, srot), sx, sy, sz, hx, hy, hz, getTickCount() }
			setObjectScale(banHammers[sName][2], 3.0)
			setElementCollisionsEnabled(banHammers[sName][1], false)
			setElementCollisionsEnabled(banHammers[sName][2], false)
		end
		
	end
end

function banHammerRender()
	local procTime
	for plr,info in pairs(banHammers) do
		procTime = getTickCount()-info[9]
		
		if(procTime < 800) then
			setElementPosition(info[1], info[3], info[4], info[5])
			setElementPosition(info[2], info[6], info[7], info[8])
			local hrx, _, hrz = getElementRotation(info[2])
			
			if(procTime < 400) then
				hrx = -45.0*getEasingValue(procTime/400.0, "OutQuad")
			else
				hrx = getEasingValue(math.min(1.0,(procTime-400.0)/400.0), "InQuad")*135.0-45.0
			end
			
			setElementRotation(info[2], hrx, 0, hrz)
		
		else
			destroyElement(info[1])
			destroyElement(info[2])
			createExplosion(info[3], info[4], info[5], 11, false, -1.0, false)
			banHammers[plr] = nil
		end
		
	end
end

function nearbyVehiclesCheck()
	local hp, fuelLevel, vehCtrl
	local vehicles = getElementsByType("vehicle")
	for _,veh in ipairs(vehicles) do
		if isElement(veh) and isElementStreamedIn(veh) then
			local vLights = 0
			local vEngine = true
			fuelLevel = getElementData(veh, "fuelLevel")
			
			if(not getVehicleOccupant(veh)) or fuelLevel and(fuelLevel <= 0.0) then
				vLights = 1
				vEngine = false
			end
			
			hp = getElementHealth(veh)
			
			if fuelLevel and(not getElementData(veh, "explodable")) and(hp < 500.0) and(not isVehicleBlown(veh)) then
				if isElementSyncer(veh) then
					setElementHealth(veh, 499.0)
				end
				vLights = 1
				vEngine = false
			end
			
			setVehicleOverrideLights(veh, vLights)
			setVehicleEngineState(veh, vEngine)
		end
	end
end

lookIter = 0

function sendLookPoint()
	if not getPedControlState("aim_weapon") then
		local lx, ly, lz = getWorldFromScreenPosition(sW/2, sH/2, 45)
		setPedLookAt(localPlayer, lx, ly, lz, -1, 0)
		lookIter = lookIter+1
		
		if(lookIter > 10) then
			--triggerLatentServerEvent("onPlayerLookAt", resourceRoot, localPlayer, lx, ly, lz)
			lookIter = 0
		end
	end
end

function receiveLookPoint(lx, ly, lz)
	if isElement(source) then
		if lx then
			setPedAimTarget(source, lx, ly, lz)
			setPedLookAt(source, lx, ly, lz, -1, 0)
		
		else
			setPedLookAt(source, 0, 0, 0, 0)
		end
	end
end

missionTitle = nil
missionTitleFont = nil
missionTitleTimer = nil
missionTitleShowTime = 4000
missionTitleX = nil
missionTitleY = nil
missionTitleShdX = nil
missionTitleShdY = nil

function missionTitleShow(titleStr)
	if not isElement(missionTitleFont) then
		missionTitleFont = dxCreateFont("fonts/PricedownC.ttf", 36)
		
		if not missionTitleFont then
			cancelEvent()
			return nil
		end
		
	end
	
	if isTimer(missionTitleTimer) then
		killTimer(missionTitleTimer)
	end
	
	if not missionTitleX then
		missionTitleX = sW-80
		missionTitleY = sH-170
		missionTitleShdX = missionTitleX+3
		missionTitleShdY = missionTitleY-3
	end
	
	missionTitle = titleStr
	missionTitleTimer = setTimer(missionTitleHide, missionTitleShowTime, 1)
end

function missionTitleHide()
	missionTitleTimer = nil
end

function missionTitleRender()
	if not isTimer(missionTitleTimer) then
		return nil
	end
	
	local timeLeft = getTimerDetails(missionTitleTimer)
	local alpha = 255
	
	if(timeLeft >(missionTitleShowTime - 500)) then
		alpha = math.ceil((missionTitleShowTime-timeLeft) * 0.51)
	
	elseif(timeLeft < 500) then
		alpha = math.ceil(timeLeft * 0.51)
	end
	
	dxDrawText(missionTitle, missionTitleShdX, missionTitleShdY, missionTitleShdX, missionTitleShdY, tocolor(25,25,25,alpha), scaleMult, missionTitleFont, "right", "bottom", false, false, true)
	dxDrawText(missionTitle, missionTitleX, missionTitleY, missionTitleX, missionTitleY, tocolor(211,95,10,alpha), scaleMult, missionTitleFont, "right", "bottom", false, false, true)
end

placeShowStr = nil
placeShowTime = 8000
placeShowTimer = nil
placeShowX = nil
placeShowY = nil

function showPlace(place, timeY, timeMo, timeD)
	local timeH, timeMi = getTime()
	placeShowStr = place
	
	if timeY then
		placeShowStr = placeShowStr.."\n"..string.format("%02d.%02d.%d %02d:%02d", timeD, timeMo, timeY, timeH, timeMi)
	end
	
	if isTimer(placeShowTimer) then
		killTimer(placeShowTimer)
	end
	
	if not placeShowX then
		placeShowX = sW/2
		placeShowY = sH/2
	end
	
	placeShowTimer = setTimer(hidePlace, placeShowTime, 1)
end

function hidePlace()
	placeShowTimer = nil
end

function renderPlace()
	if not isTimer(placeShowTimer) then
		return nil
	end
	
	local timeLeft = getTimerDetails(placeShowTimer)
	local alpha = 255
	
	if(timeLeft >(placeShowTime - 2000)) then
		alpha = math.ceil((placeShowTime-timeLeft) * 0.127)
	
	elseif(timeLeft < 2000) then
		alpha = math.ceil(timeLeft * 0.127)
	end
	
	dxDrawText(placeShowStr, placeShowX, placeShowY, placeShowX, placeShowY, tocolor(255,255,255,alpha), scaleMult*1.5, "default-bold", "center", "center", false, false, true)
end

moveCamFunc = nil
moveCamTime = 0
moveCamTimer = nil
moveCamFrom = nil
moveCamTo = nil

function moveCamera(fromX, fromY, fromZ, fromLX, fromLY, fromLZ, toX, toY, toZ, toLX, toLY, toLZ, moveTime, moveFunc)
	moveCamTime = moveTime
	moveCamFunc = moveFunc
	moveCamFrom = { fromX, fromY, fromZ, fromLX, fromLY, fromLZ }
	moveCamTo = { toX, toY, toZ, toLX, toLY, toLZ }
	
	if(moveCamTime < 50) then
		setCameraMatrix(moveCamTo[1], moveCamTo[2], moveCamTo[3], moveCamTo[4], moveCamTo[5], moveCamTo[6])
	
	else
		moveCamTimer = setTimer(stopCamera, moveCamTime, 1)
	end
end

function stopCamera()
	moveCamTimer = nil
end

function renderMoveCamera()
	if not isTimer(moveCamTimer) then
		return nil
	end
	
	local progress = getTimerDetails(moveCamTimer)
	progress = getEasingValue((moveCamTime - progress) / moveCamTime, moveCamFunc)
	local camX = moveCamFrom[1] + (moveCamTo[1] - moveCamFrom[1]) * progress
	local camY = moveCamFrom[2] + (moveCamTo[2] - moveCamFrom[2]) * progress
	local camZ = moveCamFrom[3] + (moveCamTo[3] - moveCamFrom[3]) * progress
	local lookX = moveCamFrom[4] + (moveCamTo[4] - moveCamFrom[4]) * progress
	local lookY = moveCamFrom[5] + (moveCamTo[5] - moveCamFrom[5]) * progress
	local lookZ = moveCamFrom[6] + (moveCamTo[6] - moveCamFrom[6]) * progress
	setCameraMatrix(camX, camY, camZ, lookX, lookY, lookZ)
end

function toggleResplayMessages(bToggle)
	if not bToggle then
		msgSkip("0", true)
		msgQueue = {}
		resplayMessagesEnabled = false
	
	else
		resplayMessagesEnabled = true
	end
end

function weatherSnow(bToggle)
	if bToggle then
		exports.snow:startSnow()
		setFogDistance(10)
		setFarClipDistance(40)
		setSkyGradient(192, 192, 192, 138, 138, 138)
	
	else
		exports.snow:stopSnow()
		resetFogDistance()
		resetFarClipDistance()
		resetSkyGradient()
	end
end

function skillsInit()
	local skillW = math.max(dxGetTextWidth("-100%", scaleMult, "default-bold"), skillsW)
	
	for skillId,skillInfo in pairs(skillsStatIds) do
		skillsWTotal = skillsWTotal + skillW
		table.insert(skillsArray, { skillW, skillInfo[1], skillId, skillInfo[2], skillInfo[3] })
	end
end

function skillsDraw()
	if curMsg then
		return nil
	end
	
	if respectDrawTime <= 0 then
		return nil
	end
	
	local skillX = sW/2.0-skillsWTotal/2.0
	local skillXTxt, skillTxt
	
	for _,skillInfo in ipairs(skillsArray) do
		skillXTxt = skillX+skillInfo[1]/2.0
		dxDrawImageSection(skillX+ (skillInfo[1]-skillsW)/2.0, skillsY, skillsW, skillsH, 128.0* (skillInfo[2]-1.0), 0.0, 128.0, 128.0, skillsTex)
		skillTxt = tostring(math.max(0, math.floor((getPedStat(localPlayer, skillInfo[3]) - skillInfo[4]) / (skillInfo[5] - skillInfo[4]) * 100.0))) .. "%"
		dxDrawText(skillTxt, skillXTxt-2.0*scaleMult, skillsYTxt-2.0*scaleMult, skillXTxt-2.0*scaleMult, skillsYTxt-2.0*scaleMult, tocolor(0,0,0,255), scaleMult, "default-bold", "center", "bottom")
		dxDrawText(skillTxt, skillXTxt, skillsYTxt, skillXTxt, skillsYTxt, tocolor(255,90,0,255), scaleMult, "default-bold", "center", "bottom")
		skillX = skillX + skillInfo[1]
	end
end

function skillsProc()
	if(getPedMoveState(localPlayer) == "sprint") or (not isPedDead(localPlayer)) and(not getPedOccupiedVehicle(localPlayer)) and isElementInWater(localPlayer) and(Vector3(getElementVelocity(localPlayer)).length > 0.01) then
		skillsStaminaLevel = skillsStaminaLevel - (1000.0 - getPedStat(localPlayer, 22)) / 200.0 - 1.0
		
		if skillsStaminaLevel < 0.0 then
			if not skillsStaminaBlocked then
				skillsStaminaBlocked = true
				toggleControl("sprint", false)
			end
			
			skillsStaminaLevel = 0.0
		end
		
	elseif(skillsStaminaLevel < 100.0) then
		skillsStaminaLevel = math.min(100.0, skillsStaminaLevel + 1.5)
		
		if skillsStaminaBlocked and(skillsStaminaLevel > 20.0) then
			skillsStaminaBlocked = false
			toggleControl("sprint", true)
		end
	end
end

function eventModeSwitch(enabled)
	eventModeOn = enabled
	setCameraClip(true, not enabled)
end

function elemDataChange(dataName, oldValue)
	local elemType = getElementType(source)
	if(dataName == "noCollisions") and((elemType == "player") or (elemType == "ped") or (elemType == "vehicle") or (elemType == "object")) then
		local noColVal = getElementData(source, "noCollisions")
		
		if(oldValue ~= noColVal) then
			if noColVal then
				noColVal = true
			else
				noColVal = false
			end
			local vehicles = getElementsByType("vehicle")
			local players = getElementsByType("player")
			
			for _,elem in ipairs(vehicles) do
				setElementCollidableWith(source, elem, not noColVal)
			end
			
			for _,elem in ipairs(players) do
				setElementCollidableWith(source, elem, not noColVal)
			end
		end
	end
end

function furnitureSelect(mdlId)
	if isElement(furnitureSelectedObj) then
		furnitureRemove()
	end
	furnitureSelectedObj = createObject(mdlId, 0.0, 0.0, 0.0)
	setElementCollisionsEnabled(furnitureSelectedObj, false)
	setElementAlpha(furnitureSelectedObj, 128)
	furnitureRot = 0.0
	furnitureHeight = 0.0
	addEventHandler("onClientRender", root, furnitureProc, false)
	addCommandHandler("Accept", furnitureAccept)
	addCommandHandler("Decline", furnitureDecline)
	msgAdd(string.upper(getKeyBoundToCommand("Accept")).." - поставить мебель, "..string.upper(getKeyBoundToCommand("Decline")).." - отмена, "..string.upper(getKeyBoundToCommand("Rotate forward")).." и "..string.upper(getKeyBoundToCommand("Rotate back")).." - вращать мебель, "..string.upper(getKeyBoundToCommand("Move up")).." и "..string.upper(getKeyBoundToCommand("Move down")).." - двигать вертикально.")
end

function furnitureRotateForward()
	furnitureRot = furnitureRot + furnitureRotMult
end

function furnitureRotateBack()
	furnitureRot = furnitureRot - furnitureRotMult
end

function furnitureUp()
	furnitureHeight = math.min(2.0, math.max(0.0, furnitureHeight + furnitureHeightMult))
end

function furnitureDown()
	furnitureHeight = math.min(2.0, math.max(0.0, furnitureHeight - furnitureHeightMult))
end

function furnitureProc()
	if not isElement(furnitureSelectedObj) then
		return
	end
	if getPedOccupiedVehicle(localPlayer) then
		furnitureDecline()
		return
	end
	local rfKeys = getBoundKeys("Rotate forward")
	local rbKeys = getBoundKeys("Rotate back")
	local muKeys = getBoundKeys("Move up")
	local mdKeys = getBoundKeys("Move down")
	
	for curKey in pairs(rfKeys) do
		if getKeyState(curKey) then
			furnitureRotateForward()
		end
	end
	
	for curKey in pairs(rbKeys) do
		if getKeyState(curKey) then
			furnitureRotateBack()
		end
	end
	
	for curKey in pairs(muKeys) do
		if getKeyState(curKey) then
			furnitureUp()
		end
	end
	
	for curKey in pairs(mdKeys) do
		if getKeyState(curKey) then
			furnitureDown()
		end
	end
	
	while furnitureRot > 360.0 do
		furnitureRot = furnitureRot - 360.0
	end
	
	while furnitureRot < 0.0 do
		furnitureRot = furnitureRot + 360.0
	end
	
	local px, py, pz = getElementPosition(localPlayer)
	local _, _, prot = getElementRotation(localPlayer)
	local ox, oy = getPointFromDistanceRotation(px, py, 1.0, 360.0-prot)
	prot = prot + furnitureRot
	local _, _, minz = getElementBoundingBox(furnitureSelectedObj)
	local oz = pz-99.0
	local _, _, _, hitz = processLineOfSight(ox, oy, oz+100.0, ox, oy, oz, true, false, false, true, false, false, false, false, furnitureSelectedObj)
	
	if hitz then
		oz = hitz - math.min(0.0, minz)
	else
		oz = oz - minz
	end
	
	oz = oz + furnitureHeight
	setElementPosition(furnitureSelectedObj, ox, oy, oz)
	setElementRotation(furnitureSelectedObj, 0.0, 0.0, prot)
	setElementInterior(furnitureSelectedObj, getElementInterior(localPlayer))
	setElementDimension(furnitureSelectedObj, getElementDimension(localPlayer))
end

function furnitureAccept()
	if not isElement(furnitureSelectedObj) then
		return
	end
	
	removeCommandHandler("Accept", furnitureAccept)
	removeCommandHandler("Decline", furnitureDecline)
	setElementAlpha(furnitureSelectedObj, 0)
	local px, py, pz = getElementPosition(furnitureSelectedObj)
	local rx, ry, rz = getElementRotation(furnitureSelectedObj)
	triggerServerEvent("onPlayerFurnitureAccept", resourceRoot, localPlayer, px, py, pz, rx, ry, rz)
end

function furnitureDecline()
	if not isElement(furnitureSelectedObj) then
		return
	end
	
	removeCommandHandler("Accept", furnitureAccept)
	removeCommandHandler("Decline", furnitureDecline)
	setElementAlpha(furnitureSelectedObj, 0)
	triggerServerEvent("onPlayerFurnitureDecline", resourceRoot, localPlayer)
end

function furnitureRemove()
	if not isElement(furnitureSelectedObj) then
		return
	end
	
	removeEventHandler("onClientRender", root, furnitureProc)
	removeCommandHandler("Accept", furnitureAccept)
	removeCommandHandler("Decline", furnitureDecline)
	destroyElement(furnitureSelectedObj)
	furnitureSelectedObj = nil
end

function messageBox(message, boxType, title)
	exports.msgbox:guiShowMessageBox(message, boxType, title)
end

function weaponDataSync(callbackFunc, ...)
	if isPedDead(localPlayer) then
		return
	end
	
	local weapData = {}
	
	for curWeapSlot=0,12 do
		weapData[curWeapSlot] = {}
		table.insert(weapData[curWeapSlot], getPedWeapon(localPlayer, curWeapSlot))
		table.insert(weapData[curWeapSlot], getPedTotalAmmo(localPlayer, curWeapSlot))
		
		if(weapData[curWeapSlot][2] <= 0) or (weapData[curWeapSlot][1] <= 0) then
			weapData[curWeapSlot][1] = 0
			weapData[curWeapSlot][2] = 0
		end
		
	end
	
	triggerServerEvent("onWeaponDataReceive", resourceRoot, localPlayer, weapData, callbackFunc, ...)
end

function saNewsShow(saNewsText)
	outputChatBox(saNewsText, 160, 212, 187)
	playSound("audio/message.wav")
end

function gangRequest()
	createRequestWindow("Игрок", string.format("Вы действительно хотите стать бандитом?."), source, gangAccept, gangDecline)
end

addEvent("onGangRequest", true)
addEventHandler("onGangRequest", root, gangRequest)

function gangAccept()
	destroyRequestWindow()
	triggerServerEvent("onGangServerAccept", localPlayer, requestSrc)
end

addEvent("onGangAccept", true)
addEventHandler("onGangAccept", root, gangAccept)

function gangDecline()
	destroyRequestWindow()
end

addEvent("onGangDecline", true)
addEventHandler("onGangDecline", root, gangDecline)

-- Покупка дома
houseBuyGosId = nil

function houseBuyGosRequest(houseid)
	if houseid then
		if createRequestWindow("Дом", string.format("Вы подтверждаете покупку этого дома?"), source, houseBuyGosAccept, houseBuyGosDecline) then
			houseBuyGosId = houseid
		end
	end
end

addEvent("onHouseBuyGosRequest", true)
addEventHandler("onHouseBuyGosRequest", root, houseBuyGosRequest)

function houseBuyGosAccept()
	destroyRequestWindow()
	triggerServerEvent("onHouseBuyGosAccept", resourceRoot, localPlayer, houseBuyGosId)
end

addEvent("onHouseBuyGosAccept", true)
addEventHandler("onHouseBuyGosAccept", root, houseBuyGosAccept)

function houseBuyGosDecline()
	destroyRequestWindow()
	triggerServerEvent("onHouseBuyGosDeclineServer", resourceRoot, localPlayer)
end

addEvent("onHouseBuyGosDecline", true)
addEventHandler("onHouseBuyGosDecline", root, houseBuyGosDecline)

houseSellGosId = nil
-- Продажа дома
function houseSellGosRequest(houseid)
    if houseid then
	    if createRequestWindow("Дом", string.format("Вы подтверждаете продажу этого дома?"), source, houseSellGosAccept, houseSellGosDecline) then
	        houseSellGosId = houseid
		end
	end
end

addEvent("onHouseSellGosRequest", true)
addEventHandler("onHouseSellGosRequest", root, houseSellGosRequest)

function houseSellGosAccept()
	destroyRequestWindow()
	triggerServerEvent("onHouseSellGosAccept", resourceRoot, localPlayer, houseSellGosId)
end

addEvent("onHouseSellGosAccept", true)
addEventHandler("onHouseSellGosAccept", root, houseSellGosAccept)

function houseSellGosDecline()
	destroyRequestWindow()
	triggerServerEvent("onHouseSellGosDecline", resourceRoot, localPlayer)
end

addEvent("onHouseSellGosDecline", true)
addEventHandler("onHouseSellGosDecline", root, houseSellGosDecline)

local a69X, a69Y, a69Z =  180.3, 1912.5, 17.94 --alarm area69 
local lvaX, lvaY, lvaZ =  2582.89, 2782.39, 10.82 --alarm base LV 
local sfaX, sfaY, sfaZ = -1433.58, 385.57, 30.08 -- alarm base SF 
local lsaX, lsaY, lsaZ = 2187.15, -2260.86, 13.4 -- alarm base LS 

--евенты на включение сирен
addEvent("a69AlarmEnable", true)
addEvent("lvaAlarmEnable", true)
addEvent("sfaAlarmEnable", true)
addEvent("lsaAlarmEnable", true)

--евенты на выключение сирен
addEvent("a69AlarmDisable", true)
addEvent("lvaAlarmDisable", true)
addEvent("sfaAlarmDisable", true)
addEvent("lsaAlarmDisable", true)

isEnabledA69 = false
function a69Alrm()
    if not isEnabledA69 then
		stopSound(alarma69)
	    alarma69 = playSFX3D("script", 64, 0, a69X, a69Y, a69Z, true)
        setSoundVolume(alarma69, 0.3)
        setSoundMaxDistance(alarma69, 300)
	end
end
addEventHandler("a69AlarmEnable", root, a69Alrm)

isEnabledLVA = false
function lvaAlrm()
    if not isEnabledLVA then
		stopSound(alarmalva)
	    alarmalva = playSFX3D("script", 64, 0, lvaX, lvaY, lvaZ, true)
        setSoundVolume(alarmalva, 0.3)
        setSoundMaxDistance(alarmalva, 300)
	end
end
addEventHandler("lvaAlarmEnable", root, lvaAlrm)

isEnabledSFA = false
function sfaAlrm()
    if not isEnabledSFA then
		stopSound(alarmsfa)
	    alarmsfa = playSFX3D("script", 64, 0, sfaX, sfaY, sfaZ, true)
        setSoundVolume(alarmsfa, 0.3)
        setSoundMaxDistance(alarmsfa, 500)
	end
end
addEventHandler("sfaAlarmEnable", root, sfaAlrm)

isEnabledLSA = false
function lsaAlrm()
    if not isEnabledLSA then
		stopSound(alarmlsa)
	    alarmlsa = playSFX3D("script", 64, 0, lsaX, lsaY, lsaZ, true)
        setSoundVolume(alarmlsa, 0.3)
        setSoundMaxDistance(alarmlsa, 200)
	end
end
addEventHandler("lsaAlarmEnable", root, lsaAlrm)

function disableAlarmArea69()
    stopSound(alarma69)
	destroyElement(alarma69)
end
addEventHandler("a69AlarmDisable", getRootElement(), disableAlarmArea69)

function disableAlarmLVA()
    stopSound(alarmalva)
	destroyElement(alarmalva)
end
addEventHandler("lvaAlarmDisable", getRootElement(), disableAlarmLVA)

function disableAlarmSFA()
    stopSound(alarmsfa)
	destroyElement(alarmsfa)
end
addEventHandler("sfaAlarmDisable", getRootElement(), disableAlarmSFA)

function disableAlarmLSA()
    stopSound(alarmlsa)
	destroyElement(alarmlsa)
end
addEventHandler("lsaAlarmDisable", getRootElement(), disableAlarmLSA)

------ Смена пола -----------

function genderChangeRequest()
	createRequestWindow("Игрок", string.format("Вы действительно хотите изменить пол?"), source, genderChangeAccept, genderChangeDecline)
end

addEvent("onGenderChangeRequest", true)
addEventHandler("onGenderChangeRequest", root, genderChangeRequest)

function genderChangeAccept()
	destroyRequestWindow()
	triggerServerEvent("onGenderChangeServer", localPlayer, requestSrc)
end

addEvent("onGenderChangeAccept", true)
addEventHandler("onGenderChangeAccept", root, genderChangeAccept)

function genderChangeDecline()
	destroyRequestWindow()
end

addEvent("onGenderChangeDecline", true)
addEventHandler("onGenderChangeDecline", root, genderChangeDecline)

------- Смена городов ----------
-- LV
function cityChangeRequestLV()
	createRequestWindow("Игрок", string.format("Вы подтверждаете смену точки спавна на Лас-Вентурас?."), source, cityChangeAcceptLV, cityChangeDeclineLV)
end

addEvent("onCityChangeRequestLV", true)
addEventHandler("onCityChangeRequestLV", root, cityChangeRequestLV)

function cityChangeAcceptLV()
	destroyRequestWindow()
	triggerServerEvent("onCityChangeServerAcceptLV", localPlayer, requestSrc)
end

addEvent("onCityChangeAcceptLV", true)
addEventHandler("onCityChangeAcceptLV", root, cityChangeAcceptLV)

function cityChangeDeclineLV()
	destroyRequestWindow()
end

addEvent("onCityChangeDeclineLV", true)
addEventHandler("onCityChangeDeclineLV", root, cityChangeDeclineLV)

--SF
function cityChangeRequestSF()
	createRequestWindow("Игрок", string.format("Вы подтверждаете смену точки спавна на Сан-Фиерро?."), source, cityChangeAcceptSF, cityChangeDeclineSF)
end

addEvent("onCityChangeRequestSF", true)
addEventHandler("onCityChangeRequestSF", root, cityChangeRequestSF)

function cityChangeAcceptSF()
	destroyRequestWindow()
	triggerServerEvent("onCityChangeServerAcceptSF", localPlayer, requestSrc)
end

addEvent("onCityChangeAcceptSF", true)
addEventHandler("onCityChangeAcceptSF", root, cityChangeAcceptSF)

function cityChangeDeclineSF()
	destroyRequestWindow()
end

addEvent("onCityChangeDeclineSF", true)
addEventHandler("onCityChangeDeclineSF", root, cityChangeDeclineSF)
--LS
function cityChangeRequestLS()
	createRequestWindow("Игрок", string.format("Вы подтверждаете смену точки спавна на Лос-Сантос?."), source, cityChangeAcceptLS, cityChangeDeclineLS)
end

addEvent("onCityChangeRequestLS", true)
addEventHandler("onCityChangeRequestLS", root, cityChangeRequestLS)

function cityChangeAcceptLS()
	destroyRequestWindow()
	triggerServerEvent("onCityChangeServerAcceptLS", localPlayer, requestSrc)
end

addEvent("onCityChangeAcceptLS", true)
addEventHandler("onCityChangeAcceptLS", root, cityChangeAcceptLS)

function cityChangeDeclineLS()
	destroyRequestWindow()
end

addEvent("onCityChangeDeclineLS", true)
addEventHandler("onCityChangeDeclineLS", root, cityChangeDeclineLS)



------- магазин скинов ----------

skinMale = {
	-- Виды разделов: 0 - Тип , 1 - Одежда 
	-- {Раздел, Название},
	{ 0, "Мужчины" },
		-- {Раздел, Айди, Вид, Цена},
		{1, 19 ,"Male", 10000 },
		{1, 20 ,"Male", 30000 },
		{1, 21 ,"Male", 11000 },
		{1, 22 ,"Male", 7100 },
		{1, 23 ,"Male", 4000 },
		{1, 25 ,"Male", 8000 },
		{1, 26 ,"Male", 3400 },
		{1, 47 ,"Male", 9000 },
		{1, 48 ,"Male", 12000 },
		{1, 98 ,"Male", 37000 },
		{1, 68 ,"Male", 65000 },
		{1, 59 ,"Male", 24000 },
		{1, 187 ,"Male", 65000 },
		{1, 36 ,"Male", 8000 },
		{1, 72 ,"Male", 3500 },
		{1, 154,"male", 26000},
		{1, 96 ,"Male", 3000 },
		{1, 240 ,"Male", 50000 },
		{1, 299 ,"Male", 300000 },
		{1, 296 ,"Male", 500000 },
		{1, 111, "Male", 80000},
}

skinFemale = {
	-- Виды разделов: 0 - Тип , 1 - Одежда 
	-- {Раздел, Название},				
	{ 0 , "Женщины"},
	{1, 40,"Girl", 70000 },
	{1, 12,"Girl", 45000 },
	{1, 69,"Girl", 9000 },
	{1, 211,"Girl", 12000  },
	{1, 56,"Girl", 2000  },
	{1, 93,"Girl", 21000  },
	{1, 219,"Girl", 95000  },
	{1, 172, "Girl", 60000 },
	{1, 90, "Girl", 120000 },
	{1, 87, "Girl", 70000 },
	{1, 216, "Girl", 85000},
}

skinGangMale = {
	-- Виды разделов: 0 - Тип , 1 - Одежда 
	-- {Раздел, Название},
	{ 0, "Мужчины" },
		-- {Раздел, Айди, Вид, Цена},
		{1, 28 ,"Male", 5000 },
		{1, 29 ,"Male", 17500 },
		{1, 30 ,"Male", 8000 },
		{1, 117 ,"Male", 10000 },
		{1, 118 ,"Male", 10100 },
		{1, 120 ,"Male", 10500 },
		{1, 122 ,"Male", 11400 },
		{1, 123 ,"Male", 10000 },
    	{1, 67, "Male", 4000 },
		{1, 124 ,"Male", 10000 },
		{1, 125 ,"Male", 31000 },
		{1, 126 ,"Male", 31100 },
		{1, 203, "male", 20000 },
		{1, 127 ,"Male", 30000 },
		{1, 115 ,"Male", 16000 },
		{1, 249 ,"Male", 100000 },
		{1, 186 ,"Male", 55000 },
		--{1, 213, "Male", 80000},
}

skinGangFemale = {
	-- Виды разделов: 0 - Тип , 1 - Одежда 
	-- {Раздел, Название},
	{ 0 , "Женщины"},
	{1, 238, "Girl", 15000 },
	{1, 85, "Girl", 30000 },
	{1, 56, "Girl", 2000 },
	{1, 64, "Girl", 5000 },
	{1, 169, "Girl", 10000 },
	{1, 192, "Girl", 6000 },
	{1, 194, "Girl", 25000 },
	{1, 129, "Girl", 50000 },
	{1, 243 ,"Male", 5600 },
}

local sWidth, sHeight = guiGetScreenSize()
local model
function initialize_skin_shop()
	window = guiCreateWindow(sWidth-340, (sHeight-500)/2, 340, 500, "Магазин Одежды", false)
	skin_list_gui = guiCreateGridList(10, 25, 320, 425, false, window)
	col_name = guiGridListAddColumn(skin_list_gui, "ID", 0.25)
	col_cost = guiGridListAddColumn(skin_list_gui, "Цена", 0.25)
	btn_buy = guiCreateButton(10, 456, 158, 40, "Купить", false, window)
	btn_close = guiCreateButton(172, 456, 158, 40, "Закрыть", false, window)
	guiSetVisible(window, false)
	addEventHandler("onClientGUIClick", btn_close, function( )
		guiSetVisible(window, false)
		showCursor(false)
		setElementModel(localPlayer, model)
		setElementFrozen(localPlayer, false)
	end, false)
	addEventHandler("onClientGUIClick", btn_buy, buy_the_skin, false)
	addEventHandler("onClientGUIClick", skin_list_gui, preview_skin, false)
end
addEventHandler("onClientResourceStart", resourceRoot, initialize_skin_shop)

t_skins 			= { }
t_skins.name 	= { }
t_skins.price = { }
t_skins.id    = { }

function showSkin()
    local usergrp = getElementData(localPlayer, "usergroup")
	local gender = getElementData(localPlayer, "gender")
	guiGridListClear(skin_list_gui)
    if (usergrp == 1 or usergrp == 13 or usergrp == 23) and gender == 1 then
	    for i,colum in ipairs(skinMale) do
		    local rowID = guiGridListAddRow(skin_list_gui)
		        if colum[1] == 0 then
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], true, true)
			        guiGridListSetItemColor( skin_list_gui, rowID, 1, 100, 100, 100 )
		        else
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], false, true)
			        guiGridListSetItemText(skin_list_gui, rowID, 2, colum[4], false, true)
		        end
	    end
    elseif (usergrp == 1 or usergrp == 13 or usergrp == 23) and gender == 2 then
	    for i,colum in ipairs(skinFemale) do
		    local rowID = guiGridListAddRow(skin_list_gui)
		        if colum[1] == 0 then
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], true, true)
			        guiGridListSetItemColor( skin_list_gui, rowID, 1, 100, 100, 100 )
		        else
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], false, true)
			        guiGridListSetItemText(skin_list_gui, rowID, 2, colum[4], false, true)
		        end
	    end
	elseif usergrp == 10 and gender == 1 then
	    for i,colum in ipairs(skinGangMale) do
		    local rowID = guiGridListAddRow(skin_list_gui)
		        if colum[1] == 0 then
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], true, true)
			        guiGridListSetItemColor( skin_list_gui, rowID, 1, 100, 100, 100 )
		        else
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], false, true)
			        guiGridListSetItemText(skin_list_gui, rowID, 2, colum[4], false, true)
		        end
	    end
	elseif usergrp == 10 and gender == 2 then
	    for i,colum in ipairs(skinGangFemale) do
		    local rowID = guiGridListAddRow(skin_list_gui)
		        if colum[1] == 0 then
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], true, true)
			        guiGridListSetItemColor( skin_list_gui, rowID, 1, 100, 100, 100 )
		        else
			        guiGridListSetItemText(skin_list_gui, rowID, 1, colum[2], false, true)
			        guiGridListSetItemText(skin_list_gui, rowID, 2, colum[4], false, true)
		        end
	    end
	end
	setElementFrozen(localPlayer, true)
	guiSetVisible(window, true)
	showCursor(true)
	local rx,ry,rz = getElementRotation(localPlayer)
	fadeCamera(false)
	setTimer(setCameraTarget, 900, 1, localPlayer)
	setTimer(setElementRotation, 1000, 1, localPlayer, rx,ry, rz-180)
	setTimer(fadeCamera, 1200, 1, true)
	model = getElementModel(localPlayer)
end
addEvent("showSkin", true)
addEventHandler("showSkin", root, showSkin)

function preview_skin()
	local row = guiGridListGetSelectedItem(skin_list_gui)
	if (not row or row == -1) then return end
	local id = guiGridListGetItemText(skin_list_gui, row, 1)
	id = tonumber(id)
	if (not id) then return end
	setElementModel(localPlayer, id)
end

function buy_the_skin()
	local row = guiGridListGetSelectedItem(skin_list_gui)
	if (not row or row == -1) then return end
	local id = guiGridListGetItemText(skin_list_gui, row, 1)
	local cost = guiGridListGetItemText(skin_list_gui, row, 2)
	id = tonumber(id)
	cost = tonumber(cost)
	if (not id) and (not cost) then return end
	if id == model then
	msgAdd("Вы уже купили эту одежду!")
	return
	end
	setElementModel(localPlayer, model)
	setElementFrozen(localPlayer, false)
	guiSetVisible(window, false)
	showCursor(false)
	triggerServerEvent("onBuySkin", root, id, cost)
end

-- функционал банд --

gangWin = nil
gangMembersList = nil
gangMembersColName = nil
gangMembersColRank = nil
gangPlayerName = nil
gangRankList = nil
gangRankColId = nil
gangRankColName = nil
gangRankName = nil

function gangInitMenu()
	if not gangWin then
		local wW = 600
		gangWin = guiCreateWindow(sW/2-wW/2, sH/2-300, wW, 600, "Банда", false)
		guiWindowSetMovable(gangWin, false)
		guiWindowSetSizable(gangWin, false)
		guiSetVisible(gangWin, false)
		guiCreateLabel(10, 25, wW-20, 20, "Члены банды(онлайн):", false, gangWin)
		gangMembersList = guiCreateGridList(10, 45, wW-20, 255, false, gangWin)
		guiGridListSetSortingEnabled(gangMembersList, false)
		gangMembersColName = guiGridListAddColumn(gangMembersList, "Член", 0.3)
		gangMembersColRank = guiGridListAddColumn(gangMembersList, "Ранг", 0.55)
		gangPlayerName = guiCreateEdit(10, 310, wW/4-20, 20, "Имя игрока", false, gangWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/4, 310, wW/4-40, 20, "Добавить", false, gangWin), gangAddMember, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2-10, 310, wW/4-20, 20, "Повысить", false, gangWin), gangUpgradeMember, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/4*3-20, 310, wW/4-20, 20, "Понизить", false, gangWin), gangDowngradeMember, false)
		guiCreateLabel(10, 340, wW/2-15, 20, "Члены банды(онлайн):", false, gangWin)
		gangRankList = guiCreateGridList(10, 360, wW/2-15, 190, false, gangWin)
		gangRankColId = guiGridListAddColumn(gangRankList, "#", 0.1)
		gangRankColName = guiGridListAddColumn(gangRankList, "Ранг", 0.75)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 360, wW/2-15, 20, "Добавить ранг", false, gangWin), gangAddRank, false)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 385, wW/2-15, 20, "Удалить ранг", false, gangWin), gangRemoveRank, false)
		gangRankName = guiCreateEdit(wW/2+5, 435, wW/2-15, 20, "Имя ранга", false, gangWin)
		addEventHandler("onClientGUIClick", guiCreateButton(wW/2+5, 460, wW/2-15, 20, "Переименовать", false, gangWin), gangRenameRank, false)
		addEventHandler("onClientGUIClick", guiCreateButton(10, 570, wW-20, 20, "Закрыть", false, gangWin), gangBtnClose, false)
	end
end

function gangOpenMenu()
	if gangWin and(not guiGetVisible(gangWin)) then
		guiSetVisible(gangWin, true)
		guiSetInputMode("no_binds_when_editing")
		showCursor(true)
	end
end

function gangBtnClose(btn)
	if(btn == "left") then
		gangCloseMenu()
	end
end

function gangCloseMenu()
	if gangWin and guiGetVisible(gangWin) then
		guiSetVisible(gangWin, false)
		guiSetInputMode("no_binds_when_editing")
		checkCursor()
	end
end

function gangRefreshMenu(newInfo)
	if gangWin then
		local row, rowText
		if newInfo[1] then
			row = guiGridListGetSelectedItem(gangMembersList)
			
			if row and(row >= 0) then
				rowText = guiGridListGetItemText(gangMembersList, row, gangMembersColName)
			end
			
			guiGridListClear(gangMembersList)
			
			for _,memberInfo in ipairs(newInfo[1]) do
				row = guiGridListAddRow(gangMembersList, memberInfo[1], memberInfo[2])
				
				if rowText and(rowText == memberInfo[1]) then
					guiGridListSetSelectedItem(gangMembersList, row, gangMembersColName)
				end
				
			end
			
		end
		rowText = nil
		
		if newInfo[2] then
			row = guiGridListGetSelectedItem(gangRankList)
			
			if row and(row >= 0) then
				rowText = guiGridListGetItemText(gangRankList, row, gangRankColId)
			end
			guiGridListClear(gangRankList)
			
			for _,rankInfo in ipairs(newInfo[2]) do
				row = guiGridListAddRow(gangRankList, rankInfo[1], rankInfo[2])
				
				if rowText and(rowText == rankInfo[1]) then
					guiGridListSetSelectedItem(gangRankList, row, gangRankColId)
				end
				
			end
			
		end
	end
end

function gangAddMember(btn)
	if(btn == "left") then
		local pName = guiGetText(gangPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onGangAddMember", resourceRoot, localPlayer, plr)
	end
end

function gangUpgradeMember(btn)
	if(btn == "left") then
		local pName = guiGetText(gangPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onGangUpgradeMember", resourceRoot, localPlayer, plr)
	end
end

function gangDowngradeMember(btn)
	if(btn == "left") then
		local pName = guiGetText(gangPlayerName)
		
		if(string.len(pName) == 0) then
			msgAdd("Введите имя игрока.")
			return false
		end
		
		local plr = getPlayerFromName(pName)
		
		if not plr then
			msgAdd("Игрок с данным никнеймом не найден.")
			return false
		end
		
		triggerServerEvent("onGangDowngradeMember", resourceRoot, localPlayer, plr)
	end
end

function gangAddRank(btn)
	if(btn == "left") then
		triggerServerEvent("onGangAddRank", resourceRoot, localPlayer)
	end
end

function gangRemoveRank(btn)
	if(btn == "left") then
		local row = guiGridListGetSelectedItem(gangRankList)
		
		if(not row) or (row < 0) then
			msgAdd("Выберите ранг для удаления.")
			return false
		end
		
		local rankId = tonumber(guiGridListGetItemText(gangRankList, row, gangRankColId))
		
		if not rankId then
			return false
		end
		
		triggerServerEvent("onGangRemoveRank", resourceRoot, localPlayer, rankId)
	end
end

function gangRenameRank(btn)
	if(btn == "left") then
		local row = guiGridListGetSelectedItem(gangRankList)
		
		if(not row) or (row < 0) then
			msgAdd("Выберите ранг для переименования.")
			return false
		end
		
		local rankId = tonumber(guiGridListGetItemText(gangRankList, row, gangRankColId))
		
		if not rankId then
			return false
		end
		
		local rankName = guiGetText(gangRankName)
		
		if(string.len(rankName) == 0) then
			msgAdd("Введите имя ранга.")
			return false
		end
		
		triggerServerEvent("onGangRenameRank", resourceRoot, localPlayer, rankId, rankName)
	end
end

gangBaseCaptureInfo = nil

function gangBaseCaptureRender()
	if gangBaseCaptureInfo then
		captureInProc = gangBaseCaptureInfo[4]
		
		if captureInProc then
			statusColorStr = "#00FF00"
			statusStr = "#FFFFFFСтатус: #00FF00захват"
		else
			statusColorStr = "#FF0000"
			statusStr = "#FFFFFFСтатус: #FF0000ожидание"
		end
		
		statusW = dxGetTextWidth(statusStr, 1, "default-bold", true)
		statusH = dxGetFontHeight(1, "default-bold")
		ownerR, ownerG, ownerB = getTeamColor(gangBaseCaptureInfo[1])
		clanR, clanG, clanB = getTeamColor(gangBaseCaptureInfo[2])
		teamsStr = "#"..RGBToHex(ownerR, ownerG, ownerB)..getTeamName(gangBaseCaptureInfo[1]).." #FFFFFFvs. #"..RGBToHex(clanR, clanG, clanB)..getTeamName(gangBaseCaptureInfo[2])
		teamsW = dxGetTextWidth(teamsStr, 2, "default-bold", true)
		teamsH = dxGetFontHeight(2, "default-bold")
		timeVal = "#FFFFFFВремя: "..msecToStringTime(gangBaseCaptureInfo[3])
		timeW = dxGetTextWidth(timeVal, 1, "default-bold", true)
		timeH = dxGetFontHeight(1, "default-bold")
		--[[teamOwnerKillsVal = "#"..RGBToHex(ownerR, ownerG, ownerB)..getTeamName(gangBaseCaptureInfo[1])..": #FFFFFF"..gangBaseCaptureInfo[8]
		teamOwnerKillsW = dxGetTextWidth(timeVal, 1, "default-bold", true)
		teamOwnerKillsH = dxGetFontHeight(1, "default-bold")
		teamGangKillsVal = "#"..RGBToHex(clanR, clanG, clanB)..getTeamName(gangBaseCaptureInfo[2])..": #FFFFFF"..gangBaseCaptureInfo[7]
		teamGangKillsW = dxGetTextWidth(timeVal, 1, "default-bold", true)
		teamGangKillsH = dxGetFontHeight(1, "default-bold")]]
		playersNumStr = "Захватчики: "..statusColorStr..tostring(gangBaseCaptureInfo[5]).."/"..tostring(gangBaseCaptureInfo[6])
		playersNumW = dxGetTextWidth(playersNumStr, 1, "default-bold", true)
		playersNumH = dxGetFontHeight(1, "default-bold")
		--rW = 40+math.max(math.max(math.max(teamsW, statusW), timeW), teamOwnerKillsW, teamGangKillsW, playersNumW)
		rW = 40+math.max(math.max(math.max(teamsW, statusW), timeW), playersNumW)
		--rH = 35+teamsH+statusH+timeH+teamOwnerKillsH+teamGangKillsH+playersNumH
		rH = 25+teamsH+statusH+timeH+playersNumH
		rX = sW/2-rW/2
		rY = 10
		dxDrawRectangle(rX, rY, rW, rH, tocolor(0, 0, 0, 128))
		dxDrawLine(rX, rY, rX+rW, rY, tocolor(0, 0, 0, 255))
		dxDrawLine(rX, rY, rX, rY+rH, tocolor(0, 0, 0, 255))
		dxDrawLine(rX+rW, rY, rX+rW, rY+rH, tocolor(0, 0, 0, 255))
		dxDrawLine(rX+rW, rY, rX+rW, rY+rH, tocolor(0, 0, 0, 255))
		dxDrawLine(rX, rY+rH, rX+rW, rY+rH, tocolor(0, 0, 0, 255))
		rX = rX+10
		rY = rY+5
		rW = rX+teamsW
		rH = rY+teamsH
		dxDrawText(teamsStr, rX, rY, rW, rH, tocolor(255,255,255,255), 2, "default-bold", "center", "top", false, false, false, true)
		rY = rH+5
		rW = rX+statusW
		rH = rY+statusH
		dxDrawText(statusStr, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
		rY = rH+5
		rW = rX+timeW
		rH = rY+timeH
		dxDrawText(timeVal, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
		--[[rY = rH+5
		rW = rX+teamOwnerKillsW
		rH = rY+teamOwnerKillsH
		dxDrawText(teamOwnerKillsVal, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
		rY = rH+5
		rW = rX+teamGangKillsW
		rH = rY+teamGangKillsH
		dxDrawText(teamGangKillsVal, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)]]
		rY = rH+5
		rW = rX+playersNumW
		rH = rY+playersNumH
		dxDrawText(playersNumStr, rX, rY, rW, rH, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, false, true)
	end
end

function gangBaseCaptureUpdate(info)
	gangBaseCaptureInfo = info
end

------ сдача экзамена на лицензии
--[[markerls = createMarker(-2426.71240, -641.75635, 131.9694, "cylinder", 1.5, 255, 255, 0, 64)

function markerHit()
    showLicenseDialog()
end
addEventHandler("onClientMarkerHit", markerls, markerHit)]]



function licenseRequest()
	createRequestWindow("Игрок", string.format("Вы готовы сдать экзамен для получения лицензии на оружие?"), source, licenseAccept, licenseDecline)
end

addEvent("onLicenseRequest", true)
addEventHandler("onLicenseRequest", root, licenseRequest)

function licenseAccept()
	destroyRequestWindow()
	showLicenseDialog()
end

addEvent("onLicenseAccept", true)
addEventHandler("onLicenseAccep", root, licenseAccept)

function licenseDecline()
	destroyRequestWindow()
end

addEvent("onLicenseDecline", true)
addEventHandler("onLicenseDecline", root, licenseDecline)

licenseWin1 = nil
licenseMsgWin1 = nil
licenseBtnWin1 = nil


function showLicenseDialog() 
	licenseWin1 = guiCreateWindow(sW/2-150, sH/2-97, 300, 230, "Сдача лицензии", false)
	licenseMsgWin1 = guiCreateLabel(10, 20, 280, 30, "Для чего вам нужно оружие? Выберите правильный ответ", false, licenseWin1)
	guiLabelSetColor(licenseMsgWin1, 255, 255, 255)
	guiLabelSetHorizontalAlign(licenseMsgWin1, "center", true)
	guiLabelSetVerticalAlign(licenseMsgWin1, "center")

	otvet1RadioButton = guiCreateRadioButton(10, 60, 280, 20, "Для самообороны", false, licenseWin1)
	otvet2RadioButton = guiCreateRadioButton(10, 90, 280, 20, "Для коллекции", false, licenseWin1)
	otvet3RadioButton = guiCreateRadioButton(10, 120, 280, 20, "Для совершения преступления", false, licenseWin1)
    guiRadioButtonSetSelected(otvet1RadioButton,true)

	licenseBtnWin1 = guiCreateButton(50, 180, 200, 34, "Далее", false, licenseWin1)
	
	addEventHandler("onClientGUIClick", licenseBtnWin1, license, false)

	guiWindowSetMovable(licenseWin1, false)
	guiWindowSetSizable(licenseWin1, false)
	guiSetInputEnabled(true)
	showCursor(true)
end

licenseWin2 = nil
licenseMsgWin2 = nil
licenseBtnWin2 = nil


function showLicenseDialog2() 
    --guiSetVisible(licenseWin1, false)
	licenseWin2 = guiCreateWindow(sW/2-150, sH/2-97, 300, 230, "Сдача лицензии", false)
	licenseMsgWin2 = guiCreateLabel(10, 20, 280, 30, "Можно ли ходить с оружием в открытом виде? Выберите правильный ответ", false, licenseWin2)
	guiLabelSetColor(licenseMsgWin2, 255, 255, 255)
	guiLabelSetHorizontalAlign(licenseMsgWin2, "center", true)
	guiLabelSetVerticalAlign(licenseMsgWin2, "center")

	otvet4RadioButton = guiCreateRadioButton(10, 60, 280, 20, "Да", false, licenseWin2)
	otvet5RadioButton = guiCreateRadioButton(10, 90, 280, 20, "Нет", false, licenseWin2)
    guiRadioButtonSetSelected(otvet4RadioButton,true)

	licenseBtnWin2 = guiCreateButton(50, 180, 200, 34, "Далее", false, licenseWin2)
	
	addEventHandler("onClientGUIClick", licenseBtnWin2, license2, false)
	--addEventHandler("onClientKey", root, license2, false)

	guiWindowSetMovable(licenseWin2, false)
	guiWindowSetSizable(licenseWin2, false)
	guiSetInputEnabled(true)
	showCursor(true)
end

licenseWin3 = nil
licenseMsgWin3 = nil
licenseBtnWin3 = nil


function showLicenseDialog3() 
	licenseWin3 = guiCreateWindow(sW/2-150, sH/2-97, 300, 230, "Сдача лицензии", false)
	licenseMsgWin3 = guiCreateLabel(10, 20, 280, 30, "Сколько патронов в обойме Colt 45? Выберите правильный ответ", false, licenseWin3)
	guiLabelSetColor(licenseMsgWin3, 255, 255, 255)
	guiLabelSetHorizontalAlign(licenseMsgWin3, "center", true)
	guiLabelSetVerticalAlign(licenseMsgWin3, "center")

	otvet6RadioButton = guiCreateRadioButton(10, 60, 280, 20, "12", false, licenseWin3)
	otvet7RadioButton = guiCreateRadioButton(10, 90, 280, 20, "8", false, licenseWin3)
	otvet8RadioButton = guiCreateRadioButton(10, 120, 280, 20, "17", false, licenseWin3)
    guiRadioButtonSetSelected(otvet4RadioButton,true)

	licenseBtnWin3 = guiCreateButton(50, 180, 200, 34, "Далее", false, licenseWin3)
	
	addEventHandler("onClientGUIClick", licenseBtnWin3, license3, false)

	guiWindowSetMovable(licenseWin3, false)
	guiWindowSetSizable(licenseWin3, false)
	guiSetInputEnabled(false)
end

licenseAnswerTrue = false
licenseAnswer2True = false
licenseAnswer3True = false
function license()
	--if((button == "left") or (button == "enter")) and state then
	
		if (guiRadioButtonGetSelected(otvet1RadioButton)) then
		    licenseAnswerTrue = false
		elseif (guiRadioButtonGetSelected(otvet2RadioButton)) then
			licenseAnswerTrue = true
		elseif (guiRadioButtonGetSelected(otvet3RadioButton)) then
			licenseAnswerTrue = false
		end
		
		if (licenseAnswerTrue == true) then
			guiSetVisible(licenseWin1, false)
            showLicenseDialog2()
		else
		    guiSetText(licenseMsgWin1, "Вы неправильно ответили на вопрос.")
		end
	--end
end

function license2()
	--if((button == "left") or (button == "enter")) and state then
	
		if (guiRadioButtonGetSelected(otvet4RadioButton)) then
		    licenseAnswer2True = false
		elseif (guiRadioButtonGetSelected(otvet5RadioButton)) then
			licenseAnswer2True = true
		end
		
		if (licenseAnswer2True == true) then
			guiSetVisible(licenseWin2, false)
            showLicenseDialog3()
		else
		    guiSetText(licenseMsgWin2, "Вы неправильно ответили на вопрос.")
		end
	--end
end

function license3()
	--if((button == "left") or (button == "enter")) and state then
		
		if (guiRadioButtonGetSelected(otvet6RadioButton)) then
		    licenseAnswer3True = false
		elseif (guiRadioButtonGetSelected(otvet7RadioButton)) then
			licenseAnswer3True = false
		elseif (guiRadioButtonGetSelected(otvet8RadioButton)) then
			licenseAnswer3True = true
		end

        if (licenseAnswer3True == true) then
			guiSetVisible(licenseWin3, false)
			triggerServerEvent("importAmmuRange", resourceRoot, localPlayer)
			--exports.ammushoot:exportToResplayTrigger(localPlayer)
			examLicenseDeleteCursor()
		else
		    msgAdd("Вы не смогли сдать экзамен, попробуйте ещё раз.")
			guiSetVisible(licenseWin3, false)
			examLicenseDeleteCursor()
		end
	--end
	showCursor(false)
end

function examLicenseDeleteCursor()
    removeEventHandler("onClientGUIClick", licenseBtnWin1, license1)
	removeEventHandler("onClientGUIClick", licenseBtnWin2, license2)
	removeEventHandler("onClientGUIClick", licenseBtnWin3, license3)
	showCursor(false)
end

function openStats()
    showCursor(true)
    ResplayPassport = guiCreateWindow(sW/2-150, sH/2-97, 390, 239, "Статистика", false)
    guiWindowSetSizable(ResplayPassport, false)
	
	--local hash = getHash(getPlayerName(localPlayer))
	
	--idPassport = guiCreateLabel(23, 25, 195, 19, "Идентификатор:", false, ResplayPassport)
	--guiSetFont(idPassport, "default-bold-small")

    nicknameText = guiCreateLabel(21, 49, 114, 19, "Ваш никнейм:", false, ResplayPassport)
    guiSetFont(nicknameText, "default-bold-small")
    respectText = guiCreateLabel(21, 77, 120, 17, "Уровень репутации:", false, ResplayPassport)
    guiSetFont(respectText, "default-bold-small")
    weapLicenseText = guiCreateLabel(21, 62, 195, 15, "Лицензия на владение оружием:", false, ResplayPassport)
    guiSetFont(weapLicenseText, "default-bold-small")
    curUsrGrpDraw = guiCreateLabel(21, 90, 120, 20, "Статус/Должность:", false, ResplayPassport)
    guiSetFont(curUsrGrpDraw, "default-bold-small")
    wantedLvlInfo = guiCreateLabel(21, 105, 120, 20, "Уровень розыска:", false, ResplayPassport)
    guiSetFont(wantedLvlInfo, "default-bold-small")
    fractionBLinfo = guiCreateLabel(21, 123, 120, 20, "Общий ЧС фракций:", false, ResplayPassport)
    guiSetFont(fractionBLinfo, "default-bold-small")
	
    closeButton = guiCreateButton(92, 205, 101, 24, "Закрыть", false, ResplayPassport)

	addEventHandler ( "onClientGUIClick", closeButton,
		function ()
			guiSetVisible ( ResplayPassport, false )
			showCursor ( false )
		end,
	false )
	
	local getNickname = getPlayerName(localPlayer)
    local uteam = getPlayerTeam(localPlayer)

	if uteam then
		usergrp = getElementData(localPlayer, "usergroup")
		teamname = getTeamName(uteam)
		
		if(teamname ~= "Граждане") and(usergrp == 10) then
			grpstr = "Клан ["..teamname.."]"
			grpr, grpg, grpb = getTeamColor(uteam)
		else
			grpstr = getElementData(localPlayer, "usergroupname")
			grpr, grpg, grpb = playerGroups[usergrp][2],playerGroups[usergrp][3],playerGroups[usergrp][4]
		end
	end
	
	local deprivedLic = getElementData(localPlayer, "licenseDeprived")
	local licweap = getElementData(localPlayer, "weaponlicense")
	local fractionblacklist = getElementData(localPlayer, "fractionbl")
	

	if licweap == 0 then
	    licwp = "Отсутствует"
		lr, lg, lb = 255, 0, 0
		if deprivedLic > 0 then
	        licwp = "Лишён"
		    lr, lg, lb = 255, 131, 0
	    end
	elseif licweap == 2 then
	    licwp = "Лишён"
		lr, lg, lb = 255, 131, 0
	elseif licweap == 1 then
	    licwp = "Есть"
		lr, lg, lb = 0, 255, 0
	end

    --hashDraw = guiCreateLabel(151, 25, 150, 16, hash, false, ResplayPassport)
    --guiSetFont(hashDraw, "default-bold-small")
    guiSetFont(closeButton, "default-bold-small")
    guiSetProperty(closeButton, "NormalTextColour", "FFF90000")
    nicknameDraw = guiCreateLabel(230, 49, 150, 16, getNickname, false, ResplayPassport)
    guiSetFont(nicknameDraw, "default-bold-small")
    weaponLicense = guiCreateLabel(230, 62, 80, 15, licwp, false, ResplayPassport)
	guiLabelSetColor(weaponLicense, lr, lg, lb)
    guiSetFont(weaponLicense, "default-bold-small")
	
	local respect = getElementData(localPlayer, "respect")
	curRespectStr = string.format("%.2f", respect*100.0).."%"
	local pwanted = getElementData(source, "wantedLevel")
	
    if pwanted and(pwanted < 0) then
	    wantedTex = pwanted
		wntr, wntg, wntb = 255, 0, 0
    elseif pwanted and (pwanted == 0) then
	    wantedTex = "Отсутствует"
		wntr, wntg, wntb = 0, 255, 0
	end
	
    if fractionblaclist == 0 then
	    fbl = "Отсутствует"
		fblr, fblg, fblb = 0, 255, 0
	elseif fractionblacklist == 1 then
	    fbl = "Находится в ОЧС"
		fblr, fblg, fblb = 255, 0, 0
	end
	
    respectDraw = guiCreateLabel(230, 77, 52, 16, curRespectStr, false, ResplayPassport)
    guiSetFont(respectDraw, "default-bold-small")
    curUsrGrp = guiCreateLabel(230, 90, 160, 16, grpstr, false, ResplayPassport)
    guiSetFont(curUsrGrp, "default-bold-small")    
	guiLabelSetColor(curUsrGrp, grpr, grpg, grpb)
    wantedLvl = guiCreateLabel(230, 105, 160, 16, wantedTex, false, ResplayPassport)
    guiSetFont(wantedLvl, "default-bold-small")    
	guiLabelSetColor(wantedLvl, wntr, wntg, wntb)
	fractionbl = guiCreateLabel(230, 122, 160, 16, fbl, false, ResplayPassport)
    guiSetFont(fractionbl, "default-bold-small")    
	guiLabelSetColor(fractionbl, fblr, fblg, fblb)
	
end
addEvent("openMyStats", true)
addEventHandler("openMyStats", root, openStats)

function openResplayPlayerPassport()
    showCursor(true)
    ResplayPassport = guiCreateWindow(sW/2-150, sH/2-97, 390, 239, "Паспорт игрока", false)
    guiWindowSetSizable(ResplayPassport, false)
	
	--local hash = getHash(getPlayerName(source))
	
	--idPassport = guiCreateLabel(23, 25, 195, 19, "Идентификатор:", false, ResplayPassport)
	--guiSetFont(idPassport, "default-bold-small")

    nicknameText = guiCreateLabel(23, 49, 114, 19, "Имя/Фамилия:", false, ResplayPassport)
    guiSetFont(nicknameText, "default-bold-small")
    respectText = guiCreateLabel(21, 82, 120, 17, "Уровень репутации:", false, ResplayPassport)
    guiSetFont(respectText, "default-bold-small")
    weapLicenseText = guiCreateLabel(21, 109, 195, 15, "Лицензия на владение оружием:", false, ResplayPassport)
    guiSetFont(weapLicenseText, "default-bold-small")
    curUsrGrpDraw = guiCreateLabel(21, 138, 120, 20, "Статус/Должность:", false, ResplayPassport)
    guiSetFont(curUsrGrpDraw, "default-bold-small")
    wantedLvlInfo = guiCreateLabel(21, 158, 120, 20, "Уровень розыска:", false, ResplayPassport)
    guiSetFont(wantedLvlInfo, "default-bold-small")
    fractionBLinfo = guiCreateLabel(21, 174, 120, 20, "Общий ЧС фракций:", false, ResplayPassport)
    guiSetFont(fractionBLinfo, "default-bold-small")
	
    closeButton = guiCreateButton(92, 205, 101, 24, "Закрыть", false, ResplayPassport)

	addEventHandler ( "onClientGUIClick", closeButton,
		function ()
			guiSetVisible ( ResplayPassport, false )
			showCursor ( false )
		end,
	false )
	
	local getNickname = getPlayerName(source)
    local uteam = getPlayerTeam(source)

	if uteam then
		usergrp = getElementData(source, "usergroup")
		teamname = getTeamName(uteam)
		
		if(teamname ~= "Граждане") and(usergrp == 10) then
			grpstr = "Клан ["..teamname.."]"
			grpr, grpg, grpb = getTeamColor(uteam)
		else
			grpstr = getElementData(source, "usergroupname")
			grpr, grpg, grpb = playerGroups[usergrp][2],playerGroups[usergrp][3],playerGroups[usergrp][4]
		end
	end
	
	local deprivedLic = getElementData(source, "licenseDeprived")
	local licweap = getElementData(source, "weaponlicense")
	local fractionblacklist = getElementData(source, "fractionbl")

	if licweap == 0 then
	    licwp = "Отсутствует"
		lr, lg, lb = 255, 0, 0
		if deprivedLic > 0 then
	        licwp = "Лишён"
		    lr, lg, lb = 255, 131, 0
	    end
	elseif licweap == 2 then
	    licwp = "Лишён"
		lr, lg, lb = 255, 131, 0
	elseif licweap == 1 then
	    licwp = "Есть"
		lr, lg, lb = 0, 255, 0
	end

    --hashDraw = guiCreateLabel(151, 25, 150, 16, hash, false, ResplayPassport)
    --guiSetFont(hashDraw, "default-bold-small")
    guiSetFont(closeButton, "default-bold-small")
    guiSetProperty(closeButton, "NormalTextColour", "FFF90000")
    nicknameDraw = guiCreateLabel(230, 49, 150, 16, getNickname, false, ResplayPassport)
    guiSetFont(nicknameDraw, "default-bold-small")
    weaponLicense = guiCreateLabel(230, 109, 80, 15, licwp, false, ResplayPassport)
	guiLabelSetColor(weaponLicense, lr, lg, lb)
    guiSetFont(weaponLicense, "default-bold-small")
	
	local pwanted = getElementData(source, "wantedLevel")
	
    if pwanted and(pwanted < 0) then
	    wantedTex = pwanted
		wntr, wntg, wntb = 255, 0, 0
    elseif pwanted and (pwanted == 0) then
	    wantedTex = "Отсутствует"
		wntr, wntg, wntb = 0, 255, 0
	end
	
    if fractionblacklist == 0 then
	    fbl = "Нет"
		fblr, fblg, fblb = 0, 255, 0
	elseif fractionblacklist == 1 then
	    fbl = "Находится в ОЧС"
		fblr, fblg, fblb = 255, 0, 0
	end
	
	local respect = getElementData(source, "respect")
	curRespectStr = string.format("%.2f", respect*100.0).."%"
	
    respectDraw = guiCreateLabel(230, 83, 52, 16, curRespectStr, false, ResplayPassport)
    guiSetFont(respectDraw, "default-bold-small")
    curUsrGrp = guiCreateLabel(230, 138, 160, 16, grpstr, false, ResplayPassport)
    guiSetFont(curUsrGrp, "default-bold-small")    
	guiLabelSetColor(curUsrGrp, grpr, grpg, grpb)
    wantedLvl = guiCreateLabel(230, 158, 160, 16, wantedTex, false, ResplayPassport)
    guiSetFont(wantedLvl, "default-bold-small")    
	guiLabelSetColor(wantedLvl, wntr, wntg, wntb)
	fractionbl = guiCreateLabel(230, 174, 160, 16, fbl, false, ResplayPassport)
    guiSetFont(fractionbl, "default-bold-small")    
	guiLabelSetColor(fractionbl, fblr, fblg, fblb)
end
addEvent("onResplayPassport", true)
addEventHandler("onResplayPassport", root, openResplayPlayerPassport)

function playerPoliceDb()
    showCursor(true)
    policeDb = guiCreateWindow(sW/2-150, sH/2-97, 390, 239, "Информация", false)
    guiWindowSetSizable(policeDb, false)
	
	--local hash = getHash(getPlayerName(source))
	
	--idPassport = guiCreateLabel(23, 25, 195, 19, "Идентификатор:", false, policeDb)
	--guiSetFont(idPassport, "default-bold-small")

    nicknameText = guiCreateLabel(23, 49, 114, 19, "Имя/Фамилия:", false, policeDb)
    guiSetFont(nicknameText, "default-bold-small")
    respectText = guiCreateLabel(21, 82, 120, 17, "Уровень репутации:", false, policeDb)
    guiSetFont(respectText, "default-bold-small")
    weapLicenseText = guiCreateLabel(21, 109, 195, 15, "Лицензия на владение оружием:", false, policeDb)
    guiSetFont(weapLicenseText, "default-bold-small")
    curUsrGrpDraw = guiCreateLabel(21, 138, 120, 20, "Статус/Должность:", false, policeDb)
    guiSetFont(curUsrGrpDraw, "default-bold-small")
    closeButton = guiCreateButton(92, 205, 101, 24, "Закрыть", false, policeDb)
    wantedLvlInfo = guiCreateLabel(21, 158, 120, 20, "Уровень розыска:", false, policeDb)
    guiSetFont(wantedLvlInfo, "default-bold-small")
    fractionBLinfo = guiCreateLabel(21, 174, 120, 20, "Общий ЧС фракций:", false, policeDb)
    guiSetFont(fractionBLinfo, "default-bold-small")

	addEventHandler ( "onClientGUIClick", closeButton,
		function ()
			guiSetVisible ( policeDb, false )
			showCursor ( false )
		end,
	false )
	
	local getNickname = getPlayerName(source)
    local uteam = getPlayerTeam(source)

	if uteam then
		usergrp = getElementData(source, "usergroup")
		teamname = getTeamName(uteam)
		
		if(teamname ~= "Граждане") and(usergrp == 10) then
			grpstr = "Клан ["..teamname.."]"
			grpr, grpg, grpb = getTeamColor(uteam)
		else
			grpstr = getElementData(source, "usergroupname")
			grpr, grpg, grpb = playerGroups[usergrp][2],playerGroups[usergrp][3],playerGroups[usergrp][4]
		end
	end
	
	local deprivedLic = getElementData(source, "licenseDeprived")
	local licweap = getElementData(source, "weaponlicense")
	local fractionblacklist = getElementData(source, "fractionbl")

	if licweap == 0 then
	    licwp = "Отсутствует"
		lr, lg, lb = 255, 0, 0
		if deprivedLic > 0 then
	        licwp = "Лишён"
		    lr, lg, lb = 255, 131, 0
	    end
	elseif licweap == 2 then
	    licwp = "Лишён"
		lr, lg, lb = 255, 131, 0
	elseif licweap == 1 then
	    licwp = "Есть"
		lr, lg, lb = 0, 255, 0
	end

    --hashDraw = guiCreateLabel(151, 25, 150, 16, hash, false, policeDb)
    --guiSetFont(hashDraw, "default-bold-small")
    guiSetFont(closeButton, "default-bold-small")
    guiSetProperty(closeButton, "NormalTextColour", "FFF90000")
    nicknameDraw = guiCreateLabel(230, 49, 150, 16, getNickname, false, policeDb)
    guiSetFont(nicknameDraw, "default-bold-small")
    weaponLicense = guiCreateLabel(230, 109, 80, 15, licwp, false, policeDb)
	guiLabelSetColor(weaponLicense, lr, lg, lb)
    guiSetFont(weaponLicense, "default-bold-small")
	
	local respect = getElementData(source, "respect")
	curRespectStr = string.format("%.2f", respect*100.0).."%"
	
	local pwanted = getElementData(source, "wantedLevel")
	
    if pwanted and(pwanted < 0) then
	    wantedTex = pwanted
		wntr, wntg, wntb = 255, 0, 0
    elseif pwanted and (pwanted == 0) then
	    wantedTex = "Отсутствует"
		wntr, wntg, wntb = 0, 255, 0
	end
	
    if fractionblacklist == 0 then
	    fbl = "Нет"
		fblr, fblg, fblb = 0, 255, 0
	elseif fractionblacklist == 1 then
	    fbl = "Находится в ОЧС"
		fblr, fblg, fblb = 255, 0, 0
	end
	
    respectDraw = guiCreateLabel(230, 83, 52, 16, curRespectStr, false, policeDb)
    guiSetFont(respectDraw, "default-bold-small")
    curUsrGrp = guiCreateLabel(230, 138, 160, 16, grpstr, false, policeDb)
    guiSetFont(curUsrGrp, "default-bold-small")    
	guiLabelSetColor(curUsrGrp, grpr, grpg, grpb)
    wantedLvl = guiCreateLabel(230, 158, 160, 16, wantedTex, false, policeDb)
    guiSetFont(wantedLvl, "default-bold-small")    
	guiLabelSetColor(wantedLvl, wntr, wntg, wntb)
	fractionbl = guiCreateLabel(230, 174, 160, 16, fbl, false, policeDb)
    guiSetFont(fractionbl, "default-bold-small")    
	guiLabelSetColor(fractionbl, fblr, fblg, fblb)
end
addEvent("onPlayerPoliceDb", true)
addEventHandler("onPlayerPoliceDb", root, playerPoliceDb)

-- гости в доме
function houseSound(hx, hy, hz)
    --[[local hx, hy, hz = getElementPosition(localPlayer)]]
	local hsound = playSound3D("audio/zvonok.ogg", hx, hy, hz)
    setSoundVolume(hsound, 0.5)
    setSoundMaxDistance(hsound, 8)
end
addEvent("onHouseSound", true)
addEventHandler("onHouseSound", root, houseSound)

function inHouseSound(hint, hix, hiy, hiz, dimid)
    --[[local hx, hy, hz = getElementPosition(localPlayer)]]
	local ihsound = playSound3D("audio/zvonok.ogg", hix, hiy, hiz)
	setElementInterior(ihsound, hint, hix, hiy, hiz)
	setElementDimension(ihsound, dimid)
    setSoundVolume(ihsound, 0.5)
    setSoundMaxDistance(ihsound, 35)
end
addEvent("onInHouseSound", true)
addEventHandler("onInHouseSound", root, inHouseSound)

houseGuestId = nil
hdimensionId = nil

function houseGuestRequest(houseid, dimension)
	if houseid then
	    createRequestWindow("дом", string.format("%s Приглашает вас в свой дом, войти?", getPlayerName(source)), source, houseGuestAccept, houseGuestDecline)
		houseGuestId = houseid
		hdimensionId = dimension
	end
end
addEvent("onHouseGuestRequest", true)
addEventHandler("onHouseGuestRequest", root, houseGuestRequest)

function houseGuestAccept()
	destroyRequestWindow()
	triggerServerEvent("onHouseGuestAccept", resourceRoot, localPlayer, houseGuestId, hdimensionId)
end

function houseGuestDecline()
	destroyRequestWindow()
end


addEvent("onSaNewsShow", true)
addEvent("onSkinChooser", true)
addEvent("onReceiveRegisterCheck", true)
addEvent("onRegisterFinished", true)
addEvent("onReceiveHash", true)
addEvent("onReceiveAssigned", true)
addEvent("onReceiveUserData", true)
addEvent("onProcessUserData", true)
addEvent("onReceiveActionsList", true)
addEvent("onIntroStarts", true)
addEvent("onUpdateMemoryMonitor", true)
addEvent("onJobStart", true)
addEvent("onJobEnd", true)
addEvent("onJobProgress", true)
addEvent("onJobTrashmasterUnload", true)
addEvent("onJobTrashmasterLeaveVehicle", true)
addEvent("onJobTrashmasterBackToVehicle", true)
addEvent("onJobWashroadsLeaveVehicle", true)
addEvent("onJobWashroadsBackToVehicle", true)
addEvent("onJobLawnmowBeginLawn", true)
addEvent("onJobLawnmowLeaveVehicle", true)
addEvent("onJobLawnmowBackToVehicle", true)
addEvent("onServerPlaySFX3D", true)
addEvent("onServerPlaySound3D", true)
addEvent("onCreateProgressPopup", true)
addEvent("onJobEvacuatorRequestFinishOrder", true)
addEvent("onJobEvacuatorLeaveVehicle", true)
addEvent("onJobEvacuatorBackToVehicle", true)
addEvent("onJobTruckerLeaveVehicle", true)
addEvent("onJobTruckerLeaveTrailer", true)
addEvent("onJobTruckerBackToVehicle", true)
addEvent("onJobFarmLeaveVehicle", true)
addEvent("onJobFarmBackToVehicle", true)
addEvent("onJobFarm2LeaveVehicle", true)
addEvent("onJobFarm2LeaveTrailer", true)
addEvent("onJobFarm2BackToVehicle", true)
addEvent("onServerMsgAdd", true)
addEvent("onFriendReceiveAdd", true)
addEvent("onFriendAdd", true)
addEvent("onFriendDel", true)
addEvent("onFriendsLoad", true)
addEvent("onCarSellUpdate", true)
addEvent("onJobTruckerUpdate", true)
addEvent("onServerSetControlState", true)
addEvent("onBusesUpdate", true)
addEvent("onServerCreateEffect", true)
addEvent("onServerDestroyAttachedEffects", true)
addEvent("onLuckyPhoneRing", true)
addEvent("onLuckyPhoneWin", true)
addEvent("onDebugDrawHouses", true)
addEvent("onElementGhostMode", true)
addEvent("onCarTuneEnter", true)
addEvent("onInventoryUpdateSlot", true)
addEvent("onHouseEnter", true)
addEvent("onHouseExit", true)
addEvent("onAmmuEnter", true)
addEvent("onAmmuExit", true)
addEvent("onAmmuOpenMenu", true)
addEvent("onEatEnter", true)
addEvent("onEatExit", true)
addEvent("onRaceEnter", true)
addEvent("onRaceExit", true)
addEvent("onRaceUpdateInfo", true)
addEvent("onRaceStart", true)
addEvent("onBoomboxUpdate", true)
addEvent("onBoomboxSwitch", true)
addEvent("onBoomboxRemove", true)
addEvent("onSaveHouseSet", true)
addEvent("onSaveHouseDestroy", true)
addEvent("onFerrisWheelEnter", true)
addEvent("onFerrisWheelExit", true)
addEvent("onGangHelp", true)
addEvent("onOtbEnter", true)
addEvent("onOtbExit", true)
addEvent("onMilitaryBaseAlarm", true)
addEvent("onMilitaryCargoUpdate", true)
addEvent("onMilitaryGeneralLeaveVehicle", true)
addEvent("onMilitaryGeneralBackToVehicle", true)
addEvent("onMilitaryGeneralArrive", true)
addEvent("onOtbWin", true)
addEvent("onJobFarmEnterCp", true)
addEvent("onWorkEnterCp", true)
addEvent("onJobTaxiLeaveVehicle", true)
addEvent("onJobTaxiBackToVehicle", true)
addEvent("onFriendPMReceive", true)
addEvent("onFriendPMSuccess", true)
addEvent("onChangePassFinished", true)
addEvent("onTutorialShow", true)
addEvent("onPlayerIncDrunkiness", true)
addEvent("onTaxiOrderCreate", true)
addEvent("onPoliceOrderCreate", true)
addEvent("onAmbOrderCreate", true)
addEvent("onPlayerMoneyChange", true)
addEvent("onJobTruckerStartReturn", true)
addEvent("onJobTruckerFinishReturn", true)
addEvent("onPlayerTaxiCarsUpdate", true)
addEvent("onAmbulanceRequest", true)
addEvent("onEvacOrderCreate", true)
addEvent("onEvacuatorFillRequest", true)
addEvent("onEvacuatorFixRequest", true)
addEvent("onTaxiUse", true)
addEvent("onTaxiCreateMarker", true)
addEvent("onTaxiRemoveMarker", true)
addEvent("onLowriderMusicStart", true)
addEvent("onLowriderMusicStop", true)
addEvent("onLowriderSetScores", true)
addEvent("onLowriderWait", true)
addEvent("onLowriderStart", true)
addEvent("onLowriderFinish", true)
addEvent("onPoliceBackup", true)
addEvent("onAvailableWorkShow", true)
addEvent("onAnimMenuShow", true)
addEvent("onFakeExplosion", true)
addEvent("onRCStart", true)
addEvent("onRCStop", true)
addEvent("onJobFoodBackToVehicle", true)
addEvent("onJobFoodLeaveVehicle", true)
addEvent("onJobFoodUpdate", true)
addEvent("onDerbyEnter", true)
addEvent("onDerbyStart", true)
addEvent("onDerbyLeave", true)
addEvent("onDerbyLobbyUpdate", true)
addEvent("onDerbyWin", true)
addEvent("onReportShow", true)
addEvent("onTrainSync", true)
addEvent("onReceivePoliceMessage", true)
addEvent("onCrimeCreateBlip", true)
addEvent("onCrimeDestroyBlip", true)
addEvent("onThinkBubbleCreate", true)
addEvent("onPlayerReceiveFace", true)
addEvent("onPlayerCustomWalkOpen", true)
addEvent("onPlayerCustomFightOpen", true)
addEvent("onDonateOpen", true)
addEvent("onChatMessageRender", true)
addEvent("onGpsOpen", true)
addEvent("onClanBaseConstructionStart", true)
addEvent("onClanBaseConstructionStop", true)
addEvent("onClanOpenMenu", true)
addEvent("onClanCloseMenu", true)
addEvent("onClanInfoUpdate", true)
addEvent("onClanBaseGeneratorUpdate", true)
addEvent("onClanBaseAlarmUpdate", true)
addEvent("onClanBaseCaptureUpdate", true)
addEvent("onSuccessMusicPlay", true)
addEvent("onEventsLogOpen", true)
addEvent("onQueryAsk", true)
addEvent("onClanBaseMenu", true)
addEvent("onReportsOpen", true)
addEvent("onReportsUpdate", true)
addEvent("onQuestionOpen", true)
addEvent("onQuestionUpdate", true)
addEvent("onAnswerOpen", true)
addEvent("onAnswerClose", true)
addEvent("onColorWindowSelect")
addEvent("onColorWindowCancel")
addEvent("onColorWindowChange")
addEvent("onPickupTextUpdate", true)
addEvent("onPlayerTeamChat", true)
addEvent("onKillOrderFound", true)
addEvent("onFineRequest", true)
addEvent("onBusStopsUpdate", true)
addEvent("onStealOpenStart", true)
addEvent("onStealOpenUpdate", true)
addEvent("onStealOpenStop", true)
addEvent("onStealCarStart", true)
addEvent("onStealCarUpdate", true)
addEvent("onStealCarStop", true)
addEvent("onSpecialEventCreate", true)
addEvent("onSpecialEventTriggerWindow", true)
addEvent("onSpecialEventUpdateInfo", true)
addEvent("onSpecialEventDestroy", true)
addEvent("onFractionOpenMenu", true)
addEvent("onFractionCloseMenu", true)
addEvent("onFractionRefreshMenu", true)
addEvent("onVehicleSellRequest", true)
addEvent("onHouseSellRequest", true)
addEvent("onCriminalActivityNew", true)
addEvent("onCriminalActivityDestroy", true)
addEvent("onChatBubbleSetState", true)
addEvent("onChangeNicknameResult", true)
addEvent("onAttachCarObjects", true)
addEvent("onPlayerLookAt", true)
addEvent("onMissionTitleShow", true)
addEvent("onPlaceShow", true)
addEvent("onCameraMove", true)
addEvent("onResplayMessagesToggle", true)
addEvent("onWeatherSnow", true)
addEvent("onEventModeSwitch", true)
addEvent("onPlayerFurnitureSelect", true)
addEvent("onPlayerFurnitureRemove", true)
addEvent("onMessageBox", true)
addEvent("onWeaponDataSync", true)
addEventHandler("onClientResourceStart", resourceRoot, startIntro)
addEventHandler("onReceiveRegisterCheck", root, receiveRegisterCheck)
addEventHandler("onRegisterFinished", root, finishRegistration)
addEventHandler("onReceiveActionsList", root, receiveActionsList)
addEventHandler("onUpdateMemoryMonitor", root, updateMemoryMonitor)
addEventHandler("onJobStart", root, startJob)
addEventHandler("onJobEnd", root, endJob)
addEventHandler("onJobTrashmasterUnload", root, jobTrashmasterUnload)
addEventHandler("onJobTrashmasterLeaveVehicle", root, jobTrashmasterLeaveVehicle)
addEventHandler("onJobTrashmasterBackToVehicle", root, jobTrashmasterBackToVehicle)
addEventHandler("onJobWashroadsLeaveVehicle", root, jobWashroadsLeaveVehicle)
addEventHandler("onJobWashroadsBackToVehicle", root, jobWashroadsBackToVehicle)
addEventHandler("onJobLawnmowLeaveVehicle", root, jobLawnmowLeaveVehicle)
addEventHandler("onJobLawnmowBackToVehicle", root, jobLawnmowBackToVehicle)
addEventHandler("onServerPlaySFX3D", root, serverPlaySFX3D)
addEventHandler("onServerPlaySound3D", root, serverPlaySound3D)
addEventHandler("onClientPlayerWasted", localPlayer, playerWasted)
addEventHandler("onClientPlayerWasted", root, otherPlayerWasted)
addEventHandler("onCreateProgressPopup", root, createProgressPopup)
addEventHandler("onJobLawnmowBeginLawn", root, jobLawnmowBeginLawn)
addEventHandler("onJobEvacuatorLeaveVehicle", root, jobEvacuatorLeaveVehicle)
addEventHandler("onJobEvacuatorBackToVehicle", root, jobEvacuatorBackToVehicle)
addEventHandler("onJobEvacuatorRequestFinishOrder", root, jobEvacuatorRequestFinishOrder)
addEventHandler("onJobTruckerLeaveVehicle", root, jobTruckerLeaveVehicle)
addEventHandler("onJobTruckerLeaveTrailer", root, jobTruckerLeaveTrailer)
addEventHandler("onJobTruckerBackToVehicle", root, jobTruckerBackToVehicle)
addEventHandler("onServerMsgAdd", root, function(text, tTime)
											if(source ~= resourceRoot) or resplayMessagesEnabled then
												msgAdd(text, tTime)
											end
										end)
addEventHandler("onFriendReceiveAdd", root, receiveFriendRequest)
addEventHandler("onFriendAdd", root, addFriend)
addEventHandler("onFriendDel", root, delFriend)
addEventHandler("onFriendsLoad", root, loadFriends)
addEventHandler("onClientPlayerSpawn", root, clientNewPlayerSpawn)
addEventHandler("onCarSellUpdate", root, carSellClientUpdate)
addEventHandler("onJobTruckerUpdate", root, jobTruckerClientUpdate)
addEventHandler("onServerSetControlState", root, function(scontrol, sstate)
													setPedAnalogControlState(source, scontrol, sstate)
												 end)
addEventHandler("onBusesUpdate", root, function(newtbl)
										buses = newtbl
									   end)
addEventHandler("onClientPreRender", root,
	function()
		for fx, info in pairs(attachedEffects) do
			px, py, pz = getPositionFromElementOffset(info.element, info.pos.x, info.pos.y, info.pos.z)
			setElementPosition(fx, px, py, pz)
		end
	end)

addEventHandler("onSkinChooser", root, enableSkinChooser)
addEventHandler("onServerCreateEffect", root, serverCreateEffect)
addEventHandler("onServerDestroyAttachedEffects", root, serverDestroyAttachedEffects)
addEventHandler("onLuckyPhoneRing", root, luckyPhoneRing)
addEventHandler("onLuckyPhoneWin", root, luckyPhoneWin)
addEventHandler("onElementGhostMode", root, setElementGhostMode)
addEventHandler("onCarTuneEnter", root, carTuneEnter)
addEventHandler("onDebugDrawHouses", root, function(houses)
											debugHouses = houses
											addEventHandler("onClientPreRender", root, debugDrawHouses)
										   end)
addEventHandler("onInventoryUpdateSlot", root, inventoryUpdateSlot)
addEventHandler("onHouseEnter", root, houseEnter)
addEventHandler("onHouseExit", root, houseExit)
addEventHandler("onAmmuEnter", root, ammuEnter)
addEventHandler("onAmmuExit", root, ammuExit)
addEventHandler("onAmmuOpenMenu", root, ammuOpenMenu)
addEventHandler("onEatEnter", root, eatEnter)
addEventHandler("onEatExit", root, eatExit)
addEventHandler("onClientRender", root, uniqueJumpProcess)
addEventHandler("onRaceEnter", root, raceEnter)
addEventHandler("onRaceUpdateInfo", root, raceUpdateInfo)
addEventHandler("onRaceExit", root, raceExit)
addEventHandler("onRaceStart", root, raceStart)
--addEventHandler("onClientRender", root, processBoombox)
addEventHandler("onBoomboxUpdate", root, updateBoombox)
addEventHandler("onBoomboxSwitch", root, switchBoombox)
addEventHandler("onBoomboxRemove", root, removeBoombox)
addEventHandler("onClientVehicleEnter", root, vehicleEnterExit)
addEventHandler("onClientVehicleExit", root, vehicleEnterExit)
addEventHandler("onJobFarmLeaveVehicle", root, jobFarmLeaveVehicle)
addEventHandler("onJobFarmBackToVehicle", root, jobFarmBackToVehicle)
addEventHandler("onJobFarm2LeaveVehicle", root, jobFarm2LeaveVehicle)
addEventHandler("onJobFarm2LeaveTrailer", root, jobFarm2LeaveTrailer)
addEventHandler("onJobFarm2BackToVehicle", root, jobFarm2BackToVehicle)
addEventHandler("onSaveHouseSet", root, saveHouseSet)
addEventHandler("onSaveHouseDestroy", root, saveHouseDestroy)
addEventHandler("onFerrisWheelEnter", root, ferrisWheelEnter)
addEventHandler("onFerrisWheelExit", root, ferrisWheelExit)
addEventHandler("onClientPedDamage", root, pedDamage)
addEventHandler("onGangHelp", root, gangHelpNew)
addEventHandler("onClientPreRender", root, gangHelpProcess)
addEventHandler("onOtbEnter", root, otbEnter)
addEventHandler("onOtbExit", root, otbExit)
addEventHandler("onClientPlayerWeaponFire", localPlayer, playerShoot)
addEventHandler("onMilitaryBaseAlarm", root, militaryBaseAlarm)
addEventHandler("onMilitaryCargoUpdate", root, militaryCargoUpdate)
addEventHandler("onClientPreRender", root, militaryCargoRender)
addEventHandler("onMilitaryGeneralLeaveVehicle", root, militaryGeneralLeaveVehicle)
addEventHandler("onMilitaryGeneralBackToVehicle", root, militaryGeneralBackToVehicle)
addEventHandler("onMilitaryGeneralArrive", root, militaryGeneralArrive)
addEventHandler("onOtbWin", root, otbWin)
addEventHandler("onJobFarmEnterCp", root, jobEnterCp)
addEventHandler("onWorkEnterCp", root, jobEnterCp)
addEventHandler("onJobTaxiLeaveVehicle", root, jobTaxiLeaveVehicle)
addEventHandler("onJobTaxiBackToVehicle", root, jobTaxiBackToVehicle)
addEventHandler("onFriendPMReceive", root, friendPMReceive)
addEventHandler("onFriendPMSuccess", root, friendPMSuccess)
addEventHandler("onChangePassFinished", root, finishChangePass)
addEventHandler("onTutorialShow", root, browserOpen)
addEventHandler("onPlayerIncDrunkiness", root, drunkInc)
addEventHandler("onTaxiOrderCreate", root, taxiOrderCreate)
addEventHandler("onAmbOrderCreate", root, ambOrderCreate)
addEventHandler("onPoliceOrderCreate", root, polOrderCreate)
addEventHandler("onPlayerMoneyChange", root, moneyChange)
addEventHandler("onClientRender", root, moneyChangeRender)
addEventHandler("onJobTruckerStartReturn", root, jobTruckerOnStartReturn)
addEventHandler("onJobTruckerFinishReturn", root, jobTruckerOnFinishReturn)
addEventHandler("onPlayerTaxiCarsUpdate", root, taxiCarsUpdate)
addEventHandler("onAmbulanceRequest", root, ambulanceRequest)
addEventHandler("onEvacOrderCreate", root, evacOrderCreate)
addEventHandler("onEvacuatorFillRequest", root, evacuatorFillRequest)
addEventHandler("onEvacuatorFixRequest", root, evacuatorFixRequest)
addEventHandler("onClientPlayerDamage", localPlayer, playerDamage)
addEventHandler("onTaxiUse", root, taxiUse)
addEventHandler("onTaxiCreateMarker", root, taxiCreateMarker)
addEventHandler("onTaxiRemoveMarker", root, taxiRemoveMarker)
addEventHandler("onLowriderSetScores", root, lowriderSetScores)
addEventHandler("onLowriderMusicStart", root, lowriderMusicStart)
addEventHandler("onLowriderMusicStop", root, lowriderMusicStop)
addEventHandler("onLowriderWait", root, lowriderWait)
addEventHandler("onLowriderStart", root, lowriderStart)
addEventHandler("onLowriderFinish", root, lowriderFinish)
addEventHandler("onPoliceBackup", root, policeBackup)
addEventHandler("onAvailableWorkShow", root, availableWorkShow)
addEventHandler("onAnimMenuShow", root, animShowMenu)
addEventHandler("onFakeExplosion", root, fakeExplosion)
addEventHandler("onRCStart", root, rcStart)
addEventHandler("onRCStop", root, rcStop)
addEventHandler("onJobFoodLeaveVehicle", root, jobFoodLeaveVehicle)
addEventHandler("onJobFoodBackToVehicle", root, jobFoodBackToVehicle)
addEventHandler("onJobFoodUpdate", root, jobFoodUpdate)
addEventHandler("onClientRender", root, jobFoodRender)
addEventHandler("onDerbyEnter", root, derbyEnter)
addEventHandler("onDerbyStart", root, derbyStart)
addEventHandler("onDerbyLeave", root, derbyLeave)
addEventHandler("onDerbyLobbyUpdate", root, derbyLobbyUpdate)
addEventHandler("onDerbyWin", root, derbyWin)
addEventHandler("onReportShow", root, reportShow)
addEventHandler("onClientVehicleDamage", root, vehicleDamage)
addEventHandler("onReceivePoliceMessage", root, receivePoliceMessage)
addEventHandler("onCrimeCreateBlip", root, crimeCreateBlip)
addEventHandler("onCrimeDestroyBlip", root, crimeDestroyBlip)
addEventHandler("onThinkBubbleCreate", root, thinkBubbleAdd)
addEventHandler("onClientPreRender", root, thinkBubbleDraw)
--addEventHandler("onClientRender", root, flyAbilityProcess)
addEventHandler("onPlayerReceiveFace", root, receiveFace)
addEventHandler("onPlayerCustomWalkOpen", root, customWalkMenuOpen)
addEventHandler("onPlayerCustomFightOpen", root, customFightMenuOpen)
addEventHandler("onDonateOpen", root, donateOpen)
addEventHandler("onClientRender", root, chatMsgRender)
addEventHandler("onChatMessageRender", root, chatMsgAdd)
addEventHandler("onGpsOpen", root, gpsOpen)
addEventHandler("onClanBaseConstructionStart", root, clanBaseConstructionStart)
addEventHandler("onClanBaseConstructionStop", root, clanBaseConstructionFinish)
addEventHandler("onClanOpenMenu", root, clanOpenMenu)
addEventHandler("onClanCloseMenu", root, clanCloseMenu)
addEventHandler("onClanInfoUpdate", root, clanInfoUpdate)
addEventHandler("onClanBaseGeneratorUpdate", root, clanBaseGeneratorUpdate)
addEventHandler("onClientRender", root, clanBaseGeneratorProcess)
addEventHandler("onClanBaseAlarmUpdate", root, clanBaseAlarmUpdate)
addEventHandler("onClientRender", root, clanBaseAlarmProcess)
addEventHandler("onClanBaseCaptureUpdate", root, clanBaseCaptureUpdate)
addEventHandler("onClientRender", root, clanBaseCaptureRender)
addEventHandler("onSuccessMusicPlay", root, playSuccessMusic)
addEventHandler("onEventsLogOpen", root, eventsLogOpen)
addEventHandler("onQueryAsk", root, queryOpen)
addEventHandler("onClanBaseMenu", root, clanBaseMenuOpen)
addEventHandler("onReportsOpen", root, reportOpen)
addEventHandler("onReportsUpdate", root, reportUpdate)
addEventHandler("onQuestionOpen", root, questionOpen)
addEventHandler("onQuestionUpdate", root, questionUpdate)
addEventHandler("onAnswerOpen", root, answerOpen)
addEventHandler("onAnswerClose", root, answerClose)
addEventHandler("onPickupTextUpdate", root, updatePickupText)
addEventHandler("onPlayerTeamChat", root, playerTeamChat)
addEventHandler("onKillOrderFound", root, killOrderFound)
addEventHandler("onFineRequest", root, fineRequest)
addEventHandler("onBusStopsUpdate", root, busStopsUpdate)
addEventHandler("onStealOpenStart", root, gangsterStealOpenStart)
addEventHandler("onStealOpenUpdate", root, gangsterStealOpenUpdate)
addEventHandler("onStealOpenStop", root, gangsterStealOpenStop)
addEventHandler("onStealCarStart", root, gangsterStealCarStart)
addEventHandler("onStealCarUpdate", root, gangsterStealCarUpdate)
addEventHandler("onStealCarStop", root, gangsterStealCarStop)
addEventHandler("onSpecialEventCreate", root, specialEventCreate)
addEventHandler("onSpecialEventTriggerWindow", root, specialEventTriggerWindow)
addEventHandler("onSpecialEventUpdateInfo", root, specialEventUpdate)
addEventHandler("onSpecialEventDestroy", root, specialEventDestroy)
addEventHandler("onFractionOpenMenu", root, fractionOpenMenu)
addEventHandler("onFractionCloseMenu", root, fractionCloseMenu)
addEventHandler("onFractionRefreshMenu", root, fractionRefreshMenu)
addEventHandler("onVehicleSellRequest", root, vehicleSellRequest)
addEventHandler("onHouseSellRequest", root, houseSellRequest)
addEventHandler("onCriminalActivityNew", root, criminalActivityNew)
addEventHandler("onClientRender", root, criminalActivityProc)
addEventHandler("onCriminalActivityDestroy", root, criminalActivityDestroy)
addEventHandler("onChatBubbleSetState", root, chatBubbleSetState)
addEventHandler("onChangeNicknameResult", root, changeNicknameResult)
addEventHandler("onAttachCarObjects", root, attachCarObjects)
addEventHandler("onClientVehicleExplode", root, removeCarObjects)
addEventHandler("onClientElementDestroy", root, removeCarObjects)
addEventHandler("onClientPlayerQuit", root, clientPlayerQuit)
addEventHandler("onClientRender", root, banHammerRender)
addEventHandler("onPlayerLookAt", root, receiveLookPoint)
addEventHandler("onMissionTitleShow", resourceRoot, missionTitleShow, false)
addEventHandler("onClientRender", root, missionTitleRender, false)
addEventHandler("onPlaceShow", resourceRoot, showPlace, false)
addEventHandler("onClientRender", root, renderPlace, false)
addEventHandler("onCameraMove", resourceRoot, moveCamera, false)
addEventHandler("onClientRender", root, renderMoveCamera, false)
addEventHandler("onResplayMessagesToggle", resourceRoot, toggleResplayMessages, false)
addEventHandler("onWeatherSnow", resourceRoot, weatherSnow, false)
addEventHandler("onClientVehicleCollision", root, vehicleCollision)
addEventHandler("onEventModeSwitch", resourceRoot, eventModeSwitch, false)
addEventHandler("onClientElementDataChange", root, elemDataChange)
addEventHandler("onPlayerFurnitureSelect", resourceRoot, furnitureSelect, false)
addEventHandler("onPlayerFurnitureRemove", resourceRoot, furnitureRemove, false)
addEventHandler("onMessageBox", resourceRoot, messageBox, false)
addEventHandler("onWeaponDataSync", resourceRoot, weaponDataSync, false)
addEventHandler("onSaNewsShow", root, saNewsShow)
addEvent("onGangOpenMenu", true)
addEvent("onGangCloseMenu", true)
addEvent("onGangRefreshMenu", true)
addEvent("onGangBaseCaptureUpdate", true)
addEventHandler("onGangOpenMenu", root, gangOpenMenu)
addEventHandler("onGangCloseMenu", root, gangCloseMenu)
addEventHandler("onGangRefreshMenu", root, gangRefreshMenu)
addEventHandler("onClientRender", root, gangBaseCaptureRender)
addEventHandler("onGangBaseCaptureUpdate", root, gangBaseCaptureUpdate)

setTimer(collectgarbage, 200, 0, "collect")

addEventHandler("onClientPlayerWeaponFire", getRootElement(), 
function(weapon, ammo, ammoInClip) 
                local x,y,z = getElementPosition(source)
				
				if weapon == 38 then 
					local sound = playSound3D("audio/m60.wav", x,y,z)  
					setSoundMaxDistance(sound,75) 
					setSoundVolume(sound, gameSoundVolume)
        end 
    end 
)

-- отключаем стандартные звуки для минигана
setWorldSoundEnabled(5, 11, false) --  
setWorldSoundEnabled(5, 12, false) --  
setWorldSoundEnabled(5, 13, false) --  
setWorldSoundEnabled(5, 14, false) --  
setWorldSoundEnabled(5, 15, false) --  
setWorldSoundEnabled(5, 16, false) --  
setWorldSoundEnabled(5, 63, false) --  