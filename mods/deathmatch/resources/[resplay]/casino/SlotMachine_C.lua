local drum = "img/drum.png"
local druminteral = "img/cards.png"
-- general settings 
local settings = {}
settings.drumColor = tocolor(25, 25, 25)
settings.stake = 100 -- starting stake
settings.stakeMax = 1000 -- maximum stake
settings.stakeMin = 100 -- minimum stake
settings.stakeStep = 100 -- step of a stake
settings.font = "font/Roboto.ttf"
settings.language = "english"
settings.jackpotSound = "sounds/jackpot.ogg" 
settings.positionsCol = {  
	-- {x, y, z, size, dimension, interior}
	{2218.6630859375 ,1587.3603515625 ,1006.1827392578, 1, 0, 1},{2218.6533203125 ,1589.318359375 ,1006.1841430664, 1, 0, 1},
	{2218.6298828125 ,1591.666015625 ,1006.1858520508, 1, 0, 1},{2218.626953125 ,1593.625 ,1006.1872558594, 1, 0, 1},
	{2216.306640625 ,1603.9208984375 ,1006.1819458008, 1, 0, 1},{2218.2646484375 ,1603.896484375 ,1006.1796875, 1, 0, 1},
	{2219.9619140625 ,1603.9306640625 ,1006.1796875, 1, 0, 1},{2221.9208984375 ,1603.912109375 ,1006.1796875, 1, 0, 1},
	{2218.6396484375 ,1613.509765625 ,1006.1796875, 1, 0, 1},{2218.6416015625 ,1619.8037109375 ,1006.1793823242, 1, 0, 1},
	{2218.662109375 ,1615.4677734375 ,1006.1796875, 1, 0, 1},{2218.671875 ,1617.8447265625 ,1006.1817626953, 1, 0, 1},
	{2274.5380859375 ,1606.6513671875 ,1006.1796875, 1, 0, 1},{2272.580078125 ,1606.6787109375 ,1006.1796875, 1, 0, 1},
	{2270.4912109375 ,1606.6796875 ,1006.1796875, 1, 0, 1},{2268.5322265625 ,1606.666015625 ,1006.1796875, 1, 0, 1},
	{2255.177734375 ,1608.8837890625 ,1006.1860351563, 1, 0, 1},{2255.19140625 ,1612.9306640625 ,1006.1796875, 1, 0, 1},
	{2255.1640625 ,1610.84375 ,1006.1796875, 1, 0, 1},{2255.171875 ,1614.8896484375 ,1006.1796875, 1, 0, 1},
	{2255.181640625 ,1616.830078125 ,1006.1796875, 1, 0, 1},{2255.154296875 ,1618.7880859375 ,1006.1796875, 1, 0, 1},
	{ 1957.029296875 , 988.298828125 , 992.46875 , 1, 0, 10 },{ 1963.0400390625 , 991.447265625 , 992.46875 , 1, 0, 10 },
	{ 1963.8408203125 , 998.5869140625 , 992.46875 , 1, 0, 10 },{ 1961.3212890625 , 1042.89453125 , 992.46875 , 1, 0, 10 },
	{ 1958.046875 , 1049.06640625 , 992.46875 , 1, 0, 10 },{ 1965.8359375 , 1037.572265625 , 992.46875 , 1, 0, 10 },
}


settings.gamesPlayed = 0  
settings.rolling = false
settings.cardsize = 256  


