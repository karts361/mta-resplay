function joinHandler(player)
	if not player then
		player = source
	end
	outputChatBox('Архивный сервер Респлея.', player, 0, 255, 0)
	outputChatBox('Пожалуйста, не пишите насчёт лидерок или ранга в гос.фракции, все фракции недействующие и вайпнуты.', player, 255, 0, 0)
	outputChatBox('Правила на сервере также не действуют, но сильно перегибать палку тоже не стоит.', player, 255, 0, 0)
	outputChatBox('Клавиши: K - открыть меню, O - меню друзей, I - Инвентарь, L - Скиллы', player, 255, 255, 0)
end
addEventHandler('onPlayerJoin', root, joinHandler)