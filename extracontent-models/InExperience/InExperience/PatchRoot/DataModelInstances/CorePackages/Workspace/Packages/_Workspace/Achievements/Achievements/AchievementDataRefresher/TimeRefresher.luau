local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_clearInterval_0 = v2.clearInterval;
local l_setInterval_0 = v2.setInterval;
local v5 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_Parent_0.Signal);
return {
    init = function(v7, v8, v9) --[[ Line: 25 ]] --[[ Name: init ]]
        v7.fireDataChanged = v8;
        v7.intervalInSec = v9;
    end, 
    start = function(v10) --[[ Line: 30 ]] --[[ Name: start ]]
        -- upvalues: l_setInterval_0 (copy)
        v10.timerId = l_setInterval_0(v10.check, v10.intervalInSec * 1000, v10);
        v10.startTime = os.time();
    end, 
    check = function(v11) --[[ Line: 35 ]] --[[ Name: check ]]
        -- upvalues: v5 (copy)
        if v11.startTime then
            local v12 = os.time() - v11.startTime;
            v11.fireDataChanged(v12);
            return;
        else
            v5:error("No recorded start time");
            return;
        end;
    end, 
    stop = function(v13) --[[ Line: 44 ]] --[[ Name: stop ]]
        -- upvalues: l_clearInterval_0 (copy)
        if v13.timerId then
            l_clearInterval_0(v13.timerId);
            v13.startTime = nil;
        end;
    end
};