--[[
    # Resource Name
	  Cromus's Free Vehicle Velocimetro
	# Author
	  Midlas
	# Date
	  08/04/2021
	# Copyright (c)
	  If you edit it, then please respect me and keep
	  the credits.
--]]

local screenW2,screenH2 = guiGetScreenSize()
local resW2, resH2 = 1280,960
local x, y =  (screenW2/resW2), (screenH2/resH2)

local newFont1 = dxCreateFont( "font.ttf", 32 )
--local newFont = dxCreateFont( "font1.ttf", 32 )

function drawVehicleHUD()
    local vehicle = getPedOccupiedVehicle( getLocalPlayer() )
	    if ( vehicle ) then
		    local speedX, speedY, speedZ = getElementVelocity ( vehicle  )
		    local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
		    local KMH = math.floor(actualSpeed*180)	
		       if ( getElementHealth( vehicle ) >= 1000 ) then
		        vehiclehealth = 100
		    else
		        vehiclehealth = math.floor(getElementHealth ( vehicle )/10)
		    end
			





						
        dxDrawImage(x*1100, y*915, x*125, y*34, "barra.png", 0, 0, 0, tocolor(255, 165, 0, 255), false)
        dxDrawImage(x*1100, y*915, x*29, y*31, "speed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(""..KMH.."#ffa500 Km/h", x*1115, y*937, x*1243, y*927, tocolor(255, 165, 0, 255), 0.5, newFont1, "center", "center", false, false, false, true, false)







		
		local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		local vehicle = getVehicleName(veh)
		
	else     
		
    end
		
		



					
					
		end
	end
addEventHandler("onClientRender", root, drawVehicleHUD)