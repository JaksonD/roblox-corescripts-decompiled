local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v7 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v8 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v9 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v10 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v11 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v12 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v13 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v14 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v15 = require(l_script_FirstAncestor_0.Utils.getCounterUserId);
local v16 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v17 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v18 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v19 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
local v20 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v20.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v20.InExpAmpWizardController;
local v23 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceName_0 = v23.SurfaceName;
local l_SurfaceContext_0 = v23.SurfaceContext;
return function(v26) --[[ Line: 56 ]] --[[ Name: SubscriptionUpsellContainer ]]
    -- upvalues: v6 (copy), l_useLocalization_0 (copy), v4 (copy), v12 (copy), l_SurfaceContext_0 (copy), v3 (copy), v23 (copy), l_SurfaceName_0 (copy), v2 (copy), v18 (copy), v16 (copy), v19 (copy), v17 (copy), v10 (copy), v15 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v13 (copy), v9 (copy), v7 (copy), v8 (copy), v11 (copy), v14 (copy)
    local v27 = v6();
    local v28 = l_useLocalization_0(v4.Presets.SubscriptionUpsellContainer);
    local l_direction_0 = v26.direction;
    local l_triggerOnClose_0 = v27.triggerOnClose;
    local v31 = v27.getSelectedAmount(false);
    local v32 = v27.getTransferRetryOrigin(false);
    local v33 = if v27.getTransferOrigination(false) == v12.InExperience then l_SurfaceContext_0.InGame else l_SurfaceContext_0.InApp;
    local v34 = v27.getTransferClientSessionId(false);
    local v35 = if v3.FFlagEnableRobuxTransferFlowEventIngest and v34 ~= "" then {
        clientSessionId = {
            clientSessionIdType = v23.PurchaseClientSessionIdType.CurrencyTransferSessionId, 
            clientSessionId = v34
        }
    } else nil;
    local v36 = {
        purchaseUIOptions = {
            title = v28.UpsellSubscriptionTitle or ""
        }, 
        surfaceName = l_SurfaceName_0.RobuxTransferUpsell, 
        surfaceContext = v33, 
        analyticsContext = v35
    };
    v2.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v26 (copy), l_triggerOnClose_0 (copy), v18 (ref), v27 (copy), v16 (ref), v3 (ref), v19 (ref), v17 (ref), v10 (ref), v15 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v32 (copy), v13 (ref), v9 (ref), v7 (ref), v8 (ref), v31 (copy), v11 (ref), v36 (copy), v14 (ref)
        if not v26.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            v18(v27, v16.CurrencyTransferSubscriptionUpsellWizardOpenedCounter, {
                recourseSurface = "subscription"
            });
            if v3.FFlagEnableRobuxTransferFlowEventIngest then
                v19(v27, v17.subscription_upsell_wizard_opened);
            end;
            local v37 = v27.getPromptState(false);
            v27.setPreviousPromptState(v37);
            v27.setPromptState(v10.Hidden);
            local v38 = v15(v27, l_direction_0);
            local v39 = nil;
            if v38 then
                v39 = {
                    {
                        name = "targetUser", 
                        value = tostring(v38), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v26.ampFeatureCheck, function(v40, _) --[[ Line: 122 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v18 (ref), v27 (ref), v16 (ref), v3 (ref), v19 (ref), v17 (ref), v32 (ref), v13 (ref), v9 (ref), v7 (ref), v8 (ref), v31 (ref), l_direction_0 (ref), v11 (ref), l_triggerOnClose_0 (ref)
                if v40 == l_AccessResponseEnum_0.Granted then
                    v18(v27, v16.CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter, {
                        recourseSurface = "subscription"
                    });
                    if v3.FFlagEnableRobuxTransferFlowEventIngest then
                        v19(v27, v17.subscription_upsell_wizard_result_granted);
                    end;
                    local v42 = v27.getPreviousPromptState(false);
                    if v42 then
                        v27.setPromptState(v42);
                    end;
                    if v32 == v13.AcceptTransfer then
                        v9(v27);
                        return;
                    elseif v32 == v13.InitiateTransfer then
                        v7(v27);
                        return;
                    elseif v32 == v13.ProcessTransfer then
                        v8(v27, v31 or 0);
                        return;
                    elseif l_direction_0 == v11.Receive then
                        v9(v27);
                        return;
                    else
                        v8(v27, v31 or 0);
                        return;
                    end;
                else
                    v18(v27, v16.CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter, {
                        recourseSurface = "subscription"
                    });
                    if v3.FFlagEnableRobuxTransferFlowEventIngest then
                        v19(v27, v17.subscription_upsell_wizard_result_denied);
                    end;
                    l_triggerOnClose_0();
                    return;
                end;
            end, v36, v14.ENTRY_POINT_EVENT_CTX, v39, v14.NAMESPACE_NAME);
            return;
        end;
    end, {});
    return v2.createElement(v2.Fragment, {});
end;