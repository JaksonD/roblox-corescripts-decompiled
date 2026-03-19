local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(l_Parent_0.t);
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(v2.table(v3));
    return v1.List.sort(v3, function(v4, v5) --[[ Line: 19 ]]
        local v6 = v4.sentAt and v4.sentAt.UnixTimestampMillis or 0;
        local v7 = v5.sentAt and v5.sentAt.UnixTimestampMillis or 0;
        if v6 ~= v7 then
            return v7 < v6;
        elseif v4.displayName and not v5.displayName then
            return true;
        elseif not v4.displayName and v5.displayName then
            return false;
        elseif v4.displayName and v5.displayName and string.lower(v4.displayName) ~= string.lower(v5.displayName) then
            return string.lower(v4.displayName) < string.lower(v5.displayName);
        elseif v4.username and v5.username then
            return string.lower(v4.username) < string.lower(v5.username);
        elseif v4.username and not v5.username then
            return true;
        else
            return false;
        end;
    end);
end;