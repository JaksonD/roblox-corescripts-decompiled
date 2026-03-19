local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v3 = require(script.Parent.Parent.RoactChatAnalytics);
local v4 = require(script.Parent.Parent.AnalyticsContext);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_Analytics_0 (copy), v1 (copy), v4 (copy), v3 (copy)
    local v6 = l_Analytics_0.mock();
    local v7 = tostring(math.random(999999999));
    return v1.createElement(v4.Provider, {
        value = v3.new(v6, v7)
    }, v1.oneChild(v5[v1.Children]));
end;