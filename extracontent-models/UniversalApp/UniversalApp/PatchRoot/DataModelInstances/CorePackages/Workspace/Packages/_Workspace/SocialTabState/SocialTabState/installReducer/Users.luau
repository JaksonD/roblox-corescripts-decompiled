local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingChat_0 = v2.NetworkingChat;
local v4 = require(l_script_FirstAncestor_0.utils.getUsersFromConversations);
local l_getFFlagSocialTabReplaceRefreshConversations_0 = require(l_Parent_0.SharedFlags).getFFlagSocialTabReplaceRefreshConversations;
local l_llama_0 = v2.llama;
local l_RoduxUsers_0 = v2.RoduxUsers;
local function v9(v8) --[[ Line: 13 ]] --[[ Name: userUpdatedFromUser ]]
    -- upvalues: l_RoduxUsers_0 (copy)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v8.id, 
        username = v8.name, 
        displayName = v8.displayName, 
        friendRank = v8.friendRank, 
        hasVerifiedBadge = v8.hasVerifiedBadge
    });
end;
local v12 = {
    AddUser = function(v10) --[[ Line: 24 ]] --[[ Name: AddUser ]]
        -- upvalues: v9 (copy)
        return {
            v9(v10.user)
        };
    end, 
    AddUsers = function(v11) --[[ Line: 28 ]] --[[ Name: AddUsers ]]
        -- upvalues: l_llama_0 (copy), v9 (copy)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v11.users, v9));
    end, 
    [l_getFFlagSocialTabReplaceRefreshConversations_0() and l_NetworkingChat_0.GetUserConversations.Succeeded.name or ""] = l_getFFlagSocialTabReplaceRefreshConversations_0() and v4 or nil
};
local v13 = l_RoduxUsers_0.installReducer();
return function(v14, v15) --[[ Line: 39 ]]
    -- upvalues: v12 (copy), l_getFFlagSocialTabReplaceRefreshConversations_0 (copy), l_llama_0 (copy), v13 (copy)
    v14 = v14 or {
        byUserId = {}
    };
    local v16 = {
        v15
    };
    local v17 = v12[v15.type];
    if v17 then
        v16 = if l_getFFlagSocialTabReplaceRefreshConversations_0() then v17(v15, v14) else v17(v15);
    end;
    return l_llama_0.List.reduce(v16, v13, v14);
end;