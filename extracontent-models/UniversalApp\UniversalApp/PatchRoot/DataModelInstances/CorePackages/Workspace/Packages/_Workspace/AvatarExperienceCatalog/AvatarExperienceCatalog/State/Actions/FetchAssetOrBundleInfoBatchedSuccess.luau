local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 16 ]]
    return {
        hydratedBundles = v1.hydratedBundles, 
        assetsInBundle = v1.assetsInBundle, 
        hydratedAssets = v1.hydratedAssets
    };
end);