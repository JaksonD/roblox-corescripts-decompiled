local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.InviteCallbackContext);
return function(v4) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3.Provider, {
        value = {
            inviteSingleFriend = v4.inviteSingleFriend, 
            inviteMultiFriends = v4.inviteMultiFriends
        }
    }, v4.children);
end;