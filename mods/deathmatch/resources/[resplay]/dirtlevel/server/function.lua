addEvent("dirt:takemoney", true)
addEventHandler("dirt:takemoney", getRootElement(),
	function(money)
		exports.resplay:playerTakeMoney(source, money)
	end
)