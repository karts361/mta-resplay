--[[local accHash = exports["resplay"]

addEvent("ExChangeMoneyForChip",true)
addEventHandler("ExChangeMoneyForChip", root,
function (root, ChipsValue)
	if tonumber(getPlayerMoney(root)) >= tonumber(ChipsValue) then
		setElementData(accHash:getExportedHash(getPlayerName(root)), "pChips",(tonumber(getElementData(accHash:getExportedHash(getPlayerName(root)), "pChips"))+tonumber(ChipsValue)))
		setElementData(root,"pChips",getElementData(getExportedHash(getPlayerName(root)), "pChips"))
		exports.resplay:playerTakeMoney ( root, tonumber(ChipsValue) )
	end
end)

addEvent("ExChangeChipForMoney",true)
addEventHandler("ExChangeChipForMoney", root,
function (root, ChipsValue)
	if tonumber(getElementData(getExportedHash(getPlayerName(root)), "pChips")) >= tonumber(ChipsValue) then
		setElementData(getExportedHash(getPlayerName(root)), "pChips",(tonumber(getElementData(getExportedHash(getPlayerName(root)), "pChips"))-tonumber(ChipsValue)))
		setElementData(root,"pChips",getElementData(getExportedHash(getPlayerName(root)), "pChips"))
		exports.resplay:playerGiveMoney ( root, tonumber(ChipsValue) )
	end
end)

addEvent("TakePlayerChips",true)
addEventHandler("TakePlayerChips", root,
function (root, ChipsValue)
	if tonumber(getElementData(getExportedHash(getPlayerName(root)), "pChips")) >= tonumber(ChipsValue) then
		setElementData(getExportedHash(getPlayerName(root)), "pChips",(tonumber(getElementData(getExportedHash(getPlayerName(root)), "pChips"))-tonumber(ChipsValue)))
		setElementData(root,"pChips",getElementData(getExportedHash(getPlayerName(root)), "pChips"))
	end
end)

addEvent("GivePlayerChips",true)
addEventHandler("GivePlayerChips", root,
function (root, ChipsValue)
	setElementData(getExportedHash(getPlayerName(root)), "pChips",(tonumber(getElementData(getExportedHash(getPlayerName(root)), "pChips"))+tonumber(ChipsValue)))
	setElementData(root,"pChips",getElementData(getExportedHash(getPlayerName(root)), "pChips"))
end)]]

addEvent("ExChangeMoneyForChip",true)
addEventHandler("ExChangeMoneyForChip", root,
function (root, ChipsValue)
    exports.resplay:ExChangeMoneyForChipExport(root, ChipsValue)
end)

addEvent("ExChangeChipForMoney",true)
addEventHandler("ExChangeChipForMoney", root,
function (root, ChipsValue)
    exports.resplay:ExChangeChipForMoneyExport(root, ChipsValue)
end)

addEvent("TakePlayerChips",true)
addEventHandler("TakePlayerChips", root,
function (root, ChipsValue)
    exports.resplay:TakePlayerChipsExport(root, ChipsValue)
end)

addEvent("GivePlayerChips",true)
addEventHandler("GivePlayerChips", root,
function (root, ChipsValue)
    exports.resplay:GivePlayerChipsExport(root, ChipsValue)
end)