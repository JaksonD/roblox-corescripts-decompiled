local l_Parent_0 = script:FindFirstAncestor("GameDetailTelemetry").Parent;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Milestone_0 = l_TimeToInteractiveTracker_0.Milestone;
local v3 = require(script.Parent.EDPTTIConstants);
local v4 = game:DefineFastFlag("EnableEDPTTIManagerColdWarmDetection", false);
local l_EDP_TTI_EVENT_NAME_0 = v3.EDP_TTI_EVENT_NAME;
local v6 = false;
local v7 = false;
return {
    startTracking = function(v8) --[[ Line: 18 ]] --[[ Name: startTracking ]]
        -- upvalues: v6 (ref), v7 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), v4 (copy)
        v6 = false;
        v7 = false;
        local v9 = l_TimeToInteractiveTracker_0.getEvents(false)[l_EDP_TTI_EVENT_NAME_0];
        if not v9 or not v9.startTime then
            l_TimeToInteractiveTracker_0.trackStart(l_EDP_TTI_EVENT_NAME_0, v4 and true or nil);
            l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, {
                entryPath = v8
            });
        end;
    end, 
    setImplementation = function(v10) --[[ Line: 35 ]] --[[ Name: setImplementation ]]
        -- upvalues: l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy)
        l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, {
            implementation = v10
        });
    end, 
    trackFunctionallyReady = function() --[[ Line: 41 ]] --[[ Name: trackFunctionallyReady ]]
        -- upvalues: v6 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), l_Milestone_0 (copy)
        if v6 then
            return;
        else
            v6 = true;
            if l_TimeToInteractiveTracker_0.trackMilestone then
                l_TimeToInteractiveTracker_0.trackMilestone(l_EDP_TTI_EVENT_NAME_0, l_Milestone_0.FunctionallyReady);
            end;
            return;
        end;
    end, 
    trackSurfaceReady = function(v11) --[[ Line: 52 ]] --[[ Name: trackSurfaceReady ]]
        -- upvalues: v7 (ref), l_TimeToInteractiveTracker_0 (copy), l_EDP_TTI_EVENT_NAME_0 (copy), l_Milestone_0 (copy)
        if v7 then
            return;
        else
            v7 = true;
            if v11 then
                l_TimeToInteractiveTracker_0.updateMetadata(l_EDP_TTI_EVENT_NAME_0, v11);
            end;
            if l_TimeToInteractiveTracker_0.trackMilestone then
                l_TimeToInteractiveTracker_0.trackMilestone(l_EDP_TTI_EVENT_NAME_0, l_Milestone_0.SurfaceReady);
            end;
            l_TimeToInteractiveTracker_0.trackEnd(l_EDP_TTI_EVENT_NAME_0);
            return;
        end;
    end
};