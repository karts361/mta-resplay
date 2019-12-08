local isWearing = false
local weapons = {[17] = true, [41] = true, [42] = true}

function goggleFunction(attacker, weapon)	
	if attacker and weapons[weapon] then

		if isWearing then
			cancelEvent();

		end

	end
end	

function clearGasMask()
	removeEventHandler("onClientPreRender", root, displayMyTask);
	isWearing = false
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), clearGasMask)

function switch(_, cur)
	if cur == 11 and getPedWeapon(localPlayer, 11) == 44 then 
		addEventHandler("onClientPreRender", root, displayMyTask)

	else
		removeEventHandler("onClientPreRender", root, displayMyTask);

	end
end	


function displayMyTask()
	local tasksort, task = getPedTask(localPlayer, "primary", 3);
	setCameraGoggleEffect("normal")

	if tasksort == "TASK_COMPLEX_USE_GOGGLES" then 

		if task == "TASK_SIMPLE_GOGGLES_ON" then 			
			isWearing = true;

		elseif task == "TASK_SIMPLE_GOGGLES_OFF" then 
			isWearing = false;

		end
	end		
end    

function init()
	addEventHandler("onClientPlayerDamage", localPlayer, goggleFunction)
	addEventHandler("onClientPlayerWeaponSwitch", localPlayer, switch)
	local txd = engineLoadTXD("gasmask.txd")
	engineImportTXD(txd, 368)
	local dff = engineLoadDFF("gasmask.dff")
	engineReplaceModel(dff, 368)
end
addEventHandler("onClientResourceStart", resourceRoot, init)