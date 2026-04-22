local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v13 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v11.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_CartIdService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService;
local l_RoactFitComponents_0 = v7.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v23 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLoggingUtils_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v28 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v28.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v28.Enums.ProductPurchaseSurface;
local v32 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v32.Style.withStyle;
local l_InteractiveAlert_0 = v32.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v32.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v32.App.InputButton.Checkbox;
local v37 = game:DefineFastFlag("AXFixPurchasePromptScrimClickThrough", false);
local l_FFlagAXUpdateSaveStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSaveStrings;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXAddLookTypeEnumForLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAddTypesToWidgetItems_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems;
local v43 = game:DefineFastFlag("AXAddWearAndSaveToPurchaseLogging", false);
local l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigratePurchasePromptInteractiveToFocusNavigation;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FIntLegacyPurchaseFPSTrackingTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout;
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local v48 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SaveAsCharacter, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.WearAfterPurchase
};
local function v54(v49, v50, v51) --[[ Line: 112 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v12 (copy), v48 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v13 (copy)
    local v52 = v12.useEventMap(v48, v49);
    local v53 = v2.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v50 (copy), v13 (ref), v51 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = if v50 then {
                handler = v13.onRelease(v50)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = if v51 then {
                handler = v13.onRelease(v51)
            } else nil
        };
    end, {
        v50, 
        v51
    });
    return v12.useEventHandlerMap(v53, v52);
end;
local v55 = v3.PureComponent:extend("PurchasePromptInteractiveAlert");
v55.validateProps = v6.strictInterface({
    priceInRobux = v6.number, 
    showSaveAsCharacter = v6.optional(v6.boolean), 
    showWearAfterPurchase = v6.boolean, 
    isWearAfterPurchaseChecked = v6.boolean, 
    isSaveAsCharacterChecked = v6.optional(v6.boolean), 
    toggleSaveAsCharacter = v6.optional(v6.callback), 
    toggleWearAfterPurchase = v6.callback, 
    lookType = v6.optional(v6.string), 
    analyticsInfo = v6.optional(v6.table), 
    titleText = v6.string, 
    bodyText = v6.string, 
    confirmButtonText = v6.string, 
    onConfirm = v6.callback, 
    onCancel = v6.callback, 
    isLoading = v6.boolean, 
    defaultChildRef = v6.optional(v6.table), 
    isPurchasingOutfit = v6.optional(v6.boolean), 
    focusNavigationRef = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v6.table else nil, 
    saveIfWearAfterPurchase = v6.optional(v6.boolean), 
    screenSize = v6.Vector2
});
v55.init = function(v56) --[[ Line: 161 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v56.checkboxRef = v3.createRef();
    v56.textButtonRef = v3.createRef();
end;
v55.renderCheckboxContainer = function(v57, v58) --[[ Line: 166 ]] --[[ Name: renderCheckboxContainer ]]
    -- upvalues: v3 (copy), l_Checkbox_0 (copy)
    local l_showSaveAsCharacter_0 = v57.props.showSaveAsCharacter;
    local l_showWearAfterPurchase_0 = v57.props.showWearAfterPurchase;
    return (not not l_showSaveAsCharacter_0 or l_showWearAfterPurchase_0) and v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -8)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        WearAfterPurchaseCheckbox = l_showWearAfterPurchase_0 and v3.createElement(l_Checkbox_0, {
            size = UDim2.new(1, 0, 0, 0), 
            text = if v57.props.isPurchasingOutfit then v58.wearOutfitLabel else v58.wearItemLabel, 
            isSelected = v57.props.isWearAfterPurchaseChecked, 
            onActivated = v57.props.toggleWearAfterPurchase, 
            layoutOrder = 1, 
            [v3.Ref] = v57.checkboxRef
        }), 
        SaveAsCharacterCheckbox = l_showSaveAsCharacter_0 and v3.createElement(l_Checkbox_0, {
            size = UDim2.new(1, 0, 0, 0), 
            text = v58.saveAsCharacterLabel, 
            isSelected = v57.props.isSaveAsCharacterChecked, 
            onActivated = v57.props.toggleSaveAsCharacter, 
            layoutOrder = 2, 
            [v3.Ref] = v57.checkboxRef
        })
    });
