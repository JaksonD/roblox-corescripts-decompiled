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
local l_RoactFitComponents_0 = v7.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLoggingUtils_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v27 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v27.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v27.Enums.ProductPurchaseSurface;
local v31 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v31.Style.withStyle;
local l_InteractiveAlert_0 = v31.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v31.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v31.App.InputButton.Checkbox;
local v36 = game:DefineFastFlag("AXFixPurchasePromptScrimClickThrough", false);
local l_FFlagAXUpdateSaveStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSaveStrings;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAddTypesToWidgetItems_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems;
local v41 = game:DefineFastFlag("AXAddWearAndSaveToPurchaseLogging", false);
local l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigratePurchasePromptInteractiveToFocusNavigation;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FIntLegacyPurchaseFPSTrackingTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout;
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local v46 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SaveAsCharacter, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.WearAfterPurchase
};
local function v52(v47, v48, v49) --[[ Line: 108 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v12 (copy), v46 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v13 (copy)
    local v50 = v12.useEventMap(v46, v47);
    local v51 = v2.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v48 (copy), v13 (ref), v49 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = if v48 then {
                handler = v13.onRelease(v48)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = if v49 then {
                handler = v13.onRelease(v49)
            } else nil
        };
    end, {
        v48, 
        v49
    });
    return v12.useEventHandlerMap(v51, v50);
end;
local v53 = v3.PureComponent:extend("PurchasePromptInteractiveAlert");
v53.validateProps = v6.strictInterface({
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
v53.init = function(v54) --[[ Line: 157 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v54.checkboxRef = v3.createRef();
    v54.textButtonRef = v3.createRef();
end;
v53.renderCheckboxContainer = function(v55, v56) --[[ Line: 162 ]] --[[ Name: renderCheckboxContainer ]]
    -- upvalues: v3 (copy), l_Checkbox_0 (copy)
    local l_showSaveAsCharacter_0 = v55.props.showSaveAsCharacter;
    local l_showWearAfterPurchase_0 = v55.props.showWearAfterPurchase;
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
            text = if v55.props.isPurchasingOutfit then v56.wearOutfitLabel else v56.wearItemLabel, 
            isSelected = v55.props.isWearAfterPurchaseChecked, 
            onActivated = v55.props.toggleWearAfterPurchase, 
            layoutOrder = 1, 
            [v3.Ref] = v55.checkboxRef
        }), 
        SaveAsCharacterCheckbox = l_showSaveAsCharacter_0 and v3.createElement(l_Checkbox_0, {
            size = UDim2.new(1, 0, 0, 0), 
            text = v56.saveAsCharacterLabel, 
            isSelected = v55.props.isSaveAsCharacterChecked, 
            onActivated = v55.props.toggleSaveAsCharacter, 
            layoutOrder = 2, 
            [v3.Ref] = v55.checkboxRef
        })
    });
end;
v53.renderMiddle = function(v59, v60, v61) --[[ Line: 201 ]] --[[ Name: renderMiddle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v21 (copy)
    local v62 = v59.props.priceInRobux or "";
    local v63 = v62 == 0;
    local v64 = not v63;
    local l_Font_0 = v60.Font;
    local l_Theme_0 = v60.Theme;
    local v67 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v68 = v64 and v67 or 0;
    return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0), 
        defaultChild = v59.checkboxRef
    }, {
        PriceContainer = not v63 and v3.createElement(l_FitFrameVertical_0, {
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
                Text = v61.priceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v67, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v21, {
                robuxAmountText = tostring(v62), 
                iconSize = v68, 
                textSize = v67, 
                padding = 4, 
                showRobuxIcon = v64
            })
        }), 
        CheckboxContainer = v59:renderCheckboxContainer(v61)
    });
end;
v53.renderAlertLocalized = function(v69, v70, v71) --[[ Line: 253 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), v36 (copy), l_Focusable_0 (copy), l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 (copy), v8 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v3.createElement(if v36 then l_Focusable_0.TextButton else l_Focusable_0.Frame, {
        Text = v36 and "" or nil, 
        AutoButtonColor = not v36 and nil, 
        Selectable = not v36 and nil, 
        [v3.Event.Activated] = v36 and function() --[[ Line: 261 ]]
            -- upvalues: v69 (copy)
            v69.props.onCancel();
        end or nil, 
        [v3.Ref] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v69.props.focusNavigationRef else nil, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        inputBindings = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then nil else {
            SaveAsCharacter = if v69.props.toggleSaveAsCharacter ~= nil then v8.Input.onBegin(Enum.KeyCode.ButtonX, v69.props.toggleSaveAsCharacter, {
                key = "Feature.Avatar.Heading.SaveCostume"
            }) else nil, 
            WearAfterPurchase = v8.Input.onBegin(Enum.KeyCode.ButtonY, v69.props.toggleWearAfterPurchase, {
                key = "Feature.Avatar.Heading.WearConfirmation"
            }), 
            Confirm = v8.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 290 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        PurchasePrompt = v3.createElement(l_InteractiveAlert_0, {
            title = v69.props.titleText, 
            bodyText = v69.props.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v69.props.onCancel, 
                            text = v71.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v69.props.isLoading, 
                            onActivated = v69.props.onConfirm, 
                            text = v69.props.confirmButtonText, 
                            buttonRef = v69.textButtonRef
                        }, 
                        isDefaultChild = false
                    }
                }
            }, 
            middleContent = function() --[[ Line: 320 ]] --[[ Name: middleContent ]]
                -- upvalues: v69 (copy), v70 (copy), v71 (copy)
                return v69:renderMiddle(v70, v71);
            end, 
            screenSize = v69.props.screenSize, 
            defaultChildRef = v69.props.defaultChildRef, 
            isMiddleContentFocusable = true
        })
    });
