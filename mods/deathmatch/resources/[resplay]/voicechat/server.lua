function voiceInit()
	local players = getElementsByType("player")
	
	for _,plr in ipairs(players) do
		voiceSet(plr)
	end

end

function voiceSet(plr)
	exports.voice:setPlayerChannel(plr)
end

addEventHandler("onResourceStart", resourceRoot, voiceInit)
addEventHandler("onPlayerJoin", root, function()
										voiceSet(source)
									  end)