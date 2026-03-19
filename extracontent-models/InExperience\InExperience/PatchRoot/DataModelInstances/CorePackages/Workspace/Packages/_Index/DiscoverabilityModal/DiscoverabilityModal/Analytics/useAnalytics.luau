local l_Parent_0 = script.Parent.Parent;
local l_React_0 = require(l_Parent_0.dependencies).React;
local v2 = require(script.Parent.DiscoverabilityModalAnalyticsContext);
return function() --[[ Line: 6 ]]
    -- upvalues: l_React_0 (copy), v2 (copy)
    return l_React_0.useContext(v2);
end;