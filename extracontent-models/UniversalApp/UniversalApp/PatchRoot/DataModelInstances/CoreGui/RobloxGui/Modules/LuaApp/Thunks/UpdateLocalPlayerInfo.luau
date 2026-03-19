local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetUsersAuthenticated);
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v4 (copy), l_GetLocalUser_0 (copy), v3 (copy), l_Logging_0 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v5 (ref), v7 (copy), v4 (ref), l_GetLocalUser_0 (ref), v3 (ref), l_Logging_0 (ref)
        local v9 = v8:getState();
        local v10 = v9.Users[v9.LocalUserId];
        local l_IsLocalUserUnder13_0 = v9.IsLocalUserUnder13;
        local l_CountryCode_0 = v9.CountryCode;
        return v5(v7):andThen(function(v13) --[[ Line: 19 ]]
            -- upvalues: v4 (ref), v10 (copy), l_IsLocalUserUnder13_0 (copy), l_CountryCode_0 (copy), v8 (copy), l_GetLocalUser_0 (ref), v3 (ref)
            local v14 = v4.new(v10.id, v13.responseBody.name, v10.membership.Value, l_IsLocalUserUnder13_0, l_CountryCode_0, v13.responseBody.displayName);
            v14:setToLocalPlayer();
            v14:setToLocalStorage();
            v8:dispatch(l_GetLocalUser_0());
            return v3.resolve();
        end, function(v15) --[[ Line: 33 ]]
            -- upvalues: l_Logging_0 (ref), v3 (ref)
            l_Logging_0.warn("Failed to update local user info");
            return v3.reject(v15);
        end);
    end;
end;