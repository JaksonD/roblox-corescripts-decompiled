local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent;
local _ = require(l_Parent_1.AnalyticsTypes);
local v3 = require(l_Parent_0.Utils.getDeepValue);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy)
    local l_keyPath_0 = v4.keyPath;
    return function(v6) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), l_keyPath_0 (copy)
        return function(v7) --[[ Line: 10 ]]
            -- upvalues: v3 (ref), v6 (copy), l_keyPath_0 (ref)
            return v3(v6, string.format("%s.bySessionKey.%s", l_keyPath_0, v7));
        end;
    end;
end;