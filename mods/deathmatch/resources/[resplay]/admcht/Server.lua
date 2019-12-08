function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

function adminchat ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    if ( isPlayerOnGroup ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerOnGroup ( player ) ) then
                outputChatBox ( "#7CC576"..generateTimeString().. "[Админ-Хелпер чат]#FFA0A0 ".. getPlayerName( thePlayer ) ..":#DCDC00 ".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "ad", adminchat )
 
function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( { "Admin", "Moderator", "Helper" } ) do  
        if isObjectInACLGroup ( "user.".. getAccountName( account ), aclGetGroup( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end