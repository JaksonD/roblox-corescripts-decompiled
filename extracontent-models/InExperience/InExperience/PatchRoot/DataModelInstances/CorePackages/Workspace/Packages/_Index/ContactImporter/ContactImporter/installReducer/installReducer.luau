local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local v4 = require(script.Parent.Contacts);
local v5 = require(script.Parent.ShowContactImporterParams);
local l_RoduxUserPermissions_0 = v1.RoduxUserPermissions;
return function() --[[ Line: 11 ]]
    -- upvalues: l_Rodux_0 (copy), v4 (copy), l_RoduxUserPermissions_0 (copy), l_RoduxNetworking_0 (copy), v5 (copy)
    return l_Rodux_0.combineReducers({
        Contacts = v4, 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        ShowContactImporterParams = v5
    });
end;