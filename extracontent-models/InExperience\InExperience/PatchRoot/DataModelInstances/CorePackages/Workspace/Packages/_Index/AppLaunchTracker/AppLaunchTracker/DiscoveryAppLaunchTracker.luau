local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppLaunchTracker");
local v1 = require(l_script_FirstAncestor_0.RoduxPerfTracker);
local v2 = require(l_script_FirstAncestor_0.DiscoveryAppLaunchEvents);
local _ = require(l_script_FirstAncestor_0.AppLaunchTrackerTypes);
local v4 = require(l_script_FirstAncestor_0.Flags).FIntAppLaunchTrackerEnableHundredthsPercent >= math.random(10000);
local v5 = game:DefineFastFlag("LuaAppShouldTrackTopThunks", false);
local v6 = game:DefineFastInt("LuaAppLaunchTrackerTimeoutSec", 60);
local v7 = game:DefineFastString("LuaAppLaunchTrackerMilestones", "lua_app_starter_script_requires_begin,lua_app_starter_script_requires_end,startup_page_did_mount,fetch_homepage_data_begin,home_page_container_init,fetch_homepage_data_end,home_page_interactive_legacy,home_page_interactive");
local v8 = {};
v8.__index = v8;
v8.isEnabled = function() --[[ Line: 45 ]] --[[ Name: isEnabled ]]
    -- upvalues: v4 (ref)
    return v4;
end;
v8.disable = function() --[[ Line: 49 ]] --[[ Name: disable ]]
    -- upvalues: v4 (ref)
    v4 = false;
end;
v8.new = function(v9) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v2 (copy), v1 (copy), v5 (copy), v8 (copy), v6 (copy), v4 (ref)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
        -- upvalues: v7 (ref)
        local v10 = {};
        for v11 in (v7:gmatch("([A-Za-z0-9_]+)")) do
            v10[v11] = true;
        end;
        return v10;
    end);
    if not l_status_0 then
        v2.reportError(v9, "Failed to parse FStringLuaAppLaunchTrackerMilestones");
    end;
    local v14 = setmetatable({
        roduxTracker = v1.new(true, v5, true), 
        numTileRenders = 0, 
        numTilesInit = 0, 
        numFeedRenders = 0, 
        numFeedItems = 0, 
        totalSduiDuration = 0, 
        previousMilestone = "", 
        previousMilestoneTime = 0, 
        loggingProtocol = v9, 
        supportedMilestones = if l_status_0 then l_result_0 else {}
    }, v8);
    if v6 > 0 then
        task.delay(v6, function() --[[ Line: 82 ]]
            -- upvalues: v4 (ref), v2 (ref), v9 (copy), v14 (copy), v8 (ref)
            if v4 then
                v2.reportError(v9, (("Timeout after previousMilestone: %*"):format(v14.previousMilestone)));
                v14.roduxTracker:stopTracking();
                v8.disable();
            end;
        end);
    end;
    return v14;
end;
v8.trackTileRender = function(v15) --[[ Line: 97 ]] --[[ Name: trackTileRender ]]
    v15.numTileRenders = v15.numTileRenders + 1;
end;
v8.trackTileInit = function(v16) --[[ Line: 100 ]] --[[ Name: trackTileInit ]]
    v16.numTilesInit = v16.numTilesInit + 1;
end;
v8.trackFeedRender = function(v17) --[[ Line: 103 ]] --[[ Name: trackFeedRender ]]
    v17.numFeedRenders = v17.numFeedRenders + 1;
end;
v8.trackNumFeedItems = function(v18, v19) --[[ Line: 106 ]] --[[ Name: trackNumFeedItems ]]
    v18.numFeedItems = v19;
end;
v8.trackSduiDuration = function(v20, v21) --[[ Line: 110 ]] --[[ Name: trackSduiDuration ]]
    v20.totalSduiDuration = v20.totalSduiDuration + v21;
end;
v8.onMilestoneChanged = function(v22, v23) --[[ Line: 114 ]] --[[ Name: onMilestoneChanged ]]
    -- upvalues: v4 (ref), v2 (copy)
    if not v4 then
        return;
    elseif not v22.supportedMilestones[v23] then
        return;
    else
        local v24 = os.clock();
        if v22.previousMilestoneTime > 0 then
            local v25 = (v24 - v22.previousMilestoneTime) * 1000;
            local v26 = v22.roduxTracker:getStats();
            v2.reportStatsforMilestone(v22.loggingProtocol, v23, v22.previousMilestone, v25, v26, v22.numTilesInit, v22.numTileRenders, v22.numFeedItems, v22.numFeedRenders, v22.totalSduiDuration);
        end;
        v22.roduxTracker:clear();
        v22.numFeedRenders = 0;
        v22.numTilesInit = 0;
        v22.numTileRenders = 0;
        v22.totalSduiDuration = 0;
        v22.previousMilestone = v23;
        v22.previousMilestoneTime = v24;
        return;
    end;
end;
v8.stopTracking = function(v27) --[[ Line: 152 ]] --[[ Name: stopTracking ]]
    -- upvalues: v8 (copy)
    v27.roduxTracker:stopTracking();
    v8.disable();
end;
v8.createDefault = function(...) --[[ Line: 157 ]] --[[ Name: createDefault ]]
    -- upvalues: v8 (copy)
    v8.default = v8.new(...);
end;
return v8;