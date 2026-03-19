local v0 = require(script.CoreScriptsProfiler);
local v1 = require(script.CoreScriptsProfilerTelemetry);
local v2 = require(script.ProfilerDataParser);
return {
    CoreScriptsProfiler = v0, 
    CoreScriptsProfilerTelemetry = v1, 
    ProfilerDataParser = v2, 
    ["jest.config"] = script["jest.config"]
};