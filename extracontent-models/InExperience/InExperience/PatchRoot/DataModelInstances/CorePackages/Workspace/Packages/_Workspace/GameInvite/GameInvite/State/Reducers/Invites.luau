local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Immutable_0 = require(l_Parent_1.AppCommonLib).Immutable;
local v4 = require(l_Actions_0.ReceivedUserInviteStatus);
local v5 = require(l_Actions_0.ResetUserInviteStatus);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), l_Immutable_0 (copy), v5 (copy)
    v6 = v6 or {};
    if v7.type == v4.name then
        return (l_Immutable_0.Set(v6, v7.userId, v7.inviteStatus));
    else
        if v7.type == v5.name then
            v6 = {};
        end;
        return v6;
    end;
end;