local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Conversations);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.HasUnreadMessages);
local v9 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchedOldestMessage);
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchingOlderMessages);
local l_MessageFailedToSend_0 = v6.Actions.MessageFailedToSend;
local l_MessageModerated_0 = v6.Actions.MessageModerated;
local v13 = require(l_script_FirstAncestor_0.Conversations.Actions.ReadConversation);
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedConversation);
local l_ReceivedMessages_0 = v6.Actions.ReceivedMessages;
local v16 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v17 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v18 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local l_SendingMessage_0 = v6.Actions.SendingMessage;
local l_SentMessage_0 = v6.Actions.SentMessage;
local v21 = require(l_script_FirstAncestor_0.Conversations.Actions.SetConversationLoadingStatus);
local v22 = require(l_script_FirstAncestor_0.Conversations.Actions.SetPinnedGameForConversation);
local v23 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserLeavingConversation);
local v24 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserTyping);
local v25 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v26 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v27 = require(l_script_FirstAncestor_0.Conversations.Actions.ReloadedMessagesForConversations);
local v28 = require(l_script_FirstAncestor_0.Conversations.Actions.ConversationModerationTypeChanged);
local v29 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v30 = require(l_script_FirstAncestor_0.Http.NetworkingBlocking);
local v31 = require(l_script_FirstAncestor_0.Models.Conversation);
local v32 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local v36 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v37 = require(l_Parent_0.Cryo);
local v38 = require(l_script_FirstAncestor_0.Utils.addConversation);
local l_getFFlagAppChatPCMFixBlocking_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatPCMFixBlocking;
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
local l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatExcludeSyntheticPreviewFromMessages;
local v42 = require(script.Parent.updateConversationReducer);
local v43 = require(l_script_FirstAncestor_0.Utils.getOneToOneConversationIdFromFriendId);
local v44 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableManualTranslation);
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local l_FFlagAppChatEnableU13ChatOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableU13ChatOptIn;
local v48 = require(l_script_FirstAncestor_0.Constants);
local v49 = {
    [v48.OptInVariant.OsaContextCard] = if v46 then {
        field = "osaAcknowledgementStatus", 
        value = v32.OsaAcknowledgementStatus.Acknowledged
    } else nil, 
    [v48.OptInVariant.ChatOptInInfoCard] = if l_FFlagAppChatEnableU13ChatOptIn_0 then {
        field = "userOptedIntoChatMessages", 
        value = v32.UserOptedIntoChatMessagesStatus.OptedIn
    } else nil
};
local function v56(v50, v51) --[[ Line: 78 ]] --[[ Name: markConversationAndMessagesAsRead ]]
    -- upvalues: l_Immutable_0 (copy)
    local v52 = v50[v51];
    if not v52 then
        warn("Conversation " .. v51 .. " not found in ReadConversation reducer");
        return v50;
    else
        assert(v52, "FFlagLuauTinyControlFlowAnalysis");
        local v54 = v52.messages:Map(function(v53) --[[ Line: 87 ]]
            -- upvalues: l_Immutable_0 (ref)
            if v53.read then
                return v53;
            else
                return l_Immutable_0.Set(v53, "read", true);
            end;
        end);
        local v55 = l_Immutable_0.Set(v52, "messages", v54);
        v55 = l_Immutable_0.Set(v55, "hasUnreadMessages", false);
        return (l_Immutable_0.Set(v50, v55.id, v55));
    end;