end;
v55.renderMiddle = function(v61, v62, v63) --[[ Line: 205 ]] --[[ Name: renderMiddle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v22 (copy)
    local v64 = v61.props.priceInRobux or "";
    local v65 = v64 == 0;
    local v66 = not v65;
    local l_Font_0 = v62.Font;
    local l_Theme_0 = v62.Theme;
    local v69 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v70 = v66 and v69 or 0;
    return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0), 
        defaultChild = v61.checkboxRef
    }, {
        PriceContainer = not v65 and v3.createElement(l_FitFrameVertical_0, {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            contentPadding = UDim.new(0, 6), 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
            width = UDim.new(1, 0)
        }, {
            PriceLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v63.priceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v69, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v22, {
                robuxAmountText = tostring(v64), 
                iconSize = v70, 
                textSize = v69, 
                padding = 4, 
                showRobuxIcon = v66
            })
        }), 
        CheckboxContainer = v61:renderCheckboxContainer(v63)
    });
end;
v55.renderAlertLocalized = function(v71, v72, v73) --[[ Line: 257 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), v37 (copy), l_Focusable_0 (copy), l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 (copy), v8 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v3.createElement(if v37 then l_Focusable_0.TextButton else l_Focusable_0.Frame, {
        Text = v37 and "" or nil, 
        AutoButtonColor = not v37 and nil, 
        Selectable = not v37 and nil, 
        [v3.Event.Activated] = v37 and function() --[[ Line: 265 ]]
            -- upvalues: v71 (copy)
            v71.props.onCancel();
        end or nil, 
        [v3.Ref] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v71.props.focusNavigationRef else nil, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        inputBindings = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then nil else {
            SaveAsCharacter = if v71.props.toggleSaveAsCharacter ~= nil then v8.Input.onBegin(Enum.KeyCode.ButtonX, v71.props.toggleSaveAsCharacter, {
                key = "Feature.Avatar.Heading.SaveCostume"
            }) else nil, 
            WearAfterPurchase = v8.Input.onBegin(Enum.KeyCode.ButtonY, v71.props.toggleWearAfterPurchase, {
                key = "Feature.Avatar.Heading.WearConfirmation"
            }), 
            Confirm = v8.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 294 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        PurchasePrompt = v3.createElement(l_InteractiveAlert_0, {
            title = v71.props.titleText, 
            bodyText = v71.props.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v71.props.onCancel, 
                            text = v73.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v71.props.isLoading, 
                            onActivated = v71.props.onConfirm, 
                            text = v71.props.confirmButtonText, 
                            buttonRef = v71.textButtonRef
                        }, 
                        isDefaultChild = false
                    }
                }
            }, 
            middleContent = function() --[[ Line: 324 ]] --[[ Name: middleContent ]]
                -- upvalues: v71 (copy), v72 (copy), v73 (copy)
                return v71:renderMiddle(v72, v73);
            end, 
            screenSize = v71.props.screenSize, 
            defaultChildRef = v71.props.defaultChildRef, 
            isMiddleContentFocusable = true
        })
    });
end;
v55.render = function(v74) --[[ Line: 335 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), l_FFlagAXUpdateSaveStrings_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    local v75 = nil;
    v75 = if v74.props.lookType and v74.props.lookType == v23.LookType.Avatar then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v74.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v74.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAvatarAfterPurchase"
    } else if l_FFlagAXCatalogMakeupSupport_0 and v74.props.lookType and v74.props.lookType == v23.LookType.Makeup then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks", 
        wearItemLabel = "Feature.Catalog.Checkout.WearAfterPurchase", 
        wearOutfitLabel = "Feature.Catalog.Checkout.WearAfterPurchase"
    } else {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v74.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v74.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearOutfitAfterPurchase"
    };
    return l_withStyle_0(function(v76) --[[ Line: 379 ]]
        -- upvalues: l_withLocalization_0 (ref), v75 (ref), v74 (copy)
        return l_withLocalization_0(v75)(function(v77) --[[ Line: 380 ]]
            -- upvalues: v74 (ref), v76 (copy)
            return v74:renderAlertLocalized(v76, v77);
        end);
    end);
