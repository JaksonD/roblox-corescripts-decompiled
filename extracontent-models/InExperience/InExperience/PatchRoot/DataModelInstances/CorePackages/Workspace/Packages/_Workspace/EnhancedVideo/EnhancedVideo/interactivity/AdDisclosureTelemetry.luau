local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v2 = {
    eventName = "AdDisclosureMenuToggledCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        13
    }, 
    description = "\t\tCounts the number of times the ad disclosure menu is toggled. \n\t\tCustom field \"isOpened\" indicates whether the menu was opened (true) or closed (false).\n\t"
};
local v3 = {
    eventName = "AdDisclosureWhyThisAdToggledCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        13
    }, 
    description = "\t\tCounts the number of times the \"Why This Ad\" modal is toggled. \n\t\tCustom field \"isOpened\" indicates whether the modal was opened (true) or closed (false).\n\t"
};
local v4 = {
    eventName = "AdPreferencesLinkClickedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        13
    }, 
    description = "\t\tCounts the number of times the ad preferences link is clicked.\n\t"
};
return {
    logAdDisclosureMenuToggled = function(v5) --[[ Line: 42 ]] --[[ Name: logAdDisclosureMenuToggled ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v2, {
            standardizedFields = v1, 
            customFields = {
                isOpened = v5
            }
        }, 1);
    end, 
    logAdDisclosureWhyThisAdToggled = function(v6) --[[ Line: 50 ]] --[[ Name: logAdDisclosureWhyThisAdToggled ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v3, {
            standardizedFields = v1, 
            customFields = {
                isOpened = v6
            }
        }, 1);
    end, 
    logAdPreferencesLinkClicked = function() --[[ Line: 58 ]] --[[ Name: logAdPreferencesLinkClicked ]]
        -- upvalues: l_TelemetryService_0 (copy), v4 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v4, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end
};