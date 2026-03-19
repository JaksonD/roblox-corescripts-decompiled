local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.TransferRobuxContainer);
local v4 = require(l_script_FirstAncestor_0.Contexts.TransferContext);
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
return function(v6) --[[ Line: 17 ]] --[[ Name: TransferRobuxApp ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.createElement(v4.Provider, {
        value = v6.transferStore
    }, {
        TransferRobuxSheet = v2.createElement(v3, {})
    });
end;