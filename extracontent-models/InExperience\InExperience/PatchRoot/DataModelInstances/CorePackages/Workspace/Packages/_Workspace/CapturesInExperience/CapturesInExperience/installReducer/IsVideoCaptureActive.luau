local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Actions.VideoCaptureStarted);
local v4 = require(l_Parent_0.Actions.VideoCaptureStopped);
local _ = require(l_Parent_0.Enums.CaptureTriggerType);
local v6 = {
    status = false, 
    triggerType = nil
};
return v2.createReducer(v6, {
    [v3.name] = function(_, v8) --[[ Line: 22 ]]
        return {
            status = true, 
            triggerType = v8.triggerType
        };
    end, 
    [v4.name] = function(_, v10) --[[ Line: 29 ]]
        return {
            status = false, 
            triggerType = v10.triggerType
        };
    end
});