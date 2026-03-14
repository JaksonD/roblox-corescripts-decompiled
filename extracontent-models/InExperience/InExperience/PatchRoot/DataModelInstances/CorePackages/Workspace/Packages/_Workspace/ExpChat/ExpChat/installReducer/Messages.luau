local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ExpChatShared);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.llama);
local l_List_0 = v5.List;
local l_Dictionary_0 = v5.Dictionary;
local l_Set_0 = v5.Set;
local l_None_0 = v5.None;
local v10 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local v11 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v13 = require(l_Actions_0.IncomingMessageReceived);
local v14 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v15 = require(l_Actions_0.OutgoingMessageSent);
local l_UserMuted_0 = v3.Actions.UserMuted;
local l_UserUnmuted_0 = v3.Actions.UserUnmuted;
local l_PlayerRemoved_0 = v3.Actions.PlayerRemoved;
local v19 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v20 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local v21 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v22 = require(l_Actions_0.BubbleChatSettingsChanged);
local l_ChatWindowMessagesCleared_0 = v3.Actions.ChatWindowMessagesCleared;
local v24 = require(l_Actions_0.ChatTranslationGlobalToggled);
local v25 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v26 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleCreated);
local v27 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleTextUpdated);
local v28 = require(l_script_FirstAncestor_0.Actions.HiddenMessageReceived);
local v29 = require(l_script_FirstAncestor_0.Actions.HiddenMessagesCleared);
local v30 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFOMOUpsell);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v33 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeLowerBound);
local v34 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeUpperBound);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v36 = require(l_script_FirstAncestor_0.Flags.FIntExpChatHiddenMessageMaxLength);
local l_FFlagExpChatUseChatConfigStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseChatConfigStore;
local v38 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local v40 = require(l_script_FirstAncestor_0.getTextAndTranslation);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_TextChatService_0 = game:GetService("TextChatService");
getChatTranslationEnabled = function() --[[ Line: 54 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v45 = {
    canLocalUserChat = false, 
    isBubbleChatEnabled = false, 
    _mutedUserIds = {}, 
    messageLimit = 50, 
    windowMessagesInOrder = {}, 
    windowMessagesInOrderByTabId = {}, 
    byMessageId = {}, 
    bubbleMessagesInOrderBySenderId = {}, 
    mockUserIdToPartOrModel = {}, 
    partOrModelToMockUserId = {}, 
    messagesBySenderId = {}
};
local function v76(v46, v47) --[[ Line: 112 ]] --[[ Name: mapByMessageIdInOrderHelper ]]
    -- upvalues: v10 (copy), l_None_0 (copy), l_HttpService_0 (copy), l_Dictionary_0 (copy), v35 (copy), v30 (copy), l_List_0 (copy), v31 (copy), v39 (copy)
    if v10(v47.text) and v47.status ~= Enum.TextChatMessageStatus.Floodchecked and v47.status ~= Enum.TextChatMessageStatus.MessageTooLong then
        return v46;
    else
        local l_partOrModel_0 = v47.partOrModel;
        local l_userId_0 = v47.userId;
        local l_messageId_0 = v47.messageId;
        local v51 = if v47.textChannel then v47.textChannel.Name == "RBXSystem" and "RBXGeneral" or v47.textChannel.Name else l_None_0;
        local l_windowMessagesInOrder_0 = v46.windowMessagesInOrder;
        local v53 = v46.windowMessagesInOrderByTabId[v51] or {};
        local l_byMessageId_0 = v46.byMessageId;
        local l_bubbleMessagesInOrderBySenderId_0 = v46.bubbleMessagesInOrderBySenderId;
        local l_mockUserIdToPartOrModel_0 = v46.mockUserIdToPartOrModel;
        local l_partOrModelToMockUserId_0 = v46.partOrModelToMockUserId;
        local l_messagesBySenderId_0 = v46.messagesBySenderId;
        if not l_userId_0 and l_partOrModel_0 then
            l_userId_0 = l_partOrModelToMockUserId_0[l_partOrModel_0];
            if not l_userId_0 then
                l_userId_0 = l_HttpService_0:GenerateGUID(false);
                l_mockUserIdToPartOrModel_0 = l_Dictionary_0.join(l_mockUserIdToPartOrModel_0, {
                    [l_userId_0] = l_partOrModel_0
                });
                l_partOrModelToMockUserId_0 = l_Dictionary_0.join(l_partOrModelToMockUserId_0, {
                    [l_partOrModel_0] = l_userId_0
                });
            end;
        end;
        local v59 = nil;
        local v60 = nil;
        if v35 then
            v59 = v47.wasRewritten;
            v60 = v47.originalText;
        end;
        if l_byMessageId_0[l_messageId_0] then
            local v61 = {
                userId = l_userId_0, 
                prefixText = v47.prefixText, 
                text = v47.text, 
                translation = v47.translation, 
                useTranslation = v47.useTranslation, 
                textChannel = v47.textChannel, 
                messageId = l_messageId_0, 
                status = v47.status, 
                timestamp = v47.timestamp, 
                isVisibleInBubbleChat = v47.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v47.isVisibleInChatWindow, 
                shouldOverrideBubbleChatSettings = v47.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v47.bubbleChatMessageProperties, 
                chatWindowMessageProperties = v47.chatWindowMessageProperties, 
                textChatMessageInstance = if v30() then v47.textChatMessageInstance else nil, 
                wasRewritten = v59, 
                originalText = v60
            };
            l_byMessageId_0 = l_Dictionary_0.join(l_byMessageId_0, {
                [l_messageId_0] = v61
            });
            if l_userId_0 and l_messagesBySenderId_0[l_userId_0] then
                local v64 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v62, _) --[[ Line: 187 ]]
                    -- upvalues: l_messageId_0 (copy)
                    return v62.messageId == l_messageId_0;
                end);
                if v64 and v64 > 0 then
                    l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                        [l_userId_0] = l_List_0.set(l_messagesBySenderId_0[l_userId_0], v64, v61)
                    });
                end;
            end;
            if v47.status == Enum.TextChatMessageStatus.Floodchecked or v47.status == Enum.TextChatMessageStatus.MessageTooLong then
                l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, l_List_0.count(l_windowMessagesInOrder_0));
                v53 = l_List_0.removeIndex(v53, l_List_0.count(v53));
                l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, v47.messageId);
                if l_userId_0 then
                    local v67 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v65, _) --[[ Line: 207 ]]
                        -- upvalues: l_messageId_0 (copy)
                        return v65.messageId == l_messageId_0;
                    end);
                    if v67 and v67 > 0 then
                        l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                            [l_userId_0] = l_List_0.removeIndex(l_messagesBySenderId_0[l_userId_0], v67)
                        });
                    end;
                end;
            end;
            return l_Dictionary_0.join(v46, {
                windowMessagesInOrder = l_windowMessagesInOrder_0, 
                windowMessagesInOrderByTabId = l_Dictionary_0.join(v46.windowMessagesInOrderByTabId, {
                    [v51] = v53
                }), 
                byMessageId = l_byMessageId_0, 
                messagesBySenderId = l_messagesBySenderId_0
            });
        else
            if #l_windowMessagesInOrder_0 == v46.messageLimit and v47.isVisibleInChatWindow then
                local v68 = l_windowMessagesInOrder_0[1];
                local v69 = if l_byMessageId_0[v68] then l_byMessageId_0[v68].userId else nil;
                l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, 1);
                do
                    local l_v68_0 = v68;
                    if v69 then
                        if l_messagesBySenderId_0 ~= nil and l_messagesBySenderId_0[v69] then
                            local v73 = l_List_0.findWhere(l_messagesBySenderId_0[v69], function(v71, _) --[[ Line: 235 ]]
                                -- upvalues: l_v68_0 (ref)
                                return v71.messageId == l_v68_0;
                            end);
                            if v73 and v73 > 0 then
                                l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                                    [v69] = l_List_0.removeIndex(l_messagesBySenderId_0[v69], v73)
                                });
                            end;
                            if l_Dictionary_0.count(l_messagesBySenderId_0[v69]) == 0 then
                                l_messagesBySenderId_0 = l_Dictionary_0.removeKey(l_messagesBySenderId_0, v69);
                                if l_mockUserIdToPartOrModel_0[v69] then
                                    local v74 = l_mockUserIdToPartOrModel_0[v69];
                                    if l_partOrModelToMockUserId_0[v74] then
                                        l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v74);
                                    end;
                                    l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v69);
                                end;
                            end;
                        elseif l_bubbleMessagesInOrderBySenderId_0 ~= nil and l_bubbleMessagesInOrderBySenderId_0[v69] then
                            l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                                [v69] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[v69], l_v68_0)
                            });
                            if l_Dictionary_0.count(l_bubbleMessagesInOrderBySenderId_0[v69]) == 0 then
                                l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.removeKey(l_bubbleMessagesInOrderBySenderId_0, v69);
                                if l_mockUserIdToPartOrModel_0[v69] then
                                    local v75 = l_mockUserIdToPartOrModel_0[v69];
                                    if l_partOrModelToMockUserId_0[v75] then
                                        l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v75);
                                    end;
                                    l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v69);
                                end;
                            end;
                        end;
                    end;
                    if #v53 == v46.messageLimit then
                        l_v68_0 = v53[1];
                        v53 = l_List_0.removeIndex(v53, 1);
                        l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, l_v68_0);
                    end;
                end;
            end;
            if v47.isVisibleInChatWindow then
                l_windowMessagesInOrder_0 = l_List_0.append(l_windowMessagesInOrder_0, l_messageId_0);
                v53 = l_List_0.append(v53, l_messageId_0);
            end;
            return l_Dictionary_0.join(v46, {
                windowMessagesInOrder = l_windowMessagesInOrder_0, 
                windowMessagesInOrderByTabId = l_Dictionary_0.join(v46.windowMessagesInOrderByTabId, {
                    [v51] = v53
                }), 
                byMessageId = l_Dictionary_0.join(l_byMessageId_0, {
                    [l_messageId_0] = {
                        userId = l_userId_0, 
                        prefixText = v47.prefixText, 
                        text = v47.text, 
                        translation = v47.translation, 
                        useTranslation = v47.useTranslation, 
                        messageId = l_messageId_0, 
                        status = v47.status, 
                        timestamp = v47.timestamp, 
                        isVisibleInBubbleChat = v47.isVisibleInBubbleChat, 
                        isVisibleInChatWindow = v47.isVisibleInChatWindow, 
                        partOrModel = l_partOrModel_0, 
                        shouldOverrideBubbleChatSettings = v47.shouldOverrideBubbleChatSettings, 
                        bubbleChatMessageProperties = v47.bubbleChatMessageProperties, 
                        chatWindowMessageProperties = v47.chatWindowMessageProperties, 
                        textChannel = v47.textChannel, 
                        textChatMessageInstance = if v30() then v47.textChatMessageInstance else nil, 
                        isHiddenMessage = if not not v31 or v39() then v47.isHiddenMessage else nil, 
                        wasRewritten = v59, 
                        originalText = v60
                    }
                }), 
                mockUserIdToPartOrModel = l_mockUserIdToPartOrModel_0, 
                partOrModelToMockUserId = l_partOrModelToMockUserId_0, 
                messagesBySenderId = if l_userId_0 then l_Dictionary_0.join(l_messagesBySenderId_0, {
                    [l_userId_0] = l_List_0.append(l_messagesBySenderId_0[l_userId_0] or {}, {
                        userId = l_userId_0, 
                        prefixText = v47.prefixText, 
                        text = v47.text, 
                        translation = v47.translation, 
                        useTranslation = v47.useTranslation, 
                        messageId = l_messageId_0, 
                        status = v47.status, 
                        timestamp = v47.timestamp, 
                        isVisibleInBubbleChat = v47.isVisibleInBubbleChat, 
                        isVisibleInChatWindow = v47.isVisibleInChatWindow, 
                        partOrModel = l_partOrModel_0, 
                        shouldOverrideBubbleChatSettings = v47.shouldOverrideBubbleChatSettings, 
                        bubbleChatMessageProperties = v47.bubbleChatMessageProperties, 
                        chatWindowMessageProperties = v47.chatWindowMessageProperties, 
                        textChannel = v47.textChannel, 
                        textChatMessageInstance = if v30() then v47.textChatMessageInstance else nil, 
                        wasRewritten = v59, 
                        originalText = v60
                    })
                }) else nil
            });
        end;
    end;
