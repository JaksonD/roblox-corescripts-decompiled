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
local v23 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v24 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v25 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v26 = require(l_script_FirstAncestor_0.Enums.WindowState);
local v27 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v28 = require(l_script_FirstAncestor_0.Thunks.hideWindow);
local v29 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v30 = require(l_script_FirstAncestor_0.Thunks.purchaseItem);
local v31 = require(l_script_FirstAncestor_0.Thunks.completePurchase);
local v32 = require(l_script_FirstAncestor_0.Thunks.launchRobuxUpsell);
local v33 = require(l_script_FirstAncestor_0.Thunks.openSecuritySettings);
local v34 = require(l_script_FirstAncestor_0.Utils.isMockingPurchases);
local v35 = require(l_script_FirstAncestor_0.connectToStore);
local v36 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v37 = require(l_script_FirstAncestor_0.Utils.PublishAssetAnalytics);
local v38 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v39 = require(l_script_FirstAncestor_0.Localization.LocalizationService);
local v40 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v41 = require(l_script_FirstAncestor_0.Utils.isGenericChallengeResponse);
local v42 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_ProductPurchaseSurface_0 = require(l_Parent_0.PurchasePromptLite).Enums.ProductPurchaseSurface;
local v44 = require(l_script_FirstAncestor_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v45 = require(l_script_FirstAncestor_0.Utils.emitPerformanceMetrics);
local v46 = require(l_script_FirstAncestor_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local l_VerifiedParentalConsentDialog_0 = require(l_Parent_0.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog;
local v48 = require(l_script_FirstAncestor_0.Enums.VPCModalType);
local v49 = require(script.Parent.Animator);
local l_FFlagAddCursorProviderToPurchasePromptApp_0 = require(l_Parent_0.SharedFlags).FFlagAddCursorProviderToPurchasePromptApp;
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice);
local v52 = require(l_script_FirstAncestor_0.Utils.getUnifiedPurchaseModalType);
local v53 = require(l_script_FirstAncestor_0.Selectors.selectProductPrice);
local l_HttpService_0 = game:GetService("HttpService");
local v55 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v56 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v57 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v58 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v59 = require(l_script_FirstAncestor_0.Misc.Constants);
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v61 = require(l_Parent_0.LoggingProtocol);
local v62 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v63 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v64 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_DesktopUpsellExperiment_0 = v16.Utility.DesktopUpsellExperiment;
local l_ProductPurchaseModal_0 = v16.ProductPurchaseModal;
local l_RobuxUpsellModal_0 = v16.RobuxUpsellModal;
local l_RobuxUpsellModalTooExpensiveFallback_0 = v16.RobuxUpsellModalTooExpensiveFallback;
local v69 = l_Roact_0.Component:extend(script.Name);
local v70 = require(script.Parent.ProductPurchasePrompt);
local v71 = require(l_Parent_0.SharedFlags);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = v71.GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v71.FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseModalTypeEnum_0 = v16.Enums.UnifiedPurchaseModalTypeEnum;
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v83 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true);
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_Parent_0.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local function v89(v85, v86, v87) --[[ Line: 137 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v25 (copy), v23 (copy), v24 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v87 == v25.InitializingPurchase and v86 == v23.RobuxUpsellV2 then
        return true;
    elseif v86 == v23.RobuxUpsellV2 or v86 == v23.LargeRobuxUpsell then
        return false;
    else
        local v88 = true;
        if v85 ~= v24.Asset then
            v88 = true;
            if v85 ~= v24.Bundle then
                v88 = true;
                if v85 ~= v24.GamePass then
                    v88 = true;
                    if v85 ~= v24.Product then
                        v88 = true;
                        if v85 ~= v24.AvatarCreationFee then
                            v88 = l_FFlagEnableUnifiedProductPurchaseFlow_0 and v85 == v24.Experience or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v85 == v24.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v85 == v24.DeveloperSubscription;
                        end;
                    end;
                end;
            end;
        end;
        return v88;
    end;
end;
local function _(v90, v91, v92) --[[ Line: 160 ]] --[[ Name: getIsFiatProduct ]]
    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v24 (copy)
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v90 == v24.DeveloperSubscription then
        local v93 = false;
        if v91.displayPrice ~= nil then
            v93 = v92 == 0;
        end;
        return v93;
    else
        return false;
    end;
end;
local function _(v95) --[[ Line: 168 ]] --[[ Name: promptStateToViewName ]]
    -- upvalues: v25 (copy)
    return ({
        [v25.RobuxUpsell] = "PurchaseModal", 
        [v25.UpsellInProgress] = "RobuxPurchasePending"
    })[v95];
end;
v69.init = function(v97) --[[ Line: 176 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v60 (copy), v61 (copy), v62 (copy), v9 (copy), v25 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v57 (copy), v83 (copy), l_Players_0 (copy), v89 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v44 (copy), v63 (copy), v58 (copy), v27 (copy), v41 (copy), v24 (copy), v37 (copy), v26 (copy), l_ContextActionService_0 (copy), v48 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v45 (copy), v59 (copy)
    v97.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false, 
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    if not v60 then
        v97.props.setPurchaseFlowUUID(l_HttpService_0:GenerateGUID(false));
        v61.default:logRobloxTelemetryCounter(v62.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerInit"
        });
    end;
    coroutine.wrap(function() --[[ Line: 195 ]]
        -- upvalues: v9 (ref), v97 (copy)
        if v9:IsSubjectToChinaPolicies() then
            v97:setState({
                isLuobu = true
            });
        end;
    end)();
    v97.emitPurchaseFlowEvent = function(v98, v99) --[[ Line: 206 ]]
        -- upvalues: v97 (copy), v25 (ref), l_HttpService_0 (ref)
        local l_promptState_0 = v97.props.promptState;
        local v101 = ({
            [v25.RobuxUpsell] = "PurchaseModal", 
            [v25.UpsellInProgress] = "RobuxPurchasePending"
        })[l_promptState_0];
        if not v101 then
            return;
        else
            l_promptState_0 = {
                purchase_flow_uuid = v97.props.purchaseFlowUUID, 
                purchase_flow = "InGameRobuxUpsell", 
                view_name = v101, 
                purchase_event_type = v98, 
                input_type = v99, 
                event_metadata = l_HttpService_0:JSONEncode({
                    universe_id = tostring(game.GameId), 
                    item_product_id = tostring(v97.props.productInfo.productId), 
                    item_name = v97.props.productInfo.name, 
                    price = tostring(v97.props.productInfo.price), 
                    user_balance = tostring(v97.props.accountInfo.balance) or nil, 
                    package_robux_amount = tostring(v97.props.robuxPurchaseAmount) or nil
                })
            };
            v97.props.onAnalyticEvent("UserPurchaseFlow", l_promptState_0);
            return;
        end;
    end;
    v97.emitUnifiedProductPurchaseFlowEvent = function(v102) --[[ Line: 230 ]]
        -- upvalues: v97 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v57 (ref)
        local v103 = v97.props.purchaseAnalyticsMetadata or {};
        local v104 = {
            event_name = v102, 
            purchase_flow_uuid = v103.purchaseFlowUUID, 
            product_id = v103.productId, 
            product_type = v103.productType, 
            product_target_id = v103.productTargetId, 
            robux_price = v103.price, 
            surface = v103.surface, 
            user_roblox_balance = v103.userRobuxBalance, 
            salelocation_universeid = v103.saleLocationUniverseId, 
            product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v103.productUniverseId else nil
        };
        v57(v104);
    end;
    v97.changeScreenSize = function(v105) --[[ Line: 249 ]]
        -- upvalues: v97 (copy)
        if v97.state.screenSize ~= v105.AbsoluteSize then
            v97:setState({
                screenSize = v105.AbsoluteSize
            });
        end;
    end;
    v97.hasDelayedInput = function() --[[ Line: 257 ]]
        -- upvalues: v83 (ref), v97 (copy), v25 (ref)
        if not v83 and v97.props.isTestPurchase then
            return false;
        else
            local l_promptState_1 = v97.props.promptState;
            if v83 then
                local v107 = true;
                if l_promptState_1 ~= v25.PurchaseInProgress then
                    v107 = true;
                    if l_promptState_1 ~= v25.RobuxUpsell then
                        v107 = l_promptState_1 == v25.UpsellInProgress;
                    end;
                end;
                return v107;
            else
                local v108 = true;
                if l_promptState_1 ~= v25.PromptPurchase then
                    v108 = true;
                    if l_promptState_1 ~= v25.PurchaseInProgress then
                        v108 = true;
                        if l_promptState_1 ~= v25.RobuxUpsell then
                            v108 = l_promptState_1 == v25.UpsellInProgress;
                        end;
                    end;
                end;
                return v108;
            end;
        end;
    end;
    v97.isWindowShowAndDoneAnimating = function() --[[ Line: 280 ]]
        -- upvalues: v97 (copy)
        return v97.state.isAnimating == false;
    end;
    v97.canConfirmInput = function() --[[ Line: 284 ]]
        -- upvalues: l_Players_0 (ref), v97 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v109 = v97.isWindowShowAndDoneAnimating();
            if v97.hasDelayedInput() then
                local v110 = false;
                if v97.state.doneAnimatingTime then
                    v110 = os.clock() - v97.state.doneAnimatingTime > 2.5;
                end;
                return v109 and v110;
            else
                return v109;
            end;
        end;
    end;
    v97.getConfirmButtonAction = function(v111, v112, v113) --[[ Line: 309 ]]
        -- upvalues: v25 (ref), v89 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v97 (copy), v44 (ref), v63 (ref), v58 (ref), v27 (ref), v41 (ref)
        if v111 == v25.None or not v89(v112) then
            return nil;
        elseif v111 == v25.PromptPurchase or v111 == v25.PurchaseInProgress then
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v97.props.isUserEligibleForUnifiedPurchaseFlow then
                local v114 = v97.props.purchaseAnalyticsMetadata or {};
                v44(v63.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v114.surface, v114.productType);
                v97.emitUnifiedProductPurchaseFlowEvent(v58.BuyItemModalBuyClicked);
            end;
            return v97.props.onBuy;
        elseif v111 == v25.RobuxUpsell or v111 == v25.UpsellInProgress or v111 == v25.LeaveRobloxWarning then
            return v97.props.onRobuxUpsell;
        elseif v111 == v25.U13PaymentModal or v111 == v25.U13MonthlyThreshold1Modal or v111 == v25.U13MonthlyThreshold2Modal or v111 == v25.ParentalConsentWarningPaymentModal13To17 then
            return v97.props.onScaryModalConfirm;
        elseif v111 == v25.Error and v113 == v27.TwoFactorNeededSettings then
            return v97.props.onOpenSecuritySettings;
        elseif v41(v113) then
            return function() --[[ Line: 341 ]]
                -- upvalues: v97 (ref), v113 (copy)
                v97.props.onOpenSecuritySettings(v113);
            end;
        else
            return v97.props.hideWindow;
        end;
    end;
    v97.getCancelButtonAction = function(v115, v116) --[[ Line: 349 ]]
        -- upvalues: v25 (ref), v89 (ref), v97 (copy)
        if v115 == v25.None or not v89(v116) then
            return nil;
        else
            return v97.props.hideWindow;
        end;
    end;
    v97.confirmButtonPressed = function() --[[ Line: 357 ]]
        -- upvalues: v97 (copy), v24 (ref), v25 (ref), v37 (ref)
        if v97.props.requestType == v24.AvatarCreationFee and v97.props.promptState == v25.PromptPurchase then
            v37.sendButtonClicked(v37.Section.BuyItemModal, v37.Element.Buy);
        end;
        local v117 = v97.getConfirmButtonAction(v97.props.promptState, v97.props.requestType, v97.props.purchaseError);
        if v117 ~= nil and v97.canConfirmInput() then
            v117();
        end;
    end;
    v97.cancelButtonPressed = function() --[[ Line: 374 ]]
        -- upvalues: v97 (copy), v24 (ref), v25 (ref), v37 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v44 (ref), v63 (ref)
        if v97.props.requestType == v24.AvatarCreationFee and v97.props.promptState == v25.PromptPurchase then
            v37.sendButtonClicked(v37.Section.BuyItemModal, v37.Element.Cancel);
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v97.props.isUserEligibleForUnifiedPurchaseFlow then
            v44(v63.UnifiedProductPurchaseModalCancelButtonClickedCounter, v97.props.purchaseAnalyticsMetadata.surface, v97.props.purchaseAnalyticsMetadata.productType);
        end;
        local v118 = v97.getCancelButtonAction(v97.props.promptState, v97.props.requestType);
        if v118 ~= nil then
            v118();
        end;
    end;
    v97.configContextActionService = function(v119) --[[ Line: 399 ]]
        -- upvalues: v26 (ref), l_ContextActionService_0 (ref), v97 (copy)
        if v119 == v26.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v121, _) --[[ Line: 401 ]]
                -- upvalues: v97 (ref)
                if v121 == Enum.UserInputState.Begin then
                    v97.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v124, _) --[[ Line: 406 ]]
                -- upvalues: v97 (ref)
                if v124 == Enum.UserInputState.Begin then
                    v97.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v97.getVPCModalType = function(v126) --[[ Line: 417 ]]
        -- upvalues: v25 (ref), v48 (ref)
        if v126 == v25.EnablePurchaseVPCModal then
            return v48.toRawValue(v48.EnablePurchase);
        else
            return v48.toRawValue(v48.None);
        end;
    end;
    v97.onBuyItemButtonMounted = function(v127) --[[ Line: 424 ]]
        -- upvalues: v97 (copy), v44 (ref), v63 (ref), v58 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v45 (ref), v59 (ref)
        local v128 = v97.props.purchaseAnalyticsMetadata or {};
        v44(v63.UnifiedProductPurchaseModalShownCounter, v128.surface, v128.productType);
        v97.emitUnifiedProductPurchaseFlowEvent(v58.BuyItemModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v128 and v128.surface then
            v45(v59.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v128.surface);
        end;
        if v97.props.purchaseCallbacks and v97.props.purchaseCallbacks.onBuyItemButtonMounted then
            v97.props.purchaseCallbacks.onBuyItemButtonMounted(v127);
        end;
    end;
end;
v69.didMount = function(v129) --[[ Line: 450 ]] --[[ Name: didMount ]]
    -- upvalues: v26 (copy), v89 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v129.props.purchaseFlow;
    local l_requestType_0 = v129.props.requestType;
    if v129.props.windowState == v26.Shown and v89(l_requestType_0, l_purchaseFlow_0) then
        v129:setState({
            isAnimating = true
        });
        v129.configContextActionService(v129.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v69.willUpdate = function(v132, v133) --[[ Line: 464 ]] --[[ Name: willUpdate ]]
    if v132.props.expectedPrice ~= v133.expectedPrice then
        v132:setState({});
    end;
end;
v69.didUpdate = function(v134, v135, _) --[[ Line: 470 ]] --[[ Name: didUpdate ]]
    -- upvalues: v60 (copy), v25 (copy), l_HttpService_0 (copy), v61 (copy), v62 (copy), l_Players_0 (copy), v89 (copy), l_GuiService_0 (copy), v26 (copy), v24 (copy), v37 (copy)
    if not v60 and v134.props.promptState ~= v135.promptState and v134.props.promptState == v25.None then
        local v137 = l_HttpService_0:GenerateGUID(false);
        v134.props.setPurchaseFlowUUID(v137);
        v61.default:logRobloxTelemetryCounter(v62.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerDidUpdate"
        });
    end;
    if l_Players_0.LocalPlayer.GameplayPaused then
        v134.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v134.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v134.props.purchaseFlow;
    local l_requestType_1 = v134.props.requestType;
    if v135.windowState ~= v134.props.windowState and v89(l_requestType_1, l_purchaseFlow_1) then
        v134:setState({
            isAnimating = true
        });
        v134.configContextActionService(v134.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v134.props.windowState == v26.Shown);
        if v134.props.windowState == v26.Hidden then
            v134.props.completeRequest();
        end;
    end;
    if l_requestType_1 == v24.AvatarCreationFee and v134.props.promptState == v25.PurchaseComplete and v135.promptState ~= v25.PurchaseComplete then
        v37.sendPageLoad(v37.Section.ProcessCompleteModal);
    end;
    if v135.promptState ~= v134.props.promptState then
        v134.emitPurchaseFlowEvent("ViewShown");
    end;
end;
v69.getMessageKeysFromPromptState = function(v140) --[[ Line: 529 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v25 (copy), v27 (copy), v39 (copy), v41 (copy)
    local l_promptState_2 = v140.props.promptState;
    local l_productInfo_0 = v140.props.productInfo;
    local l_purchaseError_0 = v140.props.purchaseError;
    if l_promptState_2 == v25.PurchaseComplete then
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
    elseif l_promptState_2 == v25.U13PaymentModal then
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
    elseif l_promptState_2 == v25.U13MonthlyThreshold1Modal then
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
    elseif l_promptState_2 == v25.U13MonthlyThreshold2Modal then
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
    elseif l_promptState_2 == v25.ParentalConsentWarningPaymentModal13To17 then
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
    elseif l_promptState_2 == v25.Error then
        if l_purchaseError_0 == v27.UnknownFailure then
            return {
                messageText = {
                    key = v39.getErrorKey(l_purchaseError_0), 
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
        elseif l_purchaseError_0 == v27.TwoFactorNeededSettings or v41(l_purchaseError_0) then
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
                    key = v39.getErrorKey(l_purchaseError_0)
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
v69.determinePrompt = function(v144) --[[ Line: 598 ]] --[[ Name: determinePrompt ]]
    -- upvalues: v25 (copy), v89 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v24 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), v64 (copy), l_Roact_0 (copy), l_UnifiedProductPurchaseModalV2_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v52 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_UnifiedProductPurchaseModal_0 (copy), v51 (copy), v40 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_ProductPurchaseModal_0 (copy), l_ProductPurchase_0 (copy), l_RobuxUpsellModal_0 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v10 (copy), l_ButtonType_0 (copy), v27 (copy), v41 (copy), v6 (copy), v70 (copy), l_Images_0 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), l_RobuxUpsellModalTooExpensiveFallback_0 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy)
    local l_purchaseFlow_2 = v144.props.purchaseFlow;
    local l_promptState_3 = v144.props.promptState;
    local l_expectedPrice_0 = v144.props.expectedPrice;
    local l_requestType_2 = v144.props.requestType;
    local l_purchaseError_1 = v144.props.purchaseError;
    local l_productInfo_1 = v144.props.productInfo;
    local l_accountInfo_0 = v144.props.accountInfo;
    local l_isTestPurchase_0 = v144.props.isTestPurchase;
    if l_promptState_3 == v25.None or not v89(l_requestType_2, l_purchaseFlow_2, if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 else nil) then
        return nil;
    elseif l_promptState_3 == v25.PromptPurchase or l_promptState_3 == v25.PurchaseInProgress or l_FFlagUnifiedPurchaseAddSkeleton_0 and l_promptState_3 == v25.InitializingPurchase then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v144.props.isUserEligibleForUnifiedPurchaseFlow then
            local l_productPrice_0 = v144.props.productPrice;
            local v154 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then l_requestType_2 == v24.DeveloperSubscription and l_productInfo_1.displayPrice ~= nil and l_productPrice_0 == 0 else false;
            if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v64.get() == v64.Enum.IN_APP then
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModalV2_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v154 then nil else v144.props.productPrice, 
                        itemDisplayPrice = if v154 then l_productInfo_1.displayPrice else nil, 
                        model = v144.props.humanoidModel
                    }, 
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v144.props.subtitleView else nil, 
                    buttons = {
                        buyItemActivated = v144.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v144.isWindowShowAndDoneAnimating() and v64.get() == v64.Enum.IN_EXPERIENCE, 
                        cancelActivated = v144.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v25.PurchaseInProgress
                    }, 
                    postPurchaseActions = v144.props.postPurchaseActions, 
                    setPostPurchaseActions = v144.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v144.onBuyItemButtonMounted, 
                    purchaseModalType = v52(v144.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 == v25.InitializingPurchase else nil
                });
            else
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModal_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v154 then nil else if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                        itemDisplayPrice = if v154 then l_productInfo_1.displayPrice else nil, 
                        model = v144.props.humanoidModel
                    }, 
                    buttons = {
                        buyItemActivated = v144.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v144.isWindowShowAndDoneAnimating() and v64.get() == v64.Enum.IN_EXPERIENCE, 
                        cancelActivated = v144.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v25.PurchaseInProgress
                    }, 
                    postPurchaseActions = v144.props.postPurchaseActions, 
                    setPostPurchaseActions = v144.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v144.onBuyItemButtonMounted, 
                    purchaseModalType = v52(v144.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v144.props.purchaseAnalyticsMetadata and v144.props.purchaseAnalyticsMetadata.surface == l_ProductPurchaseSurface_0.Catalog else nil
                });
            end;
        elseif l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_ProductPurchaseModal_0, {
                screenSize = v144.state.screenSize, 
                product = {
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                balanceAmount = l_accountInfo_0.balance, 
                balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not l_accountInfo_0.hasFailed, 
                buttons = {
                    isDisabled = l_promptState_3 == v25.PurchaseInProgress, 
                    buyItemActivated = v144.confirmButtonPressed, 
                    buyItemControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemIsDelayedInput = v144.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v144.isWindowShowAndDoneAnimating(), 
                    cancelActivated = v144.cancelButtonPressed
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v144.state.screenSize, 
                isDisabled = l_promptState_3 == v25.PurchaseInProgress, 
                model = v144.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                currentBalanceValid = not l_accountInfo_0.hasFailed, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v144.hasDelayedInput(), 
                enableInputDelayed = v144.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = v144.confirmButtonPressed, 
                cancelPurchaseActivated = v144.cancelButtonPressed, 
                isLuobu = v144.state.isLuobu
            });
        end;
    elseif l_promptState_3 == v25.RobuxUpsell or l_promptState_3 == v25.UpsellInProgress then
        if l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_RobuxUpsellModal_0, {
                screenSize = v144.state.screenSize, 
                product = {
                    model = v144.props.humanoidModel, 
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                upsell = {
                    balanceAmount = l_accountInfo_0.balance, 
                    robuxPurchaseAmount = v144.props.robuxPurchaseAmount, 
                    robuxPurchaseAmountBeforeBonus = v144.props.robuxAmountBeforeBonus, 
                    robuxPurchaseCost = v144.props.robuxPurchaseCost
                }, 
                buttons = {
                    buyItemActivated = function() --[[ Line: 769 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v144 (copy)
                        v144.confirmButtonPressed();
                        v144.emitPurchaseFlowEvent("UserInput", "Buy");
                    end, 
                    buyItemDisabled = l_promptState_3 == v25.UpsellInProgress, 
                    buyItemControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemisDelayedInput = v144.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v144.isWindowShowAndDoneAnimating(), 
                    cancelPurchaseActivated = function() --[[ Line: 778 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v144 (copy)
                        v144.cancelButtonPressed();
                        v144.emitPurchaseFlowEvent("UserInput", "Cancel");
                    end, 
                    cancelControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                    opensBuyRobuxPage = l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v144.state.screenSize, 
                isDisabled = l_promptState_3 == v25.UpsellInProgress, 
                model = v144.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = v144.props.robuxPurchaseAmount, 
                robuxPurchaseAmountBeforeBonus = v144.props.robuxAmountBeforeBonus, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v144.hasDelayedInput(), 
                enableInputDelayed = v144.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = function() --[[ Line: 808 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v144 (copy)
                    v144.confirmButtonPressed();
                    v144.emitPurchaseFlowEvent("UserInput", "Buy");
                end, 
                cancelPurchaseActivated = function() --[[ Line: 812 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v144 (copy)
                    v144.cancelButtonPressed();
                    v144.emitPurchaseFlowEvent("UserInput", "Cancel");
                end, 
                isLuobu = v144.state.isLuobu, 
                isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
            });
        end;
    elseif l_promptState_3 == v25.LeaveRobloxWarning then
        return l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
            screenSize = v144.state.screenSize, 
            cancelActivated = v144.cancelButtonPressed, 
            continueActivated = v144.confirmButtonPressed
        });
    elseif l_promptState_3 == v25.PurchaseComplete and l_requestType_2 == v24.AvatarCreationFee then
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            bodyText = v10:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v144.confirmButtonPressed, 
                            text = v10:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                            inputIcon = v144.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                        }
                    }
                }
            }, 
            screenSize = v144.state.screenSize, 
            title = v10:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
        });
    elseif l_promptState_3 == v25.Error and l_purchaseError_1 == v27.TwoFactorNeededSettings or v41(l_purchaseError_1) then
        return v6.createElement(v70, {
            screenSize = v144.state.screenSize, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v144.props.economicRestrictionError or {}, 
            isGamepadEnabled = v144.props.isGamepadEnabled, 
            cancelButtonPressed = v144.cancelButtonPressed, 
            confirmButtonPressed = v144.confirmButtonPressed, 
            includeCancelButton = true, 
            isGenericChallengeResponse = v41, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v144.props.isUserEligibleForUnifiedPurchaseFlow else nil
        });
    elseif l_promptState_3 == v25.EnablePurchaseVPCModal then
        return l_Roact_0.createElement(l_Animator_0, {
            shouldAnimate = true, 
            shouldShow = l_promptState_3 == v25.EnablePurchaseVPCModal, 
            renderChildren = function() --[[ Line: 868 ]] --[[ Name: renderChildren ]]
                -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v144 (copy), l_promptState_3 (copy)
                return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = v144.state.screenSize, 
                    isActionable = false, 
                    modalType = v144.getVPCModalType(l_promptState_3), 
                    onDismiss = function() --[[ Line: 873 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v144 (ref)
                        v144.confirmButtonPressed();
                    end
                });
            end
        });
    elseif l_promptState_3 == v25.Error and l_purchaseError_1 == v27.NotEnoughRobuxXbox and l_DesktopUpsellExperiment_0.shouldShowNewModal() then
        return l_Roact_0.createElement(l_RobuxUpsellModalTooExpensiveFallback_0, {
            screenSize = v144.state.screenSize, 
            product = {
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v51 then v144.props.productPrice else v40(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
            }, 
            balanceAmount = l_accountInfo_0.balance, 
            doneActivated = function() --[[ Line: 896 ]] --[[ Name: doneActivated ]]
                -- upvalues: v144 (copy)
                v144.cancelButtonPressed();
                v144.emitPurchaseFlowEvent("UserInput", "Cancel");
            end
        });
    else
        return v6.createElement(v70, {
            screenSize = v144.state.screenSize, 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v144.props.economicRestrictionError or {}, 
            isGamepadEnabled = v144.props.isGamepadEnabled, 
            cancelButtonPressed = v144.cancelButtonPressed, 
            confirmButtonPressed = v144.confirmButtonPressed, 
            includeCancelButton = false, 
            isGenericChallengeResponse = v41, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v144.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            isMultiItem = v52(v144.props.requestType) == l_UnifiedPurchaseModalTypeEnum_0.MultiItem
        });
    end;
end;
v69.render = function(v155) --[[ Line: 922 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v49 (copy), v26 (copy), v24 (copy), v25 (copy), v37 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v38 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_promptState_4 = v155.props.promptState;
    local v157 = v155:determinePrompt();
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v155.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v49, {
            shouldShow = v155.props.windowState ~= v26.Hidden, 
            onShown = function() --[[ Line: 933 ]] --[[ Name: onShown ]]
                -- upvalues: v155 (copy), v24 (ref), l_promptState_4 (copy), v25 (ref), v37 (ref)
                if v155.props.requestType == v24.AvatarCreationFee and l_promptState_4 == v25.PromptPurchase then
                    v37.sendPageLoad(v37.Section.BuyItemModal);
                end;
                v155:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 945 ]] --[[ Name: onHidden ]]
                -- upvalues: v155 (copy)
                v155:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
            end, 
            skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v155.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            [l_Roact_0.Ref] = v155.animatorRef
        }, {
            Prompt = v157, 
            ModalFix = v157 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v38, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 966 ]] --[[ Name: callback ]]
                -- upvalues: v155 (copy)
                if v155.props.hideWindow then
                    v155.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v38, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v158, v159) --[[ Line: 974 ]] --[[ Name: callback ]]
                -- upvalues: v155 (copy)
                if not v158 or not v159 then
                    v155.props.hideWindow();
                end;
            end
        })
    });
