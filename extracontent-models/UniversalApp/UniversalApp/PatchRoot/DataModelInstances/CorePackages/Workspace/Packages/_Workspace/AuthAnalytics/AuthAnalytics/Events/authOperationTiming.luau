local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthAnalytics");
local v1 = require(l_script_FirstAncestor_0.Utils.checkAndSendEvent);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v5 = {
        elapsedTime = v3, 
        state = v4
    };
    v1(v2, "authOperationTiming", v5);
end;