local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
local v7 = require(l_Parent_0.ExpChatShared);
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v10 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v11 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v13 = require(l_script_FirstAncestor_1.ScrollingView);
local v14 = require(l_script_FirstAncestor_1.HiddenMessage);
local v15 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v16 = require(l_script_FirstAncestor_1.TopBanner);
local v17 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v18 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v20 = require(l_Parent_0.UserProfiles).Stores.VerifiedBadgeDisplayStore.get();
local l_FStringReportingIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringReportingIXPLayer;
local l_GetFFlagEnableChatLineReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReporting;
local l_GetFFlagMemoizeChatReportingMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagMemoizeChatReportingMenu;
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagChatWindowUseCallbackOptimizations);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableInExpChatRewrite");
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local v32 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v7.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local v35 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = if v25 then nil else {}, 
    transparencyValue = if l_GetFFlagMemoizeChatReportingMenu_0() then v3.createBinding(v8.ChatWindowBackgroundTransparency) else v8.ChatWindowBackgroundTransparency, 
    textTransparency = v3.createBinding(0), 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
return (v3.memo(function(v36) --[[ Line: 61 ]]
    -- upvalues: l_Dictionary_0 (copy), v35 (copy), v9 (copy), v26 (copy), v10 (copy), v4 (copy), v18 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy), v25 (copy), v3 (copy), v11 (copy), l_List_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_GetFFlagEnableChatLineReporting_0 (copy), l_useUserExperiment_0 (copy), l_FStringReportingIXPLayer_0 (copy), v24 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v20 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v14 (copy), v15 (copy), l_game_EngineFeature_0 (copy), v33 (copy), v29 (copy), l_FFlagExpChatPerfTracking_0 (copy), v32 (copy), l_TextChatService_0 (copy), v8 (copy), v17 (copy), v16 (copy), v13 (copy)
    local v37 = l_Dictionary_0.join(v35, v36);
    local l_chatWindowSettings_0 = v37.chatWindowSettings;
    local l_BackgroundTransparency_0 = v9(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v9(l_chatWindowSettings_0).BackgroundColor3;
    local v41 = nil;
    local v42 = nil;
    local v43 = true;
    if v26 then
        v42 = v10(false);
        v41 = v4.useSignalState(v42.getChatStatus);
        v43 = v18(v41);
    end;
    local v44 = nil;
    local v45 = nil;
    if l_GetFFlagMemoizeChatReportingMenu_0() and not v25 then
        v45 = v3.useRef(if v25 then nil else v37.messages);
        v3.useEffect(function() --[[ Line: 80 ]]
            -- upvalues: v45 (ref), v25 (ref), v37 (copy)
            v45.current = if v25 then nil else v37.messages;
        end, {
            if v25 then nil else v37.messages
        });
        v44 = v3.useCallback(function() --[[ Line: 84 ]]
            -- upvalues: v45 (ref)
            return v45.current;
        end, {});
    end;
    if v25 then
        v44 = v3.useCallback(function() --[[ Line: 90 ]]
            -- upvalues: v11 (ref), v37 (copy), l_List_0 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref)
            local v46 = v11(false);
            local v47 = {
                windowMessagesInOrderByTabId = v46.getWindowMessagesInOrderByTabId(false), 
                byMessageId = v46.getByMessageId(false), 
                windowMessagesInOrder = v46.getWindowMessagesInOrder(false)
            };
            if not v37.isChannelBarVisible then
                return l_List_0.map(v47.windowMessagesInOrder, function(v48) --[[ Line: 99 ]]
                    -- upvalues: v47 (copy)
                    return v47.byMessageId[v48];
                end);
            elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                local l_selectedChannelName_0 = v37.selectedChannelName;
                if v37.targetTextChannel and v47.windowMessagesInOrderByTabId[v37.targetTextChannel.Name] then
                    l_selectedChannelName_0 = v37.targetTextChannel.Name;
                end;
                if l_selectedChannelName_0 then
                    return l_List_0.map(v47.windowMessagesInOrderByTabId[l_selectedChannelName_0] or {}, function(v50) --[[ Line: 114 ]]
                        -- upvalues: v47 (copy)
                        return v47.byMessageId[v50];
                    end);
                else
                    return {};
                end;
            elseif v37.targetTextChannel then
                return l_List_0.map(v47.windowMessagesInOrderByTabId[v37.targetTextChannel.Name] or {}, function(v51) --[[ Line: 122 ]]
                    -- upvalues: v47 (copy)
                    return v47.byMessageId[v51];
                end);
            else
                return {};
            end;
        end, {
            v37.isChannelBarVisible, 
            v37.targetTextChannel, 
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then v37.selectedChannelName else nil
        });
    end;
    local v53 = if l_GetFFlagEnableChatLineReporting_0() then l_useUserExperiment_0({
        l_FStringReportingIXPLayer_0
    }, function(v52) --[[ Line: 140 ]]
        -- upvalues: l_FStringReportingIXPLayer_0 (ref)
        return (v52[l_FStringReportingIXPLayer_0] or {}).EnableChatLineReporting;
    end) else false;
    local v57 = v3.useCallback(function(v54, v55) --[[ Line: 146 ]]
        -- upvalues: v37 (copy)
        if type(v55) == "number" then
            return v37.transparencyValue;
        else
            return v55:map(function(v56) --[[ Line: 151 ]]
                -- upvalues: v54 (copy)
                return v54 + v56 * (1 - v54);
            end);
        end;
    end, if v24() then {
        v37.transparencyValue
    } else nil);
    local v60 = v3.useCallback(function(v58) --[[ Line: 157 ]]
        -- upvalues: v37 (copy)
        v37.resetTargetChannel();
        local v59 = tonumber(v58.userId);
        if v59 then
            v37.activateWhisperMode(v59);
        end;
    end, if v24() then {
        v37.resetTargetChannel, 
        v37.activateWhisperMode
    } else nil);
    local v66 = if v25 then nil else v3.useCallback(function(v61) --[[ Line: 173 ]]
        -- upvalues: l_Dictionary_0 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v20 (ref), v37 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v14 (ref), v15 (ref), l_game_EngineFeature_0 (ref), v60 (copy), v33 (ref), v29 (ref)
        local v65 = l_Dictionary_0.map(v61, function(v62, v63) --[[ Line: 174 ]]
            -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (ref), v20 (ref), l_Dictionary_0 (ref), v37 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v14 (ref), v15 (ref), l_game_EngineFeature_0 (ref), v60 (ref), v33 (ref)
            if v62.isVisibleInChatWindow then
                local v64 = nil;
                v64 = if l_FFlagEnableVerifiedBadgeStore_0 then if v62.userId then v20.isBadgeVisible((tonumber(v62.userId))) else false else if v62.userId then l_Dictionary_0.has(v37.verifiedUserIds, v62.userId) else false;
                if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and v62.isHiddenMessage then
                    return v3.createElement(v14, {
                        chatWindowSettings = v37.chatWindowSettings, 
                        isSpatialUIEnabled = v37.isSpatialUIEnabled, 
                        LayoutOrder = v63, 
                        message = v62, 
                        textTransparency = v37.textTransparency
                    });
                else
                    return v3.createElement(v15, {
                        message = v62, 
                        LayoutOrder = v63, 
                        isUserVerified = v64, 
                        textTransparency = v37.textTransparency, 
                        transparencyValue = if l_game_EngineFeature_0 then v37.transparencyValue else nil, 
                        onTextMessageLabelButtonActivated = v60, 
                        chatWindowSettings = v37.chatWindowSettings, 
                        showTranslationButton = v37.showTranslationButton, 
                        isSpatialUIEnabled = v37.isSpatialUIEnabled, 
                        onToggle = function() --[[ Line: 208 ]] --[[ Name: onToggle ]]

                        end, 
                        chatWindowTransparencyBindable = if v33 then v37.transparencyValue else nil
                    }), v62.messageId;
                end;
            else
                return nil, nil;
            end;
        end);
        v65["$layout"] = v3.createElement("UIListLayout", {
            Padding = if v29 then nil else UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v65;
    end, if v24() then {
        v37.messages, 
        v37.textTransparency, 
        v37.verifiedUserIds, 
        v37.chatWindowSettings, 
        v37.showTranslationButton
    } else nil);
    if l_FFlagExpChatPerfTracking_0 then
        local v67 = if v37.targetTextChannel then v37.targetTextChannel.Name else "UNKNOWN_TAB";
        v3.useEffect(function() --[[ Line: 242 ]]
            -- upvalues: v32 (ref)
            v32.finish(v32.Events.ChatWindowMountTTI, {});
            return function() --[[ Line: 244 ]]
                -- upvalues: v32 (ref)
                v32.cancelAll();
            end;
        end, {});
        local l_v67_0 = v67 --[[ copy: 14 -> 15 ]];
        v3.useEffect(function() --[[ Line: 248 ]]
            -- upvalues: v32 (ref), l_v67_0 (copy)
            v32.finish(v32.Events.ChatWindowTabSwitchTTI, {
                tabId = l_v67_0
            });
        end, {
            v67
        });
    end;
    local v69 = {};
    if v25 then
        v69 = {
            showTranslationButton = v37.showTranslationButton, 
            chatWindowSettings = v37.chatWindowSettings, 
            textTransparency = v37.textTransparency, 
            onTextMessageLabelButtonActivated = v60, 
            isSpatialUIEnabled = v37.isSpatialUIEnabled, 
            chatWindowTransparencyBindable = if v33 then v37.transparencyValue else nil, 
            visible = v37.visible
        };
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v37.LayoutOrder, 
        Size = v37.size, 
        Visible = v37.visible, 
        BackgroundTransparency = v57(l_BackgroundTransparency_0, v37.transparencyValue), 
        [v3.Event.MouseEnter] = v37.onHovered, 
        [v3.Event.MouseLeave] = v37.onUnhovered, 
        [v3.Change.AbsoluteSize] = if v24() then v3.useCallback(function(v70) --[[ Line: 278 ]]
            -- upvalues: l_TextChatService_0 (ref), v37 (copy)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_0 and v37.onAbsoluteSizeChanged then
                v37.onAbsoluteSizeChanged(v70, l_ChatWindowConfiguration_0);
            end;
        end, {
            l_TextChatService_0, 
            v37.onAbsoluteSizeChanged
        }) else function(v72) --[[ Line: 284 ]]
            -- upvalues: l_TextChatService_0 (ref), v37 (copy)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_1 and v37.onAbsoluteSizeChanged then
                v37.onAbsoluteSizeChanged(v72, l_ChatWindowConfiguration_1);
            end;
        end, 
        [v3.Change.AbsolutePosition] = if v24() then v3.useCallback(function(v74) --[[ Line: 291 ]]
            -- upvalues: l_TextChatService_0 (ref), v37 (copy)
            local l_ChatWindowConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_2 and v37.onAbsoluteSizeChanged then
                v37.onAbsolutePositionChanged(v74, l_ChatWindowConfiguration_2);
            end;
        end, {
            l_TextChatService_0, 
            v37.onAbsolutePositionChanged
        }) else function(v76) --[[ Line: 297 ]]
            -- upvalues: l_TextChatService_0 (ref), v37 (copy)
            local l_ChatWindowConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_3 and v37.onAbsoluteSizeChanged then
                v37.onAbsolutePositionChanged(v76, l_ChatWindowConfiguration_3);
            end;
        end
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = if v37.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(v8.ChatWindowMaxWidth, v8.ChatWindowMaxHeight)
        }), 
        TopBanner = if not v17() and v43 and v53 then v3.createElement(v16, {
            backgroundColor3 = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            iconTransparency = if l_GetFFlagMemoizeChatReportingMenu_0() then v37.transparencyValue else v57(l_BackgroundTransparency_0, v37.transparencyValue), 
            onFocus = v37.onFocus, 
            onUnfocus = v37.onUnfocus, 
            getMessages = if l_GetFFlagMemoizeChatReportingMenu_0() then v44 else nil, 
            messages = if not l_GetFFlagMemoizeChatReportingMenu_0() then v37.messages else nil
        }) else nil, 
        scrollingView = v3.createElement(v13, l_Dictionary_0.join({
            size = v37.size, 
            messages = if v29 then nil else v37.messages, 
            targetTextChannel = v37.targetTextChannel, 
            isChannelBarVisible = v37.isChannelBarVisible
        }, v69), if v25 then nil else v66(v37.messages))
    });
end));