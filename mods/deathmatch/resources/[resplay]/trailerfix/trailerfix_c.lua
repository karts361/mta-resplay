function trailersCheck(trailers)
	local veh, trailer
	
	for i,data in ipairs(trailers) do
		veh = data[1]
		trailer = data[2]
		if not (veh == getVehicleTowingVehicle(trailer)) then
			detachTrailerFromVehicle(veh)
			attachTrailerToVehicle(veh, trailer)
		end
	end
	
end

addEvent("onTrailersCheck", true)
addEventHandler("onTrailersCheck", root, trailersCheck)