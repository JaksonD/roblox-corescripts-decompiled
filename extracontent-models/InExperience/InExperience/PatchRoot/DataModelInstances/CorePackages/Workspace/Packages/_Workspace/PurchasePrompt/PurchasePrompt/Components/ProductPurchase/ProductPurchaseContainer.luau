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
local l_HttpService_0 = game:GetService("HttpService");
local v66 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v67 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v68 = require(l_script_FirstAncestor_0.Utils.sendUnifiedPurchaseEventLog);
local v69 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseEventNameEnum);
local v70 = require(l_script_FirstAncestor_0.Misc.Constants);
local v71 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v72 = require(l_Parent_0.LoggingProtocol);
local v73 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v74 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v75 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_DesktopUpsellExperiment_0 = v16.Utility.DesktopUpsellExperiment;
local l_ProductPurchaseModal_0 = v16.ProductPurchaseModal;
local l_RobuxUpsellModal_0 = v16.RobuxUpsellModal;
local l_RobuxUpsellModalTooExpensiveFallback_0 = v16.RobuxUpsellModalTooExpensiveFallback;
local v80 = require(l_script_FirstAncestor_0.Utils.shouldShowBlackbirdUpsell);
local v81 = l_Roact_0.Component:extend(script.Name);
local v82 = require(script.Parent.ProductPurchasePrompt);
local v83 = require(l_Parent_0.SharedFlags);
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = v83.GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = v83.FFlagEnableUnifiedProductPurchaseFlow;
local l_UnifiedPurchaseModalTypeEnum_0 = v16.Enums.UnifiedPurchaseModalTypeEnum;
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v96 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true);
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_Parent_0.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local function v102(v98, v99, v100) --[[ Line: 156 ]] --[[ Name: isRelevantRequestType ]]
    -- upvalues: l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v31 (copy), v29 (copy), v30 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v100 == v31.InitializingPurchase and v99 == v29.RobuxUpsellV2 then
        return true;
    elseif v99 == v29.RobuxUpsellV2 or v99 == v29.LargeRobuxUpsell then
        return false;
    else
        local v101 = true;
        if v98 ~= v30.Asset then
            v101 = true;
            if v98 ~= v30.Bundle then
                v101 = true;
                if v98 ~= v30.GamePass then
                    v101 = true;
                    if v98 ~= v30.Product then
                        v101 = true;
                        if v98 ~= v30.AvatarCreationFee then
                            v101 = l_FFlagEnableUnifiedProductPurchaseFlow_0 and v98 == v30.Experience or l_FFlagEnableUnifiedProductPurchaseFlow_0 and v98 == v30.Look or l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v98 == v30.DeveloperSubscription;
                        end;
                    end;
                end;
            end;
        end;
        return v101;
    end;
end;
local function _(v103, v104, v105) --[[ Line: 179 ]] --[[ Name: getIsFiatProduct ]]
    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy)
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v103 == v30.DeveloperSubscription then
        local v106 = false;
        if v104.displayPrice ~= nil then
            v106 = v105 == 0;
        end;
        return v106;
    else
        return false;
    end;
end;
local function _(v108) --[[ Line: 187 ]] --[[ Name: promptStateToViewName ]]
    -- upvalues: v31 (copy)
    return ({
        [v31.RobuxUpsell] = "PurchaseModal", 
        [v31.UpsellInProgress] = "RobuxPurchasePending"
    })[v108];
