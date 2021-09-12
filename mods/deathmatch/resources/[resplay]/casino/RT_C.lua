	-----------------------
	---- Main Roulette ----
	-----------------------

local screenW, screenH = guiGetScreenSize()
RouletteBG = guiCreateStaticImage((screenW - 1000) / 2, (screenH - 500) / 2, 1000, 500, "img/RT.png", false)
RT_Counter_BG = guiCreateStaticImage(151, 108, 98, 98, "img/GrnRtBox.png", false, RouletteBG)
RT_Counter_Label = guiCreateLabel(25, 27, 49, 43, "00", false, RT_Counter_BG)
guiSetFont(RT_Counter_Label, "sa-header")
guiLabelSetHorizontalAlign(RT_Counter_Label, "center")
guiLabelSetVerticalAlign(RT_Counter_Label, "center")
RTStart = guiCreateStaticImage(74, 365, 257, 73, "img/White.png", false, RouletteBG)
RTClose = guiCreateStaticImage(925, 21, 52, 50, "img/Close.png", false, RouletteBG)

	-----------------
	---- Numbers ----
	-----------------
RT1 = guiCreateStaticImage(464, 272, 33, 37, "img/White.png", false, RouletteBG)
RT2 = guiCreateStaticImage(464, 231, 33, 37, "img/White.png", false, RouletteBG)
RT3 = guiCreateStaticImage(464, 187, 33, 40, "img/White.png", false, RouletteBG)
RT4 = guiCreateStaticImage(502, 272, 29, 37, "img/White.png", false, RouletteBG)
RT5 = guiCreateStaticImage(502, 231, 29, 37, "img/White.png", false, RouletteBG)
RT6 = guiCreateStaticImage(502, 190, 29, 37, "img/White.png", false, RouletteBG)
RT7 = guiCreateStaticImage(535, 272, 29, 37, "img/White.png", false, RouletteBG)
RT8 = guiCreateStaticImage(535, 231, 29, 37, "img/White.png", false, RouletteBG)
RT9 = guiCreateStaticImage(535, 190, 29, 37, "img/White.png", false, RouletteBG)
RT10 = guiCreateStaticImage(569, 272, 29, 37, "img/White.png", false, RouletteBG)
RT11 = guiCreateStaticImage(569, 231, 29, 37, "img/White.png", false, RouletteBG)
RT12 = guiCreateStaticImage(0.57, 0.38, 0.03, 0.07, "img/White.png", true, RouletteBG)
RT13 = guiCreateStaticImage(602, 272, 29, 37, "img/White.png", false, RouletteBG)
RT16 = guiCreateStaticImage(636, 272, 29, 37, "img/White.png", false, RouletteBG)
RT19 = guiCreateStaticImage(671, 272, 29, 37, "img/White.png", false, RouletteBG)
RT22 = guiCreateStaticImage(704, 272, 29, 37, "img/White.png", false, RouletteBG)
RT25 = guiCreateStaticImage(738, 272, 29, 37, "img/White.png", false, RouletteBG)
RT28 = guiCreateStaticImage(771, 272, 29, 37, "img/White.png", false, RouletteBG)
RT31 = guiCreateStaticImage(804, 272, 29, 37, "img/White.png", false, RouletteBG)
RT34 = guiCreateStaticImage(839, 272, 29, 37, "img/White.png", false, RouletteBG)
RT14 = guiCreateStaticImage(602, 231, 29, 37, "img/White.png", false, RouletteBG)
RT17 = guiCreateStaticImage(636, 231, 29, 37, "img/White.png", false, RouletteBG)
RT20 = guiCreateStaticImage(671, 231, 29, 37, "img/White.png", false, RouletteBG)
RT23 = guiCreateStaticImage(704, 231, 29, 37, "img/White.png", false, RouletteBG)
RT26 = guiCreateStaticImage(738, 231, 29, 37, "img/White.png", false, RouletteBG)
RT29 = guiCreateStaticImage(771, 231, 29, 37, "img/White.png", false, RouletteBG)
RT32 = guiCreateStaticImage(804, 231, 29, 37, "img/White.png", false, RouletteBG)
RT35 = guiCreateStaticImage(839, 231, 29, 37, "img/White.png", false, RouletteBG)
RT15 = guiCreateStaticImage(602, 190, 29, 37, "img/White.png", false, RouletteBG)
RT18 = guiCreateStaticImage(636, 190, 29, 37, "img/White.png", false, RouletteBG)
RT21 = guiCreateStaticImage(671, 190, 29, 37, "img/White.png", false, RouletteBG)
RT24 = guiCreateStaticImage(704, 190, 29, 37, "img/White.png", false, RouletteBG)
RT27 = guiCreateStaticImage(738, 190, 29, 37, "img/White.png", false, RouletteBG)
RT30 = guiCreateStaticImage(771, 190, 29, 37, "img/White.png", false, RouletteBG)
RT33 = guiCreateStaticImage(804, 190, 29, 37, "img/White.png", false, RouletteBG)
RT36 = guiCreateStaticImage(839, 190, 29, 37, "img/White.png", false, RouletteBG)
RT00 = guiCreateStaticImage(431, 201, 33, 40, "img/White.png", false, RouletteBG)
RT0 = guiCreateStaticImage(431, 251, 33, 40, "img/White.png", false, RouletteBG)

	-------------------
	---- More Luck ----
	-------------------

