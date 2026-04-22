local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_0.Promise);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local function v7(v6) --[[ Line: 40 ]] --[[ Name: tag ]]
    return {
        valueList = {
            {
                data = v6
            }
        }
    };
end;
local function v14(v8, v9) --[[ Line: 44 ]] --[[ Name: buildVoiceReport ]]
    -- upvalues: l_Players_0 (copy), l_HttpService_0 (copy), v7 (copy)
    local v10 = {};
    if v9 then
        for _, v12 in ipairs(v9.sortedPlayerListUserIds) do
            table.insert(v10, {
                data = tostring(v12)
            });
        end;
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    return l_HttpService_0:JSONEncode({
        tags = {
            ENTRY_POINT = v7("in-experience"), 
            SUBMITTER_USER_ID = v7((tostring(l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0))), 
            REPORT_TARGET_USER_ID = v7(v8.data.targetIdStr), 
            REPORTED_ABUSE_CATEGORY = v7(v8.data.category), 
            REPORTER_COMMENT = v7(v8.data.comment or ""), 
            IS_PLACE_VOICE_ENABLED = v7("true"), 
            VOICE_USER_IDS_FROM_CLIENT = {
                valueList = v10
            }, 
            IN_EXP_MENU_OPENED_UNIX_MILLI = v7((tostring(v9 and v9.menuOpenedUnixMilli or 0))), 
            VOICE_CHANNEL_ID = v7(v9 and v9.channelId or ""), 
            VOICE_USER_COUNT = v7((tostring(v9 and v9.voiceUserCount or 0))), 
            VOICE_IMPACTED_USER_COUNT = v7((tostring(v9 and v9.voiceImpactedUserCount or 0))), 
            REPORTED_ABUSE_VECTOR = v7(v8.data.abuseVector)
        }
    });
end;
local function v17(v15) --[[ Line: 73 ]] --[[ Name: buildChatReport ]]
    -- upvalues: l_Players_0 (copy), v7 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return {
        tags = {
            ENTRY_POINT = v7("in-experience"), 
            SUBMITTER_USER_ID = v7((tostring(l_LocalPlayer_1 and l_LocalPlayer_1.UserId or 0))), 
            REPORT_TARGET_USER_ID = v7(v15.data.targetIdStr), 
            REPORTED_ABUSE_CATEGORY = v7(v15.data.category), 
            REPORTER_COMMENT = v7(v15.data.comment or ""), 
            REPORTED_ABUSE_VECTOR = v7(v15.data.abuseVector), 
            VARIANT = v7("IGM_CLRv2")
        }
    };
end;
local function v20(v18) --[[ Line: 88 ]] --[[ Name: buildAvatarReport ]]
    -- upvalues: l_Players_0 (copy), v7 (copy)
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    return {
        tags = {
            ENTRY_POINT = v7("in-experience"), 
            SUBMITTER_USER_ID = v7((tostring(l_LocalPlayer_2 and l_LocalPlayer_2.UserId or 0))), 
            REPORT_TARGET_USER_ID = v7(v18.data.targetIdStr), 
            REPORTED_ABUSE_CATEGORY = v7(v18.data.category), 
            REPORTER_COMMENT = v7(v18.data.comment or ""), 
            REPORTED_ABUSE_VECTOR = v7(v18.data.abuseVector)
        }
    };
end;
local function v23(v21) --[[ Line: 102 ]] --[[ Name: buildPlaceReport ]]
    -- upvalues: l_Players_0 (copy), l_HttpService_0 (copy), v7 (copy)
    local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
    return l_HttpService_0:JSONEncode({
        tags = {
            ENTRY_POINT = v7("in-experience"), 
            SUBMITTER_USER_ID = v7((tostring(l_LocalPlayer_3 and l_LocalPlayer_3.UserId or 0))), 
            PLACE_ID = v7((tostring(game.PlaceId))), 
            REPORTED_ABUSE_CATEGORY = v7(v21.data.category), 
            REPORTER_COMMENT = v7(v21.data.comment or ""), 
            REPORTED_ABUSE_VECTOR = v7(v21.data.abuseVector)
        }
    });
end;
return {
    submitVoiceReport = function(v24, v25) --[[ Line: 127 ]] --[[ Name: submitVoiceReport ]]
        -- upvalues: v14 (copy), v4 (copy), l_Players_0 (copy)
        local v26 = v14(v24, v25);
        return v4.try(function() --[[ Line: 129 ]]
            -- upvalues: l_Players_0 (ref), v26 (copy)
            l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v26);
            return {
                responseBody = {}
            };
        end);
    end, 
    submitChatReport = function(v27, v28) --[[ Line: 135 ]] --[[ Name: submitChatReport ]]
        -- upvalues: v17 (copy), v4 (copy), l_Players_0 (copy)
        local v29 = v17(v27);
        return v4.try(function() --[[ Line: 137 ]]
            -- upvalues: l_Players_0 (ref), v28 (copy), v29 (copy)
            l_Players_0:ReportChatAbuse(v28.eligibleMessages, v28.targetMessages, v29);
            return {
                responseBody = {}
            };
        end);
    end, 
    submitAvatarReport = function(v30) --[[ Line: 143 ]] --[[ Name: submitAvatarReport ]]
        -- upvalues: v20 (copy), v4 (copy), l_Players_0 (copy)
        local v31 = v20(v30);
        return v4.try(function() --[[ Line: 145 ]]
            -- upvalues: l_Players_0 (ref), v30 (copy), v31 (copy)
            l_Players_0:ReportAvatarAbuse(tonumber(v30.data.targetIdStr), v31);
            return {
                responseBody = {}
            };
        end);
    end, 
    submitPlaceReport = function(v32) --[[ Line: 151 ]] --[[ Name: submitPlaceReport ]]
        -- upvalues: v23 (copy), v4 (copy), l_Players_0 (copy)
        local v33 = v23(v32);
        return v4.try(function() --[[ Line: 153 ]]
            -- upvalues: l_Players_0 (ref), v33 (copy)
            l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v33);
            return {
                responseBody = {}
            };
        end);
    end, 
    buildVoiceReport = v14, 
    buildChatReport = v17, 
    buildAvatarReport = v20, 
    buildPlaceReport = v23
};