local l_Parent_0 = script:FindFirstAncestor("FriendRequestNicknames").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("FriendRequestNicknamesTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.SetNicknameModalOpened] = {
        lastUpdated = {
            24, 
            8, 
            7
        }, 
        description = "Friend Request Nicknames modal opened", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.SetNicknameSkipClicked] = {
        lastUpdated = {
            24, 
            8, 
            7
        }, 
        description = "Friend Request Nicknames modal clicked skip", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.SetNicknameAddNameClicked] = {
        lastUpdated = {
            24, 
            8, 
            7
        }, 
        description = "Friend Request Nicknames modal clicked add name", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};