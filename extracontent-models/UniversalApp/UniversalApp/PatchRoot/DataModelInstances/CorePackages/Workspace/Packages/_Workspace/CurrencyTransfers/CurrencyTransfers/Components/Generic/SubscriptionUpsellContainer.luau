local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v5 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v6 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v7 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v8 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v9 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v10 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v11 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v12 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v13 = require(l_script_FirstAncestor_0.Utils.getCounterUserId);
local v14 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v15 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v16 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v16.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v16.InExpAmpWizardController;
local v19 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceName_0 = v19.SurfaceName;
local l_SurfaceContext_0 = v19.SurfaceContext;
return function(v22) --[[ Line: 51 ]] --[[ Name: SubscriptionUpsellContainer ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), v10 (copy), l_SurfaceContext_0 (copy), l_SurfaceName_0 (copy), v2 (copy), v15 (copy), v14 (copy), v8 (copy), v13 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v11 (copy), v7 (copy), v5 (copy), v6 (copy), v9 (copy), v12 (copy)
    local v23 = v4();
    local v24 = l_useLocalization_0({
        UpsellSubscriptionTitle = "Features.Transfers.Title.UpsellSubscription"
    });
    local l_direction_0 = v22.direction;
    local l_triggerOnClose_0 = v23.triggerOnClose;
    local v27 = v23.getSelectedAmount(false);
    local v28 = v23.getTransferRetryOrigin(false);
    local v29 = if v23.getTransferOrigination(false) == v10.InExperience then l_SurfaceContext_0.InGame else l_SurfaceContext_0.InApp;
    local v30 = {
        purchaseUIOptions = {
            title = v24.UpsellSubscriptionTitle or ""
        }, 
        surfaceName = l_SurfaceName_0.RobuxTransferUpsell, 
        surfaceContext = v29
    };
    v2.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v22 (copy), l_triggerOnClose_0 (copy), v15 (ref), v23 (copy), v14 (ref), v8 (ref), v13 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v28 (copy), v11 (ref), v7 (ref), v5 (ref), v6 (ref), v27 (copy), v9 (ref), v30 (copy), v12 (ref)
        if not v22.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            v15(v23, v14.CurrencyTransferSubscriptionUpsellWizardOpenedCounter, {
                recourseSurface = "subscription"
            });
            local v31 = v23.getPromptState(false);
            v23.setPreviousPromptState(v31);
            v23.setPromptState(v8.Hidden);
            local v32 = v13(v23, l_direction_0);
            local v33 = nil;
            if v32 then
                v33 = {
                    {
                        name = "targetUser", 
                        value = tostring(v32), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v22.ampFeatureCheck, function(v34, _) --[[ Line: 103 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v15 (ref), v23 (ref), v14 (ref), v28 (ref), v11 (ref), v7 (ref), v5 (ref), v6 (ref), v27 (ref), l_direction_0 (ref), v9 (ref), l_triggerOnClose_0 (ref)
                if v34 == l_AccessResponseEnum_0.Granted then
                    v15(v23, v14.CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter, {
                        recourseSurface = "subscription"
                    });
                    local v36 = v23.getPreviousPromptState(false);
                    if v36 then
                        v23.setPromptState(v36);
                    end;
                    if v28 == v11.AcceptTransfer then
                        v7(v23);
                        return;
                    elseif v28 == v11.InitiateTransfer then
                        v5(v23);
                        return;
                    elseif v28 == v11.ProcessTransfer then
                        v6(v23, v27 or 0);
                        return;
                    elseif l_direction_0 == v9.Receive then
                        v7(v23);
                        return;
                    else
                        v6(v23, v27 or 0);
                        return;
                    end;
                else
                    v15(v23, v14.CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter, {
                        recourseSurface = "subscription"
                    });
                    l_triggerOnClose_0();
                    return;
                end;
            end, v30, v12.ENTRY_POINT_EVENT_CTX, v33, v12.NAMESPACE_NAME);
            return;
        end;
    end, {});
    return v2.createElement(v2.Fragment, {});
end;