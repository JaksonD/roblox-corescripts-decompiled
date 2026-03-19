local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.GraphQLServer);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
return function(v4) --[[ Line: 9 ]]
    local v5 = nil;
    if v4.__typename == "Friend" then
        local v6 = v4.presence or {};
        if v6.universeId then
            return (tonumber(v6.universeId));
        else
            return nil;
        end;
    else
        if v4.isFriendWithUser then
            v5 = v4.universeId;
        end;
        return v5;
    end;
end;