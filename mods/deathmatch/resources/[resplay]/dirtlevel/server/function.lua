addEvent("dirt:takemoney", true)
addEventHandler("dirt:takemoney", getRootElement(),
	function(money)
		exports.resplay:takeMoney(source, money)
	end
)