RT1To18 = guiCreateStaticImage(464, 146, 202, 41, "img/White.png", false, RouletteBG)
RT19To36 = guiCreateStaticImage(671, 146, 203, 41, "img/White.png", false, RouletteBG)
RT1To12 = guiCreateStaticImage(497, 313, 67, 37, "img/White.png", false, RouletteBG)
RT13To24 = guiCreateStaticImage(631, 313, 67, 37, "img/White.png", false, RouletteBG)
RT25To36 = guiCreateStaticImage(771, 313, 67, 37, "img/White.png", false, RouletteBG)
RTFard = guiCreateStaticImage(782, 355, 67, 37, "img/White.png", false, RouletteBG)
RTBlack = guiCreateStaticImage(688, 355, 67, 37, "img/White.png", false, RouletteBG)
RTRed = guiCreateStaticImage(588, 355, 67, 37, "img/White.png", false, RouletteBG)
RTZoj = guiCreateStaticImage(487, 355, 67, 37, "img/White.png", false, RouletteBG)
guiSetProperty(RouletteBG, "Visible", "False")

	-------------------
	---- Scripting ----
	-------------------
	
RouletteMarkers = {  
	-- {x, y, z, size, dimension, interior}
	{2241.029296875 ,1615.9228515625 ,1006.1806640625, 1, 0, 1},
	{2230.9697265625 ,1618.2880859375 ,1006.1789550781, 1, 0, 1},
	{2241.95703125 ,1596.1259765625 ,1006.1851806641, 1, 0, 1},
	{ 1962.3427734375 , 1025.2451171875 , 992.46875 , 1, 0, 10 },
	{ 1958.0302734375 , 1009.689453125 , 992.46875 , 1, 0, 10 },
	{ 1946.068359375 , 986.9931640625 , 992.46875 , 1, 0, 10 },
	{ 1121.3681640625 , -1.6552734375 , 1000.6796875 , 1, 0, 12 },
}

