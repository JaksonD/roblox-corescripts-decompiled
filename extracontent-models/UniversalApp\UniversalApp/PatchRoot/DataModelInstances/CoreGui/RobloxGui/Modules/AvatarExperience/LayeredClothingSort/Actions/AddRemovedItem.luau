local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 12 ]]
    return {
        removedAssetId = v1, 
        removedAssetTypeId = v2
    };
end);