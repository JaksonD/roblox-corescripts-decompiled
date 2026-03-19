local l_Parent_0 = script:FindFirstAncestor("NetworkingSquads").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_Url_0 (copy)
    return (v4.roduxNetworking.POST({
        Name = "SendSquadVoiceAbuseReport"
    }, function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v1 (ref), l_Url_0 (ref)
        assert(v6.voiceChannelId, "Missing voiceChannelId");
        local v8 = v1.List.map(v6.voiceUserIds, function(v7) --[[ Line: 17 ]]
            return {
                data = tostring(v7)
            };
        end);
        local v9 = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "party"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v6.submitterUserId
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v6.abuserUserId
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v6.abuseReason
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v6.abuseComment
                    }
                }
            }, 
            IS_PLACE_VOICE_ENABLED = {
                valueList = {
                    {
                        data = "true"
                    }
                }
            }, 
            VOICE_USER_IDS_FROM_CLIENT = {
                valueList = v8
            }, 
            IN_EXP_MENU_OPENED_UNIX_MILLI = {
                valueList = {
                    {
                        data = tostring((math.floor(v6.reportBeginTimestampMs)))
                    }
                }
            }, 
            VOICE_CHANNEL_ID = {
                valueList = {
                    {
                        data = v6.voiceChannelId
                    }
                }
            }, 
            VOICE_USER_COUNT = {
                valueList = {
                    {
                        data = tostring(v6.voiceUserCount)
                    }
                }
            }, 
            VOICE_IMPACTED_USER_COUNT = {
                valueList = {
                    {
                        data = "0"
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "voice"
                    }
                }
            }
        };
        return v5(l_Url_0.APIS_URL):path("abuse-reporting"):path("v2"):path("abuse-report"):body({
            tags = v9
        });
    end));
end;