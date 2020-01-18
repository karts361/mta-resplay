function godmodeHandler()
  cancelEvent()
end

addEvent("enableGodMode",true)

addEventHandler("enableGodMode",getRootElement(),
function()
  if(source == getLocalPlayer()) then
    addEventHandler("onClientPlayerDamage",getRootElement(),godmodeHandler)
  end
end)

--бессмертие
addEvent("disableGodMode",true)

addEventHandler("disableGodMode",getRootElement(),
function()
  if(source == getLocalPlayer()) then
    removeEventHandler("onClientPlayerDamage",getRootElement(),godmodeHandler)
  end
end)

--режим разработчика по комманде "devmode", что бы включить видимость зелёной зоны напишите комманду showcol 1(0 если убрать видимость)
addCommandHandler("devmode",
function()
    setDevelopmentMode(true)
end
)

--[[ GREEN ZONE ICON

isGreenZone = false
gzTexture = dxCreateTexture("images/gz.png")
sW, sH = guiGetScreenSize()

aspect = sH / sW
scaleMult = (sH / 1920.0) / aspect

imageW = 140.0
imageH = 180.0

hudOffset = imageW * 3.0 * scaleMult

drawX = sW - hudOffset
drawY = 64.0 * scaleMult

function showGreenZone()	
	if isGreenZone then
		dxDrawImage(drawX, drawY, imageW * scaleMult, imageH * scaleMult, gzTexture)
	end
end

function enableGreenZone(enable)
	isGreenZone = enable
end

addEvent("onEnableGreenZone", true)
addEventHandler("onEnableGreenZone", root, enableGreenZone)
addEventHandler("onClientRender", root, showGreenZone)

-- GREEN ZONE ICON]]