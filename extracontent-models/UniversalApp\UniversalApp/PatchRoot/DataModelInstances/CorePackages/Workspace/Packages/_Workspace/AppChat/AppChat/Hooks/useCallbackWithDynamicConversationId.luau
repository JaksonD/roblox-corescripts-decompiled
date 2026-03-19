local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v6 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
return function(v7, v8) --[[ Line: 25 ]] --[[ Name: useCallbackWithDynamicConversationId ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v9 = v5(v8);
    local v10 = v9 ~= nil;
    local v11 = v6(v8);
    local v12 = v9 and v9.source == "friends" and v11;
    local v13 = v9 and v9.source ~= "friends" and v8;
    return v4.useCallback(function(v14) --[[ Line: 35 ]]
        -- upvalues: v7 (copy), v3 (ref), v13 (copy), v8 (copy), v12 (copy), v11 (copy)
        return v7((v3.Dictionary.union(v14 or {}, {
            conversationId = if v13 then v8 else nil, 
            friendId = if v12 then v11 else nil
        })));
    end, {
        v7, 
        v8, 
        v12, 
        v13, 
        v11
    }), v10;
end;