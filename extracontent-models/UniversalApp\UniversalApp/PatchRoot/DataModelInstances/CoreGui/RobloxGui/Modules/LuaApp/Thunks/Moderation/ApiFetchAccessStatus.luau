local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.UserAccess.GetAccessStatus);
local v6 = require(l_CorePackages_0.Packages.tutils);
local v7 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
local v8 = require(l_Modules_0.LuaApp.Actions.UserAccess.SetUserAccessRestrictionDetail);
local v9 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchModerationDetails);
local v10 = require(l_Modules_0.LuaApp.Models.UserModerationApi.RestrictionDetail);
local v11 = require(l_Modules_0.LuaApp.Models.UserModerationApi.RestrictionSource);
return function(v12) --[[ Line: 17 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v10 (copy), l_Logging_0 (copy), v6 (copy), v3 (copy), v7 (copy), v8 (copy), v11 (copy), v9 (copy)
    return l_PerformFetch_0.Single("luaapp.usermoderationapi.UserModeration.get_v2_not_approved", function(v13) --[[ Line: 18 ]]
        -- upvalues: v5 (ref), v12 (copy), v10 (ref), l_Logging_0 (ref), v6 (ref), v3 (ref), v7 (ref), v8 (ref), v11 (ref), v9 (ref)
        return v5(v12):andThen(function(v14) --[[ Line: 19 ]]
            -- upvalues: v10 (ref), l_Logging_0 (ref), v6 (ref), v3 (ref), v13 (copy), v7 (ref), v8 (ref), v11 (ref), v9 (ref), v12 (ref)
            local l_responseBody_0 = v14.responseBody;
            local v16, v17 = v10.fromJsonData(l_responseBody_0):unwrap();
            if v16 == false then
                l_Logging_0.warn("Failed to parse Use detail. Data: " .. v6.toString(l_responseBody_0));
                return v3.reject(v14);
            elseif v17.restriction == nil then
                v13:dispatch(v7(false));
                v13:dispatch(v8(nil));
                return v3.resolve(nil);
            else
                v13:dispatch(v8(v17.restriction));
                if v17.restriction.source == v11.Moderation then
                    v13:dispatch(v9(v12));
                end;
                return v3.resolve(v17.restriction);
            end;
        end, function(v18) --[[ Line: 43 ]]
            -- upvalues: l_Logging_0 (ref), v6 (ref), v3 (ref)
            l_Logging_0.warn(v6.print(v18));
            return v3.reject(v18);
        end);
    end);
end;