local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEventInfo);
local v2 = require(l_script_FirstAncestor_0.Telemetry.AppChatTTITracker);
local v3 = require(l_script_FirstAncestor_0.Telemetry.AppChatIntervalTracker);
return {
    Events = v1.Events, 
    setSharedContext = function(v4) --[[ Line: 26 ]] --[[ Name: setSharedContext ]]
        -- upvalues: v2 (copy)
        v2.setSharedContext(v4);
    end, 
    isActive = function(v5, v6) --[[ Line: 30 ]] --[[ Name: isActive ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy)
        local v7 = v6 or {};
        if v1.isTTIEvent(v5) then
            return v2.isActive(v5, v7);
        else
            return v3.isActive(v5);
        end;
    end, 
    start = function(v8, v9) --[[ Line: 40 ]] --[[ Name: start ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy)
        local v10 = v9 or {};
        if v1.isTTIEvent(v8) then
            return v2.start(v8, v10);
        else
            return v3.start(v8, v10);
        end;
    end, 
    finish = function(v11, v12) --[[ Line: 48 ]] --[[ Name: finish ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy)
        local v13 = v12 or {};
        if v1.isTTIEvent(v11) then
            return v2.finish(v11, v13);
        else
            return v3.finish(v11);
        end;
    end, 
    cancel = function(v14, v15) --[[ Line: 56 ]] --[[ Name: cancel ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy)
        local v16 = v15 or {};
        if v1.isTTIEvent(v14) then
            return v2.cancel(v14, v16);
        else
            return v3.cancel(v14);
        end;
    end
};