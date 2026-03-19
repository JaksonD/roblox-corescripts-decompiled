local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NetworkingUsers_0 = require(l_script_FirstAncestor_0.dependencies).NetworkingUsers;
return {
    FetchChatSettings = require(l_Parent_0.AppChat).Conversations.Thunks.FetchChatSettings, 
    GetUserV2FromUserId = l_NetworkingUsers_0.GetUserV2FromUserId
};