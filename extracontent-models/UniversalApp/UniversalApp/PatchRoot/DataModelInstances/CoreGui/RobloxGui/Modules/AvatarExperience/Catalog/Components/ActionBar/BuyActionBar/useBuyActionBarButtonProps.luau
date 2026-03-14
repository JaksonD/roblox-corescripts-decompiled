local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_AvatarScreen_0 = v5.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v16 = require(l_CorePackages_0.Packages.tutils);
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v22 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v23 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v24 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v28 = require(script.Parent.BuyActionButtonTypeEnum);
local v29 = require(script.Parent.getActionButtonType);
local v30 = require(script.Parent.getExperienceCount);
local v31 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableActionButtonOnOwnedItemInCustomize);
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local v35 = l_Images_0["icons/menu/avatar_on"];
local v36 = l_Images_0["icons/common/robux"];
local v37 = l_Images_0["icons/actions/block"];
local function _(v38) --[[ Line: 50 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v38.LocalUserId;
    return v38.UserRobux[l_LocalUserId_0];
end;
local function _(v41) --[[ Line: 55 ]] --[[ Name: useLocalizedPrice ]]
    -- upvalues: v23 (copy), v24 (copy), l_NumberLocalization_0 (copy)
    local v42 = v41 and string.format("%.0f", v41);
    local v43 = v23(v24);
    if v41 then
        return (l_NumberLocalization_0.localize(v42, v43:GetLocale()));
    else
        return nil;
    end;
end;
local function _(v45, v46) --[[ Line: 61 ]] --[[ Name: selectCollectibleItemInfo ]]
    local l_CollectiblesItemInfo_0 = v45.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    if v46 then
        return l_CollectiblesItemInfo_0[v46];
    else
        return nil;
    end;
end;
local function v63(v49, v50, v51) --[[ Line: 67 ]] --[[ Name: selectIsLoadingState ]]
    -- upvalues: v18 (copy), l_PerformFetch_0 (copy), v19 (copy), v17 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v25 (copy)
    if not v50 then
        return true;
    else
        local v52 = v18(v49.AvatarExperience.Common, v50, v51);
        local v53 = if v52 then v52.collectibleItemId else nil;
        local l_CollectiblesItemInfo_1 = v49.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
        local v55 = if v53 then l_CollectiblesItemInfo_1[v53] else nil;
        l_CollectiblesItemInfo_1 = false;
        if v53 ~= nil then
            l_CollectiblesItemInfo_1 = v53 ~= "";
        end;
        local v56 = l_PerformFetch_0.GetStatus(v49, v19.GetItemDetailsKey(v50, v51));
        local v57 = true;
        if v56 ~= v17.Fetching then
            v57 = v56 == v17.NotStarted;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 then
            local v58 = v52 and v52.receivedCatalogData;
            v57 = (not (v56 ~= v17.Fetching) or v56 == v17.NotStarted) and not v58;
        end;
        local v59 = l_CollectiblesItemInfo_1 and not v55;
        local l_LocalUserId_1 = v49.LocalUserId;
        local v61 = v49.UserRobux[l_LocalUserId_1];
        l_LocalUserId_1 = if v53 then l_PerformFetch_0.GetStatus(v49, v25.FetchCollectibleResellableInstancesKey .. tostring(v53)) else nil;
        local v62 = if l_LocalUserId_1 then l_LocalUserId_1 == v17.Fetching or l_LocalUserId_1 == v17.NotStarted else nil;
        return v57 or v59 or v62 or v61 == nil;
    end;
end;
local function v76(v64, v65, v66, v67) --[[ Line: 104 ]] --[[ Name: selectBuyActionBarStateWithItemIdAndType ]]
    -- upvalues: v18 (copy), v16 (copy), v63 (copy), v29 (copy)
    local v68 = v18(v64.AvatarExperience.Common, v65, v66);
    local v69 = if v68 then v68.collectibleItemId else nil;
    local l_CollectiblesItemInfo_2 = v64.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    local v71 = if v69 then l_CollectiblesItemInfo_2[v69] else nil;
    l_CollectiblesItemInfo_2 = v64.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v69];
    local v72 = if l_CollectiblesItemInfo_2 then v16.fieldCount(l_CollectiblesItemInfo_2) else 0;
    local v73 = v63(v64, v65, v66);
    local v74 = not (v67 and v69);
    local v75 = v29(v68, v71, v72, v73, v74);
    return {
        itemData = v68, 
        buttonType = v75, 
        collectibleItemInfo = v71, 
        localUserId = v64.LocalUserId
    };
end;
return function(v77, v78, v79, v80, v81, v82) --[[ Line: 145 ]] --[[ Name: useBuyActionBarButtonProps ]]
    -- upvalues: l_useDispatch_0 (copy), v23 (copy), v26 (copy), l_useAppPolicy_0 (copy), v3 (copy), v76 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v28 (copy), v24 (copy), l_NumberLocalization_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v21 (copy), l_useLocalization_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_useTokens_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v22 (copy), v20 (copy), l_AvatarScreen_0 (copy), v19 (copy), v30 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v31 (copy), v35 (copy), v36 (copy), v37 (copy)
    local v83 = l_useDispatch_0();
    local v84 = v23(v26);
    local v86, v87 = l_useAppPolicy_0(function(v85) --[[ Line: 156 ]]
        return v85.getDisableIAPEntryPoint(), v85.getDisableResellingCollectiblesForCompliance();
    end);
    local v89 = v3.useCallback(function(v88) --[[ Line: 160 ]]
        -- upvalues: v76 (ref), v78 (copy), v79 (copy), v87 (copy)
        return (v76(v88, v78, v79, v87));
    end, {
        v78, 
        v79, 
        v87
    });
    local v90 = l_useSelector_0(v89, l_getUseSelectorDeepEquals_0());
    local l_buttonType_0 = v90.buttonType;
    local l_itemData_0 = v90.itemData;
    local v93 = if l_itemData_0 then if l_buttonType_0 == v28.PurchaseFromResale then l_itemData_0.lowestResalePrice else l_itemData_0.priceInRobux else 0;
    local v94 = v93 and string.format("%.0f", v93);
    local v95 = v23(v24);
    local v96 = if v93 then l_NumberLocalization_0.localize(v94, v95:GetLocale()) else nil;
    v94 = l_useAvatarRoute_0();
    v95 = l_useNavigation_0();
    local v97 = v23(v21);
    local v98 = l_useLocalization_0({
        freeText = "Feature.Catalog.LabelFree", 
        soldOut = "Feature.Catalog.Label.SoldOut", 
        fromResale = "Feature.Catalog.Label.PriceFromResale", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSingleExperience = "Feature.Catalog.Label.InSingleExperience", 
        purchaseNotAvailableOnHeadSet = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet", 
        buyButtonTextForRentalItem = l_FFlagAXDurablesSupport_0 and "Feature.Durables.BottomBar.BuyButton" or nil, 
        buyButtonWithTimedOptionDays = {
            "Feature.Durables.ItemDetails.BottomBar.BuyButton.Days"; 
            num = v80
        }, 
        buyButtonWithTimedOptionPermanent = "Feature.Durables.ItemDetails.BottomBar.BuyButton.Permanent"
    });
    local v99 = l_useTokens_0();
    local v100 = nil;
    if l_FFlagAXDurablesSupport_0 and l_FFlagPurchasePromptSubtitleForTimedOptions_0 then
        v100 = {
            componentName = "TIMED_OPTIONS_SUBTITLE", 
            props = {
                timedOptionDays = v80
            }
        };
    end;
    local v102 = v3.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v98 (copy), v22 (ref), v83 (copy), v20 (ref), v84 (copy), v97 (copy), v77 (copy), v95 (copy), v94 (copy), v78 (copy), v79 (copy), v86 (copy), l_FFlagAXDurablesSupport_0 (ref), v80 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v100 (ref)
        local v101 = {
            toastMessage = v98.purchaseNotAvailableOnHeadSet, 
            isLocalized = true, 
            toastType = v22.InformationMessage
        };
        return v83(v20(v84, v97, v77, v95, v94, v78, v79, v86, v101, if l_FFlagAXDurablesSupport_0 then v80 else nil, if l_FFlagAXDurablesSupport_0 and l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v100 else nil));
    end, {
        v98, 
        v84, 
        v97, 
        v77, 
        v95, 
        v94, 
        v78, 
        v79, 
        v86, 
        if l_FFlagAXDurablesSupport_0 then v80 else nil, 
        if l_FFlagAXDurablesSupport_0 and l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v100 else nil
    });
    local l_collectibleItemInfo_0 = v90.collectibleItemInfo;
    local v104 = v3.useCallback(function() --[[ Line: 244 ]]
        -- upvalues: v95 (copy), l_AvatarScreen_0 (ref), l_collectibleItemInfo_0 (copy), v19 (ref), l_itemData_0 (copy)
        v95.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
            collectibleData = l_collectibleItemInfo_0, 
            isLimited = v19.isLimitedCollectible(l_itemData_0)
        });
    end, {
        v95, 
        l_collectibleItemInfo_0
    });
    local v105 = v30(l_collectibleItemInfo_0);
    return v3.useMemo(function() --[[ Line: 253 ]]
        -- upvalues: l_buttonType_0 (copy), v28 (ref), v99 (copy), v105 (copy), v98 (copy), v104 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v31 (ref), v94 (copy), l_AvatarScreen_0 (ref), v35 (ref), v102 (copy), l_FFlagAXDurablesSupport_0 (ref), v82 (copy), v80 (copy), v81 (copy), v96 (copy), v36 (ref), v37 (ref)
        if l_buttonType_0 == v28.Loading then
            return {
                buttonText = "", 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = true, 
                buttonIsLoading = true, 
                buttonColor = v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 264 ]] --[[ Name: onActivated ]]

                end
            };
        elseif l_buttonType_0 == v28.ExperienceLink then
            return {
                buttonText = if v105 > 1 then v98.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", v105) else v98.inSingleExperience, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = false, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionSubEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionSubEmphasis.Foreground.Color3, 
                onActivated = v104
            };
        elseif l_buttonType_0 == v28.SoldOut then
            return {
                buttonText = v98.soldOut, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = true, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 290 ]] --[[ Name: onActivated ]]

                end
            };
        elseif l_buttonType_0 == v28.CustomizeLink then
            return {
                buttonActionType = if l_FFlagAXMISEnableMultiShopping_0 then l_buttonType_0 else nil, 
                buttonIsDisabled = if v31() then v94.opaque.name == l_AvatarScreen_0.AvatarEditor else false, 
                buttonText = "", 
                buttonIcon = v35, 
                buttonIconPadding = v99.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v99.Size.Size_500 else v99.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = if v31() and v94.opaque.name == l_AvatarScreen_0.AvatarEditor then v99.Color.ActionSubEmphasis.Background.Color3 else v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v31() and v94.opaque.name == l_AvatarScreen_0.AvatarEditor and function() --[[ Line: 312 ]]

                end or v102
            };
        elseif l_buttonType_0 == v28.PurchaseFromRoblox then
            local v106 = nil;
            v106 = if l_FFlagAXDurablesSupport_0 then if v82 then if v80 then v98.buyButtonWithTimedOptionDays else v98.buyButtonWithTimedOptionPermanent else if v80 or v81 then v98.buyButtonTextForRentalItem else v96 else v96;
            return {
                buttonIsDisabled = false, 
                buttonText = v106, 
                buttonIcon = if l_FFlagAXDurablesSupport_0 and (v80 or v81) then nil else v36, 
                buttonIconPadding = v99.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v99.Size.Size_500 else v99.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v102
            };
        elseif l_buttonType_0 == v28.Free then
            return {
                buttonText = v98.freeText, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = false, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v102
            };
        elseif l_buttonType_0 == v28.PurchaseFromResale then
            return {
                buttonText = string.gsub(v98.fromResale, "{itemPrice}", v96), 
                buttonIsDisabled = false, 
                buttonIcon = v36, 
                buttonIconPadding = v99.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v99.Size.Size_500 else v99.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v102
            };
        else
            return {
                buttonIsDisabled = true, 
                buttonText = "", 
                buttonIcon = v37, 
                buttonIconPadding = v99.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v99.Size.Size_500 else v99.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v99.Color.ActionSubEmphasis.Background.Color3, 
                buttonTextColor = v99.Color.ActionSubEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 385 ]] --[[ Name: onActivated ]]

                end
            };
        end;
    end, {
        l_buttonType_0, 
        v99, 
        v102, 
        v98, 
        v96, 
        v104, 
        v105
    });
end;