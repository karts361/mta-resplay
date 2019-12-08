local botTaskTree = {}
local botPaths = {}
local carPaths = {}

function initBots()
	botTaskTree = {
		["sitDown"] = {
			["func"] = botTaskSitDown,
			["funcfin"] = botTaskSitDownFin,
			["next"] = { "goToPosition", "followElement" }
		},
	--	["standUp"] =
	--	{
	--		["func"] = botTaskStandUp,
	--		["next"] = { "goToPosition", "followPed" }
	--	},
		["goToPosition"] = {
			["func"] = botTaskGoToPos,
			["next"] = { "sitDown", "followElement" }
		},
		["followElement"] = {
			["func"] = botTaskFollowElement,
			["next"] = { "sitDown", "goToPosition" }
		}
	}
end

function createBot(bMdl, bX, bY, bZ, bR, bFlags)
	local bElem = createPed(bMdl, bX, bY, bZ, bR)
	
	if not bElem then
		return nil
	end
	
	if setPedAsBot(bElem, bFlags) then
		return bElem
	
	else
		destroyElement(bElem)

	end

	return nil
end

function setPedAsBot(bElem, bFlags)
	if not (isElement(bElem) and(getElementType(bElem) == "ped")) then
		return false
	end
	
	if getElementData(bElem, "botFlags") then
		return false
	end
	
	addEventHandler("onElementDataChange", bElem, botDataChanged, false)
	addEventHandler("onElementDestroy", bElem, unloadBot, false)
	setElementData(bElem, "botFlags", bFlags)
	setElementData(bElem, "botTasks", {}, false)
	setElementData(bElem, "botTarget", { 0.0, 0.0, 0.0, 0.0 })
	
	return true
end

