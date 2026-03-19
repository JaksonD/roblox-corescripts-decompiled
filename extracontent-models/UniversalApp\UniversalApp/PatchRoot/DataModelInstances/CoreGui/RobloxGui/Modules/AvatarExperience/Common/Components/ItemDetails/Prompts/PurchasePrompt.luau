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
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v46 = v2.PureComponent:extend("PurchasePrompt");
v46.defaultProps = {
    sellerName = ""
};
v46.getPolicySpecifiedSellerName = function(v47, v48) --[[ Line: 88 ]] --[[ Name: getPolicySpecifiedSellerName ]]
    if v47.props.robloxSellerNameShouldBeLuobu then
        local v49 = utf8.nfdnormalize(v48);
        if string.lower(v49) == "roblox" then
            return "\231\189\151\229\184\131\228\185\144\230\128\157";
        end;
    end;
    return v48;
end;
v46.init = function(v50) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_FFlagAXDurablesSupport_0 (copy), v10 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy)
    v50.checkboxRef = v2.createRef();
    v50.state = {
        isWearAfterPurchaseChecked = true
    };
    v50.onCancel = function() --[[ Line: 106 ]]
        -- upvalues: v50 (copy)
        v50.closePrompt();
    end;
    v50.onConfirm = function() --[[ Line: 110 ]]
        -- upvalues: v50 (copy), l_FFlagAXDurablesSupport_0 (ref)
        v50.props.triggerFeedback("MakePurchase", "Press");
        local l_analytics_0 = v50.props.analytics;
        local l_itemId_0 = v50.props.itemId;
        local l_itemType_0 = v50.props.itemType;
        local l_priceInRobux_0 = v50.props.priceInRobux;
        local l_sellerId_0 = v50.props.sellerId;
        local l_networking_0 = v50.props.networking;
        local l_itemData_0 = v50.props.itemData;
        local l_userAssetId_0 = v50.props.userAssetId;
        local l_itemSubType_0 = v50.props.itemSubType;
        local l_navigation_0 = v50.props.navigation;
        local l_fromProfile_0 = v50.props.fromProfile;
        local l_fromAvatarRoute_0 = v50.props.fromAvatarRoute;
        local l_widgetInfo_0 = v50.props.widgetInfo;
        local l_fromContentFeed_0 = v50.props.fromContentFeed;
        local v65 = l_itemData_0 and l_itemData_0.product and l_itemData_0.product.id;
        local v66 = l_itemData_0 and l_itemData_0.collectibleItemId;
        local v67 = l_itemData_0 and l_itemData_0.creator and l_itemData_0.creator.type;
        local l_isWearAfterPurchaseChecked_0 = v50.state.isWearAfterPurchaseChecked;
        local v69 = if l_fromAvatarRoute_0 then l_fromAvatarRoute_0.current.name else nil;
        local l_collectibleInstanceId_0 = v50.props.collectibleInstanceId;
        local l_avatarSaveContext_0 = v50.props.avatarSaveContext;
        if l_avatarSaveContext_0 and l_avatarSaveContext_0.autoSaveNextNewSaveData and l_isWearAfterPurchaseChecked_0 then
            l_avatarSaveContext_0.autoSaveNextNewSaveData();
        end;
        v50.props.purchaseProduct(l_networking_0, v65, l_priceInRobux_0 or 0, l_sellerId_0, l_itemId_0, l_itemType_0, l_itemSubType_0, l_isWearAfterPurchaseChecked_0, l_userAssetId_0, l_analytics_0, l_navigation_0, l_fromProfile_0, false, v69, v66, l_collectibleInstanceId_0, v67, l_widgetInfo_0, l_fromContentFeed_0, v50.economicRestrictionErrorHandler, if l_FFlagAXDurablesSupport_0 then v50.props.timedOptionDays else nil);
    end;
    v50.toggleWearAfterPurchase = function() --[[ Line: 168 ]]
        -- upvalues: v50 (copy)
        local v72 = not v50.state.isWearAfterPurchaseChecked;
        v50:setState({
            isWearAfterPurchaseChecked = v72
        });
    end;
    v50.closePrompt = function() --[[ Line: 176 ]]
        -- upvalues: v10 (ref), v50 (copy)
        v10.closeOverlay(v50.props.navigation);
    end;
    v50.economicRestrictionErrorHandler = function(v73) --[[ Line: 180 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v50 (copy)
        local v74 = l_parseEconomicRestrictionsFailureReason_0(v73);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperience, 
            failureReason = if v73 then tostring(v74) else "null"
        });
        v50.closePrompt();
        v50.props.openEconomicRestrictionPrompt(v73);
    end;
