setBlurLevel(0) -- Blur efffect

function toggleNOS(btn, state)
	local veh = getPedOccupiedVehicle(localPlayer)

	if veh and getVehicleController(veh) == localPlayer then

		if state == "up" then
			-- Remove nitro
			removeVehicleUpgrade(veh, 1010);
			setPedControlState("vehicle_fire", false);
		else
			-- Add nitro
			addVehicleUpgrade(veh, 1010);
		end

	end
end
bindKey("vehicle_fire", "both", toggleNOS