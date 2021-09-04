local function takeStake(stake)
	if source ~= client then
		outputDebugString("Possible cheater in casino", 2)
	end
	exports.resplay:playerTakeMoney(client, stake)
end

local function givePrize(prize)
	if source ~= client then
		outputDebugString("Possible cheater in casino", 2)
	end
	exports.resplay:playerGiveMoney(client, prize)
end

addEvent("casinoTakePlayerMoney", true)
addEvent("casinoGivePlayerMoney", true)
addEventHandler("casinoTakePlayerMoney", root, takeStake)
addEventHandler("casinoGivePlayerMoney", root, givePrize)
