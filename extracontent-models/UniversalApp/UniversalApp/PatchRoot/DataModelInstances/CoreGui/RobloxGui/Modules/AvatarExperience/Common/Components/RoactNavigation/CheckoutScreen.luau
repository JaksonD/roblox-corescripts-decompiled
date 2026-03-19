local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useAvatarRoute_0 = v4.AvatarRoute.Hooks.useAvatarRoute;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v16 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v17 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v20 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_sendUnifiedEventForDeferredAction_0 = v5.sendUnifiedEventForDeferredAction;
local l_UnifiedEventLogEnums_0 = v5.UnifiedEventLogEnums;
local l_CheckoutPageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutPageContainer;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local function v28(v25) --[[ Line: 34 ]] --[[ Name: selectRobuxFetchInfo ]]
    local l_LocalUserId_0 = v25.LocalUserId;
    local v27 = v25.UserRobux[l_LocalUserId_0];
    return {
        localUserId = v25.LocalUserId, 
        userRobux = v27
    };
end;
return v24(function() --[[ Line: 40 ]] --[[ Name: CheckoutScreen ]]
    -- upvalues: l_useRoactService_0 (copy), v7 (copy), v8 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v28 (copy), l_getUseSelectorDeepEquals_0 (copy), v3 (copy), v9 (copy), l_UnifiedEventLogEnums_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v16 (copy), v17 (copy), v18 (copy), l_CheckoutPageContainer_0 (copy), v20 (copy)
    local v29 = l_useRoactService_0(v7);
    local v30 = l_useRoactService_0(v8);
    local v31 = l_useDispatch_0();
    local v32 = l_useNavigation_0();
    local v33 = l_useAvatarRoute_0();
    local v34 = l_useSelector_0(v28, l_getUseSelectorDeepEquals_0());
    local v37 = v3.useCallback(function(v35, v36) --[[ Line: 49 ]]
        -- upvalues: v31 (copy), v9 (ref)
        v31(v9(v35, v36));
    end, {
        v31, 
        v29, 
        v30
    });
    local v42 = v3.useCallback(function(v38, v39, v40) --[[ Line: 53 ]]
        -- upvalues: l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v31 (copy), v16 (ref), v30 (copy), v33 (copy), v32 (copy)
        local v41 = nil;
        if v39 == "Asset" then
            v41 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET;
        elseif v39 == "Bundle" then
            v41 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
        end;
        l_sendUnifiedEventForDeferredAction_0({
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
            elementName = "CLICK_ITEM_DETAILS", 
            itemId = v38, 
            itemType = v41
        });
        v31(v16({
            itemId = v38, 
            itemType = v39, 
            itemSubType = v40, 
            catalogAnalytics = v30, 
            avatarRoute = v33, 
            navigation = v32, 
            showFullWithNoPeekView = true
        }));
    end, {
        v31
    });
    local v43 = v3.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v31 (copy), v17 (ref), v29 (copy), v34 (copy)
        v31(v17(v29, v34.localUserId, true));
    end, {
        v31, 
        v29, 
        v34
    });
    local v46 = v3.useCallback(function(v44, v45) --[[ Line: 83 ]]
        -- upvalues: v31 (copy), v18 (ref), v29 (copy), v30 (copy)
        v31(v18(v29, v30, v44, v45, true));
    end, {
        v31, 
        v29, 
        v30
    });
    return v3.createElement(l_CheckoutPageContainer_0, {
        onRemoveItem = v37, 
        onOpenItemDetailsPage = v42, 
        fetchUserRobux = v43, 
        fetchItemData = v46, 
        getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = v20.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, 
        getBundleOutfitInfoFromProvidedTryOns = v20.getBundleOutfitInfoFromProvidedTryOns
    });
end);