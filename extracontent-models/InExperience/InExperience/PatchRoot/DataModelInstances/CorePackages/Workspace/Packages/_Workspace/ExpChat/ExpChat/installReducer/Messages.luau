local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ExpChatShared);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.llama);
local l_List_0 = v6.List;
local l_Dictionary_0 = v6.Dictionary;
local l_Set_0 = v6.Set;
local l_None_0 = v6.None;
local v11 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local v12 = require(l_script_FirstAncestor_0.sanitizeForRichText);
local v13 = require(l_script_FirstAncestor_0.generateRichSystemMessageTextFormat);
local v14 = require(l_script_FirstAncestor_0.Config);
local _ = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v17 = require(l_Actions_0.IncomingMessageReceived);
local v18 = require(l_Actions_0.UniverseChatSystemMessageAdded);
local v19 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v20 = require(l_Actions_0.OutgoingMessageSent);
local l_UserMuted_0 = v4.Actions.UserMuted;
local l_UserUnmuted_0 = v4.Actions.UserUnmuted;
local l_PlayerRemoved_0 = v4.Actions.PlayerRemoved;
local v24 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v25 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local v26 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v27 = require(l_Actions_0.BubbleChatSettingsChanged);
local l_ChatWindowMessagesCleared_0 = v4.Actions.ChatWindowMessagesCleared;
local v29 = require(l_Actions_0.ChatTranslationGlobalToggled);
local v30 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v31 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleCreated);
local v32 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleTextUpdated);
local v33 = require(l_script_FirstAncestor_0.Actions.HiddenMessageReceived);
local v34 = require(l_script_FirstAncestor_0.Actions.HiddenMessagesCleared);
local v35 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFOMOUpsell);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v38 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeLowerBound);
local v39 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeUpperBound);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatSummaryOnLua);
local v42 = require(l_script_FirstAncestor_0.Flags.FIntExpChatHiddenMessageMaxLength);
local l_FFlagExpChatUseChatConfigStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseChatConfigStore;
local v44 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v45 = require(l_script_FirstAncestor_0.computeNameColor);
local v46 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v4.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_FFlagExpChatDisableUniverseBubbleChat_0 = v4.Flags.FFlagExpChatDisableUniverseBubbleChat;
local l_GetFFlagExpChatSyntheticSystemMessageRichText_0 = v4.Flags.GetFFlagExpChatSyntheticSystemMessageRichText;
local v50 = require(l_script_FirstAncestor_0.getTextAndTranslation);
local v51 = require(l_Actions_0.ChannelTabsConfigurationEnabled);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_TextChatService_0 = game:GetService("TextChatService");
getChatTranslationEnabled = function() --[[ Line: 66 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 67 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v56 = {
    canLocalUserChat = false, 
    isBubbleChatEnabled = false, 
    _mutedUserIds = {}, 
    channelTabsConfigurationEnabled = false, 
    messageLimit = 50, 
    windowMessagesInOrder = {}, 
    windowMessagesInOrderByTabId = {}, 
    byMessageId = {}, 
    bubbleMessagesInOrderBySenderId = {}, 
    mockUserIdToPartOrModel = {}, 
    partOrModelToMockUserId = {}, 
    messagesBySenderId = {}
};
local function v60(v57, v58, v59) --[[ Line: 127 ]] --[[ Name: resolveChannelNameForMapOrder ]]
    -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_None_0 (copy)
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        if v59 then
            return v59;
        elseif v58.textChannel then
            if v58.textChannel.Name == "RBXSystem" or not v57.channelTabsConfigurationEnabled then
                return "RBXGeneral";
            else
                return v58.textChannel.Name;
            end;
        else
            return l_None_0;
        end;
    elseif v58.textChannel then
        if v58.textChannel.Name == "RBXSystem" then
            return "RBXGeneral";
        else
            return v58.textChannel.Name;
        end;
    else
        return l_None_0;
    end;
end;
local function v92(v61, v62, v63) --[[ Line: 147 ]] --[[ Name: mapByMessageIdInOrderHelper ]]
    -- upvalues: v11 (copy), v60 (copy), l_HttpService_0 (copy), l_Dictionary_0 (copy), v40 (copy), v35 (copy), v41 (copy), l_List_0 (copy), v36 (copy), v46 (copy)
    if v11(v62.text) and v62.status ~= Enum.TextChatMessageStatus.Floodchecked and v62.status ~= Enum.TextChatMessageStatus.MessageTooLong then
        return v61;
    else
        local l_partOrModel_0 = v62.partOrModel;
        local l_userId_0 = v62.userId;
        local l_messageId_0 = v62.messageId;
        local v67 = v60(v61, v62, v63);
        local l_windowMessagesInOrder_0 = v61.windowMessagesInOrder;
        local v69 = v61.windowMessagesInOrderByTabId[v67] or {};
        local l_byMessageId_0 = v61.byMessageId;
        local l_bubbleMessagesInOrderBySenderId_0 = v61.bubbleMessagesInOrderBySenderId;
        local l_mockUserIdToPartOrModel_0 = v61.mockUserIdToPartOrModel;
        local l_partOrModelToMockUserId_0 = v61.partOrModelToMockUserId;
        local l_messagesBySenderId_0 = v61.messagesBySenderId;
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
        local v75 = nil;
        local v76 = nil;
        if v40 then
            v75 = v62.wasRewritten;
            v76 = v62.originalText;
        end;
        if l_byMessageId_0[l_messageId_0] then
            local v77 = {
                userId = l_userId_0, 
                prefixText = v62.prefixText, 
                text = v62.text, 
                translation = v62.translation, 
                useTranslation = v62.useTranslation, 
                textChannel = v62.textChannel, 
                messageId = l_messageId_0, 
                status = v62.status, 
                timestamp = v62.timestamp, 
                isVisibleInBubbleChat = v62.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v62.isVisibleInChatWindow, 
                shouldOverrideBubbleChatSettings = v62.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v62.bubbleChatMessageProperties, 
                chatWindowMessageProperties = v62.chatWindowMessageProperties, 
                textChatMessageInstance = if v35() then v62.textChatMessageInstance else nil, 
                wasRewritten = v75, 
                originalText = v76, 
                chatActionType = if v41 then v62.chatActionType else nil
            };
            l_byMessageId_0 = l_Dictionary_0.join(l_byMessageId_0, {
                [l_messageId_0] = v77
            });
            if l_userId_0 and l_messagesBySenderId_0[l_userId_0] then
                local v80 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v78, _) --[[ Line: 222 ]]
                    -- upvalues: l_messageId_0 (copy)
                    return v78.messageId == l_messageId_0;
                end);
                if v80 and v80 > 0 then
                    l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                        [l_userId_0] = l_List_0.set(l_messagesBySenderId_0[l_userId_0], v80, v77)
                    });
                end;
            end;
            if v62.status == Enum.TextChatMessageStatus.Floodchecked or v62.status == Enum.TextChatMessageStatus.MessageTooLong then
                l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, l_List_0.count(l_windowMessagesInOrder_0));
                v69 = l_List_0.removeIndex(v69, l_List_0.count(v69));
                l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, v62.messageId);
                if l_userId_0 then
                    local v83 = l_List_0.findWhere(l_messagesBySenderId_0[l_userId_0], function(v81, _) --[[ Line: 242 ]]
                        -- upvalues: l_messageId_0 (copy)
                        return v81.messageId == l_messageId_0;
                    end);
                    if v83 and v83 > 0 then
                        l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                            [l_userId_0] = l_List_0.removeIndex(l_messagesBySenderId_0[l_userId_0], v83)
                        });
                    end;
                end;
            end;
            return l_Dictionary_0.join(v61, {
                windowMessagesInOrder = l_windowMessagesInOrder_0, 
                windowMessagesInOrderByTabId = l_Dictionary_0.join(v61.windowMessagesInOrderByTabId, {
                    [v67] = v69
                }), 
                byMessageId = l_byMessageId_0, 
                messagesBySenderId = l_messagesBySenderId_0
            });
        else
            if #l_windowMessagesInOrder_0 == v61.messageLimit and v62.isVisibleInChatWindow then
                local v84 = l_windowMessagesInOrder_0[1];
                local v85 = if l_byMessageId_0[v84] then l_byMessageId_0[v84].userId else nil;
                l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, 1);
                do
                    local l_v84_0 = v84;
                    if v85 then
                        if l_messagesBySenderId_0 ~= nil and l_messagesBySenderId_0[v85] then
                            local v89 = l_List_0.findWhere(l_messagesBySenderId_0[v85], function(v87, _) --[[ Line: 270 ]]
                                -- upvalues: l_v84_0 (ref)
                                return v87.messageId == l_v84_0;
                            end);
                            if v89 and v89 > 0 then
                                l_messagesBySenderId_0 = l_Dictionary_0.join(l_messagesBySenderId_0, {
                                    [v85] = l_List_0.removeIndex(l_messagesBySenderId_0[v85], v89)
                                });
                            end;
                            if l_Dictionary_0.count(l_messagesBySenderId_0[v85]) == 0 then
                                l_messagesBySenderId_0 = l_Dictionary_0.removeKey(l_messagesBySenderId_0, v85);
                                if l_mockUserIdToPartOrModel_0[v85] then
                                    local v90 = l_mockUserIdToPartOrModel_0[v85];
                                    if l_partOrModelToMockUserId_0[v90] then
                                        l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v90);
                                    end;
                                    l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v85);
                                end;
                            end;
                        elseif l_bubbleMessagesInOrderBySenderId_0 ~= nil and l_bubbleMessagesInOrderBySenderId_0[v85] then
                            l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                                [v85] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[v85], l_v84_0)
                            });
                            if l_Dictionary_0.count(l_bubbleMessagesInOrderBySenderId_0[v85]) == 0 then
                                l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.removeKey(l_bubbleMessagesInOrderBySenderId_0, v85);
                                if l_mockUserIdToPartOrModel_0[v85] then
                                    local v91 = l_mockUserIdToPartOrModel_0[v85];
                                    if l_partOrModelToMockUserId_0[v91] then
                                        l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v91);
                                    end;
                                    l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v85);
                                end;
                            end;
                        end;
                    end;
                    if #v69 == v61.messageLimit then
                        l_v84_0 = v69[1];
                        v69 = l_List_0.removeIndex(v69, 1);
                        l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, l_v84_0);
                    end;
                end;
            end;
            if v62.isVisibleInChatWindow then
                l_windowMessagesInOrder_0 = l_List_0.append(l_windowMessagesInOrder_0, l_messageId_0);
                v69 = l_List_0.append(v69, l_messageId_0);
            end;
            return l_Dictionary_0.join(v61, {
                windowMessagesInOrder = l_windowMessagesInOrder_0, 
                windowMessagesInOrderByTabId = l_Dictionary_0.join(v61.windowMessagesInOrderByTabId, {
                    [v67] = v69
                }), 
                byMessageId = l_Dictionary_0.join(l_byMessageId_0, {
                    [l_messageId_0] = {
                        userId = l_userId_0, 
                        prefixText = v62.prefixText, 
                        text = v62.text, 
                        translation = v62.translation, 
                        useTranslation = v62.useTranslation, 
                        messageId = l_messageId_0, 
                        status = v62.status, 
                        timestamp = v62.timestamp, 
                        isVisibleInBubbleChat = v62.isVisibleInBubbleChat, 
                        isVisibleInChatWindow = v62.isVisibleInChatWindow, 
                        partOrModel = l_partOrModel_0, 
                        shouldOverrideBubbleChatSettings = v62.shouldOverrideBubbleChatSettings, 
                        bubbleChatMessageProperties = v62.bubbleChatMessageProperties, 
                        chatWindowMessageProperties = v62.chatWindowMessageProperties, 
                        textChannel = v62.textChannel, 
                        textChatMessageInstance = if v35() then v62.textChatMessageInstance else nil, 
                        isHiddenMessage = if not not v36 or v46() then v62.isHiddenMessage else nil, 
                        wasRewritten = v75, 
                        originalText = v76, 
                        chatActionType = if v41 then v62.chatActionType else nil
                    }
                }), 
                mockUserIdToPartOrModel = l_mockUserIdToPartOrModel_0, 
                partOrModelToMockUserId = l_partOrModelToMockUserId_0, 
                messagesBySenderId = if l_userId_0 then l_Dictionary_0.join(l_messagesBySenderId_0, {
                    [l_userId_0] = l_List_0.append(l_messagesBySenderId_0[l_userId_0] or {}, {
                        userId = l_userId_0, 
                        prefixText = v62.prefixText, 
                        text = v62.text, 
                        translation = v62.translation, 
                        useTranslation = v62.useTranslation, 
                        messageId = l_messageId_0, 
                        status = v62.status, 
                        timestamp = v62.timestamp, 
                        isVisibleInBubbleChat = v62.isVisibleInBubbleChat, 
                        isVisibleInChatWindow = v62.isVisibleInChatWindow, 
                        partOrModel = l_partOrModel_0, 
                        shouldOverrideBubbleChatSettings = v62.shouldOverrideBubbleChatSettings, 
                        bubbleChatMessageProperties = v62.bubbleChatMessageProperties, 
                        chatWindowMessageProperties = v62.chatWindowMessageProperties, 
                        textChannel = v62.textChannel, 
                        textChatMessageInstance = if v35() then v62.textChatMessageInstance else nil, 
                        wasRewritten = v75, 
                        originalText = v76, 
                        chatActionType = if v41 then v62.chatActionType else nil
                    })
                }) else nil
            });
        end;
    end;
