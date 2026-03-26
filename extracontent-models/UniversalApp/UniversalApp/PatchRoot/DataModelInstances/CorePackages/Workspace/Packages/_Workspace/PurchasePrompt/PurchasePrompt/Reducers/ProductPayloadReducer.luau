local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetProductPayload);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v6 = {};
return (l_Rodux_0.createReducer(v6, {
    [v3.name] = function(_, v8) --[[ Line: 14 ]]
        return v8.productPayload;
    end, 
    [v4.name] = function(v9, _) --[[ Line: 17 ]]
        -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v6 (copy)
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v9.kind == "DeveloperSubscription" then
            return v6;
        else
            return v9;
        end;
    end
}));