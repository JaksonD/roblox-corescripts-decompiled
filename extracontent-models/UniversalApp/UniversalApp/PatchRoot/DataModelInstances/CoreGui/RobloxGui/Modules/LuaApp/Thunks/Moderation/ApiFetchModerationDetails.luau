local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.mutedError);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Models.UserModerationApi.ModerationDetail);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.ModerationAPI.GetModerationDetail);
local v8 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationDetail);
local v9 = require(l_CorePackages_0.Packages.tutils);
local v10 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
return function(v11) --[[ Line: 16 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), l_Logging_0 (copy), v10 (copy), v4 (copy), v6 (copy), v3 (copy), v9 (copy), v8 (copy)
    return l_PerformFetch_0.Single("luaapp.usermoderationapi.UserModeration.get_v1_not_approved", function(v12) --[[ Line: 17 ]]
        -- upvalues: v7 (ref), v11 (copy), l_Logging_0 (ref), v10 (ref), v4 (ref), v6 (ref), v3 (ref), v9 (ref), v8 (ref)
        return v7(v11):andThen(function(v13) --[[ Line: 18 ]]
            -- upvalues: l_Logging_0 (ref), v12 (copy), v10 (ref), v4 (ref), v6 (ref), v3 (ref), v9 (ref), v8 (ref)
            local l_responseBody_0 = v13.responseBody;
            l_Logging_0.warn("The user is moderated with type: `" .. tostring(l_responseBody_0.punishmentTypeDescription) .. "`");
            l_Logging_0.warn("Verification category is: `" .. tostring(l_responseBody_0.verificationCategory) .. "`");
            if l_responseBody_0.punishmentTypeDescription == nil then
                v12:dispatch(v10(false));
                return v4.resolve();
            else
                local v15 = v6.fromJsonData(l_responseBody_0);
                local v16, v17 = v15:unwrap();
                if v16 == false then
                    l_Logging_0.warn("Failed to parse moderation detail.");
                    v3("(Moderation) Failed to parse moderation detail. Data: " .. v9.toString(l_responseBody_0));
                    return v4.reject(v13);
                else
                    v12:dispatch(v8(v17));
                    return v4.resolve(v15);
                end;
            end;
        end, function(v18) --[[ Line: 41 ]]
            -- upvalues: l_Logging_0 (ref), v9 (ref), v3 (ref), v4 (ref)
            l_Logging_0.warn("Failed to get moderation detail: ");
            l_Logging_0.warn(v9.print(v18));
            v3("(Moderation) Failed to get moderation detail: " .. v9.toString(v18));
            return v4.reject(v18);
        end);
    end);
end;