local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 14 ]]
    return {
        lookId = v1, 
        assetIds = v2, 
        bundleIds = v3
    };
end);