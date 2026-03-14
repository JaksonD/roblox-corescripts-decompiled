local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Timers);
local _ = require(script.Parent.SimpleTimer);
return function(v4) --[[ Line: 9 ]] --[[ Name: useLoadingTimers ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useRef(v2(v4)).current;
end;