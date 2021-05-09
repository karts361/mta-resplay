function setWeaponStat( ) 
  for _, skill in ipairs({"poor", "std", "pro"}) do 
    setWeaponProperty(38, skill, "damage", 38) 
    setWeaponProperty(23, skill, "damage", 6) 
	setWeaponProperty(23, skill, "weapon_range", 14)
    setWeaponProperty( "minigun", skill, "anim_loop_stop", 0.5 )
    setWeaponProperty( "minigun", skill, "anim2_loop_stop", 0.5 )
  end 
end 
addEventHandler( "onResourceStart", resourceRoot, setWeaponStat ) 
