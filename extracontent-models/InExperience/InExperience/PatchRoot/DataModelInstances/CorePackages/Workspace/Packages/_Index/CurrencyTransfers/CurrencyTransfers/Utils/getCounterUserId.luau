local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local v1 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
return function(v3, v4) --[[ Line: 10 ]] --[[ Name: getCounterUserId ]]
    -- upvalues: v1 (copy)
    if v4 == v1.Send then
        local v5 = v3.getRecipient(false);
        if v5 then
            return v5.targetId;
        end;
    else
        local v6 = v3.getSender(false);
        if v6 then
            return v6.targetId;
        end;
    end;
    return nil;
end;