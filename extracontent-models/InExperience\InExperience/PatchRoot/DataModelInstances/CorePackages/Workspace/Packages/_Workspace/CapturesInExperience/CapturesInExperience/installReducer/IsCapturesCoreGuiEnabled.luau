local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Actions.CapturesCoreGuiDisabled);
local v4 = require(l_Parent_0.Actions.CapturesCoreGuiEnabled);
return v2.createReducer(true, {
    [v3.name] = function(_, _) --[[ Line: 14 ]]
        return false;
    end, 
    [v4.name] = function(_, _) --[[ Line: 18 ]]
        return true;
    end
});