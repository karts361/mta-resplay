local cFunc = {}
local cSetting = {}

addEvent("onMTPongStart", true)

cSetting["enabled"] = false

local aesx, aesy = 1600, 900
local sx, sy = guiGetScreenSize()

cSetting["game_started"] = false

cSetting["player_1_pos"] = (sy/2)
cSetting["player_2_pos"] = (sy/2)

cSetting["pong_posx"] = sx/2
cSetting["pong_posy"] = sy/2

cSetting["pong_state"] = 1

--[[ 
STATES:
1 = Gradeaus nach links
2 = Gradeaus nach Rechts
3 = Rechts Oben
4 = Links Oben
5 = Rechts Unten
6 = Links unten

]]

-- SETTINGS BASED ON A FRAMERATE OF 60 FRAMES --
-- THE SPEED WILL AUTOMATICALLY UPDATE --

cSetting["default_pong_speed"] = 14  -- The Speeed of the pong - Default: 14
cSetting["default_pong_hardcore"] = 7  -- The Speeed of the NPC - Default: 7
cSetting["normal_framerate"] = 60 -- THE FRAMERATE OF THE GAME - Default: 60
cSetting["using_equalspeed"] = true -- Using the Speed in every Framerate or be slower - Default: true
-- Description:
--[[
	The speed is based on the framerate.

	If you set the framerate to 60 and the speed to 14, the pong ball will move 14 pixels every frame.

	If you have a lower framerate, it will automatically detect and move the ball more pixels away.
]]
-- DO NOT EDIT THIS  --
cSetting["pong_speed"] = 14
cSetting["pong_hardcode"] = 7

cSetting["ich"] = 0
cSetting["npc"] = 0

cSetting["last_tick"] = getTickCount()
cSetting["frame_rate"] = 0
cSetting["temp_rate"] = 0
-- FUNCTIONS --

cFunc["draw_pong"] = function()
	if(cSetting["enabled"] == true) then
		showCursor(true)
		-- BACKGROUND --
		dxDrawRectangle(0, 0, sx, sy, tocolor(0, 0, 0, 255), true)
		-- RAENDER --
		dxDrawRectangle(21/aesx*sx, 13/aesy*sy, 1558/aesx*sx, 30/aesy*sy, tocolor(255, 255, 255, 255), true)
		dxDrawRectangle(23/aesx*sx, 861/aesy*sy, 1558/aesx*sx, 30/aesy*sy, tocolor(255, 255, 255, 255), true)
		--
		dxDrawRectangle(784/aesx*sx, 54/aesy*sy, 22/aesx*sx, 798/aesy*sy, tocolor(255, 255, 255, 165), true)
		-- POS --
		dxDrawRectangle(48/aesx*sx, cSetting["player_1_pos"], 19/aesx*sx, 151/aesy*sy, tocolor(255, 255, 255, 255), true)
		dxDrawRectangle(1538/aesx*sx, cSetting["player_2_pos"], 19/aesx*sx, 151/aesy*sy, tocolor(255, 255, 255, 255), true)
		
		-- SCORE --
		
		dxDrawText(cSetting["npc"], 1172/aesx*sx, 60/aesy*sy, 1355/aesx*sx, 169/aesy*sy, tocolor(255, 255, 255, 255), 4/(aesx+aesy)*(sx+sy), "pricedown", "center", "center", false, false, true, false, false)
		dxDrawText(cSetting["ich"], 256/aesx*sx, 54/aesy*sy, 439/aesx*sx, 163/aesy*sy, tocolor(255, 255, 255, 255), 4/(aesx+aesy)*(sx+sy), "pricedown", "center", "center", false, false, true, false, false)
		
		-- PONG --
		local r, g, b, a = 255, 255, 255, 255
		if(cSetting["imAus"] == true) then
			r, g, b, a = 255, 0, 0, 200
		end
		dxDrawRectangle(cSetting["pong_posx"], cSetting["pong_posy"], 25/aesx*sx, 25/aesy*sy, tocolor(r, g, b, a), true)
		-- CALCULATE FRAMERATE --
		
		local tick = getTickCount()
		
		if(tick-cSetting["last_tick"] >= 1000) then
			cSetting["frame_rate"] = cSetting["temp_rate"]
			cSetting["temp_rate"] = 0
			cSetting["last_tick"] = getTickCount()
		else
			cSetting["temp_rate"] = cSetting["temp_rate"]+1
		end
		if(cSetting["frame_rate"] ~= 0) then
			cSetting["pong_speed"] = cSetting["default_pong_speed"]*cSetting["normal_framerate"]/cSetting["frame_rate"]	
			cSetting["pong_hardcore"] = cSetting["default_pong_hardcore"]*cSetting["normal_framerate"]/cSetting["frame_rate"]
		end
	end
