﻿------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--  RIGHTS:      All rights reserved by developer
--  FILE:        adminPanel/main_c.lua
--  DEVELOPER:   Prime aka Kunal
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

local warpLocations =
{
	-- To add/remove warp points (which you can access by pressing the WP button on the admin panel)
	-- {"Location Name", x, y, z}
	{"Админ Зона", 2297.30004882, -1744.8000488281, 10934.700195313},
	{"ЛСПД", 1553.33386, -1675.62659, 16.19531},
	{"СФПД", -1609.64209, 721.52875, 12.71494},
	{"ЛВПД", 2289.88501, 2424.00708, 10.82031},
	{"Зона69", 200.09132, 1903.70801, 17.64063},
	{"ЖДЛС", 1789.86902, -1920.16687, 13.39249},
	{"СФА", -1504.91150, 469.89438, 7.18750},
	{"ЛВА", 2569.52075, 2733.48071, 10.82031},
	{"ЛСА", 2210.90991, -2230.49146, 13.54688},
	{"ЛС Спавн", 1684.59, -2330.5, 13.5},
	{"ЛВ спавн", 1696.09204, 1446.93787, 10.76214},
	{"СФ спавн", -1424.84937, -289.44647, 14.14844},
    {"Больница СФ", -2653.91455, 630.82819, 14.45313},
	{"Больница ЛВ", 1606.09155, 1833.11658, 10.82031},
	{"Больница ЛС (Гетто)", 2030.11707, -1418.52393, 16.99219},
	{"Больница ЛС (Центр)", 1188.76685, -1329.05750, 13.56036},
	{"Автосалон СФ (Верх)", -1638.85522, 1205.20691, 7.17969},
	{"Автосалон СФ (Низ)", -1977.44800, 298.17950, 35.17188},
	{"Автосалон ЛС (Гетто)", 2125.95605, -1119.43262, 25.35768},
	{"Автосалон ЛС (Центр)", 559.80945, -1253.17261, 17.16562},
	{"Автосалон ЛВ (Большегрузных)", 2161.39697, 1391.72192, 10.82031},
	{"Пирс СФ", -2931.98877, 467.20834, 4.90657},
	{"Пирс ЛС", 834.33875, -2008.67969, 12.86719},
	{"Ферма ЛВ (у карьера)", 517.81952, 1122.53735, 15.11378},
	{"Ком.Службы (ЛС)", 2001.50281, -2061.49561, 13.54688},
	{"SaNews", 644.55603, -1358.25122, 13.57528},
	{"Аэропорт ЛВ", 1642.99548, 1596.81482, 10.82031},
	{"Аэропорт ЛС", 1950.11877, -2339.16797, 13.54688},
}

local reasonTable = 
{
	-- If you want to add/remove any reasons for punishments
	-- {"Reason"}
	{"спам"},
}

--=========================================Don't edit anything below this or you might break it=========================================--

local punishmentsTable =
{
	{"Kick Player"},
	{"Mute Player"},
}

local banType = 
{
	{"Account Ban"},
	{"IP Ban"},
	{"Serial Ban"},
}

adminTab = {}
adminTabPanel = {}
adminEdit = {}
adminButton = {}
adminWindow = {}
adminLabel = {}
adminGrid = {}
adminColumn = {}
adminCombo = {}
adminCheckBox = {}