RT_Bets = {
	--{ BetID , "BetValue" , "BetColor" },
	{ 1 , "1" , "RedRtBox" },{ 2 , "2" , "BlkRtBox" },{ 3 , "3" , "RedRtBox" },
	{ 4 , "4" , "BlkRtBox" },{ 5 , "5" , "RedRtBox" },{ 6 , "6" , "BlkRtBox" },
	{ 7 , "7" , "RedRtBox" },{ 8 , "8" , "BlkRtBox" },{ 9 , "9" , "RedRtBox" },
	{ 10 , "10" , "BlkRtBox" },{ 11 , "11" , "BlkRtBox" },{ 12 , "12" , "RedRtBox" },
	{ 13 , "13" , "BlkRtBox" },{ 14 , "14" , "RedRtBox" },{ 15 , "15" , "BlkRtBox" },
	{ 16 , "16" , "RedRtBox" },{ 17 , "17" , "BlkRtBox" },{ 18 , "18" , "RedRtBox" },
	{ 19 , "19" , "RedRtBox" },{ 20 , "20" , "BlkRtBox" },{ 21 , "21" , "RedRtBox" },
	{ 22 , "22" , "BlkRtBox" },{ 23 , "23" , "RedRtBox" },{ 24 , "24" , "BlkRtBox" },
	{ 25 , "25" , "RedRtBox" },{ 26 , "26" , "BlkRtBox" },{ 27 , "27" , "RedRtBox" },
	{ 28 , "28" , "BlkRtBox" },{ 29 , "29" , "BlkRtBox" },{ 30 , "30" , "RedRtBox" },
	{ 31 , "31" , "BlkRtBox" },{ 32 , "32" , "RedRtBox" },{ 33 , "33" , "BlkRtBox" },
	{ 34 , "34" , "RedRtBox" },{ 35 , "35" , "BlkRtBox" },{ 36 , "36" , "RedRtBox" },
	{ 37 , "0" , "GrnRtBox" },{ 38 , "00" , "GrnRtBox" },
}

function ShowRT ()
	guiSetProperty(RouletteBG, "Visible", "True")
	showCursor(true)
	unbindKey ( "F1", "down", ShowRT )
end

function UnBindRT ( Leave, matchingDimension )
    if Leave == getLocalPlayer() then
		unbindKey ( "F1", "down", ShowRT )
	end
end

function BindRT ( Hit, matchingDimension )
	if Hit == getLocalPlayer() then
		bindKey( "F1", "down", ShowRT )
		--exports["notf"]:addNotification("Baraye Roulette Bazi Kardan Dokme ( Z ) Ra Bezanid!" , 'info')
		outputChatBox('Нажмите F1, чтобы сыграть в рулетку', getLocalPlayer(), 255, 255, 0)
	end
end

for k,v in ipairs(RouletteMarkers) do
	local RTMarker = createMarker ( v[1], v[2], v[3]-1, "cylinder", v[4], 255, 0, 0, 170 )
	setElementDimension(RTMarker, v[5])
	setElementInterior(RTMarker, v[6])
	addEventHandler ( "onClientMarkerHit", RTMarker, BindRT )
	addEventHandler ( "onClientMarkerLeave", RTMarker, UnBindRT )
end

local MyActiveBets = {}
local InRtBetting = false
local InZaribChips = 0

function CheckForRtBets()
	for i=1 , #RT_Bets do
		if MyActiveBets[i] then
			return true
		end
	end
	return false
end

function RemoveRtBets()
	for i=1 , #RT_Bets do
		if MyActiveBets[i] then
			MyActiveBets[i] = nil
		end
	end
end

