local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(script.Parent.Parent.AnalyticsTypes);
return v1.Rodux.makeActionCreator(script.Name, function(v3) --[[ Line: 7 ]]
    return {
        payload = v3
    };
end);