end;
v46.showWearAfterPurchase = function(v75) --[[ Line: 191 ]] --[[ Name: showWearAfterPurchase ]]
    -- upvalues: v26 (copy), v35 (copy)
    local l_itemType_1 = v75.props.itemType;
    local l_itemSubType_1 = v75.props.itemSubType;
    local v78 = false;
    if l_itemType_1 == v26.ItemType.Asset then
        v78 = l_itemSubType_1 ~= v26.AssetTypeIdStrings.EmoteAnimation;
    end;
    if v35 then
        local l_itemData_1 = v75.props.itemData;
        if l_itemData_1 and l_itemData_1.collectibleItemId then
            v78 = false;
        end;
    end;
    return v78;
end;
v46.willUpdate = function(v80, v81, _) --[[ Line: 210 ]] --[[ Name: willUpdate ]]
    -- upvalues: v34 (copy)
    if v34.isFetchingDoneOrFailed(v80.props.fetchingState, v81.fetchingState) then
        v80.closePrompt();
    end;
end;
v46.renderMiddle = function(v83, v84) --[[ Line: 216 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v29 (copy), l_Checkbox_0 (copy)
    local v85 = v83.props.priceInRobux or "";
    local v86 = v85 == 0;
    local v87 = not v86;
    return l_withStyle_0(function(v88) --[[ Line: 222 ]]
        -- upvalues: v87 (copy), v2 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), v83 (copy), v86 (copy), l_RoactFitComponents_0 (ref), l_FitTextLabel_0 (ref), v84 (copy), v29 (ref), v85 (copy), l_Checkbox_0 (ref)
        local l_Font_0 = v88.Font;
        local l_Theme_0 = v88.Theme;
        local v91 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local v92 = v87 and v91 or 0;
        return v2.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            defaultChild = v83.checkboxRef
        }, {
            PriceContainer = not v86 and v2.createElement(l_FitFrameVertical_0, {
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
                    Text = v84.priceLabel, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v91, 
                    LayoutOrder = 0
                }), 
                RobuxContainer = v2.createElement(v29, {
                    robuxAmountText = tostring(v85), 
                    iconSize = v92, 
                    textSize = v91, 
                    padding = 4, 
                    showRobuxIcon = v87
                })
            }), 
            CheckboxContainer = v83:showWearAfterPurchase() and v2.createElement(l_Checkbox_0, {
                text = v84.wearItemLabel, 
                isSelected = v83.state.isWearAfterPurchaseChecked, 
                onActivated = v83.toggleWearAfterPurchase, 
                layoutOrder = 2, 
                [v2.Ref] = v83.checkboxRef
            })
        });
    end);
