local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v4 = require(l_Parent_0.AppChatNetworking);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v6 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
return function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy), v4 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v7 (copy), v2 (ref), v6 (ref), v4 (ref), v8 (copy)
        local v10 = v9:getState();
        local v11 = v3(v10, (("ChatAppReducer.Conversations.%*"):format(v7)));
        if not v11 then
            v2:warning((("refreshConversationUnfilteredThreadsDetails: Conversation %* not found"):format(v7)));
            return;
        else
            local l_v7_0 = v7;
            local l_LocalUserId_0 = v10.LocalUserId;
            if v11.source == "friends" then
                local v14 = v6(v11, l_LocalUserId_0);
                if #v14 ~= 1 then
                    v2:warning((("refreshConversationUnfilteredThreadsDetails: Friends Conversation %* has invalid number of participants %*"):format(v7, #v14)));
                    return;
                else
                    l_v7_0 = v14[1];
                end;
            end;
            if v11.source == "channels" or v11.source == "friends" then
                v9:dispatch(v4.rodux.GetModalSequence.API({
                    modalSequence = v4.Constants.ModalSequence.ConversationTopModal, 
                    isInExperience = v8, 
                    conversationId = if v11.source == "channels" then l_v7_0 else nil, 
                    friendId = if v11.source == "friends" then l_v7_0 else nil
                })):catch(function(v15) --[[ Line: 45 ]]
                    -- upvalues: v2 (ref)
                    v2:warning((("refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationTopModal request. Error: %*"):format((tostring(v15)))));
                end);
                v9:dispatch(v4.rodux.GetModalSequence.API({
                    modalSequence = v4.Constants.ModalSequence.ConversationOverlay, 
                    isInExperience = v8, 
                    conversationId = if v11.source == "channels" then l_v7_0 else nil, 
                    friendId = if v11.source == "friends" then l_v7_0 else nil
                })):catch(function(v16) --[[ Line: 59 ]]
                    -- upvalues: v2 (ref)
                    v2:warning((("refreshConversationUnfilteredThreadsDetails: Error in GetModalSequence -> conversationOverlay request. Error: %*"):format((tostring(v16)))));
                end);
                return;
            else
                v2:warning((("refreshConversationUnfilteredThreadsDetails: Conversation %* has invalid source %*"):format(v7, v11.source)));
                return;
            end;
        end;
    end;
end;