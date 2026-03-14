local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).DiagEventTypes;
local v2 = require(script.Parent.getPlatformSuffix);
local _ = require(script.Parent.Parent.Types);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_DiagEventTypes_0 (copy)
    return function(v5) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), l_DiagEventTypes_0 (ref), v4 (copy)
        local v6 = ("%*%*"):format(v5.name, (v2(v5.platformSpecificity)));
        if v5.type == l_DiagEventTypes_0.Stats then
            v4:reportStats(v6, v5.value);
            return v5;
        else
            v4:reportCounter(v6, v5.value);
            return v5;
        end;
    end;
end;