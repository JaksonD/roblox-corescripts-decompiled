local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.SelectedUsersContext);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
local v6 = require(l_Parent_1.UserProfiles);
return function(v7) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), l_dependencyArray_0 (copy), v2 (copy)
    local v8 = v6.Hooks.useUserProfilesFetch({
        userIds = v7.preselectedUsers or {}, 
        query = v6.Queries.userProfilesCombinedNameByUserIds
    });
    local v14 = v3.useCallback(function(v9) --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v6 (ref), v7 (copy)
        local v10 = {};
        local v11 = "";
        for _, v13 in pairs(v9) do
            if v8.data then
                v11 = v6.Selectors.getCombinedNameFromId(v8.data, v13);
            end;
            v10[v13] = {
                displayName = v11, 
                layoutOrder = #v10 + 1, 
                unremovable = v7.preselectedUsersUnremovable
            };
        end;
        return v10;
    end, nil);
    local v15 = v3.useRef(if v7.preselectedUsers then #v7.preselectedUsers else 0);
    local v16, v17 = v3.useState(if v7.preselectedUsers then v14(v7.preselectedUsers) else {});
    local v18, v19 = v3.useState(if v7.preselectedUsers then #v7.preselectedUsers else 0);
    local v22 = v3.useCallback(function(v20, v21) --[[ Line: 50 ]]
        -- upvalues: v7 (copy), v18 (copy), v17 (copy), v4 (ref), v16 (copy), v15 (copy), v19 (copy)
        if v7.selectionLimit == nil or v18 < v7.selectionLimit then
            v17(v4.Dictionary.join(v16, {
                [v20] = {
                    displayName = v21, 
                    layoutOrder = v15.current
                }
            }));
            v15.current = v15.current + 1;
            v19(v18 + 1);
        end;
    end, l_dependencyArray_0(v16));
    local v25 = v3.useCallback(function(v23, v24) --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v4 (ref), v16 (copy), v19 (copy), v18 (copy), v7 (copy)
        v17(v4.Dictionary.join(v16, {
            [v23] = v4.None
        }));
        v19(v18 - 1);
        if v7.onRemoveCallback then
            v7.onRemoveCallback(v23, v24);
        end;
    end, l_dependencyArray_0(v16));
    local v27 = v3.useCallback(function(v26) --[[ Line: 72 ]]
        -- upvalues: v16 (copy)
        return v16[v26] ~= nil;
    end, l_dependencyArray_0(v16));
    return v3.createElement(v2.Provider, {
        value = v3.useMemo(function() --[[ Line: 77 ]]
            -- upvalues: v18 (copy), v16 (copy), v22 (copy), v25 (copy), v27 (copy), v7 (copy)
            return {
                selectedFriendsSize = v18, 
                selectedFriends = v16, 
                addFriend = v22, 
                removeFriend = v25, 
                isFriendSelected = v27, 
                preselectedUsers = v7.preselectedUsers
            };
        end, l_dependencyArray_0(v16, v22, v25, v27))
    }, v7.children);
end;