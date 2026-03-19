local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_FetchUserFriendsStarted_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsStarted;
local l_FetchUserFriendsFailed_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsFailed;
local l_FetchUserFriendsCompleted_0 = require(l_script_FirstAncestor_0.Actions).FetchUserFriendsCompleted;
local function v12(v7, v8, v9, v10) --[[ Line: 11 ]] --[[ Name: setFieldPerUser ]]
    -- upvalues: l_Immutable_0 (copy)
    local v11 = v7[v8] or {};
    return l_Immutable_0.JoinDictionaries(v7, {
        [v8] = l_Immutable_0.JoinDictionaries(v11, {
            [v9] = v10
        })
    });
end;
local function _(v13, v14, v15) --[[ Line: 20 ]] --[[ Name: setRetrievalStatus ]]
    -- upvalues: v12 (copy)
    return v12(v13, "retrievalStatus", v14, v15);
end;
local function _(v17, v18, v19) --[[ Line: 24 ]] --[[ Name: setRetrievalFailureResponse ]]
    -- upvalues: v12 (copy)
    return v12(v17, "retrievalFailureResponse", v18, v19);
end;
return function(v21, v22) --[[ Line: 28 ]]
    -- upvalues: l_FetchUserFriendsStarted_0 (copy), l_RetrievalStatus_0 (copy), v12 (copy), l_FetchUserFriendsFailed_0 (copy), l_FetchUserFriendsCompleted_0 (copy)
    v21 = v21 or {
        retrievalStatus = {}, 
        retrievalFailureResponse = {}
    };
    if v22.type == l_FetchUserFriendsStarted_0.name then
        local l_v21_0 = v21;
        local l_userId_0 = v22.userId;
        local l_Fetching_0 = l_RetrievalStatus_0.Fetching;
        return (v12(l_v21_0, "retrievalStatus", l_userId_0, l_Fetching_0));
    elseif v22.type == l_FetchUserFriendsFailed_0.name then
        local l_v21_1 = v21;
        local l_userId_1 = v22.userId;
        local l_Failed_0 = l_RetrievalStatus_0.Failed;
        l_v21_1 = v12(l_v21_1, "retrievalStatus", l_userId_1, l_Failed_0);
        l_userId_1 = v22.userId;
        l_Failed_0 = v22.response;
        return (v12(l_v21_1, "retrievalFailureResponse", l_userId_1, l_Failed_0));
    else
        if v22.type == l_FetchUserFriendsCompleted_0.name then
            local l_v21_2 = v21;
            local l_userId_2 = v22.userId;
            local l_Done_0 = l_RetrievalStatus_0.Done;
            v21 = v12(l_v21_2, "retrievalStatus", l_userId_2, l_Done_0);
        end;
        return v21;
    end;
end;