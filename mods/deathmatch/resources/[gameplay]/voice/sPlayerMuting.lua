if isVoiceEnabled() then
	function setPlayerVoiceMuted(player, muted)
		if not checkValidPlayer(player) then return false end
		muted = not not muted or nil
		globalMuted[player] = muted
		return setPlayerVoiceBroadcastTo(player,(not muted) and root or nil)
	end

	function isPlayerVoiceMuted(player)
		if not checkValidPlayer(player) then return false end
		return not not globalMuted[player]
	end

	--Returns a list of players of which have muted the specified player
	function getPlayerVoiceMutedByList(player) 
		if not checkValidPlayer(player) then return false end
		return tableToArray(mutedBy[player] or {})
	end

	function updateMuted(player)
		setPlayerVoiceIgnoreFrom(player, getPlayerVoiceMutedByList(player))
	end


	function addPlayerMutedBy(noUpdate)	
		mutedBy[client] = mutedBy[client] or {}
		mutedBy[client][source] = true
		if not noUpdate then
			updateMuted(client)
		end
	end
	addEventHandler("voice_mutePlayerForPlayer", root, addPlayerMutedBy)

	function removePlayerMutedBy(noUpdate)
		if mutedBy[client] then
			mutedBy[client][source] = nil
			if not noUpdate then
				updateMuted(client)
			end
		end
	end
	addEventHandler("voice_unmutePlayerForPlayer", root, removePlayerMutedBy)
	
	function addPlayerMutedByTable(players) --Single packet for multiple muted players
		for i,player in ipairs(players) do
			source = player
			addPlayerMutedBy(true)
		end
		updateMuted(client)
	end
	addEventHandler("voice_muteTableForPlayer", root, addPlayerMutedByTable)
	
	function removePlayerMutedByTable(players) --Single packet for multiple unmuted players
		for i,player in ipairs(players) do
			source = player
			removePlayerMutedBy(true)
		end
		updateMuted(client)
	end
	addEventHandler("voice_unmuteTableForPlayer", root, removePlayerMutedByTable)
	
	function addOrRemovePlayerMutedByTable(playersMuted, playersUnmuted) --Single packet for multiple unmuted or muted players
		for i,player in ipairs(playersMuted) do
			source = player
			addPlayerMutedBy(true)
		end
		for i,player in ipairs(playersUnmuted) do
			source = player
			removePlayerMutedBy(true)
		end
		updateMuted(client)
	end
	addEventHandler("voice_tableForPlayer", root, addOrRemovePlayerMutedByTable)

	addEventHandler("onPlayerQuit", root, 
		function()
			mutedBy[source] = nil
			globalMuted[source] = nil
		end
	)
else
	setPlayerVoiceMuted = outputVoiceNotLoaded
	isPlayerVoiceMuted = outputVoiceNotLoaded
	getPlayerVoiceMutedByList = outputVoiceNotLoaded
end

-- Functions for backward compatibility only
-- DO NOT USE THESE AS THEY WILL BE REMOVED IN A LITTLE WHILE --
function isPlayerMuted(player)			return isPlayerVoiceMuted(player) end
function setPlayerMuted(player, muted)	return setPlayerVoiceMuted(player, muted) end
function getPlayerMutedByList(player)	return getPlayerVoiceMutedByList(player) end
-- DO NOT USE THESE AS THEY WILL BE REMOVED IN A LITTLE WHILE --
