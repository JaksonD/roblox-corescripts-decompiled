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
local function v52(v46, v47) --[[ Line: 58 ]] --[[ Name: markConversationAndMessagesAsRead ]]
    -- upvalues: l_Immutable_0 (copy)
    local v48 = v46[v47];
    if not v48 then
        warn("Conversation " .. v47 .. " not found in ReadConversation reducer");
        return v46;
    else
        assert(v48, "FFlagLuauTinyControlFlowAnalysis");
        local v50 = v48.messages:Map(function(v49) --[[ Line: 67 ]]
            -- upvalues: l_Immutable_0 (ref)
            if v49.read then
                return v49;
            else
                return l_Immutable_0.Set(v49, "read", true);
            end;
        end);
        local v51 = l_Immutable_0.Set(v48, "messages", v50);
        v51 = l_Immutable_0.Set(v51, "hasUnreadMessages", false);
        return (l_Immutable_0.Set(v46, v51.id, v51));
    end;
end;
local function v71(v53, v54, v55) --[[ Line: 83 ]] --[[ Name: addMessagesToConversation ]]
    -- upvalues: l_Immutable_0 (copy), l_OrderedMap_0 (copy)
    local v56 = v53[v54];
    if v56 then
        local v57 = nil;
        local l_previewMessageId_0 = v56.previewMessageId;
        local v59 = 0;
        if l_previewMessageId_0 and v56.messages then
            local v60 = v56.messages:Get(l_previewMessageId_0);
            if v60 then
                v59 = v60.sent:GetUnixTimestamp();
            end;
        end;
        for v61 = 1, #v55.messages do
            local v62 = v55.messages[v61];
            local v63 = v56.messages:Get(v62.id);
            if v63 then
                if v57 then
                    v57.previousMessageId = v63.id;
                end;
                if v62.previousMessageId == nil and v63.previousMessageId ~= nil then
                    v62.previousMessageId = v63.previousMessageId;
                end;
                v62.read = v62.read or v63.read;
            elseif v62.isPreviewable and v59 < v62.sent:GetUnixTimestamp() then
                l_previewMessageId_0 = v62.id;
                v59 = v62.sent:GetUnixTimestamp();
            end;
            v57 = v62;
        end;
        v56 = l_Immutable_0.JoinDictionaries(v56, {
            previewMessageId = l_previewMessageId_0
        });
        local v64 = l_OrderedMap_0.Insert(v56.messages, unpack(v55.messages));
        if v55.exclusiveStartMessageId and #v55.messages > 0 and v64:Get(v55.exclusiveStartMessageId) then
            local v65 = v55.messages[1];
            local v66 = v64:Get(v55.exclusiveStartMessageId);
            v64 = v64:Insert((l_Immutable_0.Set(v66, "previousMessageId", v65.id)));
        end;
        local v67 = l_previewMessageId_0 and v64 and v64:Get(l_previewMessageId_0);
        local l_lastUpdated_0 = v56.lastUpdated;
        if v67 then
            l_lastUpdated_0 = (l_lastUpdated_0 and l_lastUpdated_0:GetUnixTimestamp() or 0) < v67.sent:GetUnixTimestamp() and v67.sent or v56.lastUpdated;
        end;
        local v69 = v55.shouldMarkConversationUnread or v56.hasUnreadMessages;
        local v70 = l_Immutable_0.JoinDictionaries(v56, {
            messages = v64, 
            lastUpdated = l_lastUpdated_0, 
            hasUnreadMessages = v69, 
            nextCursor = v55.nextCursor, 
            previousCursor = v55.previousCursor
        });
        v70 = l_Immutable_0.Set(v70, "usersTyping", {});
        return l_Immutable_0.Set(v53, v70.id, v70);
    else
        return v53;
    end;
end;
local function v81(v72, v73, v74, v75) --[[ Line: 168 ]] --[[ Name: updateMessageContentToDisplay ]]
    -- upvalues: l_Immutable_0 (copy)
    local v76 = v72[v73];
    if v76 then
        local v77 = v76.messages:Get(v74);
        if v77 then
            local v78 = l_Immutable_0.Set(v77, "contentToDisplay", v75);
            local v79 = v76.messages:Insert(v78);
            local v80 = l_Immutable_0.Set(v76, "messages", v79);
            return l_Immutable_0.Set(v72, v80.id, v80);
        end;
    end;
    return v72;
