local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = game:DefineFastInt("DebugAvatarDataDelay", 0);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
return function(v12, v13) --[[ Line: 19 ]]
    -- upvalues: v5 (copy), l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v8 (copy), v10 (copy), v9 (copy), l_Logging_0 (copy), v6 (copy)
    v5.isType(v12, "function", "GetAvatarData thunk expects networkImpl to be a function");
    return l_PerformFetch_0.Single(v7.GetAvatarDataKey, function(_) --[[ Line: 21 ]]
        -- upvalues: l_FFlagAXModeratedItemsFlow_0 (ref), v13 (copy), v8 (ref), v12 (copy), v10 (ref), v9 (ref), l_Logging_0 (ref), v6 (ref)
        local v15 = if l_FFlagAXModeratedItemsFlow_0 then {
            checkAssetAvailability = v13
        } else nil;
        return v8.GetAvatarData(v12, v15):andThen(function(v16) --[[ Line: 25 ]]
            -- upvalues: v10 (ref), v9 (ref)
            if v10 > 0 then
                task.wait(v10);
            end;
            return v9.tableToCamelCaseKeys(v16.responseBody);
        end, function(v17) --[[ Line: 33 ]]
            -- upvalues: l_Logging_0 (ref), v6 (ref)
            l_Logging_0.warn("WebApi failure in GetAvatarData: " .. tostring(v17));
            return v6.reject(v17);
        end);
    end);
end;