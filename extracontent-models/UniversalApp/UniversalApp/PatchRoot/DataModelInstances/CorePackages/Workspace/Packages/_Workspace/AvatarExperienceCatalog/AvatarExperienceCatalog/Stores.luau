local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local v1 = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
return function() --[[ Line: 12 ]] --[[ Name: getCatalogStores ]]
    -- upvalues: v1 (copy)
    return {
        shoppingCartStore = v1()
    };
end;