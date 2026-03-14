local l_Parent_0 = script:FindFirstAncestor("CrossExperienceVoice").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("PartyVoiceTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.PartyVoiceStateChanged] = {
        lastUpdated = {
            24, 
            12, 
            8
        }, 
        description = "Event when a user transitions state during a party voice session", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v3) --[[ Line: 21 ]] --[[ Name: status ]]
                        return v3;
                    end, 
                    previousStatus = function(v4) --[[ Line: 24 ]] --[[ Name: previousStatus ]]
                        return v4;
                    end, 
                    detail = function(v5) --[[ Line: 27 ]] --[[ Name: detail ]]
                        return v5;
                    end, 
                    activeDm = function(v6) --[[ Line: 30 ]] --[[ Name: activeDm ]]
                        return v6;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceConnectedParticipantsOnJoin] = {
        lastUpdated = {
            24, 
            11, 
            30
        }, 
        description = "Event when a user successfully connects to a party voice channel", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    numberActive = function(v7) --[[ Line: 44 ]] --[[ Name: numberActive ]]
                        return v7;
                    end, 
                    activeDm = function(v8) --[[ Line: 47 ]] --[[ Name: activeDm ]]
                        return v8;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceJoinFailure] = {
        lastUpdated = {
            25, 
            3, 
            12
        }, 
        description = "Event when a user attempts to connect to party voice and results in failure", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    errorMessage = function(v9) --[[ Line: 61 ]] --[[ Name: errorMessage ]]
                        return v9;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceJoinAttempt] = {
        lastUpdated = {
            24, 
            12, 
            8
        }, 
        description = "Event when a user attempts to connect to party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    activeDm = function(v10) --[[ Line: 75 ]] --[[ Name: activeDm ]]
                        return v10;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceUnmuteParticipant] = {
        lastUpdated = {
            25, 
            3, 
            30
        }, 
        description = "Event when a user unmutes a participant in party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PartyVoiceMuteParticipant] = {
        lastUpdated = {
            25, 
            3, 
            30
        }, 
        description = "Event when a user mutes a participant in party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PartyVoiceBlockParticipant] = {
        lastUpdated = {
            25, 
            3, 
            30
        }, 
        description = "Event when a user blocks a participant in party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PartyVoiceUnblockParticipant] = {
        lastUpdated = {
            25, 
            3, 
            30
        }, 
        description = "Event when a user unblocks a participant in party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};