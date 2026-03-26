local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local v5 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v6 = require(l_script_FirstAncestor_0.Parent.ExpChatShared);
local v7 = require(l_script_FirstAncestor_0.getTextAndTranslation);
local v8 = require(l_script_FirstAncestor_0.Config);
local l_TextChatService_0 = game:GetService("TextChatService");
local l_HttpService_0 = game:GetService("HttpService");
local v11 = require(l_Parent_0.llama);
local l_List_0 = v11.List;
local l_Dictionary_0 = v11.Dictionary;
local l_Set_0 = v11.Set;
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local l_FFlagExpChatUseChatConfigStore_0 = v3.FFlagExpChatUseChatConfigStore;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v19 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeLowerBound);
local v20 = require(l_script_FirstAncestor_0.Flags.FIntExpChatRandomCharChangeUpperBound);
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v23 = require(l_script_FirstAncestor_0.Flags.FIntExpChatHiddenMessageMaxLength);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatClientRenderedEventFix);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 37 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    return l_TextChatService_0.ChatTranslationEnabled;
end;
return function() --[[ Line: 138 ]] --[[ Name: createMessagesStore ]]
    -- upvalues: l_createSignal_0 (copy), l_Dictionary_0 (copy), l_List_0 (copy), l_HttpService_0 (copy), l_createComputed_0 (copy), l_Set_0 (copy), v18 (copy), v7 (copy), v4 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v5 (copy), v6 (copy), v21 (copy), v24 (copy), v25 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v23 (copy), v19 (copy), v20 (copy), v8 (copy), v22 (copy)
    local v27 = {
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
    local v28, v29 = l_createSignal_0(v27.byMessageId);
    local v30, v31 = l_createSignal_0(v27.messagesBySenderId);
    local v32, v33 = l_createSignal_0(v27.windowMessagesInOrder);
    local v34, v35 = l_createSignal_0(v27.windowMessagesInOrderByTabId);
    local v36, v37 = l_createSignal_0(v27.mutedUserIds);
    local v38, v39 = l_createSignal_0(v27.canLocalUserChat);
    local v40, _ = l_createSignal_0(v27.isBubbleChatEnabled);
    local v42, v43 = l_createSignal_0(v27.mockUserIdToPartOrModel);
    local v44, v45 = l_createSignal_0(v27.partOrModelToMockUserId);
    local v46, v47 = l_createSignal_0(v27.messageComponentRingBuffer);
    local v48, v49 = l_createSignal_0(v27.nextMessageComponentPointer);
    local v50 = {};
    local v51 = 0;
    local v52 = {};
    local v53, v54 = l_createSignal_0(nil);
    local v55 = nil;
    local function v103(v56) --[[ Line: 187 ]] --[[ Name: addMessage ]]
        -- upvalues: v28 (copy), v29 (copy), l_Dictionary_0 (ref), v31 (copy), l_List_0 (ref), v44 (copy), l_HttpService_0 (ref), v43 (copy), v45 (copy), v32 (copy), v34 (copy), v27 (copy), v42 (copy), v33 (copy), v35 (copy)
        local v57 = v28(false);
        if v57 and v57[v56.messageId] then
            v29(function(v58) --[[ Line: 192 ]]
                -- upvalues: l_Dictionary_0 (ref), v56 (copy)
                return l_Dictionary_0.join(v58, {
                    [v56.messageId] = v56
                });
            end);
            if v56.userId then
                v31(function(v59) --[[ Line: 198 ]]
                    -- upvalues: v56 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v60 = v59[v56.userId] or {};
                    local v61 = nil;
                    for v62, v63 in ipairs(v60) do
                        if v63.messageId == v56.messageId then
                            v61 = v62;
                            break;
                        end;
                    end;
                    if v61 then
                        local v64 = l_List_0.set(v60, v61, v56);
                        return l_Dictionary_0.join(v59, {
                            [v56.userId] = v64
                        });
                    else
                        return v59;
                    end;
                end);
            end;
            return;
        else
            local l_userId_0 = v56.userId;
            local l_partOrModel_0 = v56.partOrModel;
            if not l_userId_0 and l_partOrModel_0 then
                l_userId_0 = v44(false)[l_partOrModel_0];
                if not l_userId_0 then
                    l_userId_0 = l_HttpService_0:GenerateGUID(false);
                    v43(function(v67) --[[ Line: 234 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_userId_0 (ref), l_partOrModel_0 (copy)
                        return l_Dictionary_0.join(v67, {
                            [l_userId_0] = l_partOrModel_0
                        });
                    end);
                    v45(function(v68) --[[ Line: 241 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_partOrModel_0 (copy), l_userId_0 (ref)
                        return l_Dictionary_0.join(v68, {
                            [l_partOrModel_0] = l_userId_0
                        });
                    end);
                end;
            end;
            local v69 = if v56.userId ~= l_userId_0 then l_Dictionary_0.join(v56, {
                userId = l_userId_0
            }) else v56;
            local v70 = nil;
            if v69.textChannel then
                v70 = v69.textChannel.Name;
                if v70 == "RBXSystem" then
                    v70 = "RBXGeneral";
                end;
            end;
            if v69.isVisibleInChatWindow then
                local v71 = v32(false);
                local v72 = if v70 then v34(false)[v70] or {} else {};
                if #v71 >= v27.messageLimit then
                    local v73 = v71[1];
                    local v74 = v57 and v57[v73];
                    if v74 then
                        local l_v73_0 = v73 --[[ copy: 8 -> 10 ]];
                        v29(function(v76) --[[ Line: 276 ]]
                            -- upvalues: l_Dictionary_0 (ref), l_v73_0 (copy)
                            return l_Dictionary_0.removeKey(v76, l_v73_0);
                        end);
                        if v74.userId then
                            local l_v73_1 = v73 --[[ copy: 8 -> 11 ]];
                            v31(function(v78) --[[ Line: 282 ]]
                                -- upvalues: v74 (copy), l_List_0 (ref), l_v73_1 (copy), v42 (ref), v45 (ref), l_Dictionary_0 (ref), v43 (ref)
                                local v79 = v78[v74.userId];
                                if v79 then
                                    local v81 = l_List_0.filter(v79, function(v80) --[[ Line: 285 ]]
                                        -- upvalues: l_v73_1 (ref)
                                        return v80.messageId ~= l_v73_1;
                                    end);
                                    if #v81 == 0 then
                                        local v82 = v42(false);
                                        if v82[v74.userId] then
                                            local v83 = v82[v74.userId];
                                            v45(function(v84) --[[ Line: 295 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v83 (copy)
                                                return l_Dictionary_0.removeKey(v84, v83);
                                            end);
                                            v43(function(v85) --[[ Line: 299 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v74 (ref)
                                                return l_Dictionary_0.removeKey(v85, v74.userId);
                                            end);
                                        end;
                                        return l_Dictionary_0.removeKey(v78, v74.userId);
                                    else
                                        return l_Dictionary_0.join(v78, {
                                            [v74.userId] = v81
                                        });
                                    end;
                                else
                                    return v78;
                                end;
                            end);
                        end;
                        v33(function(v86) --[[ Line: 316 ]]
                            -- upvalues: l_List_0 (ref)
                            return l_List_0.removeIndex(v86, 1);
                        end);
                    end;
                end;
                if v70 and #v72 >= v27.messageLimit then
                    local v87 = v72[1];
                    if v87 then
                        v35(function(v88) --[[ Line: 326 ]]
                            -- upvalues: v70 (ref), l_List_0 (ref), l_Dictionary_0 (ref)
                            local v89 = v88[v70] or {};
                            local v90 = l_List_0.removeIndex(v89, 1);
                            return l_Dictionary_0.join(v88, {
                                [v70] = v90
                            });
                        end);
                        if v57 and v57[v87] then
                            v29(function(v91) --[[ Line: 335 ]]
                                -- upvalues: l_Dictionary_0 (ref), v87 (copy)
                                return l_Dictionary_0.removeKey(v91, v87);
                            end);
                        end;
                    end;
                end;
            end;
            v29(function(v92) --[[ Line: 343 ]]
                -- upvalues: l_Dictionary_0 (ref), v69 (copy)
                return l_Dictionary_0.join(v92, {
                    [v69.messageId] = v69
                });
            end);
            if v69.userId then
                v31(function(v93) --[[ Line: 348 ]]
                    -- upvalues: v69 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v94 = v93[v69.userId] or {};
                    local v95 = false;
                    for _, v97 in ipairs(v94) do
                        if v97.messageId == v69.messageId then
                            v95 = true;
                            break;
                        end;
                    end;
                    if not v95 then
                        local v98 = l_List_0.append(v94, v69);
                        return l_Dictionary_0.join(v93, {
                            [v69.userId] = v98
                        });
                    else
                        return v93;
                    end;
                end);
            end;
            if v69.isVisibleInChatWindow then
                v33(function(v99) --[[ Line: 373 ]]
                    -- upvalues: l_List_0 (ref), v69 (copy)
                    return l_List_0.append(v99, v69.messageId);
                end);
                if v70 then
                    v35(function(v100) --[[ Line: 379 ]]
                        -- upvalues: v70 (ref), l_List_0 (ref), v69 (copy), l_Dictionary_0 (ref)
                        local v101 = v100[v70] or {};
                        local v102 = l_List_0.append(v101, v69.messageId);
                        return l_Dictionary_0.join(v100, {
                            [v70] = v102
                        });
                    end);
                end;
            end;
            return;
        end;
    end;
    local v104 = {};
    local v105 = {};
    local function v109(v106) --[[ Line: 400 ]] --[[ Name: getMessage ]]
        -- upvalues: v104 (copy), l_createComputed_0 (ref), v28 (copy)
        if not v104[v106] then
            v104[v106] = l_createComputed_0(function(v107) --[[ Line: 402 ]]
                -- upvalues: v28 (ref), v106 (copy)
                local v108 = v28(v107);
                if not v108 or not v108[v106] then
                    return nil;
                else
                    return v108[v106];
                end;
            end);
        end;
        return v104[v106];
    end;
    local function v122(v110) --[[ Line: 413 ]] --[[ Name: getUserMessageCache ]]
        -- upvalues: v105 (copy), l_createComputed_0 (ref), v30 (copy), v36 (copy), l_Set_0 (ref)
        local v111 = tostring(v110);
        if not v105[v111] then
            v105[v111] = {};
            v105[v111].messages = l_createComputed_0(function(v112) --[[ Line: 417 ]]
                -- upvalues: v30 (ref), v111 (copy)
                return v30(v112)[v111] or {};
            end);
            v105[v111].bubbleMessages = l_createComputed_0(function(v113) --[[ Line: 421 ]]
                -- upvalues: v105 (ref), v111 (copy), v36 (ref), l_Set_0 (ref)
                local v114 = v105[v111].messages(v113);
                local v115 = v36(v113);
                local v116 = {};
                for _, v118 in ipairs(v114) do
                    local v119 = v118.userId and l_Set_0.has(v115, v118.userId) or false;
                    if v118.isVisibleInBubbleChat and not v119 then
                        table.insert(v116, v118);
                    end;
                end;
                return v116;
            end);
            v105[v111].lastMessage = l_createComputed_0(function(v120) --[[ Line: 433 ]]
                -- upvalues: v105 (ref), v111 (copy)
                local v121 = v105[v111].messages(v120);
                if #v121 > 0 then
                    return v121[#v121];
                else
                    return nil;
                end;
            end);
        end;
        return v105[v111];
    end;
    local function v124(v123) --[[ Line: 444 ]] --[[ Name: getUserMessages ]]
        -- upvalues: v122 (copy)
        return v122(v123).messages;
    end;
    local function v126(v125) --[[ Line: 449 ]] --[[ Name: getUserBubbleMessages ]]
        -- upvalues: v122 (copy)
        return v122(v125).bubbleMessages;
    end;
    local function v128(v127) --[[ Line: 454 ]] --[[ Name: getUserLastMessage ]]
        -- upvalues: v122 (copy)
        return v122(v127).lastMessage;
    end;
    local _ = function() --[[ Line: 459 ]] --[[ Name: createMessagesArraySignal ]]
        -- upvalues: l_createComputed_0 (ref), v28 (copy)
        return l_createComputed_0(function(v129) --[[ Line: 460 ]]
            -- upvalues: v28 (ref)
            local v130 = v28(v129);
            local v131 = {};
            local l_pairs_0 = pairs;
            local v133 = v130 or {};
            for _, v135 in l_pairs_0(v133) do
                table.insert(v131, v135);
            end;
            return v131;
        end);
    end;
    local function v157(v137, _) --[[ Line: 470 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: v18 (ref), v7 (ref), v4 (ref), v28 (copy), v38 (copy), v36 (copy), l_Set_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v5 (ref), v6 (ref), v40 (copy), v21 (ref), v24 (ref), v103 (copy), v25 (ref), v53 (copy), v55 (ref)
        local v139 = nil;
        local v140 = nil;
        if v18 then
            local v141, v142 = v7(v137);
            v139 = v141;
            v140 = v142;
        else
            v139 = v137.Text;
            v140 = v137.Translation;
        end;
        if v4(v139) and v137.Status ~= Enum.TextChatMessageStatus.Floodchecked and v137.Status ~= Enum.TextChatMessageStatus.MessageTooLong then
            return;
        else
            local v143 = if v137.TextSource then tostring(v137.TextSource.UserId) else nil;
            if not v28(false) then
                return;
            else
                local v144 = v38(false);
                local v145 = nil;
                if v143 == nil then
                    v145 = true;
                elseif not v144 then
                    v145 = false;
                else
                    local v146 = true;
                    if v137.Status ~= Enum.TextChatMessageStatus.Success then
                        v146 = v137.Status == Enum.TextChatMessageStatus.Sending;
                    end;
                    v145 = v146;
                end;
                local v147 = if v143 and v36(false) then l_Set_0.has(v36(false), v143) else false;
                v145 = v145 and not v147;
                local v148 = false;
                local v149 = nil;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v149 = v5(false).getIsBubbleChatEnabled(false);
                else
                    local v150 = v6.context and v6.context.store;
                    v149 = if v150 then v150:getState().Messages.isBubbleChatEnabled else v40(false);
                end;
                if v149 and v145 and (v137.Status == Enum.TextChatMessageStatus.Success or v137.Status == Enum.TextChatMessageStatus.Sending) then
                    v148 = true;
                end;
                if v137.Status ~= Enum.TextChatMessageStatus.Success and v137.Status ~= Enum.TextChatMessageStatus.Sending then
                    v145 = false;
                    v148 = false;
                end;
                local v151 = nil;
                if v137.TextChannel then
                    v151 = v137.TextChannel.Name;
                    if v151 == "RBXSystem" then
                        v151 = "RBXGeneral";
                    end;
                end;
                local v152 = {
                    userId = v143, 
                    prefixText = v137.PrefixText, 
                    text = v139, 
                    translation = v140, 
                    useTranslation = getChatTranslationEnabled() and v140 ~= nil, 
                    messageId = v137.MessageId, 
                    status = v137.Status, 
                    timestamp = v137.Timestamp, 
                    shouldOverrideBubbleChatSettings = false, 
                    isVisibleInBubbleChat = v148, 
                    isVisibleInChatWindow = v145, 
                    textChannel = v137.TextChannel, 
                    bubbleChatMessageProperties = v137.BubbleChatMessageProperties, 
                    chatWindowMessageProperties = v137.ChatWindowMessageProperties, 
                    textChatMessageInstance = if v21() and v24 then v137 else nil, 
                    partOrModel = v137.TextSource and v137.TextSource.Parent or nil, 
                    wasRewritten = if v18 then v137.WasRewritten else nil, 
                    originalText = if v18 then v137.OriginalText else nil
                };
                local v153 = v28(false);
                local v154 = v153 and v153[v152.messageId] ~= nil;
                if v152.isVisibleInChatWindow or v152.isVisibleInBubbleChat or v154 then
                    v103(v152);
                    if v25 and v152.isVisibleInChatWindow and not v154 then
                        local v155 = v53(false);
                        local v156 = true;
                        if v155 ~= nil then
                            v156 = v151 == v155;
                        end;
                        if v156 then
                            v55(v152.messageId);
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v160(v158) --[[ Line: 601 ]] --[[ Name: handleIncomingBubbleChatMessage ]]
        -- upvalues: v103 (copy)
        local v159 = {
            userId = v158.bubbleChatMessageUserId, 
            prefixText = "", 
            text = v158.message, 
            translation = v158.translation, 
            useTranslation = getChatTranslationEnabled(), 
            textChannel = nil, 
            messageId = v158.bubbleChatMessageId, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v158.timestamp, 
            partOrModel = v158.partOrModel, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            bubbleChatMessageProperties = v158.bubbleChatMessageProperties, 
            chatWindowMessageProperties = nil
        };
        v103(v159);
    end;
    local function v169(v161) --[[ Line: 624 ]] --[[ Name: handleHiddenMessageReceived ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v23 (ref), v19 (ref), v20 (ref), v8 (ref), v21 (ref), v103 (copy)
        local v162 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled();
        local v163 = if v162 and string.len(v161.Text) > v23 then v23 else string.len(v161.Text);
        local v164 = math.max(v19, -(v163 - 1));
        local l_v20_0 = v20;
        local v166 = math.random(v164, l_v20_0);
        local v167 = string.rep(if v162 then v8.INTERPUNCT_TEXT else v8.DOT_TEXT, v163 + v166);
        local v168 = {
            userId = nil, 
            prefixText = v8.LOCK_EMOJI .. " :", 
            text = v167, 
            textChannel = v161.TextChannel, 
            messageId = v161.MessageId, 
            status = v161.Status, 
            timestamp = v161.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v21() then v161 else nil, 
            isHiddenMessage = true
        };
        return v103(v168);
    end;
    local function v178(v170) --[[ Line: 660 ]] --[[ Name: handlePlayerRemoved ]]
        -- upvalues: v31 (copy), l_Dictionary_0 (ref), v37 (copy), l_Set_0 (ref), v30 (copy), v42 (copy), v45 (copy), v43 (copy)
        v31(function(v171) --[[ Line: 662 ]]
            -- upvalues: l_Dictionary_0 (ref), v170 (copy)
            return l_Dictionary_0.removeKey(v171, v170);
        end);
        v37(function(v172) --[[ Line: 666 ]]
            -- upvalues: l_Set_0 (ref), v170 (copy), v30 (ref), v42 (ref), v45 (ref), l_Dictionary_0 (ref), v43 (ref)
            if not v172 then
                return {};
            else
                local v173 = not l_Set_0.has(v172, v170);
                if #(v30(false)[v170] or {}) == 0 and v173 then
                    return v172;
                else
                    local v174 = v42(false);
                    if v174[v170] then
                        local v175 = v174[v170];
                        v45(function(v176) --[[ Line: 681 ]]
                            -- upvalues: l_Dictionary_0 (ref), v175 (copy)
                            return l_Dictionary_0.removeKey(v176, v175);
                        end);
                        v43(function(v177) --[[ Line: 685 ]]
                            -- upvalues: l_Dictionary_0 (ref), v170 (ref)
                            return l_Dictionary_0.removeKey(v177, v170);
                        end);
                    end;
                    return l_Set_0.subtract(v172, v170);
                end;
            end;
        end);
    end;
    local function v181(v179) --[[ Line: 694 ]] --[[ Name: muteUser ]]
        -- upvalues: v37 (copy), l_Set_0 (ref)
        v37(function(v180) --[[ Line: 695 ]]
            -- upvalues: l_Set_0 (ref), v179 (copy)
            if not v180 then
                return {};
            else
                return (l_Set_0.add(v180, v179));
            end;
        end);
    end;
    local function v184(v182) --[[ Line: 704 ]] --[[ Name: unmuteUser ]]
        -- upvalues: v37 (copy), l_Set_0 (ref)
        v37(function(v183) --[[ Line: 705 ]]
            -- upvalues: l_Set_0 (ref), v182 (copy)
            if not v183 then
                return {};
            else
                return (l_Set_0.subtract(v183, v182));
            end;
        end);
    end;
    local function v193() --[[ Line: 714 ]] --[[ Name: clearWindowMessages ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref), v33 (copy), v35 (copy), v25 (ref), v49 (copy), v51 (ref), v46 (copy), v50 (copy)
        v29(function(v185) --[[ Line: 715 ]]
            -- upvalues: l_Dictionary_0 (ref)
            if not v185 then
                return {};
            else
                return (l_Dictionary_0.map(v185, function(v186) --[[ Line: 720 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    return l_Dictionary_0.join(v186, {
                        isVisibleInChatWindow = false
                    });
                end));
            end;
        end);
        v33(function(_) --[[ Line: 730 ]]
            return {};
        end);
        v35(function(_) --[[ Line: 735 ]]
            return {};
        end);
        if v25 then
            v49(1);
            v51 = 0;
            local v189 = v46(false);
            for _, v191 in ipairs(v189) do
                local v192 = v50[v191];
                if v192 then
                    v192.setter(nil);
                end;
            end;
        end;
    end;
    local function v203() --[[ Line: 755 ]] --[[ Name: handleHiddenMessagesCleared ]]
        -- upvalues: v22 (ref), v29 (copy), l_Dictionary_0 (ref), v33 (copy), l_List_0 (ref), v28 (copy), v35 (copy)
        if not v22 then
            return;
        else
            v29(function(v194) --[[ Line: 762 ]]
                -- upvalues: l_Dictionary_0 (ref)
                return l_Dictionary_0.map(v194, function(v195) --[[ Line: 763 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    if v195.isHiddenMessage then
                        return l_Dictionary_0.join(v195, {
                            isVisibleInChatWindow = false
                        });
                    else
                        return v195;
                    end;
                end);
            end);
            v33(function(v196) --[[ Line: 775 ]]
                -- upvalues: l_List_0 (ref), v28 (ref)
                return l_List_0.filter(v196, function(v197) --[[ Line: 776 ]]
                    -- upvalues: v28 (ref)
                    local v198 = v28(false)[v197];
                    return v198 and not v198.isHiddenMessage;
                end);
            end);
            v35(function(v199) --[[ Line: 783 ]]
                -- upvalues: l_Dictionary_0 (ref), l_List_0 (ref), v28 (ref)
                return l_Dictionary_0.map(v199, function(v200) --[[ Line: 784 ]]
                    -- upvalues: l_List_0 (ref), v28 (ref)
                    return l_List_0.filter(v200, function(v201) --[[ Line: 785 ]]
                        -- upvalues: v28 (ref)
                        local v202 = v28(false)[v201];
                        return v202 and not v202.isHiddenMessage;
                    end);
                end);
            end);
            return;
        end;
    end;
    local function v210(v204) --[[ Line: 793 ]] --[[ Name: toggleGlobalTranslation ]]
        -- upvalues: v29 (copy), v21 (ref), v24 (ref), v18 (ref)
        v29(function(v205) --[[ Line: 794 ]]
            -- upvalues: v204 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v205 then
                return {};
            else
                local v206 = {};
                for v207, _ in pairs(v205) do
                    local v209 = v205[v207];
                    if v209 ~= nil then
                        v206[v207] = {
                            prefixText = v209.prefixText, 
                            text = v209.text, 
                            translation = v209.translation, 
                            useTranslation = v204, 
                            messageId = v209.messageId, 
                            status = v209.status, 
                            timestamp = v209.timestamp, 
                            isVisibleInBubbleChat = v209.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v209.isVisibleInChatWindow, 
                            partOrModel = v209.partOrModel, 
                            shouldOverrideBubbleChatSettings = v209.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v209.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v209.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v209.textChatMessageInstance else nil, 
                            userId = v209.userId, 
                            textChannel = v209.textChannel, 
                            wasRewritten = if v18 then v209.wasRewritten else nil, 
                            originalText = if v18 then v209.originalText else nil
                        };
                    end;
                end;
                return v206;
            end;
        end);
    end;
    local function v215(v211, v212) --[[ Line: 836 ]] --[[ Name: toggleMessageTranslation ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref), v21 (ref), v24 (ref), v18 (ref)
        v29(function(v213) --[[ Line: 837 ]]
            -- upvalues: v212 (copy), l_Dictionary_0 (ref), v211 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v213 then
                return {};
            else
                local v214 = v213[v212];
                if v214 ~= nil then
                    return l_Dictionary_0.join(v213, {
                        [v212] = {
                            prefixText = v214.prefixText, 
                            text = v214.text, 
                            translation = v214.translation, 
                            useTranslation = v211, 
                            messageId = v214.messageId, 
                            status = v214.status, 
                            timestamp = v214.timestamp, 
                            isVisibleInBubbleChat = v214.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v214.isVisibleInChatWindow, 
                            partOrModel = v214.partOrModel, 
                            shouldOverrideBubbleChatSettings = v214.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v214.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v214.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v214.textChatMessageInstance else nil, 
                            userId = v214.userId, 
                            textChannel = v214.textChannel, 
                            wasRewritten = if v18 then v214.wasRewritten else nil, 
                            originalText = if v18 then v214.originalText else nil
                        }
                    });
                else
                    return v213;
                end;
            end;
        end);
    end;
    local function v220(v216) --[[ Line: 878 ]] --[[ Name: handleLegacyBubbleCreated ]]
        -- upvalues: v103 (copy)
        local l_timestamp_0 = v216.timestamp;
        local v218 = nil;
        v218 = if l_timestamp_0 then DateTime.fromUnixTimestampMillis(l_timestamp_0) else DateTime.now();
        local v219 = {
            userId = v216.userId, 
            prefixText = "", 
            text = v216.text, 
            messageId = v216.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v218, 
            partOrModel = v216.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            translation = nil, 
            useTranslation = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil
        };
        v103(v219);
    end;
    local function v226(v221, v222) --[[ Line: 915 ]] --[[ Name: handleLegacyBubbleTextUpdated ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref)
        v29(function(v223) --[[ Line: 916 ]]
            -- upvalues: v221 (copy), l_Dictionary_0 (ref), v222 (copy)
            if not v223 then
                return {};
            elseif v223[v221] then
                local v224 = v223[v221];
                local v225 = l_Dictionary_0.join(v224, {
                    text = v222
                });
                return l_Dictionary_0.join(v223, {
                    [v221] = v225
                });
            else
                return v223;
            end;
        end);
    end;
    local function v233(v227) --[[ Line: 941 ]] --[[ Name: registerMessageComponent ]]
        -- upvalues: v50 (copy), l_createSignal_0 (ref), v52 (copy), v47 (copy), l_List_0 (ref)
        if not v50[v227] then
            local v228, v229 = l_createSignal_0(nil);
            v50[v227] = {
                getter = v228, 
                setter = v229
            };
            local v230, v231 = l_createSignal_0(0);
            v52[v227] = {
                getter = v230, 
                setter = v231
            };
            v47(function(v232) --[[ Line: 956 ]]
                -- upvalues: l_List_0 (ref), v227 (copy)
                return l_List_0.append(v232, v227);
            end);
        end;
        return v50[v227].getter;
    end;
    local function v243(v234) --[[ Line: 965 ]] --[[ Name: unregisterMessageComponent ]]
        -- upvalues: v46 (copy), v50 (copy), v52 (copy), v47 (copy), l_List_0 (ref), v48 (copy), v49 (copy)
        local v235 = v46(false);
        local v236 = nil;
        for v237, v238 in ipairs(v235) do
            if v238 == v234 then
                v236 = v237;
                break;
            end;
        end;
        if v50[v234] then
            v50[v234] = nil;
        end;
        if v52[v234] then
            v52[v234] = nil;
        end;
        if v236 then
            v47(function(v239) --[[ Line: 988 ]]
                -- upvalues: l_List_0 (ref), v234 (copy)
                return l_List_0.filter(v239, function(v240) --[[ Line: 989 ]]
                    -- upvalues: v234 (ref)
                    return v240 ~= v234;
                end);
            end);
            local v241 = v46(false);
            local v242 = v48(false);
            if #v241 == 0 then
                v49(1);
                return;
            elseif v236 < v242 then
                v49(v242 - 1);
                return;
            elseif #v241 < v242 then
                v49(1);
            end;
        end;
    end;
    local function v246(v244) --[[ Line: 1012 ]] --[[ Name: getMessageComponentSignal ]]
        -- upvalues: v50 (copy)
        local v245 = v50[v244];
        if v245 then
            return v245.getter;
        else
            return nil;
        end;
    end;
    local function v249(v247) --[[ Line: 1018 ]] --[[ Name: getLayoutOrderSignal ]]
        -- upvalues: v52 (copy)
        local v248 = v52[v247];
        if v248 then
            return v248.getter;
        else
            return nil;
        end;
    end;
    v55 = function(v250) --[[ Line: 1024 ]] --[[ Name: updateNextMessageComponent ]]
        -- upvalues: v46 (copy), v48 (copy), v49 (copy), v50 (copy), v51 (ref), v52 (copy)
        local v251 = v46(false);
        if #v251 == 0 then
            return;
        else
            local v252 = v48(false);
            local v253 = v251[v252];
            if not v253 then
                v49(1);
                return;
            else
                local v254 = v50[v253];
                if v254 then
                    v254.setter(v250);
                end;
                v51 = v51 + 1;
                local v255 = v52[v253];
                if v255 then
                    v255.setter(v51);
                end;
                local v256 = v252 % #v251 + 1;
                v49(v256);
                return;
            end;
        end;
    end;
    local function v264() --[[ Line: 1059 ]] --[[ Name: repopulateMessageComponents ]]
        -- upvalues: v53 (copy), v34 (copy), v32 (copy), v49 (copy), v51 (ref), v55 (ref), v46 (copy), v48 (copy), v50 (copy)
        local v257 = v53(false);
        local v258 = nil;
        v258 = if v257 then v34(false)[v257] or {} else v32(false);
        v49(1);
        v51 = 0;
        for _, v260 in ipairs(v258) do
            v55(v260);
        end;
        local v261 = v46(false);
        if #v258 < #v261 then
            for v262 = v48(false), #v261 do
                local v263 = v50[v261[v262]];
                if v263 then
                    v263.setter(nil);
                end;
            end;
        end;
    end;
    return {
        getByMessageId = v28, 
        getMessages = l_createComputed_0(function(v265) --[[ Line: 460 ]]
            -- upvalues: v28 (copy)
            local v266 = v28(v265);
            local v267 = {};
            local l_pairs_1 = pairs;
            local v269 = v266 or {};
            for _, v271 in l_pairs_1(v269) do
                table.insert(v267, v271);
            end;
            return v267;
        end), 
        getMessagesBySenderId = v30, 
        getWindowMessagesInOrder = v32, 
        getWindowMessagesInOrderByTabId = v34, 
        getMutedUserIds = v36, 
        getCanLocalUserChat = v38, 
        getIsBubbleChatEnabled = v40, 
        getMockUserIdToPartOrModel = v42, 
        getPartOrModelToMockUserId = v44, 
        getMessage = v109, 
        getUserMessages = v124, 
        getUserBubbleMessages = v126, 
        getUserLastMessage = v128, 
        registerMessageComponent = v233, 
        unregisterMessageComponent = v243, 
        repopulateMessageComponents = v264, 
        getMessageComponentSignal = v246, 
        getLayoutOrderSignal = v249, 
        updateNextMessageComponent = v55, 
        getMessageComponentRingBuffer = v46, 
        getNextMessageComponentPointer = v48, 
        setActiveChannelFilter = v54, 
        getActiveChannelFilter = v53, 
        setCanLocalUserChat = v39, 
        muteUser = v181, 
        unmuteUser = v184, 
        handlePlayerRemoved = v178, 
        clearWindowMessages = v193, 
        toggleGlobalTranslation = v210, 
        toggleMessageTranslation = v215, 
        handleIncomingOrOutgoingMessage = v157, 
        handleIncomingBubbleChatMessage = v160, 
        handleLegacyBubbleCreated = v220, 
        handleLegacyBubbleTextUpdated = v226, 
        handleHiddenMessageReceived = v169, 
        handleHiddenMessagesCleared = v203
    };
end;