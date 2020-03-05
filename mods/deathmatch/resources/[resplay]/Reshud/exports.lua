function hideReshudTut(player)
    return triggerClientEvent(player, "hideTutHud", resourceRoot)
end

function showReshudTut(player)
    return triggerClientEvent(player, "showTutHud", resourceRoot)
end