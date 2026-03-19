local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 4 ]]
    return {
        assetTypeId = v1, 
        isFinished = v2
    };
end);