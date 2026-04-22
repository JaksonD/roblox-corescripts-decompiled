local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local v6 = require(l_Parent_0.React);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v9 = require(l_Parent_0.CachedPolicyService);
local v10 = require(l_Parent_0.RobloxTranslator);
local _ = require(l_Parent_0.Foundation);
local l_UIBlox_0 = v4.UIBlox;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v16 = require(l_Parent_0.IAPExperience);
local l_ProductPurchase_0 = v16.ProductPurchase;
local l_ProductPurchaseRobuxUpsell_0 = v16.ProductPurchaseRobuxUpsell;
local l_LeaveRobloxAlert_0 = v16.LeaveRobloxAlert;
local l_Animator_0 = v16.Animator;
local l_UnifiedProductPurchaseModal_0 = v16.UnifiedProductPurchaseModal;
local l_UnifiedProductPurchaseModalV2_0 = v16.UnifiedProductPurchaseModalV2;
local v23 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local v24 = require(l_script_FirstAncestor_0.Utils.getBlackbirdUpsellBannerProductInfo);
local l_RobloxSubscriptionFlowCompleteReason_0 = v23.RobloxSubscriptionFlowCompleteReason;
local l_SurfaceName_0 = v23.SurfaceName;
local l_SurfaceContext_0 = v23.SurfaceContext;
local l_PurchaseClientSessionIdType_0 = v23.PurchaseClientSessionIdType;
local v29 = require(l_script_FirstAncestor_0.Actions.SetWindowState);
local v30 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v31 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v32 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v33 = require(l_script_FirstAncestor_0.Enums.WindowState);
local v34 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v36 = require(l_script_FirstAncestor_0.Thunks.hideWindow);
local v37 = require(l_script_FirstAncestor_0.Thunks.retryPurchaseAfterUpsell);
local v38 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v39 = require(l_script_FirstAncestor_0.Thunks.purchaseItem);
local v40 = require(l_script_FirstAncestor_0.Thunks.completePurchase);
local v41 = require(l_script_FirstAncestor_0.Thunks.launchRobuxUpsell);
local v42 = require(l_script_FirstAncestor_0.Thunks.openSecuritySettings);
local v43 = require(l_script_FirstAncestor_0.Utils.isMockingPurchases);
local v44 = require(l_script_FirstAncestor_0.connectToStore);
local v45 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v46 = require(l_script_FirstAncestor_0.Utils.PublishAssetAnalytics);
local v47 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v48 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v49 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v50 = require(l_script_FirstAncestor_0.Utils.isGenericChallengeResponse);
local v51 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_ProductPurchaseSurface_0 = require(l_Parent_0.PurchasePromptLite).Enums.ProductPurchaseSurface;
local v53 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v54 = require(l_script_FirstAncestor_0.Utils.emitPerformanceMetrics);
local v55 = require(l_script_FirstAncestor_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_0.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v57 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v58 = require(script.Parent.Animator);
local v59 = require(l_Parent_0.SharedFlags);
local l_FFlagAddCursorProviderToPurchasePromptApp_0 = v59.FFlagAddCursorProviderToPurchasePromptApp;
local v61 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice);
local v62 = require(l_script_FirstAncestor_0.Utils.getUnifiedPurchaseModalType);
local v63 = require(l_script_FirstAncestor_0.Selectors.selectProductPrice);
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = v59.FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local v65 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then require(l_script_FirstAncestor_0.Selectors.selectPrice) else nil;
local v66 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local l_HttpService_0 = game:GetService("HttpService");
local v68 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v69 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v70 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v71 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v72 = require(l_script_FirstAncestor_0.Misc.Constants);
local v73 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v74 = require(l_Parent_0.LoggingProtocol);
local v75 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v76 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v77 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_DesktopUpsellExperiment_0 = v16.Utility.DesktopUpsellExperiment;
local l_ProductPurchaseModal_0 = v16.ProductPurchaseModal;
local l_RobuxUpsellModal_0 = v16.RobuxUpsellModal;
local l_RobuxUpsellModalTooExpensiveFallback_0 = v16.RobuxUpsellModalTooExpensiveFallback;
local v82 = require(l_script_FirstAncestor_0.Utils.shouldShowBlackbirdUpsell);
local v83 = l_Roact_0.Component:extend(script.Name);
local v84 = require(script.Parent.ProductPurchasePrompt);
local v85 = require(l_Parent_0.SharedFlags);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = v85.GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v85.FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseModalTypeEnum_0 = v16.Enums.UnifiedPurchaseModalTypeEnum;
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local l_FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry;
local v99 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true);
local l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 = v16.Flags.FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_Parent_0.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local l_FFlagPurchaseModalTimedOptionExtension_0 = require(l_Parent_0.SharedFlags).FFlagPurchaseModalTimedOptionExtension;
local l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal;
local l_FFlagEnableBlackbirdUpsellImpressionGating_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellImpressionGating;
local v105 = require(l_script_FirstAncestor_0.Utils.BlackbirdUpsellImpressionTracker);
local function v110(v106, v107, v108) --[[ Line: 168 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v32 (copy), v30 (copy), v31 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v108 == v32.InitializingPurchase and v107 == v30.RobuxUpsellV2 then
        return true;
    elseif v107 == v30.RobuxUpsellV2 or v107 == v30.LargeRobuxUpsell then
        return false;
    else
        local v109 = true;
        if v106 ~= v31.Asset then
            v109 = true;
            if v106 ~= v31.Bundle then
                v109 = true;
                if v106 ~= v31.GamePass then
                    v109 = true;
                    if v106 ~= v31.Product then
                        v109 = true;
                        if v106 ~= v31.AvatarCreationFee then
                            v109 = l_FFlagEnableUnifiedProductPurchaseFlow_0 and v106 == v31.Experience or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v106 == v31.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v106 == v31.DeveloperSubscription;
                        end;
                    end;
                end;
            end;
        end;
        return v109;
    end;
end;
local function _(v111, v112, v113) --[[ Line: 191 ]] --[[ Name: getIsFiatProduct ]]
    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v31 (copy)
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v111 == v31.DeveloperSubscription then
        local v114 = false;
        if v112.displayPrice ~= nil then
            v114 = v113 == 0;
        end;
        return v114;
    else
        return false;
    end;
end;
local function _(v116) --[[ Line: 199 ]] --[[ Name: promptStateToViewName ]]
    -- upvalues: v32 (copy)
    return ({
        [v32.RobuxUpsell] = "PurchaseModal", 
        [v32.UpsellInProgress] = "RobuxPurchasePending"
    })[v116];
end;
v83.init = function(v118) --[[ Line: 207 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v73 (copy), v74 (copy), v75 (copy), v9 (copy), v32 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v70 (copy), v99 (copy), l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 (copy), v77 (copy), l_Players_0 (copy), v110 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v53 (copy), v76 (copy), v71 (copy), v34 (copy), v50 (copy), v31 (copy), v46 (copy), v33 (copy), l_ContextActionService_0 (copy), v57 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v54 (copy), v72 (copy)
    v118.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false, 
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    if not v73 then
        v118.props.setPurchaseFlowUUID(l_HttpService_0:GenerateGUID(false));
        v74.default:logRobloxTelemetryCounter(v75.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerInit"
        });
    end;
    coroutine.wrap(function() --[[ Line: 226 ]]
        -- upvalues: v9 (ref), v118 (copy)
        if v9:IsSubjectToChinaPolicies() then
            v118:setState({
                isLuobu = true
            });
        end;
    end)();
    v118.emitPurchaseFlowEvent = function(v119, v120) --[[ Line: 237 ]]
        -- upvalues: v118 (copy), v32 (ref), l_HttpService_0 (ref)
        local l_promptState_0 = v118.props.promptState;
        local v122 = ({
            [v32.RobuxUpsell] = "PurchaseModal", 
            [v32.UpsellInProgress] = "RobuxPurchasePending"
        })[l_promptState_0];
        if not v122 then
            return;
        else
            l_promptState_0 = {
                purchase_flow_uuid = v118.props.purchaseFlowUUID, 
                purchase_flow = "InGameRobuxUpsell", 
                view_name = v122, 
                purchase_event_type = v119, 
                input_type = v120, 
                event_metadata = l_HttpService_0:JSONEncode({
                    universe_id = tostring(game.GameId), 
                    item_product_id = tostring(v118.props.productInfo.productId), 
                    item_name = v118.props.productInfo.name, 
                    price = tostring(v118.props.productInfo.price), 
                    user_balance = tostring(v118.props.accountInfo.balance) or nil, 
                    package_robux_amount = tostring(v118.props.robuxPurchaseAmount) or nil
                })
            };
            v118.props.onAnalyticEvent("UserPurchaseFlow", l_promptState_0);
            return;
        end;
    end;
    v118.emitUnifiedProductPurchaseFlowEvent = function(v123) --[[ Line: 261 ]]
        -- upvalues: v118 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v70 (ref)
        local v124 = v118.props.purchaseAnalyticsMetadata or {};
        local v125 = {
            event_name = v123, 
            purchase_flow_uuid = v124.purchaseFlowUUID, 
            product_id = v124.productId, 
            product_type = v124.productType, 
            product_target_id = v124.productTargetId, 
            robux_price = v124.price, 
            surface = v124.surface, 
            user_roblox_balance = v124.userRobuxBalance, 
            salelocation_universeid = v124.saleLocationUniverseId, 
            product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v124.productUniverseId else nil
        };
        v70(v125);
    end;
    v118.changeScreenSize = function(v126) --[[ Line: 280 ]]
        -- upvalues: v118 (copy)
        if v118.state.screenSize ~= v126.AbsoluteSize then
            v118:setState({
                screenSize = v126.AbsoluteSize
            });
        end;
    end;
    v118.hasDelayedInput = function() --[[ Line: 288 ]]
        -- upvalues: v99 (ref), v118 (copy), l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 (ref), v32 (ref)
        if not v99 and v118.props.isTestPurchase then
            return false;
        else
            local l_promptState_1 = v118.props.promptState;
            if l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 and l_promptState_1 == v32.PromptPurchase and v118.buyButtonUsesFoundationInputDelay then
                return true;
            elseif v99 then
                local v128 = true;
                if l_promptState_1 ~= v32.PurchaseInProgress then
                    v128 = true;
                    if l_promptState_1 ~= v32.RobuxUpsell then
                        v128 = l_promptState_1 == v32.UpsellInProgress;
                    end;
                end;
                return v128;
            else
                local v129 = true;
                if l_promptState_1 ~= v32.PromptPurchase then
                    v129 = true;
                    if l_promptState_1 ~= v32.PurchaseInProgress then
                        v129 = true;
                        if l_promptState_1 ~= v32.RobuxUpsell then
                            v129 = l_promptState_1 == v32.UpsellInProgress;
                        end;
                    end;
                end;
                return v129;
            end;
        end;
    end;
    v118.isWindowShowAndDoneAnimating = function() --[[ Line: 324 ]]
        -- upvalues: v118 (copy)
        return v118.state.isAnimating == false;
    end;
    v118.buyButtonUsesFoundationInputDelay = v77.get() == v77.Enum.IN_EXPERIENCE;
    v118.canConfirmInput = function() --[[ Line: 334 ]]
        -- upvalues: l_Players_0 (ref), v118 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v130 = v118.isWindowShowAndDoneAnimating();
            if v118.hasDelayedInput() then
                local v131 = false;
                if v118.state.doneAnimatingTime then
                    v131 = os.clock() - v118.state.doneAnimatingTime > 2.5;
                end;
                return v130 and v131;
            else
                return v130;
            end;
        end;
    end;
    v118.getConfirmButtonAction = function(v132, v133, v134) --[[ Line: 359 ]]
        -- upvalues: v32 (ref), v110 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v118 (copy), v53 (ref), v76 (ref), v71 (ref), v34 (ref), v50 (ref)
        if v132 == v32.None or not v110(v133) then
            return nil;
        elseif v132 == v32.PromptPurchase or v132 == v32.PurchaseInProgress then
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v118.props.isUserEligibleForUnifiedPurchaseFlow then
                local v135 = v118.props.purchaseAnalyticsMetadata or {};
                v53(v76.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v135.surface, v135.productType);
                v118.emitUnifiedProductPurchaseFlowEvent(v71.BuyItemModalBuyClicked);
            end;
            return v118.props.onBuy;
        elseif v132 == v32.RobuxUpsell or v132 == v32.UpsellInProgress or v132 == v32.LeaveRobloxWarning then
            return v118.props.onRobuxUpsell;
        elseif v132 == v32.U13PaymentModal or v132 == v32.U13MonthlyThreshold1Modal or v132 == v32.U13MonthlyThreshold2Modal or v132 == v32.ParentalConsentWarningPaymentModal13To17 then
            return v118.props.onScaryModalConfirm;
        elseif v132 == v32.Error and v134 == v34.TwoFactorNeededSettings then
            return v118.props.onOpenSecuritySettings;
        elseif v50(v134) then
            return function() --[[ Line: 391 ]]
                -- upvalues: v118 (ref), v134 (copy)
                v118.props.onOpenSecuritySettings(v134);
            end;
        else
            return v118.props.hideWindow;
        end;
    end;
    v118.getCancelButtonAction = function(v136, v137) --[[ Line: 399 ]]
        -- upvalues: v32 (ref), v110 (ref), v118 (copy)
        if v136 == v32.None or not v110(v137) then
            return nil;
        else
            return v118.props.hideWindow;
        end;
    end;
    v118.confirmButtonPressed = function() --[[ Line: 407 ]]
        -- upvalues: v118 (copy), v31 (ref), v32 (ref), v46 (ref)
        if v118.props.requestType == v31.AvatarCreationFee and v118.props.promptState == v32.PromptPurchase then
            v46.sendButtonClicked(v46.Section.BuyItemModal, v46.Element.Buy);
        end;
        local v138 = v118.getConfirmButtonAction(v118.props.promptState, v118.props.requestType, v118.props.purchaseError);
        if v138 ~= nil and v118.canConfirmInput() then
            v138();
        end;
    end;
    v118.cancelButtonPressed = function() --[[ Line: 424 ]]
        -- upvalues: v118 (copy), v31 (ref), v32 (ref), v46 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v53 (ref), v76 (ref)
        if v118.props.requestType == v31.AvatarCreationFee and v118.props.promptState == v32.PromptPurchase then
            v46.sendButtonClicked(v46.Section.BuyItemModal, v46.Element.Cancel);
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v118.props.isUserEligibleForUnifiedPurchaseFlow then
            v53(v76.UnifiedProductPurchaseModalCancelButtonClickedCounter, v118.props.purchaseAnalyticsMetadata.surface, v118.props.purchaseAnalyticsMetadata.productType);
        end;
        local v139 = v118.getCancelButtonAction(v118.props.promptState, v118.props.requestType);
        if v139 ~= nil then
            v139();
        end;
    end;
    v118.configContextActionService = function(v140) --[[ Line: 449 ]]
        -- upvalues: v33 (ref), l_ContextActionService_0 (ref), v118 (copy)
        if v140 == v33.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v142, _) --[[ Line: 451 ]]
                -- upvalues: v118 (ref)
                if v142 == Enum.UserInputState.Begin then
                    v118.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v145, _) --[[ Line: 456 ]]
                -- upvalues: v118 (ref)
                if v145 == Enum.UserInputState.Begin then
                    v118.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v118.getVPCModalType = function(v147) --[[ Line: 467 ]]
        -- upvalues: v32 (ref), v57 (ref)
        if v147 == v32.EnablePurchaseVPCModal then
            return v57.toRawValue(v57.EnablePurchase);
        else
            return v57.toRawValue(v57.None);
        end;
    end;
    v118.onBuyItemButtonMounted = function(v148) --[[ Line: 474 ]]
        -- upvalues: v118 (copy), v53 (ref), v76 (ref), v71 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v54 (ref), v72 (ref)
        local v149 = v118.props.purchaseAnalyticsMetadata or {};
        v53(v76.UnifiedProductPurchaseModalShownCounter, v149.surface, v149.productType);
        v118.emitUnifiedProductPurchaseFlowEvent(v71.BuyItemModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v149 and v149.surface then
            v54(v72.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v149.surface);
        end;
        if v118.props.purchaseCallbacks and v118.props.purchaseCallbacks.onBuyItemButtonMounted then
            v118.props.purchaseCallbacks.onBuyItemButtonMounted(v148);
        end;
    end;
end;
v83.didMount = function(v150) --[[ Line: 500 ]] --[[ Name: didMount ]]
    -- upvalues: v33 (copy), v110 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v150.props.purchaseFlow;
    local l_requestType_0 = v150.props.requestType;
    if v150.props.windowState == v33.Shown and v110(l_requestType_0, l_purchaseFlow_0) then
        v150:setState({
            isAnimating = true
        });
        v150.configContextActionService(v150.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v83.willUpdate = function(v153, v154) --[[ Line: 514 ]] --[[ Name: willUpdate ]]
    if v153.props.expectedPrice ~= v154.expectedPrice then
        v153:setState({});
    end;
end;
v83.didUpdate = function(v155, v156, _) --[[ Line: 520 ]] --[[ Name: didUpdate ]]
    -- upvalues: v73 (copy), v32 (copy), l_HttpService_0 (copy), v74 (copy), v75 (copy), l_Players_0 (copy), v110 (copy), l_GuiService_0 (copy), v33 (copy), v31 (copy), v46 (copy)
    if not v73 and v155.props.promptState ~= v156.promptState and v155.props.promptState == v32.None then
        local v158 = l_HttpService_0:GenerateGUID(false);
        v155.props.setPurchaseFlowUUID(v158);
        v74.default:logRobloxTelemetryCounter(v75.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerDidUpdate"
        });
    end;
    if l_Players_0.LocalPlayer.GameplayPaused then
        v155.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v155.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v155.props.purchaseFlow;
    local l_requestType_1 = v155.props.requestType;
    if v156.windowState ~= v155.props.windowState and v110(l_requestType_1, l_purchaseFlow_1) then
        v155:setState({
            isAnimating = true
        });
        v155.configContextActionService(v155.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v155.props.windowState == v33.Shown);
        if v155.props.windowState == v33.Hidden then
            v155.props.completeRequest();
        end;
    end;
    if l_requestType_1 == v31.AvatarCreationFee and v155.props.promptState == v32.PurchaseComplete and v156.promptState ~= v32.PurchaseComplete then
        v46.sendPageLoad(v46.Section.ProcessCompleteModal);
    end;
    if v156.promptState ~= v155.props.promptState then
        v155.emitPurchaseFlowEvent("ViewShown");
    end;
end;
v83.getMessageKeysFromPromptState = function(v161) --[[ Line: 579 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v32 (copy), v34 (copy), v48 (copy), v50 (copy)
    local l_promptState_2 = v161.props.promptState;
    local l_productInfo_0 = v161.props.productInfo;
    local l_purchaseError_0 = v161.props.purchaseError;
    if l_promptState_2 == v32.PurchaseComplete then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded", 
                params = {
                    ITEM_NAME = l_productInfo_0.name
                }
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_2 == v32.U13PaymentModal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_2 == v32.U13MonthlyThreshold1Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_2 == v32.U13MonthlyThreshold2Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_2 == v32.ParentalConsentWarningPaymentModal13To17 then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_2 == v32.Error then
        if l_purchaseError_0 == v34.UnknownFailure then
            return {
                messageText = {
                    key = v48.getErrorKey(l_purchaseError_0), 
                    params = {
                        ITEM_NAME = l_productInfo_0.name
                    }
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        elseif l_purchaseError_0 == v34.TwoFactorNeededSettings or v50(l_purchaseError_0) then
            return {
                messageText = {
                    key = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout"
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.Settings"
                }, 
                cancelText = {
                    key = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel"
                }, 
                titleText = {
                    key = "CoreScripts.PurchasePrompt.Title.VerificationRequired"
                }
            };
        else
            return {
                messageText = {
                    key = v48.getErrorKey(l_purchaseError_0)
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        end;
    else
        return;
    end;
end;
v83.determinePrompt = function(v165) --[[ Line: 648 ]] --[[ Name: determinePrompt ]]
    -- upvalues: l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v33 (copy), v32 (copy), v110 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v31 (copy), l_PurchaseClientSessionIdType_0 (copy), v23 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (copy), l_SurfaceName_0 (copy), v77 (copy), l_SurfaceContext_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), v82 (copy), v24 (copy), l_FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry_0 (copy), v71 (copy), l_FFlagEnableBlackbirdUpsellImpressionGating_0 (copy), v105 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), l_Roact_0 (copy), l_UnifiedProductPurchaseModalV2_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 (copy), v62 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_UnifiedProductPurchaseModal_0 (copy), v61 (copy), v49 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_ProductPurchaseModal_0 (copy), l_ProductPurchase_0 (copy), l_RobuxUpsellModal_0 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v10 (copy), l_ButtonType_0 (copy), v34 (copy), v50 (copy), v6 (copy), v84 (copy), l_Images_0 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), l_RobuxUpsellModalTooExpensiveFallback_0 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy), l_FFlagPurchaseModalTimedOptionExtension_0 (copy)
    local l_purchaseFlow_2 = v165.props.purchaseFlow;
    local l_promptState_3 = v165.props.promptState;
    local l_expectedPrice_0 = v165.props.expectedPrice;
    local l_requestType_2 = v165.props.requestType;
    local l_purchaseError_1 = v165.props.purchaseError;
    local l_productInfo_1 = v165.props.productInfo;
    local l_accountInfo_0 = v165.props.accountInfo;
    local l_isTestPurchase_0 = v165.props.isTestPurchase;
    if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v165.props.windowState ~= v33.Shown then
        return nil;
    elseif l_promptState_3 == v32.None or not v110(l_requestType_2, l_purchaseFlow_2, if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 else nil) then
        return nil;
    elseif l_promptState_3 == v32.PromptPurchase or l_promptState_3 == v32.PurchaseInProgress or l_FFlagUnifiedPurchaseAddSkeleton_0 and l_promptState_3 == v32.InitializingPurchase then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v165.props.isUserEligibleForUnifiedPurchaseFlow then
            local l_productPrice_0 = v165.props.productPrice;
            local v175 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then l_requestType_2 == v31.DeveloperSubscription and l_productInfo_1.displayPrice ~= nil and l_productPrice_0 == 0 else false;
            l_productPrice_0 = function() --[[ Line: 688 ]]
                -- upvalues: v165 (copy), v32 (ref), v33 (ref), l_PurchaseClientSessionIdType_0 (ref), v23 (ref), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (ref), l_SurfaceName_0 (ref), v77 (ref), l_SurfaceContext_0 (ref)
                v165.props.setPromptState(v32.BlackbirdUpsellInProgress);
                v165.props.setWindowState(v33.Suspended);
                local l_purchaseFlowUUID_0 = v165.props.purchaseFlowUUID;
                local v177 = if l_purchaseFlowUUID_0 and l_purchaseFlowUUID_0 ~= "" then l_purchaseFlowUUID_0 else nil;
                local v178 = if v177 then {
                    clientSessionIdType = l_PurchaseClientSessionIdType_0.PurchaseFlowUUID, 
                    clientSessionId = v177
                } else nil;
                v23.initiateRobloxSubscriptionPurchase({
                    showBackButton = true
                }, {
                    onFlowComplete = function(v179) --[[ Line: 707 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (ref), v165 (ref)
                        if v179 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseSucceeded then
                            if l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 and v165.props.purchaseCallbacks and v165.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
                                v165.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess();
                            end;
                            v165.props.retryPurchaseAfterUpsell();
                            return;
                        elseif v179 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellDismissed then
                            v165.props.completeRequest();
                            return;
                        elseif v179 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseFailed then
                            v165.props.completeRequest();
                            return;
                        else
                            v165.props.completeRequest();
                            return;
                        end;
                    end, 
                    onBackButtonActivated = function() --[[ Line: 729 ]] --[[ Name: onBackButtonActivated ]]
                        -- upvalues: v165 (ref), v32 (ref), v33 (ref)
                        v165.props.setPromptState(v32.PromptPurchase);
                        v165.props.setWindowState(v33.Shown);
                    end
                }, nil, l_SurfaceName_0.UnifiedProductPurchaseModal, if v77.get() == v77.Enum.IN_APP then l_SurfaceContext_0.InApp else l_SurfaceContext_0.InGame, nil, if v178 then {
                    clientSessionId = v178
                } else nil);
            end;
            local v180 = nil;
            if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then
                v180 = if v175 then nil else v165.props.price;
            end;
            local v181 = nil;
            if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                v181 = v82(v180, v165.props.requestType, v175);
            end;
            local v182 = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v181 and v165.props.robloxSubscriptionProducts then v24(v165.props.robloxSubscriptionProducts) else nil;
            local function v184(v183) --[[ Line: 762 ]]
                -- upvalues: v165 (copy), l_FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry_0 (ref), v182 (copy), v71 (ref), l_FFlagEnableBlackbirdUpsellImpressionGating_0 (ref), v105 (ref)
                v165.onBuyItemButtonMounted(v183);
                if l_FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry_0 and v182 then
                    v165.emitUnifiedProductPurchaseFlowEvent(v71.SubscriptionUpsellBannerShown);
                end;
                if l_FFlagEnableBlackbirdUpsellImpressionGating_0 and v182 then
                    v105.incrementImpressionCount();
                end;
            end;
            local v185 = if not not l_FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry_0 or l_FFlagEnableBlackbirdUpsellImpressionGating_0 then v184 else v165.onBuyItemButtonMounted;
            if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v77.get() == v77.Enum.IN_APP then
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModalV2_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v175 then nil else v165.props.productPrice, 
                        itemDisplayPrice = if v175 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v180 else nil, 
                        model = v165.props.humanoidModel
                    }, 
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v165.props.subtitleView else nil, 
                    buttons = {
                        buyItemActivated = v165.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v165.isWindowShowAndDoneAnimating() and if l_FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience_0 then v165.buyButtonUsesFoundationInputDelay else v77.get() == v77.Enum.IN_EXPERIENCE, 
                        cancelActivated = v165.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v32.PurchaseInProgress
                    }, 
                    postPurchaseActions = v165.props.postPurchaseActions, 
                    setPostPurchaseActions = v165.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v185, 
                    purchaseModalType = v62(v165.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 == v32.InitializingPurchase else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = v182
                });
            else
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModal_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v175 then nil else if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                        itemDisplayPrice = if v175 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v180 else nil, 
                        model = v165.props.humanoidModel
                    }, 
                    buttons = {
                        buyItemActivated = v165.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v165.isWindowShowAndDoneAnimating() and v77.get() == v77.Enum.IN_EXPERIENCE, 
                        cancelActivated = v165.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v32.PurchaseInProgress
                    }, 
                    postPurchaseActions = v165.props.postPurchaseActions, 
                    setPostPurchaseActions = v165.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v185, 
                    purchaseModalType = v62(v165.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = v182, 
                    hideUserRobuxBalance = v175 or if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v165.props.purchaseAnalyticsMetadata and v165.props.purchaseAnalyticsMetadata.surface == l_ProductPurchaseSurface_0.Catalog else nil
                });
            end;
        elseif l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_ProductPurchaseModal_0, {
                screenSize = v165.state.screenSize, 
                product = {
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                balanceAmount = l_accountInfo_0.balance, 
                balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not l_accountInfo_0.hasFailed, 
                buttons = {
                    isDisabled = l_promptState_3 == v32.PurchaseInProgress, 
                    buyItemActivated = v165.confirmButtonPressed, 
                    buyItemControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemIsDelayedInput = v165.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v165.isWindowShowAndDoneAnimating(), 
                    cancelActivated = v165.cancelButtonPressed
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v165.state.screenSize, 
                isDisabled = l_promptState_3 == v32.PurchaseInProgress, 
                model = v165.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                currentBalanceValid = not l_accountInfo_0.hasFailed, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v165.hasDelayedInput(), 
                enableInputDelayed = v165.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = v165.confirmButtonPressed, 
                cancelPurchaseActivated = v165.cancelButtonPressed, 
                isLuobu = v165.state.isLuobu
            });
        end;
    elseif l_promptState_3 == v32.RobuxUpsell or l_promptState_3 == v32.UpsellInProgress then
        if l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_RobuxUpsellModal_0, {
                screenSize = v165.state.screenSize, 
                product = {
                    model = v165.props.humanoidModel, 
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                upsell = {
                    balanceAmount = l_accountInfo_0.balance, 
                    robuxPurchaseAmount = v165.props.robuxPurchaseAmount, 
                    robuxPurchaseAmountBeforeBonus = v165.props.robuxAmountBeforeBonus, 
                    robuxPurchaseCost = v165.props.robuxPurchaseCost
                }, 
                buttons = {
                    buyItemActivated = function() --[[ Line: 924 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v165 (copy)
                        v165.confirmButtonPressed();
                        v165.emitPurchaseFlowEvent("UserInput", "Buy");
                    end, 
                    buyItemDisabled = l_promptState_3 == v32.UpsellInProgress, 
                    buyItemControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemisDelayedInput = v165.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v165.isWindowShowAndDoneAnimating(), 
                    cancelPurchaseActivated = function() --[[ Line: 933 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v165 (copy)
                        v165.cancelButtonPressed();
                        v165.emitPurchaseFlowEvent("UserInput", "Cancel");
                    end, 
                    cancelControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                    opensBuyRobuxPage = l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v165.state.screenSize, 
                isDisabled = l_promptState_3 == v32.UpsellInProgress, 
                model = v165.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = v165.props.robuxPurchaseAmount, 
                robuxPurchaseAmountBeforeBonus = v165.props.robuxAmountBeforeBonus, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v165.hasDelayedInput(), 
                enableInputDelayed = v165.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = function() --[[ Line: 963 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v165 (copy)
                    v165.confirmButtonPressed();
                    v165.emitPurchaseFlowEvent("UserInput", "Buy");
                end, 
                cancelPurchaseActivated = function() --[[ Line: 967 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v165 (copy)
                    v165.cancelButtonPressed();
                    v165.emitPurchaseFlowEvent("UserInput", "Cancel");
                end, 
                isLuobu = v165.state.isLuobu, 
                isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
            });
        end;
    elseif l_promptState_3 == v32.LeaveRobloxWarning then
        return l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
            screenSize = v165.state.screenSize, 
            cancelActivated = v165.cancelButtonPressed, 
            continueActivated = v165.confirmButtonPressed
        });
    elseif l_promptState_3 == v32.PurchaseComplete and l_requestType_2 == v31.AvatarCreationFee then
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            bodyText = v10:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v165.confirmButtonPressed, 
                            text = v10:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                            inputIcon = v165.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                        }
                    }
                }
            }, 
            screenSize = v165.state.screenSize, 
            title = v10:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
        });
    elseif l_promptState_3 == v32.Error and l_purchaseError_1 == v34.TwoFactorNeededSettings or v50(l_purchaseError_1) then
        return v6.createElement(v84, {
            screenSize = v165.state.screenSize, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v165.props.economicRestrictionError or {}, 
            isGamepadEnabled = v165.props.isGamepadEnabled, 
            cancelButtonPressed = v165.cancelButtonPressed, 
            confirmButtonPressed = v165.confirmButtonPressed, 
            includeCancelButton = true, 
            isGenericChallengeResponse = v50, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v165.props.isUserEligibleForUnifiedPurchaseFlow else nil
        });
    elseif l_promptState_3 == v32.EnablePurchaseVPCModal then
        return l_Roact_0.createElement(l_Animator_0, {
            shouldAnimate = true, 
            shouldShow = l_promptState_3 == v32.EnablePurchaseVPCModal, 
            renderChildren = function() --[[ Line: 1023 ]] --[[ Name: renderChildren ]]
                -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v165 (copy), l_promptState_3 (copy)
                return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = v165.state.screenSize, 
                    isActionable = false, 
                    modalType = v165.getVPCModalType(l_promptState_3), 
                    onDismiss = function() --[[ Line: 1028 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v165 (ref)
                        v165.confirmButtonPressed();
                    end
                });
            end
        });
    elseif l_promptState_3 == v32.Error and l_purchaseError_1 == v34.NotEnoughRobuxXbox and l_DesktopUpsellExperiment_0.shouldShowNewModal() then
        return l_Roact_0.createElement(l_RobuxUpsellModalTooExpensiveFallback_0, {
            screenSize = v165.state.screenSize, 
            product = {
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v61 then v165.props.productPrice else v49(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
            }, 
            balanceAmount = l_accountInfo_0.balance, 
            doneActivated = function() --[[ Line: 1051 ]] --[[ Name: doneActivated ]]
                -- upvalues: v165 (copy)
                v165.cancelButtonPressed();
                v165.emitPurchaseFlowEvent("UserInput", "Cancel");
            end
        });
    else
        return v6.createElement(v84, {
            screenSize = v165.state.screenSize, 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v165.props.economicRestrictionError or {}, 
            isGamepadEnabled = v165.props.isGamepadEnabled, 
            cancelButtonPressed = v165.cancelButtonPressed, 
            confirmButtonPressed = v165.confirmButtonPressed, 
            includeCancelButton = false, 
            isGenericChallengeResponse = v50, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v165.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            isMultiItem = v62(v165.props.requestType) == l_UnifiedPurchaseModalTypeEnum_0.MultiItem, 
            timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v165.props.timedOptionDays else nil, 
            completionMessage = if l_FFlagPurchaseModalTimedOptionExtension_0 then v165.props.completionMessage else nil
        });
    end;
end;
v83.render = function(v186) --[[ Line: 1079 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v58 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v33 (copy), v31 (copy), v32 (copy), v46 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v47 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_promptState_4 = v186.props.promptState;
    local v188 = v186:determinePrompt();
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v186.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v58, {
            shouldShow = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v186.props.windowState == v33.Shown else v186.props.windowState ~= v33.Hidden, 
            onShown = function() --[[ Line: 1092 ]] --[[ Name: onShown ]]
                -- upvalues: v186 (copy), v31 (ref), l_promptState_4 (copy), v32 (ref), v46 (ref)
                if v186.props.requestType == v31.AvatarCreationFee and l_promptState_4 == v32.PromptPurchase then
                    v46.sendPageLoad(v46.Section.BuyItemModal);
                end;
                v186:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 1104 ]] --[[ Name: onHidden ]]
                -- upvalues: v186 (copy)
                v186:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
            end, 
            skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v186.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            [l_Roact_0.Ref] = v186.animatorRef
        }, {
            Prompt = v188, 
            ModalFix = v188 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v47, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 1125 ]] --[[ Name: callback ]]
                -- upvalues: v186 (copy)
                if v186.props.hideWindow then
                    v186.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v47, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v189, v190) --[[ Line: 1133 ]] --[[ Name: callback ]]
                -- upvalues: v186 (copy)
                if not v189 or not v190 then
                    v186.props.hideWindow();
                end;
            end
        })
    });
