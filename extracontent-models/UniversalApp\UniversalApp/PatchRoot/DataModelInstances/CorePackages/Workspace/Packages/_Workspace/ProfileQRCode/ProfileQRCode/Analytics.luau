local v0 = require(script.ProfileQRCodeAnalytics);
local v1 = require(script.setupFireEvent);
local v2 = require(script.useAnalytics);
return {
    Context = v0, 
    EventNames = require(script.EventNames), 
    setupFireEvent = v1, 
    useAnalytics = v2
};