local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_NetworkingContacts_0 = require(l_Parent_0.dependencies).NetworkingContacts;
local v3 = require(l_Parent_0.Utils.contactImporterSync);
local v4 = require(l_Parent_0.Utils.formatContacts);
local v5 = require(l_Parent_0.Analytics.Enums.UploadContactsSources);
local l_PermissionsProtocol_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol;
local l_default_0 = l_PermissionsProtocol_0.default;
local v8 = {
    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
};
return function(v9, v10, v11, v12) --[[ Line: 14 ]]
    -- upvalues: l_default_0 (copy), v8 (copy), l_PermissionsProtocol_0 (copy), v3 (copy), v4 (copy), v5 (copy), l_NetworkingContacts_0 (copy)
    return function(v13) --[[ Line: 15 ]]
        -- upvalues: l_default_0 (ref), v8 (ref), l_PermissionsProtocol_0 (ref), v3 (ref), v11 (copy), v9 (copy), v12 (copy), v10 (copy), v4 (ref), v5 (ref), l_NetworkingContacts_0 (ref)
        l_default_0:hasPermissions(v8):andThen(function(v14) --[[ Line: 18 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v3 (ref), v11 (ref), v9 (ref), v12 (ref), v10 (ref), v4 (ref), v5 (ref), v13 (copy), l_NetworkingContacts_0 (ref)
            if v14 and v14.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
                local v16 = v3:shouldSyncContacts(v11, v9, l_UnixTimestampMillis_0);
                if v12 or v16 then
                    return v10:getContacts():andThen(function(v17) --[[ Line: 27 ]]
                        -- upvalues: v4 (ref), v5 (ref), v13 (ref), l_NetworkingContacts_0 (ref)
                        local v18 = v4(v17);
                        v18.source = v5.AutoSync;
                        return v13:dispatch(l_NetworkingContacts_0.UploadContactsByUser.API(v18));
                    end):andThen(function() --[[ Line: 32 ]]
                        -- upvalues: v3 (ref), v11 (ref), v9 (ref), l_UnixTimestampMillis_0 (copy)
                        return v3:updateSyncTimestamp(v11, v9, l_UnixTimestampMillis_0);
                    end):catch(function() --[[ Line: 35 ]]

                    end);
                end;
            end;
        end):catch(function() --[[ Line: 39 ]]

        end);
    end;
end;