end

cFunc["reset_ball"] = function(without)
	cSetting["player_1_pos"] = (sy/2)
	cSetting["player_2_pos"] = (sy/2)
	
	cSetting["pong_posx"] = sx/2
	cSetting["pong_posy"] = sy/2
	
	cSetting["pong_state"] = 1
	if not(without) then
		addEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
	end
	cSetting["imAus"] = false
end

cFunc["check_win"] = function()
	setTimer(function()
		if(cSetting["ich"] >= 10) then
			outputInfobox("Congratulations! You won the match!", 0, 255, 0)
			cFunc["disable_pong"]()
			cFunc["play_pongsound"]("pong_win")
		elseif(cSetting["npc"] >= 10) then
			outputInfobox("You lost the match!", 255, 0, 0)
			cFunc["disable_pong"]()
		else
			cFunc["reset_ball"]()
		end
	end, 3000, 1)
end

cSetting["pong_yadd"] = 0

cFunc["calculate_pongpos"] = function()
	if(cSetting["enabled"] == true) then
		if(cSetting["pong_state"] == 1) then
			cSetting["pong_posx"] = cSetting["pong_posx"]-cSetting["pong_speed"]
		elseif(cSetting["pong_state"] == 2) then
			cSetting["pong_posx"] = cSetting["pong_posx"]+cSetting["pong_speed"]
		elseif(cSetting["pong_state"] == 3) then
			cSetting["pong_posx"] = cSetting["pong_posx"]+cSetting["pong_speed"]
			cSetting["pong_posy"] = cSetting["pong_posy"]+cSetting["pong_yadd"]
		elseif(cSetting["pong_state"] == 4) then
			cSetting["pong_posx"] = cSetting["pong_posx"]-cSetting["pong_speed"]
			cSetting["pong_posy"] = cSetting["pong_posy"]-cSetting["pong_yadd"]
		elseif(cSetting["pong_state"] == 5) then
			cSetting["pong_posx"] = cSetting["pong_posx"]+cSetting["pong_speed"]
			cSetting["pong_posy"] = cSetting["pong_posy"]-cSetting["pong_yadd"]
		elseif(cSetting["pong_state"] == 6) then
			cSetting["pong_posx"] = cSetting["pong_posx"]-cSetting["pong_speed"]
			cSetting["pong_posy"] = cSetting["pong_posy"]+cSetting["pong_yadd"]
		end
		
		-- PONG CHECK --
		-- PLAYERCHECK --
		local y1 = cSetting["player_1_pos"]
		local y2 = cSetting["pong_posy"]
		
		local distanzZurMitte = math.floor((y1-y2)+((151/aesy*sy)/2)-(25/aesy*sy)/2) -- WTF :D
		
		--local dis = math.floor((getDistanceBetweenPoints2D((48/aesx*sx), y2-distanzZurMitte/2, cSetting["pong_posx"], cSetting["pong_posy"])))
		
		--if(distanzZurMitte < 88/aesy*sy) and (dis <= 19/aesx*sx) then
		if(cSetting["pong_posx"]-48/aesx*sx < 25/aesx*sx) and (distanzZurMitte < (151/aesy*sy)-25/aesx*sx) and (distanzZurMitte > (-151/aesy*sy)+25/aesx*sx)  then
			if(distanzZurMitte/2 > 44/aesy*sy) then
				cSetting["pong_state"] = 3 -- Rechts oben
				cFunc["play_pongsound"]("pong_hit")
			else
				cSetting["pong_state"] = 5 -- Rechts unten
				cFunc["play_pongsound"]("pong_hit")
			end
			cSetting["pong_yadd"] = (distanzZurMitte/10)
		end
		-- RAENDER CHECK --
		if(cSetting["pong_posy"]-30/aesy*sy < 25/aesx*sx) then
			cSetting["pong_yadd"] = -cSetting["pong_yadd"]
		end
		
		if(cSetting["pong_posy"]-30/aesy*sy > (861/aesy*sy)-(30/aesy*sy)*2) then
			cSetting["pong_yadd"] = -cSetting["pong_yadd"]
		end
		
		local y1 = cSetting["player_2_pos"]
		local y2 = cSetting["pong_posy"]
		
		distanzZurMitte = math.floor((y1-y2)+((151/aesy*sy)/2)-(25/aesy*sy)/2) -- WTF :D
		
		if(cSetting["pong_posx"] > (1538/aesx*sx)-(25/aesy*sy)) and (distanzZurMitte < (151/aesy*sy)-25/aesx*sx) and (distanzZurMitte > (-151/aesy*sy)+25/aesx*sx)  then
			if(distanzZurMitte/2 < 44/aesy*sy) then
				cSetting["pong_state"] = 4 -- Links unten
				cFunc["play_pongsound"]("pong_hit")
			else
				cSetting["pong_state"] = 6 -- Links oben
				cFunc["play_pongsound"]("pong_hit")
			end
			cSetting["pong_yadd"] = (distanzZurMitte/10)
		end
		
		if(cSetting["player_2_pos"] >= cSetting["pong_posy"]) then
			cSetting["player_2_pos"] = cSetting["player_2_pos"]-cSetting["pong_hardcode"]
			-- WIN CHECK --
		elseif(cSetting["player_2_pos"] <= cSetting["pong_posy"]) then
			cSetting["player_2_pos"] = cSetting["player_2_pos"]+cSetting["pong_hardcode"]
		end
		
		if(cSetting["pong_posx"] > 1538/aesx*sx) then
			removeEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
			cSetting["ich"] = cSetting["ich"]+1
			cFunc["check_win"]()
			cSetting["imAus"] = true
			cSetting["pong_state"] = 1
			cFunc["play_pongsound"]("pong_point")
		elseif(cSetting["pong_posx"] < 48/aesx*sx) then
			removeEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
			cSetting["npc"] = cSetting["npc"]+1
			cFunc["check_win"]()
			cSetting["imAus"] = true
			cFunc["play_pongsound"]("pong_warning")
			cSetting["pong_state"] = 2
		end
		--[[
		if(cSetting["player_2_pos"] > cSetting["pong_posy"]) and (cSetting["pong_posy"] > 708/aesy*sy) then
			cSetting["player_2_pos"] = cSetting["player_2_pos"]+5
		elseif(cSetting["player_2_pos"] < cSetting["pong_posy"]) and (cSetting["pong_posy"] > 708/aesy*sy) then
			cSetting["player_2_pos"] = cSetting["player_2_pos"]-5
		end]]
		

	end
