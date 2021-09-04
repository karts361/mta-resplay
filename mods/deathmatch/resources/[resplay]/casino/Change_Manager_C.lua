	---------------------
	---- Chip Render ----
	---------------------

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

local localPlayer = getLocalPlayer()

local x,y = guiGetScreenSize()
font = dxCreateFont( "font.ttf", 13 )
function DxDrawBorderedRectangle( x, y, width, height, color1, color2, _width, postGUI )
    local _width = _width or 1
    dxDrawRectangle ( x+1, y+1, width-1, height-1, color1, postGUI )
    dxDrawLine ( x, y, x+width, y, color2, _width, postGUI ) -- Top
    dxDrawLine ( x, y, x, y+height, color2, _width, postGUI ) -- Left
    dxDrawLine ( x, y+height, x+width, y+height, color2, _width, postGUI ) -- Bottom
    dxDrawLine ( x+width, y, x+width, y+height, color2, _width, postGUI ) -- Right
end

addEventHandler("onClientRender", root,
    function()
		local x,y,z = getElementPosition(localPlayer)
		if tonumber(getDistanceBetweenPoints3D(x,y,z,1952.2095947266 ,1018.076965332 ,992.46875)) < 100 then
			if getElementInterior(localPlayer) == 10 then
				if getElementDimension(localPlayer) == 0 then
					showChipsInCasino()
				end
			end
		elseif tonumber(getDistanceBetweenPoints3D(x,y,z,1129.951171875 ,-1.2822265625 ,1000.6796875)) < 50 then
			if getElementInterior(localPlayer) == 12 then
				if getElementDimension(localPlayer) == 0 then
					showChipsInCasino()
				end
			end
		elseif tonumber(getDistanceBetweenPoints3D(x,y,z,2236.00390625 ,1631.70703125 ,1008.359375)) < 250 then
			if getElementInterior(localPlayer) == 1 then
				if getElementDimension(localPlayer) == 0 then
					showChipsInCasino()
				end
			end
		end
    end
)



function showChipsInCasino()
	DxDrawBorderedRectangle( x/2-200, y-30, 400, 30, tocolor(0,0,0,100), tocolor(46, 127, 26,255), 2, false )
	chips = getElementData(localPlayer,"pChips")
	if chips then
		myText = "Your Casino Chips: "..convertNumber(tonumber(chips))
	else
		myText = "Your Casino Chips: 0"
	end
	dxDrawText(myText,x/2-(dxGetTextWidth(myText)/2)-13,y-26,nil,nil,nil,nil,font)
	dxDrawImage ( x/2-(dxGetTextWidth(myText)/2)-45, y-31, 30, 30, 'Chip.png')
end

	-----------------------
	---- Guie ExChange ----
	-----------------------

local screenW, screenH = guiGetScreenSize()
ExChangeBG = guiCreateStaticImage((screenW - 1000) / 2, (screenH - 500) / 2, 1000, 500, "img/C_Change.png", false)
MoneyToChipEdit = guiCreateEdit(207, 333, 145, 25, "", false, ExChangeBG)
ChipToMoneyEdit = guiCreateEdit(668, 333, 145, 25, "", false, ExChangeBG)
ChipToMoneyButton = guiCreateStaticImage(668, 399, 150, 46, "img/White.png", false, ExChangeBG)
MoneyToChipButton = guiCreateStaticImage(200, 400, 147, 41, "img/White.png", false, ExChangeBG)
ExChangeClose = guiCreateStaticImage(925, 21, 52, 50, "img/Close.png", false, ExChangeBG)
guiSetProperty(ExChangeBG, "Visible", "False")

	-------------------
	---- Scripting ----
	-------------------
	

	
Change_Manager_C = {  
	-- {x, y, z, size, dimension, interior}
	{1998.25390625 ,1027.3701171875 ,994.46875, 1, 0, 10},
	{2000.4033203125 ,1027.3701171875 ,994.46875, 1, 0, 10},
	{2156.2978515625 , 1600.7890625 , 1006.1796875, 1, 0, 1},
	{2156.314453125 , 1598.1494140625 , 1006.186340332, 1, 0, 1},
	{1137.0068359375 , -8.6923828125 , 1000.6796875, 1, 0, 12},
}

function ShowExChange ()
	guiSetProperty(ExChangeBG, "Visible", "True")
	showCursor(true)
	unbindKey ( "Z", "down", ShowExChange )
end

function UnBindExChange ( Leave, matchingDimension )
    if Leave == getLocalPlayer() then
		unbindKey ( "Z", "down", ShowExChange )
	end
end

function BindExChange ( Hit, matchingDimension )
	if Hit == getLocalPlayer() then
		bindKey( "Z", "down", ShowExChange )
		exports["notf"]:addNotification("Baraye ExChange Chip/Money Dokme ( Z ) Ra Bezanid!" , 'info')
	end
end

for k,v in ipairs(Change_Manager_C) do
	local ExChangeMarker = createMarker ( v[1], v[2], v[3]-1, "cylinder", v[4], 0, 255, 0, 170 )
	setElementDimension(ExChangeMarker, v[5])
	setElementInterior(ExChangeMarker, v[6])
	addEventHandler ( "onClientMarkerHit", ExChangeMarker, BindExChange )
	addEventHandler ( "onClientMarkerLeave", ExChangeMarker, UnBindExChange )
end

addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == ExChangeClose then
		guiSetProperty(ExChangeBG, "Visible", "False")
		showCursor(false)
	elseif source == MoneyToChipButton then
		if tonumber(guiGetText(MoneyToChipEdit)) then
			if tonumber(guiGetText(MoneyToChipEdit)) >= 500 and tonumber(guiGetText(MoneyToChipEdit)) < 100000 then
				local ChipsValue = tostring(guiGetText(MoneyToChipEdit))
				triggerServerEvent("ExChangeMoneyForChip",getLocalPlayer(),getLocalPlayer(),ChipsValue)
				guiSetText ( MoneyToChipEdit, "")
			else
				exports.resplay:playerShowMessage(getLocalPlayer(), "Meqdare Money Baraye Kharid Chip Bayad Bishtar Az 500$ Va Kamtar Az 100,000$ Bashad")
			end
		else
			exports.resplay:playerShowMessage(getLocalPlayer(), "Baraye Kharid Chip Bayad Adad Vared Konid!")

		end
	elseif source == ChipToMoneyButton then
		if tonumber(guiGetText(ChipToMoneyEdit)) then
			if tonumber(guiGetText(ChipToMoneyEdit)) >= 500 then
				local ChipsValue = tostring(guiGetText(ChipToMoneyEdit))
				triggerServerEvent("ExChangeChipForMoney",getLocalPlayer(),getLocalPlayer(),ChipsValue)
				guiSetText ( ChipToMoneyEdit, "")
			else
                exports.resplay:playerShowMessage(getLocalPlayer(), "Meqdare Chip Baraye Daryafte Money Bayad Bishtar Az 500$ Bashad!")
			end
		else
			exports.resplay:playerShowMessage(getLocalPlayer(), "Baraye Kharid Chip Bayad Adad Vared Konid!")
		end
	end
end)