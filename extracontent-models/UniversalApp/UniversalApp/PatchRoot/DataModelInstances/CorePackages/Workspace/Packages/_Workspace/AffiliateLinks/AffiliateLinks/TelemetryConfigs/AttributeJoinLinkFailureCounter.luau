local l_script_FirstAncestor_0 = script:FindFirstAncestor("AffiliateLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFIntAttributeJoinLinkFailureCounterThrottle_0 = require(l_script_FirstAncestor_0.Flags).GetFIntAttributeJoinLinkFailureCounterThrottle;
local v3 = require(l_Parent_0.LoggingProtocol);
return {
    eventName = "attributeJoinLinkFailure", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = l_GetFIntAttributeJoinLinkFailureCounterThrottle_0(), 
    lastUpdated = {
        24, 
        10, 
        21
    }, 
    description = "Counter to track failed Attribute ID generation on Lua Apps."
};