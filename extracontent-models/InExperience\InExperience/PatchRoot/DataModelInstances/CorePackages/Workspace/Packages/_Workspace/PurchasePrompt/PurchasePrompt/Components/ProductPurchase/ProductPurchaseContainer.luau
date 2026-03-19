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
local l_FFlagAddCursorProviderToPurchasePromptApp_0 = require(l_Parent_0.SharedFlags).FFlagAddCursorProviderToPurchasePromptApp;
local v59 = require(l_script_FirstAncestor_0.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice);
local v60 = require(l_script_FirstAncestor_0.Utils.getUnifiedPurchaseModalType);
local v61 = require(l_script_FirstAncestor_0.Selectors.selectProductPrice);
local l_HttpService_0 = game:GetService("HttpService");
local v63 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v64 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v65 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v66 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v67 = require(l_script_FirstAncestor_0.Misc.Constants);
local v68 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v69 = require(l_Parent_0.LoggingProtocol);
local v70 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v71 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v72 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_DesktopUpsellExperiment_0 = v16.Utility.DesktopUpsellExperiment;
local l_ProductPurchaseModal_0 = v16.ProductPurchaseModal;
local l_RobuxUpsellModal_0 = v16.RobuxUpsellModal;
local l_RobuxUpsellModalTooExpensiveFallback_0 = v16.RobuxUpsellModalTooExpensiveFallback;
local v77 = l_Roact_0.Component:extend(script.Name);
local v78 = require(script.Parent.ProductPurchasePrompt);
local v79 = require(l_Parent_0.SharedFlags);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = v79.GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v79.FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseModalTypeEnum_0 = v16.Enums.UnifiedPurchaseModalTypeEnum;
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v92 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true);
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_Parent_0.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local function v98(v94, v95, v96) --[[ Line: 153 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v31 (copy), v29 (copy), v30 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v96 == v31.InitializingPurchase and v95 == v29.RobuxUpsellV2 then
        return true;
    elseif v95 == v29.RobuxUpsellV2 or v95 == v29.LargeRobuxUpsell then
        return false;
    else
        local v97 = true;
        if v94 ~= v30.Asset then
            v97 = true;
            if v94 ~= v30.Bundle then
                v97 = true;
                if v94 ~= v30.GamePass then
                    v97 = true;
                    if v94 ~= v30.Product then
                        v97 = true;
                        if v94 ~= v30.AvatarCreationFee then
                            v97 = l_FFlagEnableUnifiedProductPurchaseFlow_0 and v94 == v30.Experience or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v94 == v30.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v94 == v30.DeveloperSubscription;
                        end;
                    end;
                end;
            end;
        end;
        return v97;
    end;
end;
local function _(v99, v100, v101) --[[ Line: 176 ]] --[[ Name: getIsFiatProduct ]]
    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy)
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v99 == v30.DeveloperSubscription then
        local v102 = false;
        if v100.displayPrice ~= nil then
            v102 = v101 == 0;
        end;
        return v102;
    else
        return false;
    end;
end;
local function _(v104) --[[ Line: 184 ]] --[[ Name: promptStateToViewName ]]
    -- upvalues: v31 (copy)
    return ({
        [v31.RobuxUpsell] = "PurchaseModal", 
        [v31.UpsellInProgress] = "RobuxPurchasePending"
    })[v104];
end;
v77.init = function(v106) --[[ Line: 192 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v68 (copy), v69 (copy), v70 (copy), v9 (copy), v31 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v65 (copy), v92 (copy), l_Players_0 (copy), v98 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v52 (copy), v71 (copy), v66 (copy), v33 (copy), v49 (copy), v30 (copy), v45 (copy), v32 (copy), l_ContextActionService_0 (copy), v56 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v53 (copy), v67 (copy)
    v106.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false, 
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    if not v68 then
        v106.props.setPurchaseFlowUUID(l_HttpService_0:GenerateGUID(false));
        v69.default:logRobloxTelemetryCounter(v70.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerInit"
        });
    end;
    coroutine.wrap(function() --[[ Line: 211 ]]
        -- upvalues: v9 (ref), v106 (copy)
        if v9:IsSubjectToChinaPolicies() then
            v106:setState({
                isLuobu = true
            });
        end;
    end)();
    v106.emitPurchaseFlowEvent = function(v107, v108) --[[ Line: 222 ]]
        -- upvalues: v106 (copy), v31 (ref), l_HttpService_0 (ref)
        local l_promptState_0 = v106.props.promptState;
        local v110 = ({
            [v31.RobuxUpsell] = "PurchaseModal", 
            [v31.UpsellInProgress] = "RobuxPurchasePending"
        })[l_promptState_0];
        if not v110 then
            return;
        else
            l_promptState_0 = {
                purchase_flow_uuid = v106.props.purchaseFlowUUID, 
                purchase_flow = "InGameRobuxUpsell", 
                view_name = v110, 
                purchase_event_type = v107, 
                input_type = v108, 
                event_metadata = l_HttpService_0:JSONEncode({
                    universe_id = tostring(game.GameId), 
                    item_product_id = tostring(v106.props.productInfo.productId), 
                    item_name = v106.props.productInfo.name, 
                    price = tostring(v106.props.productInfo.price), 
                    user_balance = tostring(v106.props.accountInfo.balance) or nil, 
                    package_robux_amount = tostring(v106.props.robuxPurchaseAmount) or nil
                })
            };
            v106.props.onAnalyticEvent("UserPurchaseFlow", l_promptState_0);
            return;
        end;
    end;
    v106.emitUnifiedProductPurchaseFlowEvent = function(v111) --[[ Line: 246 ]]
        -- upvalues: v106 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v65 (ref)
        local v112 = v106.props.purchaseAnalyticsMetadata or {};
        local v113 = {
            event_name = v111, 
            purchase_flow_uuid = v112.purchaseFlowUUID, 
            product_id = v112.productId, 
            product_type = v112.productType, 
            product_target_id = v112.productTargetId, 
            robux_price = v112.price, 
            surface = v112.surface, 
            user_roblox_balance = v112.userRobuxBalance, 
            salelocation_universeid = v112.saleLocationUniverseId, 
            product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v112.productUniverseId else nil
        };
        v65(v113);
    end;
    v106.changeScreenSize = function(v114) --[[ Line: 265 ]]
        -- upvalues: v106 (copy)
        if v106.state.screenSize ~= v114.AbsoluteSize then
            v106:setState({
                screenSize = v114.AbsoluteSize
            });
        end;
    end;
    v106.hasDelayedInput = function() --[[ Line: 273 ]]
        -- upvalues: v92 (ref), v106 (copy), v31 (ref)
        if not v92 and v106.props.isTestPurchase then
            return false;
        else
            local l_promptState_1 = v106.props.promptState;
            if v92 then
                local v116 = true;
                if l_promptState_1 ~= v31.PurchaseInProgress then
                    v116 = true;
                    if l_promptState_1 ~= v31.RobuxUpsell then
                        v116 = l_promptState_1 == v31.UpsellInProgress;
                    end;
                end;
                return v116;
            else
                local v117 = true;
                if l_promptState_1 ~= v31.PromptPurchase then
                    v117 = true;
                    if l_promptState_1 ~= v31.PurchaseInProgress then
                        v117 = true;
                        if l_promptState_1 ~= v31.RobuxUpsell then
                            v117 = l_promptState_1 == v31.UpsellInProgress;
                        end;
                    end;
                end;
                return v117;
            end;
        end;
    end;
    v106.isWindowShowAndDoneAnimating = function() --[[ Line: 296 ]]
        -- upvalues: v106 (copy)
        return v106.state.isAnimating == false;
    end;
    v106.canConfirmInput = function() --[[ Line: 300 ]]
        -- upvalues: l_Players_0 (ref), v106 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v118 = v106.isWindowShowAndDoneAnimating();
            if v106.hasDelayedInput() then
                local v119 = false;
                if v106.state.doneAnimatingTime then
                    v119 = os.clock() - v106.state.doneAnimatingTime > 2.5;
                end;
                return v118 and v119;
            else
                return v118;
            end;
        end;
    end;
    v106.getConfirmButtonAction = function(v120, v121, v122) --[[ Line: 325 ]]
        -- upvalues: v31 (ref), v98 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v106 (copy), v52 (ref), v71 (ref), v66 (ref), v33 (ref), v49 (ref)
        if v120 == v31.None or not v98(v121) then
            return nil;
        elseif v120 == v31.PromptPurchase or v120 == v31.PurchaseInProgress then
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v106.props.isUserEligibleForUnifiedPurchaseFlow then
                local v123 = v106.props.purchaseAnalyticsMetadata or {};
                v52(v71.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v123.surface, v123.productType);
                v106.emitUnifiedProductPurchaseFlowEvent(v66.BuyItemModalBuyClicked);
            end;
            return v106.props.onBuy;
        elseif v120 == v31.RobuxUpsell or v120 == v31.UpsellInProgress or v120 == v31.LeaveRobloxWarning then
            return v106.props.onRobuxUpsell;
        elseif v120 == v31.U13PaymentModal or v120 == v31.U13MonthlyThreshold1Modal or v120 == v31.U13MonthlyThreshold2Modal or v120 == v31.ParentalConsentWarningPaymentModal13To17 then
            return v106.props.onScaryModalConfirm;
        elseif v120 == v31.Error and v122 == v33.TwoFactorNeededSettings then
            return v106.props.onOpenSecuritySettings;
        elseif v49(v122) then
            return function() --[[ Line: 357 ]]
                -- upvalues: v106 (ref), v122 (copy)
                v106.props.onOpenSecuritySettings(v122);
            end;
        else
            return v106.props.hideWindow;
        end;
    end;
    v106.getCancelButtonAction = function(v124, v125) --[[ Line: 365 ]]
        -- upvalues: v31 (ref), v98 (ref), v106 (copy)
        if v124 == v31.None or not v98(v125) then
            return nil;
        else
            return v106.props.hideWindow;
        end;
    end;
    v106.confirmButtonPressed = function() --[[ Line: 373 ]]
        -- upvalues: v106 (copy), v30 (ref), v31 (ref), v45 (ref)
        if v106.props.requestType == v30.AvatarCreationFee and v106.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Buy);
        end;
        local v126 = v106.getConfirmButtonAction(v106.props.promptState, v106.props.requestType, v106.props.purchaseError);
        if v126 ~= nil and v106.canConfirmInput() then
            v126();
        end;
    end;
    v106.cancelButtonPressed = function() --[[ Line: 390 ]]
        -- upvalues: v106 (copy), v30 (ref), v31 (ref), v45 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v52 (ref), v71 (ref)
        if v106.props.requestType == v30.AvatarCreationFee and v106.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Cancel);
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v106.props.isUserEligibleForUnifiedPurchaseFlow then
            v52(v71.UnifiedProductPurchaseModalCancelButtonClickedCounter, v106.props.purchaseAnalyticsMetadata.surface, v106.props.purchaseAnalyticsMetadata.productType);
        end;
        local v127 = v106.getCancelButtonAction(v106.props.promptState, v106.props.requestType);
        if v127 ~= nil then
            v127();
        end;
    end;
    v106.configContextActionService = function(v128) --[[ Line: 415 ]]
        -- upvalues: v32 (ref), l_ContextActionService_0 (ref), v106 (copy)
        if v128 == v32.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v130, _) --[[ Line: 417 ]]
                -- upvalues: v106 (ref)
                if v130 == Enum.UserInputState.Begin then
                    v106.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v133, _) --[[ Line: 422 ]]
                -- upvalues: v106 (ref)
                if v133 == Enum.UserInputState.Begin then
                    v106.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v106.getVPCModalType = function(v135) --[[ Line: 433 ]]
        -- upvalues: v31 (ref), v56 (ref)
        if v135 == v31.EnablePurchaseVPCModal then
            return v56.toRawValue(v56.EnablePurchase);
        else
            return v56.toRawValue(v56.None);
        end;
    end;
    v106.onBuyItemButtonMounted = function(v136) --[[ Line: 440 ]]
        -- upvalues: v106 (copy), v52 (ref), v71 (ref), v66 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v53 (ref), v67 (ref)
        local v137 = v106.props.purchaseAnalyticsMetadata or {};
        v52(v71.UnifiedProductPurchaseModalShownCounter, v137.surface, v137.productType);
        v106.emitUnifiedProductPurchaseFlowEvent(v66.BuyItemModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v137 and v137.surface then
            v53(v67.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v137.surface);
        end;
        if v106.props.purchaseCallbacks and v106.props.purchaseCallbacks.onBuyItemButtonMounted then
            v106.props.purchaseCallbacks.onBuyItemButtonMounted(v136);
        end;
    end;
end;
v77.didMount = function(v138) --[[ Line: 466 ]] --[[ Name: didMount ]]
    -- upvalues: v32 (copy), v98 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v138.props.purchaseFlow;
    local l_requestType_0 = v138.props.requestType;
    if v138.props.windowState == v32.Shown and v98(l_requestType_0, l_purchaseFlow_0) then
        v138:setState({
            isAnimating = true
        });
        v138.configContextActionService(v138.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v77.willUpdate = function(v141, v142) --[[ Line: 480 ]] --[[ Name: willUpdate ]]
    if v141.props.expectedPrice ~= v142.expectedPrice then
        v141:setState({});
    end;
end;
v77.didUpdate = function(v143, v144, _) --[[ Line: 486 ]] --[[ Name: didUpdate ]]
    -- upvalues: v68 (copy), v31 (copy), l_HttpService_0 (copy), v69 (copy), v70 (copy), l_Players_0 (copy), v98 (copy), l_GuiService_0 (copy), v32 (copy), v30 (copy), v45 (copy)
    if not v68 and v143.props.promptState ~= v144.promptState and v143.props.promptState == v31.None then
        local v146 = l_HttpService_0:GenerateGUID(false);
        v143.props.setPurchaseFlowUUID(v146);
        v69.default:logRobloxTelemetryCounter(v70.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerDidUpdate"
        });
    end;
    if l_Players_0.LocalPlayer.GameplayPaused then
        v143.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v143.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v143.props.purchaseFlow;
    local l_requestType_1 = v143.props.requestType;
    if v144.windowState ~= v143.props.windowState and v98(l_requestType_1, l_purchaseFlow_1) then
        v143:setState({
            isAnimating = true
        });
        v143.configContextActionService(v143.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v143.props.windowState == v32.Shown);
        if v143.props.windowState == v32.Hidden then
            v143.props.completeRequest();
        end;
    end;
    if l_requestType_1 == v30.AvatarCreationFee and v143.props.promptState == v31.PurchaseComplete and v144.promptState ~= v31.PurchaseComplete then
        v45.sendPageLoad(v45.Section.ProcessCompleteModal);
    end;
    if v144.promptState ~= v143.props.promptState then
        v143.emitPurchaseFlowEvent("ViewShown");
    end;
end;
v77.getMessageKeysFromPromptState = function(v149) --[[ Line: 545 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v31 (copy), v33 (copy), v47 (copy), v49 (copy)
    local l_promptState_2 = v149.props.promptState;
    local l_productInfo_0 = v149.props.productInfo;
    local l_purchaseError_0 = v149.props.purchaseError;
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
v77.determinePrompt = function(v153) --[[ Line: 614 ]] --[[ Name: determinePrompt ]]
    -- upvalues: l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v31 (copy), v98 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy), v23 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), v72 (copy), l_SurfaceContext_0 (copy), l_SurfaceName_0 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), l_Roact_0 (copy), l_UnifiedProductPurchaseModalV2_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v60 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), v24 (copy), l_UnifiedProductPurchaseModal_0 (copy), v59 (copy), v48 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_ProductPurchaseModal_0 (copy), l_ProductPurchase_0 (copy), l_RobuxUpsellModal_0 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v10 (copy), l_ButtonType_0 (copy), v33 (copy), v49 (copy), v6 (copy), v78 (copy), l_Images_0 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), l_RobuxUpsellModalTooExpensiveFallback_0 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy)
    local l_purchaseFlow_2 = v153.props.purchaseFlow;
    local l_promptState_3 = v153.props.promptState;
    local l_expectedPrice_0 = v153.props.expectedPrice;
    local l_requestType_2 = v153.props.requestType;
    local l_purchaseError_1 = v153.props.purchaseError;
    local l_productInfo_1 = v153.props.productInfo;
    local l_accountInfo_0 = v153.props.accountInfo;
    local l_isTestPurchase_0 = v153.props.isTestPurchase;
    if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v153.props.windowState ~= v32.Shown then
        return nil;
    elseif l_promptState_3 == v31.None or not v98(l_requestType_2, l_purchaseFlow_2, if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 else nil) then
        return nil;
    elseif l_promptState_3 == v31.PromptPurchase or l_promptState_3 == v31.PurchaseInProgress or l_FFlagUnifiedPurchaseAddSkeleton_0 and l_promptState_3 == v31.InitializingPurchase then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v153.props.isUserEligibleForUnifiedPurchaseFlow then
            local l_productPrice_0 = v153.props.productPrice;
            local v163 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then l_requestType_2 == v30.DeveloperSubscription and l_productInfo_1.displayPrice ~= nil and l_productPrice_0 == 0 else false;
            l_productPrice_0 = function() --[[ Line: 654 ]]
                -- upvalues: v153 (copy), v32 (ref), v23 (ref), l_RobloxSubscriptionFlowCompleteReason_0 (ref), v72 (ref), l_SurfaceContext_0 (ref), l_SurfaceName_0 (ref)
                v153.props.setWindowState(v32.Suspended);
                v23.initiateRobloxSubscriptionPurchase({}, {
                    onFlowComplete = function(v164) --[[ Line: 663 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), v153 (ref)
                        if v164 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseSucceeded then
                            v153.props.retryPurchaseAfterUpsell();
                            return;
                        elseif v164 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellDismissed then
                            v153.props.completeRequest();
                            return;
                        else
                            if v164 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseFailed then
                                v153.props.completeRequest();
                            end;
                            return;
                        end;
                    end
                }, game.GameId, if v72.get() == v72.Enum.IN_APP then l_SurfaceContext_0.InApp else l_SurfaceContext_0.InGame, l_SurfaceName_0.UnifiedProductPurchaseModal);
            end;
            if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v72.get() == v72.Enum.IN_APP then
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModalV2_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v163 then nil else v153.props.productPrice, 
                        itemDisplayPrice = if v163 then l_productInfo_1.displayPrice else nil, 
                        model = v153.props.humanoidModel
                    }, 
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v153.props.subtitleView else nil, 
                    buttons = {
                        buyItemActivated = v153.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v153.isWindowShowAndDoneAnimating() and v72.get() == v72.Enum.IN_EXPERIENCE, 
                        cancelActivated = v153.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v153.props.postPurchaseActions, 
                    setPostPurchaseActions = v153.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v153.onBuyItemButtonMounted, 
                    purchaseModalType = v60(v153.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 == v31.InitializingPurchase else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v153.props.robloxSubscriptionProducts then v24(v153.props.robloxSubscriptionProducts) else nil
                });
            else
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModal_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v163 then nil else if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                        itemDisplayPrice = if v163 then l_productInfo_1.displayPrice else nil, 
                        model = v153.props.humanoidModel
                    }, 
                    buttons = {
                        buyItemActivated = v153.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v153.isWindowShowAndDoneAnimating() and v72.get() == v72.Enum.IN_EXPERIENCE, 
                        cancelActivated = v153.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v153.props.postPurchaseActions, 
                    setPostPurchaseActions = v153.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v153.onBuyItemButtonMounted, 
                    purchaseModalType = v60(v153.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v153.props.robloxSubscriptionProducts then v24(v153.props.robloxSubscriptionProducts) else nil, 
                    hideUserRobuxBalance = v163 or if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v153.props.purchaseAnalyticsMetadata and v153.props.purchaseAnalyticsMetadata.surface == l_ProductPurchaseSurface_0.Catalog else nil
                });
            end;
        elseif l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_ProductPurchaseModal_0, {
                screenSize = v153.state.screenSize, 
                product = {
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                balanceAmount = l_accountInfo_0.balance, 
                balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not l_accountInfo_0.hasFailed, 
                buttons = {
                    isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                    buyItemActivated = v153.confirmButtonPressed, 
                    buyItemControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemIsDelayedInput = v153.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v153.isWindowShowAndDoneAnimating(), 
                    cancelActivated = v153.cancelButtonPressed
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v153.state.screenSize, 
                isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                model = v153.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                currentBalanceValid = not l_accountInfo_0.hasFailed, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v153.hasDelayedInput(), 
                enableInputDelayed = v153.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = v153.confirmButtonPressed, 
                cancelPurchaseActivated = v153.cancelButtonPressed, 
                isLuobu = v153.state.isLuobu
            });
        end;
    elseif l_promptState_3 == v31.RobuxUpsell or l_promptState_3 == v31.UpsellInProgress then
        if l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_RobuxUpsellModal_0, {
                screenSize = v153.state.screenSize, 
                product = {
                    model = v153.props.humanoidModel, 
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                upsell = {
                    balanceAmount = l_accountInfo_0.balance, 
                    robuxPurchaseAmount = v153.props.robuxPurchaseAmount, 
                    robuxPurchaseAmountBeforeBonus = v153.props.robuxAmountBeforeBonus, 
                    robuxPurchaseCost = v153.props.robuxPurchaseCost
                }, 
                buttons = {
                    buyItemActivated = function() --[[ Line: 831 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v153 (copy)
                        v153.confirmButtonPressed();
                        v153.emitPurchaseFlowEvent("UserInput", "Buy");
                    end, 
                    buyItemDisabled = l_promptState_3 == v31.UpsellInProgress, 
                    buyItemControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemisDelayedInput = v153.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v153.isWindowShowAndDoneAnimating(), 
                    cancelPurchaseActivated = function() --[[ Line: 840 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v153 (copy)
                        v153.cancelButtonPressed();
                        v153.emitPurchaseFlowEvent("UserInput", "Cancel");
                    end, 
                    cancelControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                    opensBuyRobuxPage = l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v153.state.screenSize, 
                isDisabled = l_promptState_3 == v31.UpsellInProgress, 
                model = v153.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = v153.props.robuxPurchaseAmount, 
                robuxPurchaseAmountBeforeBonus = v153.props.robuxAmountBeforeBonus, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v153.hasDelayedInput(), 
                enableInputDelayed = v153.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = function() --[[ Line: 870 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v153 (copy)
                    v153.confirmButtonPressed();
                    v153.emitPurchaseFlowEvent("UserInput", "Buy");
                end, 
                cancelPurchaseActivated = function() --[[ Line: 874 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v153 (copy)
                    v153.cancelButtonPressed();
                    v153.emitPurchaseFlowEvent("UserInput", "Cancel");
                end, 
                isLuobu = v153.state.isLuobu, 
                isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
            });
        end;
    elseif l_promptState_3 == v31.LeaveRobloxWarning then
        return l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
            screenSize = v153.state.screenSize, 
            cancelActivated = v153.cancelButtonPressed, 
            continueActivated = v153.confirmButtonPressed
        });
    elseif l_promptState_3 == v31.PurchaseComplete and l_requestType_2 == v30.AvatarCreationFee then
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            bodyText = v10:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v153.confirmButtonPressed, 
                            text = v10:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                            inputIcon = v153.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                        }
                    }
                }
            }, 
            screenSize = v153.state.screenSize, 
            title = v10:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.TwoFactorNeededSettings or v49(l_purchaseError_1) then
        return v6.createElement(v78, {
            screenSize = v153.state.screenSize, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v153.props.economicRestrictionError or {}, 
            isGamepadEnabled = v153.props.isGamepadEnabled, 
            cancelButtonPressed = v153.cancelButtonPressed, 
            confirmButtonPressed = v153.confirmButtonPressed, 
            includeCancelButton = true, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v153.props.isUserEligibleForUnifiedPurchaseFlow else nil
        });
    elseif l_promptState_3 == v31.EnablePurchaseVPCModal then
        return l_Roact_0.createElement(l_Animator_0, {
            shouldAnimate = true, 
            shouldShow = l_promptState_3 == v31.EnablePurchaseVPCModal, 
            renderChildren = function() --[[ Line: 930 ]] --[[ Name: renderChildren ]]
                -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v153 (copy), l_promptState_3 (copy)
                return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = v153.state.screenSize, 
                    isActionable = false, 
                    modalType = v153.getVPCModalType(l_promptState_3), 
                    onDismiss = function() --[[ Line: 935 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v153 (ref)
                        v153.confirmButtonPressed();
                    end
                });
            end
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.NotEnoughRobuxXbox and l_DesktopUpsellExperiment_0.shouldShowNewModal() then
        return l_Roact_0.createElement(l_RobuxUpsellModalTooExpensiveFallback_0, {
            screenSize = v153.state.screenSize, 
            product = {
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v59 then v153.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
            }, 
            balanceAmount = l_accountInfo_0.balance, 
            doneActivated = function() --[[ Line: 958 ]] --[[ Name: doneActivated ]]
                -- upvalues: v153 (copy)
                v153.cancelButtonPressed();
                v153.emitPurchaseFlowEvent("UserInput", "Cancel");
            end
        });
    else
        return v6.createElement(v78, {
            screenSize = v153.state.screenSize, 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v153.props.economicRestrictionError or {}, 
            isGamepadEnabled = v153.props.isGamepadEnabled, 
            cancelButtonPressed = v153.cancelButtonPressed, 
            confirmButtonPressed = v153.confirmButtonPressed, 
            includeCancelButton = false, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v153.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            isMultiItem = v60(v153.props.requestType) == l_UnifiedPurchaseModalTypeEnum_0.MultiItem
        });
    end;
end;
v77.render = function(v165) --[[ Line: 984 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v57 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v30 (copy), v31 (copy), v45 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v46 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_promptState_4 = v165.props.promptState;
    local v167 = v165:determinePrompt();
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v165.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v57, {
            shouldShow = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v165.props.windowState == v32.Shown else v165.props.windowState ~= v32.Hidden, 
            onShown = function() --[[ Line: 997 ]] --[[ Name: onShown ]]
                -- upvalues: v165 (copy), v30 (ref), l_promptState_4 (copy), v31 (ref), v45 (ref)
                if v165.props.requestType == v30.AvatarCreationFee and l_promptState_4 == v31.PromptPurchase then
                    v45.sendPageLoad(v45.Section.BuyItemModal);
                end;
                v165:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 1009 ]] --[[ Name: onHidden ]]
                -- upvalues: v165 (copy)
                v165:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
            end, 
            skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v165.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            [l_Roact_0.Ref] = v165.animatorRef
        }, {
            Prompt = v167, 
            ModalFix = v167 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v46, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 1030 ]] --[[ Name: callback ]]
                -- upvalues: v165 (copy)
                if v165.props.hideWindow then
                    v165.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v46, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v168, v169) --[[ Line: 1038 ]] --[[ Name: callback ]]
                -- upvalues: v165 (copy)
                if not v168 or not v169 then
                    v165.props.hideWindow();
                end;
            end
        })
    });
