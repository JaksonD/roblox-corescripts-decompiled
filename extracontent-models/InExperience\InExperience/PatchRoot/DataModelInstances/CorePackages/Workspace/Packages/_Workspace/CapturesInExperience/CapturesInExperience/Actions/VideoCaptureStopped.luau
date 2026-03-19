local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Enums.CaptureTriggerType);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 12 ]]
    return {
        triggerType = v4
    };
end);