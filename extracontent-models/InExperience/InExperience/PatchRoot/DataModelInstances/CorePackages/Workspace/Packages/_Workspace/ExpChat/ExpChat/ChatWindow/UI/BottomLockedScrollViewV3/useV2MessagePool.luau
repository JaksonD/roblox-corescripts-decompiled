local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.DataHydration);
local l_VerifiedBadgeDisplayStore_0 = require(l_Parent_0.UserProfiles).Stores.VerifiedBadgeDisplayStore;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local v9 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2);
local v10 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v12 = require(l_Helpers_0.getMessageSettings);
local v13 = require(l_Helpers_0.getMessageText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v15 = require(l_Flags_0.getFFlagExpChatUseUpdatedMessageRendered);
local v16 = require(l_Flags_0.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v17 = require(l_Flags_0.getFFlagExpChatExcludeFOMORenders);
local v18 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v19 = require(l_Flags_0.FFlagExpChatTcOptimization);
local v20 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v21 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v22 = if v18 then v6.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v23) --[[ Line: 59 ]] --[[ Name: useV2MessagePool ]]
    -- upvalues: v4 (copy), v5 (copy), v12 (copy), v13 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_VerifiedBadgeDisplayStore_0 (copy), v15 (copy), v10 (copy), v16 (copy), v17 (copy), l_TextChatService_0 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), l_Players_0 (copy), v22 (copy), v9 (copy)
    local l_messagesStore_0 = v23.messagesStore;
    local l_enabled_0 = v23.enabled;
    local l_chatWindowSettings_0 = v23.chatWindowSettings;
    local v27 = v4.useRef(nil);
    if l_enabled_0 and not v27.current then
        local v28 = {};
        for v29 = 1, 50 do
            local v30, v31 = v4.createBinding("");
            local v32, v33 = v4.createBinding("");
            local v34, v35 = v4.createBinding(false);
            local v36, v37 = v4.createBinding(0);
            local v38, v39 = v4.createBinding(false);
            local v40, v41 = v4.createBinding(l_chatWindowSettings_0);
            local v42, v43 = v4.createBinding(l_chatWindowSettings_0);
            local v44, v45 = v4.createBinding(false);
            local v46, v47 = v4.createBinding(false);
            local v48 = v4.createRef();
            v48.current = {};
            v28[v29] = {
                bodyText = v30, 
                setBodyText = v31, 
                prefixText = v32, 
                setPrefixText = v33, 
                shouldShowTranslation = v34, 
                setShowTranslation = v35, 
                layoutOrder = v36, 
                setLayoutOrder = v37, 
                visible = v38, 
                setVisible = v39, 
                bodyTextProperties = v40, 
                setBodyTextProperties = v41, 
                prefixTextProperties = v42, 
                setPrefixTextProperties = v43, 
                message = v48, 
                isUserVerified = v44, 
                setIsUserVerified = v45, 
                isTrustedConnection = v46, 
                setIsTrustedConnection = v47
            };
        end;
        v27.current = v28;
    end;
    v4.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: l_enabled_0 (copy), v27 (copy), l_messagesStore_0 (copy), v5 (ref), v12 (ref), l_chatWindowSettings_0 (copy), v23 (copy), v13 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref), v15 (ref), v10 (ref), v16 (ref), v17 (ref), l_TextChatService_0 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), l_Players_0 (ref), v22 (ref)
        if not l_enabled_0 then
            return function() --[[ Line: 109 ]]

            end;
        else
            local v49 = {};
            for v50 = 1, 50 do
                local v51 = "msg-component-" .. v50;
                local v52 = v27.current[v50];
                local v53 = l_messagesStore_0.registerMessageComponent(v51);
                local v54 = l_messagesStore_0.getLayoutOrderSignal(v51);
                local v67 = v5.createEffect(function(v55) --[[ Line: 120 ]]
                    -- upvalues: v53 (copy), l_messagesStore_0 (ref), v12 (ref), l_chatWindowSettings_0 (ref), v23 (ref), v13 (ref), v52 (copy), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref)
                    local v56 = v53(v55);
                    if v56 then
                        local v57 = l_messagesStore_0.getMessage(v56)(v55);
                        if v57 then
                            local v58 = v12(v57, l_chatWindowSettings_0);
                            local v59 = v23.showTranslationButton and v58.translation ~= nil and v58.translation ~= "";
                            local l_useTranslation_0 = v58.useTranslation;
                            local v61 = v13(l_useTranslation_0, v58.translation, v58.text);
                            local v62 = v58.prefixText or "";
                            local l_bodyTextProperties_0 = v58.bodyTextProperties;
                            local l_prefixTextProperties_0 = v58.prefixTextProperties;
                            v52.setBodyText(v61);
                            v52.setPrefixText(v62);
                            v52.setShowTranslation(v59);
                            v52.setVisible(true);
                            v52.setBodyTextProperties(l_bodyTextProperties_0);
                            v52.setPrefixTextProperties(l_prefixTextProperties_0);
                            v52.message.current = v57;
                            if l_FFlagEnableVerifiedBadgeStore_0 then
                                local v65 = tonumber(v57.userId);
                                if v65 then
                                    local v66 = l_VerifiedBadgeDisplayStore_0.get();
                                    v52.setIsUserVerified(v66.isBadgeVisible(v65));
                                    return;
                                else
                                    v52.setIsUserVerified(false);
                                    return;
                                end;
                            else
                                v52.setIsUserVerified(false);
                                return;
                            end;
                        end;
                    else
                        v52.setVisible(false);
                        v52.setIsUserVerified(false);
                    end;
                end);
                local v69 = if v54 then v5.createEffect(function(v68) --[[ Line: 163 ]]
                    -- upvalues: v52 (copy), v54 (copy)
                    v52.setLayoutOrder(v54(v68));
                end) else nil;
                local v73 = if v15() then v5.createEffect(function(v70) --[[ Line: 171 ]]
                    -- upvalues: v53 (copy), l_messagesStore_0 (ref), v10 (ref), v16 (ref), v17 (ref), l_TextChatService_0 (ref)
                    local v71 = v53(v70);
                    if v71 then
                        local v72 = l_messagesStore_0.getMessage(v71)(false);
                        if v72 and v72.textChatMessageInstance and v10(v16) and (not v17() or not v72.isHiddenMessage) then
                            l_TextChatService_0:SendExpChatMessageClientRendered(v72.textChatMessageInstance, "chat_window");
                        end;
                    end;
                end) else nil;
                local v83 = if v18 then v5.createEffect(function(v74) --[[ Line: 194 ]]
                    -- upvalues: v53 (copy), l_messagesStore_0 (ref), v19 (ref), v20 (ref), v21 (ref), l_Players_0 (ref), v22 (ref), v52 (copy)
                    local v75 = v53(v74);
                    if v75 then
                        local v76 = l_messagesStore_0.getMessage(v75)(false);
                        if v76 then
                            local l_userId_0 = v76.userId;
                            local v78 = if v19 and (v20 or v21) then v76.isHiddenMessage else nil;
                            local v79 = l_userId_0 and l_userId_0 ~= "";
                            if v19 then
                                local v80 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                                local v81 = v80 and v80 == l_userId_0;
                                v79 = v79 and not v81 and not v78;
                            end;
                            local v82 = if v79 then v22.getIsTrustedConnection(l_userId_0).data(v74) else false;
                            v52.setIsTrustedConnection(v82);
                        end;
                    end;
                end) else nil;
                table.insert(v49, {
                    cleanupMsg = v67, 
                    cleanupLayout = v69, 
                    cleanupTelemetry = v73, 
                    cleanupTc = v83, 
                    componentId = v51
                });
            end;
            local v84 = if v23.isChannelBarVisible and v23.targetTextChannel then v23.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v84);
            l_messagesStore_0.repopulateMessageComponents();
            return function() --[[ Line: 241 ]]
                -- upvalues: v49 (copy), l_messagesStore_0 (ref)
                for _, v86 in ipairs(v49) do
                    if v86.cleanupMsg then
                        pcall(v86.cleanupMsg);
                    end;
                    if v86.cleanupLayout then
                        pcall(v86.cleanupLayout);
                    end;
                    if v86.cleanupTelemetry then
                        pcall(v86.cleanupTelemetry);
                    end;
                    if v86.cleanupTc then
                        pcall(v86.cleanupTc);
                    end;
                    l_messagesStore_0.unregisterMessageComponent(v86.componentId);
                end;
            end;
        end;
    end, {});
    local v87 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 262 ]]
        -- upvalues: l_enabled_0 (copy), v87 (copy), v23 (copy), l_messagesStore_0 (copy)
        if not l_enabled_0 then
            v87.current = false;
            return;
        elseif not v87.current then
            v87.current = true;
            return;
        else
            local v88 = if v23.isChannelBarVisible and v23.targetTextChannel then v23.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v88);
            l_messagesStore_0.repopulateMessageComponents();
            return;
        end;
    end, {
        l_enabled_0, 
        v23.targetTextChannel, 
        v23.isChannelBarVisible
    });
    return {
        children = v4.useMemo(function() --[[ Line: 279 ]]
            -- upvalues: l_enabled_0 (copy), v27 (copy), v4 (ref), v9 (ref), v23 (copy), l_chatWindowSettings_0 (copy)
            if not l_enabled_0 then
                return nil;
            else
                local v89 = {};
                for v90 = 1, 50 do
                    local v91 = "msg-component-" .. v90;
                    local v92 = v27.current[v90];
                    v89[v91] = v4.createElement(v9, {
                        originalBodyText = v92.bodyText, 
                        originalPrefixText = v92.prefixText, 
                        shouldShowTranslationToggle = v92.shouldShowTranslation, 
                        bodyTextProperties = v92.bodyTextProperties, 
                        prefixTextProperties = v92.prefixTextProperties, 
                        layoutOrder = v92.layoutOrder, 
                        visible = v92.visible, 
                        textTransparency = v23.textTransparency, 
                        isUserVerified = v92.isUserVerified, 
                        userId = v92.userId, 
                        useTranslation = v92.useTranslation, 
                        messageId = v92.messageId, 
                        isSpatialUIEnabled = v23.isSpatialUIEnabled, 
                        chatWindowSettings = l_chatWindowSettings_0, 
                        onTextMessageLabelButtonActivated = v23.onTextMessageLabelButtonActivated, 
                        message = v92.message, 
                        isTrustedConnection = v92.isTrustedConnection
                    });
                end;
                v89["$layout"] = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                return v89;
            end;
        end, {
            l_enabled_0, 
            v23.textTransparency, 
            v23.isSpatialUIEnabled, 
            v23.chatWindowSettings, 
            v23.onTextMessageLabelButtonActivated
        })
    };
end;