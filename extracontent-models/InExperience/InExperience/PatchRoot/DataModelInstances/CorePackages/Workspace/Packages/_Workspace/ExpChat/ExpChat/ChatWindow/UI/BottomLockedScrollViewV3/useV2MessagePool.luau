local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_Parent_0.DataHydration);
local v8 = require(l_Parent_0.UserProfiles);
local l_VerifiedBadgeDisplayStore_0 = v8.Stores.VerifiedBadgeDisplayStore;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_UserProfileStore_0 = v8.Stores.UserProfileStore;
local v12 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2);
local v13 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v15 = require(l_Helpers_0.getMessageSettings);
local v16 = require(l_Helpers_0.getMessageText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v18 = require(l_Flags_0.getFFlagExpChatUseUpdatedMessageRendered);
local v19 = require(l_Flags_0.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v20 = require(l_Flags_0.getFFlagExpChatExcludeFOMORenders);
local v21 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v22 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v23 = require(l_Flags_0.FFlagExpChatDynamicV2Pool);
local v24 = require(l_Flags_0.FFlagExpChatKeepV2PoolMounted);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFixRateLimitedMessageRemoval);
local v26 = require(l_Flags_0.FFlagExpChatAddWindowSettingDependency);
local v27 = require(l_Flags_0.FFlagEnableInExpChatRewrite);
local v28 = require(l_Flags_0.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2);
local v29 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v30 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v31 = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local v32 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2.RewriteDropdown);
local v33 = require(l_script_FirstAncestor_0.Stores.GetRewriteDropdownStore);
local v34 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v35 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v36 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local v37 = v7.TrustedConnections.TrustedConnectionsStore.get();
local v38 = game:DefineFastInt("ExpChatSlotBatchSize", 10);
local function v65(v39) --[[ Line: 51 ]] --[[ Name: createSlot ]]
    -- upvalues: v4 (copy), v31 (copy)
    local v40, v41 = v4.createBinding("");
    local v42, v43 = v4.createBinding("");
    local v44, v45 = v4.createBinding(false);
    local v46, v47 = v4.createBinding(0);
    local v48, v49 = v4.createBinding(false);
    local v50, v51 = v4.createBinding(v39);
    local v52, v53 = v4.createBinding(v39);
    local v54, v55 = v4.createBinding(false);
    local v56, v57 = v4.createBinding(false);
    local v58, v59 = v4.createBinding(false);
    local v60, v61 = v4.createBinding(false);
    local v62 = v4.createRef();
    local v63, v64 = v4.createBinding(v31.Unknown);
    v62.current = {};
    return {
        bodyText = v40, 
        setBodyText = v41, 
        prefixText = v42, 
        setPrefixText = v43, 
        shouldShowTranslation = v44, 
        setShowTranslation = v45, 
        layoutOrder = v46, 
        setLayoutOrder = v47, 
        visible = v48, 
        setVisible = v49, 
        bodyTextProperties = v50, 
        setBodyTextProperties = v51, 
        prefixTextProperties = v52, 
        setPrefixTextProperties = v53, 
        message = v62, 
        isUserVerified = v54, 
        setIsUserVerified = v55, 
        isTrustedConnection = v56, 
        setIsTrustedConnection = v57, 
        wasRewritten = v58, 
        setWasRewritten = v59, 
        isRewriteWindowOpen = v60, 
        setIsRewriteWindowOpen = v61, 
        chatActionType = v63, 
        setChatActionType = v64
    };
end;
local function v75(v66, v67) --[[ Line: 96 ]] --[[ Name: resolvePrefixText ]]
    -- upvalues: l_UserProfileStore_0 (copy)
    local v68 = v66.prefixText or "";
    local l_userId_0 = v66.userId;
    if not l_userId_0 or tostring(l_userId_0) == "0" then
        return v68;
    else
        local v70 = tostring(l_userId_0);
        local v71 = l_UserProfileStore_0.get().fetchNamesByUserIds({
            v70
        })(v67);
        local v72 = v71.data and v71.data[1];
        if not v72 or not v72.names then
            return v68;
        else
            local v73 = v72.names.getDisplayName(v67);
            local v74 = v72.names.getInExperienceCombinedName(v67);
            if string.len(v73) > 0 and string.len(v74) > 0 and v73 ~= v74 then
                v68 = string.gsub(v68, v73, v74);
            end;
            return v68;
        end;
    end;
