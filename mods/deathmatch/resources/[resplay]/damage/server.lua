function setWeaponStat( ) 
  for _, skill in ipairs({"poor", "std", "pro"}) do 
    setWeaponProperty(38, skill, "damage", 65) 
    setWeaponProperty(23, skill, "damage", 6) 
    setWeaponProperty(24, skill, "damage", 125) 
    setWeaponProperty(22, skill, "damage", 85) 
    setWeaponProperty(32, skill, "damage", 52) 
    setWeaponProperty(28, skill, "damage", 35) 
    setWeaponProperty(25, skill, "damage", 13) 
    setWeaponProperty(30, skill, "damage", 60) 
    setWeaponProperty(31, skill, "damage", 60) 
    setWeaponProperty(26, skill, "damage", 18) 
	setWeaponProperty(23, skill, "weapon_range", 14)
    setWeaponProperty( "minigun", skill, "anim_loop_stop", 0.5 )
    setWeaponProperty( "minigun", skill, "anim2_loop_stop", 0.5 )
  end 
end 
addEventHandler( "onResourceStart", resourceRoot, setWeaponStat ) 