end;
local function v101(v93, v94) --[[ Line: 387 ]] --[[ Name: globalToggleTranslations ]]
    -- upvalues: v35 (copy), v40 (copy), v41 (copy), l_Dictionary_0 (copy)
    local l_useTranslation_0 = v94.useTranslation;
    local l_byMessageId_1 = v93.byMessageId;
    local v97 = {};
    for v98, _ in pairs(l_byMessageId_1) do
        local v100 = l_byMessageId_1[v98];
        if v100 ~= nil then
            v97[v98] = {
                prefixText = v100.prefixText, 
                text = v100.text, 
                translation = v100.translation, 
                useTranslation = l_useTranslation_0, 
                messageId = v100.messageId, 
                status = v100.status, 
                timestamp = v100.timestamp, 
                isVisibleInBubbleChat = v100.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v100.isVisibleInChatWindow, 
                partOrModel = v100.partOrModel, 
                shouldOverrideBubbleChatSettings = v100.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v100.bubbleChatMessageProperties, 
                chatWindowMessageProperties = v100.chatWindowMessageProperties, 
                userId = v100.userId, 
                textChannel = v100.textChannel, 
                textChatMessageInstance = if v35() then v100.textChatMessageInstance else nil, 
                wasRewritten = if v40 then v100.wasRewritten else nil, 
                originalText = if v40 then v100.originalText else nil, 
                chatActionType = if v41 then v100.chatActionType else nil
            };
        end;
    end;
    return l_Dictionary_0.join(v93, {
        byMessageId = l_Dictionary_0.join(l_byMessageId_1, v97)
    });