local cards = {
	-- 1 5 10 25
	-- bars
	{"slotMachineCards/goldbar.png", 20, 75},
	{"slotMachineCards/redbar.png", 10, 10},
	{"slotMachineCards/greenbar.png", 1, 5},
	-- luck related
	{"slotMachineCards/bell.png", 5, 10},
	{"slotMachineCards/heart.png", 5, 10},
	{"slotMachineCards/horseshoe.png", 5, 10},
	{"slotMachineCards/goldclover.png", 10, 25},
	{"slotMachineCards/greenclover.png", 5, 10},
	-- sevens
	{"slotMachineCards/goldenseven.png", 20, 75},
	{"slotMachineCards/redseven.png", 5, 25},
	-- gems
	{"slotMachineCards/ruby.png", 10, 25},
	{"slotMachineCards/emerald.png", 10, 25},
	{"slotMachineCards/diamond.png", 20, 75},
	-- vegetables and fruits
	{"slotMachineCards/cherry.png", 1, 5},
	{"slotMachineCards/grape.png", 1, 5},
	{"slotMachineCards/lemon.png", 1, 5},
	{"slotMachineCards/plum.png", 1, 5},
	{"slotMachineCards/watermelon.png", 1, 5},
}

local setList = { 
{{0.215, 0, "slotMachineCards/bell.png"}, {0.215, 0.36, "slotMachineCards/goldbar.png"}}, -- left set
{{0.422, 0, "slotMachineCards/bell.png"}, {0.422, 0.36, "slotMachineCards/goldbar.png"}}, -- central set
{{0.628, 0, "slotMachineCards/bell.png"}, {0.628, 0.36, "slotMachineCards/goldbar.png"}}, -- right set
}

local setSettings = { 
{speedBasic = 0.004, count = 75, xstart = 0.215},
{speedBasic = 0.0045, count = 100, xstart = 0.422},
{speedBasic = 0.005, count = 133, xstart = 0.628},
}

local gui = {}
local dumpedCards = {}
local localisation = {}

localisation["english"] = {
	winenthiusastic ="Che Khosh Shans! Shoma Mablaghe %d$ Barande Shodid!",
	win = "Che Khosh Shans! Shoma Mablaghe %d$ Barande Shodid!",
	lose = "Dar In Shart Bandi Bakht Ba Shoma Yar Nabod! :(",
	stakeMax = "Shoma Bishtar Az Mablaghe %d$ Nemitavanid Shart Bandi Konid!",
	stakeMin = "Shoma Nemitavanid Shart Bandi Konid Agar Mablaghe Shart Bandi Zire %d$ Bashad!",
	notEnoughCash = "Shoma Pol Kafi Baraye Shart Bandi Bishtar Nadarid!",
	notEnoughCashOnRoll = "Shoma Pol Kafi Baraye Shart Bandi Nadarid!",
	stakeInfo = "Meghdar\nShart\n%d$",
	roll = "Shart Bandi",
	leave = "Khoroj",
	whenRolling = "Dar Hengame Shart Bandi Nemitavanid In Kar Ra Anjam Dahid!",
}
-- MISC FUNCTIONS

local function outputOnScreen(str, r, g, b)
	local labels = {{},{},{}}
	labels[1] = {str, r, g, b}
	labels[2] = {guiGetText(gui.labelList1), guiLabelGetColor(gui.labelList1)}
	labels[3] = {guiGetText(gui.labelList2), guiLabelGetColor(gui.labelList2)}
	for k,v in ipairs(labels) do
		guiLabelSetColor(gui["labelList"..k], v[2], v[3], v[4])
		guiSetText(gui["labelList"..k], v[1])
	end
end

local function copyTable() end 
copyTable = function(t1)
	local newTable = {}
	for k, v in ipairs(t1) do
		if type(v) ~= "table" then
			newTable[k] = v
		else
			newTable[k] = copyTable(v)
		end
	end
	return newTable
end

local function getFontSizeFromResolution(w, h, base)
	local w = w/base
	local h = h/base
	local result = math.floor(math.sqrt(h*w))
	return result
end

--MAIN FUNCTIONS