function botDataChanged(theName, theOldValue)
	if(theName == "botFlags")
	
	or(theName == "botTarget")
	
	or(theName == "botPoint")
	
	or(theName == "botTasks") then
		if(sourceResource ~= resource) then
			cancelEvent()
		end
		
		if not wasEventCancelled() then
			if(theName == "botTasks") then
				setElementData(source, "botPath", {}, false)
				botTasksUpdate(source)
				
			elseif(theName == "botTarget") then
				setElementData(source, "botPath", {}, false)
				
			elseif(theName == "botPath") then
				local botPath = getElementData(source, "botPath")
				
				if botPath and(#botPath > 0) then
					setElementData(source, "botPoint", {})
					
				else
					removeElementData(source, "botPoint")
				end

			end
		end
	end
end

function unloadBot()
	removeElementData(source, "botFlags")
	removeElementData(source, "botTasks")
	removeElementData(source, "botTarget")
	removeElementData(source, "botPath")
	removeElementData(source, "botPoint")
	removeEventHandler("onElementDataChange", source, botDataChanged)
	removeEventHandler("onElementDestroy", source, unloadBot)
	triggerClientEvent(getElementsByType("player"), "onBotTaskUpdate", resourceRoot, source)
end

function getFlagsForBot(canTalk, canRun)
	local result = 0x00000000
	
	if canTalk then
		result = bitReplace(result, 0x1, 0)
	end
	
	if canRun then
		result = bitReplace(result, 0x1, 1)
	end
	
	return result
end

function getBotCurrentTask(bElem)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	
	local botTaskStack = getElementData(bElem, "botTasks")
	
	if not botTaskStack then
		return nil
	end
	
	return botTaskStack[1]
end

function getBotLastTask(bElem)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	
	local botTaskStack = getElementData(bElem, "botTasks")
	
	if not botTaskStack then
		return nil
	end
	
	return botTaskStack[#botTaskStack]
end

function getTaskPath(tFrom, tTo)
	local taskPath = {}
	local taskWeights = {}
	
	for tName,tInfo in pairs(botTaskTree) do
		if(tName == tFrom) then
			taskWeights[tName] = { 0, tInfo["next"], false, nil }
		
		else
			taskWeights[tName] = { 10000000, tInfo["next"], false, nil }
		end
	end
	
	local tasksPassed = 0
	local taskCurrent = tFrom
	
	while(taskCurrent ~= tTo) do
		for _,taskNext in ipairs(taskWeights[taskCurrent][2]) do
			if not taskWeights[taskNext][3] and(taskWeights[taskNext][1] >(taskWeights[taskCurrent][1]+1)) then
				taskWeights[taskNext][1] = taskWeights[taskCurrent][1]+1
				taskWeights[taskNext][4] = taskCurrent
			end
		end
		
		taskWeights[taskCurrent][3] = true
		taskCurrent = nil
		
		for tName,tInfo in pairs(taskWeights) do
			if(not taskWeights[tName][3]) and((taskCurrent == nil) or (taskWeights[tName][1] < taskWeights[taskCurrent][1])) then
				taskCurrent = tName
			end
		end
		
		if not taskCurrent then
			return taskPath
		end
	end
	
	local taskPathLen
	
	while(taskCurrent ~= tFrom) do
		taskPathLen = #taskPath
		
		if(taskPathLen > 0) then
			for i=taskPathLen,1,-1 do
				taskPath[i+1] = taskPath[i]
			end
		end
		
		taskPath[1] = taskCurrent
		taskCurrent = taskWeights[taskCurrent][4]
	end
	
	return taskPath
end

function addBotTask(bElem, taskName)
	if not botTaskTree[taskName] then
		return false
	end
	local botTaskStack = getElementData(bElem, "botTasks")
	local oldTaskName = getBotLastTask(bElem)
	local taskPath
	
	if oldTaskName then
		taskPath = getTaskPath(oldTaskName, taskName)
	else
		local task = botTaskTree[taskName]["funcstart"]
		if task then
			task(bElem)
		end
		taskPath = { taskName }
	end
	
	for _,newTaskName in ipairs(taskPath) do
		table.insert(botTaskStack, newTaskName)
	end
	
	setElementData(bElem, "botTasks", botTaskStack, false)
	botTasksUpdate(bElem)
	
	return true
end

function setBotTask(bElem, taskName)
	if not botTaskTree[taskName] then
		return false
	end
	
	local oldTaskName = getBotCurrentTask(bElem)
	local taskPath
	
	if oldTaskName then
		taskPath = getTaskPath(oldTaskName, taskName)
	else
		local task = botTaskTree[taskName]["funcstart"]
		
		if task then
			task(bElem)
		end
		
		taskPath = { taskName }
	end
	
	setElementData(bElem, "botTasks", taskPath, false)
	botTasksUpdate(bElem)
	
	return true
end

function finishBotTask(bElem)
	if not botTaskTree[taskName] then
		return false
	end
	
	local botTaskStack = getElementData(bElem, "botTasks")
	local stackLen = #botTaskStack
	
	if(stackLen == 0) then
		return false
	end
	
	local task = getBotCurrentTask(bElem)
	
	if task and botTaskTree[task]["funcfin"] then
		task = botTaskTree[task]["funcfin"]
		task(bElem)
	end
	
	if(stackLen > 1) then
		for i=2,stackLen do
			botTaskStack[i-1] = botTaskStack[i]
		end
	end
	
	botTaskStack[stackLen] = nil
	setElementData(bElem, "botTasks", taskPath, false)
	task = getBotCurrentTask(bElem)
	
	if task and botTaskTree[task]["funcstart"] then
		task = botTaskTree[task]["funcstart"]
		task(bElem)
	end
	
	return true
end

function setBotTargetElement(bElem, elem)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	setElementData(bElem, "botTarget", elem)
end

function setBotTargetPosition(bElem, pX, pY, pZ, pR)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	setElementData(bElem, "botTarget", { pX, pY, pZ, pR })
end

function getBotTarget(bElem)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	return getElementData(bElem, "botTarget")
end

function addPathPoint(pointName, pointX, pointY, pointZ, pointArray)
	if pointArray[pointName] then
		return false
	end
	
	pointArray[pointName] = { ["x"]=pointX, ["y"]=pointY, ["z"]=pointZ, ["conn"]={} }
	
	return true
end

function addBotPathPoint(pointName, pointX, pointY, pointZ) return addPathPoint(pointName, pointX, pointY, pointZ, botPaths) end
function addCarPathPoint(pointName, pointX, pointY, pointZ) return addPathPoint(pointName, pointX, pointY, pointZ, carPaths) end

function addPathLink(pointFrom, pointTo, pointArray)
	if not pointArray[pointFrom] then
		return false
	end
	
	if not pointArray[pointTo] then
		return false
	end
	
	pointArray[pointFrom]["conn"][pointTo] = getDistanceBetweenPoints3D(pointArray[pointFrom]["x"], pointArray[pointFrom]["y"], pointArray[pointFrom]["z"], pointArray[pointTo]["x"], pointArray[pointTo]["y"], pointArray[pointTo]["z"])
	
	return true
end

function addBotPathLink(pointFrom, pointTo) return addPathLink(pointFrom, pointTo, botPaths) end
function addCarPathLink(pointFrom, pointTo) return addPathLink(pointFrom, pointTo, carPaths) end

function findPath(pointFrom, pointTo, pointArray)
	if not pointArray[pointFrom] then
		return {}
	end
	
	if not pointArray[pointTo] then
		return {}
	end
	
	if(pointFrom == pointTo) then
		return {}
	end
	
	local weights = {}
	
	for pName,pInfo in pairs(pointArray) do
		if(pName == pointFrom) then
			weights[pName] = { 0.0, pInfo["conn"], false, nil }
		else
			weights[pName] = { 10000000.0, pInfo["conn"], false, nil }
		end
	end
	
	local pointCurrent = pointFrom
	
	while(pointCurrent ~= pointTo) do
		for pointNext,pNextDist in pairs(weights[pointCurrent][2]) do
			if(not weights[pointNext][3]) and(weights[pointNext][1] >(weights[pointCurrent][1]+pNextDist)) then
				weights[pointNext][1] = weights[pointCurrent][1]+pNextDist
				weights[pointNext][4] = pointCurrent
			end
		end
		weights[pointCurrent][3] = true
		pointCurrent = nil
		for pName,pInfo in pairs(weights) do
			if(not pInfo[3]) and((pointCurrent == nil) or (pInfo[1] < weights[pointCurrent][1])) then
				pointCurrent = pName
			end
		end
		if not pointCurrent then
			return {}
		end
	end
	
	local path = {}
	local pathLen
	
	while(pointCurrent ~= pointFrom) do
		pathLen = #path
		if(pathLen > 0) then
			for i=pathLen,1,-1 do
				path[i+1] = path[i]
			end
		end
		path[1] = pointCurrent
		pointCurrent = weights[pointCurrent][4]
	end
	
	return path
end

function findBotPath(pointFrom, pointTo) return findPath(pointFrom, pointTo, botPaths) end
function findCarPath(pointFrom, pointTo) return findPath(pointFrom, pointTo, carPaths) end

function findClosestPoint(px, py, pz, pArray)
	local pDist, pClosest, curDist
	
	for pName,pInfo in pairs(pArray) do
		curDist = getDistanceBetweenPoints3D(px, py, pz, pInfo["x"], pInfo["y"], pInfo["z"])
		if(not pClosest) or (pDist > curDist) then
			pClosest = pName
			pDist = curDist
		end
	end
	
	return pClosest, pDist
end

function findBotClosestPoint(px, py, pz) return findClosestPoint(px, py, pz, botPaths) end
function findCarClosestPoint(px, py, pz) return findClosestPoint(px, py, pz, carPaths) end

function botTasksUpdate(bElem, plr)
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	
	local dest
	
	if isElement(plr) and(getElementType(plr) == "player") then
		dest = plr
	else
		dest = getElementsByType("player")
	end
	
	local botTaskStack = getElementData(bElem, "botTasks")
	local bTask = nil
	
	if botTaskStack and(#botTaskStack > 0) then
		bTask = botTaskStack[1]
	end
	
	triggerClientEvent(dest, "onBotTaskUpdate", resourceRoot, bElem, bTask)
end

function playerJoin()
	local peds = getElementsByType("ped")
	
	for _,bElem in ipairs(peds) do
		if getElementData(bElem, "botFlags") then
			botTasksUpdate(bElem, source)
		end
	end
end

function botTasksProcess()
	local task
	local peds = getElementsByType("ped")
	
	for _,bElem in ipairs(peds) do
		if getElementData(bElem, "botFlags") then
			task = getBotCurrentTask(bElem)
			if task then
				task = botTaskTree[task]["func"]
				task(bElem)
			end
		end
	end
end

function botTaskSitDown(bElem)
	local bX, bY, bZ = getElementPosition(bElem)
	local target = getBotTarget(bElem)
	
	if isElement(target) then
		finishBotTask(bElem)
		return nil
	end
	
	local tX, tY, tZ, tR = target[1], target[2], target[3], target[4]
	
	if not (tX and tY and tZ and tR) then
		finishBotTask(bElem)
		return nil
	end
	
	if(getDistanceBetweenPoints3D(tX, tY, tZ, bX, bY, bZ) < 1.5) then
		if not isElementFrozen(bElem) then
			setElementCollisionsEnabled(bElem, false)
			setElementPosition(bElem, tX, tY, tZ)
			setElementRotation(bElem, 0.0, 0.0, tR, "default", true)
			setElementFrozen(bElem, true)
			setPedAnimation(bElem, "ped", "seat_idle", -1, true, false, false, false, 250)
		end
	end
end

function botTaskSitDownFin(bElem)
	setPedAnimation(bElem)
	setElementCollisionsEnabled(bElem, true)
	setElementFrozen(bElem, false)
end

function updatePath(bElem, tX, tY, tZ)
	local fX, fY, fZ
	
	if not isElement(bElem) then
		return nil
	end
	
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	
	local pointArray
	local veh = getPedOccupiedVehicle(bElem)
	
	if veh then
		if(getPedOccupiedVehicleSeat(bElem) == 0) then
			local vehType = getVehicleType(veh)
			if(vehType == "Automobile") or (vehType == "BMX") or (vehType == "Monster Truck") or (vehType == "Quad") or (vehType == "Bike") then
				pointArray = carPaths
				fX, fY, fZ = getElementPosition(veh)
			end
		end
	else
		pointArray = botPaths
		fX, fY, fZ = getElementPosition(bElem)
	end
	
	if not pointArray then
		return nil
	end
	local curPath = getElementData(bElem, "botPath")
	local pFrom = findClosestPoint(fX, fY, fZ, pointArray)
	
	if not pFrom then
		if(not curPath) or (#curPath > 0) then
			setElementData(bElem, "botPath", {}, false)
			removeElementData(bElem, "botPoint")
		end
		return nil
	end
	
	local pTo = findClosestPoint(tX, tY, tZ, pointArray)
	
	if(not pTo) or (pFrom == pTo) then
		if(not curPath) or (#curPath > 0) then
			setElementData(bElem, "botPath", {}, false)
			removeElementData(bElem, "botPoint")
		end
		return nil
	end
	
	if curPath and(#curPath > 0) then
		local curPoint = curPath[1]
		
		while(#curPath > 0) and(curPoint ~= pFrom) do
			table.remove(curPath, 1)
			curPoint = curPath[1]
		end
		
		if(#curPath > 1) then
			table.remove(curPath, 1)
		end
		
		if(#curPath > 0) then
			curPoint = curPath[#curPath]
			while(#curPath > 0) and(curPoint ~= pTo) do
				table.remove(curPath, #curPath)
				curPoint = curPath[#curPath]
			end
		end
	end
	
	if(not curPath) or (#curPath == 0) then
		curPath = findPath(pFrom, pTo, pointArray)
	end
	
	setElementData(bElem, "botPath", curPath, false)
	
	local curPoint = getElementData(bElem, "botPoint")
	
	if curPath and(#curPath > 0) then
		local newPointId = 1
		local newPointX, newPointY, newPointZ = pointArray[curPath[newPointId]]["x"], pointArray[curPath[newPointId]]["y"], pointArray[curPath[newPointId]]["z"]
		
		while(getDistanceBetweenPoints3D(fX, fY, fZ, newPointX, newPointY, newPointZ) < 3.0) and(newPointId < #curPath) do
			newPointId = newPointId + 1
			newPointX, newPointY, newPointZ = pointArray[curPath[newPointId]]["x"], pointArray[curPath[newPointId]]["y"], pointArray[curPath[newPointId]]["z"]
		end
		
		local newPoint = { newPointX, newPointY, newPointZ }
		
		if((not curPoint) or (#curPoint == 0)) or ((#curPoint > 0) and((curPoint[1] ~= newPoint[1]) or (curPoint[2] ~= newPoint[2]) or (curPoint[3] ~= newPoint[3]))) then
			setElementData(bElem, "botPoint", newPoint)
		end
	
	elseif curPoint then
		removeElementData(bElem, "botPoint")
	end
end

function botTaskGoToPos(bElem)
	local tX, tY, tZ
	local target = getBotTarget(bElem)
	
	if not target then
		finishBotTask(bElem)
		return nil
	
	elseif isElement(target) then
		tX, tY, tZ = getElementPosition(target)
	
	else
		tX, tY, tZ = target[1], target[2], target[3]
	
	end
	
	local bX, bY, bZ = getElementPosition(bElem)
	
	if(getDistanceBetweenPoints3D(tX, tY, tZ, bX, bY, bZ) < 1.5) then
		finishBotTask(bElem)
	
	else
		updatePath(bElem, tX, tY, tZ)
	end
end

function botTaskFollowElement(bElem)
	local target = getBotTarget(bElem)
	
	if not target then
		finishBotTask(bElem)
		return nil
	
	elseif not isElement(target) then
		finishBotTask(bElem)
		return nil
	end
	
	local tX, tY, tZ = getElementPosition(target)
	--local bX, bY, bZ = getElementPosition(bElem)
	updatePath(bElem, tX, tY, tZ)
end

function botTalk(bElem, tTxt, eTalkTo)
	
	if not getElementData(bElem, "botFlags") then
		return nil
	end
	
	local players = exports.resplay:getNearbyElementsByType(bElem, "player", 100.0)
	triggerClientEvent(players, "onBotSpeak", resourceRoot, tTxt, bElem, eTalkTo)
end

addEventHandler("onPlayerJoin", root, playerJoin)
addEventHandler("onResourceStart", resourceRoot, initBots, false)
setTimer(botTasksProcess, 1000, 0)