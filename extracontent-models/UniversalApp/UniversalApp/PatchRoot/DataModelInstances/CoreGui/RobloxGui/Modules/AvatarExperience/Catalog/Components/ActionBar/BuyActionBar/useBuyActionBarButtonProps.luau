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
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local v34 = l_Images_0["icons/menu/avatar_on"];
local v35 = l_Images_0["icons/common/robux"];
local v36 = l_Images_0["icons/actions/block"];
local function _(v37) --[[ Line: 49 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v37.LocalUserId;
    return v37.UserRobux[l_LocalUserId_0];
end;
local function _(v40) --[[ Line: 54 ]] --[[ Name: useLocalizedPrice ]]
    -- upvalues: v23 (copy), v24 (copy), l_NumberLocalization_0 (copy)
    local v41 = v40 and string.format("%.0f", v40);
    local v42 = v23(v24);
    if v40 then
        return (l_NumberLocalization_0.localize(v41, v42:GetLocale()));
    else
        return nil;
    end;
end;
local function _(v44, v45) --[[ Line: 60 ]] --[[ Name: selectCollectibleItemInfo ]]
    local l_CollectiblesItemInfo_0 = v44.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    if v45 then
        return l_CollectiblesItemInfo_0[v45];
    else
        return nil;
    end;
end;
local function v62(v48, v49, v50) --[[ Line: 66 ]] --[[ Name: selectIsLoadingState ]]
    -- upvalues: v18 (copy), l_PerformFetch_0 (copy), v19 (copy), v17 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v25 (copy)
    if not v49 then
        return true;
    else
        local v51 = v18(v48.AvatarExperience.Common, v49, v50);
        local v52 = if v51 then v51.collectibleItemId else nil;
        local l_CollectiblesItemInfo_1 = v48.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
        local v54 = if v52 then l_CollectiblesItemInfo_1[v52] else nil;
        l_CollectiblesItemInfo_1 = false;
        if v52 ~= nil then
            l_CollectiblesItemInfo_1 = v52 ~= "";
        end;
        local v55 = l_PerformFetch_0.GetStatus(v48, v19.GetItemDetailsKey(v49, v50));
        local v56 = true;
        if v55 ~= v17.Fetching then
            v56 = v55 == v17.NotStarted;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 then
            local v57 = v51 and v51.receivedCatalogData;
            v56 = (not (v55 ~= v17.Fetching) or v55 == v17.NotStarted) and not v57;
        end;
        local v58 = l_CollectiblesItemInfo_1 and not v54;
        local l_LocalUserId_1 = v48.LocalUserId;
        local v60 = v48.UserRobux[l_LocalUserId_1];
        l_LocalUserId_1 = if v52 then l_PerformFetch_0.GetStatus(v48, v25.FetchCollectibleResellableInstancesKey .. tostring(v52)) else nil;
        local v61 = if l_LocalUserId_1 then l_LocalUserId_1 == v17.Fetching or l_LocalUserId_1 == v17.NotStarted else nil;
        return v56 or v58 or v61 or v60 == nil;
    end;
end;
local function v75(v63, v64, v65, v66) --[[ Line: 103 ]] --[[ Name: selectBuyActionBarStateWithItemIdAndType ]]
    -- upvalues: v18 (copy), v16 (copy), v62 (copy), v29 (copy)
    local v67 = v18(v63.AvatarExperience.Common, v64, v65);
    local v68 = if v67 then v67.collectibleItemId else nil;
    local l_CollectiblesItemInfo_2 = v63.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    local v70 = if v68 then l_CollectiblesItemInfo_2[v68] else nil;
    l_CollectiblesItemInfo_2 = v63.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v68];
    local v71 = if l_CollectiblesItemInfo_2 then v16.fieldCount(l_CollectiblesItemInfo_2) else 0;
    local v72 = v62(v63, v64, v65);
    local v73 = not (v66 and v68);
    local v74 = v29(v67, v70, v71, v72, v73);
    return {
        itemData = v67, 
        buttonType = v74, 
        collectibleItemInfo = v70, 
        localUserId = v63.LocalUserId
    };
end;
return function(v76, v77, v78, v79, v80, v81) --[[ Line: 144 ]] --[[ Name: useBuyActionBarButtonProps ]]
    -- upvalues: l_useDispatch_0 (copy), v23 (copy), v26 (copy), l_useAppPolicy_0 (copy), v3 (copy), v75 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v28 (copy), v24 (copy), l_NumberLocalization_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v21 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v22 (copy), v20 (copy), l_AvatarScreen_0 (copy), v19 (copy), v30 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v31 (copy), v34 (copy), v35 (copy), v36 (copy)
    local v82 = l_useDispatch_0();
    local v83 = v23(v26);
    local v85, v86 = l_useAppPolicy_0(function(v84) --[[ Line: 155 ]]
        return v84.getDisableIAPEntryPoint(), v84.getDisableResellingCollectiblesForCompliance();
    end);
    local v88 = v3.useCallback(function(v87) --[[ Line: 159 ]]
        -- upvalues: v75 (ref), v77 (copy), v78 (copy), v86 (copy)
        return (v75(v87, v77, v78, v86));
    end, {
        v77, 
        v78, 
        v86
    });
    local v89 = l_useSelector_0(v88, l_getUseSelectorDeepEquals_0());
    local l_buttonType_0 = v89.buttonType;
    local l_itemData_0 = v89.itemData;
    local v92 = if l_itemData_0 then if l_buttonType_0 == v28.PurchaseFromResale then l_itemData_0.lowestResalePrice else l_itemData_0.priceInRobux else 0;
    local v93 = v92 and string.format("%.0f", v92);
    local v94 = v23(v24);
    local v95 = if v92 then l_NumberLocalization_0.localize(v93, v94:GetLocale()) else nil;
    v93 = l_useAvatarRoute_0();
    v94 = l_useNavigation_0();
    local v96 = v23(v21);
    local v97 = l_useLocalization_0({
        freeText = "Feature.Catalog.LabelFree", 
        soldOut = "Feature.Catalog.Label.SoldOut", 
        fromResale = "Feature.Catalog.Label.PriceFromResale", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSingleExperience = "Feature.Catalog.Label.InSingleExperience", 
        purchaseNotAvailableOnHeadSet = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet", 
        buyButtonTextForRentalItem = "Feature.Durables.BottomBar.BuyButton", 
        buyButtonWithTimedOptionDays = {
            "Feature.Durables.ItemDetails.BottomBar.BuyButton.Days"; 
            num = v79
        }, 
        buyButtonWithTimedOptionPermanent = "Feature.Durables.ItemDetails.BottomBar.BuyButton.Permanent"
    });
    local v98 = l_useTokens_0();
    local v99 = nil;
    if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then
        v99 = {
            componentName = "TIMED_OPTIONS_SUBTITLE", 
            props = {
                timedOptionDays = v79
            }
        };
    end;
    local v101 = v3.useCallback(function() --[[ Line: 206 ]]
        -- upvalues: v97 (copy), v22 (ref), v82 (copy), v20 (ref), v83 (copy), v96 (copy), v76 (copy), v94 (copy), v93 (copy), v77 (copy), v78 (copy), v85 (copy), v79 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v99 (ref)
        local v100 = {
            toastMessage = v97.purchaseNotAvailableOnHeadSet, 
            isLocalized = true, 
            toastType = v22.InformationMessage
        };
        return v82(v20(v83, v96, v76, v94, v93, v77, v78, v85, v100, v79, if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v99 else nil));
    end, {
        v97, 
        v83, 
        v96, 
        v76, 
        v94, 
        v93, 
        v77, 
        v78, 
        v85, 
        v79, 
        if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v99 else nil
    });
    local l_collectibleItemInfo_0 = v89.collectibleItemInfo;
    local v103 = v3.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v94 (copy), l_AvatarScreen_0 (ref), l_collectibleItemInfo_0 (copy), v19 (ref), l_itemData_0 (copy)
        v94.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
            collectibleData = l_collectibleItemInfo_0, 
            isLimited = v19.isLimitedCollectible(l_itemData_0)
        });
    end, {
        v94, 
        l_collectibleItemInfo_0
    });
    local v104 = v30(l_collectibleItemInfo_0);
    return v3.useMemo(function() --[[ Line: 252 ]]
        -- upvalues: l_buttonType_0 (copy), v28 (ref), v98 (copy), v104 (copy), v97 (copy), v103 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v31 (ref), v93 (copy), l_AvatarScreen_0 (ref), v34 (ref), v101 (copy), v81 (copy), v79 (copy), v80 (copy), v95 (copy), v35 (ref), v36 (ref)
        if l_buttonType_0 == v28.Loading then
            return {
                buttonText = "", 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = true, 
                buttonIsLoading = true, 
                buttonColor = v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 263 ]] --[[ Name: onActivated ]]

                end
            };
        elseif l_buttonType_0 == v28.ExperienceLink then
            return {
                buttonText = if v104 > 1 then v97.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", v104) else v97.inSingleExperience, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = false, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionSubEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionSubEmphasis.Foreground.Color3, 
                onActivated = v103
            };
        elseif l_buttonType_0 == v28.SoldOut then
            return {
                buttonText = v97.soldOut, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = true, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 289 ]] --[[ Name: onActivated ]]

                end
            };
        elseif l_buttonType_0 == v28.CustomizeLink then
            return {
                buttonActionType = if l_FFlagAXMISEnableMultiShopping_0 then l_buttonType_0 else nil, 
                buttonIsDisabled = if v31() then v93.opaque.name == l_AvatarScreen_0.AvatarEditor else false, 
                buttonText = "", 
                buttonIcon = v34, 
                buttonIconPadding = v98.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v98.Size.Size_500 else v98.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = if v31() and v93.opaque.name == l_AvatarScreen_0.AvatarEditor then v98.Color.ActionSubEmphasis.Background.Color3 else v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v31() and v93.opaque.name == l_AvatarScreen_0.AvatarEditor and function() --[[ Line: 311 ]]

                end or v101
            };
        elseif l_buttonType_0 == v28.PurchaseFromRoblox then
            local v105 = nil;
            v105 = if v81 then if v79 then v97.buyButtonWithTimedOptionDays else v97.buyButtonWithTimedOptionPermanent else if v79 or v80 then v97.buyButtonTextForRentalItem else v95;
            return {
                buttonIsDisabled = false, 
                buttonText = v105, 
                buttonIcon = if not not v79 or v80 then nil else v35, 
                buttonIconPadding = v98.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v98.Size.Size_500 else v98.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v101
            };
        elseif l_buttonType_0 == v28.Free then
            return {
                buttonText = v97.freeText, 
                buttonIcon = nil, 
                buttonIconPadding = 0, 
                buttonIconSize = 0, 
                buttonIsDisabled = false, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v101
            };
        elseif l_buttonType_0 == v28.PurchaseFromResale then
            return {
                buttonText = string.gsub(v97.fromResale, "{itemPrice}", v95), 
                buttonIsDisabled = false, 
                buttonIcon = v35, 
                buttonIconPadding = v98.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v98.Size.Size_500 else v98.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionEmphasis.Foreground.Color3, 
                onActivated = v101
            };
        else
            return {
                buttonIsDisabled = true, 
                buttonText = "", 
                buttonIcon = v36, 
                buttonIconPadding = v98.Gap.XSmall, 
                buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v98.Size.Size_500 else v98.Size.Size_800, 
                buttonIsLoading = false, 
                buttonColor = v98.Color.ActionSubEmphasis.Background.Color3, 
                buttonTextColor = v98.Color.ActionSubEmphasis.Foreground.Color3, 
                onActivated = function() --[[ Line: 380 ]] --[[ Name: onActivated ]]

                end
            };
        end;
    end, {
        l_buttonType_0, 
        v98, 
        v101, 
        v97, 
        v95, 
        v103, 
        v104
    });
end;