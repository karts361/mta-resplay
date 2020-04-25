function stopSoundRespawn(vehicle)
    return triggerClientEvent("serverStopSound", getRootElement(), vehicle)
end