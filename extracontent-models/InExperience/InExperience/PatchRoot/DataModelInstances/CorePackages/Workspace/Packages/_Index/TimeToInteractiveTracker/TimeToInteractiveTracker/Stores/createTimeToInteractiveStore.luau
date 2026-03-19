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
local _ = require(script.Parent.types);
return function() --[[ Line: 27 ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), v5 (copy), v6 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    local v14, v15 = l_createSignal_0({});
    return {
        getEvents = v14, 
        setEvents = v15, 
        updateMetadata = v4(v15), 
        trackStart = v5(v15), 
        trackEnd = v6(v15), 
        trackMilestone = if l_FFlagAXTTIEnableMilestones_0 then v7(v14, v15) else nil, 
        trackSubphase = if l_FFlagAXTTIEnableMilestones_0 then v8(v14, v15) else nil, 
        trackRequest = if l_FFlagAXTTIEnableMilestones_0 then v9(v14, v15) else nil, 
        resetEvent = v10(v15), 
        destroyEvent = v11(v15), 
        Milestone = v12
    };
end;