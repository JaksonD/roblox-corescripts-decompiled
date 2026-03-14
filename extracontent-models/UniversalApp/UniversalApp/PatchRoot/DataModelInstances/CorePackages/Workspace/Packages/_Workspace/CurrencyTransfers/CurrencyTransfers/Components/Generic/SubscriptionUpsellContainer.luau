local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v4 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v5 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v6 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v7 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v8 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v9 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v10 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v11 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v12 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v12.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v12.InExpAmpWizardController;
local v15 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_SurfaceName_0 = v15.SurfaceName;
local l_SurfaceContext_0 = v15.SurfaceContext;
return function(v18) --[[ Line: 44 ]] --[[ Name: SubscriptionUpsellContainer ]]
    -- upvalues: v3 (copy), v9 (copy), l_SurfaceContext_0 (copy), l_SurfaceName_0 (copy), v2 (copy), v7 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v10 (copy), v6 (copy), v4 (copy), v5 (copy), v8 (copy), v11 (copy)
    local v19 = v3();
    local l_direction_0 = v18.direction;
    local l_triggerOnClose_0 = v19.triggerOnClose;
    local v22 = v19.getSelectedAmount(false);
    local v23 = v19.getTransferRetryOrigin(false);
    local v24 = if v19.getTransferOrigination(false) == v9.InExperience then l_SurfaceContext_0.InGame else l_SurfaceContext_0.InApp;
    local v25 = {
        purchaseUIOptions = {
            title = "Lorem ipsum dolor sit amet"
        }, 
        surfaceName = l_SurfaceName_0.RobuxTransferUpsell, 
        surfaceContext = v24
    };
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v18 (copy), l_triggerOnClose_0 (copy), v19 (copy), v7 (ref), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v23 (copy), v10 (ref), v6 (ref), v4 (ref), v5 (ref), v22 (copy), l_direction_0 (copy), v8 (ref), v25 (copy), v11 (ref)
        if not v18.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            local v26 = v19.getPromptState(false);
            v19.setPreviousPromptState(v26);
            v19.setPromptState(v7.Hidden);
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v18.ampFeatureCheck, function(v27, _) --[[ Line: 81 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v19 (ref), v23 (ref), v10 (ref), v6 (ref), v4 (ref), v5 (ref), v22 (ref), l_direction_0 (ref), v8 (ref), l_triggerOnClose_0 (ref)
                if v27 == l_AccessResponseEnum_0.Granted then
                    local v29 = v19.getPreviousPromptState(false);
                    if v29 then
                        v19.setPromptState(v29);
                    end;
                    if v23 == v10.AcceptTransfer then
                        v6(v19);
                        return;
                    elseif v23 == v10.InitiateTransfer then
                        v4(v19);
                        return;
                    elseif v23 == v10.ProcessTransfer then
                        v5(v19, v22 or 0);
                        return;
                    elseif l_direction_0 == v8.Receive then
                        v6(v19);
                        return;
                    else
                        v5(v19, v22 or 0);
                        return;
                    end;
                else
                    l_triggerOnClose_0();
                    return;
                end;
            end, v25, v11.ENTRY_POINT_EVENT_CTX, v11.NAMESPACE_NAME);
            return;
        end;
    end, {});
    return v2.createElement(v2.Fragment, {});
end;