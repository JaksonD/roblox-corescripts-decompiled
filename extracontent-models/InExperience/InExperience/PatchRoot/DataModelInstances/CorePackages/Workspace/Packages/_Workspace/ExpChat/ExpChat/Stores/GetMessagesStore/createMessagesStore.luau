local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local v5 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v6 = require(l_script_FirstAncestor_0.computeNameColor);
local _ = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local v8 = require(l_script_FirstAncestor_0.Parent.ExpChatShared);
local v9 = require(l_script_FirstAncestor_0.getTextAndTranslation);
local v10 = require(l_script_FirstAncestor_0.Config);
local v11 = require(l_script_FirstAncestor_0.sanitizeForRichText);
local v12 = require(l_script_FirstAncestor_0.generateRichSystemMessageTextFormat);
local l_TextChatService_0 = game:GetService("TextChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v16 = require(l_Parent_0.llama);
local l_List_0 = v16.List;
local l_Dictionary_0 = v16.Dictionary;
local l_Set_0 = v16.Set;
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local l_FFlagExpChatUseChatConfigStore_0 = v3.FFlagExpChatUseChatConfigStore;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatSummaryOnLua);
local v25 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeLowerBound);
local v26 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeUpperBound);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v29 = require(l_script_FirstAncestor_0.Flags.FIntExpChatHiddenMessageMaxLength);
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClientRenderedEventFix);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v8.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_FFlagExpChatDisableUniverseBubbleChat_0 = v8.Flags.FFlagExpChatDisableUniverseBubbleChat;
local l_GetFFlagExpChatSyntheticSystemMessageRichText_0 = v8.Flags.GetFFlagExpChatSyntheticSystemMessageRichText;
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 46 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    return l_TextChatService_0.ChatTranslationEnabled;
end;
return function() --[[ Line: 155 ]] --[[ Name: createMessagesStore ]]
    -- upvalues: l_createSignal_0 (copy), l_Dictionary_0 (copy), l_List_0 (copy), l_HttpService_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_createComputed_0 (copy), l_Set_0 (copy), v11 (copy), l_GetFFlagExpChatSyntheticSystemMessageRichText_0 (copy), v12 (copy), v31 (copy), v6 (copy), l_Players_0 (copy), v23 (copy), v9 (copy), v4 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v5 (copy), v8 (copy), v24 (copy), l_FFlagExpChatDisableUniverseBubbleChat_0 (copy), v27 (copy), v30 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v29 (copy), v25 (copy), v26 (copy), v10 (copy), v28 (copy)
    local v36 = {
        canLocalUserChat = false, 
        isBubbleChatEnabled = false, 
        mutedUserIds = {}, 
        messageLimit = 50, 
        windowMessagesInOrder = {}, 
        windowMessagesInOrderByTabId = {}, 
        byMessageId = {}, 
        mockUserIdToPartOrModel = {}, 
        partOrModelToMockUserId = {}, 
        messagesBySenderId = {}, 
        messageComponentRingBuffer = {}, 
        nextMessageComponentPointer = 1
    };
    local v37, v38 = l_createSignal_0(v36.byMessageId);
    local v39, v40 = l_createSignal_0(v36.messagesBySenderId);
    local v41, v42 = l_createSignal_0(v36.windowMessagesInOrder);
    local v43, v44 = l_createSignal_0(v36.windowMessagesInOrderByTabId);
    local v45, v46 = l_createSignal_0(v36.mutedUserIds);
    local v47, v48 = l_createSignal_0(v36.canLocalUserChat);
    local v49, _ = l_createSignal_0(v36.isBubbleChatEnabled);
    local v51, v52 = l_createSignal_0(v36.mockUserIdToPartOrModel);
    local v53, v54 = l_createSignal_0(v36.partOrModelToMockUserId);
    local v55, v56 = l_createSignal_0(false);
    local v57, v58 = l_createSignal_0(v36.messageComponentRingBuffer);
    local v59, v60 = l_createSignal_0(v36.nextMessageComponentPointer);
    local v61 = {};
    local v62 = 0;
    local v63 = {};
    local v64, v65 = l_createSignal_0(nil);
    local v66 = nil;
    local function v114(v67) --[[ Line: 206 ]] --[[ Name: addMessage ]]
        -- upvalues: v37 (copy), v38 (copy), l_Dictionary_0 (ref), v40 (copy), l_List_0 (ref), v53 (copy), l_HttpService_0 (ref), v52 (copy), v54 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v55 (copy), v41 (copy), v43 (copy), v36 (copy), v51 (copy), v42 (copy), v44 (copy)
        local v68 = v37(false);
        if v68 and v68[v67.messageId] then
            v38(function(v69) --[[ Line: 211 ]]
                -- upvalues: l_Dictionary_0 (ref), v67 (copy)
                return l_Dictionary_0.join(v69, {
                    [v67.messageId] = v67
                });
            end);
            if v67.userId then
                v40(function(v70) --[[ Line: 217 ]]
                    -- upvalues: v67 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v71 = v70[v67.userId] or {};
                    local v72 = nil;
                    for v73, v74 in ipairs(v71) do
                        if v74.messageId == v67.messageId then
                            v72 = v73;
                            break;
                        end;
                    end;
                    if v72 then
                        local v75 = l_List_0.set(v71, v72, v67);
                        return l_Dictionary_0.join(v70, {
                            [v67.userId] = v75
                        });
                    else
                        return v70;
                    end;
                end);
            end;
            return;
        else
            local l_userId_0 = v67.userId;
            local l_partOrModel_0 = v67.partOrModel;
            if not l_userId_0 and l_partOrModel_0 then
                l_userId_0 = v53(false)[l_partOrModel_0];
                if not l_userId_0 then
                    l_userId_0 = l_HttpService_0:GenerateGUID(false);
                    v52(function(v78) --[[ Line: 253 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_userId_0 (ref), l_partOrModel_0 (copy)
                        return l_Dictionary_0.join(v78, {
                            [l_userId_0] = l_partOrModel_0
                        });
                    end);
                    v54(function(v79) --[[ Line: 260 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_partOrModel_0 (copy), l_userId_0 (ref)
                        return l_Dictionary_0.join(v79, {
                            [l_partOrModel_0] = l_userId_0
                        });
                    end);
                end;
            end;
            local v80 = if v67.userId ~= l_userId_0 then l_Dictionary_0.join(v67, {
                userId = l_userId_0
            }) else v67;
            local v81 = nil;
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v80.channelNameOverride then
                v81 = v80.channelNameOverride;
            elseif v80.textChannel then
                v81 = if v80.textChannel.Name ~= "RBXSystem" and (not l_GetFFlagTextChatEnableUniverseChatTabs_0() or v55(false)) then v80.textChannel.Name else "RBXGeneral";
            end;
            if v80.isVisibleInChatWindow then
                local v82 = v41(false);
                local v83 = if v81 then v43(false)[v81] or {} else {};
                if #v82 >= v36.messageLimit then
                    local v84 = v82[1];
                    local v85 = v68 and v68[v84];
                    if v85 then
                        local l_v84_0 = v84 --[[ copy: 8 -> 10 ]];
                        v38(function(v87) --[[ Line: 301 ]]
                            -- upvalues: l_Dictionary_0 (ref), l_v84_0 (copy)
                            return l_Dictionary_0.removeKey(v87, l_v84_0);
                        end);
                        if v85.userId then
                            local l_v84_1 = v84 --[[ copy: 8 -> 11 ]];
                            v40(function(v89) --[[ Line: 307 ]]
                                -- upvalues: v85 (copy), l_List_0 (ref), l_v84_1 (copy), v51 (ref), v54 (ref), l_Dictionary_0 (ref), v52 (ref)
                                local v90 = v89[v85.userId];
                                if v90 then
                                    local v92 = l_List_0.filter(v90, function(v91) --[[ Line: 310 ]]
                                        -- upvalues: l_v84_1 (ref)
                                        return v91.messageId ~= l_v84_1;
                                    end);
                                    if #v92 == 0 then
                                        local v93 = v51(false);
                                        if v93[v85.userId] then
                                            local v94 = v93[v85.userId];
                                            v54(function(v95) --[[ Line: 320 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v94 (copy)
                                                return l_Dictionary_0.removeKey(v95, v94);
                                            end);
                                            v52(function(v96) --[[ Line: 324 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v85 (ref)
                                                return l_Dictionary_0.removeKey(v96, v85.userId);
                                            end);
                                        end;
                                        return l_Dictionary_0.removeKey(v89, v85.userId);
                                    else
                                        return l_Dictionary_0.join(v89, {
                                            [v85.userId] = v92
                                        });
                                    end;
                                else
                                    return v89;
                                end;
                            end);
                        end;
                        v42(function(v97) --[[ Line: 341 ]]
                            -- upvalues: l_List_0 (ref)
                            return l_List_0.removeIndex(v97, 1);
                        end);
                    end;
                end;
                if v81 and #v83 >= v36.messageLimit then
                    local v98 = v83[1];
                    if v98 then
                        v44(function(v99) --[[ Line: 351 ]]
                            -- upvalues: v81 (ref), l_List_0 (ref), l_Dictionary_0 (ref)
                            local v100 = v99[v81] or {};
                            local v101 = l_List_0.removeIndex(v100, 1);
                            return l_Dictionary_0.join(v99, {
                                [v81] = v101
                            });
                        end);
                        if v68 and v68[v98] then
                            v38(function(v102) --[[ Line: 360 ]]
                                -- upvalues: l_Dictionary_0 (ref), v98 (copy)
                                return l_Dictionary_0.removeKey(v102, v98);
                            end);
                        end;
                    end;
                end;
            end;
            v38(function(v103) --[[ Line: 368 ]]
                -- upvalues: l_Dictionary_0 (ref), v80 (copy)
                return l_Dictionary_0.join(v103, {
                    [v80.messageId] = v80
                });
            end);
            if v80.userId then
                v40(function(v104) --[[ Line: 373 ]]
                    -- upvalues: v80 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v105 = v104[v80.userId] or {};
                    local v106 = false;
                    for _, v108 in ipairs(v105) do
                        if v108.messageId == v80.messageId then
                            v106 = true;
                            break;
                        end;
                    end;
                    if not v106 then
                        local v109 = l_List_0.append(v105, v80);
                        return l_Dictionary_0.join(v104, {
                            [v80.userId] = v109
                        });
                    else
                        return v104;
                    end;
                end);
            end;
            if v80.isVisibleInChatWindow then
                v42(function(v110) --[[ Line: 398 ]]
                    -- upvalues: l_List_0 (ref), v80 (copy)
                    return l_List_0.append(v110, v80.messageId);
                end);
                if v81 then
                    v44(function(v111) --[[ Line: 404 ]]
                        -- upvalues: v81 (ref), l_List_0 (ref), v80 (copy), l_Dictionary_0 (ref)
                        local v112 = v111[v81] or {};
                        local v113 = l_List_0.append(v112, v80.messageId);
                        return l_Dictionary_0.join(v111, {
                            [v81] = v113
                        });
                    end);
                end;
            end;
            return;
        end;
    end;
    local v115 = {};
    local v116 = {};
    local function v120(v117) --[[ Line: 425 ]] --[[ Name: getMessage ]]
        -- upvalues: v115 (copy), l_createComputed_0 (ref), v37 (copy)
        if not v115[v117] then
            v115[v117] = l_createComputed_0(function(v118) --[[ Line: 427 ]]
                -- upvalues: v37 (ref), v117 (copy)
                local v119 = v37(v118);
                if not v119 or not v119[v117] then
                    return nil;
                else
                    return v119[v117];
                end;
            end);
        end;
        return v115[v117];
    end;
    local function v133(v121) --[[ Line: 438 ]] --[[ Name: getUserMessageCache ]]
        -- upvalues: v116 (copy), l_createComputed_0 (ref), v39 (copy), v45 (copy), l_Set_0 (ref)
        local v122 = tostring(v121);
        if not v116[v122] then
            v116[v122] = {};
            v116[v122].messages = l_createComputed_0(function(v123) --[[ Line: 442 ]]
                -- upvalues: v39 (ref), v122 (copy)
                return v39(v123)[v122] or {};
            end);
            v116[v122].bubbleMessages = l_createComputed_0(function(v124) --[[ Line: 446 ]]
                -- upvalues: v116 (ref), v122 (copy), v45 (ref), l_Set_0 (ref)
                local v125 = v116[v122].messages(v124);
                local v126 = v45(v124);
                local v127 = {};
                for _, v129 in ipairs(v125) do
                    local v130 = v129.userId and l_Set_0.has(v126, v129.userId) or false;
                    if v129.isVisibleInBubbleChat and not v130 then
                        table.insert(v127, v129);
                    end;
                end;
                return v127;
            end);
            v116[v122].lastMessage = l_createComputed_0(function(v131) --[[ Line: 458 ]]
                -- upvalues: v116 (ref), v122 (copy)
                local v132 = v116[v122].messages(v131);
                if #v132 > 0 then
                    return v132[#v132];
                else
                    return nil;
                end;
            end);
        end;
        return v116[v122];
    end;
    local function v135(v134) --[[ Line: 469 ]] --[[ Name: getUserMessages ]]
        -- upvalues: v133 (copy)
        return v133(v134).messages;
    end;
    local function v137(v136) --[[ Line: 474 ]] --[[ Name: getUserBubbleMessages ]]
        -- upvalues: v133 (copy)
        return v133(v136).bubbleMessages;
    end;
    local function v139(v138) --[[ Line: 479 ]] --[[ Name: getUserLastMessage ]]
        -- upvalues: v133 (copy)
        return v133(v138).lastMessage;
    end;
    local _ = function() --[[ Line: 484 ]] --[[ Name: createMessagesArraySignal ]]
        -- upvalues: l_createComputed_0 (ref), v37 (copy)
        return l_createComputed_0(function(v140) --[[ Line: 485 ]]
            -- upvalues: v37 (ref)
            local v141 = v37(v140);
            local v142 = {};
            local l_pairs_0 = pairs;
            local v144 = v141 or {};
            for _, v146 in l_pairs_0(v144) do
                table.insert(v142, v146);
            end;
            return v142;
        end);
    end;
    local function v156(v148, v149) --[[ Line: 495 ]] --[[ Name: addSystemMessage ]]
        -- upvalues: v11 (ref), l_GetFFlagExpChatSyntheticSystemMessageRichText_0 (ref), v12 (ref), l_HttpService_0 (ref), v114 (copy), v31 (ref), v64 (copy), v66 (ref)
        local v150 = v11(v148);
        local v151 = if l_GetFFlagExpChatSyntheticSystemMessageRichText_0() then v12(v150, false) else v150;
        local v152 = l_HttpService_0:GenerateGUID(false);
        local v153 = {
            userId = nil, 
            prefixText = "", 
            text = v151, 
            translation = nil, 
            useTranslation = false, 
            messageId = v152, 
            timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000), 
            status = Enum.TextChatMessageStatus.Success, 
            isVisibleInChatWindow = true, 
            isVisibleInBubbleChat = false, 
            shouldOverrideBubbleChatSettings = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil, 
            textChatMessageInstance = nil, 
            partOrModel = nil, 
            channelNameOverride = v149
        };
        v114(v153);
        if v31 then
            local v154 = v64(false);
            local v155 = true;
            if v154 ~= nil then
                v155 = v149 == v154;
            end;
            if v155 then
                v66(v152);
            end;
        end;
    end;
    local function v161(v157, v158, v159) --[[ Line: 530 ]] --[[ Name: formatPrefixForUniverseChatTabs ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v6 (ref), l_Players_0 (ref)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() or not v158 or #v157 == 0 then
            return v157;
        else
            local _ = nil;
            return (("<font color=\"#%*\">%*</font>"):format((if v159.TextSource then v6(v159.TextSource.Username) else v6(if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.Name else "")):ToHex(), v157));
        end;
    end;
    local function v184(v162, _, v164) --[[ Line: 547 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: v23 (ref), v9 (ref), v4 (ref), v37 (copy), v47 (copy), v45 (copy), l_Set_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v5 (ref), v8 (ref), v49 (copy), v24 (ref), l_FFlagExpChatDisableUniverseBubbleChat_0 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v55 (copy), v161 (copy), v27 (ref), v30 (ref), v114 (copy), v31 (ref), v64 (copy), v66 (ref)
        local v165 = nil;
        local v166 = nil;
        if v23 then
            local v167, v168 = v9(v162);
            v165 = v167;
            v166 = v168;
        else
            v165 = v162.Text;
            v166 = v162.Translation;
        end;
        if v4(v165) and v162.Status ~= Enum.TextChatMessageStatus.Floodchecked and v162.Status ~= Enum.TextChatMessageStatus.MessageTooLong then
            return;
        else
            local v169 = if v162.TextSource then tostring(v162.TextSource.UserId) else nil;
            if not v37(false) then
                return;
            else
                local v170 = v47(false);
                local v171 = nil;
                if v169 == nil then
                    v171 = true;
                elseif not v170 then
                    v171 = false;
                else
                    local v172 = true;
                    if v162.Status ~= Enum.TextChatMessageStatus.Success then
                        v172 = v162.Status == Enum.TextChatMessageStatus.Sending;
                    end;
                    v171 = v172;
                end;
                local v173 = if v169 and v45(false) then l_Set_0.has(v45(false), v169) else false;
                v171 = v171 and not v173;
                local v174 = false;
                local v175 = nil;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v175 = v5(false).getIsBubbleChatEnabled(false);
                else
                    local v176 = v8.context and v8.context.store;
                    v175 = if v176 then v176:getState().Messages.isBubbleChatEnabled else v49(false);
                end;
                if v175 and v171 and (not v24 or v169 ~= nil) and (v162.Status == Enum.TextChatMessageStatus.Success or v162.Status == Enum.TextChatMessageStatus.Sending) then
                    v174 = true;
                end;
                if l_FFlagExpChatDisableUniverseBubbleChat_0 and l_GetFFlagTextChatEnableUniverseChatTabs_0() and v162.TextChannel == nil then
                    v174 = false;
                end;
                if v162.Status ~= Enum.TextChatMessageStatus.Success and v162.Status ~= Enum.TextChatMessageStatus.Sending then
                    v171 = false;
                    v174 = false;
                end;
                local v177 = nil;
                if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v164 then
                    v177 = v164;
                elseif v162.TextChannel then
                    v177 = if v162.TextChannel.Name ~= "RBXSystem" and (not l_GetFFlagTextChatEnableUniverseChatTabs_0() or v55(false)) then v162.TextChannel.Name else "RBXGeneral";
                end;
                local v178 = v161(v162.PrefixText, v164, v162);
                local v179 = {
                    userId = v169, 
                    prefixText = v178, 
                    text = v165, 
                    translation = v166, 
                    useTranslation = getChatTranslationEnabled() and v166 ~= nil, 
                    messageId = v162.MessageId, 
                    status = v162.Status, 
                    timestamp = v162.Timestamp, 
                    shouldOverrideBubbleChatSettings = false, 
                    isVisibleInBubbleChat = v174, 
                    isVisibleInChatWindow = v171, 
                    textChannel = v162.TextChannel, 
                    bubbleChatMessageProperties = v162.BubbleChatMessageProperties, 
                    chatWindowMessageProperties = v162.ChatWindowMessageProperties, 
                    textChatMessageInstance = if v27() and v30 then v162 else nil, 
                    partOrModel = v162.TextSource and v162.TextSource.Parent or nil, 
                    wasRewritten = if v23 then v162.WasRewritten else nil, 
                    originalText = if v23 then v162.OriginalText else nil, 
                    channelNameOverride = l_GetFFlagTextChatEnableUniverseChatTabs_0() and v164 or nil, 
                    chatActionType = if v24 then v162.ChatActionType else nil
                };
                local v180 = v37(false);
                local v181 = v180 and v180[v179.messageId] ~= nil;
                if v179.isVisibleInChatWindow or v179.isVisibleInBubbleChat or v181 then
                    v114(v179);
                    if v31 and v179.isVisibleInChatWindow and not v181 then
                        local v182 = v64(false);
                        local v183 = true;
                        if v182 ~= nil then
                            v183 = v177 == v182;
                        end;
                        if v183 then
                            v66(v179.messageId);
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v187(v185) --[[ Line: 704 ]] --[[ Name: handleIncomingBubbleChatMessage ]]
        -- upvalues: v114 (copy)
        local v186 = {
            userId = v185.bubbleChatMessageUserId, 
            prefixText = "", 
            text = v185.message, 
            translation = v185.translation, 
            useTranslation = getChatTranslationEnabled(), 
            textChannel = nil, 
            messageId = v185.bubbleChatMessageId, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v185.timestamp, 
            partOrModel = v185.partOrModel, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            bubbleChatMessageProperties = v185.bubbleChatMessageProperties, 
            chatWindowMessageProperties = nil
        };
        v114(v186);
    end;
    local function v196(v188) --[[ Line: 727 ]] --[[ Name: handleHiddenMessageReceived ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v29 (ref), v25 (ref), v26 (ref), v10 (ref), v27 (ref), v114 (copy)
        local v189 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled();
        local v190 = if v189 and string.len(v188.Text) > v29 then v29 else string.len(v188.Text);
        local v191 = math.max(v25, -(v190 - 1));
        local l_v26_0 = v26;
        local v193 = math.random(v191, l_v26_0);
        local v194 = string.rep(if v189 then v10.INTERPUNCT_TEXT else v10.DOT_TEXT, v190 + v193);
        local v195 = {
            userId = nil, 
            prefixText = v10.LOCK_EMOJI .. " :", 
            text = v194, 
            textChannel = v188.TextChannel, 
            messageId = v188.MessageId, 
            status = v188.Status, 
            timestamp = v188.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v27() then v188 else nil, 
            isHiddenMessage = true
        };
        return v114(v195);
    end;
    local function v205(v197) --[[ Line: 763 ]] --[[ Name: handlePlayerRemoved ]]
        -- upvalues: v40 (copy), l_Dictionary_0 (ref), v46 (copy), l_Set_0 (ref), v39 (copy), v51 (copy), v54 (copy), v52 (copy)
        v40(function(v198) --[[ Line: 765 ]]
            -- upvalues: l_Dictionary_0 (ref), v197 (copy)
            return l_Dictionary_0.removeKey(v198, v197);
        end);
        v46(function(v199) --[[ Line: 769 ]]
            -- upvalues: l_Set_0 (ref), v197 (copy), v39 (ref), v51 (ref), v54 (ref), l_Dictionary_0 (ref), v52 (ref)
            if not v199 then
                return {};
            else
                local v200 = not l_Set_0.has(v199, v197);
                if #(v39(false)[v197] or {}) == 0 and v200 then
                    return v199;
                else
                    local v201 = v51(false);
                    if v201[v197] then
                        local v202 = v201[v197];
                        v54(function(v203) --[[ Line: 784 ]]
                            -- upvalues: l_Dictionary_0 (ref), v202 (copy)
                            return l_Dictionary_0.removeKey(v203, v202);
                        end);
                        v52(function(v204) --[[ Line: 788 ]]
                            -- upvalues: l_Dictionary_0 (ref), v197 (ref)
                            return l_Dictionary_0.removeKey(v204, v197);
                        end);
                    end;
                    return l_Set_0.subtract(v199, v197);
                end;
            end;
        end);
    end;
    local function v208(v206) --[[ Line: 797 ]] --[[ Name: muteUser ]]
        -- upvalues: v46 (copy), l_Set_0 (ref)
        v46(function(v207) --[[ Line: 798 ]]
            -- upvalues: l_Set_0 (ref), v206 (copy)
            if not v207 then
                return {};
            else
                return (l_Set_0.add(v207, v206));
            end;
        end);
    end;
    local function v211(v209) --[[ Line: 807 ]] --[[ Name: unmuteUser ]]
        -- upvalues: v46 (copy), l_Set_0 (ref)
        v46(function(v210) --[[ Line: 808 ]]
            -- upvalues: l_Set_0 (ref), v209 (copy)
            if not v210 then
                return {};
            else
                return (l_Set_0.subtract(v210, v209));
            end;
        end);
    end;
    local function v220() --[[ Line: 817 ]] --[[ Name: clearWindowMessages ]]
        -- upvalues: v38 (copy), l_Dictionary_0 (ref), v42 (copy), v44 (copy), v31 (ref), v60 (copy), v62 (ref), v57 (copy), v61 (copy)
        v38(function(v212) --[[ Line: 818 ]]
            -- upvalues: l_Dictionary_0 (ref)
            if not v212 then
                return {};
            else
                return (l_Dictionary_0.map(v212, function(v213) --[[ Line: 823 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    return l_Dictionary_0.join(v213, {
                        isVisibleInChatWindow = false
                    });
                end));
            end;
        end);
        v42(function(_) --[[ Line: 833 ]]
            return {};
        end);
        v44(function(_) --[[ Line: 838 ]]
            return {};
        end);
        if v31 then
            v60(1);
            v62 = 0;
            local v216 = v57(false);
            for _, v218 in ipairs(v216) do
                local v219 = v61[v218];
                if v219 then
                    v219.setter(nil);
                end;
            end;
        end;
    end;
    local function v230() --[[ Line: 858 ]] --[[ Name: handleHiddenMessagesCleared ]]
        -- upvalues: v28 (ref), v38 (copy), l_Dictionary_0 (ref), v42 (copy), l_List_0 (ref), v37 (copy), v44 (copy)
        if not v28 then
            return;
        else
            v38(function(v221) --[[ Line: 865 ]]
                -- upvalues: l_Dictionary_0 (ref)
                return l_Dictionary_0.map(v221, function(v222) --[[ Line: 866 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    if v222.isHiddenMessage then
                        return l_Dictionary_0.join(v222, {
                            isVisibleInChatWindow = false
                        });
                    else
                        return v222;
                    end;
                end);
            end);
            v42(function(v223) --[[ Line: 878 ]]
                -- upvalues: l_List_0 (ref), v37 (ref)
                return l_List_0.filter(v223, function(v224) --[[ Line: 879 ]]
                    -- upvalues: v37 (ref)
                    local v225 = v37(false)[v224];
                    return v225 and not v225.isHiddenMessage;
                end);
            end);
            v44(function(v226) --[[ Line: 886 ]]
                -- upvalues: l_Dictionary_0 (ref), l_List_0 (ref), v37 (ref)
                return l_Dictionary_0.map(v226, function(v227) --[[ Line: 887 ]]
                    -- upvalues: l_List_0 (ref), v37 (ref)
                    return l_List_0.filter(v227, function(v228) --[[ Line: 888 ]]
                        -- upvalues: v37 (ref)
                        local v229 = v37(false)[v228];
                        return v229 and not v229.isHiddenMessage;
                    end);
                end);
            end);
            return;
        end;
    end;
    local function v237(v231) --[[ Line: 896 ]] --[[ Name: toggleGlobalTranslation ]]
        -- upvalues: v38 (copy), v27 (ref), v30 (ref), v23 (ref), v24 (ref)
        v38(function(v232) --[[ Line: 897 ]]
            -- upvalues: v231 (copy), v27 (ref), v30 (ref), v23 (ref), v24 (ref)
            if not v232 then
                return {};
            else
                local v233 = {};
                for v234, _ in pairs(v232) do
                    local v236 = v232[v234];
                    if v236 ~= nil then
                        v233[v234] = {
                            prefixText = v236.prefixText, 
                            text = v236.text, 
                            translation = v236.translation, 
                            useTranslation = v231, 
                            messageId = v236.messageId, 
                            status = v236.status, 
                            timestamp = v236.timestamp, 
                            isVisibleInBubbleChat = v236.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v236.isVisibleInChatWindow, 
                            partOrModel = v236.partOrModel, 
                            shouldOverrideBubbleChatSettings = v236.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v236.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v236.chatWindowMessageProperties, 
                            textChatMessageInstance = if v27() and v30 then v236.textChatMessageInstance else nil, 
                            userId = v236.userId, 
                            textChannel = v236.textChannel, 
                            wasRewritten = if v23 then v236.wasRewritten else nil, 
                            originalText = if v23 then v236.originalText else nil, 
                            chatActionType = if v24 then v236.chatActionType else nil
                        };
                    end;
                end;
                return v233;
            end;
        end);
    end;
    local function v242(v238, v239) --[[ Line: 942 ]] --[[ Name: toggleMessageTranslation ]]
        -- upvalues: v38 (copy), l_Dictionary_0 (ref), v27 (ref), v30 (ref), v23 (ref), v24 (ref)
        v38(function(v240) --[[ Line: 943 ]]
            -- upvalues: v239 (copy), l_Dictionary_0 (ref), v238 (copy), v27 (ref), v30 (ref), v23 (ref), v24 (ref)
            if not v240 then
                return {};
            else
                local v241 = v240[v239];
                if v241 ~= nil then
                    return l_Dictionary_0.join(v240, {
                        [v239] = {
                            prefixText = v241.prefixText, 
                            text = v241.text, 
                            translation = v241.translation, 
                            useTranslation = v238, 
                            messageId = v241.messageId, 
                            status = v241.status, 
                            timestamp = v241.timestamp, 
                            isVisibleInBubbleChat = v241.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v241.isVisibleInChatWindow, 
                            partOrModel = v241.partOrModel, 
                            shouldOverrideBubbleChatSettings = v241.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v241.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v241.chatWindowMessageProperties, 
                            textChatMessageInstance = if v27() and v30 then v241.textChatMessageInstance else nil, 
                            userId = v241.userId, 
                            textChannel = v241.textChannel, 
                            wasRewritten = if v23 then v241.wasRewritten else nil, 
                            originalText = if v23 then v241.originalText else nil, 
                            chatActionType = if v24 then v241.chatActionType else nil
                        }
                    });
                else
                    return v240;
                end;
            end;
        end);
    end;
    local function v247(v243) --[[ Line: 985 ]] --[[ Name: handleLegacyBubbleCreated ]]
        -- upvalues: v114 (copy)
        local l_timestamp_0 = v243.timestamp;
        local v245 = nil;
        v245 = if l_timestamp_0 then DateTime.fromUnixTimestampMillis(l_timestamp_0) else DateTime.now();
        local v246 = {
            userId = v243.userId, 
            prefixText = "", 
            text = v243.text, 
            messageId = v243.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v245, 
            partOrModel = v243.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            translation = nil, 
            useTranslation = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil
        };
        v114(v246);
    end;
    local function v253(v248, v249) --[[ Line: 1022 ]] --[[ Name: handleLegacyBubbleTextUpdated ]]
        -- upvalues: v38 (copy), l_Dictionary_0 (ref)
        v38(function(v250) --[[ Line: 1023 ]]
            -- upvalues: v248 (copy), l_Dictionary_0 (ref), v249 (copy)
            if not v250 then
                return {};
            elseif v250[v248] then
                local v251 = v250[v248];
                local v252 = l_Dictionary_0.join(v251, {
                    text = v249
                });
                return l_Dictionary_0.join(v250, {
                    [v248] = v252
                });
            else
                return v250;
            end;
        end);
    end;
    local function v260(v254) --[[ Line: 1048 ]] --[[ Name: registerMessageComponent ]]
        -- upvalues: v61 (copy), l_createSignal_0 (ref), v63 (copy), v58 (copy), l_List_0 (ref)
        if not v61[v254] then
            local v255, v256 = l_createSignal_0(nil);
            v61[v254] = {
                getter = v255, 
                setter = v256
            };
            local v257, v258 = l_createSignal_0(0);
            v63[v254] = {
                getter = v257, 
                setter = v258
            };
            v58(function(v259) --[[ Line: 1063 ]]
                -- upvalues: l_List_0 (ref), v254 (copy)
                return l_List_0.append(v259, v254);
            end);
        end;
        return v61[v254].getter;
    end;
    local function v270(v261) --[[ Line: 1072 ]] --[[ Name: unregisterMessageComponent ]]
        -- upvalues: v57 (copy), v61 (copy), v63 (copy), v58 (copy), l_List_0 (ref), v59 (copy), v60 (copy)
        local v262 = v57(false);
        local v263 = nil;
        for v264, v265 in ipairs(v262) do
            if v265 == v261 then
                v263 = v264;
                break;
            end;
        end;
        if v61[v261] then
            v61[v261] = nil;
        end;
        if v63[v261] then
            v63[v261] = nil;
        end;
        if v263 then
            v58(function(v266) --[[ Line: 1095 ]]
                -- upvalues: l_List_0 (ref), v261 (copy)
                return l_List_0.filter(v266, function(v267) --[[ Line: 1096 ]]
                    -- upvalues: v261 (ref)
                    return v267 ~= v261;
                end);
            end);
            local v268 = v57(false);
            local v269 = v59(false);
            if #v268 == 0 then
                v60(1);
                return;
            elseif v263 < v269 then
                v60(v269 - 1);
                return;
            elseif #v268 < v269 then
                v60(1);
            end;
        end;
    end;
    local function v273(v271) --[[ Line: 1119 ]] --[[ Name: getMessageComponentSignal ]]
        -- upvalues: v61 (copy)
        local v272 = v61[v271];
        if v272 then
            return v272.getter;
        else
            return nil;
        end;
    end;
    local function v276(v274) --[[ Line: 1125 ]] --[[ Name: getLayoutOrderSignal ]]
        -- upvalues: v63 (copy)
        local v275 = v63[v274];
        if v275 then
            return v275.getter;
        else
            return nil;
        end;
    end;
    v66 = function(v277) --[[ Line: 1131 ]] --[[ Name: updateNextMessageComponent ]]
        -- upvalues: v57 (copy), v59 (copy), v60 (copy), v61 (copy), v23 (ref), v62 (ref), v63 (copy)
        local v278 = v57(false);
        if #v278 == 0 then
            return;
        else
            local v279 = v59(false);
            local v280 = v278[v279];
            if not v280 then
                v60(1);
                return;
            else
                local v281 = v61[v280];
                if v281 then
                    v281.setter(v277);
                end;
                local v282 = v23 and 10 or 1;
                v62 = v62 + v282;
                local v283 = v63[v280];
                if v283 then
                    v283.setter(v62);
                end;
                local v284 = v279 % #v278 + 1;
                v60(v284);
                return;
            end;
        end;
    end;
    local function v292() --[[ Line: 1168 ]] --[[ Name: repopulateMessageComponents ]]
        -- upvalues: v64 (copy), v43 (copy), v41 (copy), v60 (copy), v62 (ref), v66 (ref), v57 (copy), v59 (copy), v61 (copy)
        local v285 = v64(false);
        local v286 = nil;
        v286 = if v285 then v43(false)[v285] or {} else v41(false);
        v60(1);
        v62 = 0;
        for _, v288 in ipairs(v286) do
            v66(v288);
        end;
        local v289 = v57(false);
        if #v286 < #v289 then
            for v290 = v59(false), #v289 do
                local v291 = v61[v289[v290]];
                if v291 then
                    v291.setter(nil);
                end;
            end;
        end;
    end;
    return {
        getByMessageId = v37, 
        getMessages = l_createComputed_0(function(v293) --[[ Line: 485 ]]
            -- upvalues: v37 (copy)
            local v294 = v37(v293);
            local v295 = {};
            local l_pairs_1 = pairs;
            local v297 = v294 or {};
            for _, v299 in l_pairs_1(v297) do
                table.insert(v295, v299);
            end;
            return v295;
        end), 
        getMessagesBySenderId = v39, 
        getWindowMessagesInOrder = v41, 
        getWindowMessagesInOrderByTabId = v43, 
        getMutedUserIds = v45, 
        getCanLocalUserChat = v47, 
        getIsBubbleChatEnabled = v49, 
        getMockUserIdToPartOrModel = v51, 
        getPartOrModelToMockUserId = v53, 
        getMessage = v120, 
        getUserMessages = v135, 
        getUserBubbleMessages = v137, 
        getUserLastMessage = v139, 
        registerMessageComponent = v260, 
        unregisterMessageComponent = v270, 
        repopulateMessageComponents = v292, 
        getMessageComponentSignal = v273, 
        getLayoutOrderSignal = v276, 
        updateNextMessageComponent = v66, 
        getMessageComponentRingBuffer = v57, 
        getNextMessageComponentPointer = v59, 
        setActiveChannelFilter = v65, 
        getActiveChannelFilter = v64, 
        setCanLocalUserChat = v48, 
        muteUser = v208, 
        unmuteUser = v211, 
        handlePlayerRemoved = v205, 
        clearWindowMessages = v220, 
        toggleGlobalTranslation = v237, 
        toggleMessageTranslation = v242, 
        handleIncomingOrOutgoingMessage = v184, 
        handleIncomingBubbleChatMessage = v187, 
        handleLegacyBubbleCreated = v247, 
        handleLegacyBubbleTextUpdated = v253, 
        handleHiddenMessageReceived = v196, 
        handleHiddenMessagesCleared = v230, 
        addSystemMessage = v156, 
        setChannelTabsConfigurationEnabled = v56
    };
end;