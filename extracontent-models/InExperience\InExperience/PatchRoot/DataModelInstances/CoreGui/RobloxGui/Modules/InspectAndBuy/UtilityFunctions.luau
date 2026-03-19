local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v12 = {
    getBundleId = function(v3) --[[ Line: 9 ]] --[[ Name: getBundleId ]]
        if v3.parentBundleId ~= nil then
            return v3.parentBundleId;
        else
            return nil;
        end;
    end, 
    isCollectibles = function(v4) --[[ Line: 17 ]] --[[ Name: isCollectibles ]]
        -- upvalues: v1 (copy)
        return v4 and v4.productType and v4.productType == v1.ProductType.CollectibleItem;
    end, 
    hasLimitedQuantity = function(v5) --[[ Line: 21 ]] --[[ Name: hasLimitedQuantity ]]
        -- upvalues: v2 (copy)
        if not v5 then
            return nil;
        else
            local l_isLimited_0 = v5.isLimited;
            local v7 = if v2() then v5.isLimitedUnique else nil;
            local l_collectibleIsLimited_0 = v5.collectibleIsLimited;
            return l_isLimited_0 or v7 or l_collectibleIsLimited_0;
        end;
    end, 
    isLimited1Point0 = function(v9) --[[ Line: 34 ]] --[[ Name: isLimited1Point0 ]]
        if not v9 then
            return nil;
        else
            return v9.isLimited or v9.isLimitedUnique;
        end;
    end, 
    isLimited1Point0_LimitedUnique = function(v10) --[[ Line: 43 ]] --[[ Name: isLimited1Point0_LimitedUnique ]]
        if not v10 then
            return nil;
        else
            return v10.isLimitedUnique;
        end;
    end, 
    isLimited2Point0_Or_LimitedCollectible = function(v11) --[[ Line: 52 ]] --[[ Name: isLimited2Point0_Or_LimitedCollectible ]]
        if not v11 then
            return nil;
        else
            return v11.collectibleIsLimited;
        end;
    end
};
v12.isUnlimitedCollectibleAsset = function(v13, v14) --[[ Line: 61 ]] --[[ Name: isUnlimitedCollectibleAsset ]]
    -- upvalues: v12 (copy), v1 (copy)
    if not v13 or not v14 then
        return nil;
    else
        local v15 = not v12.hasLimitedQuantity(v14);
        local v16 = v14.productType == v1.ProductType.CollectibleItem;
        local v17 = v13 == v1.ItemType.Asset;
        return v15 and v16 and v17;
    end;
end;
v12.isLimitedBundle = function(v18, v19) --[[ Line: 73 ]] --[[ Name: isLimitedBundle ]]
    -- upvalues: v1 (copy)
    if not v18 or not v19 then
        return nil;
    else
        local l_collectibleIsLimited_1 = v19.collectibleIsLimited;
        local v21 = v18 == v1.ItemType.Bundle;
        return l_collectibleIsLimited_1 and v21;
    end;
end;
v12.isUnlimitedCollectibleBundle = function(v22, v23) --[[ Line: 84 ]] --[[ Name: isUnlimitedCollectibleBundle ]]
    -- upvalues: v1 (copy)
    if not v22 or not v23 then
        return nil;
    else
        local v24 = not v23.collectibleIsLimited;
        local v25 = v23.productType == v1.ProductType.CollectibleItem;
        local v26 = v22 == v1.ItemType.Bundle;
        return v24 and v25 and v26;
    end;
end;
v12.isLimitedCollectible = function(v27) --[[ Line: 96 ]] --[[ Name: isLimitedCollectible ]]
    -- upvalues: v12 (copy), v1 (copy)
    if not v27 then
        return nil;
    else
        local v28 = v12.hasLimitedQuantity(v27);
        local v29 = v27.productType == v1.ProductType.CollectibleItem;
        return v28 and v29;
    end;
end;
return v12;