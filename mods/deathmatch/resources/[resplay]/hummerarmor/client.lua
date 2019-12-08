local weaponsToDamageHummer = {
	[38] = true,
	[33] = true,
	[34] = true,
	[30] = true,
	[31] = true,
	[24] = true,
	[23] = true,
	[22] = true,
	[26] = true, 
	[27] = true,
	[28] = true,
	[29] = true,
	[25] = true,
}

function handleHummerDamage(attacker, weapon, loss, x, y, z, tyreID)
	if (weapon and getElementModel(source) == 470 ) then
		if (weaponsToDamageHummer[weapon]) then
			setElementHealth(source, getElementHealth(source) + 17)
		end
	end
end
addEventHandler("onClientVehicleDamage", root, handleHummerDamage)
