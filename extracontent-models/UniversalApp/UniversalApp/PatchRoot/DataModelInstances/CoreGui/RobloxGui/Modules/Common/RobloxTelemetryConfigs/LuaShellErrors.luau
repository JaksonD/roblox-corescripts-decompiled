local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
return {
    eventName = settings():GetFVariable("LuaErrorsInfluxSeries"), 
    backends = {
        v1.TelemetryBackends.Points
    }, 
    throttlingPercentage = tonumber(settings():GetFVariable("LuaErrorsInfluxThrottling")), 
    lastUpdated = {
        22, 
        7, 
        29
    }, 
    description = "Report Lua errors to Points with document name \"luashellerrors\"", 
    links = "https://grafana.simulprod.com/d/grdIrDiVz/lua-apps-error-metrics?orgId=1"
};