end;
return (v43(function(v170) --[[ Line: 1048 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v42 (copy), v50 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v59 (copy), v61 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy)
    local v171 = v42(v170.promptRequest.requestType);
    local v172 = if v170.abVariations then v170.abVariations.DesktopUpsellExpVariant else nil;
    return {
        purchaseFlowUUID = v170.purchaseFlowUUID, 
        purchaseFlow = v170.purchaseFlow, 
        promptState = v170.promptState, 
        requestType = v170.promptRequest.requestType, 
        humanoidModel = v170.promptRequest.humanoidModel, 
        expectedPrice = v170.promptRequest.expectedPrice, 
        windowState = v170.windowState, 
        purchaseError = v170.purchaseError, 
        economicRestrictionError = v170.economicRestrictionError, 
        productInfo = v170.productInfo, 
        accountInfo = v170.accountInfo, 
        robuxPurchaseAmount = v50.getRobuxPurchaseAmount(v170), 
        robuxAmountBeforeBonus = v50.getRobuxAmountBeforeBonus(v170), 
        robuxPurchaseCost = v50.getPrice(v170), 
        isTestPurchase = v171, 
        isGamepadEnabled = v170.gamepadEnabled, 
        desktopUpsellExpVariant = v172, 
        postPurchaseActions = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v170.postPurchaseActions else nil, 
        purchaseCallbacks = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v170.purchaseCallbacks else nil, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v170.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v170.purchaseAnalyticsMetadata else nil, 
        productPrice = if v59 then v61(v170) else nil, 
        timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 and v170.productPayload then v170.productPayload.timedOptionDays else nil, 
        robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v170.robloxSubscriptionProducts else nil
    };
end, function(v173) --[[ Line: 1089 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v63 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v54 (copy), v35 (copy), v36 (copy), v28 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), l_GuiService_0 (copy), v37 (copy), v44 (copy), v64 (copy)
    return {
        setPurchaseFlowUUID = function(v174) --[[ Line: 1091 ]] --[[ Name: setPurchaseFlowUUID ]]
            -- upvalues: v173 (copy), v63 (ref)
            v173(v63(v174));
        end, 
        onBuy = function() --[[ Line: 1094 ]] --[[ Name: onBuy ]]
            -- upvalues: v173 (copy), v38 (ref)
            v173(v38());
        end, 
        completePurchase = function() --[[ Line: 1097 ]] --[[ Name: completePurchase ]]
            -- upvalues: v173 (copy), v39 (ref)
            v173(v39());
        end, 
        onScaryModalConfirm = function() --[[ Line: 1100 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v173 (copy), v40 (ref)
            v173(v40());
        end, 
        onOpenSecuritySettings = function(v175) --[[ Line: 1103 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v173 (copy), v41 (ref)
            if v175 then
                v173(v41(v175));
                return;
            else
                v173(v41());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 1110 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v173 (copy), v54 (ref)
            v173(v54());
        end, 
        hideWindow = function() --[[ Line: 1113 ]] --[[ Name: hideWindow ]]
            -- upvalues: v173 (copy), v35 (ref)
            v173(v35());
        end, 
        retryPurchaseAfterUpsell = function() --[[ Line: 1116 ]] --[[ Name: retryPurchaseAfterUpsell ]]
            -- upvalues: v173 (copy), v36 (ref)
            v173(v36());
        end, 
        setWindowState = function(v176) --[[ Line: 1119 ]] --[[ Name: setWindowState ]]
            -- upvalues: v173 (copy), v28 (ref)
            v173(v28(v176));
        end, 
        completeRequest = function() --[[ Line: 1122 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), l_GuiService_0 (ref), v173 (copy), v37 (ref)
            if l_FFlagAddCursorProviderToPurchasePromptApp_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v173(v37());
        end, 
        onAnalyticEvent = function(v177, v178) --[[ Line: 1128 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v173 (copy), v44 (ref)
            v173(v44(v177, v178));
        end, 
        setPostPurchaseActions = function(v179) --[[ Line: 1131 ]] --[[ Name: setPostPurchaseActions ]]
            -- upvalues: v173 (copy), v64 (ref)
            v173(v64(v179));
        end
    };
end)(v77));