end;
v53.render = function(v72) --[[ Line: 331 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), l_FFlagAXUpdateSaveStrings_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    local v73 = nil;
    v73 = if v72.props.lookType and v72.props.lookType == v22.LookType.Avatar then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v72.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v72.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAvatarAfterPurchase"
    } else if l_FFlagAXCatalogMakeupSupport_0 and v72.props.lookType and v72.props.lookType == v22.LookType.Makeup then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks", 
        wearItemLabel = "Feature.Catalog.Checkout.WearAfterPurchase", 
        wearOutfitLabel = "Feature.Catalog.Checkout.WearAfterPurchase"
    } else {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v72.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v72.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearOutfitAfterPurchase"
    };
    return l_withStyle_0(function(v74) --[[ Line: 375 ]]
        -- upvalues: l_withLocalization_0 (ref), v73 (ref), v72 (copy)
        return l_withLocalization_0(v73)(function(v75) --[[ Line: 376 ]]
            -- upvalues: v72 (ref), v74 (copy)
            return v72:renderAlertLocalized(v74, v75);
        end);
    end);
end;
v53.addUnifiedEventLogging = function(v76) --[[ Line: 382 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), v5 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), v41 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v77 = v76.props.analyticsInfo or {};
    l_addUnifiedEventLogging_0(v76.textButtonRef, v5.Dictionary.join(v77, {
        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
        itemType = if v77.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v77.itemType == "Bundle" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
        organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v77.widgetType) and v76.props.lookType then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76.props.lookType) else nil, 
        widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v77.widgetType and v76.props.lookType then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76.props.lookType) else nil, 
        widgetItemPrice = if v77.widgetType then v76.props.priceInRobux else nil, 
        organicItemPrice = if v77.widgetType then nil else v76.props.priceInRobux, 
        widgetItemWearAfterPurchase = if v41 then if v77.widgetType then v76.props.showWearAfterPurchase and v76.props.isWearAfterPurchaseChecked else nil else nil, 
        widgetItemSaveToMyAvatars = if v41 then if v77.widgetType then v76.props.showSaveAsCharacter and v76.props.isSaveAsCharacterChecked else nil else nil, 
        organicItemWearAfterPurchase = if v41 then if v77.widgetType then nil else v76.props.showWearAfterPurchase and v76.props.isWearAfterPurchaseChecked else nil, 
        organicItemSaveToMyAvatars = if v41 then if v77.widgetType then nil else v76.props.showSaveAsCharacter and v76.props.isSaveAsCharacterChecked else nil, 
        widgetAssetType = if l_FFlagAddTypesToWidgetItems_0 and v77.widgetType then v77.assetType else nil, 
        widgetBundleType = if l_FFlagAddTypesToWidgetItems_0 and v77.widgetType then v77.bundleType else nil
    }), {
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v53.didMount = function(v78) --[[ Line: 437 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_FIntLegacyPurchaseFPSTrackingTimeout_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_ProductPurchaseContainerShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_LegacyFlowShown_Catalog", 2, nil, true, true);
        local v79 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v79, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
    v78:addUnifiedEventLogging();
end;
v53.didUpdate = function(v80) --[[ Line: 459 ]] --[[ Name: didUpdate ]]
    v80:addUnifiedEventLogging();
end;
v53 = v4.connect(function(v81, _) --[[ Line: 463 ]]
    return {
        screenSize = v81.ScreenSize
    };
end, nil)(v53);
if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then
    return function(v83) --[[ Line: 470 ]]
        -- upvalues: v2 (copy), v52 (copy), v5 (copy), l_useTableWrappedCallbackRef_0 (copy), v53 (ref)
        local v84 = v2.useCallback(function() --[[ Line: 471 ]]
            -- upvalues: v83 (copy)
            if v83.toggleSaveAsCharacter then
                v83.toggleSaveAsCharacter();
            end;
        end, {
            v83.toggleSaveAsCharacter
        });
        local v85 = v2.useCallback(function() --[[ Line: 476 ]]
            -- upvalues: v83 (copy)
            if v83.toggleWearAfterPurchase then
                v83.toggleWearAfterPurchase();
            end;
        end, {
            v83.toggleWearAfterPurchase
        });
        local v86 = v52(nil, if v83.toggleSaveAsCharacter then v84 else nil, if v83.toggleWearAfterPurchase then v85 else nil);
        local v87 = v5.Dictionary.join(v83, {
            focusNavigationRef = l_useTableWrappedCallbackRef_0(v86)
        });
        return v2.createElement(v53, v87);
    end;
else
    return v53;
end;