local sw, sh = guiGetScreenSize()
local function drawImage(x, y, card) 
	local topy = y - 0.23
	local bottomy = 0.75 - y
	if topy < 0 then
		local hrr = (0.25+topy)/0.25
		dxDrawImageSection(x*sw, (y-topy)*sh, 0.15*sw, (0.25+topy)*sh, 0, (1-hrr)*settings.cardsize, settings.cardsize, hrr*settings.cardsize, card)
	elseif bottomy > 0 and bottomy < 0.25 then
		dxDrawImageSection(x*sw, y*sh, 0.15*sw, bottomy*sh, 0, 0, settings.cardsize, (bottomy/0.25)*settings.cardsize, card)
	else
		dxDrawImageSection(x*sw, y*sh, 0.15*sw, 0.25*sh, 0, 0, settings.cardsize, settings.cardsize, card)
	end
end

local function generateSets()
	for i = 1, #setList do
		for i2 = 1, setSettings[i].count do
			local newcard = {0, 0, "str"}
			newcard[1] = setSettings[i].xstart
			newcard[2] = 0.4*i2+0.25
			newcard[3] = cards[math.random(1, #cards)][1]
			table.insert(setList[i], newcard)
		end
		setSettings[i].speed = setSettings[i].speedBasic * 40
	end
	if math.sqrt(settings.gamesPlayed) > math.random(22, 50) and math.random(1,2)%2==0 then 
		setList[1][setSettings[1].count - 1][3] = cards[math.random(1,4)][1]
		setList[2][setSettings[2].count - 1][3] = cards[math.random(5,8)][1]
		setList[3][setSettings[3].count - 1][3] = cards[math.random(9,12)][1]
	end
	collectgarbage("collect")
end


local function calculateRewards()
	local multiplier = {name, multiplier = 0, columns = 0}
	
	multiplier.columns = multiplier.columns + ((setList[1][2][3] == setList[2][2][3] and setList[1][2][3] == setList[3][2][3] and 3)  or (setList[1][2][3] == setList[2][2][3] and 2) or (setList[2][2][3] == setList[3][2][3] and 2) or (setList[1][2][3] == setList[3][2][3] and 2) or 0)
	
	multiplier.name = (setList[1][2][3] == setList[2][2][3] and setList[1][2][3] == setList[3][2][3] and setList[1][2][3]) or (setList[1][2][3] == setList[2][2][3] and setList[1][2][3]) or (setList[2][2][3] == setList[3][2][3] and setList[2][2][3]) or (setList[1][2][3] == setList[3][2][3] and setList[3][2][3])
	if multiplier.columns ~= 0 then
		for k,v in ipairs(cards) do
			if v[1] == multiplier.name then
				multiplier.multiplier = v[multiplier.columns]
			end
		end
	end
	
	dumpedCards = {}  --dumps all cards
	collectgarbage("collect") --collects garbage at the end, so game doesn't get lagged
	
	if multiplier.columns == 3 then
		--exports["notf"]:addNotification("Tabrik Shoma "..settings.stake*multiplier.multiplier.."$ Barande Shodid!" , 'success')
		triggerServerEvent("casinoGivePlayerMoney", localPlayer, settings.stake*multiplier.multiplier)
		guiSetText(gui.labelMoney, getPlayerMoney() + settings.stake*multiplier.multiplier.."$")
		playSound(settings.jackpotSound)
	elseif multiplier.columns == 2 then
		--exports["notf"]:addNotification("Tabrik Shoma "..settings.stake*multiplier.multiplier.."$ Barande Shodid!" , 'success')
		triggerServerEvent("casinoGivePlayerMoney", localPlayer, settings.stake*multiplier.multiplier)
		guiSetText(gui.labelMoney, getPlayerMoney() + settings.stake*multiplier.multiplier.."$")
		playSound(settings.jackpotSound)
	else
		--exports["notf"]:addNotification("Moteasefane Shans Ba Shoma Yar Nabod!" , 'error')
	end
	settings.gamesPlayed = settings.gamesPlayed + 1
end	


local delta = getTickCount()
local function main()
	delta = (getTickCount() - delta)  --calculates delta time diffrence between last 2 frames
	delta = delta < 34 and delta or 34  -- if he has less than 30 fps his game will run slower, but it will prevent any drum related drawing problems(at least those major ones)
	dxDrawRectangle(0, 0, sw, sh, tocolor(0, 0, 0 ,150)) --grey background
	dxDrawImage(0.15*sw, 0.2*sh, 0.7*sw, 0.6*sh, druminteral)  --draws drum internal part
	for key, set in ipairs (setList) do
		if #set == 2 and key == #setList then --stops when there are only 2 cards left in the right set and ends roll.
			if settings.rolling then
				calculateRewards()  --calculates prize
				settings.rolling = false --allows to roll again
			end
		end
		for index, card in ipairs(set) do
			if settings.rolling then -- if we roll
				if #set < 40 then
					setSettings[key].speed = setSettings[key].speedBasic * #set --used to slowdown drums near end of roll
				end
				if #set ~= 2 then  -- drum works till there are more than 2 cards in a set
					card[2] = card[2] - setSettings[key].speed * delta/17 --change position of card
				end
			end
			if card[2] < 0.75 and card[2] >= 0 then -- draw cards only when picture can is seeable
				drawImage(card[1], card[2], card[3]) --draws image
			elseif card[2] < -0.42 then --if the card is over the top of the screen
				table.insert(dumpedCards, table.remove(set, index)) -- remove useless cards from set and move it to dumpedCards
			end
		end
	end
	dxDrawImage(0.1*sw, 0.2*sh, 0.8*sw, 0.6*sh, drum, 0, 0, 0, settings.drumColor) --draws drum external part
	delta = getTickCount()
end

-- Win table generator // part of gui
local prizesPanel = {}
prizesPanel.labels = {}
prizesPanel.images = {}

local function generatePrizesPanel()
	local offsetx = 0
	local offsety = 0
	local icons = copyTable(cards)
	-- 2x in columns
	table.sort(icons, function (a,b) return a[2] < b[2] end)
	for k,v in ipairs(icons) do
		if icons[k-1] and v[2] ~= icons[k-1][2] then
			local label = guiCreateLabel(0.145 + offsetx, 0.006 + offsety, 0.03, sw/sh*0.03, icons[k-1][2].."x", true)
			table.insert(prizesPanel.labels, label)
			offsety = offsety + 0.046
			offsetx = 0
		end
		local img = guiCreateStaticImage(0.15 + offsetx, 0.01 + offsety, 0.03, sw/sh*0.026, v[1], true)
		table.insert(prizesPanel.images, img)
		offsetx = offsetx + 0.04
		if k == #icons then
			local label = guiCreateLabel(0.145 + offsetx, 0.006 + offsety, 0.03, sw/sh*0.03, v[2].."x", true)
			table.insert(prizesPanel.labels, label)
		end
	end 
	
	for k,v in ipairs(prizesPanel.labels) do
		guiLabelSetColor(v, 255, 50, 50)
	end
	local count = #prizesPanel.labels
	
	
	table.sort(icons, function (a,b) return a[3] > b[3] end)
	offsetx = 0
	offsety = 0
	for k,v in ipairs(icons) do
		if icons[k-1] and v[3] ~= icons[k-1][3] then
			local label = guiCreateLabel(0.815 - offsetx, 0.006 + offsety, 0.04, sw/sh*0.03, icons[k-1][3].."x", true)
			table.insert(prizesPanel.labels, label)
			offsety = offsety + 0.046
			offsetx = 0
		end
		local img = guiCreateStaticImage(0.815 - offsetx, 0.01 + offsety, 0.03, sw/sh*0.026, v[1], true)
		table.insert(prizesPanel.images, img)
		offsetx = offsetx + 0.04
		if k == #icons then
			local label = guiCreateLabel(0.815 - offsetx, 0.006 + offsety, 0.04, sw/sh*0.03, v[3].."x", true)
			table.insert(prizesPanel.labels, label)
		end
	end 
	
	local font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 70))
	for k,v in ipairs(prizesPanel.labels) do
		guiSetFont(v, font)
		if count < k then 
			guiLabelSetColor(v, 255, 255, 50)
		end
	end
	
	local label1 = guiCreateLabel(0.32, 0.145, 0.12, 0.05, "", true)
	local label2 = guiCreateLabel(0.56, 0.015, 0.12, 0.05, "", true)
	font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 40))
	guiSetFont(label1, font)
	guiSetFont(label2, font)
	guiLabelSetColor(label1, 255, 50, 50)
	guiLabelSetColor(label2, 255, 255, 50)
	table.insert(prizesPanel.labels, label1)
	table.insert(prizesPanel.labels, label2)
	for k,v in ipairs(prizesPanel.labels) do
		guiLabelSetHorizontalAlign(v, "center") 
		guiLabelSetVerticalAlign(v, "center")
	end

	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, false)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, false)
	end
	
	collectgarbage("collect")
