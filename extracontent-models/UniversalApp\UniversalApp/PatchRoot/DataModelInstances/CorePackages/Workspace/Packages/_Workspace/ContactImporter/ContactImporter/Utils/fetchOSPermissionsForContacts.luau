local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_AppStorageService_0 = v1.AppStorageService;
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy)
    v5:hasPermissions({
        l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
    }):andThen(function(v7) --[[ Line: 13 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v6 (copy)
        local v8 = v7 and v7.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
        if not v8 then
            l_updateOptedInUsers_0:clearLocalStorage(l_AppStorageService_0);
        end;
        if v6 then
            v6(v8);
        end;
    end):catch(function(_) --[[ Line: 24 ]]
        -- upvalues: v6 (copy)
        if v6 then
            v6(false);
        end;
    end);
end;