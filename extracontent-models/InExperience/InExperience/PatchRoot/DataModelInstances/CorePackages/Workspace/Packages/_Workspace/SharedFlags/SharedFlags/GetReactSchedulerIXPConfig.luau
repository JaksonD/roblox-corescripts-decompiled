local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_AppStorageJsonCacheUtils_0 = require(l_Parent_0.AppCommonLib).Utils.AppStorageJsonCacheUtils;
local v4 = require(script.Parent.GetFFlagEnableAppStorageJsonCacheInABTest);
local v5 = game:DefineFastString("ExperienceReactDeferredScheduler_LayerName", "UIEcosystem.User");
local v6 = game:DefineFastFlag("EnableReactSchedulerIXP", false);
return function() --[[ Line: 26 ]]
    -- upvalues: v6 (copy), v4 (copy), l_AppStorageJsonCacheUtils_0 (copy), v5 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    if not v6 then
        return nil;
    else
        if v4() then
            local v7 = l_AppStorageJsonCacheUtils_0.default:getCachedJsonForKey("ExperimentCache");
            if v7 then
                return v7[v5];
            end;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("ExperimentCache");
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 41 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 and l_result_1 then
                    return l_result_1[v5];
                end;
            end;
        end;
        return nil;
    end;
end;