end
generatePrizesPanel()

-- GUI RELATED FUNCTIONS

local function onPlayerStartRoll()
	if settings.rolling then -- we can't allow a new roll when there is one currently ongoing.
		--exports["notf"]:addNotification("Dar Hengame Shart Bandi Inkar Momken Nist!" , 'warning')
		return
	end
	if settings.stake > getPlayerMoney() then
		outputOnScreen(localisation[settings.language].notEnoughCashOnRoll, 255, 50, 50)
		return
	end
	settings.rolling = true --starts a roll
	triggerServerEvent("casinoTakePlayerMoney", localPlayer, settings.stake)
	guiSetText(gui.labelMoney, getPlayerMoney() - settings.stake.."$")
	setList = { --uses two rows of card from last roll
		{setList[1][2]}, -- left set
		{setList[2][2]}, -- central set
		{setList[3][2]}, -- right set
	}	
	generateSets() --generate sets
end

local function onPlayerLeave()
	if settings.rolling then -- we can't allow a new roll when there is one currently ongoing.
		--exports["notf"]:addNotification("Dar Hengame Shart Bandi Inkar Momken Nist!" , 'warning')
		return
	end
	for k,v in pairs(gui) do
		guiSetVisible(v, false)
	end
	showCursor(false, false)
	removeEventHandler("onClientRender", root, main)
	setElementFrozen(localPlayer, false)
	showChat(true)
	showPlayerHudComponent("all", false)
	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, false)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, false)
	end
