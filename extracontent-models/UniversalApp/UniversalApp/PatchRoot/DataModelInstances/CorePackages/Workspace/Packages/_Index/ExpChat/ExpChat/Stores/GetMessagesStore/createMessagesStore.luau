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
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 36 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    return l_TextChatService_0.ChatTranslationEnabled;
end;
return function() --[[ Line: 125 ]] --[[ Name: createMessagesStore ]]
    -- upvalues: l_createSignal_0 (copy), l_Dictionary_0 (copy), l_List_0 (copy), l_HttpService_0 (copy), l_createComputed_0 (copy), l_Set_0 (copy), v18 (copy), v7 (copy), v4 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v5 (copy), v6 (copy), v21 (copy), v24 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v23 (copy), v19 (copy), v20 (copy), v8 (copy), v22 (copy)
    local v26 = {
        canLocalUserChat = false, 
        isBubbleChatEnabled = false, 
        mutedUserIds = {}, 
        messageLimit = 50, 
        windowMessagesInOrder = {}, 
        windowMessagesInOrderByTabId = {}, 
        byMessageId = {}, 
        mockUserIdToPartOrModel = {}, 
        partOrModelToMockUserId = {}, 
        messagesBySenderId = {}
    };
    local v27, v28 = l_createSignal_0(v26.byMessageId);
    local v29, v30 = l_createSignal_0(v26.messagesBySenderId);
    local v31, v32 = l_createSignal_0(v26.windowMessagesInOrder);
    local v33, v34 = l_createSignal_0(v26.windowMessagesInOrderByTabId);
    local v35, v36 = l_createSignal_0(v26.mutedUserIds);
    local v37, v38 = l_createSignal_0(v26.canLocalUserChat);
    local v39, _ = l_createSignal_0(v26.isBubbleChatEnabled);
    local v41, v42 = l_createSignal_0(v26.mockUserIdToPartOrModel);
    local v43, v44 = l_createSignal_0(v26.partOrModelToMockUserId);
    local function v92(v45) --[[ Line: 151 ]] --[[ Name: addMessage ]]
        -- upvalues: v27 (copy), v28 (copy), l_Dictionary_0 (ref), v30 (copy), l_List_0 (ref), v43 (copy), l_HttpService_0 (ref), v42 (copy), v44 (copy), v31 (copy), v33 (copy), v26 (copy), v41 (copy), v32 (copy), v34 (copy)
        local v46 = v27(false);
        if v46 and v46[v45.messageId] then
            v28(function(v47) --[[ Line: 156 ]]
                -- upvalues: l_Dictionary_0 (ref), v45 (copy)
                return l_Dictionary_0.join(v47, {
                    [v45.messageId] = v45
                });
            end);
            if v45.userId then
                v30(function(v48) --[[ Line: 162 ]]
                    -- upvalues: v45 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v49 = v48[v45.userId] or {};
                    local v50 = nil;
                    for v51, v52 in ipairs(v49) do
                        if v52.messageId == v45.messageId then
                            v50 = v51;
                            break;
                        end;
                    end;
                    if v50 then
                        local v53 = l_List_0.set(v49, v50, v45);
                        return l_Dictionary_0.join(v48, {
                            [v45.userId] = v53
                        });
                    else
                        return v48;
                    end;
                end);
            end;
            return;
        else
            local l_userId_0 = v45.userId;
            local l_partOrModel_0 = v45.partOrModel;
            if not l_userId_0 and l_partOrModel_0 then
                l_userId_0 = v43(false)[l_partOrModel_0];
                if not l_userId_0 then
                    l_userId_0 = l_HttpService_0:GenerateGUID(false);
                    v42(function(v56) --[[ Line: 198 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_userId_0 (ref), l_partOrModel_0 (copy)
                        return l_Dictionary_0.join(v56, {
                            [l_userId_0] = l_partOrModel_0
                        });
                    end);
                    v44(function(v57) --[[ Line: 205 ]]
                        -- upvalues: l_Dictionary_0 (ref), l_partOrModel_0 (copy), l_userId_0 (ref)
                        return l_Dictionary_0.join(v57, {
                            [l_partOrModel_0] = l_userId_0
                        });
                    end);
                end;
            end;
            local v58 = if v45.userId ~= l_userId_0 then l_Dictionary_0.join(v45, {
                userId = l_userId_0
            }) else v45;
            local v59 = nil;
            if v58.textChannel then
                v59 = v58.textChannel.Name;
                if v59 == "RBXSystem" then
                    v59 = "RBXGeneral";
                end;
            end;
            if v58.isVisibleInChatWindow then
                local v60 = v31(false);
                local v61 = if v59 then v33(false)[v59] or {} else {};
                if #v60 >= v26.messageLimit then
                    local v62 = v60[1];
                    local v63 = v46 and v46[v62];
                    if v63 then
                        local l_v62_0 = v62 --[[ copy: 8 -> 10 ]];
                        v28(function(v65) --[[ Line: 240 ]]
                            -- upvalues: l_Dictionary_0 (ref), l_v62_0 (copy)
                            return l_Dictionary_0.removeKey(v65, l_v62_0);
                        end);
                        if v63.userId then
                            local l_v62_1 = v62 --[[ copy: 8 -> 11 ]];
                            v30(function(v67) --[[ Line: 246 ]]
                                -- upvalues: v63 (copy), l_List_0 (ref), l_v62_1 (copy), v41 (ref), v44 (ref), l_Dictionary_0 (ref), v42 (ref)
                                local v68 = v67[v63.userId];
                                if v68 then
                                    local v70 = l_List_0.filter(v68, function(v69) --[[ Line: 249 ]]
                                        -- upvalues: l_v62_1 (ref)
                                        return v69.messageId ~= l_v62_1;
                                    end);
                                    if #v70 == 0 then
                                        local v71 = v41(false);
                                        if v71[v63.userId] then
                                            local v72 = v71[v63.userId];
                                            v44(function(v73) --[[ Line: 259 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v72 (copy)
                                                return l_Dictionary_0.removeKey(v73, v72);
                                            end);
                                            v42(function(v74) --[[ Line: 263 ]]
                                                -- upvalues: l_Dictionary_0 (ref), v63 (ref)
                                                return l_Dictionary_0.removeKey(v74, v63.userId);
                                            end);
                                        end;
                                        return l_Dictionary_0.removeKey(v67, v63.userId);
                                    else
                                        return l_Dictionary_0.join(v67, {
                                            [v63.userId] = v70
                                        });
                                    end;
                                else
                                    return v67;
                                end;
                            end);
                        end;
                        v32(function(v75) --[[ Line: 280 ]]
                            -- upvalues: l_List_0 (ref)
                            return l_List_0.removeIndex(v75, 1);
                        end);
                    end;
                end;
                if v59 and #v61 >= v26.messageLimit then
                    local v76 = v61[1];
                    if v76 then
                        v34(function(v77) --[[ Line: 290 ]]
                            -- upvalues: v59 (ref), l_List_0 (ref), l_Dictionary_0 (ref)
                            local v78 = v77[v59] or {};
                            local v79 = l_List_0.removeIndex(v78, 1);
                            return l_Dictionary_0.join(v77, {
                                [v59] = v79
                            });
                        end);
                        if v46 and v46[v76] then
                            v28(function(v80) --[[ Line: 299 ]]
                                -- upvalues: l_Dictionary_0 (ref), v76 (copy)
                                return l_Dictionary_0.removeKey(v80, v76);
                            end);
                        end;
                    end;
                end;
            end;
            v28(function(v81) --[[ Line: 307 ]]
                -- upvalues: l_Dictionary_0 (ref), v58 (copy)
                return l_Dictionary_0.join(v81, {
                    [v58.messageId] = v58
                });
            end);
            if v58.userId then
                v30(function(v82) --[[ Line: 312 ]]
                    -- upvalues: v58 (copy), l_List_0 (ref), l_Dictionary_0 (ref)
                    local v83 = v82[v58.userId] or {};
                    local v84 = false;
                    for _, v86 in ipairs(v83) do
                        if v86.messageId == v58.messageId then
                            v84 = true;
                            break;
                        end;
                    end;
                    if not v84 then
                        local v87 = l_List_0.append(v83, v58);
                        return l_Dictionary_0.join(v82, {
                            [v58.userId] = v87
                        });
                    else
                        return v82;
                    end;
                end);
            end;
            if v58.isVisibleInChatWindow then
                v32(function(v88) --[[ Line: 337 ]]
                    -- upvalues: l_List_0 (ref), v58 (copy)
                    return l_List_0.append(v88, v58.messageId);
                end);
                if v59 then
                    v34(function(v89) --[[ Line: 343 ]]
                        -- upvalues: v59 (ref), l_List_0 (ref), v58 (copy), l_Dictionary_0 (ref)
                        local v90 = v89[v59] or {};
                        local v91 = l_List_0.append(v90, v58.messageId);
                        return l_Dictionary_0.join(v89, {
                            [v59] = v91
                        });
                    end);
                end;
            end;
            return;
        end;
    end;
    local v93 = {};
    local v94 = {};
    local function v98(v95) --[[ Line: 364 ]] --[[ Name: getMessage ]]
        -- upvalues: v93 (copy), l_createComputed_0 (ref), v27 (copy)
        if not v93[v95] then
            v93[v95] = l_createComputed_0(function(v96) --[[ Line: 366 ]]
                -- upvalues: v27 (ref), v95 (copy)
                local v97 = v27(v96);
                if not v97 or not v97[v95] then
                    return nil;
                else
                    return v97[v95];
                end;
            end);
        end;
        return v93[v95];
    end;
    local function v111(v99) --[[ Line: 377 ]] --[[ Name: getUserMessageCache ]]
        -- upvalues: v94 (copy), l_createComputed_0 (ref), v29 (copy), v35 (copy), l_Set_0 (ref)
        local v100 = tostring(v99);
        if not v94[v100] then
            v94[v100] = {};
            v94[v100].messages = l_createComputed_0(function(v101) --[[ Line: 381 ]]
                -- upvalues: v29 (ref), v100 (copy)
                return v29(v101)[v100] or {};
            end);
            v94[v100].bubbleMessages = l_createComputed_0(function(v102) --[[ Line: 385 ]]
                -- upvalues: v94 (ref), v100 (copy), v35 (ref), l_Set_0 (ref)
                local v103 = v94[v100].messages(v102);
                local v104 = v35(v102);
                local v105 = {};
                for _, v107 in ipairs(v103) do
                    local v108 = v107.userId and l_Set_0.has(v104, v107.userId) or false;
                    if v107.isVisibleInBubbleChat and not v108 then
                        table.insert(v105, v107);
                    end;
                end;
                return v105;
            end);
            v94[v100].lastMessage = l_createComputed_0(function(v109) --[[ Line: 397 ]]
                -- upvalues: v94 (ref), v100 (copy)
                local v110 = v94[v100].messages(v109);
                if #v110 > 0 then
                    return v110[#v110];
                else
                    return nil;
                end;
            end);
        end;
        return v94[v100];
    end;
    local function v113(v112) --[[ Line: 408 ]] --[[ Name: getUserMessages ]]
        -- upvalues: v111 (copy)
        return v111(v112).messages;
    end;
    local function v115(v114) --[[ Line: 413 ]] --[[ Name: getUserBubbleMessages ]]
        -- upvalues: v111 (copy)
        return v111(v114).bubbleMessages;
    end;
    local function v117(v116) --[[ Line: 418 ]] --[[ Name: getUserLastMessage ]]
        -- upvalues: v111 (copy)
        return v111(v116).lastMessage;
    end;
    local _ = function() --[[ Line: 423 ]] --[[ Name: createMessagesArraySignal ]]
        -- upvalues: l_createComputed_0 (ref), v27 (copy)
        return l_createComputed_0(function(v118) --[[ Line: 424 ]]
            -- upvalues: v27 (ref)
            local v119 = v27(v118);
            local v120 = {};
            local l_pairs_0 = pairs;
            local v122 = v119 or {};
            for _, v124 in l_pairs_0(v122) do
                table.insert(v120, v124);
            end;
            return v120;
        end);
    end;
    local function v144(v126, _) --[[ Line: 434 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: v18 (ref), v7 (ref), v4 (ref), v27 (copy), v37 (copy), v35 (copy), l_Set_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v5 (ref), v6 (ref), v39 (copy), v21 (ref), v24 (ref), v92 (copy)
        local v128 = nil;
        local v129 = nil;
        if v18 then
            local v130, v131 = v7(v126);
            v128 = v130;
            v129 = v131;
        else
            v128 = v126.Text;
            v129 = v126.Translation;
        end;
        if v4(v128) and v126.Status ~= Enum.TextChatMessageStatus.Floodchecked and v126.Status ~= Enum.TextChatMessageStatus.MessageTooLong then
            return;
        else
            local v132 = if v126.TextSource then tostring(v126.TextSource.UserId) else nil;
            if not v27(false) then
                return;
            else
                local v133 = v37(false);
                local v134 = nil;
                if v132 == nil then
                    v134 = true;
                elseif not v133 then
                    v134 = false;
                else
                    local v135 = true;
                    if v126.Status ~= Enum.TextChatMessageStatus.Success then
                        v135 = v126.Status == Enum.TextChatMessageStatus.Sending;
                    end;
                    v134 = v135;
                end;
                local v136 = if v132 and v35(false) then l_Set_0.has(v35(false), v132) else false;
                v134 = v134 and not v136;
                local v137 = false;
                local v138 = nil;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v138 = v5(false).getIsBubbleChatEnabled(false);
                else
                    local v139 = v6.context and v6.context.store;
                    v138 = if v139 then v139:getState().Messages.isBubbleChatEnabled else v39(false);
                end;
                if v138 and v134 and (v126.Status == Enum.TextChatMessageStatus.Success or v126.Status == Enum.TextChatMessageStatus.Sending) then
                    v137 = true;
                end;
                if v126.Status ~= Enum.TextChatMessageStatus.Success and v126.Status ~= Enum.TextChatMessageStatus.Sending then
                    v134 = false;
                    v137 = false;
                end;
                local v140 = nil;
                if v126.TextChannel and v126.TextChannel.Name == "RBXSystem" then
                    v140 = "RBXGeneral";
                end;
                local v141 = {
                    userId = v132, 
                    prefixText = v126.PrefixText, 
                    text = v128, 
                    translation = v129, 
                    useTranslation = getChatTranslationEnabled() and v129 ~= nil, 
                    messageId = v126.MessageId, 
                    status = v126.Status, 
                    timestamp = v126.Timestamp, 
                    shouldOverrideBubbleChatSettings = false, 
                    isVisibleInBubbleChat = v137, 
                    isVisibleInChatWindow = v134, 
                    textChannel = v126.TextChannel, 
                    bubbleChatMessageProperties = v126.BubbleChatMessageProperties, 
                    chatWindowMessageProperties = v126.ChatWindowMessageProperties, 
                    textChatMessageInstance = if v21() and v24 then v126 else nil, 
                    partOrModel = v126.TextSource and v126.TextSource.Parent or nil, 
                    wasRewritten = if v18 then v126.WasRewritten else nil, 
                    originalText = if v18 then v126.OriginalText else nil
                };
                local v142 = v27(false);
                local v143 = v142 and v142[v141.messageId] ~= nil;
                if v141.isVisibleInChatWindow or v141.isVisibleInBubbleChat or v143 then
                    v92(v141);
                end;
                return;
            end;
        end;
    end;
    local function v147(v145) --[[ Line: 554 ]] --[[ Name: handleIncomingBubbleChatMessage ]]
        -- upvalues: v92 (copy)
        local v146 = {
            userId = v145.bubbleChatMessageUserId, 
            prefixText = "", 
            text = v145.message, 
            translation = v145.translation, 
            useTranslation = getChatTranslationEnabled(), 
            textChannel = nil, 
            messageId = v145.bubbleChatMessageId, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v145.timestamp, 
            partOrModel = v145.partOrModel, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            bubbleChatMessageProperties = v145.bubbleChatMessageProperties, 
            chatWindowMessageProperties = nil
        };
        v92(v146);
    end;
    local function v156(v148) --[[ Line: 577 ]] --[[ Name: handleHiddenMessageReceived ]]
        -- upvalues: l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v23 (ref), v19 (ref), v20 (ref), v8 (ref), v21 (ref), v92 (copy)
        local v149 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled();
        local v150 = if v149 and string.len(v148.Text) > v23 then v23 else string.len(v148.Text);
        local v151 = math.max(v19, -(v150 - 1));
        local l_v20_0 = v20;
        local v153 = math.random(v151, l_v20_0);
        local v154 = string.rep(if v149 then v8.INTERPUNCT_TEXT else v8.DOT_TEXT, v150 + v153);
        local v155 = {
            userId = nil, 
            prefixText = v8.LOCK_EMOJI .. " :", 
            text = v154, 
            textChannel = v148.TextChannel, 
            messageId = v148.MessageId, 
            status = v148.Status, 
            timestamp = v148.Timestamp, 
            isVisibleInBubbleChat = false, 
            isVisibleInChatWindow = true, 
            textChatMessageInstance = if v21() then v148 else nil, 
            isHiddenMessage = true
        };
        return v92(v155);
    end;
    local function v165(v157) --[[ Line: 613 ]] --[[ Name: handlePlayerRemoved ]]
        -- upvalues: v30 (copy), l_Dictionary_0 (ref), v36 (copy), l_Set_0 (ref), v29 (copy), v41 (copy), v44 (copy), v42 (copy)
        v30(function(v158) --[[ Line: 615 ]]
            -- upvalues: l_Dictionary_0 (ref), v157 (copy)
            return l_Dictionary_0.removeKey(v158, v157);
        end);
        v36(function(v159) --[[ Line: 619 ]]
            -- upvalues: l_Set_0 (ref), v157 (copy), v29 (ref), v41 (ref), v44 (ref), l_Dictionary_0 (ref), v42 (ref)
            if not v159 then
                return {};
            else
                local v160 = not l_Set_0.has(v159, v157);
                if #(v29(false)[v157] or {}) == 0 and v160 then
                    return v159;
                else
                    local v161 = v41(false);
                    if v161[v157] then
                        local v162 = v161[v157];
                        v44(function(v163) --[[ Line: 634 ]]
                            -- upvalues: l_Dictionary_0 (ref), v162 (copy)
                            return l_Dictionary_0.removeKey(v163, v162);
                        end);
                        v42(function(v164) --[[ Line: 638 ]]
                            -- upvalues: l_Dictionary_0 (ref), v157 (ref)
                            return l_Dictionary_0.removeKey(v164, v157);
                        end);
                    end;
                    return l_Set_0.subtract(v159, v157);
                end;
            end;
        end);
    end;
    local function v168(v166) --[[ Line: 647 ]] --[[ Name: muteUser ]]
        -- upvalues: v36 (copy), l_Set_0 (ref)
        v36(function(v167) --[[ Line: 648 ]]
            -- upvalues: l_Set_0 (ref), v166 (copy)
            if not v167 then
                return {};
            else
                return (l_Set_0.add(v167, v166));
            end;
        end);
    end;
    local function v171(v169) --[[ Line: 657 ]] --[[ Name: unmuteUser ]]
        -- upvalues: v36 (copy), l_Set_0 (ref)
        v36(function(v170) --[[ Line: 658 ]]
            -- upvalues: l_Set_0 (ref), v169 (copy)
            if not v170 then
                return {};
            else
                return (l_Set_0.subtract(v170, v169));
            end;
        end);
    end;
    local function v176() --[[ Line: 667 ]] --[[ Name: clearWindowMessages ]]
        -- upvalues: v28 (copy), l_Dictionary_0 (ref), v32 (copy), v34 (copy)
        v28(function(v172) --[[ Line: 668 ]]
            -- upvalues: l_Dictionary_0 (ref)
            if not v172 then
                return {};
            else
                return (l_Dictionary_0.map(v172, function(v173) --[[ Line: 673 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    return l_Dictionary_0.join(v173, {
                        isVisibleInChatWindow = false
                    });
                end));
            end;
        end);
        v32(function(_) --[[ Line: 683 ]]
            return {};
        end);
        v34(function(_) --[[ Line: 688 ]]
            return {};
        end);
    end;
    local function v186() --[[ Line: 695 ]] --[[ Name: handleHiddenMessagesCleared ]]
        -- upvalues: v22 (ref), v28 (copy), l_Dictionary_0 (ref), v32 (copy), l_List_0 (ref), v27 (copy), v34 (copy)
        if not v22 then
            return;
        else
            v28(function(v177) --[[ Line: 702 ]]
                -- upvalues: l_Dictionary_0 (ref)
                return l_Dictionary_0.map(v177, function(v178) --[[ Line: 703 ]]
                    -- upvalues: l_Dictionary_0 (ref)
                    if v178.isHiddenMessage then
                        return l_Dictionary_0.join(v178, {
                            isVisibleInChatWindow = false
                        });
                    else
                        return v178;
                    end;
                end);
            end);
            v32(function(v179) --[[ Line: 715 ]]
                -- upvalues: l_List_0 (ref), v27 (ref)
                return l_List_0.filter(v179, function(v180) --[[ Line: 716 ]]
                    -- upvalues: v27 (ref)
                    local v181 = v27(false)[v180];
                    return v181 and not v181.isHiddenMessage;
                end);
            end);
            v34(function(v182) --[[ Line: 723 ]]
                -- upvalues: l_Dictionary_0 (ref), l_List_0 (ref), v27 (ref)
                return l_Dictionary_0.map(v182, function(v183) --[[ Line: 724 ]]
                    -- upvalues: l_List_0 (ref), v27 (ref)
                    return l_List_0.filter(v183, function(v184) --[[ Line: 725 ]]
                        -- upvalues: v27 (ref)
                        local v185 = v27(false)[v184];
                        return v185 and not v185.isHiddenMessage;
                    end);
                end);
            end);
            return;
        end;
    end;
    local function v193(v187) --[[ Line: 733 ]] --[[ Name: toggleGlobalTranslation ]]
        -- upvalues: v28 (copy), v21 (ref), v24 (ref), v18 (ref)
        v28(function(v188) --[[ Line: 734 ]]
            -- upvalues: v187 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v188 then
                return {};
            else
                local v189 = {};
                for v190, _ in pairs(v188) do
                    local v192 = v188[v190];
                    if v192 ~= nil then
                        v189[v190] = {
                            prefixText = v192.prefixText, 
                            text = v192.text, 
                            translation = v192.translation, 
                            useTranslation = v187, 
                            messageId = v192.messageId, 
                            status = v192.status, 
                            timestamp = v192.timestamp, 
                            isVisibleInBubbleChat = v192.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v192.isVisibleInChatWindow, 
                            partOrModel = v192.partOrModel, 
                            shouldOverrideBubbleChatSettings = v192.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v192.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v192.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v192.textChatMessageInstance else nil, 
                            userId = v192.userId, 
                            textChannel = v192.textChannel, 
                            wasRewritten = if v18 then v192.wasRewritten else nil, 
                            originalText = if v18 then v192.originalText else nil
                        };
                    end;
                end;
                return v189;
            end;
        end);
    end;
    local function v198(v194, v195) --[[ Line: 776 ]] --[[ Name: toggleMessageTranslation ]]
        -- upvalues: v28 (copy), l_Dictionary_0 (ref), v21 (ref), v24 (ref), v18 (ref)
        v28(function(v196) --[[ Line: 777 ]]
            -- upvalues: v195 (copy), l_Dictionary_0 (ref), v194 (copy), v21 (ref), v24 (ref), v18 (ref)
            if not v196 then
                return {};
            else
                local v197 = v196[v195];
                if v197 ~= nil then
                    return l_Dictionary_0.join(v196, {
                        [v195] = {
                            prefixText = v197.prefixText, 
                            text = v197.text, 
                            translation = v197.translation, 
                            useTranslation = v194, 
                            messageId = v197.messageId, 
                            status = v197.status, 
                            timestamp = v197.timestamp, 
                            isVisibleInBubbleChat = v197.isVisibleInBubbleChat, 
                            isVisibleInChatWindow = v197.isVisibleInChatWindow, 
                            partOrModel = v197.partOrModel, 
                            shouldOverrideBubbleChatSettings = v197.shouldOverrideBubbleChatSettings, 
                            bubbleChatMessageProperties = v197.bubbleChatMessageProperties, 
                            chatWindowMessageProperties = v197.chatWindowMessageProperties, 
                            textChatMessageInstance = if v21() and v24 then v197.textChatMessageInstance else nil, 
                            userId = v197.userId, 
                            textChannel = v197.textChannel, 
                            wasRewritten = if v18 then v197.wasRewritten else nil, 
                            originalText = if v18 then v197.originalText else nil
                        }
                    });
                else
                    return v196;
                end;
            end;
        end);
    end;
    local function v203(v199) --[[ Line: 818 ]] --[[ Name: handleLegacyBubbleCreated ]]
        -- upvalues: v92 (copy)
        local l_timestamp_0 = v199.timestamp;
        local v201 = nil;
        v201 = if l_timestamp_0 then DateTime.fromUnixTimestampMillis(l_timestamp_0) else DateTime.now();
        local v202 = {
            userId = v199.userId, 
            prefixText = "", 
            text = v199.text, 
            messageId = v199.id, 
            status = Enum.TextChatMessageStatus.Success, 
            timestamp = v201, 
            partOrModel = v199.adornee, 
            shouldOverrideBubbleChatSettings = true, 
            isVisibleInBubbleChat = true, 
            isVisibleInChatWindow = false, 
            translation = nil, 
            useTranslation = false, 
            textChannel = nil, 
            bubbleChatMessageProperties = nil, 
            chatWindowMessageProperties = nil
        };
        v92(v202);
    end;
    local function v209(v204, v205) --[[ Line: 855 ]] --[[ Name: handleLegacyBubbleTextUpdated ]]
        -- upvalues: v28 (copy), l_Dictionary_0 (ref)
        v28(function(v206) --[[ Line: 856 ]]
            -- upvalues: v204 (copy), l_Dictionary_0 (ref), v205 (copy)
            if not v206 then
                return {};
            elseif v206[v204] then
                local v207 = v206[v204];
                local v208 = l_Dictionary_0.join(v207, {
                    text = v205
                });
                return l_Dictionary_0.join(v206, {
                    [v204] = v208
                });
            else
                return v206;
            end;
        end);
    end;
    return {
        getByMessageId = v27, 
        getMessages = l_createComputed_0(function(v210) --[[ Line: 424 ]]
            -- upvalues: v27 (copy)
            local v211 = v27(v210);
            local v212 = {};
            local l_pairs_1 = pairs;
            local v214 = v211 or {};
            for _, v216 in l_pairs_1(v214) do
                table.insert(v212, v216);
            end;
            return v212;
        end), 
        getMessagesBySenderId = v29, 
        getWindowMessagesInOrder = v31, 
        getWindowMessagesInOrderByTabId = v33, 
        getMutedUserIds = v35, 
        getCanLocalUserChat = v37, 
        getIsBubbleChatEnabled = v39, 
        getMockUserIdToPartOrModel = v41, 
        getPartOrModelToMockUserId = v43, 
        getMessage = v98, 
        getUserMessages = v113, 
        getUserBubbleMessages = v115, 
        getUserLastMessage = v117, 
        setCanLocalUserChat = v38, 
        muteUser = v168, 
        unmuteUser = v171, 
        handlePlayerRemoved = v165, 
        clearWindowMessages = v176, 
        toggleGlobalTranslation = v193, 
        toggleMessageTranslation = v198, 
        handleIncomingOrOutgoingMessage = v144, 
        handleIncomingBubbleChatMessage = v147, 
        handleLegacyBubbleCreated = v203, 
        handleLegacyBubbleTextUpdated = v209, 
        handleHiddenMessageReceived = v156, 
        handleHiddenMessagesCleared = v186
    };
end;