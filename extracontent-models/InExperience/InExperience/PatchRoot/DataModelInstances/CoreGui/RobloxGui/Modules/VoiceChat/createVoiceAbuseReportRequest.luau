local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(script.Parent.VoiceChatServiceManager);
local l_getSortedPlayers_0 = require(script.Parent.VoiceUsersByProximity).getSortedPlayers;
return function(v5, v6, v7) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_getSortedPlayers_0 (copy), l_HttpService_0 (copy)
    local l_v5_PlayerByUserId_0 = v5:GetPlayerByUserId(v7.abuserUserId);
    local v9 = nil;
    if l_v5_PlayerByUserId_0 and l_v5_PlayerByUserId_0.Character and l_v5_PlayerByUserId_0.Character.PrimaryPart then
        v9 = l_v5_PlayerByUserId_0.Character.PrimaryPart.Position;
    end;
    local v10 = #v2.Dictionary.values(v6.participants);
    local v11 = 0;
    if v9 then
        v11 = #l_getSortedPlayers_0(v5, v6, v9, 160, nil, l_v5_PlayerByUserId_0);
    end;
    local v13 = v2.List.map(v7.sortedPlayerListUserIds, function(v12) --[[ Line: 47 ]]
        return {
            data = tostring(v12)
        };
    end);
    local v14 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v7.localUserId)
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v7.abuserUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v7.abuseReason
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v7.abuseComment
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
                valueList = v13
            }, 
            IN_EXP_MENU_OPENED_UNIX_MILLI = {
                valueList = {
                    {
                        data = tostring(v7.inExpMenuOpenedUnixMilli)
                    }
                }
            }, 
            VOICE_CHANNEL_ID = {
                valueList = {
                    {
                        data = tostring(if game:GetEngineFeature("VoiceChatServiceExposesChannelId") then v6.service:GetChannelId() else v6.service:GetGroupId())
                    }
                }
            }, 
            VOICE_USER_COUNT = {
                valueList = {
                    {
                        data = tostring(v10)
                    }
                }
            }, 
            VOICE_IMPACTED_USER_COUNT = {
                valueList = {
                    {
                        data = tostring(v11)
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v7.abuseVector
                    }
                }
            }
        }
    };
    return l_HttpService_0:JSONEncode(v14);
end;