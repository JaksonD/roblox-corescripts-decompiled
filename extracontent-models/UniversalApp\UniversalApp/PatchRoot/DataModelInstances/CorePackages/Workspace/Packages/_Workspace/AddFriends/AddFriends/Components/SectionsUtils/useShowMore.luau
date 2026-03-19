local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
return function(v4, v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_dependencyArray_0 (copy)
    local v8, v9 = v1.useState(v4 or 0);
    if l_FFlagAddFriendsUserListEnabled_0 then
        v1.useEffect(function() --[[ Line: 18 ]]
            -- upvalues: v9 (copy), v4 (copy)
            v9(v4 or 0);
        end, {
            v4
        });
    end;
    local v10, v11 = v1.useState(1);
    return v1.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v11 (copy), v8 (copy), v6 (copy), v5 (copy), v9 (copy)
        v7();
        v11(v8 * v6 + 1);
        local v12 = math.ceil(v5 / v6) - 2;
        if v12 <= 0 then
            v12 = math.floor(v5 / v6);
        end;
        v9(v8 + v12);
    end, l_dependencyArray_0(v8, v5, v7, v6)), v8, v10;
end;