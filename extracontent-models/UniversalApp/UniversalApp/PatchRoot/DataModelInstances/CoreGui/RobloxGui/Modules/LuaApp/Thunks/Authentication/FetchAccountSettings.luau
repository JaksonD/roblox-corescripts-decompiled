local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountInfo);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v8 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v9 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v10 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
return function(v11, v12, v13) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_Players_0 (copy), l_SetAuthenticationStatus_0 (copy), v8 (copy), v9 (copy), v5 (copy), v10 (copy), v4 (copy)
    return function(v14) --[[ Line: 18 ]]
        -- upvalues: v6 (ref), v11 (copy), l_Players_0 (ref), l_SetAuthenticationStatus_0 (ref), v8 (ref), v9 (ref), v5 (ref), v10 (ref), v12 (copy), v13 (copy), v4 (ref)
        return v6(v11):andThen(function(v15) --[[ Line: 19 ]]
            -- upvalues: l_Players_0 (ref), v14 (copy), l_SetAuthenticationStatus_0 (ref), v8 (ref), v9 (ref), v5 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref), v4 (ref)
            local l_Username_0 = v15.responseBody.Username;
            local l_DisplayName_0 = v15.responseBody.DisplayName;
            local l_UserId_0 = v15.responseBody.UserId;
            local v19 = tonumber(v15.responseBody.MembershipType);
            local v20 = v15.responseBody.AgeBracket == 1;
            l_Players_0:SetLocalPlayerInfo(l_UserId_0, l_Username_0, l_DisplayName_0, v19, v20);
            v14:dispatch(l_SetAuthenticationStatus_0(v8.LOGGED_IN));
            v14:dispatch(v9({
                {
                    name = v5.Home
                }
            }));
            v14:dispatch(v10(v11, v12, v13));
            return v4.resolve();
        end, function(v21) --[[ Line: 30 ]]
            -- upvalues: v14 (copy), l_SetAuthenticationStatus_0 (ref), v8 (ref), v9 (ref), v5 (ref), v4 (ref)
            v14:dispatch(l_SetAuthenticationStatus_0(v8.LOGGED_OUT));
            v14:dispatch(v9({
                {
                    name = v5.WeChatLoginWrapper
                }
            }));
            return v4.reject(v21);
        end);
    end;
end;