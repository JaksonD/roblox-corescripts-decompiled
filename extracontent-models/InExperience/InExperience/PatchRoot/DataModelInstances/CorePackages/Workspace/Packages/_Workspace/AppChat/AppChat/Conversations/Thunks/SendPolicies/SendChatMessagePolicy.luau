local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(script.Parent.SendMessagePolicy);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.ReceivedChatResponse);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.SendingMessage);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.SentMessage);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageFailedToSend);
local v11 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageModerated);
local l_ResponseStatus_0 = require(l_Parent_0.AppChatNetworking).Constants.ResponseStatus;
local v13 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v15 = require(l_script_FirstAncestor_0.EnumScreens);
local v16 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v19 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v20 = 0;
local v21 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local function _() --[[ Line: 30 ]] --[[ Name: getAscendingNumber ]]
    -- upvalues: v20 (ref)
    v20 = v20 + 1;
    return v20;
end;
local v23 = setmetatable({}, v3);
v23.__index = v23;
v23.new = function(v24, v25, v26) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        messageSendingId = v4.newSendingId(), 
        conversationId = v25, 
        replyingToMessage = v26
    }, v24));
end;
v23.onBeforeSendingMessage = function(v27, v28) --[[ Line: 46 ]] --[[ Name: onBeforeSendingMessage ]]
    -- upvalues: v21 (copy), v16 (copy), v4 (copy), l_Immutable_0 (copy), v20 (ref), l_DateTime_0 (copy), v7 (copy)
    v21:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}, replyingToId: {}", v27.conversationId, v27.messageSendingId, if v27.replyingToMessage then v27.replyingToMessage.id else nil);
    local v29 = nil;
    local v30 = v16(v28:getState(), (("ChatAppReducer.Conversations.%*"):format(v27.conversationId)));
    v29 = v30 and v30.moderationType;
    local l_newSending_0 = v4.newSending;
    local l_JoinDictionaries_0 = l_Immutable_0.JoinDictionaries;
    local v33 = {
        id = v27.messageSendingId
    };
    v20 = v20 + 1;
    v33.order = v20;
    v33.conversationId = v27.conversationId;
    v33.repliesTo = v27.replyingToMessage;
    v33.sent = l_DateTime_0.now();
    v33.moderationType = v29;
    l_newSending_0 = l_newSending_0(l_JoinDictionaries_0(v33, v27:sendingMessagePayload()));
    v27.sendingMessageStableKey = l_newSending_0.stableKey;
    assert(l_newSending_0, "Failed to create sending message placeholder");
    v28:dispatch(v7(v27.conversationId, l_newSending_0));
end;
v23.sendingMessagePayload = function(_) --[[ Line: 73 ]] --[[ Name: sendingMessagePayload ]]
    error("Override me");
end;
v23.onSuccess = function(v35, v36, v37) --[[ Line: 77 ]] --[[ Name: onSuccess ]]
    -- upvalues: v21 (copy), v18 (copy), v19 (copy), v8 (copy), v6 (copy)
    v21:debug("Message sent successfully. conversationId: {} messageSendingId: {} replyingToId: {}", v35.conversationId, v35.messageSendingId, if v35.replyingToMessage then v35.replyingToMessage.id else nil);
    if v18 then
        v19.start(v19.Events.MessageSendResponseToFinalRender, {
            conversationId = v35.conversationId
        });
    end;
    v36:dispatch(v8(v35.conversationId, v35.messageSendingId));
    v36:dispatch(v6(v35.conversationId, v37.responseBody, v35.sendingMessageStableKey));
    return v37;
end;
v23.onFailure = function(v38, v39, v40) --[[ Line: 96 ]] --[[ Name: onFailure ]]
    -- upvalues: v21 (copy), v18 (copy), v19 (copy), l_StatusCodes_0 (copy), v14 (copy), v13 (copy), v15 (copy), v10 (copy), l_ResponseStatus_0 (copy), v11 (copy)
    v21:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", v38.conversationId, v38.messageSendingId, v40.responseCode);
    if v18 then
        v19.start(v19.Events.MessageSendResponseToFinalRender, {
            conversationId = v38.conversationId
        });
    end;
    if not v40 or v40.responseCode ~= nil and v40.responseCode ~= l_StatusCodes_0.OK or v40.StatusCode ~= nil and v40.StatusCode ~= l_StatusCodes_0.OK or not v40.responseBody or not v40.responseBody.messages or #v40.responseBody.messages == 0 then
        if v40.StatusCode == l_StatusCodes_0.CONFLICT then
            v21:error("Message sent conflicting system (409). Reloading messages...");
            v39:dispatch(v14());
            v39:dispatch(v13({
                screen = v15.ChatLanding, 
                params = {
                    key = tostring(os.clock())
                }
            }));
            return v40;
        else
            v39:dispatch(v10(v38.conversationId, v38.messageSendingId));
            v21:error("Message could not be sent, no response body or no messages in response body");
            return v40;
        end;
    elseif v40.responseBody.messages[1].status and v40.responseBody.messages[1].status == l_ResponseStatus_0.MODERATED then
        v39:dispatch(v11(v38.conversationId, v38.messageSendingId));
        v21:error("Message was moderated.");
        return v40;
    else
        v39:dispatch(v10(v38.conversationId, v38.messageSendingId));
        v21:error("Message could not be sent, no response body or no messages in response body");
        return v40;
    end;
end;
return v23;