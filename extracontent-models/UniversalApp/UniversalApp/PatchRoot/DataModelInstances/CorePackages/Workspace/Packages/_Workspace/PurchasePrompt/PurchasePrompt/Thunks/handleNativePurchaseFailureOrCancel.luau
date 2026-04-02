local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local v1 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v2 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v3 = require(l_script_FirstAncestor_0.Enums.Counter);
local v4 = require(l_script_FirstAncestor_0.Thunks.sendCounter);
local v5 = require(l_script_FirstAncestor_0.Services.Network);
local v6 = require(l_script_FirstAncestor_0.Services.Analytics);
local v7 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v8 = require(l_script_FirstAncestor_0.Thunk);
local v9 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v10 = {
    v6, 
    v5, 
    v7
};
return function() --[[ Line: 21 ]] --[[ Name: handleNativePurchaseFailureOrCancel ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy), v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    return v8.new(script.Name, v10, function(v11, _) --[[ Line: 22 ]]
        -- upvalues: v9 (ref), v1 (ref), v2 (ref), v4 (ref), v3 (ref)
        if v11:getState().promptState == v9.BlackbirdUpsellInProgress then
            return;
        else
            v11:dispatch(v1(v2.InvalidFundsUnknown));
            v11:dispatch(v4(v3.UpsellFailedNativePurchase));
            return;
        end;
    end);
end;