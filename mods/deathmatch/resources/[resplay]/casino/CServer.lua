--[[
	##########################################################################
	##                                                                      ##
	## Project: 'Pong' - Resource for MTA: San Andreas PROJECT X            ##
	##                      Developer: Noneatme                             ##
	##           License: See LICENSE in the top level directory            ##
	##                                                                      ##
	##########################################################################
	[C] Copyright 2013-2014, Noneatme, Project X Gaming
]]


local cFunc = {}
local cSetting = {}

-- FUNCTIONS --

cFunc["on_start"] = function()
	outputChatBox("Use /pong to play pong. Use your mouse to move your player. Press SPACE to cancel.", getRootElement(), 255, 255, 0)
	
	if(getFPSLimit() < 40) and (getFPSLimit() ~= 0) then
		outputDebugString("The Pong resource needs a highter framerate! Please set the frame limit to 40 or above.", 1)
		
		if(setFPSLimit(50)) then
			outputDebugString("The Pong resource set the frame limit to 50.", 3)
		end
	end
end

cFunc["pong_start"] = function(thePlayer)
	triggerClientEvent(thePlayer, "onMTPongStart", thePlayer)
end

-- EVENT HANDLER --

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), cFunc["on_start"])
addCommandHandler("pong", cFunc["pong_start"])