end;
v55.addUnifiedEventLogging = function(v78) --[[ Line: 386 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), v5 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_CartIdService_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), v43 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v79 = v78.props.analyticsInfo or {};
    l_addUnifiedEventLogging_0(v78.textButtonRef, v5.Dictionary.join(v79, {
        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
        cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
        itemType = if v79.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v79.itemType == "Bundle" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
        organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v79.widgetType) and v78.props.lookType then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v78.props.lookType) else nil, 
        widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v79.widgetType and v78.props.lookType then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v78.props.lookType) else nil, 
        widgetItemPrice = if v79.widgetType then v78.props.priceInRobux else nil, 
        organicItemPrice = if v79.widgetType then nil else v78.props.priceInRobux, 
        widgetItemWearAfterPurchase = if v43 then if v79.widgetType then v78.props.showWearAfterPurchase and v78.props.isWearAfterPurchaseChecked else nil else nil, 
        widgetItemSaveToMyAvatars = if v43 then if v79.widgetType then v78.props.showSaveAsCharacter and v78.props.isSaveAsCharacterChecked else nil else nil, 
        organicItemWearAfterPurchase = if v43 then if v79.widgetType then nil else v78.props.showWearAfterPurchase and v78.props.isWearAfterPurchaseChecked else nil, 
        organicItemSaveToMyAvatars = if v43 then if v79.widgetType then nil else v78.props.showSaveAsCharacter and v78.props.isSaveAsCharacterChecked else nil, 
        widgetAssetType = if l_FFlagAddTypesToWidgetItems_0 and v79.widgetType then v79.assetType else nil, 
        widgetBundleType = if l_FFlagAddTypesToWidgetItems_0 and v79.widgetType then v79.bundleType else nil
    }), {
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v55.didMount = function(v80) --[[ Line: 442 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_FIntLegacyPurchaseFPSTrackingTimeout_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_ProductPurchaseContainerShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_LegacyFlowShown_Catalog", 2, nil, true, true);
        local v81 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v81, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
    v80:addUnifiedEventLogging();
end;
v55.didUpdate = function(v82) --[[ Line: 464 ]] --[[ Name: didUpdate ]]
    v82:addUnifiedEventLogging();
end;
v55 = v4.connect(function(v83, _) --[[ Line: 468 ]]
    return {
        screenSize = v83.ScreenSize
    };
end, nil)(v55);
if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then
    return function(v85) --[[ Line: 475 ]]
        -- upvalues: v2 (copy), v54 (copy), v5 (copy), l_useTableWrappedCallbackRef_0 (copy), v55 (ref)
        local v86 = v2.useCallback(function() --[[ Line: 476 ]]
            -- upvalues: v85 (copy)
            if v85.toggleSaveAsCharacter then
                v85.toggleSaveAsCharacter();
            end;
        end, {
            v85.toggleSaveAsCharacter
        });
        local v87 = v2.useCallback(function() --[[ Line: 481 ]]
            -- upvalues: v85 (copy)
            if v85.toggleWearAfterPurchase then
                v85.toggleWearAfterPurchase();
            end;
        end, {
            v85.toggleWearAfterPurchase
        });
        local v88 = v54(nil, if v85.toggleSaveAsCharacter then v86 else nil, if v85.toggleWearAfterPurchase then v87 else nil);
        local v89 = v5.Dictionary.join(v85, {
            focusNavigationRef = l_useTableWrappedCallbackRef_0(v88)
        });
        return v2.createElement(v55, v89);
    end;
else
    return v55;
end;