end;
v81.init = function(v110) --[[ Line: 195 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v71 (copy), v72 (copy), v73 (copy), v9 (copy), v31 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v68 (copy), v96 (copy), l_Players_0 (copy), v102 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v52 (copy), v74 (copy), v69 (copy), v33 (copy), v49 (copy), v30 (copy), v45 (copy), v32 (copy), l_ContextActionService_0 (copy), v56 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v53 (copy), v70 (copy)
    v110.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false, 
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    if not v71 then
        v110.props.setPurchaseFlowUUID(l_HttpService_0:GenerateGUID(false));
        v72.default:logRobloxTelemetryCounter(v73.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerInit"
        });
    end;
    coroutine.wrap(function() --[[ Line: 214 ]]
        -- upvalues: v9 (ref), v110 (copy)
        if v9:IsSubjectToChinaPolicies() then
            v110:setState({
                isLuobu = true
            });
        end;
    end)();
    v110.emitPurchaseFlowEvent = function(v111, v112) --[[ Line: 225 ]]
        -- upvalues: v110 (copy), v31 (ref), l_HttpService_0 (ref)
        local l_promptState_0 = v110.props.promptState;
        local v114 = ({
            [v31.RobuxUpsell] = "PurchaseModal", 
            [v31.UpsellInProgress] = "RobuxPurchasePending"
        })[l_promptState_0];
        if not v114 then
            return;
        else
            l_promptState_0 = {
                purchase_flow_uuid = v110.props.purchaseFlowUUID, 
                purchase_flow = "InGameRobuxUpsell", 
                view_name = v114, 
                purchase_event_type = v111, 
                input_type = v112, 
                event_metadata = l_HttpService_0:JSONEncode({
                    universe_id = tostring(game.GameId), 
                    item_product_id = tostring(v110.props.productInfo.productId), 
                    item_name = v110.props.productInfo.name, 
                    price = tostring(v110.props.productInfo.price), 
                    user_balance = tostring(v110.props.accountInfo.balance) or nil, 
                    package_robux_amount = tostring(v110.props.robuxPurchaseAmount) or nil
                })
            };
            v110.props.onAnalyticEvent("UserPurchaseFlow", l_promptState_0);
            return;
        end;
    end;
    v110.emitUnifiedProductPurchaseFlowEvent = function(v115) --[[ Line: 249 ]]
        -- upvalues: v110 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v68 (ref)
        local v116 = v110.props.purchaseAnalyticsMetadata or {};
        local v117 = {
            event_name = v115, 
            purchase_flow_uuid = v116.purchaseFlowUUID, 
            product_id = v116.productId, 
            product_type = v116.productType, 
            product_target_id = v116.productTargetId, 
            robux_price = v116.price, 
            surface = v116.surface, 
            user_roblox_balance = v116.userRobuxBalance, 
            salelocation_universeid = v116.saleLocationUniverseId, 
            product_universeid = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v116.productUniverseId else nil
        };
        v68(v117);
    end;
    v110.changeScreenSize = function(v118) --[[ Line: 268 ]]
        -- upvalues: v110 (copy)
        if v110.state.screenSize ~= v118.AbsoluteSize then
            v110:setState({
                screenSize = v118.AbsoluteSize
            });
        end;
    end;
    v110.hasDelayedInput = function() --[[ Line: 276 ]]
        -- upvalues: v96 (ref), v110 (copy), v31 (ref)
        if not v96 and v110.props.isTestPurchase then
            return false;
        else
            local l_promptState_1 = v110.props.promptState;
            if v96 then
                local v120 = true;
                if l_promptState_1 ~= v31.PurchaseInProgress then
                    v120 = true;
                    if l_promptState_1 ~= v31.RobuxUpsell then
                        v120 = l_promptState_1 == v31.UpsellInProgress;
                    end;
                end;
                return v120;
            else
                local v121 = true;
                if l_promptState_1 ~= v31.PromptPurchase then
                    v121 = true;
                    if l_promptState_1 ~= v31.PurchaseInProgress then
                        v121 = true;
                        if l_promptState_1 ~= v31.RobuxUpsell then
                            v121 = l_promptState_1 == v31.UpsellInProgress;
                        end;
                    end;
                end;
                return v121;
            end;
        end;
    end;
    v110.isWindowShowAndDoneAnimating = function() --[[ Line: 299 ]]
        -- upvalues: v110 (copy)
        return v110.state.isAnimating == false;
    end;
    v110.canConfirmInput = function() --[[ Line: 303 ]]
        -- upvalues: l_Players_0 (ref), v110 (copy)
        if l_Players_0.LocalPlayer.GameplayPaused then
            return false;
        else
            local v122 = v110.isWindowShowAndDoneAnimating();
            if v110.hasDelayedInput() then
                local v123 = false;
                if v110.state.doneAnimatingTime then
                    v123 = os.clock() - v110.state.doneAnimatingTime > 2.5;
                end;
                return v122 and v123;
            else
                return v122;
            end;
        end;
    end;
    v110.getConfirmButtonAction = function(v124, v125, v126) --[[ Line: 328 ]]
        -- upvalues: v31 (ref), v102 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v110 (copy), v52 (ref), v74 (ref), v69 (ref), v33 (ref), v49 (ref)
        if v124 == v31.None or not v102(v125) then
            return nil;
        elseif v124 == v31.PromptPurchase or v124 == v31.PurchaseInProgress then
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v110.props.isUserEligibleForUnifiedPurchaseFlow then
                local v127 = v110.props.purchaseAnalyticsMetadata or {};
                v52(v74.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v127.surface, v127.productType);
                v110.emitUnifiedProductPurchaseFlowEvent(v69.BuyItemModalBuyClicked);
            end;
            return v110.props.onBuy;
        elseif v124 == v31.RobuxUpsell or v124 == v31.UpsellInProgress or v124 == v31.LeaveRobloxWarning then
            return v110.props.onRobuxUpsell;
        elseif v124 == v31.U13PaymentModal or v124 == v31.U13MonthlyThreshold1Modal or v124 == v31.U13MonthlyThreshold2Modal or v124 == v31.ParentalConsentWarningPaymentModal13To17 then
            return v110.props.onScaryModalConfirm;
        elseif v124 == v31.Error and v126 == v33.TwoFactorNeededSettings then
            return v110.props.onOpenSecuritySettings;
        elseif v49(v126) then
            return function() --[[ Line: 360 ]]
                -- upvalues: v110 (ref), v126 (copy)
                v110.props.onOpenSecuritySettings(v126);
            end;
        else
            return v110.props.hideWindow;
        end;
    end;
    v110.getCancelButtonAction = function(v128, v129) --[[ Line: 368 ]]
        -- upvalues: v31 (ref), v102 (ref), v110 (copy)
        if v128 == v31.None or not v102(v129) then
            return nil;
        else
            return v110.props.hideWindow;
        end;
    end;
    v110.confirmButtonPressed = function() --[[ Line: 376 ]]
        -- upvalues: v110 (copy), v30 (ref), v31 (ref), v45 (ref)
        if v110.props.requestType == v30.AvatarCreationFee and v110.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Buy);
        end;
        local v130 = v110.getConfirmButtonAction(v110.props.promptState, v110.props.requestType, v110.props.purchaseError);
        if v130 ~= nil and v110.canConfirmInput() then
            v130();
        end;
    end;
    v110.cancelButtonPressed = function() --[[ Line: 393 ]]
        -- upvalues: v110 (copy), v30 (ref), v31 (ref), v45 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v52 (ref), v74 (ref)
        if v110.props.requestType == v30.AvatarCreationFee and v110.props.promptState == v31.PromptPurchase then
            v45.sendButtonClicked(v45.Section.BuyItemModal, v45.Element.Cancel);
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v110.props.isUserEligibleForUnifiedPurchaseFlow then
            v52(v74.UnifiedProductPurchaseModalCancelButtonClickedCounter, v110.props.purchaseAnalyticsMetadata.surface, v110.props.purchaseAnalyticsMetadata.productType);
        end;
        local v131 = v110.getCancelButtonAction(v110.props.promptState, v110.props.requestType);
        if v131 ~= nil then
            v131();
        end;
    end;
    v110.configContextActionService = function(v132) --[[ Line: 418 ]]
        -- upvalues: v32 (ref), l_ContextActionService_0 (ref), v110 (copy)
        if v132 == v32.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v134, _) --[[ Line: 420 ]]
                -- upvalues: v110 (ref)
                if v134 == Enum.UserInputState.Begin then
                    v110.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v137, _) --[[ Line: 425 ]]
                -- upvalues: v110 (ref)
                if v137 == Enum.UserInputState.Begin then
                    v110.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return;
        end;
    end;
    v110.getVPCModalType = function(v139) --[[ Line: 436 ]]
        -- upvalues: v31 (ref), v56 (ref)
        if v139 == v31.EnablePurchaseVPCModal then
            return v56.toRawValue(v56.EnablePurchase);
        else
            return v56.toRawValue(v56.None);
        end;
    end;
    v110.onBuyItemButtonMounted = function(v140) --[[ Line: 443 ]]
        -- upvalues: v110 (copy), v52 (ref), v74 (ref), v69 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), v53 (ref), v70 (ref)
        local v141 = v110.props.purchaseAnalyticsMetadata or {};
        v52(v74.UnifiedProductPurchaseModalShownCounter, v141.surface, v141.productType);
        v110.emitUnifiedProductPurchaseFlowEvent(v69.BuyItemModalShown);
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and v141 and v141.surface then
            v53(v70.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v141.surface);
        end;
        if v110.props.purchaseCallbacks and v110.props.purchaseCallbacks.onBuyItemButtonMounted then
            v110.props.purchaseCallbacks.onBuyItemButtonMounted(v140);
        end;
    end;
