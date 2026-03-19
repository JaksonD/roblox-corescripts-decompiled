local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_VideoPlaybackCoordinator_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator;
local l_Object_0 = v7.Object;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
return function(v11) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), v6 (copy), l_AppRunService_0 (copy), l_RunService_0 (copy), l_RoactAppPolicy_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_VideoPlaybackCoordinator_0 (copy), l_Object_0 (copy)
    return v3.forwardRef(function(v12, v13) --[[ Line: 23 ]]
        -- upvalues: v6 (ref), l_AppRunService_0 (ref), l_RunService_0 (ref), v3 (ref), l_RoactAppPolicy_0 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v11 (copy), l_Object_0 (ref)
        local v14 = v6(l_AppRunService_0) or l_RunService_0;
        local v17 = v3.useMemo(function() --[[ Line: 27 ]]
            -- upvalues: l_RoactAppPolicy_0 (ref), v14 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref), v11 (ref)
            return l_RoactAppPolicy_0.connect(function(v15) --[[ Line: 28 ]]
                -- upvalues: v14 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref)
                return {
                    setThrottleFramerateEnabled = function(v16) --[[ Line: 30 ]] --[[ Name: setThrottleFramerateEnabled ]]
                        -- upvalues: v15 (copy), v14 (ref), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), l_VideoPlaybackCoordinator_0 (ref)
                        if v15.getThrottleFramerate() then
                            v14:setThrottleFramerateEnabled(v16);
                            if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                                l_VideoPlaybackCoordinator_0.default:setPreferredFramerateThrottling(v16);
                            end;
                        end;
                    end
                };
            end)(v11);
        end, {
            v11, 
            v14
        });
        return v3.createElement(v17, l_Object_0.assign(v12, {
            ref = v13
        }));
    end);
end;