local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v5, v6, v7, v8) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v9, v10 = v1.useState(v5 or 0);
    if l_FFlagAddFriendsUserListEnabled_0 then
        v1.useEffect(function() --[[ Line: 20 ]]
            -- upvalues: v10 (copy), v5 (copy)
            v10(v5 or 0);
        end, {
            v5
        });
    end;
    local v11, v12 = v1.useState(1);
    return v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy), v12 (copy), v9 (copy), v7 (copy), v6 (copy), v10 (copy)
        v8();
        v12(v9 * v7 + 1);
        local v13 = math.ceil(v6 / v7) - 2;
        if v13 <= 0 then
            v13 = math.floor(v6 / v7);
        end;
        v10(v9 + v13);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9, 
        v6, 
        v8, 
        v7
    } else l_dependencyArray_0(v9, v6, v8, v7)), v9, v11;
end;