	------------------------
	---- Main Poker Gui ----
	------------------------

local screenW, screenH = guiGetScreenSize()
TCP_BG = guiCreateStaticImage((screenW - 1000) / 2, (screenH - 500) / 2, 1000, 500, "img/Three_C_P.png", false)
MyCard_1 = guiCreateStaticImage(325, 336, 90, 126, "img/White.png", false, TCP_BG)
MyCard_2 = guiCreateStaticImage(452, 336, 90, 126, "img/White.png", false, TCP_BG)
MyCard_3 = guiCreateStaticImage(579, 336, 90, 126, "img/White.png", false, TCP_BG)
DealerCard_1 = guiCreateStaticImage(325, 64, 90, 126, "img/White.png", false, TCP_BG)
DealerCard_2 = guiCreateStaticImage(452, 64, 90, 126, "img/White.png", false, TCP_BG)
DealerCard_3 = guiCreateStaticImage(579, 64, 90, 126, "img/White.png", false, TCP_BG)
PairButton = guiCreateStaticImage(779, 69, 137, 115, "img/White.png", false, TCP_BG)
PlayFoldButton = guiCreateStaticImage(779, 190, 137, 115, "img/White.png", false, TCP_BG)
AnteButton = guiCreateStaticImage(779, 315, 137, 115, "img/White.png", false, TCP_BG)
TCP_Close = guiCreateStaticImage(925, 21, 52, 50, "img/Close.png", false, TCP_BG)
guiSetProperty(TCP_BG, "Visible", "False")

	-------------------
	---- Scripting ----
	-------------------
	
local PlayChips = false
local PairChips = false
local InTcpBet = false
local InWait = false
local MyActiveCards = {}
local HandsTable = {}
-- 1-2-3 Player Cards
-- 4-5-6 Dealer Cards
	
TCPMarkers = {  
	-- {x, y, z, size, dimension, interior}
	{2237.80078125 ,1604.41796875 ,1006.1860351562, 1, 0, 1},
	{2241.3115234375 ,1601.12109375 ,1006.1796875, 1, 0, 1},
	{2230.3701171875 ,1601.12109375 ,1006.1860351562, 1, 0, 1},
	{2230.384765625 ,1607.90234375 ,1006.1860351562, 1, 0, 1},
	{ 1958.73828125 , 1020.1708984375 , 992.46875 , 1, 0, 10 },
	{ 1963.9736328125 , 1015.69921875 , 992.46875 , 1, 0, 10 },
	{ 1128.70703125 , -1.662109375 , 1000.6796875 , 1, 0, 12 },
	{ 1125.2216796875 , -5.0439453125 , 1000.6796875 , 1, 0, 12 },
}

CardsTable = {
--Del
	{ "Del" , "D_2" , 1 , "2" },
	{ "Del" , "D_3" , 2 , "3" },
	{ "Del" , "D_4" , 3 , "4" },
	{ "Del" , "D_5" , 4 , "5" },
	{ "Del" , "D_6" , 5 , "6" },
	{ "Del" , "D_7" , 6 , "7" },
	{ "Del" , "D_8" , 7 , "8" },
	{ "Del" , "D_9" , 8 , "9" },
	{ "Del" , "D_10" , 9 , "10" },
	{ "Del" , "D_J" , 10 , "J" },
	{ "Del" , "D_Q" , 11 , "Q" },
	{ "Del" , "D_K" , 12 , "K" },
	{ "Del" , "D_Ace" , 13 , "Ace" },
--GishNiz
	{ "Gishniz" , "G_2" , 1 , "2" },
	{ "Gishniz" , "G_3" , 2 , "3" },
	{ "Gishniz" , "G_4" , 3 , "4" },
	{ "Gishniz" , "G_5" , 4 , "5" },
	{ "Gishniz" , "G_6" , 5 , "6" },
	{ "Gishniz" , "G_7" , 6 , "7" },
	{ "Gishniz" , "G_8" , 7 , "8" },
	{ "Gishniz" , "G_9" , 8 , "9" },
	{ "Gishniz" , "G_10" , 9 , "10" },
	{ "Gishniz" , "G_J" , 10 , "J" },
	{ "Gishniz" , "G_Q" , 11 , "Q" },
	{ "Gishniz" , "G_K" , 12 , "K" },
	{ "Gishniz" , "G_Ace" , 13 , "Ace" },
--khesht
	{ "Khesht" , "K_2" , 1 , "2" },
	{ "Khesht" , "K_3" , 2 , "3" },
	{ "Khesht" , "K_4" , 3 , "4" },
	{ "Khesht" , "K_5" , 4 , "5" },
	{ "Khesht" , "K_6" , 5 , "6" },
	{ "Khesht" , "K_7" , 6 , "7" },
	{ "Khesht" , "K_8" , 7 , "8" },
	{ "Khesht" , "K_9" , 8 , "9" },
	{ "Khesht" , "K_10" , 9 , "10" },
	{ "Khesht" , "K_J" , 10 , "J" },
	{ "Khesht" , "K_Q" , 11 , "Q" },
	{ "Khesht" , "K_K" , 12 , "K" },
	{ "Khesht" , "K_Ace" , 13 , "Ace" },
--Pik
	{ "Pik" , "P_2" , 1 , "2" },
	{ "Pik" , "P_3" , 2 , "3" },
	{ "Pik" , "P_4" , 3 , "4" },
	{ "Pik" , "P_5" , 4 , "5" },
	{ "Pik" , "P_6" , 5 , "6" },
	{ "Pik" , "P_7" , 6 , "7" },
	{ "Pik" , "P_8" , 7 , "8" },
	{ "Pik" , "P_9" , 8 , "9" },
	{ "Pik" , "P_10" , 9 , "10" },
	{ "Pik" , "P_J" , 10 , "J" },
	{ "Pik" , "P_Q" , 11 , "Q" },
	{ "Pik" , "P_K" , 12 , "K" },
	{ "Pik" , "P_Ace" , 13 , "Ace" },
}

