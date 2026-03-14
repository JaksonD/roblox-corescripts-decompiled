local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
return require(l_Parent_0.React).createContext({
    fireAnalyticsEvent = v1.noop, 
    isZooming = false, 
    navigateBack = v1.noop, 
    navigateToItemDetailPage = v1.noop, 
    navigateToReportPage = v1.noop, 
    setIsZooming = v1.noop
});