addEventHandler("onClientResourceStart", resourceRoot,
    function()
		local x, y = guiGetScreenSize()
		local x1, y1 = (x / 2) - (631 / 2), (y / 2) - (621 / 2)
        adminWindow[1] = guiCreateWindow(x1, y1, 631, 621, "Админ Панель", false)

        adminTabPanel[1] = guiCreateTabPanel(9, 22, 612, 589, false, adminWindow[1])
        adminTab[1] = guiCreateTab("Главная  ", adminTabPanel[1])
		
        adminEdit[1] = guiCreateEdit(4, 7, 139, 22, "Поиск...", false, adminTab[1])
		adminEdit[3] = guiCreateEdit(461, 207, 69, 30, "", false, adminTab[1])
		adminEdit[4] = guiCreateEdit(460, 278, 70, 31, "", false, adminTab[1]) 
		adminEdit[5] = guiCreateEdit(461, 314, 69, 30, "", false, adminTab[1])
        adminEdit[6] = guiCreateEdit(461, 349, 69, 30, "", false, adminTab[1])
        adminEdit[7] = guiCreateEdit(461, 384, 69, 30, "", false, adminTab[1])
        adminEdit[8] = guiCreateEdit(461, 419, 69, 30, "", false, adminTab[1])
        adminEdit[11] = guiCreateEdit(461, 525, 69, 30, "Name/ID", false, adminTab[1])
		
        adminGrid[1] = guiCreateGridList(4, 32, 172, 523, false, adminTab[1])
		adminColumn[1] = guiGridListAddColumn(adminGrid[1], "Игроки", 0.9)
        --adminButton[1] = guiCreateButton(460, 32, 142, 31, "Инструменты", false, adminTab[1])
        adminButton[2] = guiCreateButton(460, 67, 142, 31, "Варп к...", false, adminTab[1])
        adminButton[3] = guiCreateButton(460, 102, 142, 31, "Варп игрока к..", false, adminTab[1])
        adminButton[4] = guiCreateButton(460, 137, 70, 31, "Заморозить", false, adminTab[1])
        adminButton[5] = guiCreateButton(532, 137, 70, 31, "Следить", false, adminTab[1])
        adminButton[7] = guiCreateButton(532, 207, 70, 31, "Слапнуть", false, adminTab[1])
        adminButton[9] = guiCreateButton(532, 243, 70, 31, "Варп", false, adminTab[1])
       -- adminButton[10] = 
        adminButton[11] = guiCreateButton(532, 278, 70, 31, "Броня", false, adminTab[1])
        adminButton[12] = guiCreateButton(532, 313, 70, 31, "ХП", false, adminTab[1])
        adminButton[13] = guiCreateButton(532, 349, 70, 31, "Скин", false, adminTab[1])
        adminButton[14] = guiCreateButton(532, 383, 70, 31, "Измерение", false, adminTab[1])
        adminButton[15] = guiCreateButton(532, 418, 70, 31, "Интерьер", false, adminTab[1])
        adminButton[18] = guiCreateButton(532, 525, 70, 31, "Оружие", false, adminTab[1])
		adminButton[19] = guiCreateButton(186, 525, 88, 30, "Починить ТС", false, adminTab[1])
		
        adminLabel[1] = guiCreateLabel(186, 33, 271, 20, "Имя : N/A", false, adminTab[1])
        adminLabel[2] = guiCreateLabel(186, 53, 271, 20, "IP : N/A", false, adminTab[1])
        adminLabel[3] = guiCreateLabel(186, 73, 271, 20, "С/Н : N/A", false, adminTab[1])
        adminLabel[4] = guiCreateLabel(186, 93, 271, 20, "Аккаунт : N/A", false, adminTab[1])
        adminLabel[5] = guiCreateLabel(186, 113, 271, 20, "ACL Группа : N/A", false, adminTab[1])
        adminLabel[6] = guiCreateLabel(186, 133, 271, 20, "ХП : N/A", false, adminTab[1])
        adminLabel[7] = guiCreateLabel(186, 153, 271, 20, "Броня : N/A", false, adminTab[1])
        adminLabel[8] = guiCreateLabel(186, 173, 271, 20, "Скин : N/A", false, adminTab[1])
        adminLabel[9] = guiCreateLabel(186, 193, 271, 20, "Статус : N/A", false, adminTab[1])
        adminLabel[10] = guiCreateLabel(186, 213, 271, 20, "Профессия : N/A", false, adminTab[1])
        adminLabel[11] = guiCreateLabel(186, 233, 271, 20, "Оружие : N/A", false, adminTab[1])
        adminLabel[12] = guiCreateLabel(186, 253, 271, 20, "Пинг : N/A", false, adminTab[1])
        adminLabel[13] = guiCreateLabel(186, 273, 271, 20, "Местоположение : N/A", false, adminTab[1])
        adminLabel[14] = guiCreateLabel(186, 294, 271, 20, "X : N/A", false, adminTab[1])
        adminLabel[15] = guiCreateLabel(186, 314, 271, 20, "Y : N/A", false, adminTab[1])
        adminLabel[16] = guiCreateLabel(186, 334, 271, 20, "Z : N/A", false, adminTab[1])
		adminLabel[17] = guiCreateLabel(186, 354, 271, 20, "Измерение : N/A", false, adminTab[1])
        adminLabel[18] = guiCreateLabel(186, 374, 271, 20, "Интерьер : N/A", false, adminTab[1])
        adminLabel[19] = guiCreateLabel(186, 394, 271, 20, "Транспорт : N/A", false, adminTab[1])
        adminLabel[20] = guiCreateLabel(186, 414, 271, 20, "ХП Транспорта : N/A", false, adminTab[1])
        adminLabel[21] = guiCreateLabel(186, 434, 271, 20, "Группа : N/A", false, adminTab[1])
        adminLabel[22] = guiCreateLabel(186, 454, 271, 20, "Аккаунт создан : N/A", false, adminTab[1])
        adminLabel[23] = guiCreateLabel(186, 474, 271, 20, "Игровое время : N/A", false, adminTab[1])
        adminLabel[24] = guiCreateLabel(186, 494, 271, 20, "Деньги : N/A", false, adminTab[1])


        --[[adminTab[3] = guiCreateTab("Reports", adminTabPanel[1])
        adminGrid[3] = guiCreateGridList(5, 9, 468, 546, false, adminTab[3])
		adminColumn[16] = guiGridListAddColumn(adminGrid[3], "#", 0.1)
		adminColumn[4] = guiGridListAddColumn(adminGrid[3], "Date/Time", 0.3)
		adminColumn[5] = guiGridListAddColumn(adminGrid[3], "From", 0.3)
		adminColumn[6] = guiGridListAddColumn(adminGrid[3], "Reason", 0.3)
		adminLabel[25] = guiCreateLabel(478, 138, 128, 87, "Double click to /n open report", false, adminTab[3])
        adminButton[29] = guiCreateButton(477, 11, 129, 31, "Delete Report", false, adminTab[3])
        adminButton[30] = guiCreateButton(477, 46, 129, 31, "Punish", false, adminTab[3])]]
        --adminButton[31] = guiCreateButton(477, 82, 129, 31, "Doesn't Prove", false, adminTab[3])
        
		local x2, y2 = (x / 2) - (267 / 2), (y / 2) - (439 / 2)
        adminWindow[2] = guiCreateWindow(x2, y2 , 267, 439, "", false)
		adminEdit[18] = guiCreateEdit(11, 359, 246, 28, "", false, adminWindow[2])  
        adminGrid[4] = guiCreateGridList(9, 25, 248, 331, false, adminWindow[2])
		adminColumn[7] = guiGridListAddColumn(adminGrid[4], "", 1)
        adminButton[32] = guiCreateButton(10, 397, 120, 32, "", false, adminWindow[2])
        adminButton[33] = guiCreateButton(137, 397, 120, 32, "Close", false, adminWindow[2])
		
		local x3, y3 = (x / 2) - (586 / 2), (y / 2) - (555 / 2)
        adminWindow[3] = guiCreateWindow(x3, y3, 586, 555, "Ban Log", false)
		adminCombo[2] = guiCreateComboBox(469, 224, 107, 100, "", false,adminWindow[3])
		adminEdit[15] = guiCreateEdit(469, 125, 107, 27, "IP/Serial/Username", false, adminWindow[3])
		adminEdit[16] = guiCreateEdit(469, 158, 107, 27, "Ban Reason", false, adminWindow[3])
		adminEdit[17] = guiCreateEdit(469, 191, 107, 27, "Ban Time", false, adminWindow[3])  
        adminGrid[5] = guiCreateGridList(9, 25, 456, 514, false, adminWindow[3])
		adminColumn[8] = guiGridListAddColumn(adminGrid[5], "Name", 0.3)
		adminColumn[9] = guiGridListAddColumn(adminGrid[5], "Account", 0.3)
		adminColumn[10] = guiGridListAddColumn(adminGrid[5], "Banned by", 0.3)
		adminColumn[11] = guiGridListAddColumn(adminGrid[5], "Reason", 0.3)
		adminColumn[14] = guiGridListAddColumn(adminGrid[5], "IP", 0.3)
		adminColumn[15] = guiGridListAddColumn(adminGrid[5], "Serial", 0.5)
		adminColumn[13] = guiGridListAddColumn(adminGrid[5], "Unban Time", 0.3)
		adminColumn[12] = guiGridListAddColumn(adminGrid[5], "Date", 0.3)
		adminButton[34] = guiCreateButton(469, 26, 107, 27, "Unban", false, adminWindow[3])
		adminButton[35] = guiCreateButton(469, 512, 107, 27, "Close", false, adminWindow[3])
        adminButton[42] = guiCreateButton(469, 257, 107, 27, "Ban", false, adminWindow[3])
        
		local x4, y4 = (x / 2) - (340 / 2), (y / 2) - (483 / 2)
		adminWindow[4] = guiCreateWindow(x4, y4, 340, 483, "Punishments", false)
		adminGrid[6] = guiCreateGridList(9, 29, 149, 440, false,adminWindow[4])
		adminColumn[17] = guiGridListAddColumn(adminGrid[6], "Punishments", 0.8)
		adminCombo[1] = guiCreateComboBox(168, 55, 162, 258, "", false,adminWindow[4])
		adminLabel[26] = guiCreateLabel(168, 29, 162, 26, "Reason", false,adminWindow[4])
		adminLabel[27] = guiCreateLabel(168, 137, 162, 26, "Time", false,adminWindow[4])
		
		adminEdit[13] = guiCreateEdit(168, 88, 162, 26, "", false,adminWindow[4])
		adminEdit[14] = guiCreateEdit(168, 163, 162, 26, "", false,adminWindow[4])
		adminCheckBox[1] = guiCreateCheckBox(168, 199, 162, 28, "Automatically Calculate", false, false,adminWindow[4])
		adminButton[36] = guiCreateButton(169, 437, 161, 32, "Close", false,adminWindow[4])
		adminButton[37] = guiCreateButton(169, 395, 161, 32, "Punish", false,adminWindow[4])
		guiSetFont(adminCheckBox[1], "default-bold-small")
		
		local x5, y5 = (x / 2) - (607 / 2), (y / 2) - (482 / 2)
		adminWindow[5] = guiCreateWindow(x5, y5, 607, 482, "Punishlog", false)
        adminGrid[7] = guiCreateGridList(9, 24, 588, 408, false, adminWindow[5])
        adminColumn[18] = guiGridListAddColumn(adminGrid[7], "log", 0.95)
        adminButton[38] = guiCreateButton(452, 438, 145, 34, "Close", false, adminWindow[5])
        adminButton[39] = guiCreateButton(297, 438, 145, 34, "Remove log", false, adminWindow[5]) 
		guiSetVisible(adminButton[39], false)

		for i, v in pairs (punishmentsTable) do
			local row = guiGridListAddRow(adminGrid[6])
			guiGridListSetItemText(adminGrid[6], row, adminColumn[17], v[1], false, false)
		end
		for i, v in ipairs(reasonTable) do
			guiComboBoxAddItem(adminCombo[1], v[1])
		end
		for i, v in ipairs(banType) do
			guiComboBoxAddItem(adminCombo[2], v[1])
		end
		for i, v in pairs (adminLabel) do 
			guiSetFont(adminLabel[i], "default-bold-small")
			guiLabelSetColor(adminLabel[i], 18, 228, 6)
		end
		for i, v in pairs (adminButton) do 
			guiSetFont(adminButton[i], "default-bold-small")
			guiSetProperty(adminButton[i], "NormalTextColour", "FFAAAAAA")
		end
		for i, v in pairs (adminWindow) do 
			guiSetVisible(adminWindow[i], false)
			guiWindowSetSizable(adminWindow[i], false)
			guiSetAlpha(adminWindow[i], 1.00)
		end
		for i=26, 27 do
			guiLabelSetHorizontalAlign(adminLabel[i], "center", false)
			guiLabelSetVerticalAlign(adminLabel[i], "center")
		end
--		addEventHandler("onClientGUIDoubleClick", adminGrid[3], showReports, false) 
		addEventHandler	("onClientGUIChanged", adminEdit[1] , function() playerSearch(1, 1) end, false)
--		addEventHandler	("onClientGUIChanged", adminEdit[12] , searchResources, false)
		addEventHandler	("onClientGUIChanged", adminEdit[18] , function() playerSearch(4, 18) end, false)
	end
)

