local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Parent.AXCommon);
local v4 = require(l_Parent_0.React);
local l_useMemo_0 = v4.useMemo;
local l_useCallback_0 = v4.useCallback;
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_script_FirstAncestor_0.Utils.convertAssetInfoToItemData);
local v9 = require(l_script_FirstAncestor_0.Utils.convertBundleInfoToItemData);
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v11 = require(l_Parent_0.tutils);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
local l_FFlagAXEnableBatchItemDetailsFetchV2_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableBatchItemDetailsFetchV2;
local l_BatchItemDetailsPerformFetchKey_0 = require(l_script_FirstAncestor_0.Constants).BatchItemDetailsPerformFetchKey;
local function v17(v16) --[[ Line: 28 ]] --[[ Name: getResellableInsances ]]
    return v16.collectibleResellableInstances;
end;
return function(v18) --[[ Line: 36 ]] --[[ Name: useConvertedItemData ]]
    -- upvalues: l_useCallback_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (copy), l_PerformFetch_0 (copy), l_BatchItemDetailsPerformFetchKey_0 (copy), l_useSelector_0 (copy), v11 (copy), v17 (copy), l_useMemo_0 (copy), v8 (copy), v9 (copy)
    local v19 = if v18 then v18.id else nil;
    local v20 = if v18 then v18.itemType else nil;
    local v22 = l_useCallback_0(function(v21) --[[ Line: 40 ]]
        -- upvalues: v20 (copy), l_ItemTypeEnum_0 (ref), v19 (copy)
        if v20 == l_ItemTypeEnum_0.Asset then
            return v21.assets[v19];
        elseif v20 == l_ItemTypeEnum_0.Bundle then
            return v21.bundles[v19];
        else
            return nil;
        end;
    end, {
        v19, 
        v20
    });
    local v25 = l_useCallback_0(function(v23) --[[ Line: 49 ]]
        -- upvalues: l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), l_PerformFetch_0 (ref), l_BatchItemDetailsPerformFetchKey_0 (ref), v19 (copy), v20 (copy), l_ItemTypeEnum_0 (ref)
        if l_FFlagAXEnableBatchItemDetailsFetchV2_0 then
            return l_PerformFetch_0.GetStatus(v23, l_BatchItemDetailsPerformFetchKey_0);
        elseif v19 and v20 then
            local v24 = string.format("inspectAndBuy.%d.getItemDetails.%s.%s", v23.storeId, v19, if v20 == l_ItemTypeEnum_0.Asset then tostring(Enum.AvatarItemType.Asset) else tostring(Enum.AvatarItemType.Bundle));
            return l_PerformFetch_0.GetStatus(v23, v24);
        else
            return nil;
        end;
    end, {
        v19, 
        v20
    });
    local v26 = l_useSelector_0(v22, v11.deepEqual);
    local v27 = l_useSelector_0(v17, v11.deepEqual);
    local v28 = l_useSelector_0(v25, v11.deepEqual);
    return l_useMemo_0(function() --[[ Line: 74 ]]
        -- upvalues: v26 (copy), v27 (copy), v20 (copy), l_ItemTypeEnum_0 (ref), v8 (ref), v9 (ref)
        local v29 = nil;
        if v26 and v26.collectibleItemId ~= nil and v27 ~= nil then
            v29 = v27[v26.collectibleItemId];
        end;
        if v26 then
            if v20 == l_ItemTypeEnum_0.Asset then
                return (v8(v26, v29));
            elseif v20 == l_ItemTypeEnum_0.Bundle then
                return (v9(v26, v29));
            end;
        end;
        return nil;
    end, {
        v26, 
        v27, 
        v20
    }), v28;
end;