end;
local function v85(v77, v78) --[[ Line: 350 ]] --[[ Name: globalToggleTranslations ]]
    -- upvalues: v30 (copy), v35 (copy), l_Dictionary_0 (copy)
    local l_useTranslation_0 = v78.useTranslation;
    local l_byMessageId_1 = v77.byMessageId;
    local v81 = {};
    for v82, _ in pairs(l_byMessageId_1) do
        local v84 = l_byMessageId_1[v82];
        if v84 ~= nil then
            v81[v82] = {
                prefixText = v84.prefixText, 
                text = v84.text, 
                translation = v84.translation, 
                useTranslation = l_useTranslation_0, 
                messageId = v84.messageId, 
                status = v84.status, 
                timestamp = v84.timestamp, 
                isVisibleInBubbleChat = v84.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v84.isVisibleInChatWindow, 
                partOrModel = v84.partOrModel, 
                shouldOverrideBubbleChatSettings = v84.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v84.bubbleChatMessageProperties, 
                chatWindowMessageProperties = v84.chatWindowMessageProperties, 
                userId = v84.userId, 
                textChannel = v84.textChannel, 
                textChatMessageInstance = if v30() then v84.textChatMessageInstance else nil, 
                wasRewritten = if v35 then v84.wasRewritten else nil, 
                originalText = if v35 then v84.originalText else nil
            };
        end;
    end;
    return l_Dictionary_0.join(v77, {
        byMessageId = l_Dictionary_0.join(l_byMessageId_1, v81)
    });
