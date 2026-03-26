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
local v14 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v14.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v14.InExpAmpWizardController;
local v17 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceName_0 = v17.SurfaceName;
local l_SurfaceContext_0 = v17.SurfaceContext;
return function(v20) --[[ Line: 49 ]] --[[ Name: SubscriptionUpsellContainer ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), v10 (copy), l_SurfaceContext_0 (copy), l_SurfaceName_0 (copy), v2 (copy), v8 (copy), v13 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v11 (copy), v7 (copy), v5 (copy), v6 (copy), v9 (copy), v12 (copy)
    local v21 = v4();
    local v22 = l_useLocalization_0({
        UpsellSubscriptionTitle = "Features.Transfers.Title.UpsellSubscription"
    });
    local l_direction_0 = v20.direction;
    local l_triggerOnClose_0 = v21.triggerOnClose;
    local v25 = v21.getSelectedAmount(false);
    local v26 = v21.getTransferRetryOrigin(false);
    local v27 = if v21.getTransferOrigination(false) == v10.InExperience then l_SurfaceContext_0.InGame else l_SurfaceContext_0.InApp;
    local v28 = {
        purchaseUIOptions = {
            title = v22.UpsellSubscriptionTitle or ""
        }, 
        surfaceName = l_SurfaceName_0.RobuxTransferUpsell, 
        surfaceContext = v27
    };
    v2.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v20 (copy), l_triggerOnClose_0 (copy), v21 (copy), v8 (ref), v13 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v26 (copy), v11 (ref), v7 (ref), v5 (ref), v6 (ref), v25 (copy), v9 (ref), v28 (copy), v12 (ref)
        if not v20.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            local v29 = v21.getPromptState(false);
            v21.setPreviousPromptState(v29);
            v21.setPromptState(v8.Hidden);
            local v30 = v13(v21, l_direction_0);
            local v31 = nil;
            if v30 then
                v31 = {
                    {
                        name = "targetUser", 
                        value = tostring(v30), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v20.ampFeatureCheck, function(v32, _) --[[ Line: 95 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v21 (ref), v26 (ref), v11 (ref), v7 (ref), v5 (ref), v6 (ref), v25 (ref), l_direction_0 (ref), v9 (ref), l_triggerOnClose_0 (ref)
                if v32 == l_AccessResponseEnum_0.Granted then
                    local v34 = v21.getPreviousPromptState(false);
                    if v34 then
                        v21.setPromptState(v34);
                    end;
                    if v26 == v11.AcceptTransfer then
                        v7(v21);
                        return;
                    elseif v26 == v11.InitiateTransfer then
                        v5(v21);
                        return;
                    elseif v26 == v11.ProcessTransfer then
                        v6(v21, v25 or 0);
                        return;
                    elseif l_direction_0 == v9.Receive then
                        v7(v21);
                        return;
                    else
                        v6(v21, v25 or 0);
                        return;
                    end;
                else
                    l_triggerOnClose_0();
                    return;
                end;
            end, v28, v12.ENTRY_POINT_EVENT_CTX, v31, v12.NAMESPACE_NAME);
            return;
        end;
    end, {});
    return v2.createElement(v2.Fragment, {});
end;