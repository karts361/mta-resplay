function playSoundServer(vehicle)
    triggerClientEvent("serverPlaySound", getRootElement(), vehicle)
end
addEvent("playSoundServer", true)
addEventHandler("playSoundServer", getRootElement(), playSoundServer)

function stopSoundServer(vehicle)
    triggerClientEvent("serverStopSound", getRootElement(), vehicle)
end
addEvent("stopSoundServer", true)
addEventHandler("stopSoundServer", getRootElement(), stopSoundServer)

function nextSoundServer(vehicle)
    triggerClientEvent("serverNextSound", getRootElement(), vehicle)
end
addEvent("nextSoundServer", true)
addEventHandler("nextSoundServer", getRootElement(), nextSoundServer)

function prevSoundServer(vehicle)
    triggerClientEvent("serverPrevSound", getRootElement(), vehicle)
end
addEvent("prevSoundServer", true)
addEventHandler("prevSoundServer", getRootElement(), prevSoundServer)

function uvolSoundServer(vehicle)
    triggerClientEvent("serverUvolSound", getRootElement(), vehicle)
end
addEvent("uvolSoundServer", true)
addEventHandler("uvolSoundServer", getRootElement(), uvolSoundServer)

function dvolSoundServer(vehicle)
    triggerClientEvent("serverDvolSound", getRootElement(), vehicle)
end
addEvent("dvolSoundServer", true)
addEventHandler("dvolSoundServer", getRootElement(), dvolSoundServer)