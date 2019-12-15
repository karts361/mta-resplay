function joinHandler(player)
	if not player then
		player = source
	end
	outputChatBox('RESPLAY CLOSED BETA.', player, 0, 255, 0)
	outputChatBox('Клавиши: K - открыть меню, O - меню друзей, I - Инвентарь, L - Скиллы', player, 255, 255, 0)
end
addEventHandler('onPlayerJoin', root, joinHandler)