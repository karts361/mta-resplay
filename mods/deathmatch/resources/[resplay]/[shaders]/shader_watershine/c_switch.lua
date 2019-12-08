addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		triggerEvent("switchWaterShine", resourceRoot, true)
		bindKey("F2", "down",
			function()
				triggerEvent("switchWaterShine", resourceRoot, not wsEffectEnabled)
			end
		)
	end
)


--------------------------------
-- Switch effect on or off
--------------------------------
function switchWaterShine(wsOn)
	outputDebugString("switchWaterShine: " .. tostring(wsOn))
	
	if(wsOn) then
		enableWaterShine()	
	else
		disableWaterShine()
	end

end

addEvent("switchWaterShine", true)
addEventHandler("switchWaterShine", resourceRoot, switchWaterShine)