end;
v46.renderAlertLocalized = function(v93, v94) --[[ Line: 275 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v5 (copy), v2 (copy), v30 (copy), l_RetrievalStatus_0 (copy)
    local l_itemData_2 = v93.props.itemData;
    local l_priceInRobux_1 = v93.props.priceInRobux;
    local v97 = v93:getPolicySpecifiedSellerName(v93.props.sellerName);
    local v98 = l_itemData_2 and l_itemData_2.name or "";
    local v99 = (l_priceInRobux_1 or "") == 0;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    if v99 then
        v100 = v94.freeTitleText;
        v101 = v94.freeDescriptionText;
        v102 = v94.freeConfirmButtonText;
    else
        v100 = v94.titleText;
        v101 = v94.descriptionText;
        v102 = v94.confirmButtonText;
    end;
    local v103 = v101:gsub("({itemName})", function() --[[ Line: 300 ]]
        -- upvalues: v98 (copy)
        return v98;
    end):gsub("({creatorName})", function() --[[ Line: 303 ]]
        -- upvalues: v97 (copy)
        return v97;
    end);
    local v104 = v5.Dictionary.join(v93.props.widgetInfo or {}, {
        itemId = v93.props.itemId, 
        itemType = v93.props.itemType, 
        assetType = if v93.props.itemData then v93.props.itemData.assetType else nil, 
        bundleType = if v93.props.itemData then v93.props.itemData.bundleType else nil
    });
    return v2.createElement(v30, {
        priceInRobux = l_priceInRobux_1, 
        showWearAfterPurchase = v93:showWearAfterPurchase(), 
        isWearAfterPurchaseChecked = v93.state.isWearAfterPurchaseChecked, 
        toggleWearAfterPurchase = v93.toggleWearAfterPurchase, 
        titleText = v100, 
        bodyText = v103, 
        confirmButtonText = v102, 
        onConfirm = v93.onConfirm, 
        onCancel = v93.onCancel, 
        isLoading = v93.props.fetchingState == l_RetrievalStatus_0.Fetching, 
        defaultChildRef = v93.props.defaultChildRef, 
        analyticsInfo = v104
    });
end;
v46.render = function(v105) --[[ Line: 330 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    local v106 = "Feature.Catalog.Label.BuyConfirmation";
    if v105.props.enablePurchasePromptIncludingWarning then
        v106 = "Feature.Catalog.Label.BuyConfirmationIncludingWarning";
    end;
    return l_withLocalization_0({
        freeConfirmButtonText = "Feature.Catalog.Label.Get", 
        freeDescriptionText = "Feature.Catalog.Label.FreeItemConfirmation", 
        freeTitleText = "Feature.Catalog.Heading.FreeItemConfirmation", 
        titleText = "Feature.Catalog.Heading.BuyItem", 
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        confirmButtonText = "Feature.Catalog.Heading.BuyItem", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        descriptionText = v106, 
        wearItemLabel = "Feature.Catalog.Label.WearAfterPurchase"
    })(function(v107) --[[ Line: 346 ]]
        -- upvalues: v105 (copy)
        return v105:renderAlertLocalized(v107);
    end);
end;
v46 = l_RoactAppPolicy_0.connect(function(v108, _) --[[ Line: 350 ]]
    return {
        robloxSellerNameShouldBeLuobu = v108.getRobloxCreatedItemsCreatedByLuobu(), 
        enablePurchasePromptIncludingWarning = v108.getPurchasePromptIncludingWarning()
    };
end)(v46);
v46 = v4.connect(function(v110, v111) --[[ Line: 357 ]]
    -- upvalues: v28 (copy), v27 (copy), l_PerformFetch_0 (copy), v25 (copy)
    local l_itemId_1 = v111.itemId;
    local l_itemType_2 = v111.itemType;
    local v114 = v28(v110.AvatarExperience.Common, l_itemId_1, l_itemType_2);
    local v115 = v114 and v114.product and v114.product.id;
    local v116 = v27.GetItemSubType(l_itemType_2, v114);
    return {
        itemData = v114, 
        itemSubType = v116, 
        fetchingState = l_PerformFetch_0.GetStatus(v110, v25.PurchaseProductKey .. tostring(v115)), 
        screenSize = v110.ScreenSize
    };
end, function(v117) --[[ Line: 371 ]]
    -- upvalues: v24 (copy), l_FFlagAXDurablesSupport_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), v42 (copy)
    return {
        purchaseProduct = function(v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138) --[[ Line: 373 ]] --[[ Name: purchaseProduct ]]
            -- upvalues: v117 (copy), v24 (ref), l_FFlagAXDurablesSupport_0 (ref)
            return v117(v24(v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, if l_FFlagAXDurablesSupport_0 then v138 else nil));
        end, 
        openEconomicRestrictionPrompt = function(v139) --[[ Line: 423 ]] --[[ Name: openEconomicRestrictionPrompt ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), v117 (copy), v42 (ref)
            local v140 = l_parseEconomicRestrictionsFailureReason_0(v139);
            local v141 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v139);
            return v117(v42(v140, v141));
        end
    };
end)(v46);
v46 = l_withTriggerFeedback_0((l_withNavigation_0((v9((v8((l_RoactServices_0.connect({
    networking = v19, 
    analytics = v23
})(v46)))))))));
return function(v142) --[[ Line: 442 ]] --[[ Name: PurchasePromptContainer ]]
    -- upvalues: l_useAvatarSaveContext_0 (copy), v3 (copy), v46 (ref), v5 (copy)
    local v143 = l_useAvatarSaveContext_0();
    return v3.createElement(v46, v5.Dictionary.join(v142, {
        avatarSaveContext = v143
    }));
end;