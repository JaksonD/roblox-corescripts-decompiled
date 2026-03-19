local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local v1 = require(l_script_FirstAncestor_0.State.Actions.PurchaseItemsSuccess);
return function(v2, v3, v4, v5, v6, v7, v8, v9) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v10, _) --[[ Line: 15 ]]
        -- upvalues: v6 (ref), v9 (copy), v8 (copy), v1 (ref), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v7 (copy)
        local v12 = v10:getState();
        if v6 == nil then
            local v13 = v9(v12, v8);
            v6 = if v13 then v13.scales else nil;
        end;
        v10:dispatch(v1({
            items = v2, 
            equippableAssets = v3, 
            replaceAllEquippedAssets = v4, 
            bodyColor3s = v5, 
            bodyScales = v6, 
            bodyPartColorRangeIds = v7
        }));
    end;
end;