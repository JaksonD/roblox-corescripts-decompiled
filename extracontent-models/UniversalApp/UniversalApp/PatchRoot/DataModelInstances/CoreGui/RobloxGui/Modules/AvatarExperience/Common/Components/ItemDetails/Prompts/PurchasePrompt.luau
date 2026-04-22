local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).withTriggerFeedback;
local l_withNavigation_0 = v11.withNavigation;
local l_RoactFitComponents_0 = v6.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v31 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v31.Style.withStyle;
local l_Checkbox_0 = v31.App.InputButton.Checkbox;
local v34 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v35 = require(l_Modules_0.AvatarExperience.Flags.FFlagDisableWearAfterPurchaseForCollectibles);
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v37 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_EconomicRestrictionsCounter_0 = v37.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local v42 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_parseEconomicRestrictionsFailureReason_0 = v37.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v37.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local v45 = v2.PureComponent:extend("PurchasePrompt");
v45.defaultProps = {
    sellerName = ""
};
v45.getPolicySpecifiedSellerName = function(v46, v47) --[[ Line: 87 ]] --[[ Name: getPolicySpecifiedSellerName ]]
    if v46.props.robloxSellerNameShouldBeLuobu then
        local v48 = utf8.nfdnormalize(v47);
        if string.lower(v48) == "roblox" then
            return "\231\189\151\229\184\131\228\185\144\230\128\157";
        end;
    end;
    return v47;
end;
v45.init = function(v49) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v10 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy)
    v49.checkboxRef = v2.createRef();
    v49.state = {
        isWearAfterPurchaseChecked = true
    };
    v49.onCancel = function() --[[ Line: 105 ]]
        -- upvalues: v49 (copy)
        v49.closePrompt();
    end;
    v49.onConfirm = function() --[[ Line: 109 ]]
        -- upvalues: v49 (copy)
        v49.props.triggerFeedback("MakePurchase", "Press");
        local l_analytics_0 = v49.props.analytics;
        local l_itemId_0 = v49.props.itemId;
        local l_itemType_0 = v49.props.itemType;
        local l_priceInRobux_0 = v49.props.priceInRobux;
        local l_sellerId_0 = v49.props.sellerId;
        local l_networking_0 = v49.props.networking;
        local l_itemData_0 = v49.props.itemData;
        local l_userAssetId_0 = v49.props.userAssetId;
        local l_itemSubType_0 = v49.props.itemSubType;
        local l_navigation_0 = v49.props.navigation;
        local l_fromProfile_0 = v49.props.fromProfile;
        local l_fromAvatarRoute_0 = v49.props.fromAvatarRoute;
        local l_widgetInfo_0 = v49.props.widgetInfo;
        local l_fromContentFeed_0 = v49.props.fromContentFeed;
        local v64 = l_itemData_0 and l_itemData_0.product and l_itemData_0.product.id;
        local v65 = l_itemData_0 and l_itemData_0.collectibleItemId;
        local v66 = l_itemData_0 and l_itemData_0.creator and l_itemData_0.creator.type;
        local l_isWearAfterPurchaseChecked_0 = v49.state.isWearAfterPurchaseChecked;
        local v68 = if l_fromAvatarRoute_0 then l_fromAvatarRoute_0.current.name else nil;
        local l_collectibleInstanceId_0 = v49.props.collectibleInstanceId;
        local l_avatarSaveContext_0 = v49.props.avatarSaveContext;
        if l_avatarSaveContext_0 and l_avatarSaveContext_0.autoSaveNextNewSaveData and l_isWearAfterPurchaseChecked_0 then
            l_avatarSaveContext_0.autoSaveNextNewSaveData();
        end;
        v49.props.purchaseProduct(l_networking_0, v64, l_priceInRobux_0 or 0, l_sellerId_0, l_itemId_0, l_itemType_0, l_itemSubType_0, l_isWearAfterPurchaseChecked_0, l_userAssetId_0, l_analytics_0, l_navigation_0, l_fromProfile_0, false, v68, v65, l_collectibleInstanceId_0, v66, l_widgetInfo_0, l_fromContentFeed_0, v49.economicRestrictionErrorHandler, v49.props.timedOptionDays);
    end;
    v49.toggleWearAfterPurchase = function() --[[ Line: 167 ]]
        -- upvalues: v49 (copy)
        local v71 = not v49.state.isWearAfterPurchaseChecked;
        v49:setState({
            isWearAfterPurchaseChecked = v71
        });
    end;
    v49.closePrompt = function() --[[ Line: 175 ]]
        -- upvalues: v10 (ref), v49 (copy)
        v10.closeOverlay(v49.props.navigation);
    end;
    v49.economicRestrictionErrorHandler = function(v72) --[[ Line: 179 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v49 (copy)
        local v73 = l_parseEconomicRestrictionsFailureReason_0(v72);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperience, 
            failureReason = if v72 then tostring(v73) else "null"
        });
        v49.closePrompt();
        v49.props.openEconomicRestrictionPrompt(v72);
    end;
