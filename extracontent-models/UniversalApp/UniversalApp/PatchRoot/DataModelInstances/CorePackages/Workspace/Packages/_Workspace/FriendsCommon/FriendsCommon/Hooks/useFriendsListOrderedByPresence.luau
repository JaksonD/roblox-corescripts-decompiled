local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v4.useQuery;
local l_useApolloClient_0 = v4.useApolloClient;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local v8 = require(l_Parent_0.ApolloFriends);
local v9 = require(l_Parent_0.ApolloPresence);
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local l_FriendsCommonPresenceUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCommonPresenceUpdateSignal;
local v12 = game:DefineFastInt("FriendsListDefaultPageSize", 12);
local l_FFlagEnableUseSortScoresForFriendsCarouselLoad_0 = require(l_Parent_0.SharedFlags).FFlagEnableUseSortScoresForFriendsCarouselLoad;
local v14 = require(script.Parent.usePresenceImpressionEvents);
local v15 = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false);
local function _(v16) --[[ Line: 43 ]]
    -- upvalues: v3 (copy), l_PresenceType_0 (copy)
    return v3.List.map(v16, function(v17) --[[ Line: 44 ]]
        -- upvalues: l_PresenceType_0 (ref), v3 (ref)
        if v17.presence and v17.presence.userPresenceType == l_PresenceType_0.InGame and v17.presence.universeId == "" then
            local v18 = v3.Dictionary.join(v17.presence, {
                userPresenceType = l_PresenceType_0.Online
            });
            return v3.Dictionary.join(v17, {
                presence = v18
            });
        else
            return v17;
        end;
    end);
end;
local function v36(v20, v21) --[[ Line: 57 ]]
    -- upvalues: v3 (copy), l_FFlagEnableUseSortScoresForFriendsCarouselLoad_0 (copy), l_PresenceType_0 (copy)
    local v22 = {};
    for _, v24 in v20 do
        v22[v24.id] = v24.presence;
    end;
    local v26 = v3.List.filter(v21 or {}, function(v25) --[[ Line: 67 ]]
        -- upvalues: v22 (copy)
        return not v22[v25.id];
    end);
    local v27 = nil;
    if l_FFlagEnableUseSortScoresForFriendsCarouselLoad_0 then
        v27 = v3.List.sort(v20, function(v28, v29) --[[ Line: 75 ]]
            return v28.sortScore > v29.sortScore;
        end);
    else
        local v30 = {};
        local v31 = {};
        local v32 = {};
        for _, v34 in v20 do
            local v35 = if v34.presence then v34.presence.userPresenceType else l_PresenceType_0.Offline;
            if v35 == l_PresenceType_0.InGame then
                table.insert(v30, v34);
            elseif v35 == l_PresenceType_0.InStudio then
                table.insert(v31, v34);
            else
                table.insert(v32, v34);
            end;
        end;
        v27 = v3.List.join(v30, v32, v31);
    end;
    return v27, v26;
end;
local function v48(v37, v38, v39) --[[ Line: 100 ]] --[[ Name: shouldRefetchOnlineFriends ]]
    -- upvalues: l_queries_0 (copy), v3 (copy), v9 (copy), l_PresenceType_0 (copy)
    local v40 = v37:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v38
    });
    local v41 = if v40 then v40.onlineFriendsByUserId else {};
    local v42 = {};
    local v43 = v41 or {};
    for _, v45 in v43 do
        v42[v45.id] = v45.presence;
    end;
    return #v3.List.filter(v39, function(v46) --[[ Line: 113 ]]
        -- upvalues: v9 (ref), l_PresenceType_0 (ref), v42 (copy)
        local v47 = false;
        if v9.Formatters.formatNumberToPresenceType(v46.userPresenceType) ~= l_PresenceType_0.Offline then
            v47 = not v42[tostring(v46.userId)];
        end;
        return v47;
    end) > 0;
end;
local function v53(v49, v50) --[[ Line: 121 ]] --[[ Name: bulkUpdateUserPresences ]]
    -- upvalues: v9 (copy)
    for _, v52 in v50 do
        v9.Mutations.createUserPresenceCache(v49, {
            id = v52.userId, 
            userPresenceNumber = v52.userPresenceType, 
            lastLocation = v52.lastLocation, 
            lastOnline = v52.lastOnline, 
            gameId = v52.gameId, 
            placeId = v52.placeId, 
            rootPlaceId = v52.rootPlaceId, 
            universeId = v52.universeId
        });
    end;