end;
return (v44(function(v191) --[[ Line: 1143 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v43 (copy), v51 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v61 (copy), v63 (copy), v65 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), l_FFlagPurchaseModalTimedOptionExtension_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy)
    local v192 = v43(v191.promptRequest.requestType);
    local v193 = if v191.abVariations then v191.abVariations.DesktopUpsellExpVariant else nil;
    return {
        purchaseFlowUUID = v191.purchaseFlowUUID, 
        purchaseFlow = v191.purchaseFlow, 
        promptState = v191.promptState, 
        requestType = v191.promptRequest.requestType, 
        humanoidModel = v191.promptRequest.humanoidModel, 
        expectedPrice = v191.promptRequest.expectedPrice, 
        windowState = v191.windowState, 
        purchaseError = v191.purchaseError, 
        economicRestrictionError = v191.economicRestrictionError, 
        productInfo = v191.productInfo, 
        accountInfo = v191.accountInfo, 
        robuxPurchaseAmount = v51.getRobuxPurchaseAmount(v191), 
        robuxAmountBeforeBonus = v51.getRobuxAmountBeforeBonus(v191), 
        robuxPurchaseCost = v51.getPrice(v191), 
        isTestPurchase = v192, 
        isGamepadEnabled = v191.gamepadEnabled, 
        desktopUpsellExpVariant = v193, 
        postPurchaseActions = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v191.postPurchaseActions else nil, 
        purchaseCallbacks = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v191.purchaseCallbacks else nil, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v191.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v191.purchaseAnalyticsMetadata else nil, 
        productPrice = if v61 then v63(v191) else nil, 
        price = if v65 then v65(v191) else nil, 
        timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 and v191.productPayload then v191.productPayload.timedOptionDays else nil, 
        completionMessage = if l_FFlagPurchaseModalTimedOptionExtension_0 and v191.purchaseOptions then v191.purchaseOptions.completionMessage else nil, 
        robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v191.robloxSubscriptionProducts else nil
    };
end, function(v194) --[[ Line: 1188 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v68 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v55 (copy), v36 (copy), v37 (copy), v29 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), l_GuiService_0 (copy), v38 (copy), v45 (copy), v69 (copy), v66 (copy)
    return {
        setPurchaseFlowUUID = function(v195) --[[ Line: 1190 ]] --[[ Name: setPurchaseFlowUUID ]]
            -- upvalues: v194 (copy), v68 (ref)
            v194(v68(v195));
        end, 
        onBuy = function() --[[ Line: 1193 ]] --[[ Name: onBuy ]]
            -- upvalues: v194 (copy), v39 (ref)
            v194(v39());
        end, 
        completePurchase = function() --[[ Line: 1196 ]] --[[ Name: completePurchase ]]
            -- upvalues: v194 (copy), v40 (ref)
            v194(v40());
        end, 
        onScaryModalConfirm = function() --[[ Line: 1199 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v194 (copy), v41 (ref)
            v194(v41());
        end, 
        onOpenSecuritySettings = function(v196) --[[ Line: 1202 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v194 (copy), v42 (ref)
            if v196 then
                v194(v42(v196));
                return;
            else
                v194(v42());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 1209 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v194 (copy), v55 (ref)
            v194(v55());
        end, 
        hideWindow = function() --[[ Line: 1212 ]] --[[ Name: hideWindow ]]
            -- upvalues: v194 (copy), v36 (ref)
            v194(v36());
        end, 
        retryPurchaseAfterUpsell = function() --[[ Line: 1215 ]] --[[ Name: retryPurchaseAfterUpsell ]]
            -- upvalues: v194 (copy), v37 (ref)
            v194(v37());
        end, 
        setWindowState = function(v197) --[[ Line: 1218 ]] --[[ Name: setWindowState ]]
            -- upvalues: v194 (copy), v29 (ref)
            v194(v29(v197));
        end, 
        completeRequest = function() --[[ Line: 1221 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), l_GuiService_0 (ref), v194 (copy), v38 (ref)
            if l_FFlagAddCursorProviderToPurchasePromptApp_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v194(v38());
        end, 
        onAnalyticEvent = function(v198, v199) --[[ Line: 1227 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v194 (copy), v45 (ref)
            v194(v45(v198, v199));
        end, 
        setPostPurchaseActions = function(v200) --[[ Line: 1230 ]] --[[ Name: setPostPurchaseActions ]]
            -- upvalues: v194 (copy), v69 (ref)
            v194(v69(v200));
        end, 
        setPromptState = function(v201) --[[ Line: 1233 ]] --[[ Name: setPromptState ]]
            -- upvalues: v194 (copy), v66 (ref)
            v194(v66(v201));
        end
    };
end)(v83));