end;
v81.didMount = function(v142) --[[ Line: 469 ]] --[[ Name: didMount ]]
    -- upvalues: v32 (copy), v102 (copy), l_GuiService_0 (copy)
    local l_purchaseFlow_0 = v142.props.purchaseFlow;
    local l_requestType_0 = v142.props.requestType;
    if v142.props.windowState == v32.Shown and v102(l_requestType_0, l_purchaseFlow_0) then
        v142:setState({
            isAnimating = true
        });
        v142.configContextActionService(v142.props.windowState);
        l_GuiService_0.SetPurchasePromptIsShown(true);
    end;
end;
v81.willUpdate = function(v145, v146) --[[ Line: 483 ]] --[[ Name: willUpdate ]]
    if v145.props.expectedPrice ~= v146.expectedPrice then
        v145:setState({});
    end;
end;
v81.didUpdate = function(v147, v148, _) --[[ Line: 489 ]] --[[ Name: didUpdate ]]
    -- upvalues: v71 (copy), v31 (copy), l_HttpService_0 (copy), v72 (copy), v73 (copy), l_Players_0 (copy), v102 (copy), l_GuiService_0 (copy), v32 (copy), v30 (copy), v45 (copy)
    if not v71 and v147.props.promptState ~= v148.promptState and v147.props.promptState == v31.None then
        local v150 = l_HttpService_0:GenerateGUID(false);
        v147.props.setPurchaseFlowUUID(v150);
        v72.default:logRobloxTelemetryCounter(v73.ProductPurchaseContainerMigrationCounter, 1, {
            method = "ProductPurchaseContainerDidUpdate"
        });
    end;
    if l_Players_0.LocalPlayer.GameplayPaused then
        v147.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v147.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v147.props.purchaseFlow;
    local l_requestType_1 = v147.props.requestType;
    if v148.windowState ~= v147.props.windowState and v102(l_requestType_1, l_purchaseFlow_1) then
        v147:setState({
            isAnimating = true
        });
        v147.configContextActionService(v147.props.windowState);
        l_GuiService_0:SetPurchasePromptIsShown(v147.props.windowState == v32.Shown);
        if v147.props.windowState == v32.Hidden then
            v147.props.completeRequest();
        end;
    end;
    if l_requestType_1 == v30.AvatarCreationFee and v147.props.promptState == v31.PurchaseComplete and v148.promptState ~= v31.PurchaseComplete then
        v45.sendPageLoad(v45.Section.ProcessCompleteModal);
    end;
    if v148.promptState ~= v147.props.promptState then
        v147.emitPurchaseFlowEvent("ViewShown");
    end;