end;
local function v75(v57, v58, v59) --[[ Line: 103 ]] --[[ Name: addMessagesToConversation ]]
    -- upvalues: l_Immutable_0 (copy), l_OrderedMap_0 (copy)
    local v60 = v57[v58];
    if v60 then
        local v61 = nil;
        local l_previewMessageId_0 = v60.previewMessageId;
        local v63 = 0;
        if l_previewMessageId_0 and v60.messages then
            local v64 = v60.messages:Get(l_previewMessageId_0);
            if v64 then
                v63 = v64.sent:GetUnixTimestamp();
            end;
        end;
        for v65 = 1, #v59.messages do
            local v66 = v59.messages[v65];
            local v67 = v60.messages:Get(v66.id);
            if v67 then
                if v61 then
                    v61.previousMessageId = v67.id;
                end;
                if v66.previousMessageId == nil and v67.previousMessageId ~= nil then
                    v66.previousMessageId = v67.previousMessageId;
                end;
                v66.read = v66.read or v67.read;
            elseif v66.isPreviewable and v63 < v66.sent:GetUnixTimestamp() then
                l_previewMessageId_0 = v66.id;
                v63 = v66.sent:GetUnixTimestamp();
            end;
            v61 = v66;
        end;
        v60 = l_Immutable_0.JoinDictionaries(v60, {
            previewMessageId = l_previewMessageId_0
        });
        local v68 = l_OrderedMap_0.Insert(v60.messages, unpack(v59.messages));
        if v59.exclusiveStartMessageId and #v59.messages > 0 and v68:Get(v59.exclusiveStartMessageId) then
            local v69 = v59.messages[1];
            local v70 = v68:Get(v59.exclusiveStartMessageId);
            v68 = v68:Insert((l_Immutable_0.Set(v70, "previousMessageId", v69.id)));
        end;
        local v71 = l_previewMessageId_0 and v68 and v68:Get(l_previewMessageId_0);
        local l_lastUpdated_0 = v60.lastUpdated;
        if v71 then
            l_lastUpdated_0 = (l_lastUpdated_0 and l_lastUpdated_0:GetUnixTimestamp() or 0) < v71.sent:GetUnixTimestamp() and v71.sent or v60.lastUpdated;
        end;
        local v73 = v59.shouldMarkConversationUnread or v60.hasUnreadMessages;
        local v74 = l_Immutable_0.JoinDictionaries(v60, {
            messages = v68, 
            lastUpdated = l_lastUpdated_0, 
            hasUnreadMessages = v73, 
            nextCursor = v59.nextCursor, 
            previousCursor = v59.previousCursor
        });
        v74 = l_Immutable_0.Set(v74, "usersTyping", {});
        return l_Immutable_0.Set(v57, v74.id, v74);
    else
        return v57;
    end;
end;
local function v85(v76, v77, v78, v79) --[[ Line: 188 ]] --[[ Name: updateMessageContentToDisplay ]]
    -- upvalues: l_Immutable_0 (copy)
    local v80 = v76[v77];
    if v80 then
        local v81 = v80.messages:Get(v78);
        if v81 then
            local v82 = l_Immutable_0.Set(v81, "contentToDisplay", v79);
            local v83 = v80.messages:Insert(v82);
            local v84 = l_Immutable_0.Set(v80, "messages", v83);
            return l_Immutable_0.Set(v76, v84.id, v84);
        end;
    end;
    return v76;
end;
local function _(v86, v87) --[[ Line: 208 ]] --[[ Name: messagesFromResponse ]]
    -- upvalues: l_Functional_0 (copy), v36 (copy)
    if not v87 then
        return {};
    else
        local v88 = nil;
        return (l_Functional_0.MapReverse(v87, function(v89) --[[ Line: 215 ]]
            -- upvalues: v36 (ref), v86 (copy), v88 (ref)
            local v90 = v36.fromWeb(v89, v86, v88);
            v88 = v90.id;
            return v90;
        end));
    end;
end;
local function v99(v92, v93) --[[ Line: 223 ]] --[[ Name: messagesFromResponseOfChannelsApi ]]
    -- upvalues: v36 (copy)
    if not v93 then
        return {};
    else
        local v94 = nil;
        local v95 = {};
        for v96 = #v93, 1, -1 do
            local v97 = v93[v96];
            local v98 = v36.fromChannelsApi(v97, v92, v94);
            if v98 then
                table.insert(v95, v98);
                v94 = v98.id;
            end;
        end;
        return v95;
    end;
