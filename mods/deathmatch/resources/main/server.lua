function greetPlayer()
	spawnPlayer(source, 0, 0, 0)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	--givePlayerMoney(source, 50000)
end

addEventHandler("onPlayerJoin", getRootElement(), greetPlayer)