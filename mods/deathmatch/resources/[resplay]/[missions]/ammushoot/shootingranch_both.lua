shootingRangeGuns = {}
shootingRangeGunIDs = {}
 shootingRangeGuns["name"] = {}
 shootingRangeGuns["id"] = {}
 i = 0
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "9mm", 22
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "Shotgun", 25
 i = i + 1
 shootingRangeGuns["name"][i], shootingRangeGuns["id"][i] = "MP5", 29
for i, index in pairs ( shootingRangeGuns["name"] ) do
	shootingRangeGunIDs[index] = shootingRangeGuns["id"][i]
end