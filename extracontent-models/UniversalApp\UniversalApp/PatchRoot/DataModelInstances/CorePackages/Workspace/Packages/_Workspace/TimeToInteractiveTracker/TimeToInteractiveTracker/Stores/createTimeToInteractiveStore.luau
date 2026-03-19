local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local v4 = require(script.Parent.Actions.updateTTIEventMetadata);
local v5 = require(script.Parent.Actions.trackTTIEventStart);
local v6 = require(script.Parent.Actions.trackTTIEventEnd);
local v7 = require(script.Parent.Actions.trackMilestone);
local v8 = require(script.Parent.Actions.trackSubphase);
local v9 = require(script.Parent.Actions.trackRequest);
local v10 = require(script.Parent.Actions.resetTTIEvent);
local v11 = require(script.Parent.Actions.destroyTTIEvent);
local v12 = require(l_script_FirstAncestor_0.Milestones.constants);
local v13 = require(l_script_FirstAncestor_0.Hooks.useTTIRenderAndMountedTracking);
local _ = require(script.Parent.types);
return function() --[[ Line: 28 ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), v5 (copy), v6 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
    local v15, v16 = l_createSignal_0({});
    return {
        getEvents = v15, 
        setEvents = v16, 
        updateMetadata = v4(v16), 
        trackStart = v5(v16), 
        trackEnd = v6(v16), 
        trackMilestone = if l_FFlagAXTTIEnableMilestones_0 then v7(v15, v16) else nil, 
        trackSubphase = if l_FFlagAXTTIEnableMilestones_0 then v8(v15, v16) else nil, 
        trackRequest = if l_FFlagAXTTIEnableMilestones_0 then v9(v15, v16) else nil, 
        resetEvent = v10(v16), 
        destroyEvent = v11(v16), 
        Milestone = v12, 
        Hooks = if l_FFlagAXTTIEnableMilestones_0 then {
            useTTIRenderAndMountedTracking = v13(v7(v15, v16))
        } else nil
    };
end;