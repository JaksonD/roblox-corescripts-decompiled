local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
return l_Roact_0.createContext({
    fireAnalyticsEvent = l_Dash_0.noop
});