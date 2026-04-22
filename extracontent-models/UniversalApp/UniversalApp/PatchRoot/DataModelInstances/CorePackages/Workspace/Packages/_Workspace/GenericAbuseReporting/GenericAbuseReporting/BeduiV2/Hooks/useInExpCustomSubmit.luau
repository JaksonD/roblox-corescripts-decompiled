local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Utils.computeImpactedUserCount);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Loaders.LoaderContext);
local v7 = require(l_script_FirstAncestor_0.BeduiV2.Utils.reportHelper);
local l_useVoiceSnapshot_0 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.Enrichment.useVoiceSnapshot).useVoiceSnapshot;
local l_submitVoiceReport_0 = v7.submitVoiceReport;
local l_submitChatReport_0 = v7.submitChatReport;
local l_submitAvatarReport_0 = v7.submitAvatarReport;
local l_submitPlaceReport_0 = v7.submitPlaceReport;
return function(v13) --[[ Line: 33 ]] --[[ Name: useInExpCustomSubmit ]]
    -- upvalues: l_useVoiceSnapshot_0 (copy), v3 (copy), v5 (copy), l_submitVoiceReport_0 (copy), v2 (copy), l_submitChatReport_0 (copy), l_submitAvatarReport_0 (copy), l_submitPlaceReport_0 (copy)
    local v14 = l_useVoiceSnapshot_0(v13.voiceChatServiceManager);
    return v3.useCallback(function(v15) --[[ Line: 36 ]]
        -- upvalues: v14 (copy), v5 (ref), v13 (copy), l_submitVoiceReport_0 (ref), v2 (ref), l_submitChatReport_0 (ref), l_submitAvatarReport_0 (ref), l_submitPlaceReport_0 (ref)
        if not v15.endpoint then
            error("SubmissionConfig must have an endpoint");
        end;
        if v15.endpoint == "voice" then
            local l_current_0 = v14.current;
            local v17 = {
                sortedPlayerListUserIds = l_current_0.sortedPlayerListUserIds, 
                channelId = l_current_0.channelId, 
                voiceUserCount = l_current_0.voiceUserCount, 
                voiceImpactedUserCount = v5(v13.voiceChatServiceManager, v15.data.targetIdStr), 
                menuOpenedUnixMilli = v13.menuOpenTimeRef.current
            };
            return l_submitVoiceReport_0(v15, v17);
        elseif v15.endpoint == "chat" then
            local l_inExpChatMessagesLoader_0 = v13.inExpChatMessagesLoader;
            if not l_inExpChatMessagesLoader_0 then
                return v2.reject("inExpChatMessagesLoader is required for chat reports");
            else
                local v19 = v15.data.custom and v15.data.custom.textChatMessageId;
                return l_inExpChatMessagesLoader_0.fetch({}):andThen(function(v20) --[[ Line: 72 ]]
                    -- upvalues: v19 (copy), l_submitChatReport_0 (ref), v15 (copy)
                    local v21 = {};
                    local v22 = {};
                    local l_ipairs_0 = ipairs;
                    local v24 = v20 or {};
                    for _, v26 in l_ipairs_0(v24) do
                        local l_ipairs_1 = ipairs;
                        local v28 = v26.items or {};
                        for _, v30 in l_ipairs_1(v28) do
                            table.insert(v21, {
                                channel = nil, 
                                messageId = v30.id
                            });
                            if v30.id == v19 then
                                table.insert(v22, {
                                    channel = nil, 
                                    messageId = v30.id
                                });
                            end;
                        end;
                    end;
                    return l_submitChatReport_0(v15, {
                        eligibleMessages = v21, 
                        targetMessages = v22
                    });
                end);
            end;
        elseif v15.endpoint == "avatar" then
            return l_submitAvatarReport_0(v15);
        elseif v15.endpoint == "place" then
            return l_submitPlaceReport_0(v15);
        else
            return v2.reject("Unknown in-experience submission endpoint: " .. tostring(v15.endpoint));
        end;
    end, {
        v13.voiceChatServiceManager, 
        v13.inExpChatMessagesLoader, 
        v13.menuOpenTimeRef
    });
end;