function BetOnRTForMe ( BetID )
	local RtBetStatus = CheckForRtBets()
	if RtBetStatus then
		RemoveRtBets()
	end
	if BetID < 39 then
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare (( "..RT_Bets[BetID][2].." )) Bet Zadid! ( 50 X )" , 'success')
		MyActiveBets[BetID] = true
		InZaribChips = 25000
	elseif BetID == 39 then --Red
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( Red )) Bet Zadid! ( 3 X )" , 'success')
		for i=1 , #RT_Bets do
			if RT_Bets[i][3] == "RedRtBox" then
				MyActiveBets[i] = true
			end
		end
		InZaribChips = 1500
	elseif BetID == 40 then --Black
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( Black )) Bet Zadid! ( 3 X )" , 'success')
		for i=1 , #RT_Bets do
			if RT_Bets[i][3] == "BlkRtBox" then
				MyActiveBets[i] = true
			end
		end
		InZaribChips = 1500
	elseif BetID == 41 then --Even
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( Zoj )) Bet Zadid! ( 3 X )" , 'success')
		for i=1 , #RT_Bets do
			if (tonumber(RT_Bets[i][2]) % 2 == 0) then
				MyActiveBets[i] = true
			end
		end
		InZaribChips = 1500
	elseif BetID == 42 then --ODD
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( Fard )) Bet Zadid! ( 3 X )" , 'success')
		for i=1 , #RT_Bets do
			if (tonumber(RT_Bets[i][2]) % 2 ~= 0) then
				MyActiveBets[i] = true
			end
		end
		InZaribChips = 1500
	elseif BetID == 43 then --1 To 12
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( 1 - 12 )) Bet Zadid! ( 2 X )" , 'success')
		for i=1 , 12 do
			MyActiveBets[i] = true
		end
		InZaribChips = 1000
	elseif BetID == 44 then --13 To 24
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( 13 - 24 )) Bet Zadid ( 2 X )!" , 'success')
		for i=13 , 24 do
			MyActiveBets[i] = true
		end
		InZaribChips = 1000
	elseif BetID == 45 then --25 To 36
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( 25 - 36 )) Bet Zadid! ( 2 X )" , 'success')
		for i=25 , 36 do
			MyActiveBets[i] = true
		end
		InZaribChips = 1000
	elseif BetID == 46 then --1 To 18
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( 1 - 18 )) Bet Zadid! ( 1.5 X )" , 'success')
		for i=1 , 18 do
			MyActiveBets[i] = true
		end
		InZaribChips = 750
	elseif BetID == 47 then --19 To 36
		--exports["notf"]:addNotification("Shoma Meghdar (( 500 Chips )) Roye Shomare Haye (( 19 - 36 )) Bet Zadid! ( 1.5 X )" , 'success')
		for i=19 , 36 do
			MyActiveBets[i] = true
		end
		InZaribChips = 750
	end