end;
v81.getMessageKeysFromPromptState = function(v153) --[[ Line: 548 ]] --[[ Name: getMessageKeysFromPromptState ]]
    -- upvalues: v31 (copy), v33 (copy), v47 (copy), v49 (copy)
    local l_promptState_2 = v153.props.promptState;
    local l_productInfo_0 = v153.props.productInfo;
    local l_purchaseError_0 = v153.props.purchaseError;
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
v81.determinePrompt = function(v157) --[[ Line: 617 ]] --[[ Name: determinePrompt ]]
    -- upvalues: l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v31 (copy), v102 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v30 (copy), v23 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_SurfaceName_0 (copy), v75 (copy), l_SurfaceContext_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 (copy), l_Roact_0 (copy), l_UnifiedProductPurchaseModalV2_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v61 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), v80 (copy), v24 (copy), l_UnifiedProductPurchaseModal_0 (copy), v60 (copy), v48 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_ProductPurchaseModal_0 (copy), l_ProductPurchase_0 (copy), l_RobuxUpsellModal_0 (copy), l_ProductPurchaseRobuxUpsell_0 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), l_LeaveRobloxAlert_0 (copy), l_InteractiveAlert_0 (copy), v10 (copy), l_ButtonType_0 (copy), v33 (copy), v49 (copy), v6 (copy), v82 (copy), l_Images_0 (copy), l_Animator_0 (copy), l_VerifiedParentalConsentDialog_0 (copy), l_RobuxUpsellModalTooExpensiveFallback_0 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy)
    local l_purchaseFlow_2 = v157.props.purchaseFlow;
    local l_promptState_3 = v157.props.promptState;
    local l_expectedPrice_0 = v157.props.expectedPrice;
    local l_requestType_2 = v157.props.requestType;
    local l_purchaseError_1 = v157.props.purchaseError;
    local l_productInfo_1 = v157.props.productInfo;
    local l_accountInfo_0 = v157.props.accountInfo;
    local l_isTestPurchase_0 = v157.props.isTestPurchase;
    if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v157.props.windowState ~= v32.Shown then
        return nil;
    elseif l_promptState_3 == v31.None or not v102(l_requestType_2, l_purchaseFlow_2, if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 else nil) then
        return nil;
    elseif l_promptState_3 == v31.PromptPurchase or l_promptState_3 == v31.PurchaseInProgress or l_FFlagUnifiedPurchaseAddSkeleton_0 and l_promptState_3 == v31.InitializingPurchase then
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v157.props.isUserEligibleForUnifiedPurchaseFlow then
            local l_productPrice_0 = v157.props.productPrice;
            local v167 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then l_requestType_2 == v30.DeveloperSubscription and l_productInfo_1.displayPrice ~= nil and l_productPrice_0 == 0 else false;
            l_productPrice_0 = function() --[[ Line: 657 ]]
                -- upvalues: v157 (copy), v32 (ref), v23 (ref), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_SurfaceName_0 (ref), v75 (ref), l_SurfaceContext_0 (ref)
                v157.props.setWindowState(v32.Suspended);
                v23.initiateRobloxSubscriptionPurchase({
                    showBackButton = true
                }, {
                    onFlowComplete = function(v168) --[[ Line: 668 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), v157 (ref)
                        if v168 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseSucceeded then
                            v157.props.retryPurchaseAfterUpsell();
                            return;
                        elseif v168 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellDismissed then
                            v157.props.completeRequest();
                            return;
                        else
                            if v168 == l_RobloxSubscriptionFlowCompleteReason_0.UpsellPurchaseFailed then
                                v157.props.completeRequest();
                            end;
                            return;
                        end;
                    end, 
                    onBackButtonActivated = function() --[[ Line: 680 ]] --[[ Name: onBackButtonActivated ]]
                        -- upvalues: v157 (ref), v32 (ref)
                        v157.props.setWindowState(v32.Shown);
                    end
                }, nil, l_SurfaceName_0.UnifiedProductPurchaseModal, if v75.get() == v75.Enum.IN_APP then l_SurfaceContext_0.InApp else l_SurfaceContext_0.InGame);
            end;
            local v169 = nil;
            if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then
                v169 = if v167 then nil else v157.props.price;
            end;
            if l_FFlagAddCenterDialogForUnifiedPurchaseModal_0 and v75.get() == v75.Enum.IN_APP then
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModalV2_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v167 then nil else v157.props.productPrice, 
                        itemDisplayPrice = if v167 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v169 else nil, 
                        model = v157.props.humanoidModel
                    }, 
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v157.props.subtitleView else nil, 
                    buttons = {
                        buyItemActivated = v157.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v157.isWindowShowAndDoneAnimating() and v75.get() == v75.Enum.IN_EXPERIENCE, 
                        cancelActivated = v157.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v157.props.postPurchaseActions, 
                    setPostPurchaseActions = v157.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v157.onBuyItemButtonMounted, 
                    purchaseModalType = v61(v157.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then l_promptState_3 == v31.InitializingPurchase else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v80() and v157.props.robloxSubscriptionProducts then v24(v157.props.robloxSubscriptionProducts) else nil
                });
            else
                return l_Roact_0.createElement(l_UnifiedProductPurchaseModal_0, {
                    product = {
                        itemIcon = l_productInfo_1.imageUrl, 
                        itemName = l_productInfo_1.name, 
                        itemRobuxCost = if v167 then nil else if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                        itemDisplayPrice = if v167 then l_productInfo_1.displayPrice else nil, 
                        itemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v169 else nil, 
                        model = v157.props.humanoidModel
                    }, 
                    buttons = {
                        buyItemActivated = v157.confirmButtonPressed, 
                        buyItemEnableInputDelayed = v157.isWindowShowAndDoneAnimating() and v75.get() == v75.Enum.IN_EXPERIENCE, 
                        cancelActivated = v157.cancelButtonPressed, 
                        isDisabled = l_promptState_3 == v31.PurchaseInProgress
                    }, 
                    postPurchaseActions = v157.props.postPurchaseActions, 
                    setPostPurchaseActions = v157.props.setPostPurchaseActions, 
                    onBuyItemButtonMounted = v157.onBuyItemButtonMounted, 
                    purchaseModalType = v61(v157.props.requestType), 
                    robuxBalanceAmount = l_accountInfo_0.balance, 
                    isTestPurchase = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 then l_isTestPurchase_0 else nil, 
                    onBlackbirdUpsellActivated = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_productPrice_0 else nil, 
                    BlackbirdUpsellBannerProductInfo = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v80() and v157.props.robloxSubscriptionProducts then v24(v157.props.robloxSubscriptionProducts) else nil, 
                    hideUserRobuxBalance = v167 or if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v157.props.purchaseAnalyticsMetadata and v157.props.purchaseAnalyticsMetadata.surface == l_ProductPurchaseSurface_0.Catalog else nil
                });
            end;
        elseif l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_ProductPurchaseModal_0, {
                screenSize = v157.state.screenSize, 
                product = {
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                balanceAmount = l_accountInfo_0.balance, 
                balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not l_accountInfo_0.hasFailed, 
                buttons = {
                    isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                    buyItemActivated = v157.confirmButtonPressed, 
                    buyItemControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemIsDelayedInput = v157.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v157.isWindowShowAndDoneAnimating(), 
                    cancelActivated = v157.cancelButtonPressed
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v157.state.screenSize, 
                isDisabled = l_promptState_3 == v31.PurchaseInProgress, 
                model = v157.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                currentBalanceValid = not l_accountInfo_0.hasFailed, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v157.hasDelayedInput(), 
                enableInputDelayed = v157.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = v157.confirmButtonPressed, 
                cancelPurchaseActivated = v157.cancelButtonPressed, 
                isLuobu = v157.state.isLuobu
            });
        end;
    elseif l_promptState_3 == v31.RobuxUpsell or l_promptState_3 == v31.UpsellInProgress then
        if l_DesktopUpsellExperiment_0.shouldShowNewModal() then
            return l_Roact_0.createElement(l_RobuxUpsellModal_0, {
                screenSize = v157.state.screenSize, 
                product = {
                    model = v157.props.humanoidModel, 
                    itemIcon = l_productInfo_1.imageUrl, 
                    itemName = l_productInfo_1.name, 
                    itemRobuxCost = if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
                }, 
                upsell = {
                    balanceAmount = l_accountInfo_0.balance, 
                    robuxPurchaseAmount = v157.props.robuxPurchaseAmount, 
                    robuxPurchaseAmountBeforeBonus = v157.props.robuxAmountBeforeBonus, 
                    robuxPurchaseCost = v157.props.robuxPurchaseCost
                }, 
                buttons = {
                    buyItemActivated = function() --[[ Line: 852 ]] --[[ Name: buyItemActivated ]]
                        -- upvalues: v157 (copy)
                        v157.confirmButtonPressed();
                        v157.emitPurchaseFlowEvent("UserInput", "Buy");
                    end, 
                    buyItemDisabled = l_promptState_3 == v31.UpsellInProgress, 
                    buyItemControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                    buyItemisDelayedInput = v157.hasDelayedInput(), 
                    buyItemEnableInputDelayed = v157.isWindowShowAndDoneAnimating(), 
                    cancelPurchaseActivated = function() --[[ Line: 861 ]] --[[ Name: cancelPurchaseActivated ]]
                        -- upvalues: v157 (copy)
                        v157.cancelButtonPressed();
                        v157.emitPurchaseFlowEvent("UserInput", "Cancel");
                    end, 
                    cancelControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                    opensBuyRobuxPage = l_DesktopUpsellExperiment_0.getVariant() == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore
                }
            });
        else
            return l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v157.state.screenSize, 
                isDisabled = l_promptState_3 == v31.UpsellInProgress, 
                model = v157.props.humanoidModel, 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = v157.props.robuxPurchaseAmount, 
                robuxPurchaseAmountBeforeBonus = v157.props.robuxAmountBeforeBonus, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v157.hasDelayedInput(), 
                enableInputDelayed = v157.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil, 
                cancelControllerIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png" or nil, 
                buyItemActivated = function() --[[ Line: 891 ]] --[[ Name: buyItemActivated ]]
                    -- upvalues: v157 (copy)
                    v157.confirmButtonPressed();
                    v157.emitPurchaseFlowEvent("UserInput", "Buy");
                end, 
                cancelPurchaseActivated = function() --[[ Line: 895 ]] --[[ Name: cancelPurchaseActivated ]]
                    -- upvalues: v157 (copy)
                    v157.cancelButtonPressed();
                    v157.emitPurchaseFlowEvent("UserInput", "Cancel");
                end, 
                isLuobu = v157.state.isLuobu, 
                isVng = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell()
            });
        end;
    elseif l_promptState_3 == v31.LeaveRobloxWarning then
        return l_Roact_0.createElement(l_LeaveRobloxAlert_0, {
            screenSize = v157.state.screenSize, 
            cancelActivated = v157.cancelButtonPressed, 
            continueActivated = v157.confirmButtonPressed
        });
    elseif l_promptState_3 == v31.PurchaseComplete and l_requestType_2 == v30.AvatarCreationFee then
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            bodyText = v10:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v157.confirmButtonPressed, 
                            text = v10:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"), 
                            inputIcon = v157.props.isGamepadEnabled and "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" or nil
                        }
                    }
                }
            }, 
            screenSize = v157.state.screenSize, 
            title = v10:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.TwoFactorNeededSettings or v49(l_purchaseError_1) then
        return v6.createElement(v82, {
            screenSize = v157.state.screenSize, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v157.props.economicRestrictionError or {}, 
            isGamepadEnabled = v157.props.isGamepadEnabled, 
            cancelButtonPressed = v157.cancelButtonPressed, 
            confirmButtonPressed = v157.confirmButtonPressed, 
            includeCancelButton = true, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v157.props.isUserEligibleForUnifiedPurchaseFlow else nil
        });
    elseif l_promptState_3 == v31.EnablePurchaseVPCModal then
        return l_Roact_0.createElement(l_Animator_0, {
            shouldAnimate = true, 
            shouldShow = l_promptState_3 == v31.EnablePurchaseVPCModal, 
            renderChildren = function() --[[ Line: 951 ]] --[[ Name: renderChildren ]]
                -- upvalues: l_Roact_0 (ref), l_VerifiedParentalConsentDialog_0 (ref), v157 (copy), l_promptState_3 (copy)
                return l_Roact_0.createElement(l_VerifiedParentalConsentDialog_0, {
                    screenSize = v157.state.screenSize, 
                    isActionable = false, 
                    modalType = v157.getVPCModalType(l_promptState_3), 
                    onDismiss = function() --[[ Line: 956 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v157 (ref)
                        v157.confirmButtonPressed();
                    end
                });
            end
        });
    elseif l_promptState_3 == v31.Error and l_purchaseError_1 == v33.NotEnoughRobuxXbox and l_DesktopUpsellExperiment_0.shouldShowNewModal() then
        return l_Roact_0.createElement(l_RobuxUpsellModalTooExpensiveFallback_0, {
            screenSize = v157.state.screenSize, 
            product = {
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = if v60 then v157.props.productPrice else v48(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0)
            }, 
            balanceAmount = l_accountInfo_0.balance, 
            doneActivated = function() --[[ Line: 979 ]] --[[ Name: doneActivated ]]
                -- upvalues: v157 (copy)
                v157.cancelButtonPressed();
                v157.emitPurchaseFlowEvent("UserInput", "Cancel");
            end
        });
    else
        return v6.createElement(v82, {
            screenSize = v157.state.screenSize, 
            promptState = l_promptState_3, 
            productInfo = l_productInfo_1, 
            purchaseError = l_purchaseError_1, 
            economicRestrictionError = v157.props.economicRestrictionError or {}, 
            isGamepadEnabled = v157.props.isGamepadEnabled, 
            cancelButtonPressed = v157.cancelButtonPressed, 
            confirmButtonPressed = v157.confirmButtonPressed, 
            includeCancelButton = false, 
            isGenericChallengeResponse = v49, 
            useUnifiedPurchaseCompletionModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v157.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            isMultiItem = v61(v157.props.requestType) == l_UnifiedPurchaseModalTypeEnum_0.MultiItem
        });
    end;
end;
v81.render = function(v170) --[[ Line: 1005 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v57 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v32 (copy), v30 (copy), v31 (copy), v45 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v46 (copy), l_GuiService_0 (copy), l_CoreGui_0 (copy)
    local l_promptState_4 = v170.props.promptState;
    local v172 = v170:determinePrompt();
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v170.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v57, {
            shouldShow = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v170.props.windowState == v32.Shown else v170.props.windowState ~= v32.Hidden, 
            onShown = function() --[[ Line: 1018 ]] --[[ Name: onShown ]]
                -- upvalues: v170 (copy), v30 (ref), l_promptState_4 (copy), v31 (ref), v45 (ref)
                if v170.props.requestType == v30.AvatarCreationFee and l_promptState_4 == v31.PromptPurchase then
                    v45.sendPageLoad(v45.Section.BuyItemModal);
                end;
                v170:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function() --[[ Line: 1030 ]] --[[ Name: onHidden ]]
                -- upvalues: v170 (copy)
                v170:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
            end, 
            skipAnimation = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v170.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
            [l_Roact_0.Ref] = v170.animatorRef
        }, {
            Prompt = v172, 
            ModalFix = v172 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v46, {
            event = l_GuiService_0.MenuOpened, 
            callback = function() --[[ Line: 1051 ]] --[[ Name: callback ]]
                -- upvalues: v170 (copy)
                if v170.props.hideWindow then
                    v170.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v46, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v173, v174) --[[ Line: 1059 ]] --[[ Name: callback ]]
                -- upvalues: v170 (copy)
                if not v173 or not v174 then
                    v170.props.hideWindow();
                end;
            end
        })
    });
end;
return (v43(function(v175) --[[ Line: 1069 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v42 (copy), v50 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v60 (copy), v62 (copy), v64 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy)
    local v176 = v42(v175.promptRequest.requestType);
    local v177 = if v175.abVariations then v175.abVariations.DesktopUpsellExpVariant else nil;
    return {
        purchaseFlowUUID = v175.purchaseFlowUUID, 
        purchaseFlow = v175.purchaseFlow, 
        promptState = v175.promptState, 
        requestType = v175.promptRequest.requestType, 
        humanoidModel = v175.promptRequest.humanoidModel, 
        expectedPrice = v175.promptRequest.expectedPrice, 
        windowState = v175.windowState, 
        purchaseError = v175.purchaseError, 
        economicRestrictionError = v175.economicRestrictionError, 
        productInfo = v175.productInfo, 
        accountInfo = v175.accountInfo, 
        robuxPurchaseAmount = v50.getRobuxPurchaseAmount(v175), 
        robuxAmountBeforeBonus = v50.getRobuxAmountBeforeBonus(v175), 
        robuxPurchaseCost = v50.getPrice(v175), 
        isTestPurchase = v176, 
        isGamepadEnabled = v175.gamepadEnabled, 
        desktopUpsellExpVariant = v177, 
        postPurchaseActions = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v175.postPurchaseActions else nil, 
        purchaseCallbacks = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v175.purchaseCallbacks else nil, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v175.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v175.purchaseAnalyticsMetadata else nil, 
        productPrice = if v60 then v62(v175) else nil, 
        price = if v64 then v64(v175) else nil, 
        timedOptionDays = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 and v175.productPayload then v175.productPayload.timedOptionDays else nil, 
        robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v175.robloxSubscriptionProducts else nil
    };
end, function(v178) --[[ Line: 1111 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v66 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v54 (copy), v35 (copy), v36 (copy), v28 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), l_GuiService_0 (copy), v37 (copy), v44 (copy), v67 (copy)
    return {
        setPurchaseFlowUUID = function(v179) --[[ Line: 1113 ]] --[[ Name: setPurchaseFlowUUID ]]
            -- upvalues: v178 (copy), v66 (ref)
            v178(v66(v179));
        end, 
        onBuy = function() --[[ Line: 1116 ]] --[[ Name: onBuy ]]
            -- upvalues: v178 (copy), v38 (ref)
            v178(v38());
        end, 
        completePurchase = function() --[[ Line: 1119 ]] --[[ Name: completePurchase ]]
            -- upvalues: v178 (copy), v39 (ref)
            v178(v39());
        end, 
        onScaryModalConfirm = function() --[[ Line: 1122 ]] --[[ Name: onScaryModalConfirm ]]
            -- upvalues: v178 (copy), v40 (ref)
            v178(v40());
        end, 
        onOpenSecuritySettings = function(v180) --[[ Line: 1125 ]] --[[ Name: onOpenSecuritySettings ]]
            -- upvalues: v178 (copy), v41 (ref)
            if v180 then
                v178(v41(v180));
                return;
            else
                v178(v41());
                return;
            end;
        end, 
        onRobuxUpsell = function() --[[ Line: 1132 ]] --[[ Name: onRobuxUpsell ]]
            -- upvalues: v178 (copy), v54 (ref)
            v178(v54());
        end, 
        hideWindow = function() --[[ Line: 1135 ]] --[[ Name: hideWindow ]]
            -- upvalues: v178 (copy), v35 (ref)
            v178(v35());
        end, 
        retryPurchaseAfterUpsell = function() --[[ Line: 1138 ]] --[[ Name: retryPurchaseAfterUpsell ]]
            -- upvalues: v178 (copy), v36 (ref)
            v178(v36());
        end, 
        setWindowState = function(v181) --[[ Line: 1141 ]] --[[ Name: setWindowState ]]
            -- upvalues: v178 (copy), v28 (ref)
            v178(v28(v181));
        end, 
        completeRequest = function() --[[ Line: 1144 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), l_GuiService_0 (ref), v178 (copy), v37 (ref)
            if l_FFlagAddCursorProviderToPurchasePromptApp_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v178(v37());
        end, 
        onAnalyticEvent = function(v182, v183) --[[ Line: 1150 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v178 (copy), v44 (ref)
            v178(v44(v182, v183));
        end, 
        setPostPurchaseActions = function(v184) --[[ Line: 1153 ]] --[[ Name: setPostPurchaseActions ]]
            -- upvalues: v178 (copy), v67 (ref)
            v178(v67(v184));
        end
    };
end)(v81));