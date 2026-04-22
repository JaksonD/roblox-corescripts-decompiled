local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Signals);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v8 = require(l_script_FirstAncestor_0.Conversations.populateMessageWithState);
local v9 = require(l_script_FirstAncestor_0.Stores.GetMessageViewModelStore);
local _ = require(l_script_FirstAncestor_0.MessageData.Types);
local v11 = require(l_script_FirstAncestor_0.MessageData.Enums);
local l_MessageStatus_0 = v11.MessageStatus;
local l_MessageType_0 = v11.MessageType;
local function _(v14) --[[ Line: 29 ]] --[[ Name: toLuaDateTime ]]
    -- upvalues: l_DateTime_0 (copy)
    if v14 == nil or v14 == "" then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
            -- upvalues: l_DateTime_0 (ref), v14 (copy)
            return l_DateTime_0.fromIsoDate(v14);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end;
end;
local function v34(v18, v19) --[[ Line: 45 ]] --[[ Name: buildLegacyRepliesTo ]]
    -- upvalues: v4 (copy), l_DateTime_0 (copy), l_MessageType_0 (copy)
    local l_replies_to_0 = v18.replies_to;
    if l_replies_to_0 == nil then
        return nil;
    else
        local v21 = v19[l_replies_to_0.id];
        if v21 ~= nil then
            local l_join_0 = v4.Dictionary.join;
            local l_v21_0 = v21;
            local v24 = {
                senderTargetId = tostring(v21.sender_user_id)
            };
            local l_created_at_0 = v21.created_at;
            local v26;
            if l_created_at_0 == nil or l_created_at_0 == "" then
                v26 = nil;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 33 ]]
                    -- upvalues: l_DateTime_0 (ref), l_created_at_0 (copy)
                    return l_DateTime_0.fromIsoDate(l_created_at_0);
                end);
                v26 = if l_status_1 then l_result_1 else nil;
            end;
            v24.sent = v26;
            v24.messageType = v21.type == l_MessageType_0.System and "System" or "PlainText";
            return l_join_0(l_v21_0, v24);
        else
            local v29 = {
                id = l_replies_to_0.id, 
                content = l_replies_to_0.content, 
                messageType = l_replies_to_0.type == l_MessageType_0.System and "System" or "PlainText", 
                senderTargetId = tostring(l_replies_to_0.sender_user_id)
            };
            local l_created_at_1 = l_replies_to_0.created_at;
            local v31;
            if l_created_at_1 == nil or l_created_at_1 == "" then
                v31 = nil;
            else
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 33 ]]
                    -- upvalues: l_DateTime_0 (ref), l_created_at_1 (copy)
                    return l_DateTime_0.fromIsoDate(l_created_at_1);
                end);
                v31 = if l_status_2 then l_result_2 else nil;
            end;
            v29.sent = v31;
            return v29;
        end;
    end;
end;
local function v45(v35, v36) --[[ Line: 72 ]] --[[ Name: toLegacyMessage ]]
    -- upvalues: l_MessageType_0 (copy), v4 (copy), l_DateTime_0 (copy), l_MessageStatus_0 (copy), v34 (copy)
    local v37 = v35.type == l_MessageType_0.System and "System" or "PlainText";
    local l_join_1 = v4.Dictionary.join;
    local l_v35_0 = v35;
    local v40 = {
        senderTargetId = tostring(v35.sender_user_id), 
        senderType = v35.type, 
        messageType = v35.messageType or v37
    };
    local l_created_at_2 = v35.created_at;
    local v42;
    if l_created_at_2 == nil or l_created_at_2 == "" then
        v42 = nil;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 33 ]]
            -- upvalues: l_DateTime_0 (ref), l_created_at_2 (copy)
            return l_DateTime_0.fromIsoDate(l_created_at_2);
        end);
        v42 = if l_status_3 then l_result_3 else nil;
    end;
    v40.sent = v42;
    v40.moderationType = v35.moderation_type;
    v40.moderated = v35.status == l_MessageStatus_0.Moderated;
    v40.failed = v35.status == l_MessageStatus_0.Failed;
    v40.isSending = v35.status == l_MessageStatus_0.Pending;
    v40.filteredForReceivers = v35.filtered_for_receivers;
    v40.contentToDisplay = v35.content_to_display;
    v40.repliesTo = v34(v35, v36);
    return l_join_1(l_v35_0, v40);
end;
local function _(v46, v47) --[[ Line: 90 ]] --[[ Name: applyGroupedVariant ]]
    -- upvalues: v11 (copy)
    if v47 == nil then
        return v46;
    else
        local l_GroupedMessageVariant_0 = v11.GroupedMessageVariant;
        if v47 == l_GroupedMessageVariant_0.Single then
            v46.isNewSender = true;
            v46.isLastMessageInMessageGroup = true;
            return v46;
        elseif v47 == l_GroupedMessageVariant_0.First then
            v46.isNewSender = true;
            v46.isLastMessageInMessageGroup = false;
            return v46;
        elseif v47 == l_GroupedMessageVariant_0.Middle then
            v46.isNewSender = false;
            v46.isLastMessageInMessageGroup = false;
            return v46;
        else
            if v47 == l_GroupedMessageVariant_0.Last then
                v46.isNewSender = false;
                v46.isLastMessageInMessageGroup = true;
            end;
            return v46;
        end;
    end;