end;
local function v108(v102, v103) --[[ Line: 427 ]] --[[ Name: individualToggleTranslation ]]
    -- upvalues: l_Dictionary_0 (copy), v35 (copy), v40 (copy), v41 (copy)
    local l_useTranslation_1 = v103.useTranslation;
    local l_messageId_1 = v103.messageId;
    local l_byMessageId_2 = v102.byMessageId;
    local v107 = l_byMessageId_2[l_messageId_1];
    if v107 ~= nil then
        return l_Dictionary_0.join(v102, {
            byMessageId = l_Dictionary_0.join(l_byMessageId_2, {
                [l_messageId_1] = {
                    prefixText = v107.prefixText, 
                    text = v107.text, 
                    translation = v107.translation, 
                    useTranslation = l_useTranslation_1, 
                    messageId = v107.messageId, 
                    status = v107.status, 
                    timestamp = v107.timestamp, 
                    isVisibleInBubbleChat = v107.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v107.isVisibleInChatWindow, 
                    partOrModel = v107.partOrModel, 
                    shouldOverrideBubbleChatSettings = v107.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v107.bubbleChatMessageProperties, 
                    chatWindowMessageProperties = v107.chatWindowMessageProperties, 
                    userId = v107.userId, 
                    textChannel = v107.textChannel, 
                    textChatMessageInstance = if v35() then v107.textChatMessageInstance else nil, 
                    wasRewritten = if v40 then v107.wasRewritten else nil, 
                    originalText = if v40 then v107.originalText else nil, 
                    chatActionType = if v41 then v107.chatActionType else nil
                }
            })
        });
    else
        return nil;
    end;
