local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Logger);
return function(v4) --[[ Line: 8 ]] --[[ Name: markConversationAsRead ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v4 (copy), v3 (ref), v1 (ref)
        local v6 = v2(v5:getState(), string.format("ChatAppReducer.Conversations.%s", v4 or ""));
        if v6 and v6.hasUnreadMessages then
            v3:info("Marking conversation {} as read", v4);
            v5:dispatch(v1.rodux.MarkConversation.API(v4)):catch(function(v7) --[[ Line: 14 ]]
                -- upvalues: v3 (ref)
                v3:error((("AppChatNetworking failure in markConversationAsRead, Status: %*"):format((tostring(v7)))));
            end);
        end;
    end;
end;