end

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == RTClose then
		if InRtBetting ~= true then
			guiSetProperty(RouletteBG, "Visible", "False")
			local RtBetStatus = CheckForRtBets()
			if RtBetStatus then
				RemoveRtBets()
			end
			
			showCursor(false)
		else
			--exports["notf"]:addNotification("Lotfan Sabr Konid Ta Bet Tamam Shavad!" , 'error')
		end
	elseif source == RT1 then
		BetOnRTForMe ( 1 )
	elseif source == RT2 then
		BetOnRTForMe ( 2 )
	elseif source == RT3 then
		BetOnRTForMe ( 3 )
	elseif source == RT4 then
		BetOnRTForMe ( 4 )
	elseif source == RT5 then
		BetOnRTForMe ( 5 )
	elseif source == RT6 then
		BetOnRTForMe ( 6 )
	elseif source == RT7 then
		BetOnRTForMe ( 7 )
	elseif source == RT8 then
		BetOnRTForMe ( 8 )
	elseif source == RT9 then
		BetOnRTForMe ( 9 )
	elseif source == RT10 then
		BetOnRTForMe ( 10 )
	elseif source == RT11 then
		BetOnRTForMe ( 11 )
	elseif source == RT12 then
		BetOnRTForMe ( 12 )
	elseif source == RT13 then
		BetOnRTForMe ( 13 )
	elseif source == RT14 then
		BetOnRTForMe ( 14 )
	elseif source == RT15 then
		BetOnRTForMe ( 15 )
	elseif source == RT16 then
		BetOnRTForMe ( 16 )
	elseif source == RT17 then
		BetOnRTForMe ( 17 )
	elseif source == RT18 then
		BetOnRTForMe ( 18 )
	elseif source == RT19 then
		BetOnRTForMe ( 19 )
	elseif source == RT20 then
		BetOnRTForMe ( 20 )
	elseif source == RT21 then
		BetOnRTForMe ( 21 )
	elseif source == RT22 then
		BetOnRTForMe ( 22 )
	elseif source == RT23 then
		BetOnRTForMe ( 23 )
	elseif source == RT24 then
		BetOnRTForMe ( 24 )
	elseif source == RT25 then
		BetOnRTForMe ( 25 )
	elseif source == RT26 then
		BetOnRTForMe ( 26 )
	elseif source == RT27 then
		BetOnRTForMe ( 27 )
	elseif source == RT28 then
		BetOnRTForMe ( 28 )
	elseif source == RT29 then
		BetOnRTForMe ( 29 )
	elseif source == RT30 then
		BetOnRTForMe ( 30 )
	elseif source == RT31 then
		BetOnRTForMe ( 31 )
	elseif source == RT32 then
		BetOnRTForMe ( 32 )
	elseif source == RT33 then
		BetOnRTForMe ( 33 )
	elseif source == RT34 then
		BetOnRTForMe ( 34 )
	elseif source == RT35 then
		BetOnRTForMe ( 35 )
	elseif source == RT36 then
		BetOnRTForMe ( 36 )
	elseif source == RT0 then
		BetOnRTForMe ( 37 )
	elseif source == RT00 then
		BetOnRTForMe ( 38 )
	elseif source == RTRed then
		BetOnRTForMe ( 39 )
	elseif source == RTBlack then
		BetOnRTForMe ( 40 )
	elseif source == RTZoj then
		BetOnRTForMe ( 41 )
	elseif source == RTFard then
		BetOnRTForMe ( 42 )
	elseif source == RT1To12 then
		BetOnRTForMe ( 43 )
	elseif source == RT13To24 then
		BetOnRTForMe ( 44 )
	elseif source == RT25To36 then
		BetOnRTForMe ( 45 )
	elseif source == RT1To18 then
		BetOnRTForMe ( 46 )
	elseif source == RT19To36 then
		BetOnRTForMe ( 47 )
	elseif source == RTStart then
		if InRtBetting ~= true then
			local RtBetStatus = CheckForRtBets()
			if RtBetStatus then
				if tonumber(getElementData(getLocalPlayer(),"pChips")) < 500 then
					--exports["notf"]:addNotification("Baraye Inkar Hadaghal (( 500 Chips )) Niaz Darid!" , 'error')
					outputChatBox('У вас недостаточно фишек', getLocalPlayer(), 255, 255, 0)
					return
				end
				triggerServerEvent("TakePlayerChips",getLocalPlayer(),getLocalPlayer(),500)
				InRtBetting = true
				--exports["notf"]:addNotification("Bet Dar Hale Anjam Ast, Lotfan Sabor Bashid!" , 'info')
				local LastRandomID = 1
				setTimer( function()
					local RandomZan = math.random(#RT_Bets)
					guiStaticImageLoadImage ( RT_Counter_BG, "img/"..RT_Bets[RandomZan][3]..".png" )
					guiSetText ( RT_Counter_Label, ""..RT_Bets[RandomZan][2].."")
					LastRandomID = RandomZan
				end, 500, 20)
				setTimer( function()
					InRtBetting = false
					if MyActiveBets[LastRandomID] then
						outputChatBox('Вы выиграли!', getLocalPlayer(), 255, 255, 0)
						triggerServerEvent("GivePlayerChips",getLocalPlayer(),getLocalPlayer(),tonumber(InZaribChips))
					else
						--exports["notf"]:addNotification("Ebteda Bet Bezanid!" , 'error')
					end
					RemoveRtBets()
				end, 11000, 1)
			else
				--exports["notf"]:addNotification("Ebteda Bet Bezanid!" , 'error')
			end
		end
	end
end)