end

cFunc["enable_pong"] = function()
	if tonumber(getElementData(getLocalPlayer(),"pChips")) < 100 then
		--exports["notf"]:addNotification("Baraye Inkar Hadaghal (( 100 Chips )) Niaz Darid!" , 'error')
		outputChatBox('У вас недостаточно фишек, нужно 100', getLocalPlayer(), 255, 255, 0)
		return
	end
	triggerServerEvent("TakePlayerChips",getLocalPlayer(),getLocalPlayer(),100)
	if(cSetting["enabled"] == false) then
		unbindKey ( "F1", "down", cFunc["enable_pong"] )
		--exports["notf"]:addNotification("Baraye Etmam Bazi Dokme ( Z ) Ra Bezanid!" , 'info')
		outputChatBox('Нажмите на F1, чтобы сыграть', getLocalPlayer(), 255, 255, 0)
		cSetting["enabled"] = true
		addEventHandler("onClientRender", getRootElement(), cFunc["draw_pong"])
		if(isTimer(cSetting["game_started_timer"])) then
			killTimer(cSetting["game_started_timer"])
		end
		cSetting["game_started_timer"] = setTimer(function()
			cSetting["game_started"] = true
			addEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
			cSetting["ich"] = 0
			cSetting["npc"] = 0
		
		end, 1000, 1)
		bindKey("Z", "down", cFunc["disable_pong"])
	end