end;
local function v102(v100) --[[ Line: 245 ]] --[[ Name: getMessagesFromConversationResponse ]]
    -- upvalues: l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 (copy), l_Immutable_0 (copy)
    local v101 = v100.messages or {};
    if v100.preview_message and not l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 then
        v101 = l_Immutable_0.JoinLists({
            v100.preview_message
        }, v101);
    end;
    return v101;
end;
local function _(v103) --[[ Line: 256 ]] --[[ Name: isMessageFromSelf ]]
    -- upvalues: l_Players_0 (copy)
    local v104 = v103 and v103[#v103] or nil;
    return v104 and v104.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false;
end;
local function v113(v106, v107) --[[ Line: 262 ]] --[[ Name: getShouldMarkConversationUnread ]]
    -- upvalues: l_Players_0 (copy)
    if not v106 or not v106.messages or not v107 then
        return false;
    else
        local v108 = v106.messages.keys[#v106.messages.keys];
        local v109 = v106.messages.values[v108];
        local v110 = v109 and v109.sent and v109.sent:GetUnixTimestamp() or 0;
        for v111 = #v107, 1, -1 do
            local v112 = v107[v111];
            if v112 then
                if v112.sent:GetUnixTimestamp() <= v110 then
                    return false;
                elseif v112.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId) and v112.isBadgeable then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return v4.createReducer({}, {
    [v14.name] = function(v114, v115) --[[ Line: 299 ]]
        -- upvalues: v42 (copy)
        return v42(v114, v115.conversation);
    end, 
    [v29.StartGroupConversation.Succeeded.name] = function(v116, v117) --[[ Line: 302 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_0 = v117.responseBody;
        local v119 = v31.fromWeb(l_responseBody_0.conversation);
        return v42(v116, v119);
    end, 
    [v29.StartOneToOneConversation.Succeeded.name] = function(v120, v121) --[[ Line: 307 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_1 = v121.responseBody;
        local v123 = v31.fromWeb(l_responseBody_1.conversation);
        return v42(v120, v123);
    end, 
    [v3.rodux.CreateConversation.Succeeded.name] = function(v124, v125) --[[ Line: 312 ]]
        -- upvalues: v32 (copy), v42 (copy)
        local l_responseBody_2 = v125.responseBody;
        if l_responseBody_2 and l_responseBody_2.conversations and l_responseBody_2.conversations[1] and l_responseBody_2.conversations[1].status == "success" then
            local v127 = v32.fromChannelsApi(l_responseBody_2.conversations[1]);
            v124 = v42(v124, v127);
        end;
        return v124;
    end, 
    [v3.rodux.DuplicateConversation.Succeeded.name] = function(v128, v129) --[[ Line: 326 ]]
        -- upvalues: v32 (copy), v38 (copy)
        local l_responseBody_3 = v129.responseBody;
        if l_responseBody_3 and l_responseBody_3.conversations and l_responseBody_3.conversations[1] then
            local v131 = v32.fromChannelsApi(l_responseBody_3.conversations[1]);
            v128 = v38(v128, v131);
        end;
        return v128;
    end, 
    [l_ReceivedMessages_0.name] = function(v132, v133) --[[ Line: 335 ]]
        -- upvalues: v75 (copy)
        return v75(v132, v133.conversationId, v133);
    end, 
    [l_SendingMessage_0.name] = function(v134, v135) --[[ Line: 338 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v136 = v134[v135.conversationId];
        if v136 then
            local v137 = l_OrderedMap_0.Insert(v136.sendingMessages, v135.message);
            local v138 = l_Immutable_0.Set(v136, "sendingMessages", v137);
            v134 = l_Immutable_0.Set(v134, v138.id, v138);
        end;
        return v134;
    end, 
    [l_SentMessage_0.name] = function(v139, v140) --[[ Line: 349 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v141 = v139[v140.conversationId];
        if v141 then
            local v142 = l_OrderedMap_0.Delete(v141.sendingMessages, v140.messageId);
            local v143 = l_Immutable_0.Set(v141, "sendingMessages", v142);
            v139 = l_Immutable_0.Set(v139, v143.id, v143);
        end;
        return v139;
    end, 
    [v18.name] = function(v144, v145) --[[ Line: 360 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_0 = v145.conversationId;
        local v147 = v144[l_conversationId_0];
        if v147 then
            local v148 = l_Immutable_0.JoinDictionaries(v147, {
                lastUpdated = v145.lastUpdated, 
                title = v145.title, 
                isDefaultTitle = v145.isDefaultTitle
            });
            v144 = l_Immutable_0.Set(v144, l_conversationId_0, v148);
        end;
        return v144;
    end, 
    [v8.name] = function(v149, v150) --[[ Line: 375 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v151 = v150.conversation and v149[v150.conversation.id];
        if v151 then
            local v152 = l_Immutable_0.Set(v151, "hasUnreadMessages", true);
            v149 = l_Immutable_0.Set(v149, v150.conversation.id, v152);
        end;
        return v149;
    end, 
    [v7.name] = function(v153, v154) --[[ Line: 384 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_1 = v154.conversationId;
        local l_participants_0 = v154.participants;
        local v157 = v153[l_conversationId_1];
        if v157 then
            local v158 = l_Immutable_0.JoinDictionaries(v157, {
                participants = l_participants_0, 
                lastUpdated = v154.lastUpdated, 
                title = v154.title
            });
            v153 = l_Immutable_0.Set(v153, l_conversationId_1, v158);
        end;
        return v153;
    end, 
    [v16.name] = function(v159, v160) --[[ Line: 400 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_2 = v160.conversationId;
        return l_Immutable_0.Set(v159, l_conversationId_2, nil);
    end, 
    [v24.name] = function(v162, v163) --[[ Line: 404 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v164 = v162[v163.conversationId];
        if v164 then
            local l_usersTyping_0 = v164.usersTyping;
            local v166 = l_Immutable_0.Set(l_usersTyping_0, v163.userId, v163.value);
            local v167 = l_Immutable_0.Set(v164, "usersTyping", v166);
            v162 = l_Immutable_0.Set(v162, v167.id, v167);
        end;
        return v162;
    end, 
    [v10.name] = function(v168, v169) --[[ Line: 415 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v170 = v168[v169.conversationId];
        if v170 then
            local v171 = l_Immutable_0.Set(v170, "fetchingOlderMessages", v169.fetchingOlderMessages);
            v168 = l_Immutable_0.Set(v168, v171.id, v171);
        end;
        return v168;
    end, 
    [v9.name] = function(v172, v173) --[[ Line: 424 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v174 = v172[v173.conversationId];
        if v174 then
            local v175 = l_Immutable_0.Set(v174, "fetchedOldestMessage", v173.fetchedOldestMessage);
            return l_Immutable_0.Set(v172, v175.id, v175);
        else
            return v172;
        end;
    end, 
    [v13.name] = function(v176, v177) --[[ Line: 433 ]]
        -- upvalues: v56 (copy)
        return (v56(v176, v177.conversationId));
    end, 
    [l_MessageModerated_0.name] = function(v178, v179) --[[ Line: 436 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v180 = v178[v179.conversationId];
        if v180 then
            local v181 = v180.sendingMessages:Get(v179.messageId);
            if v181 then
                local v182 = l_Immutable_0.Set(v181, "moderated", true);
                local v183 = v180.sendingMessages:Insert(v182);
                local v184 = l_Immutable_0.Set(v180, "sendingMessages", v183);
                v178 = l_Immutable_0.Set(v178, v184.id, v184);
            end;
        end;
        return v178;
    end, 
    [l_MessageFailedToSend_0.name] = function(v185, v186) --[[ Line: 450 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v187 = v185[v186.conversationId];
        if v187 then
            local v188 = v187.sendingMessages:Get(v186.messageId);
            if v188 then
                local v189 = l_Immutable_0.Set(v188, "failed", true);
                local v190 = v187.sendingMessages:Insert(v189);
                local v191 = l_Immutable_0.Set(v187, "sendingMessages", v190);
                v185 = l_Immutable_0.Set(v185, v191.id, v191);
            end;
        end;
        return v185;
    end, 
    [v21.name] = function(v192, v193) --[[ Line: 464 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v194 = v192[v193.conversationId];
        if v194 then
            local v195 = l_Immutable_0.Set(v194, "initialLoadingStatus", v193.value);
            return l_Immutable_0.Set(v192, v195.id, v195);
        else
            return v192;
        end;
    end, 
    [v23.name] = function(v196, v197) --[[ Line: 473 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v198 = v196[v197.id];
        if v198 then
            local v199 = l_Immutable_0.Set(v198, "isUserLeaving", v197.isLeaving);
            v196 = l_Immutable_0.Set(v196, v199.id, v199);
        end;
        return v196;
    end, 
    [v22.name] = function(v200, v201) --[[ Line: 481 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_3 = v201.conversationId;
        local v203 = v200[l_conversationId_3];
        if v203 then
            local v204 = {
                rootPlaceId = v201.rootPlaceId, 
                universeId = v201.universeId
            };
            local v205 = l_Immutable_0.JoinDictionaries(v203, {
                pinnedGame = v204
            });
            v200 = l_Immutable_0.Set(v200, l_conversationId_3, v205);
        end;
        return v200;
    end, 
    [v29.GetUserConversations.Succeeded.name] = function(v206, v207) --[[ Line: 499 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_4 = v207.responseBody;
        for _, v210 in ipairs(l_responseBody_4) do
            local v211 = v31.fromWeb(v210);
            v206 = v42(v206, v211);
        end;
        return v206;
    end, 
    [v3.rodux.GetUserConversations.Succeeded.name] = function(v212, v213) --[[ Line: 508 ]]
        -- upvalues: v32 (copy), v42 (copy), v102 (copy), v5 (copy), v36 (copy), v75 (copy)
        local l_responseBody_5 = v213.responseBody;
        if l_responseBody_5 and l_responseBody_5.conversations then
            for _, v216 in l_responseBody_5.conversations do
                local v217 = v32.fromChannelsApi(v216);
                v212 = v42(v212, v217);
                local v218 = v102(v216);
                if v218 and #v218 > 0 then
                    local v220 = {
                        messages = v5.Array.map(v218, function(v219) --[[ Line: 518 ]]
                            -- upvalues: v36 (ref), v217 (copy)
                            return v36.fromChannelsApi(v219, v217.id);
                        end)
                    };
                    v212 = v75(v212, v217.id, v220);
                end;
            end;
        end;
        return v212;
    end, 
    [v29.GetConversations.Succeeded.name] = function(v221, v222) --[[ Line: 533 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_6 = v222.responseBody;
        for _, v225 in ipairs(l_responseBody_6) do
            local v226 = v31.fromWeb(v225);
            v221 = v42(v221, v226);
        end;
        return v221;
    end, 
    [v3.rodux.GetOlderMessages.Succeeded.name] = function(v227, v228) --[[ Line: 542 ]]
        -- upvalues: v99 (copy), v75 (copy), l_Immutable_0 (copy)
        local l_conversation_id_0 = v228.queryArgs.conversation_id;
        local l_responseBody_7 = v228.responseBody;
        local v231 = {};
        local v232 = v227[l_conversation_id_0];
        if not v232 then
            return v227;
        else
            assert(v232, "FFlagLuauTinyControlFlowAnalysis");
            local v233 = v232.previousCursor or nil;
            local v234 = v232.nextCursor or nil;
            if not l_responseBody_7 then
                return v227;
            else
                v231 = v99(l_conversation_id_0, l_responseBody_7.messages);
                local v235 = if l_responseBody_7.next_cursor == "" then nil else l_responseBody_7.next_cursor;
                if v235 then
                    v234 = v235;
                end;
                if v233 == nil then
                    v233 = if l_responseBody_7.previous_cursor == "" then nil else l_responseBody_7.previous_cursor;
                end;
                local v236 = {
                    messages = v231, 
                    nextCursor = v234, 
                    previousCursor = v233
                };
                v227 = v75(v227, l_conversation_id_0, v236);
                if not v235 then
                    local v237 = v227[l_conversation_id_0];
                    if v237 then
                        local v238 = l_Immutable_0.Set(v237, "fetchedOldestMessage", true);
                        v227 = l_Immutable_0.Set(v227, v238.id, v238);
                    end;
                end;
                return v227;
            end;
        end;
    end, 
    [v3.rodux.GetNewerMessages.Succeeded.name] = function(v239, v240) --[[ Line: 595 ]]
        -- upvalues: v99 (copy), v113 (copy), v75 (copy)
        local l_conversation_id_1 = v240.queryArgs.conversation_id;
        local l_responseBody_8 = v240.responseBody;
        local v243 = v239[l_conversation_id_1];
        if not v243 then
            return v239;
        else
            assert(v243, "FFlagLuauTinyControlFlowAnalysis");
            local v244 = v243.previousCursor or nil;
            local v245 = v243.nextCursor or nil;
            if not l_responseBody_8 then
                return v239;
            else
                local v246 = v99(l_conversation_id_1, l_responseBody_8.messages);
                if v245 == nil then
                    v245 = if l_responseBody_8.next_cursor == "" then nil else l_responseBody_8.next_cursor;
                end;
                local v247 = if l_responseBody_8.previous_cursor == "" then nil else l_responseBody_8.previous_cursor;
                if v247 then
                    v244 = v247;
                end;
                local v248 = v113(v243, v246);
                local v249 = {
                    messages = v246, 
                    nextCursor = v245, 
                    previousCursor = v244, 
                    shouldMarkConversationUnread = v248
                };
                return (v75(v239, l_conversation_id_1, v249));
            end;
        end;
    end, 
    [v29.GetMessages.Succeeded.name] = function(v250, v251) --[[ Line: 637 ]]
        -- upvalues: l_Functional_0 (copy), v36 (copy), l_Players_0 (copy), v75 (copy), l_Immutable_0 (copy)
        local l_conversationId_4 = v251.queryArgs.conversationId;
        local l_responseBody_9 = v251.responseBody;
        local v254;
        if not l_responseBody_9 then
            v254 = {};
        else
            local v255 = nil;
            do
                local l_v255_0 = v255;
                v254 = l_Functional_0.MapReverse(l_responseBody_9, function(v257) --[[ Line: 215 ]]
                    -- upvalues: v36 (ref), l_conversationId_4 (copy), l_v255_0 (ref)
                    local v258 = v36.fromWeb(v257, l_conversationId_4, l_v255_0);
                    l_v255_0 = v258.id;
                    return v258;
                end);
            end;
        end;
        l_responseBody_9 = {
            messages = v254
        };
        local v259 = v254 and v254[#v254] or nil;
        l_responseBody_9.shouldMarkConversationUnread = not (v259 and v259.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false);
        v250 = v75(v250, l_conversationId_4, l_responseBody_9);
        local l_pageSize_0 = v251.queryArgs.pageSize;
        if l_pageSize_0 and #v254 < l_pageSize_0 then
            local v261 = v250[l_conversationId_4];
            if not v261 then
                return v250;
            else
                assert(v261, "FFlagLuauTinyControlFlowAnalysis");
                v259 = v250[l_conversationId_4];
                if v259 then
                    local v262 = l_Immutable_0.Set(v259, "fetchedOldestMessage", true);
                    v250 = l_Immutable_0.Set(v250, v262.id, v262);
                end;
            end;
        end;
        return v250;
    end, 
    [v29.GetLatestMessages.Succeeded.name] = function(v263, v264) --[[ Line: 663 ]]
        -- upvalues: l_Functional_0 (copy), v36 (copy), v75 (copy)
        local l_responseBody_10 = v264.responseBody;
        for _, v267 in ipairs(l_responseBody_10) do
            local v268 = tostring(v267.conversationId);
            local l_chatMessages_0 = v267.chatMessages;
            local v270;
            if not l_chatMessages_0 then
                v270 = {};
            else
                local v271 = nil;
                do
                    local l_v271_0 = v271;
                    v270 = l_Functional_0.MapReverse(l_chatMessages_0, function(v273) --[[ Line: 215 ]]
                        -- upvalues: v36 (ref), v268 (copy), l_v271_0 (ref)
                        local v274 = v36.fromWeb(v273, v268, l_v271_0);
                        l_v271_0 = v274.id;
                        return v274;
                    end);
                end;
            end;
            l_chatMessages_0 = {
                messages = v270
            };
            v263 = v75(v263, v268, l_chatMessages_0);
        end;
        return v263;
    end, 
    [v3.rodux.GetConversationDetails.Succeeded.name] = function(v275, v276) --[[ Line: 675 ]]
        -- upvalues: v32 (copy), v42 (copy), v102 (copy), v5 (copy), v36 (copy), v75 (copy)
        local v277 = v276.responseBody.conversations[1];
        if not v277 then
            return v275;
        else
            local v278 = v32.fromChannelsApi(v277);
            v275 = v42(v275, v278);
            local v279 = v102(v277);
            if v279 and #v279 > 0 then
                local v281 = {
                    messages = v5.Array.map(v279, function(v280) --[[ Line: 689 ]]
                        -- upvalues: v36 (ref), v278 (copy)
                        return v36.fromChannelsApi(v280, v278.id);
                    end)
                };
                v275 = v75(v275, v278.id, v281);
            end;
            return v275;
        end;
    end, 
    [v3.rodux.MultiGetConversationDetails.Succeeded.name] = function(v282, v283) --[[ Line: 702 ]]
        -- upvalues: v32 (copy), v42 (copy), v102 (copy), v5 (copy), v36 (copy), v75 (copy)
        local l_responseBody_11 = v283.responseBody;
        if not l_responseBody_11 or not l_responseBody_11.conversations then
            return v282;
        else
            for _, v286 in l_responseBody_11.conversations do
                local v287 = v32.fromChannelsApi(v286);
                v282 = v42(v282, v287);
                local v288 = v102(v286);
                if v288 and #v288 > 0 then
                    local v290 = {
                        messages = v5.Array.map(v288, function(v289) --[[ Line: 714 ]]
                            -- upvalues: v36 (ref), v287 (copy)
                            return v36.fromChannelsApi(v289, v287.id);
                        end)
                    };
                    v282 = v75(v282, v287.id, v290);
                end;
            end;
            return v282;
        end;
    end, 
    [v3.rodux.MarkConversation.Succeeded.name] = function(v291, v292) --[[ Line: 727 ]]
        -- upvalues: v56 (copy)
        local v293 = v292.postBody.conversation_ids[1];
        return (v56(v291, v293));
    end, 
    [v29.MarkAsRead.Succeeded.name] = function(v294, v295) --[[ Line: 731 ]]
        -- upvalues: v56 (copy)
        local l_conversationId_5 = v295.postBody.conversationId;
        return (v56(v294, l_conversationId_5));
    end, 
    [v3.rodux.TranslateUserMessage.Succeeded.name] = v44() and function(v297, v298) --[[ Line: 736 ]]
        -- upvalues: v85 (copy)
        local l_content_to_display_0 = v298.responseBody.content_to_display;
        if v298.postBody.conversation_id and v298.postBody.message_id then
            return v85(v297, v298.postBody.conversation_id, v298.postBody.message_id, l_content_to_display_0);
        else
            return v297;
        end;
    end or nil, 
    [v17.name] = function(_, _) --[[ Line: 752 ]]
        return {};
    end, 
    [v25.name] = function(v302, v303) --[[ Line: 755 ]]
        -- upvalues: l_Immutable_0 (copy)
        if v302[v303.oldFriendConversationId] then
            return l_Immutable_0.Set(v302, v303.oldFriendConversationId, nil);
        else
            return v302;
        end;
    end, 
    [v26.name] = function(v304, v305) --[[ Line: 762 ]]
        -- upvalues: v32 (copy), l_Immutable_0 (copy)
        local v306 = if v305.userId1 ~= "localUserId" then v305.userId1 else if v305.userId2 ~= "localUserId" then v305.userId2 else nil;
        if not v306 then
            return v304;
        else
            assert(v306, "FFlagLuauTinyControlFlowAnalysis");
            local v307 = v32.getFriendConversationId({
                v306
            });
            if v304[v307] then
                return l_Immutable_0.Set(v304, v307, nil);
            else
                return v304;
            end;
        end;
    end, 
    [v30.BlockUserById.Succeeded.name] = l_getFFlagAppChatPCMFixBlocking_0() and function(v308, v309) --[[ Line: 780 ]]
        -- upvalues: v43 (copy), l_Immutable_0 (copy), v32 (copy)
        local v310 = tostring(v309.namedIds.users);
        if not v310 then
            return v308;
        else
            local v311 = v43(v308, v310);
            local l_v308_0 = v308;
            if v311 and v308[v311] then
                l_v308_0 = l_Immutable_0.Set(l_v308_0, v311, nil);
            end;
            local v313 = v32.getFriendConversationId({
                v310
            });
            if v313 and v308[v313] then
                l_v308_0 = l_Immutable_0.Set(v308, v313, nil);
            end;
            return l_v308_0;
        end;
    end or nil, 
    [v27.name] = v40 and function(v314, v315) --[[ Line: 804 ]]
        -- upvalues: v37 (copy), v32 (copy)
        local l_v314_0 = v314;
        for _, v318 in v315.conversationIds do
            local v319 = l_v314_0[v318];
            l_v314_0 = v37.Dictionary.join(l_v314_0, {
                [v318] = v37.Dictionary.join(v319, {
                    messages = v32.getEmptyMessages(), 
                    sendingMessages = v32.getEmptySendingMessages(), 
                    previousCursor = v37.None, 
                    nextCursor = v37.None, 
                    fetchedOldestMessage = false
                })
            });
        end;
        return l_v314_0;
    end or nil, 
    [v28.name] = l_FFlagAppChatEnableDoubleOptIn_0 and function(v320, v321) --[[ Line: 822 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_6 = v321.conversationId;
        local l_moderationType_0 = v321.moderationType;
        local v324 = v320[l_conversationId_6];
        if v324 then
            local v325 = l_Immutable_0.Set(v324, "moderationType", l_moderationType_0);
            return l_Immutable_0.Set(v320, l_conversationId_6, v325);
        else
            return v320;
        end;
    end or nil, 
    [v3.rodux.RecordModalSequenceResponse.Succeeded.name] = (not not v46 or l_FFlagAppChatEnableU13ChatOptIn_0) and function(v326, v327) --[[ Line: 835 ]]
        -- upvalues: v48 (copy), v49 (copy), v32 (copy), l_Immutable_0 (copy)
        local l_postBody_0 = v327.postBody;
        if l_postBody_0.action_type ~= v48.ModalAction.Accept then
            return v326;
        else
            local v329 = v49[l_postBody_0.modal_variant];
            if not v329 then
                return v326;
            else
                local v330 = l_postBody_0.conversation_id or v32.getFriendConversationId({
                    l_postBody_0.friend_id
                });
                local v331 = v330 and v326[v330];
                if not v331 then
                    return v326;
                else
                    return l_Immutable_0.Set(v326, v330, l_Immutable_0.Set(v331, v329.field, v329.value));
                end;
            end;
        end;
    end or nil
});