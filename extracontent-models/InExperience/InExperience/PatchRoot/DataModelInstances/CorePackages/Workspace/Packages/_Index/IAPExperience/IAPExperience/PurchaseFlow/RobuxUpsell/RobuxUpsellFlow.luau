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
local _ = require(l_Parent_1.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
v41.init = function(v58) --[[ Line: 163 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_props_0 = v58.props;
    v58.state = {
        analyticId = if l_props_0.analyticId then l_props_0.analyticId else l_HttpService_0:GenerateGUID(false), 
        isDelayedInput = l_props_0.isDelayedInput, 
        enableInputDelayed = false
    };
    v58.closeModal = function() --[[ Line: 173 ]]
        -- upvalues: v58 (copy)
        local l_props_1 = v58.props;
        v58:reportUserInput("Cancel");
        l_props_1.cancelPurchase();
        v58:closeCentralOverlay();
        v58:UnbindActions();
    end;
end;
v41.didMount = function(v61) --[[ Line: 183 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_FIntLegacyPurchaseFPSTrackingTimeout_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and (v61.props or {}).eventPrefix == "UACatalog" then
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_RobuxUpsellModalShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        l_IntervalPerformanceTracker_0:startTracking("PurchaseModal_LegacyFlowRobuxUpsellModalShown_Catalog", l_FIntLegacyPurchaseFPSTrackingTimeout_0, nil, true, true);
        local v62 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v62, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
end;
v41.didUpdate = function(v63, v64, _) --[[ Line: 212 ]] --[[ Name: didUpdate ]]
    local l_props_2 = v63.props;
    if v64.purchaseState ~= l_props_2.purchaseState then
        v63:reportModalShown();
        v63:dispatchCentralOverlayAndRenderModal(l_props_2);
    end;
end;
v41.UnbindActions = function(v67) --[[ Line: 221 ]] --[[ Name: UnbindActions ]]
    -- upvalues: v36 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v36() and v67.props.dispatchCentralOverlay then
        l_ContextActionService_0:UnbindAction(v9.CLOSE_MODAL_ACTION);
    end;
end;
v41.BindCancelAction = function(v68) --[[ Line: 227 ]] --[[ Name: BindCancelAction ]]
    -- upvalues: v36 (copy), l_ContextActionService_0 (copy), v9 (copy)
    if v36() and v68.props.dispatchCentralOverlay then
        l_ContextActionService_0:BindAction(v9.CLOSE_MODAL_ACTION, v68.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v41.closeCentralOverlay = function(v69) --[[ Line: 243 ]] --[[ Name: closeCentralOverlay ]]
    -- upvalues: v36 (copy)
    local l_props_3 = v69.props;
    if v36() and l_props_3.dispatchCentralOverlay then
        l_props_3.dispatchCentralOverlay();
    end;
end;
v41.constructRobuxUpsellPromptAnimatorObj = function(v71) --[[ Line: 251 ]] --[[ Name: constructRobuxUpsellPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), v38 (copy), v5 (copy), v47 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v25 (copy), v34 (copy), v22 (copy), v33 (copy), v35 (copy), v21 (copy), v20 (copy), v39 (copy)
    local l_props_4 = v71.props;
    local l_state_0 = v71.state;
    v71:BindCancelAction();
    return {
        shouldAnimate = l_props_4.shouldAnimate, 
        shouldShow = l_props_4.purchaseState == v6.PurchaseModal, 
        skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then l_props_4.useUnifiedProductPurchaseModal else nil, 
        onShown = l_props_4.isDelayedInput and function() --[[ Line: 263 ]]
            -- upvalues: v71 (copy), l_props_4 (copy)
            v71:setState({
                enableInputDelayed = true
            });
            delay(3, function() --[[ Line: 267 ]]
                -- upvalues: v71 (ref), l_props_4 (ref)
                v71:setState({
                    isDelayedInput = false, 
                    enableInputDelayed = false
                });
                if l_props_4.onDelayedInputComplete then
                    l_props_4.onDelayedInputComplete();
                end;
            end);
        end or nil, 
        onHidden = l_props_4.isDelayedInput and function() --[[ Line: 277 ]]
            -- upvalues: v71 (copy), l_props_4 (copy)
            v71:setState({
                isDelayedInput = l_props_4.isDelayedInput, 
                enableInputDelayed = false
            });
        end or nil, 
        renderChildren = function() --[[ Line: 283 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_props_4 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (ref), v38 (ref), v5 (ref), v47 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v71 (copy), l_state_0 (copy), v25 (ref), v34 (ref), v22 (ref), v33 (ref), v35 (ref), v21 (ref), v20 (ref), v39 (ref)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_4.useUnifiedProductPurchaseModal then
                if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v38() == "UA" then
                    return v5.createElement(v47, {
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
                        purchaseModalType = l_props_4.unifiedProductPurchaseModalType, 
                        onBuyItemButtonMounted = l_props_4.onBuyItemButtonMounted, 
                        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_4.hideUserRobuxBalance else nil, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 304 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v71 (ref), l_props_4 (ref)
                                v71:reportUserInput("Buy");
                                l_props_4.purchaseRobux();
                                v71:closeCentralOverlay();
                            end, 
                            buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                            buyItemisDelayedInput = l_state_0.isDelayedInput, 
                            buyItemEnableInputDelayed = l_state_0.enableInputDelayed and v38() == "IN_EXPERIENCE", 
                            cancelPurchaseActivated = function() --[[ Line: 312 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v71 (ref), l_props_4 (ref)
                                v71:reportUserInput("Cancel");
                                l_props_4.cancelPurchase();
                                v71:closeCentralOverlay();
                            end, 
                            cancelControllerIcon = l_props_4.cancelControllerIcon
                        }, 
                        termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 319 ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("TermsOfService");
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
                            badgeType = l_props_4.virtualItemBadgeType
                        }, 
                        userBalance = l_props_4.beforeRobuxBalance, 
                        upsellSuggestions = l_props_4.upsellSuggestions, 
                        selectedUpsellIndex = l_props_4.selectedUpsellIndex, 
                        onUpsellSuggestionsSelected = l_props_4.onUpsellSuggestionsSelected, 
                        purchaseModalType = l_props_4.unifiedProductPurchaseModalType, 
                        onBuyItemButtonMounted = l_props_4.onBuyItemButtonMounted, 
                        hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then l_props_4.hideUserRobuxBalance else nil, 
                        buttons = {
                            buyItemActivated = function() --[[ Line: 345 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v71 (ref), l_props_4 (ref)
                                v71:reportUserInput("Buy");
                                l_props_4.purchaseRobux();
                                v71:closeCentralOverlay();
                            end, 
                            buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                            buyItemisDelayedInput = l_state_0.isDelayedInput, 
                            buyItemEnableInputDelayed = l_state_0.enableInputDelayed and v38() == "IN_EXPERIENCE", 
                            cancelPurchaseActivated = function() --[[ Line: 355 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v71 (ref), l_props_4 (ref)
                                v71:reportUserInput("Cancel");
                                l_props_4.cancelPurchase();
                                v71:closeCentralOverlay();
                            end, 
                            cancelControllerIcon = l_props_4.cancelControllerIcon
                        }, 
                        termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 362 ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("TermsOfService");
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
                        buyItemActivated = function() --[[ Line: 384 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("Buy");
                            l_props_4.purchaseRobux();
                            v71:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                        buyItemisDelayedInput = l_state_0.isDelayedInput, 
                        buyItemEnableInputDelayed = l_state_0.enableInputDelayed, 
                        cancelPurchaseActivated = function() --[[ Line: 394 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("Cancel");
                            l_props_4.cancelPurchase();
                            v71:closeCentralOverlay();
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
                        buyItemActivated = function() --[[ Line: 422 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("Buy");
                            l_props_4.purchaseRobux();
                            v71:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_4.acceptControllerIcon, 
                        buyItemisDelayedInput = l_state_0.isDelayedInput, 
                        buyItemEnableInputDelayed = l_state_0.enableInputDelayed, 
                        cancelPurchaseActivated = function() --[[ Line: 432 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v71 (ref), l_props_4 (ref)
                            v71:reportUserInput("Cancel");
                            l_props_4.cancelPurchase();
                            v71:closeCentralOverlay();
                        end, 
                        cancelControllerIcon = l_props_4.cancelControllerIcon, 
                        opensBuyRobuxPage = v35.getVariant() == v35.variants.OpenRobuxStore
                    }, 
                    isQuest = l_props_4.isQuest, 
                    isVng = l_props_4.isVng, 
                    termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 443 ]]
                        -- upvalues: v71 (ref), l_props_4 (ref)
                        v71:reportUserInput("TermsOfService");
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
                    buyItemActivated = function() --[[ Line: 467 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v71 (ref), l_props_4 (ref)
                        v71:reportUserInput("Buy");
                        l_props_4.purchaseRobux();
                        v71:closeCentralOverlay();
                    end, 
                    cancelPurchaseActivated = function() --[[ Line: 472 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v71 (ref), l_props_4 (ref)
                        v71:reportUserInput("Cancel");
                        l_props_4.cancelPurchase();
                        v71:closeCentralOverlay();
                    end, 
                    termsOfUseActivated = l_props_4.showTermsOfUse and function() --[[ Line: 477 ]]
                        -- upvalues: v71 (ref), l_props_4 (ref)
                        v71:reportUserInput("TermsOfService");
                        l_props_4.showTermsOfUse();
                    end or nil, 
                    isQuest = v71.props.isQuest, 
                    isVng = v71.props.isVng
                });
            end;
        end
    };
end;
v41.constructU13ConfirmPromptAnimatorObj = function(v74) --[[ Line: 488 ]] --[[ Name: constructU13ConfirmPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v14 (copy)
    local l_props_5 = v74.props;
    v74:BindCancelAction();
    return {
        shouldAnimate = l_props_5.shouldAnimate, 
        shouldShow = l_props_5.purchaseState == v6.PurchaseWarning, 
        renderChildren = function() --[[ Line: 496 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v14 (ref), l_props_5 (copy), v74 (copy)
            return v5.createElement(v14, {
                screenSize = l_props_5.screenSize, 
                modalType = l_props_5.u13ConfirmType, 
                doneControllerIcon = l_props_5.acceptControllerIcon, 
                cancelControllerIcon = l_props_5.cancelControllerIcon, 
                doneActivated = function() --[[ Line: 505 ]] --[[ Name: doneActivated ]]
                    -- upvalues: v74 (ref), l_props_5 (ref)
                    v74:reportUserInput("Confirm");
                    l_props_5.acceptPurchaseWarning();
                    v74:closeCentralOverlay();
                end, 
                cancelActivated = function() --[[ Line: 510 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v74 (ref), l_props_5 (ref)
                    v74:reportUserInput("Cancel");
                    l_props_5.cancelPurchase();
                    v74:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructPurchaseErrorPromptAnimatorObj = function(v76) --[[ Line: 520 ]] --[[ Name: constructPurchaseErrorPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v13 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), v5 (copy), v48 (copy), v26 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v33 (copy), v35 (copy), v24 (copy), v12 (copy)
    local l_props_6 = v76.props;
    v76:BindCancelAction();
    return {
        shouldAnimate = l_props_6.shouldAnimate, 
        shouldShow = l_props_6.purchaseState == v6.Error, 
        renderChildren = function() --[[ Line: 528 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_props_6 (copy), v13 (ref), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (ref), v5 (ref), v48 (ref), v76 (copy), v26 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v33 (ref), v35 (ref), v24 (ref), v12 (ref)
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
                            buyItemActivated = function() --[[ Line: 545 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v76 (ref), l_props_6 (ref)
                                v76:reportUserInput("Buy Robux");
                                l_props_6.openBuyRobux();
                                l_props_6.flowComplete();
                                v76:closeCentralOverlay();
                            end, 
                            cancelPurchaseActivated = function() --[[ Line: 551 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v76 (ref), l_props_6 (ref)
                                v76:reportUserInput("Cancel");
                                l_props_6.flowComplete();
                                v76:closeCentralOverlay();
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
                            buyItemActivated = function() --[[ Line: 576 ]] --[[ Name: buyItemActivated ]]
                                -- upvalues: v76 (ref), l_props_6 (ref)
                                v76:reportUserInput("Buy Robux");
                                l_props_6.openBuyRobux();
                                l_props_6.flowComplete();
                                v76:closeCentralOverlay();
                            end, 
                            cancelPurchaseActivated = function() --[[ Line: 583 ]] --[[ Name: cancelPurchaseActivated ]]
                                -- upvalues: v76 (ref), l_props_6 (ref)
                                v76:reportUserInput("Cancel");
                                l_props_6.flowComplete();
                                v76:closeCentralOverlay();
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
                    doneActivated = function() --[[ Line: 609 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v76 (ref), l_props_6 (ref)
                        v76:reportUserInput("Done");
                        l_props_6.flowComplete();
                        v76:closeCentralOverlay();
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
                    doneActivated = function() --[[ Line: 627 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v76 (ref), l_props_6 (ref)
                        v76:reportUserInput("Done");
                        l_props_6.flowComplete();
                        v76:closeCentralOverlay();
                    end
                });
            end;
        end
    };
end;
v41.constructTwoStepRequiredAnimatorObj = function(v78) --[[ Line: 637 ]] --[[ Name: constructTwoStepRequiredAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v15 (copy)
    local l_props_7 = v78.props;
    v78:BindCancelAction();
    return {
        shouldAnimate = l_props_7.shouldAnimate, 
        shouldShow = l_props_7.purchaseState == v6.TwoStepRequired, 
        renderChildren = function() --[[ Line: 645 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v15 (ref), l_props_7 (copy), v78 (copy)
            return v5.createElement(v15, {
                screenSize = l_props_7.screenSize, 
                doneControllerIcon = l_props_7.acceptControllerIcon, 
                openSecuritySettings = function() --[[ Line: 651 ]] --[[ Name: openSecuritySettings ]]
                    -- upvalues: v78 (ref), l_props_7 (ref)
                    v78:reportUserInput("GoToSecuritySettings");
                    l_props_7.openSecuritySettings();
                    l_props_7.flowComplete();
                    v78:closeCentralOverlay();
                end, 
                closePrompt = function() --[[ Line: 657 ]] --[[ Name: closePrompt ]]
                    -- upvalues: v78 (ref), l_props_7 (ref)
                    v78:reportUserInput("Cancel");
                    l_props_7.flowComplete();
                    v78:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructRobuxUpsellSuccessPromptAnimatorObj = function(v80) --[[ Line: 667 ]] --[[ Name: constructRobuxUpsellSuccessPromptAnimatorObj ]]
    -- upvalues: v6 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v56 (copy), v38 (copy), v5 (copy), v40 (copy), v49 (copy), v50 (copy), v19 (copy)
    local l_props_8 = v80.props;
    v80:BindCancelAction();
    return {
        shouldAnimate = l_props_8.shouldAnimate, 
        shouldShow = l_props_8.purchaseState == v6.Success, 
        renderChildren = function() --[[ Line: 675 ]] --[[ Name: renderChildren ]]
            -- upvalues: l_props_8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v56 (ref), v38 (ref), v5 (ref), v40 (ref), v80 (copy), v49 (ref), v50 (ref), v19 (ref)
            local v82 = 0;
            local v83 = l_props_8.beforeRobuxBalance - l_props_8.itemRobuxCost;
            v82 = if v83 < 0 then v83 + l_props_8.iapRobuxAmount else v83;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_props_8.useUnifiedProductPurchaseModal then
                if v56 and v38() == "UA" then
                    return v5.createElement(v40, {
                        buttons = {
                            onActivated = function() --[[ Line: 686 ]] --[[ Name: onActivated ]]
                                -- upvalues: v80 (ref), l_props_8 (ref)
                                v80:reportUserInput("Done");
                                l_props_8.flowComplete();
                                v80:closeCentralOverlay();
                            end
                        }, 
                        isMultiItem = l_props_8.unifiedProductPurchaseModalType == v49.MultiItem, 
                        itemName = l_props_8.itemName
                    });
                else
                    return v5.createElement(v50, {
                        buttons = {
                            onActivated = function() --[[ Line: 698 ]] --[[ Name: onActivated ]]
                                -- upvalues: v80 (ref), l_props_8 (ref)
                                v80:reportUserInput("Done");
                                l_props_8.flowComplete();
                                v80:closeCentralOverlay();
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
                    balance = v82, 
                    confirmControllerIcon = l_props_8.acceptControllerIcon, 
                    cancelControllerIcon = l_props_8.cancelControllerIcon, 
                    doneActivated = function() --[[ Line: 717 ]] --[[ Name: doneActivated ]]
                        -- upvalues: v80 (ref), l_props_8 (ref)
                        v80:reportUserInput("Done");
                        l_props_8.flowComplete();
                        v80:closeCentralOverlay();
                    end, 
                    equipActivated = l_props_8.equipItem and function() --[[ Line: 722 ]]
                        -- upvalues: v80 (ref), l_props_8 (ref)
                        v80:reportUserInput("Equip");
                        l_props_8.equipItem();
                        v80:closeCentralOverlay();
                    end or nil
                });
            end;
        end
    };
end;
v41.constructInsufficientRobuxAnimatorObj = function(v84) --[[ Line: 732 ]] --[[ Name: constructInsufficientRobuxAnimatorObj ]]
    -- upvalues: v6 (copy), v33 (copy), v35 (copy), v5 (copy), v23 (copy), v16 (copy)
    local l_props_9 = v84.props;
    v84:BindCancelAction();
    return {
        shouldAnimate = l_props_9.shouldAnimate, 
        shouldShow = l_props_9.purchaseState == v6.GenericPurchaseModal, 
        renderChildren = function() --[[ Line: 740 ]] --[[ Name: renderChildren ]]
            -- upvalues: v33 (ref), v35 (ref), v5 (ref), v23 (ref), l_props_9 (copy), v84 (copy), v16 (ref)
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
                        buyItemActivated = function() --[[ Line: 752 ]] --[[ Name: buyItemActivated ]]
                            -- upvalues: v84 (ref), l_props_9 (ref)
                            v84:reportUserInput("Buy Robux");
                            l_props_9.openBuyRobux();
                            l_props_9.flowComplete();
                            v84:closeCentralOverlay();
                        end, 
                        buyItemControllerIcon = l_props_9.acceptControllerIcon, 
                        cancelPurchaseActivated = function() --[[ Line: 760 ]] --[[ Name: cancelPurchaseActivated ]]
                            -- upvalues: v84 (ref), l_props_9 (ref)
                            v84:reportUserInput("Cancel");
                            l_props_9.flowComplete();
                            v84:closeCentralOverlay();
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
                    buyRobux = function() --[[ Line: 776 ]] --[[ Name: buyRobux ]]
                        -- upvalues: v84 (ref), l_props_9 (ref)
                        v84:reportUserInput("Buy Robux");
                        l_props_9.openBuyRobux();
                        l_props_9.flowComplete();
                        v84:closeCentralOverlay();
                    end, 
                    closePrompt = function() --[[ Line: 782 ]] --[[ Name: closePrompt ]]
                        -- upvalues: v84 (ref), l_props_9 (ref)
                        v84:reportUserInput("Cancel");
                        l_props_9.flowComplete();
                        v84:closeCentralOverlay();
                    end
                });
            end;
        end
    };
end;
v41.constructInsufficientRobuxProductAnimatorObj = function(v86) --[[ Line: 792 ]] --[[ Name: constructInsufficientRobuxProductAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v17 (copy)
    local l_props_10 = v86.props;
    v86:BindCancelAction();
    return {
        shouldAnimate = l_props_10.shouldAnimate, 
        shouldShow = l_props_10.purchaseState == v6.LargeRobuxPurchaseModal, 
        renderChildren = function() --[[ Line: 800 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v17 (ref), l_props_10 (copy), v86 (copy)
            return v5.createElement(v17, {
                screenSize = l_props_10.screenSize, 
                model = l_props_10.model, 
                itemIcon = l_props_10.itemIcon, 
                itemName = l_props_10.itemName, 
                itemRobuxCost = l_props_10.itemRobuxCost, 
                balanceAmount = l_props_10.beforeRobuxBalance, 
                acceptControllerIcon = l_props_10.acceptControllerIcon, 
                cancelControllerIcon = l_props_10.cancelControllerIcon, 
                robuxStoreActivated = function() --[[ Line: 813 ]] --[[ Name: robuxStoreActivated ]]
                    -- upvalues: v86 (ref), l_props_10 (ref)
                    v86:reportUserInput("Go to Robux store");
                    l_props_10.openBuyRobux();
                    v86:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function() --[[ Line: 818 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v86 (ref), l_props_10 (ref)
                    v86:reportUserInput("Cancel");
                    l_props_10.flowComplete();
                    v86:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.constructLeaveRobloxPromptAnimatorObj = function(v88) --[[ Line: 828 ]] --[[ Name: constructLeaveRobloxPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), v18 (copy)
    local l_props_11 = v88.props;
    v88:BindCancelAction();
    return {
        shouldAnimate = l_props_11.shouldAnimate, 
        shouldShow = l_props_11.purchaseState == v6.LeaveRobloxWarning, 
        renderChildren = function() --[[ Line: 836 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), v18 (ref), l_props_11 (copy), v88 (copy)
            return v5.createElement(v18, {
                screenSize = l_props_11.screenSize, 
                cancelActivated = function() --[[ Line: 840 ]] --[[ Name: cancelActivated ]]
                    -- upvalues: v88 (ref)
                    v88:closeCentralOverlay();
                end, 
                continueActivated = function() --[[ Line: 843 ]] --[[ Name: continueActivated ]]
                    -- upvalues: l_props_11 (ref)
                    l_props_11.openVngShop();
                end
            });
        end
    };
end;
v41.constructPurchaseVPCPromptAnimatorObj = function(v90) --[[ Line: 851 ]] --[[ Name: constructPurchaseVPCPromptAnimatorObj ]]
    -- upvalues: v6 (copy), v5 (copy), l_VerifiedParentalConsentDialog_0 (copy)
    local l_props_12 = v90.props;
    v90:BindCancelAction();
    return {
        shouldAnimate = l_props_12.shouldAnimate, 
        shouldShow = l_props_12.purchaseState == v6.PurchaseVPCModal, 
        renderChildren = function() --[[ Line: 859 ]] --[[ Name: renderChildren ]]
            -- upvalues: v5 (ref), l_VerifiedParentalConsentDialog_0 (ref), l_props_12 (copy), v90 (copy)
            return v5.createElement(l_VerifiedParentalConsentDialog_0, {
                screenSize = l_props_12.screenSize, 
                isActionable = l_props_12.openSettingsPage ~= nil, 
                modalType = l_props_12.purchaseVPCType, 
                onAction = l_props_12.openSettingsPage and function() --[[ Line: 864 ]]
                    -- upvalues: v90 (ref), l_props_12 (ref)
                    v90:reportUserInput("Confirm");
                    l_props_12.openSettingsPage();
                    l_props_12.flowComplete();
                end, 
                onDismiss = function() --[[ Line: 869 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v90 (ref), l_props_12 (ref)
                    v90:reportUserInput("Cancel");
                    l_props_12.cancelPurchase();
                    v90:closeCentralOverlay();
                end
            });
        end
    };
end;
v41.dispatchCentralOverlayAndRenderModal = function(v92, v93) --[[ Line: 881 ]] --[[ Name: dispatchCentralOverlayAndRenderModal ]]
    -- upvalues: v36 (copy), v6 (copy), v9 (copy)
    if not v36() or not v93.dispatchCentralOverlay then
        return;
    else
        local l_purchaseState_0 = v93.purchaseState;
        if l_purchaseState_0 == v6.PurchaseModal then
            v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructRobuxUpsellPromptAnimatorObj());
            return;
        else
            if l_purchaseState_0 == v6.PurchaseWarning then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructU13ConfirmPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Error then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructPurchaseErrorPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.TwoStepRequired then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructTwoStepRequiredAnimatorObj());
            end;
            if l_purchaseState_0 == v6.Success then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructRobuxUpsellSuccessPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.GenericPurchaseModal then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructInsufficientRobuxAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LargeRobuxPurchaseModal then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructInsufficientRobuxProductAnimatorObj());
            end;
            if l_purchaseState_0 == v6.LeaveRobloxWarning then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructLeaveRobloxPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v6.PurchaseVPCModal then
                v93.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v92:constructPurchaseVPCPromptAnimatorObj());
            end;
            return;
        end;
    end;
end;
v41.reportModalShown = function(v95) --[[ Line: 962 ]] --[[ Name: reportModalShown ]]
    -- upvalues: v31 (copy), v6 (copy), l_HttpService_0 (copy)
    local l_props_13 = v95.props;
    local l_state_1 = v95.state;
    if not v95.props.onAnalyticEvent then
        return;
    else
        local v98 = v31(l_state_1.analyticId, l_props_13.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_13.purchaseState), l_HttpService_0:JSONEncode({
            universe_id = tostring(game.GameId), 
            item_product_id = tostring(l_props_13.itemProductId), 
            item_name = l_props_13.itemName, 
            price = tostring(l_props_13.itemRobuxCost), 
            user_balance = tostring(l_props_13.beforeRobuxBalance) or nil, 
            package_robux_amount = tostring(l_props_13.iapRobuxAmount) or nil, 
            package_cost = l_props_13.iapCostStr or nil
        }));
        l_props_13.onAnalyticEvent("UserPurchaseFlow", v98);
        return;
    end;
end;
v41.reportUserInput = function(v99, v100) --[[ Line: 991 ]] --[[ Name: reportUserInput ]]
    -- upvalues: v32 (copy), v6 (copy), l_HttpService_0 (copy), l_Players_0 (copy), l_default_0 (copy), v43 (copy)
    local l_props_14 = v99.props;
    local l_state_2 = v99.state;
    local v103 = v32(l_state_2.analyticId, l_props_14.eventPrefix, "RobuxUpsell", v6.toRawValue(l_props_14.purchaseState), v100, l_HttpService_0:JSONEncode({
        universe_id = tostring(game.GameId), 
        item_product_id = tostring(l_props_14.itemProductId), 
        item_name = l_props_14.itemName, 
        price = tostring(l_props_14.itemRobuxCost), 
        user_balance = tostring(l_props_14.beforeRobuxBalance) or nil, 
        package_robux_amount = tostring(l_props_14.iapRobuxAmount) or nil, 
        package_cost = l_props_14.iapCostStr or nil
    }));
    if not game:GetFastFlag("DisableNonSchematizedInGameRobuxUpsellEvent") and v99.props.onAnalyticEvent then
        l_props_14.onAnalyticEvent("UserPurchaseFlow", v103);
    end;
    if game:GetFastFlag("EnableSchematizedInGameRobuxUpsellEvent2") then
        local v104 = nil;
        if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then
            v104 = l_Players_0.LocalPlayer.UserId;
        end;
        l_default_0:logRobloxTelemetryEvent(v43, {
            l_default_0.StandardizedFields.addOsInfo, 
            l_default_0.StandardizedFields.addSessionId
        }, {
            universe_id = game.GameId, 
            price = l_props_14.itemRobuxCost, 
            view_name = v103.view_name, 
            purchase_event_type = v103.purchase_event_type, 
            input_type = v100, 
            user_id = tostring(v104)
        });
    end;
end;
v41.purchaseStateToOverlayState = function(_, v106) --[[ Line: 1037 ]] --[[ Name: purchaseStateToOverlayState ]]
    -- upvalues: v6 (copy), v11 (copy)
    if v106 == v6.Loading then
        return v11.Loading;
    elseif v106 == v6.RobuxPurchasePending then
        return v11.PurchasingRobux;
    elseif v106 == v6.RobuxGrantPending then
        return v11.WaitingForRobux;
    elseif v106 == v6.ItemPurchasePending then
        return v11.PurchasingItem;
    elseif v106 == v6.None then
        return nil;
    else
        return v11.None;
    end;
end;
v41.getChildrenElements = function(v107) --[[ Line: 1054 ]] --[[ Name: getChildrenElements ]]
    -- upvalues: v5 (copy), v8 (copy)
    return {
        RobuxUpsellPromptAnimator = v5.createElement(v8, v107:constructRobuxUpsellPromptAnimatorObj()), 
        U13ConfirmPromptAnimator = v5.createElement(v8, v107:constructU13ConfirmPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v5.createElement(v8, v107:constructPurchaseErrorPromptAnimatorObj()), 
        TwoStepRequiredAnimator = v5.createElement(v8, v107:constructTwoStepRequiredAnimatorObj()), 
        RobuxUpsellSuccessPromptAnimator = v5.createElement(v8, v107:constructRobuxUpsellSuccessPromptAnimatorObj()), 
        InsufficientRobuxAnimator = v5.createElement(v8, v107:constructInsufficientRobuxAnimatorObj()), 
        InsufficientRobuxProductAnimator = v5.createElement(v8, v107:constructInsufficientRobuxProductAnimatorObj()), 
        PurchaseVPCPromptAnimator = v5.createElement(v8, v107:constructPurchaseVPCPromptAnimatorObj())
    };
end;
v41.render = function(v108) --[[ Line: 1073 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), v5 (copy), v10 (copy)
    local l_props_15 = v108.props;
    local v110 = {};
    if not v36() or not l_props_15.dispatchCentralOverlay then
        v110 = v108:getChildrenElements();
    end;
    return v5.createElement(v10, {
        shouldAnimate = l_props_15.shouldAnimate, 
        loadingState = v108:purchaseStateToOverlayState(l_props_15.purchaseState)
    }, v110);
end;
return v41;