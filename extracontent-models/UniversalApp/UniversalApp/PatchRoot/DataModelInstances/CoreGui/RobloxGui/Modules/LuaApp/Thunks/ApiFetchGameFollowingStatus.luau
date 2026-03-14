local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsGetStatus);
local v6 = require(l_Modules_0.LuaApp.Actions.SetGameFollowingStatus);
local v7 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v8 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit);
return function(v9, v10) --[[ Line: 13 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v3 (copy), l_Logging_0 (copy)
    if type(v10) ~= "string" then
        error("ApiFetchGameFollowingStatus thunk expects universeId to be a string");
    end;
    return l_PerformFetch_0.Single("ApiFetchGameFollowingStatus" .. v10, function(v11) --[[ Line: 18 ]]
        -- upvalues: v5 (ref), v9 (copy), v10 (copy), v6 (ref), v7 (ref), v8 (ref), v3 (ref), l_Logging_0 (ref)
        local l_LocalUserId_0 = v11:getState().LocalUserId;
        return v5(v9, l_LocalUserId_0, v10):andThen(function(v13) --[[ Line: 20 ]]
            -- upvalues: v11 (copy), v6 (ref), v10 (ref), v7 (ref), v8 (ref), v3 (ref), l_Logging_0 (ref)
            local l_responseBody_0 = v13.responseBody;
            if l_responseBody_0 ~= nil and l_responseBody_0.CanFollow ~= nil and l_responseBody_0.IsFollowing ~= nil then
                v11:dispatch(v6(v10, l_responseBody_0.CanFollow, l_responseBody_0.IsFollowing));
                local v15 = if l_responseBody_0.FollowingCountByType ~= nil then tonumber(l_responseBody_0.FollowingCountByType) else 0;
                local v16 = if l_responseBody_0.FollowingLimitByType ~= nil then tonumber(l_responseBody_0.FollowingLimitByType) else 0;
                v11:dispatch(v7(v15));
                v11:dispatch(v8(v16));
                return v3.resolve(v13);
            else
                l_Logging_0.warn("Response from FollowingsGetStatus is malformed!");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end);
    end);
end;