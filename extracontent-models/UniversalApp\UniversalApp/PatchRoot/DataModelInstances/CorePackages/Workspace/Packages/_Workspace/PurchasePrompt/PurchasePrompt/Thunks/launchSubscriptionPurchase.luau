local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v3 = require(l_script_FirstAncestor_0.Actions.SetEconomicRestrictionError);
local v4 = require(l_script_FirstAncestor_0.Actions.PurchaseCompleteRecieved);
local v5 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v7 = require(l_script_FirstAncestor_0.Network.performSubscriptionPurchase);
local v8 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v9 = require(l_script_FirstAncestor_0.Services.Network);
local v10 = require(l_script_FirstAncestor_0.Thunk);
local v11 = require(l_script_FirstAncestor_0.Thunks.hideWindow);
local v12 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v13 = require(l_Parent_0.IAPExperience);
local l_isErrorReasonPrefixWithEconomicRestrictions_0 = v13.Utility.isErrorReasonPrefixWithEconomicRestrictions;
local l_parseErrorReasonToEconomicRestriction_0 = v13.Utility.parseErrorReasonToEconomicRestriction;
local v16 = {
    v8, 
    v9
};
return function(v17) --[[ Line: 23 ]] --[[ Name: launchSubscriptionPurchase ]]
    -- upvalues: v10 (copy), v16 (copy), v8 (copy), v9 (copy), v4 (copy), v11 (copy), v7 (copy), l_isErrorReasonPrefixWithEconomicRestrictions_0 (copy), l_parseErrorReasonToEconomicRestriction_0 (copy), v3 (copy), v2 (copy), v12 (copy), v5 (copy), v6 (copy)
    return v10.new(script.Name, v16, function(v18, v19) --[[ Line: 24 ]]
        -- upvalues: v8 (ref), v9 (ref), v4 (ref), v11 (ref), v7 (ref), v17 (copy), l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v3 (ref), v2 (ref), v12 (ref), v5 (ref), v6 (ref)
        local v20 = v19[v8];
        local v21 = v19[v9];
        if v20.isStudio() then
            v18:dispatch(v4());
            v18:dispatch(v11());
            return nil;
        else
            v7(v21, v18:getState().promptRequest.id, v17):catch(function(v22) --[[ Line: 35 ]]
                -- upvalues: l_isErrorReasonPrefixWithEconomicRestrictions_0 (ref), l_parseErrorReasonToEconomicRestriction_0 (ref), v18 (copy), v3 (ref), v2 (ref), v12 (ref)
                if l_isErrorReasonPrefixWithEconomicRestrictions_0(v22) then
                    local v23 = l_parseErrorReasonToEconomicRestriction_0(v22);
                    v18:dispatch(v3(v23.violationType, v23.timeoutMinutes));
                    v18:dispatch(v2(v12.EconomicRestriction));
                    return;
                else
                    v18:dispatch(v2(v22));
                    return;
                end;
            end);
            v18:dispatch(v5(v6.UpsellInProgress));
            v18:dispatch(v11());
            return nil;
        end;
    end);
end;