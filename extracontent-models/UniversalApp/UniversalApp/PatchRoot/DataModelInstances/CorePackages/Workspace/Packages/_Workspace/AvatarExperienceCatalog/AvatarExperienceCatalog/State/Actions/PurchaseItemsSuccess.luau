local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 51 ]]
    return {
        equippableAssets = v4.equippableAssets, 
        items = v4.items, 
        replaceAllEquippedAssets = v4.replaceAllEquippedAssets, 
        bodyColor3s = v4.bodyColor3s, 
        bodyScales = v4.bodyScales, 
        bodyPartColorRangeIds = v4.bodyPartColorRangeIds
    };
end);