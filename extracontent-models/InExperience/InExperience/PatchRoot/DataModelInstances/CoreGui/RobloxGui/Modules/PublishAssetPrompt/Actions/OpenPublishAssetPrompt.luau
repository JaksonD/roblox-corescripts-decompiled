local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4, v5) --[[ Line: 23 ]]
    return {
        promptInfo = {
            promptType = v1, 
            assetInstance = v2, 
            assetType = v3, 
            guid = v4, 
            scopes = v5
        }
    };
end);