end;
local function v92(v86, v87) --[[ Line: 389 ]] --[[ Name: individualToggleTranslation ]]
    -- upvalues: l_Dictionary_0 (copy), v30 (copy), v35 (copy)
    local l_useTranslation_1 = v87.useTranslation;
    local l_messageId_1 = v87.messageId;
    local l_byMessageId_2 = v86.byMessageId;
    local v91 = l_byMessageId_2[l_messageId_1];
    if v91 ~= nil then
        return l_Dictionary_0.join(v86, {
            byMessageId = l_Dictionary_0.join(l_byMessageId_2, {
                [l_messageId_1] = {
                    prefixText = v91.prefixText, 
                    text = v91.text, 
                    translation = v91.translation, 
                    useTranslation = l_useTranslation_1, 
                    messageId = v91.messageId, 
                    status = v91.status, 
                    timestamp = v91.timestamp, 
                    isVisibleInBubbleChat = v91.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v91.isVisibleInChatWindow, 
                    partOrModel = v91.partOrModel, 
                    shouldOverrideBubbleChatSettings = v91.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v91.bubbleChatMessageProperties, 
                    chatWindowMessageProperties = v91.chatWindowMessageProperties, 
                    userId = v91.userId, 
                    textChannel = v91.textChannel, 
                    textChatMessageInstance = if v30() then v91.textChatMessageInstance else nil, 
                    wasRewritten = if v35 then v91.wasRewritten else nil, 
                    originalText = if v35 then v91.originalText else nil
                }
            })
        });
    else
        return nil;
    end;
