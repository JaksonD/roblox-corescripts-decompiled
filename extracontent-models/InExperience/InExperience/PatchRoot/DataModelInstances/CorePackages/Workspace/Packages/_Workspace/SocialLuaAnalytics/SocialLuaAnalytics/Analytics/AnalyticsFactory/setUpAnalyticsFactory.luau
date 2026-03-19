local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.AnalyticsFactory);
local _ = require(script.Parent.Parent.Types);
return function(v4) --[[ Line: 29 ]] --[[ Name: setUpAnalyticsFactory ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), v4 (copy), v2 (ref)
        local v6 = v1.Dictionary.join(v4.staticInfoForAllEvents or {}, v5 and v5.infoForAllEvents or {});
        return v2(v1.Dictionary.join(v4, {
            infoForAllEvents = v6
        }));
    end;
end;