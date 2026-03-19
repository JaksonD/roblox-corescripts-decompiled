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
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v26 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v26.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v26.Enums.ProductPurchaseSurface;
local v30 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v30.Style.withStyle;
local l_InteractiveAlert_0 = v30.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v30.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v30.App.InputButton.Checkbox;
local v35 = game:DefineFastFlag("AXFixPurchasePromptScrimClickThrough", false);
local l_FFlagAXUpdateSaveStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSaveStrings;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAddTypesToWidgetItems_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems;
local v39 = game:DefineFastFlag("AXAddWearAndSaveToPurchaseLogging", false);
local l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigratePurchasePromptInteractiveToFocusNavigation;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FIntLegacyPurchaseFPSTrackingTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout;
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local v44 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SaveAsCharacter, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.WearAfterPurchase
};
local function v50(v45, v46, v47) --[[ Line: 104 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v12 (copy), v44 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v13 (copy)
    local v48 = v12.useEventMap(v44, v45);
    local v49 = v2.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v46 (copy), v13 (ref), v47 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SaveAsCharacter] = if v46 then {
                handler = v13.onRelease(v46)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.WearAfterPurchase] = if v47 then {
                handler = v13.onRelease(v47)
            } else nil
        };
    end, {
        v46, 
        v47
    });
    return v12.useEventHandlerMap(v49, v48);
end;
local v51 = v3.PureComponent:extend("PurchasePromptInteractiveAlert");
v51.validateProps = v6.strictInterface({
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
v51.init = function(v52) --[[ Line: 153 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v52.checkboxRef = v3.createRef();
    v52.textButtonRef = v3.createRef();
end;
v51.renderCheckboxContainer = function(v53, v54) --[[ Line: 158 ]] --[[ Name: renderCheckboxContainer ]]
    -- upvalues: v3 (copy), l_Checkbox_0 (copy)
    local l_showSaveAsCharacter_0 = v53.props.showSaveAsCharacter;
    local l_showWearAfterPurchase_0 = v53.props.showWearAfterPurchase;
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
            text = if v53.props.isPurchasingOutfit then v54.wearOutfitLabel else v54.wearItemLabel, 
            isSelected = v53.props.isWearAfterPurchaseChecked, 
            onActivated = v53.props.toggleWearAfterPurchase, 
            layoutOrder = 1, 
            [v3.Ref] = v53.checkboxRef
        }), 
        SaveAsCharacterCheckbox = l_showSaveAsCharacter_0 and v3.createElement(l_Checkbox_0, {
            size = UDim2.new(1, 0, 0, 0), 
            text = v54.saveAsCharacterLabel, 
            isSelected = v53.props.isSaveAsCharacterChecked, 
            onActivated = v53.props.toggleSaveAsCharacter, 
            layoutOrder = 2, 
            [v3.Ref] = v53.checkboxRef
        })
    });
end;
v51.renderMiddle = function(v57, v58, v59) --[[ Line: 197 ]] --[[ Name: renderMiddle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v21 (copy)
    local v60 = v57.props.priceInRobux or "";
    local v61 = v60 == 0;
    local v62 = not v61;
    local l_Font_0 = v58.Font;
    local l_Theme_0 = v58.Theme;
    local v65 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v66 = v62 and v65 or 0;
    return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0), 
        defaultChild = v57.checkboxRef
    }, {
        PriceContainer = not v61 and v3.createElement(l_FitFrameVertical_0, {
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
                Text = v59.priceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v65, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v21, {
                robuxAmountText = tostring(v60), 
                iconSize = v66, 
                textSize = v65, 
                padding = 4, 
                showRobuxIcon = v62
            })
        }), 
        CheckboxContainer = v57:renderCheckboxContainer(v59)
    });
end;
v51.renderAlertLocalized = function(v67, v68, v69) --[[ Line: 249 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), v35 (copy), l_Focusable_0 (copy), l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 (copy), v8 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v3.createElement(if v35 then l_Focusable_0.TextButton else l_Focusable_0.Frame, {
        Text = v35 and "" or nil, 
        AutoButtonColor = not v35 and nil, 
        Selectable = not v35 and nil, 
        [v3.Event.Activated] = v35 and function() --[[ Line: 257 ]]
            -- upvalues: v67 (copy)
            v67.props.onCancel();
        end or nil, 
        [v3.Ref] = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then v67.props.focusNavigationRef else nil, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        inputBindings = if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then nil else {
            SaveAsCharacter = if v67.props.toggleSaveAsCharacter ~= nil then v8.Input.onBegin(Enum.KeyCode.ButtonX, v67.props.toggleSaveAsCharacter, {
                key = "Feature.Avatar.Heading.SaveCostume"
            }) else nil, 
            WearAfterPurchase = v8.Input.onBegin(Enum.KeyCode.ButtonY, v67.props.toggleWearAfterPurchase, {
                key = "Feature.Avatar.Heading.WearConfirmation"
            }), 
            Confirm = v8.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 286 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        PurchasePrompt = v3.createElement(l_InteractiveAlert_0, {
            title = v67.props.titleText, 
            bodyText = v67.props.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v67.props.onCancel, 
                            text = v69.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v67.props.isLoading, 
                            onActivated = v67.props.onConfirm, 
                            text = v67.props.confirmButtonText, 
                            buttonRef = v67.textButtonRef
                        }, 
                        isDefaultChild = false
                    }
                }
            }, 
            middleContent = function() --[[ Line: 316 ]] --[[ Name: middleContent ]]
                -- upvalues: v67 (copy), v68 (copy), v69 (copy)
                return v67:renderMiddle(v68, v69);
            end, 
            screenSize = v67.props.screenSize, 
            defaultChildRef = v67.props.defaultChildRef, 
            isMiddleContentFocusable = true
        })
    });