function getRandomPokerCard ()
	local RandomCard = math.random(#CardsTable)
	if not MyActiveCards[RandomCard] then
		MyActiveCards[RandomCard] = true
		return RandomCard
	else
		return getRandomPokerCard()
	end
end

function DastBedeBePlayer ()
	guiStaticImageLoadImage ( DealerCard_1, "img/D_B.png" )
	guiStaticImageLoadImage ( DealerCard_2, "img/D_B.png" )
	guiStaticImageLoadImage ( DealerCard_3, "img/D_B.png" )
	guiStaticImageLoadImage ( MyCard_1, "img/M_B.png" )
	guiStaticImageLoadImage ( MyCard_2, "img/M_B.png" )
	guiStaticImageLoadImage ( MyCard_3, "img/M_B.png" )
	for i=1 , 6 do
		HandsTable[i] = getRandomPokerCard()
	end
end

function ShowTCP ()
	guiSetProperty(TCP_BG, "Visible", "True")
	showCursor(true)
	unbindKey ( "Z", "down", ShowTCP )
end

function UnBindTCP ( Leave, matchingDimension )
    if Leave == getLocalPlayer() then
		unbindKey ( "Z", "down", ShowTCP )
	end
end

function BindTCP ( Hit, matchingDimension )
	if Hit == getLocalPlayer() then
		bindKey( "Z", "down", ShowTCP )
		--exports["notf"]:addNotification("Baraye Poker Bazi Kardan Dokme ( Z ) Ra Bezanid!" , 'info')
	end
end

for k,v in ipairs(TCPMarkers) do
	local TCPMarker = createMarker ( v[1], v[2], v[3]-1, "cylinder", v[4], 255, 0, 0, 170 )
	setElementDimension(TCPMarker, v[5])
	setElementInterior(TCPMarker, v[6])
	addEventHandler ( "onClientMarkerHit", TCPMarker, BindTCP )
	addEventHandler ( "onClientMarkerLeave", TCPMarker, UnBindTCP )
end

function RestartPokerTable ()
	PlayChips = false
	PairChips = false
	guiStaticImageLoadImage ( DealerCard_1, "img/White.png" )
	guiStaticImageLoadImage ( DealerCard_2, "img/White.png" )
	guiStaticImageLoadImage ( DealerCard_3, "img/White.png" )
	guiStaticImageLoadImage ( MyCard_1, "img/White.png" )
	guiStaticImageLoadImage ( MyCard_2, "img/White.png" )
	guiStaticImageLoadImage ( MyCard_3, "img/White.png" )
	for i=1 , #CardsTable do
		if MyActiveCards[i] then
			MyActiveCards[i] = nil
		end
	end
	for i=1 , 6 do
		if HandsTable[i] then
			HandsTable[i] = nil
		end
	end
end


--[[local MiniRoyalTable = {}
function CheckForMiniRoyal ( Aval, Dovom , Sevom )
	local Aval = CardsTable[HandsTable[4[2]
end]]

function CheckForStraightFlush ( Aval, Dovom , Sevom )
	if CardsTable[HandsTable[Aval]][1] == CardsTable[HandsTable[Dovom]][1] 
	and CardsTable[HandsTable[Dovom]][1] == CardsTable[HandsTable[Sevom]][1] then
		local SFT = { CardsTable[HandsTable[Aval]][3] , CardsTable[HandsTable[Dovom]][3] , CardsTable[HandsTable[Sevom]][3] }
		table.sort(SFT)
		for i=1 , 2 do
			if (SFT[i+1]-SFT[i]) ~= 1 then
				return false
			end
		end
		return true
	end
	return false
end

function CheckForThreeOfAKind ( Aval, Dovom , Sevom )
	if CardsTable[HandsTable[Aval]][3] == CardsTable[HandsTable[Dovom]][3] 
	and CardsTable[HandsTable[Dovom]][3] == CardsTable[HandsTable[Sevom]][3] then
		return true
	end
	return false
end

function CheckForStraight ( Aval, Dovom , Sevom )
	local STR = { CardsTable[HandsTable[Aval]][3] , CardsTable[HandsTable[Dovom]][3] , CardsTable[HandsTable[Sevom]][3] }
	table.sort(STR)
	for i=1 , 2 do
		if (STR[i+1]-STR[i]) ~= 1 then
			return false
		end
	end
	return true
end

function CheckForFlush ( Aval, Dovom , Sevom )
	if CardsTable[HandsTable[Aval]][1] == CardsTable[HandsTable[Dovom]][1] 
	and CardsTable[HandsTable[Dovom]][1] == CardsTable[HandsTable[Sevom]][1] then
		return true
	end
	return false
end

function CheckForPair ( Aval, Dovom , Sevom )
	if CardsTable[HandsTable[Aval]][3] == CardsTable[HandsTable[Dovom]][3] or
	CardsTable[HandsTable[Aval]][3] == CardsTable[HandsTable[Sevom]][3] or
	CardsTable[HandsTable[Dovom]][3] == CardsTable[HandsTable[Sevom]][3] then
		return true
	end
	return false
end

function GetCardsValue ( Aval, Dovom , Sevom )
	local MyCardValue = CardsTable[HandsTable[Aval]][3] + CardsTable[HandsTable[Dovom]][3] + CardsTable[HandsTable[Sevom]][3]
	return MyCardValue
end

function RevealWinner ( WinnerID , WinType , Zarib )
	if WinnerID == 1 then -- My Win
		if WinType == "Pair" and PairChips == true then
			--exports["notf"]:addNotification("Tabrik, Shoma In Round Ra Barande Shodid! (( "..WinType.." )) +1200 Chips" , 'success')
			triggerServerEvent("GivePlayerChips",getLocalPlayer(),getLocalPlayer(),1200)
		else
			--exports["notf"]:addNotification("Tabrik, Shoma In Round Ra Barande Shodid! (( "..WinType.." )) +800 Chips" , 'success')
			triggerServerEvent("GivePlayerChips",getLocalPlayer(),getLocalPlayer(),800)
		end
	elseif WinnerID == 2 then -- Dealer Win
		--exports["notf"]:addNotification("Dealer In Round Ra Az Shoma Bord! (( "..WinType.." ))" , 'warning')
	end
end

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == TCP_Close then
		if InWait == true then
			--exports["notf"]:addNotification("Lotfan Sabr Konid!" , 'error')
			return
		end
		RestartPokerTable()
		guiSetProperty(TCP_BG, "Visible", "False")
		showCursor(false)
	elseif source == PlayFoldButton then
		if InWait == true then
			--exports["notf"]:addNotification("Lotfan Sabr Konid!" , 'error')
			return
		end
		if PlayChips ~= true then
			if tonumber(getElementData(getLocalPlayer(),"pChips")) < 200 then
				--exports["notf"]:addNotification("Baraye Inkar Hadaghal (( 200 Chips )) Niaz Darid!" , 'error')
				return
			end
			triggerServerEvent("TakePlayerChips",getLocalPlayer(),getLocalPlayer(),200)
			--exports["notf"]:addNotification("Shoma Ba Movafaghiat Ba (( 200 Chips )) Bazi Ra Shoro Kardid!" , 'info')
			PlayChips = true
			DastBedeBePlayer()
		end
	elseif source == PairButton then
		if PlayChips ~= true then
			if PairChips == true then
				--exports["notf"]:addNotification("Shoma 1 Bar (( Pair Plus )) Zadeid!" , 'error')
				return
			end
			if tonumber(getElementData(getLocalPlayer(),"pChips")) < 100 then
				--exports["notf"]:addNotification("Baraye Inkar Hadaghal (( 100 Chips )) Niaz Darid!" , 'error')
				return
			end
			triggerServerEvent("TakePlayerChips",getLocalPlayer(),getLocalPlayer(),100)
			--exports["notf"]:addNotification("Shoma (( 100 Chips )) Baraye (( Pair Plus )) Bet Zadid!" , 'info')
			PairChips = true
		else
			--exports["notf"]:addNotification("Faghat Ghable Play Mitonid Inkaro Anjam Bedi!" , 'error')
		end
	elseif PlayChips == true then
		if source == PairButton then
		elseif source == MyCard_1 then
			guiStaticImageLoadImage ( MyCard_1, "img/"..CardsTable[HandsTable[1]][2]..".png" )
		elseif source == MyCard_2 then
			guiStaticImageLoadImage ( MyCard_2, "img/"..CardsTable[HandsTable[2]][2]..".png" )
		elseif source == MyCard_3 then
			guiStaticImageLoadImage ( MyCard_3, "img/"..CardsTable[HandsTable[3]][2]..".png" )
		elseif source == AnteButton then
			if InWait == true then
				--exports["notf"]:addNotification("Lotfan Sabr Konid!" , 'error')
				return
			end
			if tonumber(getElementData(getLocalPlayer(),"pChips")) < 200 then
				--exports["notf"]:addNotification("Baraye Inkar Hadaghal (( 200 Chips )) Niaz Darid!" , 'error')
				return
			end
			triggerServerEvent("TakePlayerChips",getLocalPlayer(),getLocalPlayer(),200)
			guiStaticImageLoadImage ( MyCard_1, "img/"..CardsTable[HandsTable[1]][2]..".png" )
			guiStaticImageLoadImage ( MyCard_2, "img/"..CardsTable[HandsTable[2]][2]..".png" )
			guiStaticImageLoadImage ( MyCard_3, "img/"..CardsTable[HandsTable[3]][2]..".png" ) 
			guiStaticImageLoadImage ( DealerCard_1, "img/"..CardsTable[HandsTable[4]][2]..".png" )
			guiStaticImageLoadImage ( DealerCard_2, "img/"..CardsTable[HandsTable[5]][2]..".png" )
			guiStaticImageLoadImage ( DealerCard_3, "img/"..CardsTable[HandsTable[6]][2]..".png" ) 
			if CheckForStraightFlush ( 1 , 2 , 3 ) then --My Straight Flush
				RevealWinner ( 1 , "Straight Flush" , 30 )
			elseif CheckForStraightFlush ( 4 , 5 , 6 ) then --Dealer Straight Flush
				RevealWinner ( 2 , "Straight Flush" , 0 )
			elseif CheckForThreeOfAKind ( 1 , 2 , 3 ) then -- My Three Of A Kind
				RevealWinner ( 1 , "Three Of A Kind" , 20 )
			elseif CheckForThreeOfAKind ( 4 , 5 , 6 ) then -- Dealer Three Of A Kind
				RevealWinner ( 2 , "Three Of A Kind" , 0 )
			elseif CheckForStraight ( 1 , 2 , 3 ) then -- My Straight
				RevealWinner ( 1 , "Straight" , 10 )
			elseif CheckForStraight ( 4 , 5 , 6 ) then -- Dealer Straight
				RevealWinner ( 2 , "Straight" , 0 )
			elseif CheckForFlush ( 1 , 2 , 3 ) then -- My Flush
				RevealWinner ( 1 , "Flush" , 8 )
			elseif CheckForFlush ( 4 , 5 , 6 ) then -- Dealer Flush
				RevealWinner ( 2 , "Flush" , 0 )
			elseif CheckForPair ( 1 , 2 , 3 ) then -- My Pair
				RevealWinner ( 1 , "Pair" , 6 )
			elseif CheckForPair ( 4 , 5 , 6 ) then -- Dealer Pair
				RevealWinner ( 2 , "Pair" , 0 )
			elseif GetCardsValue ( 4 , 5 , 6 ) > GetCardsValue( 1 , 2 , 3 ) then -- Dealer Cards High
				RevealWinner ( 2 , "High Card" , 0 )
			else -- My Cards High
				RevealWinner ( 1 , "High Card" , 2 )
			end
			InWait = true
			setTimer( function()
				RestartPokerTable()
				InWait = false
			end, 7000, 1)
		end
	end
end)