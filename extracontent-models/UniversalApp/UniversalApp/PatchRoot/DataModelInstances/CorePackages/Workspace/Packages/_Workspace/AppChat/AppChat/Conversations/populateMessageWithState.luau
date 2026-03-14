local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v3 = require(l_script_FirstAncestor_0.Models.Conversation);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
return function(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 34 ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), v4 (copy), v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v17 = v11.senderTargetId ~= tostring(v10.LocalUserId);
    local v18 = v7() and v11.repliesTo ~= nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local function _(v22, v23, v24) --[[ Line: 40 ]] --[[ Name: timeDiffExceeds ]]
        if not v22 or not v23 or not v22.sent or not v23.sent then
            return false;
        else
            return v24 < math.abs(v22.sent:GetUnixTimestamp() - v23.sent:GetUnixTimestamp());
        end;
    end;
    if v8 then
        local function _(v26) --[[ Line: 48 ]] --[[ Name: isSystemMessage ]]
            return v26 and v26.messageType == "System";
        end;
        local function _(v28) --[[ Line: 52 ]] --[[ Name: isModerated ]]
            return v28 and v28.moderated == true;
        end;
        local function _(v30) --[[ Line: 56 ]] --[[ Name: isHiddenMessage ]]
            -- upvalues: v9 (ref), v4 (ref)
            return v9 and v30 and v30.visibility == v4.VisibilityTypes.Hidden;
        end;
        local function _(v32) --[[ Line: 60 ]] --[[ Name: isReplyMessage ]]
            -- upvalues: v7 (ref)
            return v7() and v32 and v32.repliesTo ~= nil;
        end;
        local function _(v34, v35) --[[ Line: 64 ]] --[[ Name: hasSenderChange ]]
            return v34 and v35 and v34.senderTargetId ~= v35.senderTargetId;
        end;
        local function _(v37, v38) --[[ Line: 68 ]] --[[ Name: hasModeratedBreak ]]
            return v37 and v37.moderated == true or v38 and v38.moderated == true;
        end;
        v19 = not v14 and v13.fetchedOldestMessage and true or if v11 and v14 and v11.sent and v14.sent then math.abs(v11.sent:GetUnixTimestamp() - v14.sent:GetUnixTimestamp()) > 300 else false;
        v20 = v19 or not v14 or v14 and v11 and v14.senderTargetId ~= v11.senderTargetId or v14 and v14.messageType == "System" or v7() and v11 and v11.repliesTo ~= nil or v9 and v14 and v14.visibility == v4.VisibilityTypes.Hidden or v14 and v14.moderated == true or v11 and v11.moderated == true;
        v21 = not v16 or v16 and v16.messageType == "System" or v16 and v11 and v16.senderTargetId ~= v11.senderTargetId or (if v16 and v11 and v16.sent and v11.sent then math.abs(v16.sent:GetUnixTimestamp() - v11.sent:GetUnixTimestamp()) > 300 else false) or v7() and v16 and v16.repliesTo ~= nil or v9 and v16 and v16.visibility == v4.VisibilityTypes.Hidden or v11 and v11.moderated == true or v16 and v16.moderated == true;
    else
        local v40 = not v14 and v13.fetchedOldestMessage == true;
        local v41 = false;
        if (v14 and v11.sent and v14.sent) ~= nil then
            v41 = v11.sent:GetUnixTimestamp() - v14.sent:GetUnixTimestamp() > 300;
        end;
        v19 = v40 or v41;
        v20 = v19 or not v14 or v14.senderTargetId ~= v11.senderTargetId;
    end;
    local l_Users_0 = v10.Users;
    local v43 = (v17 and v20 or v18) and v11.senderTargetId;
    local v44 = {};
    if v43 or v8 and v21 then
        local v45 = l_Users_0[v11.senderTargetId];
        v44 = {
            id = if not not v43 or v8 and v17 and v21 then v11.senderTargetId else nil, 
            thumbnail = if not (not v43 or v8) or v8 and v17 and v21 then if v17 and v45 then v2({
                v11.senderTargetId
            })[1] else if v7() then nil else "" else nil, 
            shouldShowName = if v43 then v13.conversationType == v3.Type.MULTI_USER_CONVERSATION or v18 else nil
        };
    elseif v11.senderType == v4.SenderTypes.User and not v11.senderTargetId then
        v6:warning((("User message with no senderTargetId: %*"):format(v11.id)));
    end;
    local v46 = {
        placeId = v11.placeId, 
        universeId = v11.gameLink and v11.gameLink.universeId, 
        senderUserId = v17 and v11.senderTargetId or nil
    };
    return v5.Dictionary.join(v11, {
        conversationId = if v7() then v13.id else nil, 
        messageId = v12, 
        position = v14 and v14.position + 1 or 1, 
        isIncoming = v17, 
        isLastMessageInMessageGroup = if v8 then v21 else nil, 
        isNewSender = v20, 
        sender = v44, 
        isSending = v15 or false, 
        showDateTime = v19, 
        additionalProps = v46
    });
end;