end;
local function _(v82, v83) --[[ Line: 188 ]] --[[ Name: messagesFromResponse ]]
    -- upvalues: l_Functional_0 (copy), v36 (copy)
    if not v83 then
        return {};
    else
        local v84 = nil;
        return (l_Functional_0.MapReverse(v83, function(v85) --[[ Line: 195 ]]
            -- upvalues: v36 (ref), v82 (copy), v84 (ref)
            local v86 = v36.fromWeb(v85, v82, v84);
            v84 = v86.id;
            return v86;
        end));
    end;
end;
local function v95(v88, v89) --[[ Line: 203 ]] --[[ Name: messagesFromResponseOfChannelsApi ]]
    -- upvalues: v36 (copy)
    if not v89 then
        return {};
    else
        local v90 = nil;
        local v91 = {};
        for v92 = #v89, 1, -1 do
            local v93 = v89[v92];
            local v94 = v36.fromChannelsApi(v93, v88, v90);
            if v94 then
                table.insert(v91, v94);
                v90 = v94.id;
            end;
        end;
        return v91;
    end;
end;
local function v98(v96) --[[ Line: 225 ]] --[[ Name: getMessagesFromConversationResponse ]]
    -- upvalues: l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 (copy), l_Immutable_0 (copy)
    local v97 = v96.messages or {};
    if v96.preview_message and not l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 then
        v97 = l_Immutable_0.JoinLists({
            v96.preview_message
        }, v97);
    end;
    return v97;
