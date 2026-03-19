local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_utils_0 = l_Parent_1.utils;
local v5 = require(l_Parent_1.FriendsMenuDependencies);
local v6 = require(l_Parent_2.React);
local v7 = require(l_Parent_2.UserLib);
local v8 = require(l_Parent_2.RoactUtils);
local v9 = require(l_Parent_2.UserProfiles);
local v10 = require(l_Parent_2.FriendsCommon);
local v11 = require(l_Parent_2.Cryo);
local v12 = require(l_Parent_2.GraphQLServer);
local l_Constants_0 = v7.Utils.Constants;
local l_ThumbnailRequest_0 = v7.Utils.ThumbnailRequest;
local l_PreloadUsersThumbnail_0 = v7.Thunks.PreloadUsersThumbnail;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_sortFriendsByCorrectedPresenceAndRank_0 = v5.sortFriendsByCorrectedPresenceAndRank;
local l_networkImpl_0 = v5.networkImpl;
local l_PresenceType_0 = v12.types.PresenceType;
local v20 = require(l_Parent_1.Requests.GetFriendsSearch);
local v21 = require(l_Parent_1.Constants);
local v22 = require(l_Parent_1.Experiments.SortInvitesByScoreIXP);
local v23 = require(l_Parent_0.FriendsListContext);
local l_useFriendsListOrderedByPresence_0 = v10.Hooks.useFriendsListOrderedByPresence;
local v25 = require(l_utils_0.generateDummyFriends);
local v26 = require(l_Parent_1.Flags.FFlagFilterOutDeletedAccountsGameInvites);
local l_UserModel_0 = v7.Models.UserModel;
local v28 = {
    InviteAvatarThumbnailType = l_Constants_0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
    InviteAvatarThumbnailSize = l_Constants_0.RbxThumbnailSizes.Size150x150, 
    InviteAvatarRbxthumbType = l_Constants_0.RbxthumbTypes.AvatarHeadShot
};
v28.ThumbnailRequest = {
    InviteToGame = {
        l_ThumbnailRequest_0.fromData(v28.InviteAvatarThumbnailType, v28.InviteAvatarThumbnailSize)
    }
};
return function(v29) --[[ Line: 55 ]]
    -- upvalues: v22 (copy), l_networkImpl_0 (copy), l_Players_0 (copy), l_useDispatch_0 (copy), v6 (copy), v25 (copy), l_useFriendsListOrderedByPresence_0 (copy), v9 (copy), l_PreloadUsersThumbnail_0 (copy), v28 (copy), l_UserModel_0 (copy), l_PresenceType_0 (copy), v26 (copy), v21 (copy), l_sortFriendsByCorrectedPresenceAndRank_0 (copy), v11 (copy), v20 (copy), v23 (copy)
    local v30 = if v22.FFlagEnableSortInvitesByScoreExperiment then v22.useSortInvitesByScoreExperiment() else nil;
    local v31 = nil;
    v31 = if v29.networkImplOverride then v29.networkImplOverride else l_networkImpl_0;
    local v32 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "0";
    local v33 = l_useDispatch_0();
    local v34, v35 = v6.useState("");
    local v36, v37 = v6.useState(true);
    local v38 = {};
    local v39, v40 = v6.useState((v25(10)));
    local v41 = l_useFriendsListOrderedByPresence_0({
        userId = v32, 
        pageSize = 50, 
        shouldListenToPresenceUpdates = false
    });
    local v42 = v9.Hooks.useUserProfilesFetch({
        userIds = {}, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local function v57(v43, v44) --[[ Line: 85 ]]
        -- upvalues: v33 (copy), l_PreloadUsersThumbnail_0 (ref), v28 (ref), v42 (copy), v29 (copy), l_UserModel_0 (ref), v41 (copy), l_PresenceType_0 (ref), v26 (ref), v21 (ref), v30 (copy), v22 (ref), l_sortFriendsByCorrectedPresenceAndRank_0 (ref), v40 (copy), v37 (copy), v38 (ref), v11 (ref)
        v33(l_PreloadUsersThumbnail_0(v43, v28.ThumbnailRequest.InviteToGame, nil));
        v42:fetchMore({
            variables = {
                userIds = v43
            }
        }):andThen(function(v45) --[[ Line: 93 ]]
            -- upvalues: v43 (copy), v29 (ref), l_UserModel_0 (ref), v41 (ref), l_PresenceType_0 (ref), v26 (ref), v21 (ref), v30 (ref), v22 (ref), v44 (copy), l_sortFriendsByCorrectedPresenceAndRank_0 (ref), v40 (ref), v37 (ref)
            local v46 = {};
            for _, v48 in v43 do
                if not v29.excludedFriendsSet or not v29.excludedFriendsSet[v48] then
                    local l_OFFLINE_0 = l_UserModel_0.PresenceType.OFFLINE;
                    local v50 = nil;
                    for _, v52 in v41.onlineFriends do
                        if v48 == v52.id then
                            if v52.presence then
                                local l_userPresenceType_0 = v52.presence.userPresenceType;
                                if l_userPresenceType_0 == l_PresenceType_0.InGame then
                                    l_OFFLINE_0 = l_UserModel_0.PresenceType.IN_GAME;
                                elseif l_userPresenceType_0 == l_PresenceType_0.Online then
                                    l_OFFLINE_0 = l_UserModel_0.PresenceType.ONLINE;
                                elseif l_userPresenceType_0 == l_PresenceType_0.InStudio then
                                    l_OFFLINE_0 = l_UserModel_0.PresenceType.IN_STUDIO;
                                end;
                                v50 = v52.presence.lastLocation;
                                break;
                            else
                                break;
                            end;
                        end;
                    end;
                    for _, v55 in v45.data.userProfiles do
                        if (not v26 or v55.names.username ~= v21.NameAccountDeleted) and v55.id == v48 then
                            table.insert(v46, {
                                id = v48, 
                                presence = l_OFFLINE_0, 
                                lastLocation = v50, 
                                displayName = v55.names.combinedName, 
                                name = v55.names.username, 
                                friendRank = if not not v30 or v22.FFlagSortInvitesByScoreEnabledForAll then v44 and v44[v48] else nil
                            });
                            break;
                        end;
                    end;
                end;
            end;
            table.sort(v46, l_sortFriendsByCorrectedPresenceAndRank_0);
            v40(v46);
            v37(false);
        end):catch(function(v56) --[[ Line: 144 ]]
            -- upvalues: v37 (ref)
            print("error", v56);
            v37(false);
        end);
        if v38 then
            return (v11.List.join(v38, v43));
        else
            return v43;
        end;
    end;
    v38 = v6.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v34 (copy), v20 (ref), v31 (ref), v32 (copy), v30 (copy), v22 (ref), v11 (ref), v57 (copy), v41 (copy), v38 (ref)
        if v34 ~= "" then
            v20(v31, v32, v34, 20):andThen(function(v58) --[[ Line: 154 ]]
                -- upvalues: v30 (ref), v22 (ref), v11 (ref), v57 (ref)
                local v59 = if not not v30 or v22.FFlagSortInvitesByScoreEnabledForAll then {} else nil;
                local v62 = v11.List.map(v58.responseBody.PageItems, function(v60, v61) --[[ Line: 159 ]]
                    -- upvalues: v30 (ref), v22 (ref), v59 (copy)
                    if v30 or v22.FFlagSortInvitesByScoreEnabledForAll then
                        v59[v60.id] = v61;
                    end;
                    return (tostring(v60.id));
                end);
                return (v57(v62, v59));
            end):catch(function(v63) --[[ Line: 166 ]]
                print("error", v63);
            end);
        elseif v41.onlineFriends and v41.offlineFriends then
            local v64 = {};
            local v65 = if not not v30 or v22.FFlagSortInvitesByScoreEnabledForAll then {} else nil;
            for v66, v67 in (v11.List.join(v41.offlineFriends, v41.onlineFriends)) do
                if not (v11.List.find(v38, v67.id) ~= nil) then
                    table.insert(v64, v67.id);
                    if v30 or v22.FFlagSortInvitesByScoreEnabledForAll then
                        v65[v67.id] = v66;
                    end;
                end;
            end;
            return (v57(v64, v65));
        end;
        return {};
    end, {
        v41.onlineFriends, 
        v41.offlineFriends, 
        v34
    });
    return v6.createElement(v23.Provider, {
        value = {
            friends = v39, 
            hasFriends = not v11.isEmpty(v41.onlineFriends) or not v11.isEmpty(v41.offlineFriends), 
            isFetchingFriends = v42.loading or v29.isLoadingCustomParams or v36, 
            isFriendsListFetchFailed = false, 
            friendsNames = {
                loading = v42 and v42.loading
            }, 
            fetchMoreFriends = v41.fetchMoreFriends, 
            searchFriends = v35, 
            searchFriendsString = v34
        }
    }, v29.children);
end;