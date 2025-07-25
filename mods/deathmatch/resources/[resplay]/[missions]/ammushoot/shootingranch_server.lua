
local curDimension = 1

shootingRanges = {}
 shootingRanges["x"] = {}
 shootingRanges["y"] = {}
 shootingRanges["z"] = {}
 shootingRanges["sx"] = {}
 shootingRanges["sy"] = {}
 shootingRanges["sz"] = {}
 shootingRanges["sr"] = {}
 local i = 0
  i = i + 1
--[[  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2176.910, 924.81, 10.075
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2176.910, 922.68, 10.075, 180
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 256.08584594727, 1802.0675048828, 6.4703001976013
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 254.12063598633, 1802.0413818359, 7.0705094337463, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2282.251953125, 2423.759765625, 2.4626379013062
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2282.265625, 2425.4760742188, 3.1257882118225, 0
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -328.61669921875, 835.58874511719, 13.21817779541
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -330.22076416016, 835.6220703125, 13.891412734985, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -2615.6701660156, 205.30712890625, 3.7477607727051
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -2613.9396972656, 205.31129455566, 4.5365352630615, 90
  createObject ( 14819, -2616.5422363281, 206.02464294434, 4.8791799545288, 0, 0, 90 )
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -1594.5709228516, 716.26202392578, -5.9332661628723
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -1593.0947265625, 716.33172607422, -5.5929617881775, 90
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = -2455.5949707031, 503.91421508789, 29.057998657227
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = -2453.4343261719, 503.96768188477, 29.729562759399, 90
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2556.9567871094, 2065.1750488281, 10.08
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2556.9602050781, 2063.1391601563, 10.46, 180]]

for i, index in pairs ( shootingRanges["x"] ) do

	local x1, y1, z1 = shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i]
	local x2, y2, z2, r = shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i]
	
	--createMarker ( x1, y1, z1, "cylinder", 1, 125, 0, 0, 150 )
	--local marker = createMarker ( x1, y1, z1 + 1, "corona", 1, 125, 0, 0, 0 )
	setElementData ( marker, "x", x2 )
	setElementData ( marker, "y", y2 )
	setElementData ( marker, "z", z2 )
	setElementData ( marker, "r", r )
	--[[addEventHandler ( "onMarkerHit", marker,
		function ( hit )
			if getElementType ( hit ) == "player" then
				if not getPedOccupiedVehicle ( hit ) then
					showCursor ( hit, true )
					triggerClientEvent ( hit, "showShootingRangeSelection", hit )
					local x, y, z, r = getElementData ( source, "x" ), getElementData ( source, "y" ), getElementData ( source, "z" ), getElementData ( source, "r" )
					setElementData ( hit, "shootingRangeX", x )
					setElementData ( hit, "shootingRangeY", y )
					setElementData ( hit, "shootingRangeZ", z )
					setElementData ( hit, "shootingRangeR", r )
				end
			end
		end
	)]]
end

function startShootingRanch_func ( gun )

	local player = client
	local id = shootingRangeGunIDs[gun]
	setElementDimension ( player, getFreeDimension () )
	
	giveWeapon ( player, id, 9999, true )
	giveWeapon ( player, id, 9999, true )
	giveWeapon ( player, id, 9999, true )
	setPedFrozen ( player, true )
	setTimer ( setPedFrozen, 5000, 1, player, false )
	
	setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
	setPedRotation ( player, 90 )
	setElementInterior ( player, 7 )
	
	setTimer ( triggerClientEvent, 3000, 1, player, "startShootingRanchTest", player )
	
	setElementData ( player, "shootingRanchGun", id )
end
addEvent ( "startShootingRanch", true )
addEventHandler ( "startShootingRanch", getRootElement(), startShootingRanch_func )

function endShootingRanchTest_func ( percent, hit )

	local player = client
	local pname = getPlayerName ( player )
	
	setElementInterior ( player, 0 )
	setElementDimension ( player, 0 )
	
	setElementPosition ( player, 1545.3, -1675.5, 13.5 )
	
	setTimer(giveWeaponLicense, 1000, 1, player)
	
	takeWeapon ( player, getElementData ( player, "shootingRanchGun" ) )
	setElementData ( player, "shootingRanchGun", nil )
end
addEvent ( "endShootingRanchTest", true )
addEventHandler ( "endShootingRanchTest", getRootElement(), endShootingRanchTest_func )

function giveWeaponLicense(player)
	exports.resplay:licenseWeaponExamFinished(player)
end

function getFreeDimension ()

	curDimension = curDimension + 1
	return curDimension
end