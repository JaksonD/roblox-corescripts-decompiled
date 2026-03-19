local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "string", "SetCollectibleMarketplaceResaleParameters action expects collectibleItemId to be a string");
    v1.isType(v3, "table", "SetCollectibleMarketplaceResaleParameters action expects resaleParametersInfo to be a table");
    return {
        collectibleItemId = v2, 
        resaleParametersInfo = v3, 
        itemSubTypeNameString = v4
    };
end);