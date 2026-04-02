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
local v28 = require(l_script_FirstAncestor_0.Actions.SetWindowState);
local v29 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v30 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v31 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v32 = require(l_script_FirstAncestor_0.Enums.WindowState);
local v33 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v35 = require(l_script_FirstAncestor_0.Thunks.hideWindow);
local v36 = require(l_script_FirstAncestor_0.Thunks.retryPurchaseAfterUpsell);
local v37 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v38 = require(l_script_FirstAncestor_0.Thunks.purchaseItem);
local v39 = require(l_script_FirstAncestor_0.Thunks.completePurchase);
local v40 = require(l_script_FirstAncestor_0.Thunks.launchRobuxUpsell);
local v41 = require(l_script_FirstAncestor_0.Thunks.openSecuritySettings);
local v42 = require(l_script_FirstAncestor_0.Utils.isMockingPurchases);
local v43 = require(l_script_FirstAncestor_0.connectToStore);
local v44 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v45 = require(l_script_FirstAncestor_0.Utils.PublishAssetAnalytics);
local v46 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v47 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v48 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v49 = require(l_script_FirstAncestor_0.Utils.isGenericChallengeResponse);
local v50 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_ProductPurchaseSurface_0 = require(l_Parent_0.PurchasePromptLite).Enums.ProductPurchaseSurface;
local v52 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v53 = require(l_script_FirstAncestor_0.Utils.emitPerformanceMetrics);
local v54 = require(l_script_FirstAncestor_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_0.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v56 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v57 = require(script.Parent.Animator);
local v58 = require(l_Parent_0.SharedFlags);
local l_FFlagAddCursorProviderToPurchasePromptApp_0 = v58.FFlagAddCursorProviderToPurchasePromptApp;
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice);
local v61 = require(l_script_FirstAncestor_0.Utils.getUnifiedPurchaseModalType);
local v62 = require(l_script_FirstAncestor_0.Selectors.selectProductPrice);
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = v58.FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local v64 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then require(l_script_FirstAncestor_0.Selectors.selectPrice) else nil;
local v65 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local l_HttpService_0 = game:GetService("HttpService");
local v67 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v68 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v69 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v70 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v71 = require(l_script_FirstAncestor_0.Misc.Constants);
local v72 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v73 = require(l_Parent_0.LoggingProtocol);
local v74 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v75 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v76 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_DesktopUpsellExperiment_0 = v16.Utility.DesktopUpsellExperiment;
local l_ProductPurchaseModal_0 = v16.ProductPurchaseModal;
local l_RobuxUpsellModal_0 = v16.RobuxUpsellModal;
local l_RobuxUpsellModalTooExpensiveFallback_0 = v16.RobuxUpsellModalTooExpensiveFallback;
local v81 = require(l_script_FirstAncestor_0.Utils.shouldShowBlackbirdUpsell);
local v82 = l_Roact_0.Component:extend(script.Name);
local v83 = require(script.Parent.ProductPurchasePrompt);
local v84 = require(l_Parent_0.SharedFlags);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = v84.GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v84.FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseModalTypeEnum_0 = v16.Enums.UnifiedPurchaseModalTypeEnum;
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v97 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true);
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_Parent_0.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal;
local function v104(v100, v101, v102) --[[ Line: 159 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v31 (copy), v29 (copy), v30 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v102 == v31.InitializingPurchase and v101 == v29.RobuxUpsellV2 then
        return true;
    elseif v101 == v29.RobuxUpsellV2 or v101 == v29.LargeRobuxUpsell then
        return false;
    else
        local v103 = true;
        if v100 ~= v30.Asset then
            v103 = true;
            if v100 ~= v30.Bundle then
                v103 = true;
                if v100 ~= v30.GamePass then
                    v103 = true;
                    if v100 ~= v30.Product then
                        v103 = true;
                        if v100 ~= v30.AvatarCreationFee then
                            v103 = l_FFlagEnableUnifiedProductPurchaseFlow_0 and v100 == v30.Experience or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v100 == v30.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v100 == v30.DeveloperSubscription;
                        end;
                    end;
                end;
            end;
        end;
        return v103;
    end;
end;
local function _(v105, v106, v107) --[[ Line: 182 ]] --[[ Name: getIsFiatProduct ]]
    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy)
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v105 == v30.DeveloperSubscription then
        local v108 = false;
        if v106.displayPrice ~= nil then
            v108 = v107 == 0;
        end;
        return v108;
    else
        return false;
    end;
end;
local function _(v110) --[[ Line: 190 ]] --[[ Name: promptStateToViewName ]]
    -- upvalues: v31 (copy)
    return ({
        [v31.RobuxUpsell] = "PurchaseModal", 
        [v31.UpsellInProgress] = "RobuxPurchasePending"
    })[v110];
end;
v82.init = function(v112) --[[ Line: 198 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v72 (copy), v73 (copy), v74 (copy), v9 (copy), v31 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v69 (copy), v97 (copy), l_Players_0 (copy), v104 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v52 (copy), v75 (copy), v70 (copy), v33 (copy), v49 (copy), v30 (copy), v45 (copy), v32 (copy), l_ContextActionService_0 (copy), v56 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v53 (copy), v71 (copy)
    v112.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false, 
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    if not v72 then
        v112.props.setPurchaseFlowUUID(l_HttpService_0:GenerateGUID(false));
        v73.default:logRobloxTelemetryCounter(v74.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerInit"
        });
    end;
    coroutine.wrap(function() --[[ Line: 217 ]]
        -- upvalues: v9 (ref), v112 (copy)
        if v9:IsSubjectToChinaPolicies() then
            v112:setState({
                isLuobu = true
            });
        end;
    end)();
    v112.emitPurchaseFlowEvent = function(v113, v114) --[[ Line: 228 ]]
        -- upvalues: v112 (copy), v31 (ref), l_HttpService_0 (ref)
        local l_promptState_0 = v112.props.promptState;
        local v116 = ({
            [v31.RobuxUpsell] = "PurchaseModal", 
            [v31.UpsellInProgress] = "RobuxPurchasePending"
        })[l_promptState_0];
        if not v116 then
            return;
        else
            l_promptState_0 = {
                purchase_flow_uuid = v112.props.purchaseFlowUUID, 
                purchase_flow = "InGameRobuxUpsell", 
                view_name = v116, 
                purchase_event_type = v113, 
                input_type = v114, 
                event_metadata = l_HttpService_0:JSONEncode({
                    universe_id = tostring(game.GameId), 
                    item_product_id = tostring(v112.props.productInfo.productId), 
                    item_name = v112.props.productInfo.name, 
                    price = tostring(v112.props.productInfo.price), 
                    user_balance = tostring(v112.props.accountInfo.balance) or nil, 
                    package_robux_amount = tostring(v112.props.robuxPurchaseAmount) or nil
                })
            };
            v112.props.onAnalyticEvent("UserPurchaseFlow", l_promptState_0);
            return;
        end;
    end;
    v112.emitUnifiedProductPurchaseFlowEvent = function(v117) --[[ Line: 252 ]]
        -- upvalues: v112 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v69 (ref)
        local v118 = v112.props.purchaseAnalyticsMetadata or {};
        local v119 = {
            event_name = v117, 
            purchase_flow_uuid = v118.purchaseFlowUUID, 
            product_id = v118.productId, 
            product_type = v118.productType, 
            product_target_id = v118.productTargetId, 
            robux_price = v118.price, 
            surface = v118.surface, 
            user_roblox_balance = v118.userRobuxBalance, 
            salelocation_universeid = v118.saleLocationUniverseId, 
            product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v118.productUniverseId else nil
        };
        v69(v119);
    end;
    v112.changeScreenSize = function(v120) --[[ Line: 271 ]]
        -- upvalues: v112 (copy)
        if v112.state.screenSize ~= v120.AbsoluteSize then
            v112:setState({
                screenSize = v120.AbsoluteSize
            });
        end;
    end;
    v112.hasDelayedInput = function() --[[ Line: 279 ]]
        -- upvalues: v97 (ref), v112 (copy), v31 (ref)
        if not v97 and v112.props.isTestPurchase then
            return false;
        else
            local l_promptState_1 = v112.props.promptState;
            if v97 then
                local v122 = true;
                if l_promptState_1 ~= v31.PurchaseInProgress then
                    v122 = true;
                    if l_promptState_1 ~= v31.RobuxUpsell then
                        v122 = l_promptState_1 == v31.UpsellInProgress;
                    end;
                end;
                return v122;
            else
                local v123 = true;
                if l_promptState_1 ~= v31.PromptPurchase then
                    v123 = true;
                    if l_promptState_1 ~= v31.PurchaseInProgress then
                        v123 = true;
                        if l_promptState_1 ~= v31.RobuxUpsell then
                            v123 = l_promptState_1 == v31.UpsellInProgress;
                        end;
                    end;
                end;
                return v123;
            end;
        end;
    end;
    v112.isWindowShowAndDoneAnimating = function() --[[ Line: 302 ]]
        -- upvalues: v112 (copy)
        return v112.state.isAnimating == false;
    end;
    v112.canConfirmInput = function() --[[ Line: 306 ]]
        -- upvalues: l_Players_0 (ref), v112 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v124 = v112.isWindowShowAndDoneAnimating();
            if v112.hasDelayedInput() then
                local v125 = false;
                if v112.state.doneAnimatingTime then
                    v125 = os.clock() - v112.state.doneAnimatingTime > 2.5;
                end;
                return v124 and v125;
            else
                return v124;
            end;
        end;
    end;
    v112.getConfirmButtonAction = function(v126, v127, v128) --[[ Line: 331 ]]
        -- upvalues: v31 (ref), v104 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v112 (copy), v52 (ref), v75 (ref), v70 (ref), v33 (ref), v49 (ref)
        if v126 == v31.None or not v104(v127) then
            return nil;
        elseif v126 == v31.PromptPurchase or v126 == v31.PurchaseInProgress then
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v112.props.isUserEligibleForUnifiedPurchaseFlow then
                local v129 = v112.props.purchaseAnalyticsMetadata or {};
                v52(v75.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v129.surface, v129.productType);
                v112.emitUnifiedProductPurchaseFlowEvent(v70.BuyItemModalBuyClicked);
            end;
            return v112.props.onBuy;
        elseif v126 == v31.RobuxUpsell or v126 == v31.UpsellInProgress or v126 == v31.LeaveRobloxWarning then
            return v112.props.onRobuxUpsell;
        elseif v126 == v31.U13PaymentModal or v126 == v31.U13MonthlyThreshold1Modal or v126 == v31.U13MonthlyThreshold2Modal or v126 == v31.ParentalConsentWarningPaymentModal13To17 then
            return v112.props.onScaryModalConfirm;
        elseif v126 == v31.Error and v128 == v33.TwoFactorNeededSettings then
            return v112.props.onOpenSecuritySettings;
        elseif v49(v128) then
            return function() --[[ Line: 363 ]]
                -- upvalues: v112 (ref), v128 (copy)
                v112.props.onOpenSecuritySettings(v128);
            end;
        else
            return v112.props.hideWindow;
        end;
    end;
    v112.getCancelButtonAction = function(v130, v131) --[[ Line: 371 ]]
        -- upvalues: v31 (ref), v104 (ref), v112 (copy)
        if v130 == v31.None or not v104(v131) then
            return nil;
        else
            return v112.props.hideWindow;
        end;
    end;
    v112.confirmButtonPressed = function() --[[ Line: 379 ]]
        -- upvalues: v112 (copy), v30 (ref), v31 (ref), v45 (ref)
        if v112.props.requestType == v30.AvatarCreationFee and v112.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Buy);
        end;
        local v132 = v112.getConfirmButtonAction(v112.props.promptState, v112.props.requestType, v112.props.purchaseError);
        if v132 ~= nil and v112.canConfirmInput() then
            v132();
        end;
    end;
    v112.cancelButtonPressed = function() --[[ Line: 396 ]]
        -- upvalues: v112 (copy), v30 (ref), v31 (ref), v45 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v52 (ref), v75 (ref)
        if v112.props.requestType == v30.AvatarCreationFee and v112.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Cancel);
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v112.props.isUserEligibleForUnifiedPurchaseFlow then
            v52(v75.UnifiedProductPurchaseModalCancelButtonClickedCounter, v112.props.purchaseAnalyticsMetadata.surface, v112.props.purchaseAnalyticsMetadata.productType);
        end;
        local v133 = v112.getCancelButtonAction(v112.props.promptState, v112.props.requestType);
        if v133 ~= nil then
            v133();
        end;
    end;
    v112.configContextActionService = function(v134) --[[ Line: 421 ]]
        -- upvalues: v32 (ref), l_ContextActionService_0 (ref), v112 (copy)
        if v134 == v32.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v136, _) --[[ Line: 423 ]]
                -- upvalues: v112 (ref)
                if v136 == Enum.UserInputState.Begin then
                    v112.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v139, _) --[[ Line: 428 ]]
                -- upvalues: v112 (ref)
                if v139 == Enum.UserInputState.Begin then
                    v112.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v112.getVPCModalType = function(v141) --[[ Line: 439 ]]
        -- upvalues: v31 (ref), v56 (ref)
        if v141 == v31.EnablePurchaseVPCModal then
            return v56.toRawValue(v56.EnablePurchase);
        else
            return v56.toRawValue(v56.None);
        end;
    end;
    v112.onBuyItemButtonMounted = function(v142) --[[ Line: 446 ]]
        -- upvalues: v112 (copy), v52 (ref), v75 (ref), v70 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v53 (ref), v71 (ref)
        local v143 = v112.props.purchaseAnalyticsMetadata or {};
        v52(v75.UnifiedProductPurchaseModalShownCounter, v143.surface, v143.productType);
        v112.emitUnifiedProductPurchaseFlowEvent(v70.BuyItemModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v143 and v143.surface then
            v53(v71.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v143.surface);
        end;
        if v112.props.purchaseCallbacks and v112.props.purchaseCallbacks.onBuyItemButtonMounted then
            v112.props.purchaseCallbacks.onBuyItemButtonMounted(v142);
        end;
    end;
end;
v82.didMount = function(v144) --[[ Line: 472 ]] --[[ Name: didMount ]]
    -- upvalues: v32 (copy), v104 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v144.props.purchaseFlow;
    local l_requestType_0 = v144.props.requestType;
    if v144.props.windowState == v32.Shown and v104(l_requestType_0, l_purchaseFlow_0) then
        v144:setState({
            isAnimating = true
        });
        v144.configContextActionService(v144.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v82.willUpdate = function(v147, v148) --[[ Line: 486 ]] --[[ Name: willUpdate ]]
    if v147.props.expectedPrice ~= v148.expectedPrice then
        v147:setState({});
    end;
end;
v82.didUpdate = function(v149, v150, _) --[[ Line: 492 ]] --[[ Name: didUpdate ]]
    -- upvalues: v72 (copy), v31 (copy), l_HttpService_0 (copy), v73 (copy), v74 (copy), l_Players_0 (copy), v104 (copy), l_GuiService_0 (copy), v32 (copy), v30 (copy), v45 (copy)
    if not v72 and v149.props.promptState ~= v150.promptState and v149.props.promptState == v31.None then
        local v152 = l_HttpService_0:GenerateGUID(false);
        v149.props.setPurchaseFlowUUID(v152);
        v73.default:logRobloxTelemetryCounter(v74.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerDidUpdate"
        });
    end;
    if l_Players_0.LocalPlayer.GameplayPaused then
        v149.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v149.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v149.props.purchaseFlow;
    local l_requestType_1 = v149.props.requestType;
    if v150.windowState ~= v149.props.windowState and v104(l_requestType_1, l_purchaseFlow_1) then
        v149:setState({
            isAnimating = true
        });
        v149.configContextActionService(v149.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v149.props.windowState == v32.Shown);
        if v149.props.windowState == v32.Hidden then
            v149.props.completeRequest();
        end;
    end;
    if l_requestType_1 == v30.AvatarCreationFee and v149.props.promptState == v31.PurchaseComplete and v150.promptState ~= v31.PurchaseComplete then
        v45.sendPageLoad(v45.Section.ProcessCompleteModal);
    end;
    if v150.promptState ~= v149.props.promptState then
        v149.emitPurchaseFlowEvent("ViewShown");
    end;
end;
v82.getMessageKeysFromPromptState = function(v155) --[[ Line: 551 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v31 (copy), v33 (copy), v47 (copy), v49 (copy)
    local l_promptState_2 = v155.props.promptState;
    local l_productInfo_0 = v155.props.productInfo;
    local l_purchaseError_0 = v155.props.purchaseError;
    if l_promptState_2 == v31.PurchaseComplete then
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
    elseif l_promptState_2 == v31.U13PaymentModal then
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
    elseif l_promptState_2 == v31.U13MonthlyThreshold1Modal then
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
    elseif l_promptState_2 == v31.U13MonthlyThreshold2Modal then
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
    elseif l_promptState_2 == v31.ParentalConsentWarningPaymentModal13To17 then
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
    elseif l_promptState_2 == v31.Error then
        if l_purchaseError_0 == v33.UnknownFailure then
            return {
                messageText = {
                    key = v47.getErrorKey(l_purchaseError_0), 
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
        elseif l_purchaseError_0 == v33.TwoFactorNeededSettings or v49(l_purchaseError_0) then
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
                    key = v47.getErrorKey(l_purchaseError_0)
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
v82.determinePrompt = function(v159) --[[ Line: 620 ]] --[[ Name: determinePrompt ]]
    -- upvalues: l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v31 (copy), v104 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy), v23 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (copy), l_SurfaceName_0 (copy), v76 (copy), l_SurfaceContext_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), v81 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), l_Roact_0 (copy), l_UnifiedProductPurchaseModalV2_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v61 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), v24 (copy), l_UnifiedProductPurchaseModal_0 (copy), v60 (copy), v48 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_ProductPurchaseModal_0 (copy), l_ProductPurchase_0 (copy), l_RobuxUpsellModal_0 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v10 (copy), l_ButtonType_0 (copy), v33 (copy), v49 (copy), v6 (copy), v83 (copy), l_Images_0 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), l_RobuxUpsellModalTooExpensiveFallback_0 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy)
    local l_purchaseFlow_2 = v159.props.purchaseFlow;
    local l_promptState_3 = v159.props.promptState;
    local l_expectedPrice_0 = v159.props.expectedPrice;
    local l_requestType_2 = v159.props.requestType;
    local l_purchaseError_1 = v159.props.purchaseError;
    local l_productInfo_1 = v159.props.productInfo;
    local l_accountInfo_0 = v159.props.accountInfo;
    local l_isTestPurchase_0 = v159.props.isTestPurchase;
    if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v159.props.windowState ~= v32.Shown then
        return nil;
    elseif l_promptState_3 == v31.None or not v104(l_requestType_2, l_purchaseFlow_2, if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 else nil) then
        return nil;
    elseif l_promptState_3 == v31.PromptPurchase or l_promptState_3 == v31.PurchaseInProgress or l_FFlagUnifiedPurchaseAddSkeleton_0 and l_promptState_3 == v31.InitializingPurchase then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v159.props.isUserEligibleForUnifiedPurchaseFlow then
            local l_productPrice_0 = v159.props.productPrice;
            local v169 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then l_requestType_2 == v30.DeveloperSubscription and l_productInfo_1.displayPrice ~= nil and l_productPrice_0 == 0 else false;
            l_productPrice_0 = function() --[[ Line: 660 ]]
                -- upvalues: v159 (copy), v31 (ref), v32 (ref), v23 (ref), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (ref), l_SurfaceName_0 (ref), v76 (ref), l_SurfaceContext_0 (ref)
                v159.props.setPromptState(v31.BlackbirdUpsellInProgress);
                v159.props.setWindowState(v32.Suspended);
                v23.initiateRobloxSubscriptionPurchase({
                    showBackButton = true
                }, {
                    onFlowComplete = function(v170) --[[ Line: 670 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (ref), v159 (ref)
                        if v170 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseSucceeded then
                            if l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 and v159.props.purchaseCallbacks and v159.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
                                v159.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess();
                            end;
                            v159.props.retryPurchaseAfterUpsell();
                            return;
                        elseif v170 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellDismissed then
                            v159.props.completeRequest();
                            return;
                        elseif v170 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseFailed then
                            v159.props.completeRequest();
                            return;
                        else
                            v159.props.completeRequest();
                            return;
                        end;
                    end, 
                    onBackButtonActivated = function() --[[ Line: 692 ]] --[[ Name: onBackButtonActivated ]]
                        -- upvalues: v159 (ref), v31 (ref), v32 (ref)
                        v159.props.setPromptState(v31.PromptPurchase);
                        v159.props.setWindowState(v32.Shown);
                    end
                }, nil, l_SurfaceName_0.UnifiedProductPurchaseModal, if v76.get() == v76.Enum.IN_APP then l_SurfaceContext_0.InApp else l_SurfaceContext_0.InGame);
            end;
            local v171 = nil;
            if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then
                v171 = if v169 then nil else v159.props.price;
            end;
            local v172 = nil;
            if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                v172 = v81(v171, v159.props.requestType);
            end;
            if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v76.get() == v76.Enum.IN_APP then
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModalV2_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v169 then nil else v159.props.productPrice, 
                        itemDisplayPrice = if v169 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v171 else nil, 
                        model = v159.props.humanoidModel
                    }, 
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v159.props.subtitleView else nil, 
                    buttons = {
                        buyItemActivated = v159.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v159.isWindowShowAndDoneAnimating() and v76.get() == v76.Enum.IN_EXPERIENCE, 
                        cancelActivated = v159.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v159.props.postPurchaseActions, 
                    setPostPurchaseActions = v159.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v159.onBuyItemButtonMounted, 
                    purchaseModalType = v61(v159.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 == v31.InitializingPurchase else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v172 and v159.props.robloxSubscriptionProducts then v24(v159.props.robloxSubscriptionProducts) else nil
                });
            else
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModal_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v169 then nil else if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                        itemDisplayPrice = if v169 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v171 else nil, 
                        model = v159.props.humanoidModel
                    }, 
                    buttons = {
                        buyItemActivated = v159.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v159.isWindowShowAndDoneAnimating() and v76.get() == v76.Enum.IN_EXPERIENCE, 
                        cancelActivated = v159.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v159.props.postPurchaseActions, 
                    setPostPurchaseActions = v159.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v159.onBuyItemButtonMounted, 
                    purchaseModalType = v61(v159.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v172 and v159.props.robloxSubscriptionProducts then v24(v159.props.robloxSubscriptionProducts) else nil, 
                    hideUserRobuxBalance = v169 or if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v159.props.purchaseAnalyticsMetadata and v159.props.purchaseAnalyticsMetadata.surface == l_ProductPurchaseSurface_0.Catalog else nil
                });
            end;
        elseif l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_ProductPurchaseModal_0, {
                screenSize = v159.state.screenSize, 
                product = {
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                balanceAmount = l_accountInfo_0.balance, 
                balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not l_accountInfo_0.hasFailed, 
                buttons = {
                    isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                    buyItemActivated = v159.confirmButtonPressed, 
                    buyItemControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemIsDelayedInput = v159.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v159.isWindowShowAndDoneAnimating(), 
                    cancelActivated = v159.cancelButtonPressed
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v159.state.screenSize, 
                isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                model = v159.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                currentBalanceValid = not l_accountInfo_0.hasFailed, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v159.hasDelayedInput(), 
                enableInputDelayed = v159.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = v159.confirmButtonPressed, 
                cancelPurchaseActivated = v159.cancelButtonPressed, 
                isLuobu = v159.state.isLuobu
            });
        end;
    elseif l_promptState_3 == v31.RobuxUpsell or l_promptState_3 == v31.UpsellInProgress then
        if l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_RobuxUpsellModal_0, {
                screenSize = v159.state.screenSize, 
                product = {
                    model = v159.props.humanoidModel, 
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                upsell = {
                    balanceAmount = l_accountInfo_0.balance, 
                    robuxPurchaseAmount = v159.props.robuxPurchaseAmount, 
                    robuxPurchaseAmountBeforeBonus = v159.props.robuxAmountBeforeBonus, 
                    robuxPurchaseCost = v159.props.robuxPurchaseCost
                }, 
                buttons = {
                    buyItemActivated = function() --[[ Line: 870 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v159 (copy)
                        v159.confirmButtonPressed();
                        v159.emitPurchaseFlowEvent("UserInput", "Buy");
                    end, 
                    buyItemDisabled = l_promptState_3 == v31.UpsellInProgress, 
                    buyItemControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemisDelayedInput = v159.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v159.isWindowShowAndDoneAnimating(), 
                    cancelPurchaseActivated = function() --[[ Line: 879 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v159 (copy)
                        v159.cancelButtonPressed();
                        v159.emitPurchaseFlowEvent("UserInput", "Cancel");
                    end, 
                    cancelControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                    opensBuyRobuxPage = l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v159.state.screenSize, 
                isDisabled = l_promptState_3 == v31.UpsellInProgress, 
                model = v159.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = v159.props.robuxPurchaseAmount, 
                robuxPurchaseAmountBeforeBonus = v159.props.robuxAmountBeforeBonus, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v159.hasDelayedInput(), 
                enableInputDelayed = v159.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = function() --[[ Line: 909 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v159 (copy)
                    v159.confirmButtonPressed();
                    v159.emitPurchaseFlowEvent("UserInput", "Buy");
                end, 
                cancelPurchaseActivated = function() --[[ Line: 913 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v159 (copy)
                    v159.cancelButtonPressed();
                    v159.emitPurchaseFlowEvent("UserInput", "Cancel");
                end, 
                isLuobu = v159.state.isLuobu, 
                isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
            });
        end;
    elseif l_promptState_3 == v31.LeaveRobloxWarning then
        return l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
            screenSize = v159.state.screenSize, 
            cancelActivated = v159.cancelButtonPressed, 
            continueActivated = v159.confirmButtonPressed
        });
    elseif l_promptState_3 == v31.PurchaseComplete and l_requestType_2 == v30.AvatarCreationFee then
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            bodyText = v10:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v159.confirmButtonPressed, 
                            text = v10:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                            inputIcon = v159.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                        }
                    }
                }
            }, 
            screenSize = v159.state.screenSize, 
            title = v10:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.TwoFactorNeededSettings or v49(l_purchaseError_1) then
        return v6.createElement(v83, {
            screenSize = v159.state.screenSize, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v159.props.economicRestrictionError or {}, 
            isGamepadEnabled = v159.props.isGamepadEnabled, 
            cancelButtonPressed = v159.cancelButtonPressed, 
            confirmButtonPressed = v159.confirmButtonPressed, 
            includeCancelButton = true, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v159.props.isUserEligibleForUnifiedPurchaseFlow else nil
        });
    elseif l_promptState_3 == v31.EnablePurchaseVPCModal then
        return l_Roact_0.createElement(l_Animator_0, {
            shouldAnimate = true, 
            shouldShow = l_promptState_3 == v31.EnablePurchaseVPCModal, 
            renderChildren = function() --[[ Line: 969 ]] --[[ Name: renderChildren ]]
                -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v159 (copy), l_promptState_3 (copy)
                return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = v159.state.screenSize, 
                    isActionable = false, 
                    modalType = v159.getVPCModalType(l_promptState_3), 
                    onDismiss = function() --[[ Line: 974 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v159 (ref)
                        v159.confirmButtonPressed();
                    end
                });
            end
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.NotEnoughRobuxXbox and l_DesktopUpsellExperiment_0.shouldShowNewModal() then
        return l_Roact_0.createElement(l_RobuxUpsellModalTooExpensiveFallback_0, {
            screenSize = v159.state.screenSize, 
            product = {
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v159.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
            }, 
            balanceAmount = l_accountInfo_0.balance, 
            doneActivated = function() --[[ Line: 997 ]] --[[ Name: doneActivated ]]
                -- upvalues: v159 (copy)
                v159.cancelButtonPressed();
                v159.emitPurchaseFlowEvent("UserInput", "Cancel");
            end
        });
    else
        return v6.createElement(v83, {
            screenSize = v159.state.screenSize, 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v159.props.economicRestrictionError or {}, 
            isGamepadEnabled = v159.props.isGamepadEnabled, 
            cancelButtonPressed = v159.cancelButtonPressed, 
            confirmButtonPressed = v159.confirmButtonPressed, 
            includeCancelButton = false, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v159.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            isMultiItem = v61(v159.props.requestType) == l_UnifiedPurchaseModalTypeEnum_0.MultiItem
        });
    end;
end;
v82.render = function(v173) --[[ Line: 1023 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v57 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v30 (copy), v31 (copy), v45 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v46 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_promptState_4 = v173.props.promptState;
    local v175 = v173:determinePrompt();
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v173.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v57, {
            shouldShow = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v173.props.windowState == v32.Shown else v173.props.windowState ~= v32.Hidden, 
            onShown = function() --[[ Line: 1036 ]] --[[ Name: onShown ]]
                -- upvalues: v173 (copy), v30 (ref), l_promptState_4 (copy), v31 (ref), v45 (ref)
                if v173.props.requestType == v30.AvatarCreationFee and l_promptState_4 == v31.PromptPurchase then
                    v45.sendPageLoad(v45.Section.BuyItemModal);
                end;
                v173:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 1048 ]] --[[ Name: onHidden ]]
                -- upvalues: v173 (copy)
                v173:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
            end, 
            skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v173.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            [l_Roact_0.Ref] = v173.animatorRef
        }, {
            Prompt = v175, 
            ModalFix = v175 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v46, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 1069 ]] --[[ Name: callback ]]
                -- upvalues: v173 (copy)
                if v173.props.hideWindow then
                    v173.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v46, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v176, v177) --[[ Line: 1077 ]] --[[ Name: callback ]]
                -- upvalues: v173 (copy)
                if not v176 or not v177 then
                    v173.props.hideWindow();
                end;
            end
        })
    });