end;
return function(v76) --[[ Line: 150 ]] --[[ Name: useV2MessagePool ]]
    -- upvalues: v24 (copy), v34 (copy), v6 (copy), v35 (copy), v36 (copy), v29 (copy), v30 (copy), v23 (copy), v38 (copy), v4 (copy), v65 (copy), v5 (copy), v27 (copy), v33 (copy), v15 (copy), v16 (copy), v75 (copy), v25 (copy), v28 (copy), v31 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_VerifiedBadgeDisplayStore_0 (copy), v18 (copy), v13 (copy), v19 (copy), v20 (copy), l_TextChatService_0 (copy), v21 (copy), v22 (copy), l_Players_0 (copy), v37 (copy), v26 (copy), v12 (copy), v32 (copy)
    local l_messagesStore_0 = v76.messagesStore;
    local l_enabled_0 = v76.enabled;
    local l_chatWindowSettings_0 = v76.chatWindowSettings;
    local v80 = if v24 then l_enabled_0 and v76.visible ~= false else l_enabled_0;
    local v81 = v34(false);
    local v84 = v6.useSignalBinding(v81.getChatStatus):map(function(v82) --[[ Line: 159 ]]
        -- upvalues: v35 (ref), v36 (ref), v29 (ref), v30 (ref)
        local v83 = not v35() and v36(v82);
        return UDim.new(0, if v83 then v29 else v30);
    end);
    local v85 = 50;
    if v23 and l_enabled_0 then
        local _ = nil;
        v85 = math.min(math.ceil(#(if v76.isChannelBarVisible and v76.targetTextChannel then l_messagesStore_0.getWindowMessagesInOrderByTabId(false)[v76.targetTextChannel.Name] or {} else l_messagesStore_0.getWindowMessagesInOrder(false) or {}) / v38) * v38, 50);
    end;
    local v87, v88 = v4.useState(v85);
    local v89 = if v23 then v87 else 50;
    local v90 = v4.useRef(nil);
    if l_enabled_0 and not v90.current then
        local v91 = {};
        for v92 = 1, v89 do
            v91[v92] = v65(l_chatWindowSettings_0);
        end;
        v90.current = v91;
    end;
    if v23 and l_enabled_0 and v90.current then
        for v93 = #v90.current + 1, v89 do
            v90.current[v93] = v65(l_chatWindowSettings_0);
        end;
    end;
    local v94 = v4.useRef({});
    local v95 = v4.useRef(0);
    local v96 = v4.useRef(v89);
    v96.current = v89;
    local function v135(v97, v98, v99, v100, v101) --[[ Line: 208 ]] --[[ Name: createSlotEffects ]]
        -- upvalues: v5 (ref), v27 (ref), v33 (ref), v15 (ref), v16 (ref), v75 (ref), v25 (ref), v28 (ref), v31 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref), v18 (ref), v13 (ref), v19 (ref), v20 (ref), l_TextChatService_0 (ref), v21 (ref), v22 (ref), l_Players_0 (ref), v37 (ref)
        local v102 = v99.registerMessageComponent(v98);
        local v103 = v99.getLayoutOrderSignal(v98);
        local v117 = v5.createEffect(function(v104) --[[ Line: 218 ]]
            -- upvalues: v102 (copy), v27 (ref), v33 (ref), v99 (copy), v15 (ref), v100 (copy), v101 (copy), v16 (ref), v97 (copy), v75 (ref), v25 (ref), v28 (ref), v31 (ref), v98 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref)
            local v105 = v102(v104);
            local v106 = nil;
            local v107 = nil;
            if v27 then
                v107 = v33(false);
                v106 = v107.getOpenMessageId(v104);
            end;
            if v105 then
                local v108 = v99.getMessage(v105)(v104);
                if v108 then
                    local v109 = v15(v108, v100);
                    local v110 = v101 and v109.translation ~= nil and v109.translation ~= "";
                    local l_useTranslation_0 = v109.useTranslation;
                    local v112 = v16(l_useTranslation_0, v109.translation, v109.text);
                    local l_bodyTextProperties_0 = v109.bodyTextProperties;
                    local l_prefixTextProperties_0 = v109.prefixTextProperties;
                    v97.setBodyText(v112);
                    v97.setPrefixText((v75(v108, v104)));
                    v97.setShowTranslation(v110);
                    v97.setVisible(not v25 or v108.isVisibleInChatWindow and not v108.isHiddenMessage);
                    v97.setBodyTextProperties(l_bodyTextProperties_0);
                    v97.setPrefixTextProperties(l_prefixTextProperties_0);
                    v97.message.current = v108;
                    if v28 then
                        v97.setChatActionType(v108.chatActionType or v31.Unknown);
                    end;
                    if v27 then
                        v97.setWasRewritten(v109.wasRewritten or false);
                        if v106 == v105 then
                            v107.setComponentId(v98);
                            v97.setIsRewriteWindowOpen(true);
                        else
                            v97.setIsRewriteWindowOpen(false);
                        end;
                    end;
                    if l_FFlagEnableVerifiedBadgeStore_0 then
                        local v115 = tonumber(v108.userId);
                        if v115 then
                            local v116 = l_VerifiedBadgeDisplayStore_0.get();
                            v97.setIsUserVerified(v116.isBadgeVisible(v115));
                            return;
                        else
                            v97.setIsUserVerified(false);
                            return;
                        end;
                    else
                        v97.setIsUserVerified(false);
                        return;
                    end;
                end;
            else
                v97.setVisible(false);
                v97.setIsUserVerified(false);
                if v28 then
                    v97.setChatActionType(v31.Unknown);
                end;
            end;
        end);
        local v120 = if v103 then v5.createEffect(function(v118) --[[ Line: 287 ]]
            -- upvalues: v103 (copy), v97 (copy)
            local v119 = v103(v118);
            v97.setLayoutOrder(v119);
        end) else nil;
        local v124 = if v18() then v5.createEffect(function(v121) --[[ Line: 294 ]]
            -- upvalues: v102 (copy), v99 (copy), v13 (ref), v19 (ref), v20 (ref), l_TextChatService_0 (ref)
            local v122 = v102(v121);
            if v122 then
                local v123 = v99.getMessage(v122)(false);
                if v123 and v123.textChatMessageInstance and v13(v19) and (not v20() or not v123.isHiddenMessage) then
                    l_TextChatService_0:SendExpChatMessageClientRendered(v123.textChatMessageInstance, "chat_window");
                end;
            end;
        end) else nil;
        local v134 = v5.createEffect(function(v125) --[[ Line: 311 ]]
            -- upvalues: v102 (copy), v99 (copy), v21 (ref), v22 (ref), l_Players_0 (ref), v37 (ref), v97 (copy)
            local v126 = v102(v125);
            if v126 then
                local v127 = v99.getMessage(v126)(false);
                if v127 then
                    local l_userId_1 = v127.userId;
                    local v129 = if not not v21 or v22 then v127.isHiddenMessage else nil;
                    local v130 = l_userId_1 and l_userId_1 ~= "";
                    local v131 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                    local v132 = v131 and v131 == l_userId_1;
                    local v133 = if v130 and not v132 and not v129 then v37.getIsTrustedConnection(l_userId_1).data(v125) else false;
                    v97.setIsTrustedConnection(v133);
                end;
            end;
        end);
        return {
            cleanupMsg = v117, 
            cleanupLayout = v120, 
            cleanupTelemetry = v124, 
            cleanupTc = v134, 
            componentId = v98
        };
    end;
    local v136 = {};
    if v26 then
        table.insert(v136, l_chatWindowSettings_0);
    end;
    if v24 then
        table.insert(v136, v80);
    end;
    v4.useEffect(function() --[[ Line: 359 ]]
        -- upvalues: v80 (copy), v89 (copy), v135 (copy), v90 (copy), l_messagesStore_0 (copy), l_chatWindowSettings_0 (copy), v76 (copy), v94 (copy), v95 (copy), v27 (ref), v33 (ref)
        if not v80 then
            return;
        else
            for v137 = 1, v89 do
                local v138 = v135(v90.current[v137], "msg-component-" .. v137, l_messagesStore_0, l_chatWindowSettings_0, v76.showTranslationButton);
                table.insert(v94.current, v138);
            end;
            v95.current = v89;
            local v139 = if v76.isChannelBarVisible and v76.targetTextChannel then v76.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v139);
            l_messagesStore_0.repopulateMessageComponents();
            return function() --[[ Line: 382 ]]
                -- upvalues: v94 (ref), l_messagesStore_0 (ref), v95 (ref), v27 (ref), v33 (ref)
                for _, v141 in ipairs(v94.current) do
                    if v141.cleanupMsg then
                        pcall(v141.cleanupMsg);
                    end;
                    if v141.cleanupLayout then
                        pcall(v141.cleanupLayout);
                    end;
                    if v141.cleanupTelemetry then
                        pcall(v141.cleanupTelemetry);
                    end;
                    if v141.cleanupTc then
                        pcall(v141.cleanupTc);
                    end;
                    l_messagesStore_0.unregisterMessageComponent(v141.componentId);
                end;
                v94.current = {};
                v95.current = 0;
                if v27 then
                    v33(false).setComponentId(nil);
                end;
            end;
        end;
    end, v136);
    if v23 and l_enabled_0 then
        v4.useEffect(function() --[[ Line: 409 ]]
            -- upvalues: v24 (ref), v80 (copy), v95 (copy), v89 (copy), v135 (copy), v90 (copy), l_messagesStore_0 (copy), l_chatWindowSettings_0 (copy), v76 (copy), v94 (copy)
            if v24 and not v80 then
                return;
            else
                local l_current_0 = v95.current;
                if v89 <= l_current_0 then
                    return;
                else
                    for v143 = l_current_0 + 1, v89 do
                        local v144 = v135(v90.current[v143], "msg-component-" .. v143, l_messagesStore_0, l_chatWindowSettings_0, v76.showTranslationButton);
                        table.insert(v94.current, v144);
                    end;
                    v95.current = v89;
                    l_messagesStore_0.repopulateMessageComponents();
                    return;
                end;
            end;
        end, if v24 then {
            v89, 
            v80
        } else {
            v89
        });
        v4.useEffect(function() --[[ Line: 438 ]]
            -- upvalues: v24 (ref), v80 (copy), v5 (ref), l_messagesStore_0 (copy), v38 (ref), v96 (copy), v88 (copy)
            if v24 and not v80 then
                return;
            else
                local v148 = v5.createEffect(function(v145) --[[ Line: 443 ]]
                    -- upvalues: l_messagesStore_0 (ref), v38 (ref), v96 (ref), v88 (ref)
                    local v146 = l_messagesStore_0.getActiveChannelFilter(v145);
                    local v147 = math.min(math.ceil((#(if v146 then l_messagesStore_0.getWindowMessagesInOrderByTabId(v145)[v146] or {} else l_messagesStore_0.getWindowMessagesInOrder(v145) or {}) + 2) / v38) * v38, 50);
                    if v96.current < v147 then
                        v88(v147);
                    end;
                end);
                return function() --[[ Line: 460 ]]
                    -- upvalues: v148 (copy)
                    if v148 then
                        pcall(v148);
                    end;
                end;
            end;
        end, if v24 then {
            v80
        } else {});
    end;
    local v149 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 470 ]]
        -- upvalues: v80 (copy), v149 (copy), v76 (copy), l_messagesStore_0 (copy)
        if not v80 then
            v149.current = false;
            return;
        elseif not v149.current then
            v149.current = true;
            return;
        else
            local v150 = if v76.isChannelBarVisible and v76.targetTextChannel then v76.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v150);
            l_messagesStore_0.repopulateMessageComponents();
            return;
        end;
    end, {
        v80, 
        v76.targetTextChannel, 
        v76.isChannelBarVisible
    });
    return {
        children = v4.useMemo(function() --[[ Line: 488 ]]
            -- upvalues: l_enabled_0 (copy), v89 (copy), v90 (copy), v4 (ref), v12 (ref), v76 (copy), l_chatWindowSettings_0 (copy), v27 (ref), v28 (ref), v84 (copy), v32 (ref)
            if not l_enabled_0 then
                return nil;
            else
                local v151 = {};
                for v152 = 1, v89 do
                    local v153 = "msg-component-" .. v152;
                    local v154 = v90.current[v152];
                    v151[v153] = v4.createElement(v12, {
                        originalBodyText = v154.bodyText, 
                        originalPrefixText = v154.prefixText, 
                        shouldShowTranslationToggle = v154.shouldShowTranslation, 
                        bodyTextProperties = v154.bodyTextProperties, 
                        prefixTextProperties = v154.prefixTextProperties, 
                        layoutOrder = v154.layoutOrder, 
                        visible = v154.visible, 
                        textTransparency = v76.textTransparency, 
                        isUserVerified = v154.isUserVerified, 
                        userId = v154.userId, 
                        useTranslation = v154.useTranslation, 
                        messageId = v154.messageId, 
                        isSpatialUIEnabled = v76.isSpatialUIEnabled, 
                        chatWindowSettings = l_chatWindowSettings_0, 
                        onTextMessageLabelButtonActivated = v76.onTextMessageLabelButtonActivated, 
                        message = v154.message, 
                        isTrustedConnection = v154.isTrustedConnection, 
                        wasRewritten = if v27 then v154.wasRewritten else nil, 
                        isRewriteWindowOpen = if v27 then v154.isRewriteWindowOpen else nil, 
                        chatActionType = if v28 then v154.chatActionType else nil, 
                        chatWindowTransparencyBindable = v76.chatWindowTransparencyBindable, 
                        arButtonPadding = v84
                    });
                end;
                if v27 then
                    v151["$rewrite-dropdown"] = v4.createElement(v32, {
                        textTransparency = v76.textTransparency, 
                        arButtonPadding = v84
                    });
                end;
                v151["$layout"] = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                return v151;
            end;
        end, if v24 then {
            l_enabled_0, 
            v89
        } else {
            l_enabled_0, 
            v76.textTransparency, 
            v76.isSpatialUIEnabled, 
            l_chatWindowSettings_0, 
            v76.onTextMessageLabelButtonActivated, 
            v89
        })
    };
end;