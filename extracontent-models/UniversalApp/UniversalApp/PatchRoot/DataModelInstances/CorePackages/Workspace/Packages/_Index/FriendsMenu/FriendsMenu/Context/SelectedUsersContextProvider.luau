local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.SelectedUsersContext);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
local v6 = require(l_Parent_1.UserProfiles);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_1.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v8) --[[ Line: 22 ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v2 (copy)
    local v9 = v6.Hooks.useUserProfilesFetch({
        userIds = v8.preselectedUsers or {}, 
        query = v6.Queries.userProfilesCombinedNameByUserIds
    });
    local v15 = v3.useCallback(function(v10) --[[ Line: 28 ]]
        -- upvalues: v9 (copy), v6 (ref), v8 (copy)
        local v11 = {};
        local v12 = "";
        for _, v14 in pairs(v10) do
            if v9.data then
                v12 = v6.Selectors.getCombinedNameFromId(v9.data, v14);
            end;
            v11[v14] = {
                displayName = v12, 
                layoutOrder = #v11 + 1, 
                unremovable = v8.preselectedUsersUnremovable
            };
        end;
        return v11;
    end, nil);
    local v16 = v3.useRef(if v8.preselectedUsers then #v8.preselectedUsers else 0);
    local v17, v18 = v3.useState(if v8.preselectedUsers then v15(v8.preselectedUsers) else {});
    local v19, v20 = v3.useState(if v8.preselectedUsers then #v8.preselectedUsers else 0);
    local v23 = v3.useCallback(function(v21, v22) --[[ Line: 52 ]]
        -- upvalues: v8 (copy), v19 (copy), v18 (copy), v4 (ref), v17 (copy), v16 (copy), v20 (copy)
        if v8.selectionLimit == nil or v19 < v8.selectionLimit then
            v18(v4.Dictionary.join(v17, {
                [v21] = {
                    displayName = v22, 
                    layoutOrder = v16.current
                }
            }));
            v16.current = v16.current + 1;
            v20(v19 + 1);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v17
    } else l_dependencyArray_0(v17));
    local v26 = v3.useCallback(function(v24, v25) --[[ Line: 66 ]]
        -- upvalues: v18 (copy), v4 (ref), v17 (copy), v20 (copy), v19 (copy), v8 (copy)
        v18(v4.Dictionary.join(v17, {
            [v24] = v4.None
        }));
        v20(v19 - 1);
        if v8.onRemoveCallback then
            v8.onRemoveCallback(v24, v25);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v17
    } else l_dependencyArray_0(v17));
    local v28 = v3.useCallback(function(v27) --[[ Line: 74 ]]
        -- upvalues: v17 (copy)
        return v17[v27] ~= nil;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v17
    } else l_dependencyArray_0(v17));
    return v3.createElement(v2.Provider, {
        value = v3.useMemo(function() --[[ Line: 80 ]]
            -- upvalues: v19 (copy), v17 (copy), v23 (copy), v26 (copy), v28 (copy), v8 (copy)
            return {
                selectedFriendsSize = v19, 
                selectedFriends = v17, 
                addFriend = v23, 
                removeFriend = v26, 
                isFriendSelected = v28, 
                preselectedUsers = v8.preselectedUsers
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v17, 
            v23, 
            v26, 
            v28
        } else l_dependencyArray_0(v17, v23, v26, v28))
    }, v8.children);
end;