--райдер иди нахуй


local sw,sh = guiGetScreenSize()
local px,py = sw/1920,sh/1080

resplayHud = {
    showing = false;
};

local fonttime = dxCreateFont('2.ttf',35)
local font = dxCreateFont('2.ttf',33)
local fontmani = dxCreateFont('1.ttf',33)


function resplayHud:isShowing()
    return resplayHud.showing;
end

function resplayHud:setShowing(bShowing)
    if bShowing then
        if not resplayHud:isShowing() then
            addEventHandler("onClientRender", root, resplayHudRender);
            resplayHud.showing = true;
        end
    else
        if resplayHud:isShowing() then
            removeEventHandler("onClientRender", root, resplayHudRender);
            resplayHud.showing = false;
        end
    end
end


addEventHandler("onClientResourceStart", resourceRoot,
    function()

        addEventHandler("onClientRender", root, resplayHudRender)
        setPlayerHudComponentVisible('armour',false)
        setPlayerHudComponentVisible('health',false)
        setPlayerHudComponentVisible('money',false)
        setPlayerHudComponentVisible('clock',false)
        setPlayerHudComponentVisible('ammo',false)
        setPlayerHudComponentVisible('weapon',false)
        setPlayerHudComponentVisible('breath',false)
        setPlayerHudComponentVisible('wanted',false)	

        resplayHud:setShowing(true);

    end
);

function hideTutHud()
        removeEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(false);
		removeCommandHandler("hud1", enableResplayHud)
		removeCommandHandler("hud2", disableResplayHud)
		removeCommandHandler("showhud", hideHud)
		unbindKey ("F11", "down", hideHud)
end
addEvent("hideTutHud", true)
addEventHandler("hideTutHud", root, hideTutHud)


function showTutHud()
        addEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(true);
		addCommandHandler("hud1", enableResplayHud)
		addCommandHandler("hud2", disableResplayHud)
		addCommandHandler("showhud", hideHud)
		bindKey ("F11", "down", hideHud)
end
addEvent("showTutHud", true)
addEventHandler("showTutHud", root, showTutHud)

function hideHud()
    if kartos then
        addEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(true);
    else
        removeEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(false);
    end
    kartos = not kartos
end
bindKey ("F11", "down", hideHud)

function showResplayHud()
    if kartos then
        addEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(true);
    else
        removeEventHandler("onClientRender", root, resplayHudRender)
        resplayHud:setShowing(false);
    end
    kartos = not kartos
end
addCommandHandler("showreshud", showResplayHud)

function disableResplayHud()
    removeEventHandler("onClientRender", root, resplayHudRender)
    resplayHud:setShowing(false);
    setPlayerHudComponentVisible('armour',true)
    setPlayerHudComponentVisible('health',true)
    setPlayerHudComponentVisible('money',true)
    setPlayerHudComponentVisible('clock',true)
    setPlayerHudComponentVisible('ammo',true)
    setPlayerHudComponentVisible('weapon',true)
    setPlayerHudComponentVisible('breath',true)
    setPlayerHudComponentVisible('wanted',true)	
    unbindKey ("F11", "down", hideHud)
	removeCommandHandler("showreshud", hideHud)
end
addCommandHandler("hud2", disableResplayHud)

function enableResplayHud()
    addEventHandler("onClientRender", root, resplayHudRender)
    resplayHud:setShowing(true);
        setPlayerHudComponentVisible('armour',false)
        setPlayerHudComponentVisible('health',false)
        setPlayerHudComponentVisible('money',false)
        setPlayerHudComponentVisible('clock',false)
        setPlayerHudComponentVisible('ammo',false)
        setPlayerHudComponentVisible('weapon',false)
        setPlayerHudComponentVisible('breath',false)
        setPlayerHudComponentVisible('wanted',false)	
        bindKey ("F11", "down", hideHud)
		addCommandHandler("showreshud", hideHud)
end
addCommandHandler("hud1", enableResplayHud)