end;
return function(v54) --[[ Line: 136 ]] --[[ Name: useFriendsListOrderedByPresence ]]
    -- upvalues: l_useApolloClient_0 (copy), v12 (copy), v8 (copy), v2 (copy), l_useQuery_0 (copy), l_queries_0 (copy), v3 (copy), l_FriendsCommonPresenceUpdateSignal_0 (copy), v53 (copy), v48 (copy), v36 (copy), l_PresenceType_0 (copy), v15 (copy), v14 (copy)
    local v55 = l_useApolloClient_0();
    local v56 = v54.pageSize or v12;
    local v57 = {
        userId = v54.userId, 
        sort = v8.Enums.Sort.FriendshipScore
    };
    local v58 = v2.useRef(nil);
    local v59 = v2.useRef(nil);
    local v60 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
        errorPolicy = "all", 
        skip = false, 
        notifyOnNetworkStatusChange = true, 
        variables = v3.Dictionary.join(v57, {
            pageLimit = v56, 
            pageCursor = ""
        })
    });
    local v61 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = false, 
        notifyOnNetworkStatusChange = true, 
        variables = v57
    });
    local v62 = if v60.data then v60.data.allFriendsByUserId.nextCursor else nil;
    local v63 = if v60.data then v60.data.allFriendsByUserId.friends else nil;
    local v64 = v61.data and v61.data.onlineFriendsByUserId or {};
    local v66 = v2.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v62 (copy), v60 (copy), v56 (copy), v59 (copy), v58 (copy)
        if not v62 or v62 == "" or v60.loading then
            return;
        else
            v60:fetchMore({
                variables = {
                    pageCursor = v62, 
                    pageLimit = v56
                }
            }):andThen(function(v65) --[[ Line: 189 ]]
                -- upvalues: v59 (ref)
                v59.current = v65 and v65.errors;
            end);
            v58.current = v62;
            return;
        end;
    end, {
        v62, 
        v60.loading
    });
    local function v67() --[[ Line: 196 ]]
        -- upvalues: v61 (copy), v60 (copy), v58 (copy), v59 (copy)
        v61:refetch();
        v60:refetch();
        v58.current = nil;
        v59.current = nil;
    end;
    v2.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: l_FriendsCommonPresenceUpdateSignal_0 (ref), v53 (ref), v55 (copy), v48 (ref), v57 (copy), v61 (copy)
        l_FriendsCommonPresenceUpdateSignal_0.Event:Connect(function(v68) --[[ Line: 204 ]]
            -- upvalues: v53 (ref), v55 (ref), v48 (ref), v57 (ref), v61 (ref)
            v53(v55, v68);
            if v48(v55, v57, v68) then
                v61:refetch();
            end;
        end);
        return function() --[[ Line: 211 ]]
            -- upvalues: l_FriendsCommonPresenceUpdateSignal_0 (ref)
            l_FriendsCommonPresenceUpdateSignal_0:Destroy();
        end;
    end, {});
    local v73, v74 = v2.useMemo(function() --[[ Line: 216 ]]
        -- upvalues: v36 (ref), v64 (copy), v3 (ref), l_PresenceType_0 (ref), v63 (copy)
        local l_v36_0 = v36;
        local l_v64_0 = v64;
        return l_v36_0(v3.List.map(l_v64_0, function(v71) --[[ Line: 44 ]]
            -- upvalues: l_PresenceType_0 (ref), v3 (ref)
            if v71.presence and v71.presence.userPresenceType == l_PresenceType_0.InGame and v71.presence.universeId == "" then
                local v72 = v3.Dictionary.join(v71.presence, {
                    userPresenceType = l_PresenceType_0.Online
                });
                return v3.Dictionary.join(v71, {
                    presence = v72
                });
            else
                return v71;
            end;
        end), v63);
    end, {
        v64, 
        v63
    });
    if v15 then
        v14(v64);
    end;
    local v75 = not v62 or v62 == "";
    return {
        onlineFriends = v73, 
        offlineFriends = v74, 
        fetchMoreFriends = v66, 
        refreshFriendsData = v67, 
        isEndOfList = v75
    };
end;