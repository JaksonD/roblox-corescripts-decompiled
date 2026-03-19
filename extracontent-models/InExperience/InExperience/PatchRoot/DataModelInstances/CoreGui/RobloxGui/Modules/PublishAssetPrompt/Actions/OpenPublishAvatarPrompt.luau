local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 19 ]]
    return {
        promptInfo = {
            promptType = v1, 
            guid = v2, 
            scopes = v3
        }
    };
end);