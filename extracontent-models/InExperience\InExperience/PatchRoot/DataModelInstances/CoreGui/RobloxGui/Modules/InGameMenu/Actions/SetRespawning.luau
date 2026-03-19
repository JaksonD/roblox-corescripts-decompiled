local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SET_RESPAWNING", function(v1) --[[ Line: 5 ]]
    return {
        respawning = v1
    };
end);