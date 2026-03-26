local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local _ = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v3 = require(l_script_FirstAncestor_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Utils.parseSubscriptionError);
return function(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: performDeveloperSubscriptionRobuxPurchase ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    return v5.performDeveloperSubscriptionRobuxPurchase(v6, v7):andThen(function() --[[ Line: 10 ]]
        -- upvalues: v3 (ref)
        return v3.resolve();
    end, function(v8) --[[ Line: 12 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (ref)
        if type(v8) == "string" then
            return v3.reject(v4(v8));
        else
            return v3.reject(v2.UnknownFailure);
        end;
    end);
end;