local l_Parent_0 = script:FindFirstAncestor("GameDetailTelemetry").Parent;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Milestone_0 = l_TimeToInteractiveTracker_0.Milestone;
local l_EDP_TTI_EVENT_NAME_0 = require(script.Parent.EDPTTIConstants).EDP_TTI_EVENT_NAME;
local v4 = false;
local v5 = false;
return {
    startTracking = function(v6) --[[ Line: 16 ]] --[[ Name: startTracking ]]
        -- upvalues: v4 (ref), v5 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy)
        v4 = false;
        v5 = false;
        local v7 = l_TimeToInteractiveTracker_0.getEvents(false)[l_EDP_TTI_EVENT_NAME_0];
        if not v7 or not v7.startTime then
            l_TimeToInteractiveTracker_0.trackStart(l_EDP_TTI_EVENT_NAME_0);
            l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, {
                entryPath = v6
            });
        end;
    end, 
    setImplementation = function(v8) --[[ Line: 30 ]] --[[ Name: setImplementation ]]
        -- upvalues: l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy)
        l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, {
            implementation = v8
        });
    end, 
    trackFunctionallyReady = function() --[[ Line: 36 ]] --[[ Name: trackFunctionallyReady ]]
        -- upvalues: v4 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), l_Milestone_0 (copy)
        if v4 then
            return;
        else
            v4 = true;
            if l_TimeToInteractiveTracker_0.trackMilestone then
                l_TimeToInteractiveTracker_0.trackMilestone(l_EDP_TTI_EVENT_NAME_0, l_Milestone_0.FunctionallyReady);
            end;
            return;
        end;
    end, 
    trackSurfaceReady = function(v9) --[[ Line: 47 ]] --[[ Name: trackSurfaceReady ]]
        -- upvalues: v5 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), l_Milestone_0 (copy)
        if v5 then
            return;
        else
            v5 = true;
            if v9 then
                l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, v9);
            end;
            if l_TimeToInteractiveTracker_0.trackMilestone then
                l_TimeToInteractiveTracker_0.trackMilestone(l_EDP_TTI_EVENT_NAME_0, l_Milestone_0.SurfaceReady);
            end;
            l_TimeToInteractiveTracker_0.trackEnd(l_EDP_TTI_EVENT_NAME_0);
            return;
        end;
    end
};