function playerSearch(i, j)
	guiGridListClear(adminGrid[i])
	local name = guiGetText(adminEdit[j])
	if (name == "") then
		for id, player in ipairs (getElementsByType("player")) do
		guiGridListSetItemText(adminGrid[i], guiGridListAddRow(adminGrid[i]), 1, getPlayerName(player), false, false)
	end
	else
		for id, plr in ipairs(getElementsByType("player")) do
			if string.find(getPlayerName(plr):lower(), name:lower()) then
				local row = guiGridListAddRow(adminGrid[i])
				guiGridListSetItemText(adminGrid[i], row, 1, getPlayerName(plr), false, false)
			end
		end
	end
end

function refreshPlayers ()
	-- To update the player list
    for id, player in ipairs (getElementsByType("player")) do
		guiGridListSetItemText(adminGrid[1], guiGridListAddRow(adminGrid[1]), adminColumn[1], getPlayerName(player), false, false)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, refreshPlayers)

function updatePlayerList(old, new)
	-- To update the player list
    if (eventName == "onClientPlayerJoin") then
        guiGridListSetItemText(adminGrid[1], guiGridListAddRow(adminGrid[1]), adminColumn[1], getPlayerName(source ), false, false)
    elseif (eventName == "onClientPlayerQuit") then
        for row = 0, guiGridListGetRowCount(adminGrid[1]) do
            if ( guiGridListGetItemText(adminGrid[1], row, adminColumn[1]) == getPlayerName(source)) then
                guiGridListRemoveRow(adminGrid[1], row)
                break
            end
        end

    elseif (eventName == "onClientPlayerChangeNick") then
        for row = 0, guiGridListGetRowCount(adminGrid[1]) do
            if ( guiGridListGetItemText(adminGrid[1], row, adminColumn[1]) == old) then
                guiGridListSetItemText (adminGrid[1], row, adminColumn[1], new, false, false)
                break
            end
        end
    end
