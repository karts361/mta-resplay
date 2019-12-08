local localElems = {}

function clientCreatePed(mdl, x, y, z, r, dim)
	local ped = createPed(mdl, x, y, z, r)
	setElementInterior(ped, 1)
	setElementDimension(ped, dim)
	setElementFrozen(ped, true)
	table.insert(localElems, ped)
end

function clientCreateVehicle(mdl, x, y, z, rx, ry, rz, dim)
	local veh = createVehicle(mdl, x, y, z, rx, ry, rz)
	setElementInterior(veh, 1)
	setElementDimension(veh, dim)
	table.insert(localElems, veh)
end

function clientCreateObject(mdl, x, y, z, rx, ry, rz, dim)
	local obj = createObject(mdl, x, y, z, rx, ry, rz)
	setElementInterior(obj, 1)
	setElementDimension(obj, dim)
	setObjectBreakable(obj, false)
	table.insert(localElems, obj)
end

function clientRemoveElements()
	for _,obj in ipairs(localElems) do
		if isElement(obj) then
			destroyElement(obj)
		end
	end
	localElems = {}
end

function setPlayerInvincible(plr, bInv)
	if bInv then
		addEventHandler("onClientPlayerDamage", plr, procPlayerInvincible, false)
	
	else
		removeEventHandler("onClientPlayerDamage", plr, procPlayerInvincible)
	
	end
end

function procPlayerInvincible()
	cancelEvent()
end

addEvent("onClientCreatePed", true)
addEvent("onClientCreateVehicle", true)
addEvent("onClientCreateObject", true)
addEvent("onClientRemoveElements", true)
addEvent("onPlayerSetInvincible", true)
addEventHandler("onClientCreatePed", resourceRoot, clientCreatePed, false)
addEventHandler("onClientCreateVehicle", resourceRoot, clientCreateVehicle, false)
addEventHandler("onClientCreateObject", resourceRoot, clientCreateObject, false)
addEventHandler("onClientRemoveElements", resourceRoot, clientRemoveElements, false)
addEventHandler("onPlayerSetInvincible", resourceRoot, setPlayerInvincible, false)