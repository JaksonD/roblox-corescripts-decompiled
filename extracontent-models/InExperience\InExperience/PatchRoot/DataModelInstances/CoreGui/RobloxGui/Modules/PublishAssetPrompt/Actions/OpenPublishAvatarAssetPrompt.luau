local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 22 ]]
    return {
        promptInfo = {
            promptType = v1, 
            accessoryType = v2, 
            guid = v3, 
            scopes = v4
        }
    };
end);