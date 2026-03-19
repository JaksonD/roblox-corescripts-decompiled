local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
return require(l_Parent_0.React).createContext({
    fireAnalyticsEvent = v1.noop, 
    chromeEnabled = nil
});