end;
v45.showWearAfterPurchase = function(v74) --[[ Line: 190 ]] --[[ Name: showWearAfterPurchase ]]
    -- upvalues: v26 (copy), v35 (copy)
    local l_itemType_1 = v74.props.itemType;
    local l_itemSubType_1 = v74.props.itemSubType;
    local v77 = false;
    if l_itemType_1 == v26.ItemType.Asset then
        v77 = l_itemSubType_1 ~= v26.AssetTypeIdStrings.EmoteAnimation;
    end;
    if v35 then
        local l_itemData_1 = v74.props.itemData;
        if l_itemData_1 and l_itemData_1.collectibleItemId then
            v77 = false;
        end;
    end;
    return v77;
end;
v45.willUpdate = function(v79, v80, _) --[[ Line: 209 ]] --[[ Name: willUpdate ]]
    -- upvalues: v34 (copy)
    if v34.isFetchingDoneOrFailed(v79.props.fetchingState, v80.fetchingState) then
        v79.closePrompt();
    end;
end;
v45.renderMiddle = function(v82, v83) --[[ Line: 215 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v29 (copy), l_Checkbox_0 (copy)
    local v84 = v82.props.priceInRobux or "";
    local v85 = v84 == 0;
    local v86 = not v85;
    return l_withStyle_0(function(v87) --[[ Line: 221 ]]
        -- upvalues: v86 (copy), v2 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), v82 (copy), v85 (copy), l_RoactFitComponents_0 (ref), l_FitTextLabel_0 (ref), v83 (copy), v29 (ref), v84 (copy), l_Checkbox_0 (ref)
        local l_Font_0 = v87.Font;
        local l_Theme_0 = v87.Theme;
        local v90 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local v91 = v86 and v90 or 0;
        return v2.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            defaultChild = v82.checkboxRef
        }, {
            PriceContainer = not v85 and v2.createElement(l_FitFrameVertical_0, {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                contentPadding = UDim.new(0, 6), 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                width = UDim.new(1, 0)
            }, {
                PriceLabel = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.Body.Font, 
                    Text = v83.priceLabel, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v90, 
                    LayoutOrder = 0
                }), 
                RobuxContainer = v2.createElement(v29, {
                    robuxAmountText = tostring(v84), 
                    iconSize = v91, 
                    textSize = v90, 
                    padding = 4, 
                    showRobuxIcon = v86
                })
            }), 
            CheckboxContainer = v82:showWearAfterPurchase() and v2.createElement(l_Checkbox_0, {
                text = v83.wearItemLabel, 
                isSelected = v82.state.isWearAfterPurchaseChecked, 
                onActivated = v82.toggleWearAfterPurchase, 
                layoutOrder = 2, 
                [v2.Ref] = v82.checkboxRef
            })
        });
    end);
