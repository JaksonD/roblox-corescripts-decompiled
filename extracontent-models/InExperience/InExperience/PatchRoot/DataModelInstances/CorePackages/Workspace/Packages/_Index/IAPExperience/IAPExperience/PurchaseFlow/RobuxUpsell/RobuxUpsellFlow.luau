local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_0.RobuxUpsellFlowState);
local _ = require(l_Parent_1.Enums.VirtualItemBadgeType);
local v8 = require(l_Parent_1.Generic.Animator);
local v9 = require(l_Parent_1.Generic.Constants);
local v10 = require(l_Parent_1.Generic.LoadingOverlay);
local v11 = require(l_Parent_1.Generic.LoadingOverlayState);
local v12 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v13 = require(l_Parent_1.Enums.PurchaseErrorType);
local v14 = require(l_Parent_1.Generic.U13ConfirmPrompt);
local v15 = require(l_Parent_1.Generic.TwoStepReqPrompt);
local v16 = require(l_Parent_1.Generic.InsufficientRobuxPrompt);
local v17 = require(l_Parent_1.ProductPurchaseRobuxUpsell.InsufficientRobuxProductPrompt);
local v18 = require(l_Parent_1.Generic.LeaveRobloxPrompt);
local v19 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellSuccessPrompt);
local v20 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellPrompt);
local v21 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModal);
local v22 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalMultiplePackage);
local v23 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensive);
local v24 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v2.RobuxUpsellModalTooExpensiveFallback);
local v25 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModal);
local v26 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v3.UnifiedRobuxUpsellModalTooExpensive);
local v27 = require(l_Parent_2.PurchasePromptLite);
local l_getTTIEventName_0 = v27.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_Parent_2.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v27.Enums.ProductPurchaseSurface;
local v31 = require(l_Parent_1.Utility.getModalShownEventData);
local v32 = require(l_Parent_1.Utility.getUserInputEventData);
local v33 = require(l_Parent_1.Utility.Experiments.shouldShowNewUpsellModalExperiment);
local v34 = require(l_Parent_1.Utility.overlayInGameMenu);
local v35 = require(l_Parent_1.Utility.Experiments.DesktopUpsellExperiment);
local v36 = require(l_Parent_1.Flags.getEnableCentralOverlayForUpsellPrompt);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_2.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v38 = require(l_Parent_1.Utility.getAppContext);
local v39 = require(l_Parent_1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled);
local v40 = require(l_Parent_1.Generic.UnifiedPurchaseCompletionModalV2);
local v41 = v5.Component:extend(script.Name);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v43 = require(l_Parent_0.Events.InGameRobuxUpsellEvent);
local l_Players_0 = game:GetService("Players");
local l_IntervalPerformanceTracker_0 = require(l_Parent_2.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v47 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalV2);
local v48 = require(l_Parent_1.ProductPurchaseRobuxUpsell.v4.UnifiedRobuxUpsellModalTooExpensiveV2);
local v49 = require(l_Parent_1.Enums.UnifiedPurchaseModalTypeEnum);
local v50 = require(l_Parent_1.Generic.UnifiedPurchaseCompletionModal);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_2.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_2.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FIntLegacyPurchaseFPSTrackingTimeout_0 = require(l_Parent_2.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout;
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_Parent_2.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_2.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
game:DefineFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent", false);
game:DefineFastFlag("EnableSchematizedInGameRobuxUpsellEvent2", false);
local v56 = game:DefineFastFlag("FixUnifiedUpsellCompletionModal", false);
local _ = require(l_Parent_1.ProductPurchase.PricingTypes);
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_2.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local _ = require(l_Parent_1.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
v41.init = function(v60) --[[ Line: 170 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_props_0 = v60.props;
    v60.state = {
        analyticId = if l_props_0.analyticId then l_props_0.analyticId else l_HttpService_0:GenerateGUID(false), 
        isDelayedInput = l_props_0.isDelayedInput, 
        enableInputDelayed = false
    };
    v60.closeModal = function() --[[ Line: 180 ]]
        -- upvalues: v60 (copy)
        local l_props_1 = v60.props;
        v60:reportUserInput("Cancel");
        l_props_1.cancelPurchase();
        v60:closeCentralOverlay();
        v60:UnbindActions();
    end;
end;
v41.didMount = function(v63) --[[ Line: 190 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_FIntLegacyPurchaseFPSTrackingTimeout_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and (v63.props or {}).eventPrefix == "UACatalog" then
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_RobuxUpsellModalShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_LegacyFlowRobuxUpsellModalShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        local v64 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v64, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
end;
v41.didUpdate = function(v65, v66, _) --[[ Line: 219 ]] --[[ Name: didUpdate ]]
    local l_props_2 = v65.props;
    if v66.purchaseState ~= l_props_2.purchaseState then
        v65:reportModalShown();
        v65:dispatchCentralOverlayAndRenderModal(l_props_2);
    end;
end;
v41.UnbindActions = function(v69) --[[ Line: 228 ]] --[[ Name: UnbindActions ]]
    -- upvalues: v36 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v36() and v69.props.dispatchCentralOverlay then
        l_ContextActionService_0:UnbindAction(v9.CLOSE_MODAL_ACTION);
    end;
end;
v41.BindCancelAction = function(v70) --[[ Line: 234 ]] --[[ Name: BindCancelAction ]]
    -- upvalues: v36 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v36() and v70.props.dispatchCentralOverlay then
        l_ContextActionService_0:BindAction(v9.CLOSE_MODAL_ACTION, v70.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v41.closeCentralOverlay = function(v71) --[[ Line: 250 ]] --[[ Name: closeCentralOverlay ]]
    -- upvalues: v36 (copy)
    local l_props_3 = v71.props;
    if v36() and l_props_3.dispatchCentralOverlay then
        l_props_3.dispatchCentralOverlay();
    end;
end;
v41.constructRobuxUpsellPromptAnimatorObj = function(v73) --[[ Line: 258 ]] --[[ Name: constructRobuxUpsellPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), v38 (copy), v5 (copy), v47 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v25 (copy), v34 (copy), v22 (copy), v33 (copy), v35 (copy), v21 (copy), v20 (copy), v39 (copy)
    local l_props_4 = v73.props;
    local l_state_0 = v73.state;
    v73:BindCancelAction();
    return {
        shouldAnimate = l_props_4.shouldAnimate, 
        shouldShow = l_props_4.purchaseState == v6.PurchaseModal, 
        skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then l_props_4.useUnifiedProductPurchaseModal else nil, 
        onShown = l_props_4.isDelayedInput and function() --[[ Line: 270 ]]
            -- upvalues: v73 (copy), l_props_4 (copy)
            v73:setState({
                enableInputDelayed = true
            });
            delay(3, function() --[[ Line: 274 ]]
                -- upvalues: v73 (ref), l_props_4 (ref)
                v73:setState({
                    isDelayedInput = false, 
                    enableInputDelayed = false
                });
                if l_props_4.onDelayedInputComplete then
                    l_props_4.onDelayedInputComplete();
                end;
            end);
        end or nil, 
        onHidden = l_props_4.isDelayedInput and function() --[[ Line: 284 ]]
            -- upvalues: v73 (copy), l_props_4 (copy)
            v73:setState({
                isDelayedInput = l_props_4.isDelayedInput, 
                enableInputDelayed = false
            });
        end or nil, 
        renderChildren = function() --[[ Line: 290 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_props_4 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (ref), v38 (ref), v5 (ref), v47 (ref), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v73 (copy), l_state_0 (copy), v25 (ref), v34 (ref), v22 (ref), v33 (ref), v35 (ref), v21 (ref), v20 (ref), v39 (ref)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_4.useUnifiedProductPurchaseModal then
                if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v38() == "UA" then
                    return v5.createElement(v47, {
                        product = {
                            model = l_props_4.model, 
                            itemIcon = l_props_4.itemIcon, 
                            itemName = l_props_4.itemName, 
                            itemRobuxCost = l_props_4.itemRobuxCost, 
                            badgeType = l_props_4.virtualItemBadgeType, 
                            itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then l_props_4.virtualItemPrice else nil
                        }, 
                        userBalance = l_props_4.beforeRobuxBalance, 
                        upsellSuggestions = l_props_4.upsellSuggestions, 
                        selectedUpsellIndex = l_props_4.selectedUpsellIndex, 
                        onUpsellSuggestionsSelected = l_props_4.onUpsellSuggestionsSelected, 
                        purchaseModalType = l_props_4.unifiedProductPurchaseModalType, 
                        onBuyItemButtonMounted = l_props_4.onBuyItemButtonMounted, 
                        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_4.hideUserRobuxBalance else nil, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 314 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v73 (ref), l_props_4 (ref)
                                v73:reportUserInput("Buy");
                                l_props_4.purchaseRobux();
                                v73:closeCentralOverlay();
                            end, 
                            buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                            buyItemisDelayedInput = l_state_0.isDelayedInput, 
                            buyItemEnableInputDelayed = l_state_0.enableInputDelayed and v38() == "IN_EXPERIENCE", 
                            cancelPurchaseActivated = function() --[[ Line: 322 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v73 (ref), l_props_4 (ref)
                                v73:reportUserInput("Cancel");
                                l_props_4.cancelPurchase();
                                v73:closeCentralOverlay();
                            end, 
                            cancelControllerIcon = l_props_4.cancelControllerIcon
                        }, 
                        termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 329 ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("TermsOfService");
                            l_props_4.showTermsOfUse();
                            l_props_4.flowComplete();
                        end or nil, 
                        screenSize = l_props_4.screenSize
                    });
                else
                    return v5.createElement(v25, {
                        product = {
                            model = l_props_4.model, 
                            itemIcon = l_props_4.itemIcon, 
                            itemName = l_props_4.itemName, 
                            itemRobuxCost = l_props_4.itemRobuxCost, 
                            badgeType = l_props_4.virtualItemBadgeType, 
                            itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then l_props_4.virtualItemPrice else nil
                        }, 
                        userBalance = l_props_4.beforeRobuxBalance, 
                        upsellSuggestions = l_props_4.upsellSuggestions, 
                        selectedUpsellIndex = l_props_4.selectedUpsellIndex, 
                        onUpsellSuggestionsSelected = l_props_4.onUpsellSuggestionsSelected, 
                        purchaseModalType = l_props_4.unifiedProductPurchaseModalType, 
                        onBuyItemButtonMounted = l_props_4.onBuyItemButtonMounted, 
                        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_4.hideUserRobuxBalance else nil, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 358 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v73 (ref), l_props_4 (ref)
                                v73:reportUserInput("Buy");
                                l_props_4.purchaseRobux();
                                v73:closeCentralOverlay();
                            end, 
                            buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                            buyItemisDelayedInput = l_state_0.isDelayedInput, 
                            buyItemEnableInputDelayed = l_state_0.enableInputDelayed and v38() == "IN_EXPERIENCE", 
                            cancelPurchaseActivated = function() --[[ Line: 368 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v73 (ref), l_props_4 (ref)
                                v73:reportUserInput("Cancel");
                                l_props_4.cancelPurchase();
                                v73:closeCentralOverlay();
                            end, 
                            cancelControllerIcon = l_props_4.cancelControllerIcon
                        }, 
                        termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 375 ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("TermsOfService");
                            l_props_4.showTermsOfUse();
                            l_props_4.flowComplete();
                        end or nil, 
                        screenSize = l_props_4.screenSize
                    });
                end;
            elseif l_props_4.useUpsellSuggestions then
                return v34(v5.createElement(v22, {
                    product = {
                        model = l_props_4.model, 
                        itemIcon = l_props_4.itemIcon, 
                        itemName = l_props_4.itemName, 
                        itemRobuxCost = l_props_4.itemRobuxCost, 
                        badgeType = l_props_4.virtualItemBadgeType
                    }, 
                    userBalance = l_props_4.beforeRobuxBalance, 
                    upsellSuggestions = l_props_4.upsellSuggestions, 
                    selectedUpsellIndex = l_props_4.selectedUpsellIndex, 
                    onUpsellSuggestionsSelected = l_props_4.onUpsellSuggestionsSelected, 
                    buttons = {
                        buyItemActivated = function() --[[ Line: 397 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("Buy");
                            l_props_4.purchaseRobux();
                            v73:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                        buyItemisDelayedInput = l_state_0.isDelayedInput, 
                        buyItemEnableInputDelayed = l_state_0.enableInputDelayed, 
                        cancelPurchaseActivated = function() --[[ Line: 407 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("Cancel");
                            l_props_4.cancelPurchase();
                            v73:closeCentralOverlay();
                        end, 
                        cancelControllerIcon = l_props_4.cancelControllerIcon
                    }, 
                    isQuest = l_props_4.isQuest, 
                    isVng = l_props_4.isVng, 
                    screenSize = l_props_4.screenSize
                }));
            elseif v33() or v35.shouldShowNewModal() then
                return v34(v5.createElement(v21, {
                    product = {
                        model = l_props_4.model, 
                        itemIcon = l_props_4.itemIcon, 
                        itemName = l_props_4.itemName, 
                        itemRobuxCost = l_props_4.itemRobuxCost, 
                        badgeType = l_props_4.virtualItemBadgeType
                    }, 
                    upsell = {
                        balanceAmount = l_props_4.beforeRobuxBalance, 
                        robuxPurchaseAmount = l_props_4.iapRobuxAmount, 
                        robuxPurchaseCost = l_props_4.iapCostStr, 
                        robuxPurchaseAmountBeforeBonus = l_props_4.iapRobuxAmountBeforeBonus
                    }, 
                    buttons = {
                        buyItemActivated = function() --[[ Line: 435 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("Buy");
                            l_props_4.purchaseRobux();
                            v73:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                        buyItemisDelayedInput = l_state_0.isDelayedInput, 
                        buyItemEnableInputDelayed = l_state_0.enableInputDelayed, 
                        cancelPurchaseActivated = function() --[[ Line: 445 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v73 (ref), l_props_4 (ref)
                            v73:reportUserInput("Cancel");
                            l_props_4.cancelPurchase();
                            v73:closeCentralOverlay();
                        end, 
                        cancelControllerIcon = l_props_4.cancelControllerIcon, 
                        opensBuyRobuxPage = v35.getVariant() == v35.variants.OpenRobuxStore
                    }, 
                    isQuest = l_props_4.isQuest, 
                    isVng = l_props_4.isVng, 
                    termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 456 ]]
                        -- upvalues: v73 (ref), l_props_4 (ref)
                        v73:reportUserInput("TermsOfService");
                        l_props_4.showTermsOfUse();
                    end or nil, 
                    screenSize = l_props_4.screenSize
                }));
            else
                return v5.createElement(v20, {
                    screenSize = l_props_4.screenSize, 
                    isDelayedInput = l_state_0.isDelayedInput, 
                    enableInputDelayed = l_state_0.enableInputDelayed, 
                    model = l_props_4.model, 
                    itemIcon = l_props_4.itemIcon, 
                    itemName = l_props_4.itemName, 
                    itemRobuxCost = l_props_4.itemRobuxCost, 
                    robuxPurchaseAmount = l_props_4.iapRobuxAmount, 
                    robuxPurchaseAmountBeforeBonus = l_props_4.iapRobuxAmountBeforeBonus, 
                    balanceAmount = l_props_4.beforeRobuxBalance, 
                    buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                    cancelControllerIcon = l_props_4.cancelControllerIcon, 
                    itemProductId = v39 and tostring(l_props_4.itemProductId) or nil, 
                    buyItemActivated = function() --[[ Line: 480 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v73 (ref), l_props_4 (ref)
                        v73:reportUserInput("Buy");
                        l_props_4.purchaseRobux();
                        v73:closeCentralOverlay();
                    end, 
                    cancelPurchaseActivated = function() --[[ Line: 485 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v73 (ref), l_props_4 (ref)
                        v73:reportUserInput("Cancel");
                        l_props_4.cancelPurchase();
                        v73:closeCentralOverlay();
                    end, 
                    termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 490 ]]
                        -- upvalues: v73 (ref), l_props_4 (ref)
                        v73:reportUserInput("TermsOfService");
                        l_props_4.showTermsOfUse();
                    end or nil, 
                    isQuest = v73.props.isQuest, 
                    isVng = v73.props.isVng
                });
            end;
        end
    };
end;
v41.constructU13ConfirmPromptAnimatorObj = function(v76) --[[ Line: 501 ]] --[[ Name: constructU13ConfirmPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v14 (copy)
    local l_props_5 = v76.props;
    v76:BindCancelAction();
    return {
        shouldAnimate = l_props_5.shouldAnimate, 
        shouldShow = l_props_5.purchaseState == v6.PurchaseWarning, 
        renderChildren = function() --[[ Line: 509 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v14 (ref), l_props_5 (copy), v76 (copy)
            return v5.createElement(v14, {
                screenSize = l_props_5.screenSize, 
                modalType = l_props_5.u13ConfirmType, 
                doneControllerIcon = l_props_5.acceptControllerIcon, 
                cancelControllerIcon = l_props_5.cancelControllerIcon, 
                doneActivated = function() --[[ Line: 518 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v76 (ref), l_props_5 (ref)
                    v76:reportUserInput("Confirm");
                    l_props_5.acceptPurchaseWarning();
                    v76:closeCentralOverlay();
                end, 
                cancelActivated = function() --[[ Line: 523 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v76 (ref), l_props_5 (ref)
                    v76:reportUserInput("Cancel");
                    l_props_5.cancelPurchase();
                    v76:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructPurchaseErrorPromptAnimatorObj = function(v78) --[[ Line: 533 ]] --[[ Name: constructPurchaseErrorPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v13 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), v5 (copy), v48 (copy), v26 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v33 (copy), v35 (copy), v24 (copy), v12 (copy)
    local l_props_6 = v78.props;
    v78:BindCancelAction();
    return {
        shouldAnimate = l_props_6.shouldAnimate, 
        shouldShow = l_props_6.purchaseState == v6.Error, 
        renderChildren = function() --[[ Line: 541 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_props_6 (copy), v13 (ref), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (ref), v5 (ref), v48 (ref), v78 (copy), v26 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v33 (ref), v35 (ref), v24 (ref), v12 (ref)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_6.errorType == v13.NotEnoughRobuxInApp then
                if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 then
                    return (v5.createElement(v48, {
                        product = {
                            model = l_props_6.model, 
                            itemIcon = l_props_6.itemIcon, 
                            itemName = l_props_6.itemName, 
                            itemRobuxCost = l_props_6.itemRobuxCost
                        }, 
                        balanceAmount = l_props_6.beforeRobuxBalance, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 558 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v78 (ref), l_props_6 (ref)
                                v78:reportUserInput("Buy Robux");
                                l_props_6.openBuyRobux();
                                l_props_6.flowComplete();
                                v78:closeCentralOverlay();
                            end, 
                            cancelPurchaseActivated = function() --[[ Line: 564 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v78 (ref), l_props_6 (ref)
                                v78:reportUserInput("Cancel");
                                l_props_6.flowComplete();
                                v78:closeCentralOverlay();
                            end
                        }, 
                        purchaseModalType = l_props_6.unifiedProductPurchaseModalType, 
                        screenSize = l_props_6.screenSize
                    }));
                else
                    return (v5.createElement(v26, {
                        product = {
                            model = l_props_6.model, 
                            itemIcon = l_props_6.itemIcon, 
                            itemName = l_props_6.itemName, 
                            itemRobuxCost = l_props_6.itemRobuxCost
                        }, 
                        balanceAmount = l_props_6.beforeRobuxBalance, 
                        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_6.hideUserRobuxBalance else nil, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 589 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v78 (ref), l_props_6 (ref)
                                v78:reportUserInput("Buy Robux");
                                l_props_6.openBuyRobux();
                                l_props_6.flowComplete();
                                v78:closeCentralOverlay();
                            end, 
                            cancelPurchaseActivated = function() --[[ Line: 596 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v78 (ref), l_props_6 (ref)
                                v78:reportUserInput("Cancel");
                                l_props_6.flowComplete();
                                v78:closeCentralOverlay();
                            end
                        }, 
                        isQuest = l_props_6.isQuest, 
                        screenSize = l_props_6.screenSize, 
                        purchaseModalType = l_props_6.unifiedProductPurchaseModalType
                    }));
                end;
            elseif l_props_6.errorType == v13.NotEnoughRobux and (v33() or v35.shouldShowNewModal()) then
                return v5.createElement(v24, {
                    product = {
                        model = l_props_6.model, 
                        itemIcon = l_props_6.itemIcon, 
                        itemName = l_props_6.itemName, 
                        itemRobuxCost = l_props_6.itemRobuxCost
                    }, 
                    balanceAmount = l_props_6.beforeRobuxBalance, 
                    doneActivated = function() --[[ Line: 622 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v78 (ref), l_props_6 (ref)
                        v78:reportUserInput("Done");
                        l_props_6.flowComplete();
                        v78:closeCentralOverlay();
                    end, 
                    doneControllerIcon = l_props_6.acceptControllerIcon, 
                    isQuest = l_props_6.isQuest, 
                    screenSize = l_props_6.screenSize
                });
            else
                return v5.createElement(v12, {
                    screenSize = l_props_6.screenSize, 
                    errorType = l_props_6.errorType, 
                    economicRestrictionError = l_props_6.economicRestrictionError, 
                    doneControllerIcon = l_props_6.acceptControllerIcon, 
                    doneActivated = function() --[[ Line: 640 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v78 (ref), l_props_6 (ref)
                        v78:reportUserInput("Done");
                        l_props_6.flowComplete();
                        v78:closeCentralOverlay();
                    end
                });
            end;
        end
    };
end;
v41.constructTwoStepRequiredAnimatorObj = function(v80) --[[ Line: 650 ]] --[[ Name: constructTwoStepRequiredAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v15 (copy)
    local l_props_7 = v80.props;
    v80:BindCancelAction();
    return {
        shouldAnimate = l_props_7.shouldAnimate, 
        shouldShow = l_props_7.purchaseState == v6.TwoStepRequired, 
        renderChildren = function() --[[ Line: 658 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v15 (ref), l_props_7 (copy), v80 (copy)
            return v5.createElement(v15, {
                screenSize = l_props_7.screenSize, 
                doneControllerIcon = l_props_7.acceptControllerIcon, 
                openSecuritySettings = function() --[[ Line: 664 ]] --[[ Name: openSecuritySettings ]]
                    -- upvalues: v80 (ref), l_props_7 (ref)
                    v80:reportUserInput("GoToSecuritySettings");
                    l_props_7.openSecuritySettings();
                    l_props_7.flowComplete();
                    v80:closeCentralOverlay();
                end, 
                closePrompt = function() --[[ Line: 670 ]] --[[ Name: closePrompt ]]
                    -- upvalues: v80 (ref), l_props_7 (ref)
                    v80:reportUserInput("Cancel");
                    l_props_7.flowComplete();
                    v80:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructRobuxUpsellSuccessPromptAnimatorObj = function(v82) --[[ Line: 680 ]] --[[ Name: constructRobuxUpsellSuccessPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v56 (copy), v38 (copy), v5 (copy), v40 (copy), v49 (copy), v50 (copy), v19 (copy)
    local l_props_8 = v82.props;
    v82:BindCancelAction();
    return {
        shouldAnimate = l_props_8.shouldAnimate, 
        shouldShow = l_props_8.purchaseState == v6.Success, 
        renderChildren = function() --[[ Line: 688 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_props_8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v56 (ref), v38 (ref), v5 (ref), v40 (ref), v82 (copy), v49 (ref), v50 (ref), v19 (ref)
            local v84 = 0;
            local v85 = l_props_8.beforeRobuxBalance - l_props_8.itemRobuxCost;
            v84 = if v85 < 0 then v85 + l_props_8.iapRobuxAmount else v85;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_8.useUnifiedProductPurchaseModal then
                if v56 and v38() == "UA" then
                    return v5.createElement(v40, {
                        buttons = {
                            onActivated = function() --[[ Line: 699 ]] --[[ Name: onActivated ]]
                                -- upvalues: v82 (ref), l_props_8 (ref)
                                v82:reportUserInput("Done");
                                l_props_8.flowComplete();
                                v82:closeCentralOverlay();
                            end
                        }, 
                        isMultiItem = l_props_8.unifiedProductPurchaseModalType == v49.MultiItem, 
                        itemName = l_props_8.itemName
                    });
                else
                    return v5.createElement(v50, {
                        buttons = {
                            onActivated = function() --[[ Line: 711 ]] --[[ Name: onActivated ]]
                                -- upvalues: v82 (ref), l_props_8 (ref)
                                v82:reportUserInput("Done");
                                l_props_8.flowComplete();
                                v82:closeCentralOverlay();
                            end
                        }, 
                        isMultiItem = l_props_8.unifiedProductPurchaseModalType == v49.MultiItem, 
                        itemName = l_props_8.itemName
                    });
                end;
            else
                return v5.createElement(v19, {
                    screenSize = l_props_8.screenSize, 
                    model = l_props_8.model, 
                    itemIcon = l_props_8.itemIcon, 
                    itemName = l_props_8.itemName, 
                    balance = v84, 
                    confirmControllerIcon = l_props_8.acceptControllerIcon, 
                    cancelControllerIcon = l_props_8.cancelControllerIcon, 
                    doneActivated = function() --[[ Line: 730 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v82 (ref), l_props_8 (ref)
                        v82:reportUserInput("Done");
                        l_props_8.flowComplete();
                        v82:closeCentralOverlay();
                    end, 
                    equipActivated = l_props_8.equipItem and function() --[[ Line: 735 ]]
                        -- upvalues: v82 (ref), l_props_8 (ref)
                        v82:reportUserInput("Equip");
                        l_props_8.equipItem();
                        v82:closeCentralOverlay();
                    end or nil
                });
            end;
        end
    };
end;
v41.constructInsufficientRobuxAnimatorObj = function(v86) --[[ Line: 745 ]] --[[ Name: constructInsufficientRobuxAnimatorObj ]]
    -- upvalues: v6 (copy), v33 (copy), v35 (copy), v5 (copy), v23 (copy), v16 (copy)
    local l_props_9 = v86.props;
    v86:BindCancelAction();
    return {
        shouldAnimate = l_props_9.shouldAnimate, 
        shouldShow = l_props_9.purchaseState == v6.GenericPurchaseModal, 
        renderChildren = function() --[[ Line: 753 ]] --[[ Name: renderChildren ]]
            -- upvalues: v33 (ref), v35 (ref), v5 (ref), v23 (ref), l_props_9 (copy), v86 (copy), v16 (ref)
            if v33() or v35.shouldShowNewModal() then
                return v5.createElement(v23, {
                    product = {
                        model = l_props_9.model, 
                        itemIcon = l_props_9.itemIcon, 
                        itemName = l_props_9.itemName, 
                        itemRobuxCost = l_props_9.itemRobuxCost
                    }, 
                    balanceAmount = l_props_9.beforeRobuxBalance, 
                    buttons = {
                        buyItemActivated = function() --[[ Line: 765 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v86 (ref), l_props_9 (ref)
                            v86:reportUserInput("Buy Robux");
                            l_props_9.openBuyRobux();
                            l_props_9.flowComplete();
                            v86:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_9.acceptControllerIcon, 
                        cancelPurchaseActivated = function() --[[ Line: 773 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v86 (ref), l_props_9 (ref)
                            v86:reportUserInput("Cancel");
                            l_props_9.flowComplete();
                            v86:closeCentralOverlay();
                        end, 
                        cancelControllerIcon = l_props_9.cancelControllerIcon
                    }, 
                    isQuest = l_props_9.isQuest, 
                    screenSize = l_props_9.screenSize
                });
            else
                return v5.createElement(v16, {
                    screenSize = l_props_9.screenSize, 
                    robuxBalance = l_props_9.beforeRobuxBalance, 
                    buyRobux = function() --[[ Line: 789 ]] --[[ Name: buyRobux ]]
                        -- upvalues: v86 (ref), l_props_9 (ref)
                        v86:reportUserInput("Buy Robux");
                        l_props_9.openBuyRobux();
                        l_props_9.flowComplete();
                        v86:closeCentralOverlay();
                    end, 
                    closePrompt = function() --[[ Line: 795 ]] --[[ Name: closePrompt ]]
                        -- upvalues: v86 (ref), l_props_9 (ref)
                        v86:reportUserInput("Cancel");
                        l_props_9.flowComplete();
                        v86:closeCentralOverlay();
                    end
                });
            end;
        end
    };
end;
v41.constructInsufficientRobuxProductAnimatorObj = function(v88) --[[ Line: 805 ]] --[[ Name: constructInsufficientRobuxProductAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v17 (copy)
    local l_props_10 = v88.props;
    v88:BindCancelAction();
    return {
        shouldAnimate = l_props_10.shouldAnimate, 
        shouldShow = l_props_10.purchaseState == v6.LargeRobuxPurchaseModal, 
        renderChildren = function() --[[ Line: 813 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v17 (ref), l_props_10 (copy), v88 (copy)
            return v5.createElement(v17, {
                screenSize = l_props_10.screenSize, 
                model = l_props_10.model, 
                itemIcon = l_props_10.itemIcon, 
                itemName = l_props_10.itemName, 
                itemRobuxCost = l_props_10.itemRobuxCost, 
                balanceAmount = l_props_10.beforeRobuxBalance, 
                acceptControllerIcon = l_props_10.acceptControllerIcon, 
                cancelControllerIcon = l_props_10.cancelControllerIcon, 
                robuxStoreActivated = function() --[[ Line: 826 ]] --[[ Name: robuxStoreActivated ]]
                    -- upvalues: v88 (ref), l_props_10 (ref)
                    v88:reportUserInput("Go to Robux store");
                    l_props_10.openBuyRobux();
                    v88:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function() --[[ Line: 831 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v88 (ref), l_props_10 (ref)
                    v88:reportUserInput("Cancel");
                    l_props_10.flowComplete();
                    v88:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructLeaveRobloxPromptAnimatorObj = function(v90) --[[ Line: 841 ]] --[[ Name: constructLeaveRobloxPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v18 (copy)
    local l_props_11 = v90.props;
    v90:BindCancelAction();
    return {
        shouldAnimate = l_props_11.shouldAnimate, 
        shouldShow = l_props_11.purchaseState == v6.LeaveRobloxWarning, 
        renderChildren = function() --[[ Line: 849 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v18 (ref), l_props_11 (copy), v90 (copy)
            return v5.createElement(v18, {
                screenSize = l_props_11.screenSize, 
                cancelActivated = function() --[[ Line: 853 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v90 (ref)
                    v90:closeCentralOverlay();
                end, 
                continueActivated = function() --[[ Line: 856 ]] --[[ Name: continueActivated ]]
                    -- upvalues: l_props_11 (ref)
                    l_props_11.openVngShop();
                end
            });
        end
    };
end;
v41.constructPurchaseVPCPromptAnimatorObj = function(v92) --[[ Line: 864 ]] --[[ Name: constructPurchaseVPCPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_12 = v92.props;
    v92:BindCancelAction();
    return {
        shouldAnimate = l_props_12.shouldAnimate, 
        shouldShow = l_props_12.purchaseState == v6.PurchaseVPCModal, 
        renderChildren = function() --[[ Line: 872 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_12 (copy), v92 (copy)
            return v5.createElement(l_VerifiedParentalConsentDialog_0, {
                screenSize = l_props_12.screenSize, 
                isActionable = l_props_12.openSettingsPage ~= nil, 
                modalType = l_props_12.purchaseVPCType, 
                onAction = l_props_12.openSettingsPage and function() --[[ Line: 877 ]]
                    -- upvalues: v92 (ref), l_props_12 (ref)
                    v92:reportUserInput("Confirm");
                    l_props_12.openSettingsPage();
                    l_props_12.flowComplete();
                end, 
                onDismiss = function() --[[ Line: 882 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v92 (ref), l_props_12 (ref)
                    v92:reportUserInput("Cancel");
                    l_props_12.cancelPurchase();
                    v92:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.dispatchCentralOverlayAndRenderModal = function(v94, v95) --[[ Line: 894 ]] --[[ Name: dispatchCentralOverlayAndRenderModal ]]
    -- upvalues: v36 (copy), v6 (copy), v9 (copy)
    if not v36() or not v95.dispatchCentralOverlay then
        return;
    else
        local l_purchaseState_0 = v95.purchaseState;
        if l_purchaseState_0 == v6.PurchaseModal then
            v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructRobuxUpsellPromptAnimatorObj());
            return;
        else
            if l_purchaseState_0 == v6.PurchaseWarning then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructU13ConfirmPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Error then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructPurchaseErrorPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.TwoStepRequired then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructTwoStepRequiredAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Success then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructRobuxUpsellSuccessPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.GenericPurchaseModal then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructInsufficientRobuxAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LargeRobuxPurchaseModal then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructInsufficientRobuxProductAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LeaveRobloxWarning then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructLeaveRobloxPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.PurchaseVPCModal then
                v95.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v94:constructPurchaseVPCPromptAnimatorObj());
            end;
            return;
        end;
    end;
end;
v41.reportModalShown = function(v97) --[[ Line: 975 ]] --[[ Name: reportModalShown ]]
    -- upvalues: v31 (copy), v6 (copy), l_HttpService_0 (copy)
    local l_props_13 = v97.props;
    local l_state_1 = v97.state;
    if not v97.props.onAnalyticEvent then
        return;
    else
        local v100 = v31(l_state_1.analyticId, l_props_13.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_13.purchaseState), l_HttpService_0:JSONEncode({
            universe_id = tostring(game.GameId), 
            item_product_id = tostring(l_props_13.itemProductId), 
            item_name = l_props_13.itemName, 
            price = tostring(l_props_13.itemRobuxCost), 
            user_balance = tostring(l_props_13.beforeRobuxBalance) or nil, 
            package_robux_amount = tostring(l_props_13.iapRobuxAmount) or nil, 
            package_cost = l_props_13.iapCostStr or nil
        }));
        l_props_13.onAnalyticEvent("UserPurchaseFlow", v100);
        return;
    end;
end;
v41.reportUserInput = function(v101, v102) --[[ Line: 1004 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v32 (copy), v6 (copy), l_HttpService_0 (copy), l_Players_0 (copy), l_default_0 (copy), v43 (copy)
    local l_props_14 = v101.props;
    local l_state_2 = v101.state;
    local v105 = v32(l_state_2.analyticId, l_props_14.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_14.purchaseState), v102, l_HttpService_0:JSONEncode({
        universe_id = tostring(game.GameId), 
        item_product_id = tostring(l_props_14.itemProductId), 
        item_name = l_props_14.itemName, 
        price = tostring(l_props_14.itemRobuxCost), 
        user_balance = tostring(l_props_14.beforeRobuxBalance) or nil, 
        package_robux_amount = tostring(l_props_14.iapRobuxAmount) or nil, 
        package_cost = l_props_14.iapCostStr or nil
    }));
    if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and v101.props.onAnalyticEvent then
        l_props_14.onAnalyticEvent("UserPurchaseFlow", v105);
    end;
    if game:GetFastFlag("EnableSchematizedInGameRobuxUpsellEvent2") then
        local v106 = nil;
        if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then
            v106 = l_Players_0.LocalPlayer.UserId;
        end;
        l_default_0:logRobloxTelemetryEvent(v43, {
            l_default_0.StandardizedFields.addOsInfo, 
            l_default_0.StandardizedFields.addSessionId
        }, {
            universe_id = game.GameId, 
            price = l_props_14.itemRobuxCost, 
            view_name = v105.view_name, 
            purchase_event_type = v105.purchase_event_type, 
            input_type = v102, 
            user_id = tostring(v106)
        });
    end;
end;
v41.purchaseStateToOverlayState = function(_, v108) --[[ Line: 1050 ]] --[[ Name: purchaseStateToOverlayState ]]
    -- upvalues: v6 (copy), v11 (copy)
    if v108 == v6.Loading then
        return v11.Loading;
    elseif v108 == v6.RobuxPurchasePending then
        return v11.PurchasingRobux;
    elseif v108 == v6.RobuxGrantPending then
        return v11.WaitingForRobux;
    elseif v108 == v6.ItemPurchasePending then
        return v11.PurchasingItem;
    elseif v108 == v6.None then
        return nil;
    else
        return v11.None;
    end;
end;
v41.getChildrenElements = function(v109) --[[ Line: 1067 ]] --[[ Name: getChildrenElements ]]
    -- upvalues: v5 (copy), v8 (copy)
    return {
        RobuxUpsellPromptAnimator = v5.createElement(v8, v109:constructRobuxUpsellPromptAnimatorObj()), 
        U13ConfirmPromptAnimator = v5.createElement(v8, v109:constructU13ConfirmPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v5.createElement(v8, v109:constructPurchaseErrorPromptAnimatorObj()), 
        TwoStepRequiredAnimator = v5.createElement(v8, v109:constructTwoStepRequiredAnimatorObj()), 
        RobuxUpsellSuccessPromptAnimator = v5.createElement(v8, v109:constructRobuxUpsellSuccessPromptAnimatorObj()), 
        InsufficientRobuxAnimator = v5.createElement(v8, v109:constructInsufficientRobuxAnimatorObj()), 
        InsufficientRobuxProductAnimator = v5.createElement(v8, v109:constructInsufficientRobuxProductAnimatorObj()), 
        PurchaseVPCPromptAnimator = v5.createElement(v8, v109:constructPurchaseVPCPromptAnimatorObj())
    };
end;
v41.render = function(v110) --[[ Line: 1086 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), v5 (copy), v10 (copy)
    local l_props_15 = v110.props;
    local v112 = {};
    if not v36() or not l_props_15.dispatchCentralOverlay then
        v112 = v110:getChildrenElements();
    end;
    return v5.createElement(v10, {
        shouldAnimate = l_props_15.shouldAnimate, 
        loadingState = v110:purchaseStateToOverlayState(l_props_15.purchaseState)
    }, v112);
end;
return v41;