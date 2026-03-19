local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(script.Parent.ReplyComposeBar);
local v6 = require(script.Parent.ReplyComposeBarConstants);
local v7 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local v8 = require(l_Parent_0.UserProfiles);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v14 = require(script.Parent.ChatConversationTelemetryEvents);
local v15 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReplyComposeBarContainer);
local v18 = {
    LayoutOrder = 3, 
    message = nil, 
    close = function() --[[ Line: 47 ]] --[[ Name: close ]]

    end, 
    inputBoxRef = nil, 
    setReplyComposeBarHeight = function(_) --[[ Line: 50 ]] --[[ Name: setReplyComposeBarHeight ]]

    end, 
    unknownUserKey = "Feature.Chat.Label.UnknownUser", 
    replyingToYourselfKey = "Feature.Chat.Label.ReplyingToYourself", 
    replyingToOthersKey = "Feature.Chat.Label.ReplyingToOthers"
};
getTargetMessageInfo = function(v19) --[[ Line: 57 ]] --[[ Name: getTargetMessageInfo ]]
    if not v19 then
        return {};
    else
        return {
            targetMessageSenderId = v19.senderTargetId, 
            targetMessageId = v19.id, 
            targetMessageSentAt = if v19.sent then v19.sent.dateTime else nil, 
            targetMessageLength = if v19.content then #v19.content else nil
        };
    end;
end;
ReplyComposeBarContainer = function(v20) --[[ Line: 69 ]] --[[ Name: ReplyComposeBarContainer ]]
    -- upvalues: v3 (copy), v18 (copy), l_useStyle_0 (copy), l_useLocalUserId_0 (copy), v13 (copy), v15 (copy), v16 (copy), v6 (copy), v2 (copy), v14 (copy), l_useSelector_0 (copy), v7 (copy), v8 (copy), l_useLocalization_0 (copy), v5 (copy)
    local v21 = v3.Dictionary.union(v18, v20);
    local v22 = l_useStyle_0();
    local v23 = l_useLocalUserId_0();
    local v24 = v13(v15.Context);
    local v25 = if v16 then nil else v22.Tokens.Global.Size_700 + v6.VERTICAL_PADDING * 2 + v6.BORDER_HEIGHT;
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v14 (ref), v24 (copy), v21 (copy), v16 (ref), v25 (copy)
        if v14.ConversationInputBarReplyComposeRendered then
            v24.emit(v14.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(v21.message));
        end;
        if v16 then
            return function() --[[ Line: 91 ]]

            end;
        else
            v21.setReplyComposeBarHeight(v25);
            return function() --[[ Line: 94 ]]
                -- upvalues: v21 (ref)
                v21.setReplyComposeBarHeight(0);
            end;
        end;
    end, {});
    local v28 = l_useSelector_0(function(v26) --[[ Line: 101 ]]
        -- upvalues: v21 (copy), v7 (ref)
        local v27 = if v26 and v26.Users and v21.message.senderTargetId then v26.Users[v21.message.senderTargetId] else nil;
        if v27 then
            return {
                targetUser = v7(v26, v27)
            };
        else
            return {};
        end;
    end);
    local v29 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            v21.message.senderTargetId
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v30 = nil;
    v30 = if v28.targetUser and v28.targetUser.displayName and v28.targetUser.displayName ~= "" then v28.targetUser.displayName else if v29.data and v29.data.userProfiles and v29.data.userProfiles[1] and v29.data.userProfiles[1].names then v8.Selectors.getCombinedNameFromId(v29.data, v21.message.senderTargetId) else v21.unknownUserKey;
    local v31 = l_useLocalization_0(if v30 == v21.unknownUserKey then {
        replyingToUserName = v30
    } else {}).replyingToUserName or v30;
    local v32 = v23 == v21.message.senderTargetId;
    local v33 = if v32 then v21.replyingToYourselfKey else {
        v21.replyingToOthersKey; 
        DISPLAY_NAME = v31
    };
    local l_replyingToUserText_0 = l_useLocalization_0({
        replyingToUserText = v33
    }).replyingToUserText;
    local v35 = if not v32 and v28.targetUser then v21.message.senderTargetId else nil;
    local v36 = v2.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v14 (ref), v24 (copy), v21 (copy)
        if v14.ConversationInputBarReplyComposeCancelBtnActivated then
            v24.emit(v14.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(v21.message));
        end;
        v21.close();
    end, {
        v21.close, 
        v24, 
        v21.message
    });
    return v2.createElement(v5, {
        LayoutOrder = v21.LayoutOrder, 
        totalHeight = if v16 then nil else v25, 
        replyingToUserText = l_replyingToUserText_0, 
        replyingToUserContent = v21.message.content, 
        replyingToUserId = v35, 
        onCloseActivated = v36
    });
end;
return v2.memo(ReplyComposeBarContainer);