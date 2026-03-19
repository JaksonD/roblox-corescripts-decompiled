local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_default_0 = v1.default;
local v3 = {
    eventName = "CsatSurveyGetLastSurvBloxCallTimestampError", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        25, 
        7, 
        21
    }, 
    description = "\t\tError tracking for SurvBlox call timestamp retrieval.\n\t"
};
return {
    logGetLastSurvBloxCallTimestampError = function() --[[ Line: 20 ]] --[[ Name: logGetLastSurvBloxCallTimestampError ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:logRobloxTelemetryCounter(v3, 1);
    end
};