end;
local function v62(v50, v51, v52, v53, v54, v55, v56, v57) --[[ Line: 114 ]] --[[ Name: buildPopulatedMessage ]]
    -- upvalues: v8 (copy), v11 (copy)
    local v58 = {
        Users = v55, 
        LocalUserId = v56
    };
    local v59 = v8(v58, v50, v50.id, v54, v52, v50.isSending == true, v53);
    local v60;
    if v51 == nil then
        v60 = v59;
    else
        local l_GroupedMessageVariant_1 = v11.GroupedMessageVariant;
        if v51 == l_GroupedMessageVariant_1.Single then
            v59.isNewSender = true;
            v59.isLastMessageInMessageGroup = true;
        elseif v51 == l_GroupedMessageVariant_1.First then
            v59.isNewSender = true;
            v59.isLastMessageInMessageGroup = false;
        elseif v51 == l_GroupedMessageVariant_1.Middle then
            v59.isNewSender = false;
            v59.isLastMessageInMessageGroup = false;
        elseif v51 == l_GroupedMessageVariant_1.Last then
            v59.isNewSender = false;
            v59.isLastMessageInMessageGroup = true;
        end;
        v60 = v59;
    end;
    v60.stable_key = ("%*_%*"):format(v60.stableKey or v60.messageId, v57);
    return v60;
end;
local function v84(v63, v64, v65, v66, v67, v68) --[[ Line: 154 ]] --[[ Name: buildMessageItemList ]]
    -- upvalues: v4 (copy), v45 (copy), v7 (copy), v62 (copy)
    if #v63 == 0 or v66 == nil then
        return {};
    else
        local v71 = v4.List.filterMap(v63, function(v69) --[[ Line: 166 ]]
            -- upvalues: v64 (copy), v45 (ref)
            local v70 = v64[v69];
            if v70 == nil then
                return nil;
            else
                return v45(v70, v64);
            end;
        end);
        local v72 = {};
        local v73 = nil;
        for v74 = #v71, 1, -1 do
            local v75 = v71[v74];
            local v76 = v7(v75);
            local v77 = if v74 > 1 then v71[v74 - 1] else nil;
            local v78 = v65(v75.id);
            for v79, v80 in v76 do
                local v81 = v76[v79 + 1] or v77;
                local v82 = if #v76 == 1 then v78 else nil;
                local v83 = v62(v80, v82, v73, v81, v66, v67, v68, v79);
                table.insert(v72, v83);
                v73 = v83;
            end;
        end;
        return v4.List.reverse(v72);
    end;
end;
return {
    useMessageItemList = function(v85, v86, v87, v88) --[[ Line: 215 ]] --[[ Name: useMessageItemList ]]
        -- upvalues: v2 (copy), v9 (copy), v5 (copy), v84 (copy), l_useSignalState_0 (copy)
        local v89 = v2.useMemo(function() --[[ Line: 216 ]]
            -- upvalues: v9 (ref)
            return v9(false);
        end, {});
        local l_channelsMessageStore_0 = v89.channelsMessageStore;
        local l_chatConversationStore_0 = v89.chatConversationStore;
        local v92 = v2.useRef(v88);
        v92.current = v88;
        local v93 = v2.useRef(v86);
        v93.current = v86;
        local v99 = v2.useMemo(function() --[[ Line: 229 ]]
            -- upvalues: v85 (copy), v5 (ref), l_chatConversationStore_0 (copy), l_channelsMessageStore_0 (copy), v87 (copy), v92 (copy), v84 (ref), v89 (copy), v93 (copy)
            if v85 == nil then
                return v5.createComputed(function() --[[ Line: 231 ]]
                    return {};
                end);
            else
                return v5.createComputed(function(v94) --[[ Line: 236 ]]
                    -- upvalues: l_chatConversationStore_0 (ref), v85 (ref), l_channelsMessageStore_0 (ref), v87 (ref), v92 (ref), v84 (ref), v89 (ref), v93 (ref)
                    local v95 = l_chatConversationStore_0.getOrderedIds(v85, v94);
                    local v96 = l_channelsMessageStore_0.messages(v94);
                    local v97 = tostring(v87 or "");
                    if v92.current == nil then
                        return {};
                    else
                        return v84(v95, v96, function(v98) --[[ Line: 245 ]]
                            -- upvalues: v89 (ref), v85 (ref), v94 (copy)
                            return v89.getGroupedVariant(v98, v85)(v94);
                        end, v92.current, v93.current, v97);
                    end;
                end);
            end;
        end, {
            v85, 
            v87, 
            v89, 
            l_channelsMessageStore_0, 
            l_chatConversationStore_0
        });
        return l_useSignalState_0(v99);
    end, 
    buildMessageItemList = v84
};