local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseRequested);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseStarted);
local v6 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v7 = require(l_script_FirstAncestor_0.NetworkRequests.getAccount);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v9, v10, v11, v12, v13, v14) --[[ Line: 16 ]] --[[ Name: InitiateBulkPurchaseFlow ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v5 (copy), v4 (copy), v6 (copy)
    return function(v15) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v7 (ref), v9 (copy), v2 (ref), v5 (ref), v4 (ref), v6 (ref)
        v15:dispatch(v3(v10, v11, v12, v13, v14));
        local v16, _ = v7(v9);
        return v2.all({
            v16
        }):andThen(function(_) --[[ Line: 30 ]]
            -- upvalues: v15 (copy), v5 (ref), v12 (ref)
            v15:dispatch(v5(v12));
        end):catch(function(_) --[[ Line: 38 ]]
            -- upvalues: v15 (copy), v4 (ref), v6 (ref)
            v15:dispatch(v4(v6.Generic));
        end);
    end;
end;