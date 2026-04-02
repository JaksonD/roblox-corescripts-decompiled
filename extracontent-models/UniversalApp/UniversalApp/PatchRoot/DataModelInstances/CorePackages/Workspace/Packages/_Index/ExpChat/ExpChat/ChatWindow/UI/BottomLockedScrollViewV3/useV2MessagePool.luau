local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.DataHydration);
local v7 = require(l_Parent_0.UserProfiles);
local l_VerifiedBadgeDisplayStore_0 = v7.Stores.VerifiedBadgeDisplayStore;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_UserProfileStore_0 = v7.Stores.UserProfileStore;
local v11 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2);
local v12 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v14 = require(l_Helpers_0.getMessageSettings);
local v15 = require(l_Helpers_0.getMessageText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v17 = require(l_Flags_0.getFFlagExpChatUseUpdatedMessageRendered);
local v18 = require(l_Flags_0.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v19 = require(l_Flags_0.getFFlagExpChatExcludeFOMORenders);
local v20 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v21 = require(l_Flags_0.FFlagExpChatTcOptimization);
local v22 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v23 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v24 = if v20 then v6.TrustedConnections.TrustedConnectionsStore.get() else nil;
local function v34(v25, v26) --[[ Line: 37 ]] --[[ Name: resolvePrefixText ]]
    -- upvalues: l_UserProfileStore_0 (copy)
    local v27 = v25.prefixText or "";
    local l_userId_0 = v25.userId;
    if not l_userId_0 or tostring(l_userId_0) == "0" then
        return v27;
    else
        local v29 = tostring(l_userId_0);
        local v30 = l_UserProfileStore_0.get().fetchNamesByUserIds({
            v29
        })(v26);
        local v31 = v30.data and v30.data[1];
        if not v31 or not v31.names then
            return v27;
        else
            local v32 = v31.names.getDisplayName(v26);
            local v33 = v31.names.getInExperienceCombinedName(v26);
            if string.len(v32) > 0 and string.len(v33) > 0 and v32 ~= v33 then
                v27 = string.gsub(v27, v32, v33);
            end;
            return v27;
        end;
    end;
end;
return function(v35) --[[ Line: 89 ]] --[[ Name: useV2MessagePool ]]
    -- upvalues: v4 (copy), v5 (copy), v14 (copy), v15 (copy), v34 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_VerifiedBadgeDisplayStore_0 (copy), v17 (copy), v12 (copy), v18 (copy), v19 (copy), l_TextChatService_0 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), l_Players_0 (copy), v24 (copy), v11 (copy)
    local l_messagesStore_0 = v35.messagesStore;
    local l_enabled_0 = v35.enabled;
    local l_chatWindowSettings_0 = v35.chatWindowSettings;
    local v39 = v4.useRef(nil);
    if l_enabled_0 and not v39.current then
        local v40 = {};
        for v41 = 1, 50 do
            local v42, v43 = v4.createBinding("");
            local v44, v45 = v4.createBinding("");
            local v46, v47 = v4.createBinding(false);
            local v48, v49 = v4.createBinding(0);
            local v50, v51 = v4.createBinding(false);
            local v52, v53 = v4.createBinding(l_chatWindowSettings_0);
            local v54, v55 = v4.createBinding(l_chatWindowSettings_0);
            local v56, v57 = v4.createBinding(false);
            local v58, v59 = v4.createBinding(false);
            local v60 = v4.createRef();
            v60.current = {};
            v40[v41] = {
                bodyText = v42, 
                setBodyText = v43, 
                prefixText = v44, 
                setPrefixText = v45, 
                shouldShowTranslation = v46, 
                setShowTranslation = v47, 
                layoutOrder = v48, 
                setLayoutOrder = v49, 
                visible = v50, 
                setVisible = v51, 
                bodyTextProperties = v52, 
                setBodyTextProperties = v53, 
                prefixTextProperties = v54, 
                setPrefixTextProperties = v55, 
                message = v60, 
                isUserVerified = v56, 
                setIsUserVerified = v57, 
                isTrustedConnection = v58, 
                setIsTrustedConnection = v59
            };
        end;
        v39.current = v40;
    end;
    v4.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: l_enabled_0 (copy), v39 (copy), l_messagesStore_0 (copy), v5 (ref), v14 (ref), l_chatWindowSettings_0 (copy), v35 (copy), v15 (ref), v34 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref), v17 (ref), v12 (ref), v18 (ref), v19 (ref), l_TextChatService_0 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), l_Players_0 (ref), v24 (ref)
        if not l_enabled_0 then
            return function() --[[ Line: 139 ]]

            end;
        else
            local v61 = {};
            for v62 = 1, 50 do
                local v63 = "msg-component-" .. v62;
                local v64 = v39.current[v62];
                local v65 = l_messagesStore_0.registerMessageComponent(v63);
                local v66 = l_messagesStore_0.getLayoutOrderSignal(v63);
                local v78 = v5.createEffect(function(v67) --[[ Line: 150 ]]
                    -- upvalues: v65 (copy), l_messagesStore_0 (ref), v14 (ref), l_chatWindowSettings_0 (ref), v35 (ref), v15 (ref), v64 (copy), v34 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref)
                    local v68 = v65(v67);
                    if v68 then
                        local v69 = l_messagesStore_0.getMessage(v68)(v67);
                        if v69 then
                            local v70 = v14(v69, l_chatWindowSettings_0);
                            local v71 = v35.showTranslationButton and v70.translation ~= nil and v70.translation ~= "";
                            local l_useTranslation_0 = v70.useTranslation;
                            local v73 = v15(l_useTranslation_0, v70.translation, v70.text);
                            local l_bodyTextProperties_0 = v70.bodyTextProperties;
                            local l_prefixTextProperties_0 = v70.prefixTextProperties;
                            v64.setBodyText(v73);
                            v64.setPrefixText((v34(v69, v67)));
                            v64.setShowTranslation(v71);
                            v64.setVisible(true);
                            v64.setBodyTextProperties(l_bodyTextProperties_0);
                            v64.setPrefixTextProperties(l_prefixTextProperties_0);
                            v64.message.current = v69;
                            if l_FFlagEnableVerifiedBadgeStore_0 then
                                local v76 = tonumber(v69.userId);
                                if v76 then
                                    local v77 = l_VerifiedBadgeDisplayStore_0.get();
                                    v64.setIsUserVerified(v77.isBadgeVisible(v76));
                                    return;
                                else
                                    v64.setIsUserVerified(false);
                                    return;
                                end;
                            else
                                v64.setIsUserVerified(false);
                                return;
                            end;
                        end;
                    else
                        v64.setVisible(false);
                        v64.setIsUserVerified(false);
                    end;
                end);
                local v80 = if v66 then v5.createEffect(function(v79) --[[ Line: 192 ]]
                    -- upvalues: v64 (copy), v66 (copy)
                    v64.setLayoutOrder(v66(v79));
                end) else nil;
                local v84 = if v17() then v5.createEffect(function(v81) --[[ Line: 200 ]]
                    -- upvalues: v65 (copy), l_messagesStore_0 (ref), v12 (ref), v18 (ref), v19 (ref), l_TextChatService_0 (ref)
                    local v82 = v65(v81);
                    if v82 then
                        local v83 = l_messagesStore_0.getMessage(v82)(false);
                        if v83 and v83.textChatMessageInstance and v12(v18) and (not v19() or not v83.isHiddenMessage) then
                            l_TextChatService_0:SendExpChatMessageClientRendered(v83.textChatMessageInstance, "chat_window");
                        end;
                    end;
                end) else nil;
                local v94 = if v20 then v5.createEffect(function(v85) --[[ Line: 223 ]]
                    -- upvalues: v65 (copy), l_messagesStore_0 (ref), v21 (ref), v22 (ref), v23 (ref), l_Players_0 (ref), v24 (ref), v64 (copy)
                    local v86 = v65(v85);
                    if v86 then
                        local v87 = l_messagesStore_0.getMessage(v86)(false);
                        if v87 then
                            local l_userId_1 = v87.userId;
                            local v89 = if v21 and (v22 or v23) then v87.isHiddenMessage else nil;
                            local v90 = l_userId_1 and l_userId_1 ~= "";
                            if v21 then
                                local v91 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                                local v92 = v91 and v91 == l_userId_1;
                                v90 = v90 and not v92 and not v89;
                            end;
                            local v93 = if v90 then v24.getIsTrustedConnection(l_userId_1).data(v85) else false;
                            v64.setIsTrustedConnection(v93);
                        end;
                    end;
                end) else nil;
                table.insert(v61, {
                    cleanupMsg = v78, 
                    cleanupLayout = v80, 
                    cleanupTelemetry = v84, 
                    cleanupTc = v94, 
                    componentId = v63
                });
            end;
            local v95 = if v35.isChannelBarVisible and v35.targetTextChannel then v35.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v95);
            l_messagesStore_0.repopulateMessageComponents();
            return function() --[[ Line: 270 ]]
                -- upvalues: v61 (copy), l_messagesStore_0 (ref)
                for _, v97 in ipairs(v61) do
                    if v97.cleanupMsg then
                        pcall(v97.cleanupMsg);
                    end;
                    if v97.cleanupLayout then
                        pcall(v97.cleanupLayout);
                    end;
                    if v97.cleanupTelemetry then
                        pcall(v97.cleanupTelemetry);
                    end;
                    if v97.cleanupTc then
                        pcall(v97.cleanupTc);
                    end;
                    l_messagesStore_0.unregisterMessageComponent(v97.componentId);
                end;
            end;
        end;
    end, {});
    local v98 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 291 ]]
        -- upvalues: l_enabled_0 (copy), v98 (copy), v35 (copy), l_messagesStore_0 (copy)
        if not l_enabled_0 then
            v98.current = false;
            return;
        elseif not v98.current then
            v98.current = true;
            return;
        else
            local v99 = if v35.isChannelBarVisible and v35.targetTextChannel then v35.targetTextChannel.Name else nil;
            l_messagesStore_0.setActiveChannelFilter(v99);
            l_messagesStore_0.repopulateMessageComponents();
            return;
        end;
    end, {
        l_enabled_0, 
        v35.targetTextChannel, 
        v35.isChannelBarVisible
    });
    return {
        children = v4.useMemo(function() --[[ Line: 308 ]]
            -- upvalues: l_enabled_0 (copy), v39 (copy), v4 (ref), v11 (ref), v35 (copy), l_chatWindowSettings_0 (copy)
            if not l_enabled_0 then
                return nil;
            else
                local v100 = {};
                for v101 = 1, 50 do
                    local v102 = "msg-component-" .. v101;
                    local v103 = v39.current[v101];
                    v100[v102] = v4.createElement(v11, {
                        originalBodyText = v103.bodyText, 
                        originalPrefixText = v103.prefixText, 
                        shouldShowTranslationToggle = v103.shouldShowTranslation, 
                        bodyTextProperties = v103.bodyTextProperties, 
                        prefixTextProperties = v103.prefixTextProperties, 
                        layoutOrder = v103.layoutOrder, 
                        visible = v103.visible, 
                        textTransparency = v35.textTransparency, 
                        isUserVerified = v103.isUserVerified, 
                        userId = v103.userId, 
                        useTranslation = v103.useTranslation, 
                        messageId = v103.messageId, 
                        isSpatialUIEnabled = v35.isSpatialUIEnabled, 
                        chatWindowSettings = l_chatWindowSettings_0, 
                        onTextMessageLabelButtonActivated = v35.onTextMessageLabelButtonActivated, 
                        message = v103.message, 
                        isTrustedConnection = v103.isTrustedConnection
                    });
                end;
                v100["$layout"] = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                return v100;
            end;
        end, {
            l_enabled_0, 
            v35.textTransparency, 
            v35.isSpatialUIEnabled, 
            v35.chatWindowSettings, 
            v35.onTextMessageLabelButtonActivated
        })
    };
end;