end;
local function _(v99) --[[ Line: 236 ]] --[[ Name: isMessageFromSelf ]]
    -- upvalues: l_Players_0 (copy)
    local v100 = v99 and v99[#v99] or nil;
    return v100 and v100.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false;
end;
local function v109(v102, v103) --[[ Line: 242 ]] --[[ Name: getShouldMarkConversationUnread ]]
    -- upvalues: l_Players_0 (copy)
    if not v102 or not v102.messages or not v103 then
        return false;
    else
        local v104 = v102.messages.keys[#v102.messages.keys];
        local v105 = v102.messages.values[v104];
        local v106 = v105 and v105.sent and v105.sent:GetUnixTimestamp() or 0;
        for v107 = #v103, 1, -1 do
            local v108 = v103[v107];
            if v108 then
                if v108.sent:GetUnixTimestamp() <= v106 then
                    return false;
                elseif v108.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId) and v108.isBadgeable then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return v4.createReducer({}, {
    [v14.name] = function(v110, v111) --[[ Line: 279 ]]
        -- upvalues: v42 (copy)
        return v42(v110, v111.conversation);
    end, 
    [v29.StartGroupConversation.Succeeded.name] = function(v112, v113) --[[ Line: 282 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_0 = v113.responseBody;
        local v115 = v31.fromWeb(l_responseBody_0.conversation);
        return v42(v112, v115);
    end, 
    [v29.StartOneToOneConversation.Succeeded.name] = function(v116, v117) --[[ Line: 287 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_1 = v117.responseBody;
        local v119 = v31.fromWeb(l_responseBody_1.conversation);
        return v42(v116, v119);
    end, 
    [v3.rodux.CreateConversation.Succeeded.name] = function(v120, v121) --[[ Line: 292 ]]
        -- upvalues: v32 (copy), v42 (copy)
        local l_responseBody_2 = v121.responseBody;
        if l_responseBody_2 and l_responseBody_2.conversations and l_responseBody_2.conversations[1] and l_responseBody_2.conversations[1].status == "success" then
            local v123 = v32.fromChannelsApi(l_responseBody_2.conversations[1]);
            v120 = v42(v120, v123);
        end;
        return v120;
    end, 
    [v3.rodux.DuplicateConversation.Succeeded.name] = function(v124, v125) --[[ Line: 306 ]]
        -- upvalues: v32 (copy), v38 (copy)
        local l_responseBody_3 = v125.responseBody;
        if l_responseBody_3 and l_responseBody_3.conversations and l_responseBody_3.conversations[1] then
            local v127 = v32.fromChannelsApi(l_responseBody_3.conversations[1]);
            v124 = v38(v124, v127);
        end;
        return v124;
    end, 
    [l_ReceivedMessages_0.name] = function(v128, v129) --[[ Line: 315 ]]
        -- upvalues: v71 (copy)
        return v71(v128, v129.conversationId, v129);
    end, 
    [l_SendingMessage_0.name] = function(v130, v131) --[[ Line: 318 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v132 = v130[v131.conversationId];
        if v132 then
            local v133 = l_OrderedMap_0.Insert(v132.sendingMessages, v131.message);
            local v134 = l_Immutable_0.Set(v132, "sendingMessages", v133);
            v130 = l_Immutable_0.Set(v130, v134.id, v134);
        end;
        return v130;
    end, 
    [l_SentMessage_0.name] = function(v135, v136) --[[ Line: 329 ]]
        -- upvalues: l_OrderedMap_0 (copy), l_Immutable_0 (copy)
        local v137 = v135[v136.conversationId];
        if v137 then
            local v138 = l_OrderedMap_0.Delete(v137.sendingMessages, v136.messageId);
            local v139 = l_Immutable_0.Set(v137, "sendingMessages", v138);
            v135 = l_Immutable_0.Set(v135, v139.id, v139);
        end;
        return v135;
    end, 
    [v18.name] = function(v140, v141) --[[ Line: 340 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_0 = v141.conversationId;
        local v143 = v140[l_conversationId_0];
        if v143 then
            local v144 = l_Immutable_0.JoinDictionaries(v143, {
                lastUpdated = v141.lastUpdated, 
                title = v141.title, 
                isDefaultTitle = v141.isDefaultTitle
            });
            v140 = l_Immutable_0.Set(v140, l_conversationId_0, v144);
        end;
        return v140;
    end, 
    [v8.name] = function(v145, v146) --[[ Line: 355 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v147 = v146.conversation and v145[v146.conversation.id];
        if v147 then
            local v148 = l_Immutable_0.Set(v147, "hasUnreadMessages", true);
            v145 = l_Immutable_0.Set(v145, v146.conversation.id, v148);
        end;
        return v145;
    end, 
    [v7.name] = function(v149, v150) --[[ Line: 364 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_1 = v150.conversationId;
        local l_participants_0 = v150.participants;
        local v153 = v149[l_conversationId_1];
        if v153 then
            local v154 = l_Immutable_0.JoinDictionaries(v153, {
                participants = l_participants_0, 
                lastUpdated = v150.lastUpdated, 
                title = v150.title
            });
            v149 = l_Immutable_0.Set(v149, l_conversationId_1, v154);
        end;
        return v149;
    end, 
    [v16.name] = function(v155, v156) --[[ Line: 380 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_2 = v156.conversationId;
        return l_Immutable_0.Set(v155, l_conversationId_2, nil);
    end, 
    [v24.name] = function(v158, v159) --[[ Line: 384 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v160 = v158[v159.conversationId];
        if v160 then
            local l_usersTyping_0 = v160.usersTyping;
            local v162 = l_Immutable_0.Set(l_usersTyping_0, v159.userId, v159.value);
            local v163 = l_Immutable_0.Set(v160, "usersTyping", v162);
            v158 = l_Immutable_0.Set(v158, v163.id, v163);
        end;
        return v158;
    end, 
    [v10.name] = function(v164, v165) --[[ Line: 395 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v166 = v164[v165.conversationId];
        if v166 then
            local v167 = l_Immutable_0.Set(v166, "fetchingOlderMessages", v165.fetchingOlderMessages);
            v164 = l_Immutable_0.Set(v164, v167.id, v167);
        end;
        return v164;
    end, 
    [v9.name] = function(v168, v169) --[[ Line: 404 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v170 = v168[v169.conversationId];
        if v170 then
            local v171 = l_Immutable_0.Set(v170, "fetchedOldestMessage", v169.fetchedOldestMessage);
            return l_Immutable_0.Set(v168, v171.id, v171);
        else
            return v168;
        end;
    end, 
    [v13.name] = function(v172, v173) --[[ Line: 413 ]]
        -- upvalues: v52 (copy)
        return (v52(v172, v173.conversationId));
    end, 
    [l_MessageModerated_0.name] = function(v174, v175) --[[ Line: 416 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v176 = v174[v175.conversationId];
        if v176 then
            local v177 = v176.sendingMessages:Get(v175.messageId);
            if v177 then
                local v178 = l_Immutable_0.Set(v177, "moderated", true);
                local v179 = v176.sendingMessages:Insert(v178);
                local v180 = l_Immutable_0.Set(v176, "sendingMessages", v179);
                v174 = l_Immutable_0.Set(v174, v180.id, v180);
            end;
        end;
        return v174;
    end, 
    [l_MessageFailedToSend_0.name] = function(v181, v182) --[[ Line: 430 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v183 = v181[v182.conversationId];
        if v183 then
            local v184 = v183.sendingMessages:Get(v182.messageId);
            if v184 then
                local v185 = l_Immutable_0.Set(v184, "failed", true);
                local v186 = v183.sendingMessages:Insert(v185);
                local v187 = l_Immutable_0.Set(v183, "sendingMessages", v186);
                v181 = l_Immutable_0.Set(v181, v187.id, v187);
            end;
        end;
        return v181;
    end, 
    [v21.name] = function(v188, v189) --[[ Line: 444 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v190 = v188[v189.conversationId];
        if v190 then
            local v191 = l_Immutable_0.Set(v190, "initialLoadingStatus", v189.value);
            return l_Immutable_0.Set(v188, v191.id, v191);
        else
            return v188;
        end;
    end, 
    [v23.name] = function(v192, v193) --[[ Line: 453 ]]
        -- upvalues: l_Immutable_0 (copy)
        local v194 = v192[v193.id];
        if v194 then
            local v195 = l_Immutable_0.Set(v194, "isUserLeaving", v193.isLeaving);
            v192 = l_Immutable_0.Set(v192, v195.id, v195);
        end;
        return v192;
    end, 
    [v22.name] = function(v196, v197) --[[ Line: 461 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_3 = v197.conversationId;
        local v199 = v196[l_conversationId_3];
        if v199 then
            local v200 = {
                rootPlaceId = v197.rootPlaceId, 
                universeId = v197.universeId
            };
            local v201 = l_Immutable_0.JoinDictionaries(v199, {
                pinnedGame = v200
            });
            v196 = l_Immutable_0.Set(v196, l_conversationId_3, v201);
        end;
        return v196;
    end, 
    [v29.GetUserConversations.Succeeded.name] = function(v202, v203) --[[ Line: 479 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_4 = v203.responseBody;
        for _, v206 in ipairs(l_responseBody_4) do
            local v207 = v31.fromWeb(v206);
            v202 = v42(v202, v207);
        end;
        return v202;
    end, 
    [v3.rodux.GetUserConversations.Succeeded.name] = function(v208, v209) --[[ Line: 488 ]]
        -- upvalues: v32 (copy), v42 (copy), v98 (copy), v5 (copy), v36 (copy), v71 (copy)
        local l_responseBody_5 = v209.responseBody;
        if l_responseBody_5 and l_responseBody_5.conversations then
            for _, v212 in l_responseBody_5.conversations do
                local v213 = v32.fromChannelsApi(v212);
                v208 = v42(v208, v213);
                local v214 = v98(v212);
                if v214 and #v214 > 0 then
                    local v216 = {
                        messages = v5.Array.map(v214, function(v215) --[[ Line: 498 ]]
                            -- upvalues: v36 (ref), v213 (copy)
                            return v36.fromChannelsApi(v215, v213.id);
                        end)
                    };
                    v208 = v71(v208, v213.id, v216);
                end;
            end;
        end;
        return v208;
    end, 
    [v29.GetConversations.Succeeded.name] = function(v217, v218) --[[ Line: 513 ]]
        -- upvalues: v31 (copy), v42 (copy)
        local l_responseBody_6 = v218.responseBody;
        for _, v221 in ipairs(l_responseBody_6) do
            local v222 = v31.fromWeb(v221);
            v217 = v42(v217, v222);
        end;
        return v217;
    end, 
    [v3.rodux.GetOlderMessages.Succeeded.name] = function(v223, v224) --[[ Line: 522 ]]
        -- upvalues: v95 (copy), v71 (copy), l_Immutable_0 (copy)
        local l_conversation_id_0 = v224.queryArgs.conversation_id;
        local l_responseBody_7 = v224.responseBody;
        local v227 = {};
        local v228 = v223[l_conversation_id_0];
        if not v228 then
            return v223;
        else
            assert(v228, "FFlagLuauTinyControlFlowAnalysis");
            local v229 = v228.previousCursor or nil;
            local v230 = v228.nextCursor or nil;
            if not l_responseBody_7 then
                return v223;
            else
                v227 = v95(l_conversation_id_0, l_responseBody_7.messages);
                local v231 = if l_responseBody_7.next_cursor == "" then nil else l_responseBody_7.next_cursor;
                if v231 then
                    v230 = v231;
                end;
                if v229 == nil then
                    v229 = if l_responseBody_7.previous_cursor == "" then nil else l_responseBody_7.previous_cursor;
                end;
                local v232 = {
                    messages = v227, 
                    nextCursor = v230, 
                    previousCursor = v229
                };
                v223 = v71(v223, l_conversation_id_0, v232);
                if not v231 then
                    local v233 = v223[l_conversation_id_0];
                    if v233 then
                        local v234 = l_Immutable_0.Set(v233, "fetchedOldestMessage", true);
                        v223 = l_Immutable_0.Set(v223, v234.id, v234);
                    end;
                end;
                return v223;
            end;
        end;
    end, 
    [v3.rodux.GetNewerMessages.Succeeded.name] = function(v235, v236) --[[ Line: 575 ]]
        -- upvalues: v95 (copy), v109 (copy), v71 (copy)
        local l_conversation_id_1 = v236.queryArgs.conversation_id;
        local l_responseBody_8 = v236.responseBody;
        local v239 = v235[l_conversation_id_1];
        if not v239 then
            return v235;
        else
            assert(v239, "FFlagLuauTinyControlFlowAnalysis");
            local v240 = v239.previousCursor or nil;
            local v241 = v239.nextCursor or nil;
            if not l_responseBody_8 then
                return v235;
            else
                local v242 = v95(l_conversation_id_1, l_responseBody_8.messages);
                if v241 == nil then
                    v241 = if l_responseBody_8.next_cursor == "" then nil else l_responseBody_8.next_cursor;
                end;
                local v243 = if l_responseBody_8.previous_cursor == "" then nil else l_responseBody_8.previous_cursor;
                if v243 then
                    v240 = v243;
                end;
                local v244 = v109(v239, v242);
                local v245 = {
                    messages = v242, 
                    nextCursor = v241, 
                    previousCursor = v240, 
                    shouldMarkConversationUnread = v244
                };
                return (v71(v235, l_conversation_id_1, v245));
            end;
        end;
    end, 
    [v29.GetMessages.Succeeded.name] = function(v246, v247) --[[ Line: 617 ]]
        -- upvalues: l_Functional_0 (copy), v36 (copy), l_Players_0 (copy), v71 (copy), l_Immutable_0 (copy)
        local l_conversationId_4 = v247.queryArgs.conversationId;
        local l_responseBody_9 = v247.responseBody;
        local v250;
        if not l_responseBody_9 then
            v250 = {};
        else
            local v251 = nil;
            do
                local l_v251_0 = v251;
                v250 = l_Functional_0.MapReverse(l_responseBody_9, function(v253) --[[ Line: 195 ]]
                    -- upvalues: v36 (ref), l_conversationId_4 (copy), l_v251_0 (ref)
                    local v254 = v36.fromWeb(v253, l_conversationId_4, l_v251_0);
                    l_v251_0 = v254.id;
                    return v254;
                end);
            end;
        end;
        l_responseBody_9 = {
            messages = v250
        };
        local v255 = v250 and v250[#v250] or nil;
        l_responseBody_9.shouldMarkConversationUnread = not (v255 and v255.senderTargetId == tostring(l_Players_0.LocalPlayer.UserId) or false);
        v246 = v71(v246, l_conversationId_4, l_responseBody_9);
        local l_pageSize_0 = v247.queryArgs.pageSize;
        if l_pageSize_0 and #v250 < l_pageSize_0 then
            local v257 = v246[l_conversationId_4];
            if not v257 then
                return v246;
            else
                assert(v257, "FFlagLuauTinyControlFlowAnalysis");
                v255 = v246[l_conversationId_4];
                if v255 then
                    local v258 = l_Immutable_0.Set(v255, "fetchedOldestMessage", true);
                    v246 = l_Immutable_0.Set(v246, v258.id, v258);
                end;
            end;
        end;
        return v246;
    end, 
    [v29.GetLatestMessages.Succeeded.name] = function(v259, v260) --[[ Line: 643 ]]
        -- upvalues: l_Functional_0 (copy), v36 (copy), v71 (copy)
        local l_responseBody_10 = v260.responseBody;
        for _, v263 in ipairs(l_responseBody_10) do
            local v264 = tostring(v263.conversationId);
            local l_chatMessages_0 = v263.chatMessages;
            local v266;
            if not l_chatMessages_0 then
                v266 = {};
            else
                local v267 = nil;
                do
                    local l_v267_0 = v267;
                    v266 = l_Functional_0.MapReverse(l_chatMessages_0, function(v269) --[[ Line: 195 ]]
                        -- upvalues: v36 (ref), v264 (copy), l_v267_0 (ref)
                        local v270 = v36.fromWeb(v269, v264, l_v267_0);
                        l_v267_0 = v270.id;
                        return v270;
                    end);
                end;
            end;
            l_chatMessages_0 = {
                messages = v266
            };
            v259 = v71(v259, v264, l_chatMessages_0);
        end;
        return v259;
    end, 
    [v3.rodux.GetConversationDetails.Succeeded.name] = function(v271, v272) --[[ Line: 655 ]]
        -- upvalues: v32 (copy), v42 (copy), v98 (copy), v5 (copy), v36 (copy), v71 (copy)
        local v273 = v272.responseBody.conversations[1];
        if not v273 then
            return v271;
        else
            local v274 = v32.fromChannelsApi(v273);
            v271 = v42(v271, v274);
            local v275 = v98(v273);
            if v275 and #v275 > 0 then
                local v277 = {
                    messages = v5.Array.map(v275, function(v276) --[[ Line: 669 ]]
                        -- upvalues: v36 (ref), v274 (copy)
                        return v36.fromChannelsApi(v276, v274.id);
                    end)
                };
                v271 = v71(v271, v274.id, v277);
            end;
            return v271;
        end;
    end, 
    [v3.rodux.MultiGetConversationDetails.Succeeded.name] = function(v278, v279) --[[ Line: 682 ]]
        -- upvalues: v32 (copy), v42 (copy), v98 (copy), v5 (copy), v36 (copy), v71 (copy)
        local l_responseBody_11 = v279.responseBody;
        if not l_responseBody_11 or not l_responseBody_11.conversations then
            return v278;
        else
            for _, v282 in l_responseBody_11.conversations do
                local v283 = v32.fromChannelsApi(v282);
                v278 = v42(v278, v283);
                local v284 = v98(v282);
                if v284 and #v284 > 0 then
                    local v286 = {
                        messages = v5.Array.map(v284, function(v285) --[[ Line: 694 ]]
                            -- upvalues: v36 (ref), v283 (copy)
                            return v36.fromChannelsApi(v285, v283.id);
                        end)
                    };
                    v278 = v71(v278, v283.id, v286);
                end;
            end;
            return v278;
        end;
    end, 
    [v3.rodux.MarkConversation.Succeeded.name] = function(v287, v288) --[[ Line: 707 ]]
        -- upvalues: v52 (copy)
        local v289 = v288.postBody.conversation_ids[1];
        return (v52(v287, v289));
    end, 
    [v29.MarkAsRead.Succeeded.name] = function(v290, v291) --[[ Line: 711 ]]
        -- upvalues: v52 (copy)
        local l_conversationId_5 = v291.postBody.conversationId;
        return (v52(v290, l_conversationId_5));
    end, 
    [v3.rodux.TranslateUserMessage.Succeeded.name] = v44() and function(v293, v294) --[[ Line: 716 ]]
        -- upvalues: v81 (copy)
        local l_content_to_display_0 = v294.responseBody.content_to_display;
        if v294.postBody.conversation_id and v294.postBody.message_id then
            return v81(v293, v294.postBody.conversation_id, v294.postBody.message_id, l_content_to_display_0);
        else
            return v293;
        end;
    end or nil, 
    [v17.name] = function(_, _) --[[ Line: 732 ]]
        return {};
    end, 
    [v25.name] = function(v298, v299) --[[ Line: 735 ]]
        -- upvalues: l_Immutable_0 (copy)
        if v298[v299.oldFriendConversationId] then
            return l_Immutable_0.Set(v298, v299.oldFriendConversationId, nil);
        else
            return v298;
        end;
    end, 
    [v26.name] = function(v300, v301) --[[ Line: 742 ]]
        -- upvalues: v32 (copy), l_Immutable_0 (copy)
        local v302 = if v301.userId1 ~= "localUserId" then v301.userId1 else if v301.userId2 ~= "localUserId" then v301.userId2 else nil;
        if not v302 then
            return v300;
        else
            assert(v302, "FFlagLuauTinyControlFlowAnalysis");
            local v303 = v32.getFriendConversationId({
                v302
            });
            if v300[v303] then
                return l_Immutable_0.Set(v300, v303, nil);
            else
                return v300;
            end;
        end;
    end, 
    [v30.BlockUserById.Succeeded.name] = l_getFFlagAppChatPCMFixBlocking_0() and function(v304, v305) --[[ Line: 760 ]]
        -- upvalues: v43 (copy), l_Immutable_0 (copy), v32 (copy)
        local v306 = tostring(v305.namedIds.users);
        if not v306 then
            return v304;
        else
            local v307 = v43(v304, v306);
            local l_v304_0 = v304;
            if v307 and v304[v307] then
                l_v304_0 = l_Immutable_0.Set(l_v304_0, v307, nil);
            end;
            local v309 = v32.getFriendConversationId({
                v306
            });
            if v309 and v304[v309] then
                l_v304_0 = l_Immutable_0.Set(v304, v309, nil);
            end;
            return l_v304_0;
        end;
    end or nil, 
    [v27.name] = v40 and function(v310, v311) --[[ Line: 784 ]]
        -- upvalues: v37 (copy), v32 (copy)
        local l_v310_0 = v310;
        for _, v314 in v311.conversationIds do
            local v315 = l_v310_0[v314];
            l_v310_0 = v37.Dictionary.join(l_v310_0, {
                [v314] = v37.Dictionary.join(v315, {
                    messages = v32.getEmptyMessages(), 
                    sendingMessages = v32.getEmptySendingMessages(), 
                    previousCursor = v37.None, 
                    nextCursor = v37.None, 
                    fetchedOldestMessage = false
                })
            });
        end;
        return l_v310_0;
    end or nil, 
    [v28.name] = l_FFlagAppChatEnableDoubleOptIn_0 and function(v316, v317) --[[ Line: 802 ]]
        -- upvalues: l_Immutable_0 (copy)
        local l_conversationId_6 = v317.conversationId;
        local l_moderationType_0 = v317.moderationType;
        local v320 = v316[l_conversationId_6];
        if v320 then
            local v321 = l_Immutable_0.Set(v320, "moderationType", l_moderationType_0);
            return l_Immutable_0.Set(v316, l_conversationId_6, v321);
        else
            return v316;
        end;
    end or nil
});