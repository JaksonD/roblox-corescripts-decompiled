local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 4 ]]
    return {
        tryingOn = v1, 
        assetId = v2, 
        assetTypeId = v3
    };
end);