function resplayHudRender()
    local hp = getElementHealth(localPlayer)
	local armor = getPedArmor(localPlayer)
	local oxygen = getPedOxygenLevel ( localPlayer )
	local weaponType = getPedWeapon(localPlayer)
	local playerWeapon = getWeaponNameFromID(weaponType)
	
    local perOneHp = -1.45
    local perOneArmor = -1.9
    local perOneOxygen = -0.036
    local timehour, timeminute = getTime()
    local respect = getElementData(localPlayer, "respect")
    timing = string.format("%02d:%02d", timehour, timeminute)
	local hungry, thirst
	
    hungry = getElementData(localPlayer, "hungryLevel")
    thirst = getElementData(localPlayer, "thirstLevel")

    curRespectStr = string.format("%.2f", respect*100.0).."%"
	curhungryStr = string.format("%.2f", hungry*100.0).."%"
	curthirstStr = string.format("%.2f", thirst*100.0).."%"
	
	
    dxDrawLine(1439*px - 1*px, 46*py - 1*py, 1439*px - 1*px, 259*py, tocolor(243, 121, 39, 254), 1*px, false)
    dxDrawLine(1910*px, 45*py - 1*py, 1439*px - 1*px, 45*py - 1*py, tocolor(243, 121, 39, 254), 1*px, false)
    dxDrawLine(1439*px - 1*px, 259*py, 1910*px, 259*py, tocolor(243, 121, 39, 254), 1*px, false)
    dxDrawLine(1910*px, 259*py, 1910*px, 45*py - 1*py, tocolor(243, 121, 39, 254), 1*px, false)
    dxDrawRectangle(1439*px, 45*py, 471*px, 212*py, tocolor(0, 0, 0, 172), false)
    dxDrawRectangle(1899*px, 181*py, hp*perOneHp*px, 8*py, tocolor(251, 29, 45, 254), false)
    dxDrawRectangle(1899*px, 165*py, armor*perOneArmor*px, 8*py, tocolor(150, 131, 146, 254), false)
    local money = getPlayerMoney(localPlayer)
    if (money < 10) then
        dxDrawText("                #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 100) then
        dxDrawText("              #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 1000) then
        dxDrawText("            #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 10000) then
        dxDrawText("          #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 100000) then
        dxDrawText("        #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 1000000) then
        dxDrawText("      #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 10000000) then
        dxDrawText("    #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    elseif(money < 100000000) then
        dxDrawText("  #00FF00$#FFFFFF"..money, 1616*px, 242*py, 1894*px, 221*py, tocolor(255, 255, 255, 255), 1.00*px, font, "center", "center", false, false, false, true, false)
    end
    if isElementInWater(localPlayer) then
        dxDrawRectangle(1699*px, 165*py, oxygen*perOneOxygen*px, 8*py, tocolor(44, 174, 235, 254), false)
    end
    dxDrawText(timing, 1459*px, 66*py, 1579*px, 239*py, tocolor(255, 255, 255, 255), 1.00*px, fonttime, "center", "center", false, false, false, false, false)
    dxDrawText(curRespectStr, 1565*px, 60*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.40*px, "default-bold", "center", "center", false, false, false, false, false)
	--dxDrawText("228.00%", 1565*px, 60*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.40*px, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Репутация:", 1379*px, 60*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.40*px, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawImage(1630*px, 00.5*py, 355*px, 199*py, "Weapons/"..tostring( weaponType ).. ".png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
    if (weaponType ==  22 or weaponType == 23 or weaponType == 24 or weaponType == 25 or weaponType == 26 or weaponType == 27 or weaponType == 28 or weaponType == 29 or weaponType == 30 or weaponType == 31 or weaponType == 32 or weaponType == 33 or weaponType == 34 or weaponType == 36 or weaponType == 37 or weaponType == 38 or weaponType == 39 or weaponType == 43 or weaponType == 16 or weaponType == 17 or weaponType == 18 or weaponType == 41 or weaponType == 42 ) then
        dxDrawText(getPedTotalAmmo(getLocalPlayer())-getPedAmmoInClip(getLocalPlayer()).."-"..getPedAmmoInClip(localPlayer), 2136*px, 210*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.30*px, "default-bold", "center", "center", false, false, false, false, false)
	end
	
	local wantedlevel = getPlayerWantedLevel(localPlayer)
	
    if wantedlevel == 1 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
	elseif wantedlevel == 2 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1784*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
	elseif wantedlevel == 3 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1784*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1699*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
	elseif wantedlevel == 4 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1784*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1699*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1609*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
	elseif wantedlevel == 5 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1784*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1699*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1609*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1524*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
	elseif wantedlevel == 6 then
        dxDrawImage(1869*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1784*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1699*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1609*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1524*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1439*px, 262*py, 42*px, 42*py, "star.png", 0*px, 0*py, 0*px, tocolor(255, 255, 255, 255), false)
    end

    dxDrawText(curthirstStr, 1425*px, 382*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.15*px, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawText(curhungryStr, 1600*px, 382*py, 1610*px, 79*py, tocolor(255, 255, 255, 255), 1.15*px, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawImage(1449*px, 207*py, 42*px, 42*py, "jajda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(1539*px, 207*py, 42*px, 42*py, "satiety.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end
