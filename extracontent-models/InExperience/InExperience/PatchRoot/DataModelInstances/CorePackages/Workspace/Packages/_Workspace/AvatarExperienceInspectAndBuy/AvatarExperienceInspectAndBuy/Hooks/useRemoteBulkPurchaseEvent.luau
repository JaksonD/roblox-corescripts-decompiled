local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FIntBulkPurchaseRequestLimit_0 = require(l_Parent_0.SharedFlags).FIntBulkPurchaseRequestLimit;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Utils.bulkPurchaseUtils);
local v8 = require(l_script_FirstAncestor_0.Utils.buildBulkPurchaseAnalyticsPayload);
local v9 = require(l_Parent_0.tutils);
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local v11 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXFixBulkPurchaseFreeItems_0 = v11.FFlagAXFixBulkPurchaseFreeItems;
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = v11.FFlagAXEnableIaBTimedOptionsBulkPurchase;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_useItemSelectionStore_0 = require(l_script_FirstAncestor_0.Contexts.ItemSelectionStoreContext).useItemSelectionStore;
local _ = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local function v18(v17) --[[ Line: 47 ]]
    return {
        assets = v17.assets, 
        bundles = v17.bundles
    };
end;
local function v20(v19) --[[ Line: 54 ]]
    return v19.collectibleResellableInstances;
end;
return function(v21, v22) --[[ Line: 58 ]]
    -- upvalues: l_useSelector_0 (copy), v18 (copy), v9 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy), v20 (copy), v3 (copy), v7 (copy), l_useItemSelectionStore_0 (copy), l_useSignalState_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_ItemTypeEnum_0 (copy), v8 (copy), l_FFlagAXFixBulkPurchaseFreeItems_0 (copy), l_FIntBulkPurchaseRequestLimit_0 (copy)
    local v23 = l_useSelector_0(v18, v9.deepEqual);
    local v24 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSelector_0(v20, v9.deepEqual) else nil;
    local v25 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v7 (ref), v21 (copy), v23 (copy)
        return v7.getBulkPurchaseEligibleItems(v21, v23);
    end, {
        v21, 
        v23
    });
    local v26 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useItemSelectionStore_0() else nil;
    local v27 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useSignalState_0(v26.getItemDataMap) else nil;
    return v3.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (ref), v7 (ref), v25 (copy), v27 (copy), l_ItemTypeEnum_0 (ref), v8 (ref), v23 (copy), v24 (copy), v22 (copy)
        coroutine.wrap(function() --[[ Line: 76 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (ref), v7 (ref), v25 (ref), v27 (ref), l_ItemTypeEnum_0 (ref), v8 (ref), v23 (ref), v24 (ref), v22 (ref)
            local v28 = l_RobloxReplicatedStorage_0:WaitForChild("ServerSideBulkPurchaseEvent", 1e999);
            if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then
                v28:FireServer((v7.buildRequestedItemsWithTimedOptions(v25.requestedItems, v27)));
            else
                v28:FireServer(v25.requestedItems);
            end;
            for _, v30 in v25.requestedItems do
                local v31 = if v30.itemType == Enum.AvatarItemType.Asset.Value then l_ItemTypeEnum_0.Asset else l_ItemTypeEnum_0.Bundle;
                local v32 = tostring(v30.id);
                if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then
                    local v33 = v27 and v27[v32];
                    local v34 = v8({
                        itemId = v32, 
                        itemType = v31, 
                        assetsMap = v23.assets, 
                        bundlesMap = v23.bundles, 
                        collectibleResellableInstances = v24, 
                        storedData = v33
                    });
                    if v34 then
                        v22.reportPurchaseAttemptUnifiedEvent(v31, v32, v34);
                    end;
                else
                    v22.reportPurchaseAttempt(v31, v32);
                end;
            end;
        end)();
    end, {
        v25, 
        v22.reportPurchaseAttempt, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v27 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v23 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v24 else nil, 
        if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v22.reportPurchaseAttemptUnifiedEvent else nil
    }), v3.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: l_FFlagAXFixBulkPurchaseFreeItems_0 (ref), v25 (copy), l_FIntBulkPurchaseRequestLimit_0 (ref)
        local _ = false;
        if l_FFlagAXFixBulkPurchaseFreeItems_0 then
            if v25.requestedItems then
                local v36 = false;
                if #v25.requestedItems <= l_FIntBulkPurchaseRequestLimit_0 then
                    v36 = #v25.requestedItems > 0;
                end;
                return v36;
            else
                return false;
            end;
        elseif v25.requestedItems then
            return #v25.requestedItems <= l_FIntBulkPurchaseRequestLimit_0;
        else
            return false;
        end;
    end, {
        v25
    }), v25.totalPrice or 0;
end;