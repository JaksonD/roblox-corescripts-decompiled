local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
return require(l_script_FirstAncestor_0.dependencies).enumerate(script.Name, {
    StudioPresenceTextGlobal = "Roblox Studio", 
    StudioPresenceTextLuobu = "LuoBu Studio"
});