end

local function stakeUp()
	if settings.rolling then
		--exports["notf"]:addNotification("Dar Hengame Shart Bandi Inkar Momken Nist!" , 'warning')
		return
	end
	local potencialStake = settings.stake + settings.stakeStep
	if potencialStake > getPlayerMoney() then
		--exports["notf"]:addNotification("Shoma Pole Kafi Hamrahe Khod Nadarid!" , 'warning')
		return
	elseif potencialStake > settings.stakeMax then
		--exports["notf"]:addNotification("Bishtar Az Mablaghe "..settings.stakeMax.." Nemitonid Shart Bandi Konid!" , 'warning')
		return
	end
	settings.stake = potencialStake
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
end

local function stakeDown()
	if settings.rolling then
		outputOnScreen(localisation[settings.language].whenRolling, 250, 50, 50)
		return
	end
	local potencialStake = settings.stake - settings.stakeStep
	if potencialStake < settings.stakeMin then
		outputOnScreen(string.format(localisation[settings.language].stakeMin, settings.stakeMin), 255, 168, 0)
		return
	end
	settings.stake = potencialStake
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
end

local function createGUI()
	gui.buttonRoll = guiCreateButton(0.6, 0.792, 0.23, 0.1, localisation[settings.language].roll, true) --start roll
	gui.buttonLeave = guiCreateButton(0.37, 0.792, 0.23, 0.1, localisation[settings.language].leave, true) --leave
	gui.buttonStakeUp = guiCreateButton(0.32, 0.792, 0.05, 0.1, "+", true)
	gui.buttonStakeDown = guiCreateButton(0.17, 0.792, 0.05, 0.1, "-", true)

	gui.labelStake = guiCreateLabel(0.22, 0.792, 0.10, 0.1, string.format(localisation[settings.language].stakeInfo, settings.stake), true) --current stake
	guiLabelSetHorizontalAlign(gui.labelStake, "center") 
	guiLabelSetVerticalAlign(gui.labelStake, "center")
	gui.labelMoney = guiCreateLabel(0.79, 0, 0.2, 0.2, getPlayerMoney().."$", true)
	guiLabelSetHorizontalAlign(gui.labelMoney, "right") 
	guiLabelSetVerticalAlign(gui.labelMoney, "top")
	guiLabelSetColor(gui.labelMoney, 133, 187, 101)

	gui.labelList1 = guiCreateLabel(0, 0.9, 1, 0.03, "", true)
	gui.labelList2 = guiCreateLabel(0, 0.93, 1, 0.03, "", true)
	gui.labelList3 = guiCreateLabel(0, 0.96, 1, 0.03, "", true)
	for i = 1, 3 do
		guiLabelSetHorizontalAlign(gui["labelList"..i], "center") 
		guiLabelSetVerticalAlign(gui["labelList"..i], "center")
	end
	
	local font = guiCreateFont(settings.font, getFontSizeFromResolution(sw, sh, 75))
	for k,v in pairs(gui) do
		guiSetFont(v, font)
	end
	guiSetFont(gui.labelMoney, "sa-header")
	
	addEventHandler("onClientGUIMouseUp", gui.buttonRoll, onPlayerStartRoll)
	addEventHandler("onClientGUIMouseUp", gui.buttonLeave, onPlayerLeave)
	addEventHandler("onClientGUIMouseUp", gui.buttonStakeUp, stakeUp)
	addEventHandler("onClientGUIMouseUp", gui.buttonStakeDown, stakeDown)
	for k,v in pairs(gui) do
		guiSetVisible(v, false)
	end
