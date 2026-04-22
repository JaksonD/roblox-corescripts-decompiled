local l_Parent_0 = script:FindFirstAncestor("SocialCarousel").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("SocialCarouselAnalyticsThrottlingThousandths", 10000), 
        links = ""
    }, 
    [v2.UserPressed] = {
        description = "User pressed on a user tile", 
        lastUpdated = {
            25, 
            4, 
            14
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.UserSeen] = {
        description = "User has seen an user tile", 
        lastUpdated = {
            25, 
            4, 
            14
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ViewAddFriends] = {
        description = "User pressed on the add friends tile", 
        lastUpdated = {
            25, 
            4, 
            21
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ViewAllFriends] = {
        description = "User pressed on the carousel header", 
        lastUpdated = {
            25, 
            4, 
            21
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.StartSquadPressed] = {
        description = "User pressed on the start squad tile", 
        lastUpdated = {
            25, 
            11, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareQRPressed] = if l_FFlagSocialCarouselShareQREnabled_0 then {
        description = "User pressed on the share QR tile", 
        lastUpdated = {
            26, 
            4, 
            14
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil
};