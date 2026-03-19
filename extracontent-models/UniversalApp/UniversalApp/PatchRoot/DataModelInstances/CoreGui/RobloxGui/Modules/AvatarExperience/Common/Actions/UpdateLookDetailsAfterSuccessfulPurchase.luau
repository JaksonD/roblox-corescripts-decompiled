local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 18 ]]
    return {
        lookId = v1, 
        purchasedAssetIds = v2, 
        purchasedBundleIds = v3, 
        isOwnedAfterPurchase = v4
    };
end);