end;
return (v35(function(v160) --[[ Line: 984 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v34 (copy), v42 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v51 (copy), v53 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy)
    local v161 = v34(v160.promptRequest.requestType);
    local v162 = if v160.abVariations then v160.abVariations.DesktopUpsellExpVariant else nil;
    return {
        purchaseFlowUUID = v160.purchaseFlowUUID, 
        purchaseFlow = v160.purchaseFlow, 
        promptState = v160.promptState, 
        requestType = v160.promptRequest.requestType, 
        humanoidModel = v160.promptRequest.humanoidModel, 
        expectedPrice = v160.promptRequest.expectedPrice, 
        windowState = v160.windowState, 
        purchaseError = v160.purchaseError, 
        economicRestrictionError = v160.economicRestrictionError, 
        productInfo = v160.productInfo, 
        accountInfo = v160.accountInfo, 
        robuxPurchaseAmount = v42.getRobuxPurchaseAmount(v160), 
        robuxAmountBeforeBonus = v42.getRobuxAmountBeforeBonus(v160), 
        robuxPurchaseCost = v42.getPrice(v160), 
        isTestPurchase = v161, 
        isGamepadEnabled = v160.gamepadEnabled, 
        desktopUpsellExpVariant = v162, 
        postPurchaseActions = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v160.postPurchaseActions else nil, 
        purchaseCallbacks = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v160.purchaseCallbacks else nil, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v160.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v160.purchaseAnalyticsMetadata else nil, 
        productPrice = if v51 then v53(v160) else nil, 
        timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 and v160.productPayload then v160.productPayload.timedOptionDays else nil
    };
end, function(v163) --[[ Line: 1022 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v55 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v46 (copy), v28 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), l_GuiService_0 (copy), v29 (copy), v36 (copy), v56 (copy)
    return {
        setPurchaseFlowUUID = function(v164) --[[ Line: 1024 ]] --[[ Name: setPurchaseFlowUUID ]]
            -- upvalues: v163 (copy), v55 (ref)
            v163(v55(v164));
        end, 
        onBuy = function() --[[ Line: 1027 ]] --[[ Name: onBuy ]]
            -- upvalues: v163 (copy), v30 (ref)
            v163(v30());
        end, 
        completePurchase = function() --[[ Line: 1030 ]] --[[ Name: completePurchase ]]
            -- upvalues: v163 (copy), v31 (ref)
            v163(v31());
        end, 
        onScaryModalConfirm = function() --[[ Line: 1033 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v163 (copy), v32 (ref)
            v163(v32());
        end, 
        onOpenSecuritySettings = function(v165) --[[ Line: 1036 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v163 (copy), v33 (ref)
            if v165 then
                v163(v33(v165));
                return;
            else
                v163(v33());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 1043 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v163 (copy), v46 (ref)
            v163(v46());
        end, 
        hideWindow = function() --[[ Line: 1046 ]] --[[ Name: hideWindow ]]
            -- upvalues: v163 (copy), v28 (ref)
            v163(v28());
        end, 
        completeRequest = function() --[[ Line: 1049 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), l_GuiService_0 (ref), v163 (copy), v29 (ref)
            if l_FFlagAddCursorProviderToPurchasePromptApp_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v163(v29());
        end, 
        onAnalyticEvent = function(v166, v167) --[[ Line: 1055 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v163 (copy), v36 (ref)
            v163(v36(v166, v167));
        end, 
        setPostPurchaseActions = function(v168) --[[ Line: 1058 ]] --[[ Name: setPostPurchaseActions ]]
            -- upvalues: v163 (copy), v56 (ref)
            v163(v56(v168));
        end
    };
end)(v69));