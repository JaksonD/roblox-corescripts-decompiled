local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Contexts.TransferContext);
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
return function() --[[ Line: 9 ]] --[[ Name: useTransferStore ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = v2.useContext(v3);
    if v5 == nil then
        error("useTransferStore must be used within a TransferContext");
    end;
    return v5;
end;