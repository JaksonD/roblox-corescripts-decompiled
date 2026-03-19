local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local _ = require(script.Parent.ImpressionsVisualizer);
local v5 = require(script.Parent.ImpressionsTrackerWithoutNavigation);
return function(v6) --[[ Line: 27 ]]
    -- upvalues: l_useRouteName_0 (copy), v1 (copy), v2 (copy), v5 (copy)
    local v7 = l_useRouteName_0();
    local v8 = v1.Dictionary.join(v6, {
        routeName = v7
    });
    return v2.createElement(v5, v8);
end;