end
createGUI()

local function setGUIlanguage(language) --use that to change language settings. It is not exported.
	settings.language = language
	guiSetText(gui.labelStake, string.format(localisation[settings.language].stakeInfo, settings.stake))
	guiSetText(gui.buttonRoll, localisation[settings.language].roll)
	guiSetText(gui.buttonLeave, localisation[settings.language].leave)
end

local function showGUI(el, md)
	--if not md or getElementType(el) ~= "player" or el ~= localPlayer then
		--return
	--end
	for k,v in pairs(gui) do
		guiSetVisible(v, true)
	end
	showCursor(true, true)
	addEventHandler("onClientRender", root, main)
	setElementFrozen(localPlayer, true)
	showChat(false)
	showPlayerHudComponent("all", false)
	guiSetText(gui.labelMoney, getPlayerMoney().."$")
	for k,v in ipairs(prizesPanel.labels) do
		guiSetVisible(v, true)
	end
	for k,v in ipairs(prizesPanel.images) do
		guiSetVisible(v, true)
	end
end

function UnBindSlotMachine ( Leave, matchingDimension )
    if Leave == getLocalPlayer() then
		unbindKey ( "Z", "down", showGUI )
	end
end

function BindSlotMachine ( Hit, matchingDimension )
	if Hit == getLocalPlayer() then
		bindKey( "Z", "down", showGUI )
		--exports["notf"]:addNotification("Baraye Estefade Az Slot Machine Dokme ( Z ) Ra Bezanid!" , 'info')
	end
end

for k,v in ipairs(settings.positionsCol) do
	local Marker = createMarker ( v[1], v[2], v[3]-1, "cylinder", v[4], 255, 0, 0, 170 )
	setElementDimension(Marker, v[5])
	setElementInterior(Marker, v[6])
	addEventHandler ( "onClientMarkerHit", Marker, BindSlotMachine )
	addEventHandler ( "onClientMarkerLeave", Marker, UnBindSlotMachine )
end
