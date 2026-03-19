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
return function() --[[ Line: 139 ]] --[[ Name: createMessagesStore ]]
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
    local v53, v54 = l_createSignal_0(0);
    local v55, v56 = l_createSignal_0(nil);
    local v57 = nil;
    local function v105(v58) --[[ Line: 191 ]] --[[ Name: addMessage ]]
        -- upvalues: v28 (copy), v29 (copy), l_Dictionary_0 (ref), v31 (copy), l_List_0 (ref), v44 (copy), l_HttpService_0 (ref), v43 (copy), v45 (copy), v32 (copy), v34 (copy), v27 (copy), v42 (copy), v33 (copy), v35 (copy)
        local v59 = v28(false);
        if v59 and v59[v58.messageId] then
            v29(function(v60) --[[ Line: 196 ]]
                -- upvalues: l_Dictionary_0 (ref), v58 (copy)
                return l_Dictionary_0.join(v60, {
                    [v58.messageId] = v58
                });
            end);
            if v58.userId then
                v31(function(v61) --[[ Line: 202 ]]
                    -- upvalues: v58 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v62 = v61[v58.userId] or {};
                    local v63 = nil;
                    for v64, v65 in ipairs(v62) do
                        if v65.messageId == v58.messageId then
                            v63 = v64;
                            break;
                        end;
                    end;
                    if v63 then
                        local v66 = l_List_0.set(v62, v63, v58);
                        return l_Dictionary_0.join(v61, {
                            [v58.userId] = v66
                        });
                    else
                        return v61;
                    end;
                end);
            end;
            return;
        else
            local l_userId_0 = v58.userId;
            local l_partOrModel_0 = v58.partOrModel;
            if not l_userId_0 and l_partOrModel_0 then
                l_userId_0 = v44(false)[l_partOrModel_0];
                if not l_userId_0 then
                    l_userId_0 = l_HttpService_0:GenerateGUID(false);
                    v43(function(v69) --[[ Line: 238 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_userId_0 (ref), l_partOrModel_0 (copy)
                        return l_Dictionary_0.join(v69, {
                            [l_userId_0] = l_partOrModel_0
                        });
                    end);
                    v45(function(v70) --[[ Line: 245 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_partOrModel_0 (copy), l_userId_0 (ref)
                        return l_Dictionary_0.join(v70, {
                            [l_partOrModel_0] = l_userId_0
                        });
                    end);
                end;
            end;
            local v71 = if v58.userId ~= l_userId_0 then l_Dictionary_0.join(v58, {
                userId = l_userId_0
            }) else v58;
            local v72 = nil;
            if v71.textChannel then
                v72 = v71.textChannel.Name;
                if v72 == "RBXSystem" then
                    v72 = "RBXGeneral";
                end;
            end;
            if v71.isVisibleInChatWindow then
                local v73 = v32(false);
                local v74 = if v72 then v34(false)[v72] or {} else {};
                if #v73 >= v27.messageLimit then
                    local v75 = v73[1];
                    local v76 = v59 and v59[v75];
                    if v76 then
                        local l_v75_0 = v75 --[[ copy: 8 -> 10 ]];
                        v29(function(v78) --[[ Line: 280 ]]
                            -- upvalues: l_Dictionary_0 (ref), l_v75_0 (copy)
                            return l_Dictionary_0.removeKey(v78, l_v75_0);
                        end);
                        if v76.userId then
                            local l_v75_1 = v75 --[[ copy: 8 -> 11 ]];
                            v31(function(v80) --[[ Line: 286 ]]
                                -- upvalues: v76 (copy), l_List_0 (ref), l_v75_1 (copy), v42 (ref), v45 (ref), l_Dictionary_0 (ref), v43 (ref)
                                local v81 = v80[v76.userId];
                                if v81 then
                                    local v83 = l_List_0.filter(v81, function(v82) --[[ Line: 289 ]]
                                        -- upvalues: l_v75_1 (ref)
                                        return v82.messageId ~= l_v75_1;
                                    end);
                                    if #v83 == 0 then
                                        local v84 = v42(false);
                                        if v84[v76.userId] then
                                            local v85 = v84[v76.userId];
                                            v45(function(v86) --[[ Line: 299 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v85 (copy)
                                                return l_Dictionary_0.removeKey(v86, v85);
                                            end);
                                            v43(function(v87) --[[ Line: 303 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v76 (ref)
                                                return l_Dictionary_0.removeKey(v87, v76.userId);
                                            end);
                                        end;
                                        return l_Dictionary_0.removeKey(v80, v76.userId);
                                    else
                                        return l_Dictionary_0.join(v80, {
                                            [v76.userId] = v83
                                        });
                                    end;
                                else
                                    return v80;
                                end;
                            end);
                        end;
                        v33(function(v88) --[[ Line: 320 ]]
                            -- upvalues: l_List_0 (ref)
                            return l_List_0.removeIndex(v88, 1);
                        end);
                    end;
                end;
                if v72 and #v74 >= v27.messageLimit then
                    local v89 = v74[1];
                    if v89 then
                        v35(function(v90) --[[ Line: 330 ]]
                            -- upvalues: v72 (ref), l_List_0 (ref), l_Dictionary_0 (ref)
                            local v91 = v90[v72] or {};
                            local v92 = l_List_0.removeIndex(v91, 1);
                            return l_Dictionary_0.join(v90, {
                                [v72] = v92
                            });
                        end);
                        if v59 and v59[v89] then
                            v29(function(v93) --[[ Line: 339 ]]
                                -- upvalues: l_Dictionary_0 (ref), v89 (copy)
                                return l_Dictionary_0.removeKey(v93, v89);
                            end);
                        end;
                    end;
                end;
            end;
            v29(function(v94) --[[ Line: 347 ]]
                -- upvalues: l_Dictionary_0 (ref), v71 (copy)
                return l_Dictionary_0.join(v94, {
                    [v71.messageId] = v71
                });
            end);
            if v71.userId then
                v31(function(v95) --[[ Line: 352 ]]
                    -- upvalues: v71 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v96 = v95[v71.userId] or {};
                    local v97 = false;
                    for _, v99 in ipairs(v96) do
                        if v99.messageId == v71.messageId then
                            v97 = true;
                            break;
                        end;
                    end;
                    if not v97 then
                        local v100 = l_List_0.append(v96, v71);
                        return l_Dictionary_0.join(v95, {
                            [v71.userId] = v100
                        });
                    else
                        return v95;
                    end;
                end);
            end;
            if v71.isVisibleInChatWindow then
                v33(function(v101) --[[ Line: 377 ]]
                    -- upvalues: l_List_0 (ref), v71 (copy)
                    return l_List_0.append(v101, v71.messageId);
                end);
                if v72 then
                    v35(function(v102) --[[ Line: 383 ]]
                        -- upvalues: v72 (ref), l_List_0 (ref), v71 (copy), l_Dictionary_0 (ref)
                        local v103 = v102[v72] or {};
                        local v104 = l_List_0.append(v103, v71.messageId);
                        return l_Dictionary_0.join(v102, {
                            [v72] = v104
                        });
                    end);
                end;
            end;
            return;
        end;
    end;
    local v106 = {};
    local v107 = {};
    local function v111(v108) --[[ Line: 404 ]] --[[ Name: getMessage ]]
        -- upvalues: v106 (copy), l_createComputed_0 (ref), v28 (copy)
        if not v106[v108] then
            v106[v108] = l_createComputed_0(function(v109) --[[ Line: 406 ]]
                -- upvalues: v28 (ref), v108 (copy)
                local v110 = v28(v109);
                if not v110 or not v110[v108] then
                    return nil;
                else
                    return v110[v108];
                end;
            end);
        end;
        return v106[v108];
    end;
    local function v124(v112) --[[ Line: 417 ]] --[[ Name: getUserMessageCache ]]
        -- upvalues: v107 (copy), l_createComputed_0 (ref), v30 (copy), v36 (copy), l_Set_0 (ref)
        local v113 = tostring(v112);
        if not v107[v113] then
            v107[v113] = {};
            v107[v113].messages = l_createComputed_0(function(v114) --[[ Line: 421 ]]
                -- upvalues: v30 (ref), v113 (copy)
                return v30(v114)[v113] or {};
            end);
            v107[v113].bubbleMessages = l_createComputed_0(function(v115) --[[ Line: 425 ]]
                -- upvalues: v107 (ref), v113 (copy), v36 (ref), l_Set_0 (ref)
                local v116 = v107[v113].messages(v115);
                local v117 = v36(v115);
                local v118 = {};
                for _, v120 in ipairs(v116) do
                    local v121 = v120.userId and l_Set_0.has(v117, v120.userId) or false;
                    if v120.isVisibleInBubbleChat and not v121 then
                        table.insert(v118, v120);
                    end;
                end;
                return v118;
            end);
            v107[v113].lastMessage = l_createComputed_0(function(v122) --[[ Line: 437 ]]
                -- upvalues: v107 (ref), v113 (copy)
                local v123 = v107[v113].messages(v122);
                if #v123 > 0 then
                    return v123[#v123];
                else
                    return nil;
                end;
            end);
        end;
        return v107[v113];
    end;
    local function v126(v125) --[[ Line: 448 ]] --[[ Name: getUserMessages ]]
        -- upvalues: v124 (copy)
        return v124(v125).messages;
    end;
    local function v128(v127) --[[ Line: 453 ]] --[[ Name: getUserBubbleMessages ]]
        -- upvalues: v124 (copy)
        return v124(v127).bubbleMessages;
    end;
    local function v130(v129) --[[ Line: 458 ]] --[[ Name: getUserLastMessage ]]
        -- upvalues: v124 (copy)
        return v124(v129).lastMessage;
    end;
    local _ = function() --[[ Line: 463 ]] --[[ Name: createMessagesArraySignal ]]
        -- upvalues: l_createComputed_0 (ref), v28 (copy)
        return l_createComputed_0(function(v131) --[[ Line: 464 ]]
            -- upvalues: v28 (ref)
            local v132 = v28(v131);
            local v133 = {};
            local l_pairs_0 = pairs;
            local v135 = v132 or {};
            for _, v137 in l_pairs_0(v135) do
                table.insert(v133, v137);
            end;
            return v133;
        end);
    end;
    local function v160(v139, _) --[[ Line: 474 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: v18 (ref), v7 (ref), v4 (ref), v28 (copy), v38 (copy), v36 (copy), l_Set_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v5 (ref), v6 (ref), v40 (copy), v21 (ref), v24 (ref), v105 (copy), v25 (ref), v55 (copy), v57 (ref), v54 (copy)
        local v141 = nil;
        local v142 = nil;
        if v18 then
            local v143, v144 = v7(v139);
            v141 = v143;
            v142 = v144;
        else
            v141 = v139.Text;
            v142 = v139.Translation;
        end;
        if v4(v141) and v139.Status ~= Enum.TextChatMessageStatus.Floodchecked and v139.Status ~= Enum.TextChatMessageStatus.MessageTooLong then
            return;
        else
            local v145 = if v139.TextSource then tostring(v139.TextSource.UserId) else nil;
            if not v28(false) then
                return;
            else
                local v146 = v38(false);
                local v147 = nil;
                if v145 == nil then
                    v147 = true;
                elseif not v146 then
                    v147 = false;
                else
                    local v148 = true;
                    if v139.Status ~= Enum.TextChatMessageStatus.Success then
                        v148 = v139.Status == Enum.TextChatMessageStatus.Sending;
                    end;
                    v147 = v148;
                end;
                local v149 = if v145 and v36(false) then l_Set_0.has(v36(false), v145) else false;
                v147 = v147 and not v149;
                local v150 = false;
                local v151 = nil;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v151 = v5(false).getIsBubbleChatEnabled(false);
                else
                    local v152 = v6.context and v6.context.store;
                    v151 = if v152 then v152:getState().Messages.isBubbleChatEnabled else v40(false);
                end;
                if v151 and v147 and (v139.Status == Enum.TextChatMessageStatus.Success or v139.Status == Enum.TextChatMessageStatus.Sending) then
                    v150 = true;
                end;
                if v139.Status ~= Enum.TextChatMessageStatus.Success and v139.Status ~= Enum.TextChatMessageStatus.Sending then
                    v147 = false;
                    v150 = false;
                end;
                local v153 = nil;
                if v139.TextChannel then
                    v153 = v139.TextChannel.Name;
                    if v153 == "RBXSystem" then
                        v153 = "RBXGeneral";
                    end;
                end;
                local v154 = {
                    userId = v145, 
                    prefixText = v139.PrefixText, 
                    text = v141, 
                    translation = v142, 
                    useTranslation = getChatTranslationEnabled() and v142 ~= nil, 
                    messageId = v139.MessageId, 
                    status = v139.Status, 
                    timestamp = v139.Timestamp, 
                    shouldOverrideBubbleChatSettings = false, 
                    isVisibleInBubbleChat = v150, 
                    isVisibleInChatWindow = v147, 
                    textChannel = v139.TextChannel, 
                    bubbleChatMessageProperties = v139.BubbleChatMessageProperties, 
                    chatWindowMessageProperties = v139.ChatWindowMessageProperties, 
                    textChatMessageInstance = if v21() and v24 then v139 else nil, 
                    partOrModel = v139.TextSource and v139.TextSource.Parent or nil, 
                    wasRewritten = if v18 then v139.WasRewritten else nil, 
                    originalText = if v18 then v139.OriginalText else nil
                };
                local v155 = v28(false);
                local v156 = v155 and v155[v154.messageId] ~= nil;
                if v154.isVisibleInChatWindow or v154.isVisibleInBubbleChat or v156 then
                    v105(v154);
                    if v25 and v154.isVisibleInChatWindow and not v156 then
                        local v157 = v55(false);
                        local v158 = true;
                        if v157 ~= nil then
                            v158 = v153 == v157;
                        end;
                        if v158 then
                            v57(v154.messageId);
                            v54(function(v159) --[[ Line: 600 ]]
                                return v159 + 1;
                            end);
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v163(v161) --[[ Line: 608 ]] --[[ Name: handleIncomingBubbleChatMessage ]]
        -- upvalues: v105 (copy)
        local v162 = {
            userId = v161.bubbleChatMessageUserId, 
            prefixText = "", 
            text = v161.message, 
            translation = v161.translation, 
            useTranslation = getChatTranslationEnabled(), 
            textChannel = nil, 
            messageId = v161.bubbleChatMessageId, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v161.timestamp, 
            partOrModel = v161.partOrModel, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            bubbleChatMessageProperties = v161.bubbleChatMessageProperties, 
            chatWindowMessageProperties = nil
        };
        v105(v162);
    end;
    local function v172(v164) --[[ Line: 631 ]] --[[ Name: handleHiddenMessageReceived ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v23 (ref), v19 (ref), v20 (ref), v8 (ref), v21 (ref), v105 (copy)
        local v165 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled();
        local v166 = if v165 and string.len(v164.Text) > v23 then v23 else string.len(v164.Text);
        local v167 = math.max(v19, -(v166 - 1));
        local l_v20_0 = v20;
        local v169 = math.random(v167, l_v20_0);
        local v170 = string.rep(if v165 then v8.INTERPUNCT_TEXT else v8.DOT_TEXT, v166 + v169);
        local v171 = {
            userId = nil, 
            prefixText = v8.LOCK_EMOJI .. " :", 
            text = v170, 
            textChannel = v164.TextChannel, 
            messageId = v164.MessageId, 
            status = v164.Status, 
            timestamp = v164.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v21() then v164 else nil, 
            isHiddenMessage = true
        };
        return v105(v171);
    end;
    local function v181(v173) --[[ Line: 667 ]] --[[ Name: handlePlayerRemoved ]]
        -- upvalues: v31 (copy), l_Dictionary_0 (ref), v37 (copy), l_Set_0 (ref), v30 (copy), v42 (copy), v45 (copy), v43 (copy)
        v31(function(v174) --[[ Line: 669 ]]
            -- upvalues: l_Dictionary_0 (ref), v173 (copy)
            return l_Dictionary_0.removeKey(v174, v173);
        end);
        v37(function(v175) --[[ Line: 673 ]]
            -- upvalues: l_Set_0 (ref), v173 (copy), v30 (ref), v42 (ref), v45 (ref), l_Dictionary_0 (ref), v43 (ref)
            if not v175 then
                return {};
            else
                local v176 = not l_Set_0.has(v175, v173);
                if #(v30(false)[v173] or {}) == 0 and v176 then
                    return v175;
                else
                    local v177 = v42(false);
                    if v177[v173] then
                        local v178 = v177[v173];
                        v45(function(v179) --[[ Line: 688 ]]
                            -- upvalues: l_Dictionary_0 (ref), v178 (copy)
                            return l_Dictionary_0.removeKey(v179, v178);
                        end);
                        v43(function(v180) --[[ Line: 692 ]]
                            -- upvalues: l_Dictionary_0 (ref), v173 (ref)
                            return l_Dictionary_0.removeKey(v180, v173);
                        end);
                    end;
                    return l_Set_0.subtract(v175, v173);
                end;
            end;
        end);
    end;
    local function v184(v182) --[[ Line: 701 ]] --[[ Name: muteUser ]]
        -- upvalues: v37 (copy), l_Set_0 (ref)
        v37(function(v183) --[[ Line: 702 ]]
            -- upvalues: l_Set_0 (ref), v182 (copy)
            if not v183 then
                return {};
            else
                return (l_Set_0.add(v183, v182));
            end;
        end);
    end;
    local function v187(v185) --[[ Line: 711 ]] --[[ Name: unmuteUser ]]
        -- upvalues: v37 (copy), l_Set_0 (ref)
        v37(function(v186) --[[ Line: 712 ]]
            -- upvalues: l_Set_0 (ref), v185 (copy)
            if not v186 then
                return {};
            else
                return (l_Set_0.subtract(v186, v185));
            end;
        end);
    end;
    local function v197() --[[ Line: 721 ]] --[[ Name: clearWindowMessages ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref), v33 (copy), v35 (copy), v25 (ref), v49 (copy), v51 (ref), v46 (copy), v50 (copy), v54 (copy)
        v29(function(v188) --[[ Line: 722 ]]
            -- upvalues: l_Dictionary_0 (ref)
            if not v188 then
                return {};
            else
                return (l_Dictionary_0.map(v188, function(v189) --[[ Line: 727 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    return l_Dictionary_0.join(v189, {
                        isVisibleInChatWindow = false
                    });
                end));
            end;
        end);
        v33(function(_) --[[ Line: 737 ]]
            return {};
        end);
        v35(function(_) --[[ Line: 742 ]]
            return {};
        end);
        if v25 then
            v49(1);
            v51 = 0;
            local v192 = v46(false);
            for _, v194 in ipairs(v192) do
                local v195 = v50[v194];
                if v195 then
                    v195.setter(nil);
                end;
            end;
            v54(function(v196) --[[ Line: 758 ]]
                return v196 + 1;
            end);
        end;
    end;
    local function v207() --[[ Line: 766 ]] --[[ Name: handleHiddenMessagesCleared ]]
        -- upvalues: v22 (ref), v29 (copy), l_Dictionary_0 (ref), v33 (copy), l_List_0 (ref), v28 (copy), v35 (copy)
        if not v22 then
            return;
        else
            v29(function(v198) --[[ Line: 773 ]]
                -- upvalues: l_Dictionary_0 (ref)
                return l_Dictionary_0.map(v198, function(v199) --[[ Line: 774 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    if v199.isHiddenMessage then
                        return l_Dictionary_0.join(v199, {
                            isVisibleInChatWindow = false
                        });
                    else
                        return v199;
                    end;
                end);
            end);
            v33(function(v200) --[[ Line: 786 ]]
                -- upvalues: l_List_0 (ref), v28 (ref)
                return l_List_0.filter(v200, function(v201) --[[ Line: 787 ]]
                    -- upvalues: v28 (ref)
                    local v202 = v28(false)[v201];
                    return v202 and not v202.isHiddenMessage;
                end);
            end);
            v35(function(v203) --[[ Line: 794 ]]
                -- upvalues: l_Dictionary_0 (ref), l_List_0 (ref), v28 (ref)
                return l_Dictionary_0.map(v203, function(v204) --[[ Line: 795 ]]
                    -- upvalues: l_List_0 (ref), v28 (ref)
                    return l_List_0.filter(v204, function(v205) --[[ Line: 796 ]]
                        -- upvalues: v28 (ref)
                        local v206 = v28(false)[v205];
                        return v206 and not v206.isHiddenMessage;
                    end);
                end);
            end);
            return;
        end;
    end;
    local function v214(v208) --[[ Line: 804 ]] --[[ Name: toggleGlobalTranslation ]]
        -- upvalues: v29 (copy), v21 (ref), v24 (ref), v18 (ref)
        v29(function(v209) --[[ Line: 805 ]]
            -- upvalues: v208 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v209 then
                return {};
            else
                local v210 = {};
                for v211, _ in pairs(v209) do
                    local v213 = v209[v211];
                    if v213 ~= nil then
                        v210[v211] = {
                            prefixText = v213.prefixText, 
                            text = v213.text, 
                            translation = v213.translation, 
                            useTranslation = v208, 
                            messageId = v213.messageId, 
                            status = v213.status, 
                            timestamp = v213.timestamp, 
                            isVisibleInBubbleChat = v213.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v213.isVisibleInChatWindow, 
                            partOrModel = v213.partOrModel, 
                            shouldOverrideBubbleChatSettings = v213.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v213.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v213.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v213.textChatMessageInstance else nil, 
                            userId = v213.userId, 
                            textChannel = v213.textChannel, 
                            wasRewritten = if v18 then v213.wasRewritten else nil, 
                            originalText = if v18 then v213.originalText else nil
                        };
                    end;
                end;
                return v210;
            end;
        end);
    end;
    local function v219(v215, v216) --[[ Line: 847 ]] --[[ Name: toggleMessageTranslation ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref), v21 (ref), v24 (ref), v18 (ref)
        v29(function(v217) --[[ Line: 848 ]]
            -- upvalues: v216 (copy), l_Dictionary_0 (ref), v215 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v217 then
                return {};
            else
                local v218 = v217[v216];
                if v218 ~= nil then
                    return l_Dictionary_0.join(v217, {
                        [v216] = {
                            prefixText = v218.prefixText, 
                            text = v218.text, 
                            translation = v218.translation, 
                            useTranslation = v215, 
                            messageId = v218.messageId, 
                            status = v218.status, 
                            timestamp = v218.timestamp, 
                            isVisibleInBubbleChat = v218.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v218.isVisibleInChatWindow, 
                            partOrModel = v218.partOrModel, 
                            shouldOverrideBubbleChatSettings = v218.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v218.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v218.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v218.textChatMessageInstance else nil, 
                            userId = v218.userId, 
                            textChannel = v218.textChannel, 
                            wasRewritten = if v18 then v218.wasRewritten else nil, 
                            originalText = if v18 then v218.originalText else nil
                        }
                    });
                else
                    return v217;
                end;
            end;
        end);
    end;
    local function v224(v220) --[[ Line: 889 ]] --[[ Name: handleLegacyBubbleCreated ]]
        -- upvalues: v105 (copy)
        local l_timestamp_0 = v220.timestamp;
        local v222 = nil;
        v222 = if l_timestamp_0 then DateTime.fromUnixTimestampMillis(l_timestamp_0) else DateTime.now();
        local v223 = {
            userId = v220.userId, 
            prefixText = "", 
            text = v220.text, 
            messageId = v220.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v222, 
            partOrModel = v220.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            translation = nil, 
            useTranslation = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil
        };
        v105(v223);
    end;
    local function v230(v225, v226) --[[ Line: 926 ]] --[[ Name: handleLegacyBubbleTextUpdated ]]
        -- upvalues: v29 (copy), l_Dictionary_0 (ref)
        v29(function(v227) --[[ Line: 927 ]]
            -- upvalues: v225 (copy), l_Dictionary_0 (ref), v226 (copy)
            if not v227 then
                return {};
            elseif v227[v225] then
                local v228 = v227[v225];
                local v229 = l_Dictionary_0.join(v228, {
                    text = v226
                });
                return l_Dictionary_0.join(v227, {
                    [v225] = v229
                });
            else
                return v227;
            end;
        end);
    end;
    local function v237(v231) --[[ Line: 952 ]] --[[ Name: registerMessageComponent ]]
        -- upvalues: v50 (copy), l_createSignal_0 (ref), v52 (copy), v47 (copy), l_List_0 (ref)
        if not v50[v231] then
            local v232, v233 = l_createSignal_0(nil);
            v50[v231] = {
                getter = v232, 
                setter = v233
            };
            local v234, v235 = l_createSignal_0(0);
            v52[v231] = {
                getter = v234, 
                setter = v235
            };
            v47(function(v236) --[[ Line: 967 ]]
                -- upvalues: l_List_0 (ref), v231 (copy)
                return l_List_0.append(v236, v231);
            end);
        end;
        return v50[v231].getter;
    end;
    local function v247(v238) --[[ Line: 976 ]] --[[ Name: unregisterMessageComponent ]]
        -- upvalues: v46 (copy), v50 (copy), v52 (copy), v47 (copy), l_List_0 (ref), v48 (copy), v49 (copy)
        local v239 = v46(false);
        local v240 = nil;
        for v241, v242 in ipairs(v239) do
            if v242 == v238 then
                v240 = v241;
                break;
            end;
        end;
        if v50[v238] then
            v50[v238] = nil;
        end;
        if v52[v238] then
            v52[v238] = nil;
        end;
        if v240 then
            v47(function(v243) --[[ Line: 999 ]]
                -- upvalues: l_List_0 (ref), v238 (copy)
                return l_List_0.filter(v243, function(v244) --[[ Line: 1000 ]]
                    -- upvalues: v238 (ref)
                    return v244 ~= v238;
                end);
            end);
            local v245 = v46(false);
            local v246 = v48(false);
            if #v245 == 0 then
                v49(1);
                return;
            elseif v240 < v246 then
                v49(v246 - 1);
                return;
            elseif #v245 < v246 then
                v49(1);
            end;
        end;
    end;
    local function v250(v248) --[[ Line: 1023 ]] --[[ Name: getMessageComponentSignal ]]
        -- upvalues: v50 (copy)
        local v249 = v50[v248];
        if v249 then
            return v249.getter;
        else
            return nil;
        end;
    end;
    local function v253(v251) --[[ Line: 1029 ]] --[[ Name: getLayoutOrderSignal ]]
        -- upvalues: v52 (copy)
        local v252 = v52[v251];
        if v252 then
            return v252.getter;
        else
            return nil;
        end;
    end;
    v57 = function(v254) --[[ Line: 1035 ]] --[[ Name: updateNextMessageComponent ]]
        -- upvalues: v46 (copy), v48 (copy), v49 (copy), v50 (copy), v51 (ref), v52 (copy)
        local v255 = v46(false);
        if #v255 == 0 then
            return;
        else
            local v256 = v48(false);
            local v257 = v255[v256];
            if not v257 then
                v49(1);
                return;
            else
                local v258 = v50[v257];
                if v258 then
                    v258.setter(v254);
                end;
                v51 = v51 + 1;
                local v259 = v52[v257];
                if v259 then
                    v259.setter(v51);
                end;
                local v260 = v256 % #v255 + 1;
                v49(v260);
                return;
            end;
        end;
    end;
    local function v269() --[[ Line: 1070 ]] --[[ Name: repopulateMessageComponents ]]
        -- upvalues: v55 (copy), v34 (copy), v32 (copy), v49 (copy), v51 (ref), v57 (ref), v46 (copy), v48 (copy), v50 (copy), v54 (copy)
        local v261 = v55(false);
        local v262 = nil;
        v262 = if v261 then v34(false)[v261] or {} else v32(false);
        v49(1);
        v51 = 0;
        for _, v264 in ipairs(v262) do
            v57(v264);
        end;
        local v265 = v46(false);
        if #v262 < #v265 then
            for v266 = v48(false), #v265 do
                local v267 = v50[v265[v266]];
                if v267 then
                    v267.setter(nil);
                end;
            end;
        end;
        v54(function(v268) --[[ Line: 1101 ]]
            return v268 + 1;
        end);
    end;
    return {
        getByMessageId = v28, 
        getMessages = l_createComputed_0(function(v270) --[[ Line: 464 ]]
            -- upvalues: v28 (copy)
            local v271 = v28(v270);
            local v272 = {};
            local l_pairs_1 = pairs;
            local v274 = v271 or {};
            for _, v276 in l_pairs_1(v274) do
                table.insert(v272, v276);
            end;
            return v272;
        end), 
        getMessagesBySenderId = v30, 
        getWindowMessagesInOrder = v32, 
        getWindowMessagesInOrderByTabId = v34, 
        getMutedUserIds = v36, 
        getCanLocalUserChat = v38, 
        getIsBubbleChatEnabled = v40, 
        getMockUserIdToPartOrModel = v42, 
        getPartOrModelToMockUserId = v44, 
        getMessage = v111, 
        getUserMessages = v126, 
        getUserBubbleMessages = v128, 
        getUserLastMessage = v130, 
        registerMessageComponent = v237, 
        unregisterMessageComponent = v247, 
        repopulateMessageComponents = v269, 
        getMessageComponentSignal = v250, 
        getLayoutOrderSignal = v253, 
        updateNextMessageComponent = v57, 
        getMessageComponentRingBuffer = v46, 
        getNextMessageComponentPointer = v48, 
        getWindowMessageAddedCount = v53, 
        setActiveChannelFilter = v56, 
        getActiveChannelFilter = v55, 
        setCanLocalUserChat = v39, 
        muteUser = v184, 
        unmuteUser = v187, 
        handlePlayerRemoved = v181, 
        clearWindowMessages = v197, 
        toggleGlobalTranslation = v214, 
        toggleMessageTranslation = v219, 
        handleIncomingOrOutgoingMessage = v160, 
        handleIncomingBubbleChatMessage = v163, 
        handleLegacyBubbleCreated = v224, 
        handleLegacyBubbleTextUpdated = v230, 
        handleHiddenMessageReceived = v172, 
        handleHiddenMessagesCleared = v207
    };
end;