end;
local function v97(v93, v94) --[[ Line: 428 ]] --[[ Name: mapByMessageIdInOrderBubbleChat ]]
    -- upvalues: v76 (copy)
    local l_bubbleChatMessageTable_0 = v94.bubbleChatMessageTable;
    local v96 = {
        userId = l_bubbleChatMessageTable_0.bubbleChatMessageUserId, 
        prefixText = "", 
        text = l_bubbleChatMessageTable_0.message, 
        translation = l_bubbleChatMessageTable_0.translation, 
        useTranslation = getChatTranslationEnabled(), 
        messageId = l_bubbleChatMessageTable_0.bubbleChatMessageId, 
        status = Enum.TextChatMessageStatus.Success, 
        timestamp = l_bubbleChatMessageTable_0.timestamp, 
        partOrModel = l_bubbleChatMessageTable_0.partOrModel, 
        shouldOverrideBubbleChatSettings = true, 
        isVisibleInBubbleChat = true, 
        isVisibleInChatWindow = false, 
        bubbleChatMessageProperties = l_bubbleChatMessageTable_0.bubbleChatMessageProperties
    };
    return v76(v93, v96);
end;
local function v110(v98, v99) --[[ Line: 451 ]] --[[ Name: mapByMessageIdInOrder ]]
    -- upvalues: v35 (copy), v40 (copy), l_Set_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v38 (copy), v30 (copy), v76 (copy)
    local l_textChatMessage_0 = v99.textChatMessage;
    local v101 = nil;
    local v102 = nil;
    if v35 then
        local v103, v104 = v40(l_textChatMessage_0);
        v101 = v103;
        v102 = v104;
    else
        v101 = l_textChatMessage_0.Text;
        v102 = l_textChatMessage_0.Translation;
    end;
    local v105 = if l_textChatMessage_0.TextSource then tostring(l_textChatMessage_0.TextSource.UserId) else nil;
    local v106 = nil;
    v106 = v105 == nil or if v98.canLocalUserChat then not (l_textChatMessage_0.Status ~= Enum.TextChatMessageStatus.Success) or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending else false;
    local v107 = if v105 then l_Set_0.has(v98._mutedUserIds, v105) else false;
    v106 = v106 and not v107;
    local v108 = false;
    if (if l_FFlagExpChatUseChatConfigStore_0 then v38(false).getIsBubbleChatEnabled(false) else v98.isBubbleChatEnabled) and v106 and (l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Success or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending) then
        v108 = true;
    end;
    local v109 = {
        userId = v105, 
        prefixText = l_textChatMessage_0.PrefixText, 
        text = v101, 
        translation = v102, 
        useTranslation = getChatTranslationEnabled(), 
        textChannel = l_textChatMessage_0.TextChannel, 
        messageId = l_textChatMessage_0.MessageId, 
        status = l_textChatMessage_0.Status, 
        timestamp = l_textChatMessage_0.Timestamp, 
        isVisibleInBubbleChat = v108, 
        isVisibleInChatWindow = v106, 
        bubbleChatMessageProperties = l_textChatMessage_0.BubbleChatMessageProperties, 
        chatWindowMessageProperties = l_textChatMessage_0.ChatWindowMessageProperties, 
        textChatMessageInstance = if v30() then l_textChatMessage_0 else nil, 
        wasRewritten = if v35 then l_textChatMessage_0.WasRewritten else nil, 
        originalText = if v35 then l_textChatMessage_0.OriginalText else nil
    };
    return v76(v98, v109);