end;
local function v113(v109, v110) --[[ Line: 467 ]] --[[ Name: mapByMessageIdInOrderBubbleChat ]]
    -- upvalues: v92 (copy)
    local l_bubbleChatMessageTable_0 = v110.bubbleChatMessageTable;
    local v112 = {
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
    return v92(v109, v112);
end;
local function v128(v114, v115) --[[ Line: 490 ]] --[[ Name: mapByMessageIdInOrder ]]
    -- upvalues: v40 (copy), v50 (copy), l_Set_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v44 (copy), v41 (copy), l_FFlagExpChatDisableUniverseBubbleChat_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v45 (copy), l_Players_0 (copy), v35 (copy), v92 (copy)
    local l_textChatMessage_0 = v115.textChatMessage;
    local v117 = nil;
    local v118 = nil;
    if v40 then
        local v119, v120 = v50(l_textChatMessage_0);
        v117 = v119;
        v118 = v120;
    else
        v117 = l_textChatMessage_0.Text;
        v118 = l_textChatMessage_0.Translation;
    end;
    local v121 = if l_textChatMessage_0.TextSource then tostring(l_textChatMessage_0.TextSource.UserId) else nil;
    local v122 = nil;
    v122 = v121 == nil or if v114.canLocalUserChat then not (l_textChatMessage_0.Status ~= Enum.TextChatMessageStatus.Success) or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending else false;
    local v123 = if v121 then l_Set_0.has(v114._mutedUserIds, v121) else false;
    v122 = v122 and not v123;
    local v124 = false;
    if (if l_FFlagExpChatUseChatConfigStore_0 then v44(false).getIsBubbleChatEnabled(false) else v114.isBubbleChatEnabled) and v122 and (not v41 or v121 ~= nil) and (l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Success or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending) then
        v124 = true;
    end;
    if l_FFlagExpChatDisableUniverseBubbleChat_0 and l_GetFFlagTextChatEnableUniverseChatTabs_0() and l_textChatMessage_0.TextChannel == nil then
        v124 = false;
    end;
    local l_PrefixText_0 = l_textChatMessage_0.PrefixText;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v115.channelNameOverride and #l_PrefixText_0 > 0 then
        local _ = nil;
        l_PrefixText_0 = ("<font color=\"#%*\">%*</font>"):format((if l_textChatMessage_0.TextSource then v45(l_textChatMessage_0.TextSource.Username) else v45(l_Players_0.LocalPlayer.Name)):ToHex(), l_PrefixText_0);
    end;
    local v127 = {
        userId = v121, 
        prefixText = l_PrefixText_0, 
        text = v117, 
        translation = v118, 
        useTranslation = getChatTranslationEnabled(), 
        textChannel = l_textChatMessage_0.TextChannel, 
        messageId = l_textChatMessage_0.MessageId, 
        status = l_textChatMessage_0.Status, 
        timestamp = l_textChatMessage_0.Timestamp, 
        isVisibleInBubbleChat = v124, 
        isVisibleInChatWindow = v122, 
        bubbleChatMessageProperties = l_textChatMessage_0.BubbleChatMessageProperties, 
        chatWindowMessageProperties = l_textChatMessage_0.ChatWindowMessageProperties, 
        textChatMessageInstance = if v35() then l_textChatMessage_0 else nil, 
        wasRewritten = if v40 then l_textChatMessage_0.WasRewritten else nil, 
        originalText = if v40 then l_textChatMessage_0.OriginalText else nil, 
        chatActionType = if v41 then l_textChatMessage_0.ChatActionType else nil
    };
    return v92(v114, v127, if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v115.channelNameOverride else nil);
end;
return v5.createReducer(v56, {
    [v51.name] = function(v129, v130) --[[ Line: 683 ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Dictionary_0 (copy)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() then
            return v129;
        else
            return l_Dictionary_0.join(v129, {
                channelTabsConfigurationEnabled = v130.enabled
            });
        end;
    end, 
    [v17.name] = v128, 
    [v19.name] = v113, 
    [v20.name] = v128, 
    [l_UserMuted_0.name] = function(v131, v132) --[[ Line: 695 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v131, {
            _mutedUserIds = l_Set_0.add(v131._mutedUserIds, v132.userId)
        });
    end, 
    [l_UserUnmuted_0.name] = function(v133, v134) --[[ Line: 700 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        return l_Dictionary_0.join(v133, {
            _mutedUserIds = l_Set_0.subtract(v133._mutedUserIds, v134.userId)
        });
    end, 
    [l_PlayerRemoved_0.name] = function(v135, v136) --[[ Line: 705 ]]
        -- upvalues: l_Dictionary_0 (copy), l_Set_0 (copy)
        local v139 = l_Dictionary_0.filter(v135.bubbleMessagesInOrderBySenderId, function(_, v138) --[[ Line: 708 ]]
            -- upvalues: v136 (copy)
            return v138 ~= v136.userId;
        end);
        local v142 = l_Dictionary_0.filter(v135.messagesBySenderId, function(_, v141) --[[ Line: 712 ]]
            -- upvalues: v136 (copy)
            return v141 ~= v136.userId;
        end);
        local v143 = not l_Set_0.has(v135._mutedUserIds, v136.userId);
        if #v139 == 0 and #v142 == 0 and v143 then
            return v135;
        else
            return l_Dictionary_0.join(v135, {
                messagesBySenderId = v142, 
                _mutedUserIds = l_Set_0.subtract(v135._mutedUserIds, v136.userId)
            });
        end;
    end, 
    [v24.name] = function(v144, v145) --[[ Line: 725 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v144, {
            canLocalUserChat = v145.canUserChat
        });
    end, 
    [v25.name] = function(v146, _) --[[ Line: 728 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v146, {
            canLocalUserChat = false
        });
    end, 
    [v26.name] = function(v148, v149) --[[ Line: 731 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v148, {
            isBubbleChatEnabled = if v149.bubbleChatSettings.Enabled then v149.bubbleChatSettings.Enabled else false
        });
    end, 
    [v27.name] = function(v150, v151) --[[ Line: 738 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v151.property ~= "Enabled" then
            return v150;
        else
            local v153 = l_Dictionary_0.map(v150.byMessageId, function(v152) --[[ Line: 743 ]]
                -- upvalues: l_Dictionary_0 (ref), v151 (copy)
                if v152.shouldOverrideBubbleChatSettings then
                    return v152;
                else
                    return l_Dictionary_0.join(v152, {
                        isVisibleInBubbleChat = v151.value and v152.isVisibleInChatWindow
                    });
                end;
            end);
            return l_Dictionary_0.join(v150, {
                byMessageId = v153, 
                isBubbleChatEnabled = v151.value
            });
        end;
    end, 
    [l_ChatWindowMessagesCleared_0.name] = function(v154, _) --[[ Line: 758 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v157 = l_Dictionary_0.map(v154.byMessageId, function(v156) --[[ Line: 759 ]]
            -- upvalues: l_Dictionary_0 (ref)
            return l_Dictionary_0.join(v156, {
                isVisibleInChatWindow = false
            });
        end);
        return l_Dictionary_0.join(v154, {
            windowMessagesInOrder = {}, 
            windowMessagesInOrderByTabId = {}, 
            byMessageId = v157
        });
    end, 
    [v29.name] = v101, 
    [v30.name] = v108, 
    [v31.name] = function(v158, v159) --[[ Line: 589 ]] --[[ Name: mapByMessageIdInOrderLegacyBubbleChat ]]
        -- upvalues: v92 (copy)
        local l_messageData_0 = v159.messageData;
        local v161 = if l_messageData_0.timestamp then DateTime.fromUnixTimestampMillis(l_messageData_0.timestamp) else DateTime.now();
        local v162 = {
            userId = l_messageData_0.userId, 
            prefixText = "", 
            text = l_messageData_0.text, 
            messageId = l_messageData_0.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v161, 
            partOrModel = l_messageData_0.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false
        };
        return v92(v158, v162);
    end, 
    [v32.name] = function(v163, v164) --[[ Line: 773 ]]
        -- upvalues: l_Dictionary_0 (copy), l_List_0 (copy)
        local l_byMessageId_3 = v163.byMessageId;
        local l_messagesBySenderId_1 = v163.messagesBySenderId;
        local l_messageId_2 = v164.messageId;
        local l_newText_0 = v164.newText;
        if l_byMessageId_3[l_messageId_2] then
            local v169 = l_byMessageId_3[l_messageId_2];
            v169.text = l_newText_0;
            l_byMessageId_3 = l_Dictionary_0.join(l_byMessageId_3, {
                [l_messageId_2] = v169
            });
            local l_userId_1 = v169.userId;
            if l_userId_1 and l_messagesBySenderId_1[l_userId_1] then
                local v173 = l_List_0.findWhere(l_messagesBySenderId_1[l_userId_1], function(v171, _) --[[ Line: 787 ]]
                    -- upvalues: l_messageId_2 (copy)
                    return v171.messageId == l_messageId_2;
                end);
                if v173 and v173 > 0 then
                    l_messagesBySenderId_1 = l_Dictionary_0.join(l_messagesBySenderId_1, {
                        [l_userId_1] = l_List_0.set(l_messagesBySenderId_1[l_userId_1], v173, v169)
                    });
                end;
            end;
        end;
        return l_Dictionary_0.join(v163, {
            byMessageId = l_byMessageId_3, 
            messagesBySenderId = l_messagesBySenderId_1
        });
    end, 
    [v33.name] = function(v174, v175) --[[ Line: 613 ]] --[[ Name: mapByMessageIdInOrderHiddenMessage ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v42 (copy), v38 (copy), v39 (copy), v14 (copy), v35 (copy), v92 (copy)
        local l_userMessageIntent_0 = v175.userMessageIntent;
        local v177 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and string.len(l_userMessageIntent_0.Text) > v42 then v42 else string.len(l_userMessageIntent_0.Text);
        local v178 = math.max(v38, -(v177 - 1));
        local l_v39_0 = v39;
        local v180 = math.random(v178, l_v39_0);
        local v181 = string.rep(if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() then v14.INTERPUNCT_TEXT else v14.DOT_TEXT, v177 + v180);
        local v182 = {
            userId = nil, 
            prefixText = v14.LOCK_EMOJI .. " :", 
            text = v181, 
            textChannel = l_userMessageIntent_0.TextChannel, 
            messageId = l_userMessageIntent_0.MessageId, 
            status = l_userMessageIntent_0.Status, 
            timestamp = l_userMessageIntent_0.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v35() then l_userMessageIntent_0 else nil, 
            isHiddenMessage = true
        };
        return v92(v174, v182);
    end, 
    [v18.name] = function(v183, v184) --[[ Line: 651 ]] --[[ Name: mapUniverseChatSystemMessage ]]
        -- upvalues: l_HttpService_0 (copy), v12 (copy), l_GetFFlagExpChatSyntheticSystemMessageRichText_0 (copy), v13 (copy), v92 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy)
        local v185 = l_HttpService_0:GenerateGUID(false);
        local v186 = v12(v184.text);
        local v187 = if l_GetFFlagExpChatSyntheticSystemMessageRichText_0() then v13(v186, false) else v186;
        local v188 = {
            userId = nil, 
            prefixText = "", 
            text = v187, 
            translation = nil, 
            useTranslation = false, 
            messageId = v185, 
            timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000), 
            status = Enum.TextChatMessageStatus.Success, 
            isVisibleInChatWindow = true, 
            isVisibleInBubbleChat = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil, 
            textChatMessageInstance = nil, 
            partOrModel = nil
        };
        return v92(v183, v188, if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v184.channelNameOverride else nil);
    end, 
    [v34.name] = function(v189, _) --[[ Line: 805 ]]
        -- upvalues: v37 (copy), l_Dictionary_0 (copy), l_List_0 (copy)
        if not v37 then
            return v189;
        else
            local v192 = l_Dictionary_0.map(v189.byMessageId, function(v191) --[[ Line: 810 ]]
                -- upvalues: l_Dictionary_0 (ref)
                if v191.isHiddenMessage then
                    return l_Dictionary_0.join(v191, {
                        isVisibleInChatWindow = false
                    });
                else
                    return v191;
                end;
            end);
            local v195 = l_List_0.filter(v189.windowMessagesInOrder, function(v193) --[[ Line: 820 ]]
                -- upvalues: v192 (copy)
                local v194 = v192[v193];
                return v194 and not v194.isHiddenMessage;
            end);
            local v199 = l_Dictionary_0.map(v189.windowMessagesInOrderByTabId, function(v196) --[[ Line: 827 ]]
                -- upvalues: l_List_0 (ref), v192 (copy)
                return l_List_0.filter(v196, function(v197) --[[ Line: 828 ]]
                    -- upvalues: v192 (ref)
                    local v198 = v192[v197];
                    return v198 and not v198.isHiddenMessage;
                end);
            end);
            return l_Dictionary_0.join(v189, {
                windowMessagesInOrder = v195, 
                windowMessagesInOrderByTabId = v199, 
                byMessageId = v192
            });
        end;
    end
});