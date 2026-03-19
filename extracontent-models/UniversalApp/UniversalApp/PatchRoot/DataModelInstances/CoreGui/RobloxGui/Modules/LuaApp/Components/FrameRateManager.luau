local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.React);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_VideoPlaybackCoordinator_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator;
local l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppFixVideoFramerateThrottlePolicy;
return l_RoactAppPolicy_0.connect(function(v6, _) --[[ Line: 35 ]]
    return {
        throttleFramerate = v6.getThrottleFramerate()
    };
end)(function(v8) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (copy), l_VideoPlaybackCoordinator_0 (copy)
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v8 (copy), l_RunService_0 (ref), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (ref), l_VideoPlaybackCoordinator_0 (ref)
        if v8.throttleFramerate then
            l_RunService_0:setThrottleFramerateEnabled(true);
            if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
                l_VideoPlaybackCoordinator_0.default:setIsSettingFramerateThrottleAllowedByPolicy(true);
                l_VideoPlaybackCoordinator_0.default:setPreferredFramerateThrottling(true);
            end;
        end;
        return function() --[[ Line: 21 ]]
            -- upvalues: v8 (ref), l_RunService_0 (ref), l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 (ref), l_VideoPlaybackCoordinator_0 (ref)
            if v8.throttleFramerate then
                l_RunService_0:setThrottleFramerateEnabled(false);
                if l_FFlagLuaAppFixVideoFramerateThrottlePolicy_0 then
                    l_VideoPlaybackCoordinator_0.default:setIsSettingFramerateThrottleAllowedByPolicy(false);
                    l_VideoPlaybackCoordinator_0.default:setPreferredFramerateThrottling(false);
                end;
            end;
        end;
    end, {});
end);