end;
v45.renderAlertLocalized = function(v92, v93) --[[ Line: 274 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v5 (copy), v2 (copy), v30 (copy), l_RetrievalStatus_0 (copy)
    local l_itemData_2 = v92.props.itemData;
    local l_priceInRobux_1 = v92.props.priceInRobux;
    local v96 = v92:getPolicySpecifiedSellerName(v92.props.sellerName);
    local v97 = l_itemData_2 and l_itemData_2.name or "";
    local v98 = (l_priceInRobux_1 or "") == 0;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    if v98 then
        v99 = v93.freeTitleText;
        v100 = v93.freeDescriptionText;
        v101 = v93.freeConfirmButtonText;
    else
        v99 = v93.titleText;
        v100 = v93.descriptionText;
        v101 = v93.confirmButtonText;
    end;
    local v102 = v100:gsub("({itemName})", function() --[[ Line: 299 ]]
        -- upvalues: v97 (copy)
        return v97;
    end):gsub("({creatorName})", function() --[[ Line: 302 ]]
        -- upvalues: v96 (copy)
        return v96;
    end);
    local v103 = v5.Dictionary.join(v92.props.widgetInfo or {}, {
        itemId = v92.props.itemId, 
        itemType = v92.props.itemType, 
        assetType = if v92.props.itemData then v92.props.itemData.assetType else nil, 
        bundleType = if v92.props.itemData then v92.props.itemData.bundleType else nil
    });
    return v2.createElement(v30, {
        priceInRobux = l_priceInRobux_1, 
        showWearAfterPurchase = v92:showWearAfterPurchase(), 
        isWearAfterPurchaseChecked = v92.state.isWearAfterPurchaseChecked, 
        toggleWearAfterPurchase = v92.toggleWearAfterPurchase, 
        titleText = v99, 
        bodyText = v102, 
        confirmButtonText = v101, 
        onConfirm = v92.onConfirm, 
        onCancel = v92.onCancel, 
        isLoading = v92.props.fetchingState == l_RetrievalStatus_0.Fetching, 
        defaultChildRef = v92.props.defaultChildRef, 
        analyticsInfo = v103
    });
end;
v45.render = function(v104) --[[ Line: 329 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    local v105 = "Feature.Catalog.Label.BuyConfirmation";
    if v104.props.enablePurchasePromptIncludingWarning then
        v105 = "Feature.Catalog.Label.BuyConfirmationIncludingWarning";
    end;
    return l_withLocalization_0({
        freeConfirmButtonText = "Feature.Catalog.Label.Get", 
        freeDescriptionText = "Feature.Catalog.Label.FreeItemConfirmation", 
        freeTitleText = "Feature.Catalog.Heading.FreeItemConfirmation", 
        titleText = "Feature.Catalog.Heading.BuyItem", 
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        confirmButtonText = "Feature.Catalog.Heading.BuyItem", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        descriptionText = v105, 
        wearItemLabel = "Feature.Catalog.Label.WearAfterPurchase"
    })(function(v106) --[[ Line: 345 ]]
        -- upvalues: v104 (copy)
        return v104:renderAlertLocalized(v106);
    end);
end;
v45 = l_RoactAppPolicy_0.connect(function(v107, _) --[[ Line: 349 ]]
    return {
        robloxSellerNameShouldBeLuobu = v107.getRobloxCreatedItemsCreatedByLuobu(), 
        enablePurchasePromptIncludingWarning = v107.getPurchasePromptIncludingWarning()
    };
end)(v45);
v45 = v4.connect(function(v109, v110) --[[ Line: 356 ]]
    -- upvalues: v28 (copy), v27 (copy), l_PerformFetch_0 (copy), v25 (copy)
    local l_itemId_1 = v110.itemId;
    local l_itemType_2 = v110.itemType;
    local v113 = v28(v109.AvatarExperience.Common, l_itemId_1, l_itemType_2);
    local v114 = v113 and v113.product and v113.product.id;
    local v115 = v27.GetItemSubType(l_itemType_2, v113);
    return {
        itemData = v113, 
        itemSubType = v115, 
        fetchingState = l_PerformFetch_0.GetStatus(v109, v25.PurchaseProductKey .. tostring(v114)), 
        screenSize = v109.ScreenSize
    };
end, function(v116) --[[ Line: 370 ]]
    -- upvalues: v24 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), v42 (copy)
    return {
        purchaseProduct = function(v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137) --[[ Line: 372 ]] --[[ Name: purchaseProduct ]]
            -- upvalues: v116 (copy), v24 (ref)
            return v116(v24(v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137));
        end, 
        openEconomicRestrictionPrompt = function(v138) --[[ Line: 422 ]] --[[ Name: openEconomicRestrictionPrompt ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), v116 (copy), v42 (ref)
            local v139 = l_parseEconomicRestrictionsFailureReason_0(v138);
            local v140 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v138);
            return v116(v42(v139, v140));
        end
    };
end)(v45);
v45 = l_withTriggerFeedback_0((l_withNavigation_0((v9((v8((l_RoactServices_0.connect({
    networking = v19, 
    analytics = v23
})(v45)))))))));
return function(v141) --[[ Line: 441 ]] --[[ Name: PurchasePromptContainer ]]
    -- upvalues: l_useAvatarSaveContext_0 (copy), v3 (copy), v45 (ref), v5 (copy)
    local v142 = l_useAvatarSaveContext_0();
    return v3.createElement(v45, v5.Dictionary.join(v141, {
        avatarSaveContext = v142
    }));
end;