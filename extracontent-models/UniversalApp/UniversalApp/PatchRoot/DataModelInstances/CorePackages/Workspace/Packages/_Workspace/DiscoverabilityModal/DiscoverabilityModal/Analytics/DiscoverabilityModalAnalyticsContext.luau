local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
return l_Roact_0.createContext({
    fireAnalyticsEvent = l_Dash_0.noop
});