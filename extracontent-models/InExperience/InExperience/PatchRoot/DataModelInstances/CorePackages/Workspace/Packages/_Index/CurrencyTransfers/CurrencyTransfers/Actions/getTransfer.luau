local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.NetworkRequests.getTransferRequestByIdRequest);
local _ = require(l_script_FirstAncestor_0.Models.GetTransferByIdModel);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local v5 = require(l_script_FirstAncestor_0.Actions.handleGetError);
return function(v6) --[[ Line: 12 ]] --[[ Name: getTransfer ]]
    -- upvalues: v5 (copy), v2 (copy)
    local l_setRobuxTransfer_0 = v6.setRobuxTransfer;
    local v8 = v6.getTransferRequestId(false);
    if not v8 then
        v5(v6, nil);
        return;
    else
        local v9 = {
            transferRequestId = v8
        };
        return v2(v9):andThen(function(v10) --[[ Line: 26 ]]
            -- upvalues: l_setRobuxTransfer_0 (copy), v5 (ref), v6 (copy)
            if v10 and v10.transfer then
                l_setRobuxTransfer_0(v10.transfer);
                return;
            else
                v5(v6, nil);
                return;
            end;
        end):catch(function(v11) --[[ Line: 33 ]]
            -- upvalues: v5 (ref), v6 (copy)
            if typeof(v11) == "table" and v11.errorMessage then
                v5(v6, v11);
                return;
            else
                v5(v6, nil);
                return;
            end;
        end);
    end;
end;