end;
v51.render = function(v70) --[[ Line: 327 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), l_FFlagAXUpdateSaveStrings_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    local v71 = nil;
    v71 = if v70.props.lookType and v70.props.lookType == v22.LookType.Avatar then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v70.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v70.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAvatarAfterPurchase"
    } else if l_FFlagAXCatalogMakeupSupport_0 and v70.props.lookType and v70.props.lookType == v22.LookType.Makeup then {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks", 
        wearItemLabel = "Feature.Catalog.Checkout.WearAfterPurchase", 
        wearOutfitLabel = "Feature.Catalog.Checkout.WearAfterPurchase"
    } else {
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        saveAsCharacterLabel = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or "Feature.Catalog.Label.SaveAsCharacter", 
        wearItemLabel = v70.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearAfterPurchase", 
        wearOutfitLabel = v70.props.saveIfWearAfterPurchase and "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" or "Feature.Catalog.Label.WearOutfitAfterPurchase"
    };
    return l_withStyle_0(function(v72) --[[ Line: 371 ]]
        -- upvalues: l_withLocalization_0 (ref), v71 (ref), v70 (copy)
        return l_withLocalization_0(v71)(function(v73) --[[ Line: 372 ]]
            -- upvalues: v70 (ref), v72 (copy)
            return v70:renderAlertLocalized(v72, v73);
        end);
    end);
end;
v51.addUnifiedEventLogging = function(v74) --[[ Line: 378 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), v5 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v39 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v75 = v74.props.analyticsInfo or {};
    l_addUnifiedEventLogging_0(v74.textButtonRef, v5.Dictionary.join(v75, {
        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
        itemType = if v75.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v75.itemType == "Bundle" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
        organicLookType = if not (not l_FFlagAXCatalogMakeupSupport_0 or v75.widgetType) and v74.props.lookType then v74.props.lookType else nil, 
        widgetLookType = if l_FFlagAXCatalogMakeupSupport_0 and v75.widgetType and v74.props.lookType then v74.props.lookType else nil, 
        widgetItemPrice = if v75.widgetType then v74.props.priceInRobux else nil, 
        organicItemPrice = if v75.widgetType then nil else v74.props.priceInRobux, 
        widgetItemWearAfterPurchase = if v39 then if v75.widgetType then v74.props.showWearAfterPurchase and v74.props.isWearAfterPurchaseChecked else nil else nil, 
        widgetItemSaveToMyAvatars = if v39 then if v75.widgetType then v74.props.showSaveAsCharacter and v74.props.isSaveAsCharacterChecked else nil else nil, 
        organicItemWearAfterPurchase = if v39 then if v75.widgetType then nil else v74.props.showWearAfterPurchase and v74.props.isWearAfterPurchaseChecked else nil, 
        organicItemSaveToMyAvatars = if v39 then if v75.widgetType then nil else v74.props.showSaveAsCharacter and v74.props.isSaveAsCharacterChecked else nil, 
        widgetAssetType = if l_FFlagAddTypesToWidgetItems_0 and v75.widgetType then v75.assetType else nil, 
        widgetBundleType = if l_FFlagAddTypesToWidgetItems_0 and v75.widgetType then v75.bundleType else nil
    }), {
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v51.didMount = function(v76) --[[ Line: 433 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_FIntLegacyPurchaseFPSTrackingTimeout_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_ProductPurchaseContainerShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_LegacyFlowShown_Catalog", 2, nil, true, true);
        local v77 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v77, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
    v76:addUnifiedEventLogging();
end;
v51.didUpdate = function(v78) --[[ Line: 455 ]] --[[ Name: didUpdate ]]
    v78:addUnifiedEventLogging();
end;
v51 = v4.connect(function(v79, _) --[[ Line: 459 ]]
    return {
        screenSize = v79.ScreenSize
    };
end, nil)(v51);
if l_FFlagAXMigratePurchasePromptInteractiveToFocusNavigation_0 then
    return function(v81) --[[ Line: 466 ]]
        -- upvalues: v2 (copy), v50 (copy), v5 (copy), l_useTableWrappedCallbackRef_0 (copy), v51 (ref)
        local v82 = v2.useCallback(function() --[[ Line: 467 ]]
            -- upvalues: v81 (copy)
            if v81.toggleSaveAsCharacter then
                v81.toggleSaveAsCharacter();
            end;
        end, {
            v81.toggleSaveAsCharacter
        });
        local v83 = v2.useCallback(function() --[[ Line: 472 ]]
            -- upvalues: v81 (copy)
            if v81.toggleWearAfterPurchase then
                v81.toggleWearAfterPurchase();
            end;
        end, {
            v81.toggleWearAfterPurchase
        });
        local v84 = v50(nil, if v81.toggleSaveAsCharacter then v82 else nil, if v81.toggleWearAfterPurchase then v83 else nil);
        local v85 = v5.Dictionary.join(v81, {
            focusNavigationRef = l_useTableWrappedCallbackRef_0(v84)
        });
        return v2.createElement(v51, v85);
    end;
else
    return v51;
end;