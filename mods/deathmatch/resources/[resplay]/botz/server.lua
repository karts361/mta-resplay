local team = createTeam("Bots", 255, 255, 255)

function drugs(player)
local ship = math.random(1, 2)
	
	if ship == 1 then
		createObject(9585, -766.87274169922, 481.68872070313, 10.013709101825953, 0, 0, 0)
		call(getResourceFromName("slothbot"), "spawnBot", -794.97808837891, 491.17419433594, 20.341835021973, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -795.36791992188, 484.40493774414, 11.412146568298, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -762.15649414063, 490.59344482422, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -754.70593261719, 482.06436157227, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -733.78106689453, 482.02694702148, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -723.25854492188, 478.85247802734, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)

	elseif ship == 2 then
		createObject(9585, 588.40295410156, -2364.0786132813, 10.013709101825953, 0, 0, 0)
	
	call(getResourceFromName("slothbot"), "spawnBot", 560.05682373047, -2363.0532226563, 11.412146568298, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 574.75982666016, -2355.6213378906, 13.841834068298, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 589.84173583984, -2357.1508789063, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 594.72894287109, -2369.2800292969, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 621.466796875, -2363.6081542969, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 631.42053222656, -2365.7407226563, 5.1372742652893, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 560.13299560547, -2378.7338867188, 21.982460021973, 90, 112, 0, 0, team, 38, "guarding", false)
	end
end

addEventHandler("onResourceStart", resourceRoot, drugs)

function drugs2(player)
	local ship = math.random(1, 2)

	if ship == 1 then
		createObject(9585, -2972.7548828125, -2257.2822265625, 10.013709101825953, 0, 0, 0)

	call(getResourceFromName("slothbot"), "spawnBot", -3033.4565429688, -2255.046875, 26.662147521973, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", -3037.75390625, -2265.4140625, 31.841835021973, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", -3040.6452636719, -2259.0502929688, 36.248085021973, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", -3036.4147949219, -2253.2373046875, 36.248085021973, 90, 228, 0, 0, team, 0, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", -3030.2436523438, -2252.9765625, 26.673782348633, 90, 112, 0, 0, team, 30, "guarding", false)

	elseif ship == 2 then
		createObject(9585, 2771.7568359375, -2716.8469238281, 10.013709101825953, 0, 0, 0)
	
	call(getResourceFromName("slothbot"), "spawnBot", 2758.6252441406, -2716.5021972656, 10.943396568298, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2772.6735839844, -2713.09375, 10.943396568298, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2805.2062988281, -2714.2292480469, 5.1308965682983, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2814.8205566406, -2709.9091796875, 5.1372742652893, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2785.6142578125, -2725.9658203125, 5.1372742652893, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2743.7321777344, -2710.8395996094, 20.341835021973, 90, 112, 0, 0, team, 38, "guarding", false)
	call(getResourceFromName("slothbot"), "spawnBot", 2741.2373046875, -2724.9548339844, 22.654335021973, 90, 112, 0, 0, team, 38, "guarding", false)

	end
end

addEventHandler("onResourceStart", resourceRoot, drugs2)

function drugs3(player)
	local ship = math.random(1, 2)
	
	if ship == 1 then
		createObject(9585, 2961.5109863281, 386.66708374023, 10.013709101825953, 0, 0, 0)
		call(getResourceFromName("slothbot"), "spawnBot", 2903.9802246094, 390.8249206543, 26.677772521973, 90, 112, 0, 0, team, 30, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", 2899.8874511719, 388.82315063477, 26.662147521973, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", 2896.7453613281, 378.9853515625, 31.841835021973, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", 2893.7241210938, 385.10382080078, 36.246433258057, 90, 112, 0, 0, team, 38, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", 2899.2768554688, 392.16513061523, 36.248085021973, 40, 228, 0, 0, team, 24, "guarding", false)

	elseif ship == 2 then
		createVehicle(580, -2321.9973144531, -1618.8349609375, 483.71295166016, 0, 0, 0)
		call(getResourceFromName("slothbot"), "spawnBot", -2325.5041503906, -1619.5079345703, 483.71228027344, 40, 228, 0, 0, team, 0, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -2325.5324707031, -1620.9389648438, 483.71087646484, 90, 112, 0, 0, team, 30, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -2324.0759277344, -1619.8956298828, 483.7119140625, 90, 112, 0, 0, team, 30, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -2315.6333007813, -1626.6815185547, 483.70529174805, 90, 112, 0, 0, team, 30, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -2329.2404785156, -1628.25, 483.70373535156, 90, 112, 0, 0, team, 30, "guarding", false)
		call(getResourceFromName("slothbot"), "spawnBot", -2325.0327148438, -1606.4693603516, 483.78125, 90, 112, 0, 0, team, 38, "guarding", false)
	end
end

addEventHandler("onResourceStart", resourceRoot, drugs3)