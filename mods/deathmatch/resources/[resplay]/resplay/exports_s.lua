function workNew(workName)
	table.insert(availableJobs, workName)
	local workId = table.getn(availableJobs)
	jobWorkers[workId] = {}
	return table.getn(availableJobs)
end

function workStart(workId, workPlayer)
	addWorker(workId, workPlayer)
end

function workFinish(workId, workPlayer, reason)
	removeWorker(workId, workPlayer, reason)
end

function workRemoveAllWorkers(workId)
	for wid,worker in ipairs(jobWorkers[workId]) do
		removeWorker(workId, worker[1], 0)
	end
end

function groupAttachVehicleToGroup(vehId, groupId)
	if groupVehicles[vehId] then
		table.insert(groupVehicles[vehId], groupId)
	else
		groupVehicles[vehId] = { groupId }
	end
	return true
end

function workAttachVehicleToWork(vehId, workId)
	jobVehicles[vehId] = workId
	return true
end

function workAddWorkerParam(workId, plr, paramVal)
	for wid,worker in ipairs(jobWorkers[workId]) do
		if(worker[1] == plr) then
			table.insert(jobWorkers[workId][wid], paramVal)
			return table.getn(jobWorkers[workId][wid])
		end
	end
	return nil
end

function workSetWorkerParam(workId, plr, paramId, paramVal)
	for wid,worker in ipairs(jobWorkers[workId]) do
		if(worker[1] == plr) then
			jobWorkers[workId][wid][paramId] = paramVal
			return true
		end
	end
	return false
end

function workGetWorkerParam(workId, plr, paramId)
	for wid,worker in ipairs(jobWorkers[workId]) do
		if(worker[1] == plr) then
			return jobWorkers[workId][wid][paramId]
		end
	end
	return nil
end

function workGetState(workId, plr)
	return workGetWorkerParam(workId, plr, 2)
end

function workSetState(workId, plr, newState)
	return workSetWorkerParam(workId, plr, 2, newState)
end

function workCollectItem(workId, plr, itemId)
	jobCollectItem(workId, plr, itemId)
	return true
end

function workWasItemCollected(workId, plr, itemId)
	return jobWasItemCollected(workId, plr, itemId)
end

function workGetWorkerByVehicle(workId, workVeh)
	for _,worker in ipairs(jobWorkers[workId]) do
		if(worker[3] == workVeh) then
			return worker[1]
		end
	end
	return nil
end

function workGetWorkVehicle(workId, workPlayer)
	for _,worker in ipairs(jobWorkers[workId]) do
		if(worker[1] == workPlayer) then
			return worker[3]
		end
	end
	return nil
end

function playerGiveMoney(plr, amount, playSnd)
	giveMoney(plr, amount, playSnd)
	return true
end

function playerTakeMoney(plr, amount, playSnd)
	takeMoney(plr, amount, playSnd)
	return true
end

function resplayRemoveCar(owner)
    carSellRemoveUserVehicles(owner)
    return true
end

function playerGetMoney(plr)
	return getMoney(plr)
end

function playerShowMessage(plr, msgtext, fromResource)
	local sourceRoot = fromResource
	if not sourceRoot then
		sourceRoot = resourceRoot
	end
	return triggerClientEvent(plr, "onServerMsgAdd", sourceRoot, msgtext)
end

function playerSendAdminMessage(plr, msgtext)
	local plrName, plrRole
	if isElement(plr) then
		plrName = getPlayerName(plr)
		if isAdmin(plr) then
			plrRole = "Администратор"
		else
			plrRole = "Модератор"
		end
	else
		plrName = "RESPLAY"
		plrRole = "[Сервер]"
	end
	return outputChatBox(generateTimeString()..plrName.." ["..plrRole.."]: "..msgtext, root, 255, 160, 160, false)
end

function toggleSkinChooser(plr)
	return triggerClientEvent(plr, "onSkinChooser", resourceRoot)
end

function licenseWeaponExamFinished(plr)
    return licenseWeaponExamFinish(plr)
end

function playerSendSMIMessage(plr, msgtext)
    local plrNamee = getPlayerName(plr)
    return outputChatBox(generateTimeString()..plrNamee.." [SaNews]: "..msgtext, root, 0, 255, 147, false)
end

function playerTransferMoney(fromPlr, toPlr, amount)
	local money = playerGetMoney(fromPlr)
	if(money < amount) then
		return false
	end
	playerTakeMoney(fromPlr, amount)
	if isElement(toPlr) then
		playerGiveMoney(toPlr, amount)
	end
	return true
end

function playerOutputLog(plr, eventText, success)
	addNewEventToLog(getPlayerName(plr), eventText, success)
end

function playerRespectChange(plr, incVal, minBorder, maxBorder, diffMultEnabled)
	local respect = getElementData(plr, "respect")
	if respect then
		respectSet(plr, respect+incVal, minBorder, maxBorder, diffMultEnabled)
	end
end

function playerGetDefaultSpawn( plr )
	return getPlayerDefaultSpawn( plr )
end

function elementSetGhostMode( elem, timeMs )
	setElementGhostMode( elem, timeMs )
end

function soundPlaySFX3D(sLib, sBank, sId, sX, sY, sZ, sLoop, sDist, sToAttach, sPos, sTime)
	if sToAttach then
		sX, sY, sZ = getElementPosition(sToAttach)
	end
	local curCol = createColSphere(sX, sY, sZ, sDist+50)
	local players = getElementsWithinColShape(curCol, "player")
	destroyElement(curCol)
	triggerClientEvent(players, "onServerPlaySFX3D", resourceRoot, sLib, sBank, sId, sX, sY, sZ, sLoop, sDist, sToAttach, sPos, sTime)
end

function pickupSetText(elem, etext, er, eg, eb)
	setPickupText(elem, etext, er, eg, eb)
end

addEvent("onWorkSendClientInfo")
addEvent("onWorkInit")
addEvent("onWorkDestroy")
addEvent("onWorkStart")
addEvent("onWorkFinish")