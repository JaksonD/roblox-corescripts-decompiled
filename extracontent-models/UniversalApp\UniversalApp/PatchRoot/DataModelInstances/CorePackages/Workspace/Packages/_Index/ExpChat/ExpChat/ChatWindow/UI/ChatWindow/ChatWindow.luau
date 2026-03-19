local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v8 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("UI");
local v10 = require(l_script_FirstAncestor_1.ScrollingView);
local v11 = require(l_script_FirstAncestor_1.HiddenMessage);
local v12 = require(l_script_FirstAncestor_1.TranslatedTextMessage);
local v13 = require(l_script_FirstAncestor_1.TopBanner);
local v14 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v15 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v17 = require(l_Parent_0.UserProfiles).Stores.VerifiedBadgeDisplayStore.get();
local l_FStringReportingIXPLayer_0 = require(l_Parent_0.SharedFlags).FStringReportingIXPLayer;
local l_GetFFlagEnableChatLineReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableChatLineReporting;
local l_GetFFlagMemoizeChatReportingMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagMemoizeChatReportingMenu;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagChatWindowUseCallbackOptimizations);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_Parent_0.SharedFlags).FFlagEnableVerifiedBadgeStore;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableInExpChatRewrite");
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local v29 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local v31 = {
    LayoutOrder = 1, 
    size = UDim2.fromScale(1, 1), 
    messages = if v22 then nil else {}, 
    transparencyValue = if l_GetFFlagMemoizeChatReportingMenu_0() then v3.createBinding(v6.ChatWindowBackgroundTransparency) else v6.ChatWindowBackgroundTransparency, 
    textTransparency = v3.createBinding(0), 
    mutedUserIds = {}, 
    verifiedUserIds = {}, 
    showTranslationButton = false
};
return (v3.memo(function(v32) --[[ Line: 57 ]]
    -- upvalues: l_Dictionary_0 (copy), v31 (copy), v7 (copy), v23 (copy), v8 (copy), v4 (copy), v15 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy), v3 (copy), v22 (copy), l_GetFFlagEnableChatLineReporting_0 (copy), l_useUserExperiment_0 (copy), l_FStringReportingIXPLayer_0 (copy), v21 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), v17 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v11 (copy), v12 (copy), l_game_EngineFeature_0 (copy), v30 (copy), v26 (copy), l_FFlagExpChatPerfTracking_0 (copy), v29 (copy), l_TextChatService_0 (copy), v6 (copy), v14 (copy), v13 (copy), v10 (copy)
    local v33 = l_Dictionary_0.join(v31, v32);
    local l_chatWindowSettings_0 = v33.chatWindowSettings;
    local l_BackgroundTransparency_0 = v7(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v7(l_chatWindowSettings_0).BackgroundColor3;
    local v37 = nil;
    local v38 = nil;
    local v39 = true;
    if v23 then
        v38 = v8(false);
        v37 = v4.useSignalState(v38.getChatStatus);
        v39 = v15(v37);
    end;
    local v40 = nil;
    local v41 = nil;
    if l_GetFFlagMemoizeChatReportingMenu_0() then
        v41 = v3.useRef(if v22 then nil else v33.messages);
        v3.useEffect(function() --[[ Line: 77 ]]
            -- upvalues: v41 (ref), v22 (ref), v33 (copy)
            v41.current = if v22 then nil else v33.messages;
        end, {
            if v22 then nil else v33.messages
        });
        v40 = v3.useCallback(function() --[[ Line: 81 ]]
            -- upvalues: v41 (ref)
            return v41.current;
        end, {});
    end;
    local v43 = if l_GetFFlagEnableChatLineReporting_0() then l_useUserExperiment_0({
        l_FStringReportingIXPLayer_0
    }, function(v42) --[[ Line: 87 ]]
        -- upvalues: l_FStringReportingIXPLayer_0 (ref)
        return (v42[l_FStringReportingIXPLayer_0] or {}).EnableChatLineReporting;
    end) else false;
    local v47 = v3.useCallback(function(v44, v45) --[[ Line: 93 ]]
        -- upvalues: v33 (copy)
        if type(v45) == "number" then
            return v33.transparencyValue;
        else
            return v45:map(function(v46) --[[ Line: 98 ]]
                -- upvalues: v44 (copy)
                return v44 + v46 * (1 - v44);
            end);
        end;
    end, if v21() then {
        v33.transparencyValue
    } else nil);
    local v50 = v3.useCallback(function(v48) --[[ Line: 104 ]]
        -- upvalues: v33 (copy)
        v33.resetTargetChannel();
        local v49 = tonumber(v48.userId);
        if v49 then
            v33.activateWhisperMode(v49);
        end;
    end, if v21() then {
        v33.resetTargetChannel, 
        v33.activateWhisperMode
    } else nil);
    local v56 = if v22 then nil else v3.useCallback(function(v51) --[[ Line: 120 ]]
        -- upvalues: l_Dictionary_0 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), v17 (ref), v33 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v11 (ref), v12 (ref), l_game_EngineFeature_0 (ref), v50 (copy), v30 (ref), v26 (ref)
        local v55 = l_Dictionary_0.map(v51, function(v52, v53) --[[ Line: 121 ]]
            -- upvalues: l_FFlagEnableVerifiedBadgeStore_0 (ref), v17 (ref), l_Dictionary_0 (ref), v33 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v3 (ref), v11 (ref), v12 (ref), l_game_EngineFeature_0 (ref), v50 (ref), v30 (ref)
            if v52.isVisibleInChatWindow then
                local v54 = nil;
                v54 = if l_FFlagEnableVerifiedBadgeStore_0 then if v52.userId then v17.isBadgeVisible((tonumber(v52.userId))) else false else if v52.userId then l_Dictionary_0.has(v33.verifiedUserIds, v52.userId) else false;
                if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatHiddenMessagesNewDesignEnabled() and v52.isHiddenMessage then
                    return v3.createElement(v11, {
                        chatWindowSettings = v33.chatWindowSettings, 
                        isSpatialUIEnabled = v33.isSpatialUIEnabled, 
                        LayoutOrder = v53, 
                        message = v52, 
                        textTransparency = v33.textTransparency
                    });
                else
                    return v3.createElement(v12, {
                        message = v52, 
                        LayoutOrder = v53, 
                        isUserVerified = v54, 
                        textTransparency = v33.textTransparency, 
                        transparencyValue = if l_game_EngineFeature_0 then v33.transparencyValue else nil, 
                        onTextMessageLabelButtonActivated = v50, 
                        chatWindowSettings = v33.chatWindowSettings, 
                        showTranslationButton = v33.showTranslationButton, 
                        isSpatialUIEnabled = v33.isSpatialUIEnabled, 
                        onToggle = function() --[[ Line: 155 ]] --[[ Name: onToggle ]]

                        end, 
                        chatWindowTransparencyBindingOrValue = if v30 then v33.transparencyValue else nil
                    }), v52.messageId;
                end;
            else
                return nil, nil;
            end;
        end);
        v55["$layout"] = v3.createElement("UIListLayout", {
            Padding = if v26 then nil else UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v55;
    end, if v21() then {
        v33.messages, 
        v33.textTransparency, 
        v33.verifiedUserIds, 
        v33.chatWindowSettings, 
        v33.showTranslationButton
    } else nil);
    if l_FFlagExpChatPerfTracking_0 then
        local v57 = if v33.targetTextChannel then v33.targetTextChannel.Name else "UNKNOWN_TAB";
        v3.useEffect(function() --[[ Line: 189 ]]
            -- upvalues: v29 (ref)
            v29.finish(v29.Events.ChatWindowMountTTI, {});
            return function() --[[ Line: 191 ]]
                -- upvalues: v29 (ref)
                v29.cancelAll();
            end;
        end, {});
        v3.useEffect(function() --[[ Line: 195 ]]
            -- upvalues: v29 (ref), v57 (copy)
            v29.finish(v29.Events.ChatWindowTabSwitchTTI, {
                tabId = v57
            });
        end, {
            v57
        });
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_BackgroundColor3_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v33.LayoutOrder, 
        Size = v33.size, 
        Visible = v33.visible, 
        BackgroundTransparency = v47(l_BackgroundTransparency_0, v33.transparencyValue), 
        [v3.Event.MouseEnter] = v33.onHovered, 
        [v3.Event.MouseLeave] = v33.onUnhovered, 
        [v3.Change.AbsoluteSize] = if v21() then v3.useCallback(function(v58) --[[ Line: 212 ]]
            -- upvalues: l_TextChatService_0 (ref), v33 (copy)
            local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_0 and v33.onAbsoluteSizeChanged then
                v33.onAbsoluteSizeChanged(v58, l_ChatWindowConfiguration_0);
            end;
        end, {
            l_TextChatService_0, 
            v33.onAbsoluteSizeChanged
        }) else function(v60) --[[ Line: 218 ]]
            -- upvalues: l_TextChatService_0 (ref), v33 (copy)
            local l_ChatWindowConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_1 and v33.onAbsoluteSizeChanged then
                v33.onAbsoluteSizeChanged(v60, l_ChatWindowConfiguration_1);
            end;
        end, 
        [v3.Change.AbsolutePosition] = if v21() then v3.useCallback(function(v62) --[[ Line: 225 ]]
            -- upvalues: l_TextChatService_0 (ref), v33 (copy)
            local l_ChatWindowConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_2 and v33.onAbsoluteSizeChanged then
                v33.onAbsolutePositionChanged(v62, l_ChatWindowConfiguration_2);
            end;
        end, {
            l_TextChatService_0, 
            v33.onAbsolutePositionChanged
        }) else function(v64) --[[ Line: 231 ]]
            -- upvalues: l_TextChatService_0 (ref), v33 (copy)
            local l_ChatWindowConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
            if l_ChatWindowConfiguration_3 and v33.onAbsoluteSizeChanged then
                v33.onAbsolutePositionChanged(v64, l_ChatWindowConfiguration_3);
            end;
        end
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = if v33.isSpatialUIEnabled then Vector2.new(1e999, 400) else Vector2.new(v6.ChatWindowMaxWidth, v6.ChatWindowMaxHeight)
        }), 
        TopBanner = if not v14() and v39 and v43 then v3.createElement(v13, {
            backgroundColor3 = l_BackgroundColor3_0, 
            backgroundTransparency = l_BackgroundTransparency_0, 
            iconTransparency = if l_GetFFlagMemoizeChatReportingMenu_0() then v33.transparencyValue else v47(l_BackgroundTransparency_0, v33.transparencyValue), 
            onFocus = v33.onFocus, 
            onUnfocus = v33.onUnfocus, 
            getMessages = if l_GetFFlagMemoizeChatReportingMenu_0() then v40 else nil, 
            messages = if not l_GetFFlagMemoizeChatReportingMenu_0() then v33.messages else nil
        }) else nil, 
        scrollingView = v3.createElement(v10, {
            size = v33.size, 
            messages = if v26 then nil else v33.messages, 
            targetTextChannel = v33.targetTextChannel, 
            isChannelBarVisible = v33.isChannelBarVisible
        }, if v22 then nil else v56(v33.messages))
    });
end));