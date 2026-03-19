local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AccountSwitcher.GetLoggedInUsersMetadata);
local v3 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v5 = game:DefineFastFlag("EnablePackageGetAccountsList1", false);
local l_CorePackages_0 = game:GetService("CorePackages");
if v5 then
    return require(l_CorePackages_0.Workspace.Packages.AccountSwitching).GetAccountsList;
else
    return function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: v3 (copy), v1 (copy), v4 (copy), v2 (copy)
        if not v3 then
            return v1.resolve();
        else
            local v9 = v3 and v4.getAccountBlob() or "";
            return v2(v7, v9, not v8):andThen(function(v10) --[[ Line: 21 ]]
                -- upvalues: v3 (ref), v4 (ref), v1 (ref)
                if v3 then
                    v4.setAccountBlob(v10.responseBody.encrypted_users_data_blob);
                    v4.flush();
                end;
                return v1.resolve(v10.responseBody);
            end):catch(function(v11) --[[ Line: 27 ]]
                -- upvalues: v1 (ref)
                if v11.data then
                    return v1.reject(v11.data.errorCode);
                elseif not v11.StatusCode then
                    return v1.reject();
                else
                    return v1.reject({
                        v11.StatusCode
                    });
                end;
            end);
        end;
    end;
end;