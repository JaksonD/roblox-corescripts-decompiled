local v0 = require(script.Parent.ReactFiberLane);
local l_NoLanes_0 = v0.NoLanes;
local l_mergeLanes_0 = v0.mergeLanes;
return {
    workInProgressRootSkippedLanes = function(v3) --[[ Line: 24 ]]
        -- upvalues: l_NoLanes_0 (ref)
        if v3 == nil then
            return l_NoLanes_0;
        else
            l_NoLanes_0 = v3;
            return l_NoLanes_0;
        end;
    end, 
    markSkippedUpdateLanes = function(v4) --[[ Line: 34 ]]
        -- upvalues: l_NoLanes_0 (ref), l_mergeLanes_0 (copy)
        l_NoLanes_0 = l_mergeLanes_0(v4, l_NoLanes_0);
    end
};