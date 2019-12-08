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