local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_NetworkingAccountInformation_0 = v1.NetworkingAccountInformation;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_llama_0 = v1.llama;
local v7 = require(l_Parent_0.Utils.contactImporterModalInfo);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local v9 = require(l_Parent_0.Utils.contactImporterOSPermissions);
local v10 = require(l_Parent_0.Common.Constants);
local v11 = require(l_Parent_0.Actions.SetContactImporterDisplayLogic);
local function v13(_) --[[ Line: 14 ]]

end;
return function(v14, v15, v16) --[[ Line: 18 ]]
    -- upvalues: l_NetworkingUserSettings_0 (copy), l_Promise_0 (copy), v13 (copy), l_NetworkingAccountInformation_0 (copy), l_PermissionsProtocol_0 (copy), l_updateOptedInUsers_0 (copy), l_llama_0 (copy), v7 (copy), v10 (copy), v11 (copy), v9 (copy)
    return function(v17) --[[ Line: 19 ]]
        -- upvalues: l_NetworkingUserSettings_0 (ref), l_Promise_0 (ref), v13 (ref), l_NetworkingAccountInformation_0 (ref), v15 (copy), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), v16 (copy), l_llama_0 (ref), v7 (ref), v14 (copy), v10 (ref), v11 (ref), v9 (ref)
        local _ = {};
        local v23 = {
            v17:dispatch(l_NetworkingUserSettings_0.GetUserSettings.API({})):andThen(function(v19) --[[ Line: 22 ]]
                -- upvalues: l_Promise_0 (ref), v13 (ref)
                return l_Promise_0.resolve({
                    phoneNumberDiscoverability = v19.responseBody.phoneNumberDiscoverability
                }, v13);
            end), 
            v17:dispatch(l_NetworkingAccountInformation_0.GetPhoneInformation.API()):andThen(function(v20) --[[ Line: 27 ]]
                -- upvalues: l_Promise_0 (ref), v13 (ref)
                return l_Promise_0.resolve({
                    isPhoneVerified = v20.responseBody.isVerified
                }, v13);
            end), 
            v15:hasPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v21) --[[ Line: 32 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), v16 (ref), l_Promise_0 (ref)
                local v22 = v21 and v21.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if not v22 then
                    l_updateOptedInUsers_0:clearLocalStorage(v16);
                end;
                return l_Promise_0.resolve({
                    hasOSPermissions = v22
                });
            end, v13)
        };
        l_Promise_0.all(v23):andThen(function(v24) --[[ Line: 41 ]]
            -- upvalues: l_llama_0 (ref), v7 (ref), v16 (ref), v14 (ref), v10 (ref), v17 (copy), v11 (ref), v9 (ref)
            local v25 = {};
            for _, v27 in v24 do
                v25 = l_llama_0.Dictionary.join(v25, v27);
            end;
            local v28 = v7:isUserOptedInLocalStorage(v16, v14);
            local v29 = v7:shouldUserSeeModalPotentiallyAgain(v16, v14);
            v25[v10.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_AGAIN] = v29;
            v25[v10.IS_USER_OPTED_IN_LOCAL_STORAGE] = v28;
            v17:dispatch(v11(v25));
            local v30 = v9:getLastOSPermissionSettings(v16);
            local l_hasOSPermissions_0 = v25.hasOSPermissions;
            if v30 ~= l_hasOSPermissions_0 then

            end;
            v9:updateOSPermissionSettings(v16, l_hasOSPermissions_0);
        end):catch(function() --[[ Line: 64 ]]

        end);
    end;
end;