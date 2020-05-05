function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

function getIDbyCommand(plr, cmd, name)
    src = getPlayerFromName(name)
    
	if not plr then
		plr = source
	end
	--if name then
	    outputChatBox(generateTimeString().." - "..getPlayerID(src), plr)
	--end
end

function getPlayerID(player)
	
    if player and isElement(player) and getElementType(player) == "player" then
	   return getElementData(player, "ID")
	end
	return false
end
addCommandHandler("id", getIDbyCommand)