local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v3 = require(l_script_FirstAncestor_0.Models.Conversation);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 33 ]]
    -- upvalues: v7 (copy), v8 (copy), v4 (copy), v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v16 = v10.senderTargetId ~= tostring(v9.LocalUserId);
    local v17 = v7() and v10.repliesTo ~= nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local function _(v21, v22, v23) --[[ Line: 39 ]] --[[ Name: timeDiffExceeds ]]
        if not v21 or not v22 or not v21.sent or not v22.sent then
            return false;
        else
            return v23 < math.abs(v21.sent:GetUnixTimestamp() - v22.sent:GetUnixTimestamp());
        end;
    end;
    local function _(v25) --[[ Line: 45 ]] --[[ Name: isSystemMessage ]]
        return v25 and v25.messageType == "System";
    end;
    local function _(v27) --[[ Line: 49 ]] --[[ Name: isModerated ]]
        return v27 and v27.moderated == true;
    end;
    local function _(v29) --[[ Line: 53 ]] --[[ Name: isHiddenMessage ]]
        -- upvalues: v8 (ref), v4 (ref)
        return v8 and v29 and v29.visibility == v4.VisibilityTypes.Hidden;
    end;
    local function _(v31) --[[ Line: 57 ]] --[[ Name: isReplyMessage ]]
        -- upvalues: v7 (ref)
        return v7() and v31 and v31.repliesTo ~= nil;
    end;
    local function _(v33, v34) --[[ Line: 61 ]] --[[ Name: hasSenderChange ]]
        return v33 and v34 and v33.senderTargetId ~= v34.senderTargetId;
    end;
    local function _(v36, v37) --[[ Line: 65 ]] --[[ Name: hasModeratedBreak ]]
        return v36 and v36.moderated == true or v37 and v37.moderated == true;
    end;
    v18 = not v13 and v12.fetchedOldestMessage and true or if v10 and v13 and v10.sent and v13.sent then math.abs(v10.sent:GetUnixTimestamp() - v13.sent:GetUnixTimestamp()) > 300 else false;
    v19 = v18 or not v13 or v13 and v10 and v13.senderTargetId ~= v10.senderTargetId or v13 and v13.messageType == "System" or v7() and v10 and v10.repliesTo ~= nil or v8 and v13 and v13.visibility == v4.VisibilityTypes.Hidden or v13 and v13.moderated == true or v10 and v10.moderated == true;
    v20 = not v15 or v15 and v15.messageType == "System" or v15 and v10 and v15.senderTargetId ~= v10.senderTargetId or (if v15 and v10 and v15.sent and v10.sent then math.abs(v15.sent:GetUnixTimestamp() - v10.sent:GetUnixTimestamp()) > 300 else false) or v7() and v15 and v15.repliesTo ~= nil or v8 and v15 and v15.visibility == v4.VisibilityTypes.Hidden or v10 and v10.moderated == true or v15 and v15.moderated == true;
    local l_Users_0 = v9.Users;
    local v40 = (v16 and v19 or v17) and v10.senderTargetId;
    local v41 = {};
    if v40 or v20 then
        local v42 = l_Users_0[v10.senderTargetId];
        v41 = {
            id = if not not v40 or v16 and v20 then v10.senderTargetId else nil, 
            thumbnail = if v16 and v20 then if v16 and v42 then v2({
                v10.senderTargetId
            })[1] else if v7() then nil else "" else nil, 
            shouldShowName = if v40 then v12.conversationType == v3.Type.MULTI_USER_CONVERSATION or v17 else nil
        };
    elseif v10.senderType == v4.SenderTypes.User and not v10.senderTargetId then
        v6:warning((("User message with no senderTargetId: %*"):format(v10.id)));
    end;
    local v43 = {
        placeId = v10.placeId, 
        universeId = v10.gameLink and v10.gameLink.universeId, 
        senderUserId = v16 and v10.senderTargetId or nil
    };
    return v5.Dictionary.join(v10, {
        conversationId = if v7() then v12.id else nil, 
        messageId = v11, 
        position = v13 and v13.position + 1 or 1, 
        isIncoming = v16, 
        isLastMessageInMessageGroup = v20, 
        isNewSender = v19, 
        sender = v41, 
        isSending = v14 or false, 
        showDateTime = v18, 
        additionalProps = v43
    });
end;