end

cFunc["disable_pong"] = function()
	if(cSetting["enabled"] == true) then
		cSetting["enabled"] = false
		removeEventHandler("onClientRender", getRootElement(), cFunc["draw_pong"])
		removeEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
		if(isTimer(cSetting["game_started_timer"])) then
			killTimer(cSetting["game_started_timer"])
			removeEventHandler("onClientRender", getRootElement(), cFunc["calculate_pongpos"])
		end
		cFunc["reset_ball"]("without")
		showCursor(false)
	end
end

cFunc["play_pongsound"] = function(sound)
	--playSound("data/sounds/"..sound..".mp3", false)
end

function outputInfobox(...)
	return outputChatBox(...)
end

-- MOUSE SETTINGS --

cSetting["last_x"] = 0
cSetting["last_y"] = 0

addEventHandler( "onClientCursorMove", getRootElement( ), function ( _, _, x, y )
	if(cSetting["enabled"] == true) then
		cSetting["player_1_pos"] = y
		--[[
		if(y ~= cSetting["last_y"]) then
			
			cSetting["last_y"] = y
		end]]
		
		cSetting["player_1_pos"] = y
		
		if(cSetting["player_1_pos"] > 708/aesy*sy) then
			cSetting["player_1_pos"] = 708/aesy*sy
		elseif(cSetting["player_1_pos"] < 45) then
			cSetting["player_1_pos"] = 45/aesy*sy
		end
	end
end)

