local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_script_FirstAncestor_0.State.Actions.PurchaseItemsSuccess);
local v4 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_UnifiedSelectionListStore_0 = v4.Store.UnifiedSelectionListStore;
local l_sendUnifiedEventsForMultiItemShopping_0 = v4.sendUnifiedEventsForMultiItemShopping;
local l_UnifiedEventLogEnums_0 = v4.UnifiedEventLogEnums;
local l_getUnifiedEventsForMIS_0 = v4.Utils.getUnifiedEventsForMIS;
local l_CartIdService_0 = v4.Lib.CartIdService;
local v10 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v10.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 = v10.FFlagAXFixAvatarLooksSaveWithMakeupItems;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    return function(v13, v14, v15, v16, v17, v18, v19, v20, _, v22, v23) --[[ Line: 19 ]]
        -- upvalues: l_sendUnifiedEventsForMultiItemShopping_0 (copy), l_getUnifiedEventsForMIS_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_mutedError_0 (copy), l_CartIdService_0 (copy), l_UnifiedSelectionListStore_0 (copy), v3 (copy)
        return function(v24, _) --[[ Line: 32 ]]
            -- upvalues: v22 (copy), v23 (copy), l_sendUnifiedEventsForMultiItemShopping_0 (ref), l_getUnifiedEventsForMIS_0 (ref), v13 (copy), v19 (copy), l_UnifiedEventLogEnums_0 (ref), l_mutedError_0 (ref), l_CartIdService_0 (ref), l_UnifiedSelectionListStore_0 (ref), v17 (ref), v20 (copy), v3 (ref), v14 (copy), v15 (copy), v16 (copy), v18 (copy)
            local v26 = v24:getState();
            if not pcall(function() --[[ Line: 35 ]]
                -- upvalues: v22 (ref), v26 (copy), v23 (ref), l_sendUnifiedEventsForMultiItemShopping_0 (ref), l_getUnifiedEventsForMIS_0 (ref), v13 (ref), v19 (ref), l_UnifiedEventLogEnums_0 (ref)
                if v22 then
                    v22.isOrganicLook = v26.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo == nil;
                end;
                if v23 then
                    v23.isOrganicLook = v26.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo == nil;
                end;
                l_sendUnifiedEventsForMultiItemShopping_0(l_getUnifiedEventsForMIS_0(v13, v19, v22, v23, l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS));
            end) then
                l_mutedError_0("Failed to send unified events for multi-item shopping purchase success");
            end;
            l_CartIdService_0.refreshCartId();
            l_UnifiedSelectionListStore_0.clearSelectionList();
            if v17 == nil then
                local v27 = v20(v26, v19);
                v17 = if v27 then v27.scales else nil;
            end;
            v24:dispatch(v3({
                items = v13, 
                equippableAssets = v14, 
                replaceAllEquippedAssets = v15, 
                bodyColor3s = v16, 
                bodyScales = v17, 
                bodyPartColorRangeIds = v18
            }));
        end;
    end;
else
    return function(v28, v29, v30, v31, v32, v33, v34, v35, v36) --[[ Line: 87 ]]
        -- upvalues: v3 (copy), l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 (copy)
        return function(v37, _) --[[ Line: 98 ]]
            -- upvalues: v32 (ref), v35 (copy), v34 (copy), v3 (ref), v28 (copy), v29 (copy), v30 (copy), l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 (ref), v36 (copy), v31 (copy), v33 (copy)
            local v39 = v37:getState();
            if v32 == nil then
                local v40 = v35(v39, v34);
                v32 = if v40 then v40.scales else nil;
            end;
            v37:dispatch(v3({
                items = v28, 
                equippableAssets = v29, 
                replaceAllEquippedAssets = v30, 
                shouldClearEquippedMakeup = if l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 then v36 else nil, 
                bodyColor3s = v31, 
                bodyScales = v32, 
                bodyPartColorRangeIds = v33
            }));
        end;
    end;
end;