local v0 = require(script.DiscoveryAppLaunchTracker);
return {
    ["jest.config"] = script["jest.config"], 
    DiscoveryAppLaunchTracker = v0, 
    Flags = require(script.Flags)
};