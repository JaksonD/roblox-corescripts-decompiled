local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_AbuseReportBeduiContextStatus_0 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus;
return v2.createContext({
    status = l_AbuseReportBeduiContextStatus_0.Loading, 
    beduiData = nil, 
    error = nil
});