end;
return v4.createReducer(v45, {
    [v13.name] = v110, 
    [v14.name] = v97, 
    [v15.name] = v110, 
    [l_UserMuted_0.name] = function(v111, v112) --[[ Line: 588 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v111, {
            _mutedUserIds = l_Set_0.add(v111._mutedUserIds, v112.userId)
        });
    end, 
    [l_UserUnmuted_0.name] = function(v113, v114) --[[ Line: 593 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v113, {
            _mutedUserIds = l_Set_0.subtract(v113._mutedUserIds, v114.userId)
        });
    end, 
    [l_PlayerRemoved_0.name] = function(v115, v116) --[[ Line: 598 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        local v119 = l_Dictionary_0.filter(v115.bubbleMessagesInOrderBySenderId, function(_, v118) --[[ Line: 601 ]]
            -- upvalues: v116 (copy)
            return v118 ~= v116.userId;
        end);
        local v122 = l_Dictionary_0.filter(v115.messagesBySenderId, function(_, v121) --[[ Line: 605 ]]
            -- upvalues: v116 (copy)
            return v121 ~= v116.userId;
        end);
        local v123 = not l_Set_0.has(v115._mutedUserIds, v116.userId);
        if #v119 == 0 and #v122 == 0 and v123 then
            return v115;
        else
            return l_Dictionary_0.join(v115, {
                messagesBySenderId = v122, 
                _mutedUserIds = l_Set_0.subtract(v115._mutedUserIds, v116.userId)
            });
        end;
    end, 
    [v19.name] = function(v124, v125) --[[ Line: 618 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v124, {
            canLocalUserChat = v125.canUserChat
        });
    end, 
    [v20.name] = function(v126, _) --[[ Line: 621 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v126, {
            canLocalUserChat = false
        });
    end, 
    [v21.name] = function(v128, v129) --[[ Line: 624 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v128, {
            isBubbleChatEnabled = if v129.bubbleChatSettings.Enabled then v129.bubbleChatSettings.Enabled else false
        });
    end, 
    [v22.name] = function(v130, v131) --[[ Line: 631 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v131.property ~= "Enabled" then
            return v130;
        else
            local v133 = l_Dictionary_0.map(v130.byMessageId, function(v132) --[[ Line: 636 ]]
                -- upvalues: l_Dictionary_0 (ref), v131 (copy)
                if v132.shouldOverrideBubbleChatSettings then
                    return v132;
                else
                    return l_Dictionary_0.join(v132, {
                        isVisibleInBubbleChat = v131.value and v132.isVisibleInChatWindow
                    });
                end;
            end);
            return l_Dictionary_0.join(v130, {
                byMessageId = v133, 
                isBubbleChatEnabled = v131.value
            });
        end;
    end, 
    [l_ChatWindowMessagesCleared_0.name] = function(v134, _) --[[ Line: 651 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v137 = l_Dictionary_0.map(v134.byMessageId, function(v136) --[[ Line: 652 ]]
            -- upvalues: l_Dictionary_0 (ref)
            return l_Dictionary_0.join(v136, {
                isVisibleInChatWindow = false
            });
        end);
        return l_Dictionary_0.join(v134, {
            windowMessagesInOrder = {}, 
            windowMessagesInOrderByTabId = {}, 
            byMessageId = v137
        });
    end, 
    [v24.name] = v85, 
    [v25.name] = v92, 
    [v26.name] = function(v138, v139) --[[ Line: 522 ]] --[[ Name: mapByMessageIdInOrderLegacyBubbleChat ]]
        -- upvalues: v76 (copy)
        local l_messageData_0 = v139.messageData;
        local v141 = if l_messageData_0.timestamp then DateTime.fromUnixTimestampMillis(l_messageData_0.timestamp) else DateTime.now();
        local v142 = {
            userId = l_messageData_0.userId, 
            prefixText = "", 
            text = l_messageData_0.text, 
            messageId = l_messageData_0.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v141, 
            partOrModel = l_messageData_0.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false
        };
        return v76(v138, v142);
    end, 
    [v27.name] = function(v143, v144) --[[ Line: 666 ]]
        -- upvalues: l_Dictionary_0 (copy), l_List_0 (copy)
        local l_byMessageId_3 = v143.byMessageId;
        local l_messagesBySenderId_1 = v143.messagesBySenderId;
        local l_messageId_2 = v144.messageId;
        local l_newText_0 = v144.newText;
        if l_byMessageId_3[l_messageId_2] then
            local v149 = l_byMessageId_3[l_messageId_2];
            v149.text = l_newText_0;
            l_byMessageId_3 = l_Dictionary_0.join(l_byMessageId_3, {
                [l_messageId_2] = v149
            });
            local l_userId_1 = v149.userId;
            if l_userId_1 and l_messagesBySenderId_1[l_userId_1] then
                local v153 = l_List_0.findWhere(l_messagesBySenderId_1[l_userId_1], function(v151, _) --[[ Line: 680 ]]
                    -- upvalues: l_messageId_2 (copy)
                    return v151.messageId == l_messageId_2;
                end);
                if v153 and v153 > 0 then
                    l_messagesBySenderId_1 = l_Dictionary_0.join(l_messagesBySenderId_1, {
                        [l_userId_1] = l_List_0.set(l_messagesBySenderId_1[l_userId_1], v153, v149)
                    });
                end;
            end;
        end;
        return l_Dictionary_0.join(v143, {
            byMessageId = l_byMessageId_3, 
            messagesBySenderId = l_messagesBySenderId_1
        });
    end, 
    [v28.name] = function(v154, v155) --[[ Line: 546 ]] --[[ Name: mapByMessageIdInOrderHiddenMessage ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v36 (copy), v33 (copy), v34 (copy), v11 (copy), v30 (copy), v76 (copy)
        local l_userMessageIntent_0 = v155.userMessageIntent;
        local v157 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and string.len(l_userMessageIntent_0.Text) > v36 then v36 else string.len(l_userMessageIntent_0.Text);
        local v158 = math.max(v33, -(v157 - 1));
        local l_v34_0 = v34;
        local v160 = math.random(v158, l_v34_0);
        local v161 = string.rep(if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() then v11.INTERPUNCT_TEXT else v11.DOT_TEXT, v157 + v160);
        local v162 = {
            userId = nil, 
            prefixText = v11.LOCK_EMOJI .. " :", 
            text = v161, 
            textChannel = l_userMessageIntent_0.TextChannel, 
            messageId = l_userMessageIntent_0.MessageId, 
            status = l_userMessageIntent_0.Status, 
            timestamp = l_userMessageIntent_0.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v30() then l_userMessageIntent_0 else nil, 
            isHiddenMessage = true
        };
        return v76(v154, v162);
    end, 
    [v29.name] = function(v163, _) --[[ Line: 697 ]]
        -- upvalues: v32 (copy), l_Dictionary_0 (copy), l_List_0 (copy)
        if not v32 then
            return v163;
        else
            local v166 = l_Dictionary_0.map(v163.byMessageId, function(v165) --[[ Line: 702 ]]
                -- upvalues: l_Dictionary_0 (ref)
                if v165.isHiddenMessage then
                    return l_Dictionary_0.join(v165, {
                        isVisibleInChatWindow = false
                    });
                else
                    return v165;
                end;
            end);
            local v169 = l_List_0.filter(v163.windowMessagesInOrder, function(v167) --[[ Line: 712 ]]
                -- upvalues: v166 (copy)
                local v168 = v166[v167];
                return v168 and not v168.isHiddenMessage;
            end);
            local v173 = l_Dictionary_0.map(v163.windowMessagesInOrderByTabId, function(v170) --[[ Line: 719 ]]
                -- upvalues: l_List_0 (ref), v166 (copy)
                return l_List_0.filter(v170, function(v171) --[[ Line: 720 ]]
                    -- upvalues: v166 (ref)
                    local v172 = v166[v171];
                    return v172 and not v172.isHiddenMessage;
                end);
            end);
            return l_Dictionary_0.join(v163, {
                windowMessagesInOrder = v169, 
                windowMessagesInOrderByTabId = v173, 
                byMessageId = v166
            });
        end;
    end
});