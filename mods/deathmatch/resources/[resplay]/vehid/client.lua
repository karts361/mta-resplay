function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font,...)
local vehicles = getElementsByType("vehicle")
for _, veh in ipairs(vehicles) do
	local vehid = getElementModel(veh)
	local x, y, z = getElementPosition(veh)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 35
	local height = height or 1
	size = 1.7

	if (isLineOfSightClear(x, y, z+2, x2, y2, z2, ...)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z+height)
		if(sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then
				dxDrawText("#FFA600[#FFFFFF"..vehid.."#FFA600]", sx+2, sy+10, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "default-bold", "center", "center", false, false, false, true)
			end
		end
	end

end
end
addEventHandler("onClientRender", root, dxDrawTextOnElement)