--Markere Pong
PongMarkersTable = {  
	-- {x, y, z, size, dimension, interior}
	{2252.427734375 ,1596.4853515625 ,1006.1796875, 1, 0, 1},
	{2252.4267578125 ,1589.8203125 ,1006.1796875, 1, 0, 1},
	{2254.9638671875 ,1589.8017578125 ,1006.1796875, 1, 0, 1},
	{2257.451171875 ,1589.830078125 ,1006.1796875, 1, 0, 1},
	{2259.9951171875 ,1589.732421875 ,1006.1796875, 1, 0, 1},
	{2262.849609375 ,1589.833984375 ,1006.1796875, 1, 0, 1},
	{2265.4169921875 ,1589.794921875 ,1006.1796875, 1, 0, 1},
	{2267.9111328125 ,1589.845703125 ,1006.1796875, 1, 0, 1},
	{2270.4638671875 ,1589.7529296875 ,1006.1796875, 1, 0, 1},
	{2272.6533203125 ,1589.8134765625 ,1006.1796875, 1, 0, 1},
	{2275.2138671875 ,1589.771484375 ,1006.1796875, 1, 0, 1},
	{2275.2138671875 ,1596.4833984375 ,1006.1796875, 1, 0, 1},
	{2272.6533203125 ,1596.525390625 ,1006.1796875, 1, 0, 1},
	{2270.48046875 ,1596.4951171875 ,1006.1796875, 1, 0, 1},
	{2267.9111328125 ,1596.4716796875 ,1006.1796875, 1, 0, 1},
	{2265.43359375 ,1596.4462890625 ,1006.1796875, 1, 0, 1},
	{2262.849609375 ,1596.4921875 ,1006.1796875, 1, 0, 1},
	{2260.0263671875 ,1596.4794921875 ,1006.1796875, 1, 0, 1},
	{2257.451171875 ,1596.482421875 ,1006.1796875, 1, 0, 1},
	{2254.9873046875 ,1596.45703125 ,1006.1796875, 1, 0, 1},
	{-36.8076171875 ,341.3056640625 ,6.34375, 1, 0, 0},
	{-36.806640625 ,339.580078125 ,6.34375, 1, 0, 0},
	{-36.8076171875 ,342.9638671875 ,6.34375, 1, 0, 0},
	{-1978.1220703125 ,642.775390625 ,104.86861419678, 1, 0, 0},
	{ 1942.62109375 , 1028.9130859375 , 992.46875 , 1, 0, 10 },
	{ 1939.7705078125 , 1029.66796875 , 992.46875 , 1, 0, 10 },
	{ 1938.8876953125 , 1021.4365234375 , 992.46875 , 1, 0, 10 },
	{ 1941.8310546875 , 1021.4189453125 , 992.46875 , 1, 0, 10 },
	{ 1941.8310546875 , 1014.2080078125 , 992.46875 , 1, 0, 10 },
	{ 1938.8876953125 , 1014.2197265625 , 992.46875 , 1, 0, 10 },
	{ 1940.12109375 , 1005.841796875 , 992.46875 , 1, 0, 10 },
	{ 1942.8818359375 , 1006.8515625 , 992.46875 , 1, 0, 10 },
	{ 1966.5986328125 , 1006.318359375 , 992.47448730469 , 1, 0, 10 },
	{ 1969.5419921875 , 1006.3564453125 , 992.47448730469 , 1, 0, 10 },
	{ 1969.5419921875 , 1014.00390625 , 992.46875 , 1, 0, 10 },
	{ 1966.599609375 , 1014.0390625 , 992.46875 , 1, 0, 10 },
	{ 1966.599609375 , 1021.720703125 , 992.46875 , 1, 0, 10 },
	{ 1969.54296875 , 1021.62890625 , 992.46875 , 1, 0, 10 },
	{ 1969.5419921875 , 1029.6474609375 , 992.47448730469 , 1, 0, 10 },
	{ 1966.5986328125 , 1029.6552734375 , 992.47448730469 , 1, 0, 10 },
	{ 1135.1171875 , -3.869140625 , 1000.6796875 , 1, 0, 12 },
	{ 1134.96875 , 0.6103515625 , 1000.6796875 , 1, 0, 12 },
	{ 1126.9052734375 , 3.005859375 , 1000.6796875 , 1, 0, 12 },
}

function UnBindPongGame ( Leave, matchingDimension )
    if Leave == getLocalPlayer() then
		unbindKey ( "F1", "down", cFunc["enable_pong"] )
	end
end

function BindPongGame ( Hit, matchingDimension )
	if Hit == getLocalPlayer() then
		bindKey( "F1", "down", cFunc["enable_pong"] )
		--exports["notf"]:addNotification("Baraye Pong Bazi Kardan Be Gheymat ( 100 Chips ) Dokme ( Z ) Ra Bezanid!" , 'info')
	end
end

for k,v in ipairs(PongMarkersTable) do
	local PongMarker = createMarker ( v[1], v[2], v[3]-1, "cylinder", v[4], 255, 0, 0, 170 )
	setElementDimension(PongMarker, v[5])
	setElementInterior(PongMarker, v[6])
	addEventHandler ( "onClientMarkerHit", PongMarker, BindPongGame )
	addEventHandler ( "onClientMarkerLeave", PongMarker, UnBindPongGame )
end