end
addEventHandler ("onClientPlayerJoin", root, updatePlayerList)
addEventHandler ("onClientPlayerQuit", root, updatePlayerList)
addEventHandler ("onClientPlayerChangeNick", root, updatePlayerList)
		
addEventHandler("onClientGUITabSwitched", getRootElement(), 
	function ()
		-- when you switch tabs
		if (source == adminTab[2]) then
			outputChatBox("Loading list ...", source, 0, 225, 0)
			triggerServerEvent("AdminPanel.getResource", localPlayer)
		elseif (source == adminTab[3]) then
			triggerServerEvent("AdminPanel.getReports", localPlayer)
		end
	end
)
		
addEventHandler("onClientGUIClick", getRootElement(), 
function ()
	if (source == adminButton[1]) then
		-- opens punishment window
		--[[guiSetVisible(adminWindow[4], true)
		guiBringToFront(adminWindow[4])]]
	elseif (source == adminButton[2]) then
		-- To warp to selected player
		warpToPlayer()
	elseif (source == adminButton[3]) then
		-- Opens warp player to window
		guiGridListClear(adminGrid[4])
		guiSetVisible(adminWindow[2], true) 
		guiBringToFront(adminWindow[2])
		guiSetText(adminButton[32], "Телепортировать игрока к")
		guiSetText(adminWindow[2], "Телепортировать игрока")
		guiSetVisible(adminEdit[18], true)
		for id, plr in ipairs (getElementsByType("player")) do
			guiGridListSetItemText(adminGrid[4], guiGridListAddRow(adminGrid[4]), adminColumn[7], getPlayerName(plr), false, false)
		end
	elseif (source == adminButton[4]) then
		-- To freeze selected player
		freezePlayer()
	elseif (source == adminButton[5]) then
		-- To spectate selected player
		spectatePlayer()
	elseif (source == adminButton[6]) then
		-- To rename selected player
		renamePlayer()
	elseif (source == adminButton[7]) then
		-- To slap selected player
		slapPlayer()
	elseif (source == adminButton[8]) then
		-- Opens ban window
		openBanWindow()
	elseif (source == adminButton[9]) then
		-- opens warp point window
		guiGridListClear(adminGrid[4])
		guiSetVisible(adminWindow[2], true) 
		guiBringToFront(adminWindow[2])
		guiSetText(adminButton[32], "Warp")
		guiSetText(adminWindow[2], "Warp Points")
		guiSetVisible(adminEdit[18], false)
		for i=1, #warpLocations do
			guiGridListSetItemText(adminGrid[4], guiGridListAddRow(adminGrid[4]), adminColumn[7], warpLocations[i][1], false, false)
		end
	elseif (source == adminButton[10]) then
		-- Extra button
	elseif (source == adminButton[11]) then
		-- sets selected player's Armor
		giveArmor()
	elseif (source == adminButton[12]) then
		-- sets selected player's health
		giveHealth()
	elseif (source == adminButton[13]) then
		-- sets selected player's skin
		setSkin()
	elseif (source == adminButton[14]) then
		-- sets selected player's dimension
		setDimension()
	elseif (source == adminButton[15]) then
		-- sets selected player's interor
		setInterior()
	elseif (source == adminButton[16]) then
		-- sets selected player's  team
		setTeam()
	elseif (source == adminButton[17]) then
		-- give selected player a vehicle
		giveVehicle()
	elseif (source == adminButton[18]) then
		-- give selected player a weapon
		giveWeap()
	elseif (source == adminButton[19]) then
		-- fix selected player's vehicle
		fixVeh()
	elseif (source == adminButton[20]) then
		-- destroy selected player's vehicle
		destroyVeh()
	elseif (source == adminButton[21]) then
		-- get selected player's punishlog
		local plr = getGridlistPlayer()
		showPunishlogs(plr)
		guiSetVisible(adminButton[39], true)
	elseif (source == adminButton[22]) then
		guiGridListClear(adminGrid[4])
		guiSetVisible(adminWindow[2], true) 
		guiBringToFront(adminWindow[2])
		guiSetText(adminButton[32], "Give rights")
		guiSetText(adminWindow[2], "Give admin rights")
		guiSetVisible(adminEdit[18], true)
		for id, plr in ipairs (getElementsByType("player")) do
			guiGridListSetItemText(adminGrid[4], guiGridListAddRow(adminGrid[4]), adminColumn[7], getPlayerName(plr), false, false)
		end
	elseif (source == adminButton[23]) then
		--Extra
	elseif (source == adminButton[24]) then
		--Extra
	elseif (source == adminButton[25]) then
		-- to start a resource
		resourceStart()
	elseif (source == adminButton[26]) then
		-- to stop a resource
		resourceStop()
	elseif (source == adminButton[27]) then
		-- to restart a resource
		resourceRestart()
	elseif (source == adminButton[28]) then
		-- to refresh resources
		resourceRefresh()
	elseif (source == adminButton[29]) then
		-- to mark a report invalid
		inValidReport()
	elseif (source == adminButton[30]) then
		-- to mark a report valid
		validReport()
	elseif (source == adminButton[31]) then
		--None
	elseif (source == adminButton[32]) then
		if (guiGetText(adminButton[32]) == "Warp to") then
			-- to warp selected player to another player
			local plr = getGridlistPlayer()
			local toPlr = getPlayerFromName(guiGridListGetItemText(adminGrid[4], guiGridListGetSelectedItem(adminGrid[4]), 1))
			if (plr and toPlr) then
				triggerServerEvent("AdminPanel.warpPlayerTo", localPlayer, plr, toPlr)
			end
		elseif (guiGetText(adminButton[32]) == "Warp") then
			-- Warp points
			local location = guiGridListGetItemText(adminGrid[4], guiGridListGetSelectedItem(adminGrid[4]), 1)
			if (location) then
				for i=1, #warpLocations do
					if (warpLocations[i][1] == location) then
						setElementPosition(localPlayer, warpLocations[i][2], warpLocations[i][3], warpLocations[i][4])
						setElementInterior(localPlayer, 0)
						setElementDimension(localPlayer, 0)
					end
				end
			end
		elseif (guiGetText(adminButton[32]) == "Give rights") then
			local plr = getPlayerFromName(guiGridListGetItemText(adminGrid[4], guiGridListGetSelectedItem(adminGrid[4]), 1))
			if (plr) then
				if (getElementData(localPlayer, "isPlayerStaff")) then
					triggerServerEvent("AdminPanel.giveAdminRights", localPlayer, plr)
				end
			end
		elseif (guiGetText(adminButton[32]) == "Remove rights") then
			local plr = getPlayerFromName(guiGridListGetItemText(adminGrid[4], guiGridListGetSelectedItem(adminGrid[4]), 1))
			if (plr) then
				openAdminPanel()	
				triggerServerEvent("AdminPanel.removeAdminRights", localPlayer, plr)
			end
		end
	elseif (source == adminButton[33]) then
		guiSetVisible(adminWindow[2], false)
	elseif (source == adminButton[34]) then
		adminUnban()
	elseif (source == adminButton[35]) then
		guiSetVisible(adminWindow[3], false)
	elseif (source == adminButton[36]) then
		guiSetText(adminEdit[13], "")
		guiSetText(adminEdit[14], "")
		guiSetVisible(adminWindow[4], false)
	elseif (source == adminButton[37]) then
		onAdminPunish()
	elseif (source == adminButton[38]) then
		openPunishlog()
	elseif (source == adminButton[39]) then
		removePunishLog()
	elseif (source == adminButton[42]) then
		adminManualBan()
	elseif (source == adminGrid[1]) then -- Gridlist click
		onGridClick()
	elseif (source == adminGrid[4]) then 
		local plr = getPlayerFromName(guiGridListGetItemText(adminGrid[4], guiGridListGetSelectedItem(adminGrid[4]), 1))
		if (plr) then
			if (guiGetText(adminButton[32]) == "Give rights") then
				if (getElementData(plr, "isPlayerStaff")) then
					guiSetText(adminButton[32], "Remove rights")
				else
					guiSetText(adminButton[32], "Give rights")
				end
			end
		end
	elseif ((source == adminEdit[1]) or (source == adminEdit[10]) or (source == adminEdit[11]) or (source == adminEdit[12]) or (source == adminEdit[15]) or (source == adminEdit[16]) or (source == adminEdit[17])) then 
		if ((guiGetText(source) == "Search...") or (guiGetText(source) == "Name/ID") or (guiGetText(source) == "IP/Serial/Username") or (guiGetText(source) == "Ban Reason") or (guiGetText(source) == "Ban Time")) then
			guiSetText(source, "")
		end
	end
end
)