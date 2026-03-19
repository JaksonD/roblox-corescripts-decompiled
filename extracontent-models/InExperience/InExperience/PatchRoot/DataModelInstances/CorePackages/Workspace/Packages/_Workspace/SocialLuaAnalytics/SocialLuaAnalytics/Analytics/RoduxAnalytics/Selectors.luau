local _ = require(script.Parent.AnalyticsTypes);
local v1 = require(script.getSessionIdByKey);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        getSessionIdByKey = v1(v2)
    };
end;