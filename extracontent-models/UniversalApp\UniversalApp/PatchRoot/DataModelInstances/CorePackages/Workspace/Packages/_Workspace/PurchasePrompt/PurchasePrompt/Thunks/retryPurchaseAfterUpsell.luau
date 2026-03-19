local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local v1 = require(l_script_FirstAncestor_0.Thunk);
local v2 = require(l_script_FirstAncestor_0.Utils.dispatchPurchaseForProductPayload);
local v3 = {};
return function() --[[ Line: 11 ]] --[[ Name: retryPurchaseAfterUpsell ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.new(script.Name, v3, function(v4, _) --[[ Line: 12 ]]
        -- upvalues: v2 (ref)
        local l_productPayload_0 = v4:getState().productPayload;
        v2(function(v7) --[[ Line: 16 ]]
            -- upvalues: v4 (copy)
            v4:dispatch(v7);
        end, l_productPayload_0, nil, true);
    end);
end;