end;
return (v43(function(v178) --[[ Line: 1087 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v42 (copy), v50 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v60 (copy), v62 (copy), v64 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy)
    local v179 = v42(v178.promptRequest.requestType);
    local v180 = if v178.abVariations then v178.abVariations.DesktopUpsellExpVariant else nil;
    return {
        purchaseFlowUUID = v178.purchaseFlowUUID, 
        purchaseFlow = v178.purchaseFlow, 
        promptState = v178.promptState, 
        requestType = v178.promptRequest.requestType, 
        humanoidModel = v178.promptRequest.humanoidModel, 
        expectedPrice = v178.promptRequest.expectedPrice, 
        windowState = v178.windowState, 
        purchaseError = v178.purchaseError, 
        economicRestrictionError = v178.economicRestrictionError, 
        productInfo = v178.productInfo, 
        accountInfo = v178.accountInfo, 
        robuxPurchaseAmount = v50.getRobuxPurchaseAmount(v178), 
        robuxAmountBeforeBonus = v50.getRobuxAmountBeforeBonus(v178), 
        robuxPurchaseCost = v50.getPrice(v178), 
        isTestPurchase = v179, 
        isGamepadEnabled = v178.gamepadEnabled, 
        desktopUpsellExpVariant = v180, 
        postPurchaseActions = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v178.postPurchaseActions else nil, 
        purchaseCallbacks = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v178.purchaseCallbacks else nil, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v178.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v178.purchaseAnalyticsMetadata else nil, 
        productPrice = if v60 then v62(v178) else nil, 
        price = if v64 then v64(v178) else nil, 
        timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 and v178.productPayload then v178.productPayload.timedOptionDays else nil, 
        robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v178.robloxSubscriptionProducts else nil
    };
end, function(v181) --[[ Line: 1129 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v67 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v54 (copy), v35 (copy), v36 (copy), v28 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), l_GuiService_0 (copy), v37 (copy), v44 (copy), v68 (copy), v65 (copy)
    return {
        setPurchaseFlowUUID = function(v182) --[[ Line: 1131 ]] --[[ Name: setPurchaseFlowUUID ]]
            -- upvalues: v181 (copy), v67 (ref)
            v181(v67(v182));
        end, 
        onBuy = function() --[[ Line: 1134 ]] --[[ Name: onBuy ]]
            -- upvalues: v181 (copy), v38 (ref)
            v181(v38());
        end, 
        completePurchase = function() --[[ Line: 1137 ]] --[[ Name: completePurchase ]]
            -- upvalues: v181 (copy), v39 (ref)
            v181(v39());
        end, 
        onScaryModalConfirm = function() --[[ Line: 1140 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v181 (copy), v40 (ref)
            v181(v40());
        end, 
        onOpenSecuritySettings = function(v183) --[[ Line: 1143 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v181 (copy), v41 (ref)
            if v183 then
                v181(v41(v183));
                return;
            else
                v181(v41());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 1150 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v181 (copy), v54 (ref)
            v181(v54());
        end, 
        hideWindow = function() --[[ Line: 1153 ]] --[[ Name: hideWindow ]]
            -- upvalues: v181 (copy), v35 (ref)
            v181(v35());
        end, 
        retryPurchaseAfterUpsell = function() --[[ Line: 1156 ]] --[[ Name: retryPurchaseAfterUpsell ]]
            -- upvalues: v181 (copy), v36 (ref)
            v181(v36());
        end, 
        setWindowState = function(v184) --[[ Line: 1159 ]] --[[ Name: setWindowState ]]
            -- upvalues: v181 (copy), v28 (ref)
            v181(v28(v184));
        end, 
        completeRequest = function() --[[ Line: 1162 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), l_GuiService_0 (ref), v181 (copy), v37 (ref)
            if l_FFlagAddCursorProviderToPurchasePromptApp_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v181(v37());
        end, 
        onAnalyticEvent = function(v185, v186) --[[ Line: 1168 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v181 (copy), v44 (ref)
            v181(v44(v185, v186));
        end, 
        setPostPurchaseActions = function(v187) --[[ Line: 1171 ]] --[[ Name: setPostPurchaseActions ]]
            -- upvalues: v181 (copy), v68 (ref)
            v181(v68(v187));
        end, 
        setPromptState = function(v188) --[[ Line: 1174 ]] --[[ Name: setPromptState ]]
            -- upvalues: v181 (copy), v65 (ref)
            v181(v65(v188));
        end
    };
end)(v82));