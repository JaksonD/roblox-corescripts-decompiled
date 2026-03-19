local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchModerationDetails);
local v4 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.Moderation.DetectModeratedUser);
local v6 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchAccessStatus);
local v7 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local l_FFlagEnableUserAccessServiceIntegration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUserAccessServiceIntegration;
local l_FFlagCheckUserModerationAfterLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCheckUserModerationAfterLogin;
return function(v10, v11) --[[ Line: 17 ]]
    -- upvalues: l_FFlagCheckUserModerationAfterLogin_0 (copy), v7 (copy), v5 (copy), l_Logging_0 (copy), v4 (copy), l_FFlagEnableUserAccessServiceIntegration_0 (copy), v6 (copy), v3 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: l_FFlagCheckUserModerationAfterLogin_0 (ref), v7 (ref), v5 (ref), v11 (copy), l_Logging_0 (ref), v4 (ref), l_FFlagEnableUserAccessServiceIntegration_0 (ref), v6 (ref), v10 (copy), v3 (ref)
        local l_Moderation_0 = v12:getState().Moderation;
        if l_Moderation_0 and l_Moderation_0.userModerated or false then
            return;
        elseif l_FFlagCheckUserModerationAfterLogin_0 and v12:getState().AuthenticationStatus.status ~= v7.LOGGED_IN then
            return;
        else
            if v5(v11) then
                l_Logging_0.warn("The user is moderated.");
                v12:dispatch(v4(true));
                if l_FFlagEnableUserAccessServiceIntegration_0 then
                    v12:dispatch(v6(v10));
                    return;
                else
                    v12:dispatch(v3(v10));
                end;
            end;
            return;
        end;
    end;
end;