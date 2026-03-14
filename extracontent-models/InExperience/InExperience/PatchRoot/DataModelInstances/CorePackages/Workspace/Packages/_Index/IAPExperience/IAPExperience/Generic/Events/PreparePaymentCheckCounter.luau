local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    eventName = "PreparePaymentCheckCounter", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        2024, 
        9, 
        27
    }, 
    throttlingPercentage = 100, 
    description = "Counter on all preparePayment check", 
    links = ""
};