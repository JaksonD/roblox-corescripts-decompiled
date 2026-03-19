local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = {
    EventTypes = {
        CtaClicked = "REMINDER_INTERACTION_CTA_CLICKED", 
        Dimissed = "REMINDER_INTERACTION_REMINDER_DISMISSED"
    }, 
    EventContext = "HomePageRemindersEvent", 
    EventName = "HomePageRemindersEvent", 
    Platform = "PLATFORM_UNIVERSAL_APP"
};
return {
    sendEvent = function(v3, v4) --[[ Line: 15 ]]
        -- upvalues: v2 (copy), v1 (copy)
        v3:sendEventDeferred(v2.EventContext, v2.EventName, v1.Dictionary.join({
            platform = v2.Platform
        }, v4));
    end, 
    Constants = v2
};