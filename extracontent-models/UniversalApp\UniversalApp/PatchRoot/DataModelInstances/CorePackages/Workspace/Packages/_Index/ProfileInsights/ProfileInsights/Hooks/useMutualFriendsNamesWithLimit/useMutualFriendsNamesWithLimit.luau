local l_Parent_0 = script:FindFirstAncestor("ProfileInsights").Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.ApolloProfileInsights);
local l_useProfileInsightsByUserIds_0 = v2.Hooks.useProfileInsightsByUserIds;
local l_getMutualFriendsByUserIdFromData_0 = v2.Selectors.getMutualFriendsByUserIdFromData;
local v5 = require(l_Parent_0.UserProfiles);
local function _(v6, v7) --[[ Line: 18 ]] --[[ Name: getUserIdsWithLimit ]]
    -- upvalues: l_Array_0 (copy)
    local v8 = l_Array_0.slice(v6, 1, v7 + 1);
    return l_Array_0.map(v8, function(v9) --[[ Line: 21 ]]
        return v9.id;
    end);
end;
local function _(v11, v12) --[[ Line: 26 ]] --[[ Name: getUsersNamesFromData ]]
    -- upvalues: l_Array_0 (copy), v5 (copy)
    if v11 then
        return (l_Array_0.map(v12, function(v13) --[[ Line: 28 ]]
            -- upvalues: v5 (ref), v11 (copy)
            return v5.Selectors.getCombinedNameFromId(v11, v13);
        end));
    else
        return nil;
    end;
end;
return function(v15) --[[ Line: 34 ]] --[[ Name: useMutualFriendsNamesWithLimit ]]
    -- upvalues: l_useProfileInsightsByUserIds_0 (copy), l_getMutualFriendsByUserIdFromData_0 (copy), l_Array_0 (copy), v5 (copy)
    local v16 = l_useProfileInsightsByUserIds_0({
        userIds = {
            v15.userId
        }
    });
    local v17 = l_getMutualFriendsByUserIdFromData_0(v16.data, v15.userId);
    local l_limit_0 = v15.limit;
    local v19 = l_Array_0.slice(v17, 1, l_limit_0 + 1);
    local v21 = l_Array_0.map(v19, function(v20) --[[ Line: 21 ]]
        return v20.id;
    end);
    l_limit_0 = v5.Hooks.useUserProfilesFetch({
        userIds = v21, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    v19 = v16.loading or l_limit_0.loading;
    local l_data_0 = l_limit_0.data;
    return if l_data_0 then l_Array_0.map(v21, function(v23) --[[ Line: 28 ]]
        -- upvalues: v5 (ref), l_data_0 (copy)
        return v5.Selectors.getCombinedNameFromId(l_data_0, v23);
    end) else nil, v19;
end;