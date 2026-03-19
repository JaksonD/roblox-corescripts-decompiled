local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v12, v13) --[[ Line: 20 ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v3 (copy), v5 (copy), v9 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v8 (copy), l_Logging_0 (copy)
    local l_avatarEditorService_0 = v13.avatarEditorService;
    return l_PerformFetch_0.Single(v6.GetAvatarRulesKey, function(_) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), l_avatarEditorService_0 (copy), v5 (ref), v9 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v8 (ref), l_Logging_0 (ref)
        return v3.new(function(v16, v17) --[[ Line: 23 ]]
            -- upvalues: l_avatarEditorService_0 (ref), v5 (ref), v9 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v8 (ref), l_Logging_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
                -- upvalues: l_avatarEditorService_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return l_avatarEditorService_0:GetAvatarRulesAsync();
                else
                    return l_avatarEditorService_0:GetAvatarRules();
                end;
            end);
            if l_status_0 then
                v16((v5.tableToCamelCaseKeys(l_result_0)));
                return;
            else
                if v9() then
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(v8.Counter.AvatarEditorServiceErrors.GetAvatarRules);
                end;
                l_Logging_0.warn("WebApi failure in GetAvatarRules");
                v17({
                    HttpError = Enum.HttpError.OK
                });
                return;
            end;
        end);
    end)(v12);
end;