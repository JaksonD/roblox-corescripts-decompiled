local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules:FindFirstChild("LuaApp");
local v4 = require(l_LuaApp_0.ExperienceEventReceiver);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v7 = nil;
local function _() --[[ Line: 16 ]]
    -- upvalues: v7 (ref), l_VRService_0 (copy)
    if not v7 then
        v7 = l_VRService_0:GetPropertyChangedSignal("VRSessionState"):Connect(function() --[[ Line: 18 ]]
            -- upvalues: l_VRService_0 (ref)
            l_VRService_0.QuestDisplayRefreshRate = 72;
        end);
    end;
end;
return function() --[[ Line: 24 ]]
    -- upvalues: l_SplashScreenManager_0 (copy), l_IntervalPerformanceTracker_0 (copy), v4 (copy), l_VRService_0 (copy), v7 (ref)
    l_SplashScreenManager_0.initialize(36, 7, 36);
    l_IntervalPerformanceTracker_0:startTracking("appLaunchToTargetFPS");
    l_SplashScreenManager_0.addStatusChangeListener(function(v9) --[[ Line: 31 ]]
        -- upvalues: l_IntervalPerformanceTracker_0 (ref)
        if v9 then
            l_IntervalPerformanceTracker_0:stopAndLogTracking("appLaunchToTargetFPS");
        end;
    end);
    local v10 = v4.new();
    l_VRService_0.QuestDisplayRefreshRate = 72;
    v10:onLeft(function() --[[ Line: 47 ]]
        -- upvalues: l_VRService_0 (ref)
        l_VRService_0.QuestDisplayRefreshRate = 72;
    end);
    if not v7 then
        v7 = l_VRService_0:GetPropertyChangedSignal("VRSessionState"):Connect(function() --[[ Line: 18 ]]
            -- upvalues: l_VRService_0 (ref)
            l_VRService_0.QuestDisplayRefreshRate = 72;
        end);
    end;
end;