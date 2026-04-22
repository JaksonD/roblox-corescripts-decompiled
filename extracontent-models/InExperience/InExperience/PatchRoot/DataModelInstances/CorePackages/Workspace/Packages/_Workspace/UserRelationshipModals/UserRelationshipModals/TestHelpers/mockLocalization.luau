local l_Parent_0 = script:FindFirstAncestor("UserRelationshipModals").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
return {
    Format = function(_, v3) --[[ Line: 8 ]] --[[ Name: Format ]]
        if v3 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest" or v3 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" then
            return "Send Friend Request";
        elseif v3 == "InGame.FriendPlayerPrompt.Action.Send" then
            return "Send";
        else
            return v3;
        end;
    end, 
    GetLocale = function() --[[ Line: 20 ]] --[[ Name: GetLocale ]]
        return "en-us";
    end, 
    changed = l_Signal_0.new()
};