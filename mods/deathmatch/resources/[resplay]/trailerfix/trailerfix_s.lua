function checkTrailers()
	local vehicles = getElementsByType("vehicle")
	local trailers = {}
	local towingVeh
	
	for i,veh in ipairs(vehicles) do
		towingVeh = getVehicleTowingVehicle(veh)
		if towingVeh then
			table.insert(trailers, { towingVeh, veh })
		end
	end
	
	triggerClientEvent("onTrailersCheck", root, trailers)
end

function resourceStart()
	setTimer(checkTrailers, 5000, 0)
end

addEventHandler("onResourceStart", resourceRoot, resourceStart)