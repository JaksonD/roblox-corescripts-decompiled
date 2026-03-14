local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_utils_0 = l_Parent_1.utils;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_1.FriendsMenuDependencies);
local v6 = require(l_Parent_1.Constants);
local _ = require(l_Parent_1.friendsMenuModalType);
local v8 = require(l_Parent_2.React);
local l_Requests_0 = require(l_Parent_2.Http).Requests;
local v10 = require(l_Parent_2.UserLib);
local v11 = require(l_Parent_2.RoactUtils);
local v12 = require(l_Parent_2.UserProfiles);
local l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 = require(l_Parent_2.SharedFlags).GetFFlagEnableFriendsListSearchNormalizationErrorFix;
local l_UserModel_0 = v10.Models.UserModel;
local l_Constants_0 = v10.Utils.Constants;
local l_ApiFetchUsersPresences_0 = v10.Thunks.ApiFetchUsersPresences;
local l_UpdateUsers_0 = v10.Thunks.UpdateUsers;
local l_ThumbnailRequest_0 = v10.Utils.ThumbnailRequest;
local l_PreloadUsersThumbnail_0 = v10.Thunks.PreloadUsersThumbnail;
local l_networkImpl_0 = v5.networkImpl;
local l_sortFriendsByCorrectedPresenceAndRank_0 = v5.sortFriendsByCorrectedPresenceAndRank;
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local v24 = require(l_Parent_0.FriendsListContext);
local v25 = require(l_utils_0.generateDummyFriends);
local l_DEPRECATED_UsersGetFriends_0 = l_Requests_0.DEPRECATED_UsersGetFriends;
local l_UserSorts_0 = v6.UserSorts;
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
return function(v29) --[[ Line: 62 ]]
    -- upvalues: l_networkImpl_0 (copy), v8 (copy), v25 (copy), l_useDispatch_0 (copy), v12 (copy), l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 (copy), l_Players_0 (copy), l_DEPRECATED_UsersGetFriends_0 (copy), l_UserSorts_0 (copy), l_UserModel_0 (copy), l_UpdateUsers_0 (copy), l_PreloadUsersThumbnail_0 (copy), v28 (copy), l_ApiFetchUsersPresences_0 (copy), l_useSelector_0 (copy), l_sortFriendsByCorrectedPresenceAndRank_0 (copy), v24 (copy)
    local v30 = nil;
    v30 = if v29.networkImplOverride then v29.networkImplOverride else l_networkImpl_0;
    local v31, v32 = v8.useState(false);
    local v33, v34 = v8.useState(false);
    local v35, v36 = v8.useState({});
    local v37, v38 = v8.useState("");
    local v39, v40 = v8.useState((v25(7)));
    local v41 = l_useDispatch_0();
    local v42 = nil;
    v42 = v12.Hooks.useUserProfilesFetch({
        userIds = v35, 
        query = v12.Queries.userProfilesAllNamesByUserIds
    });
    local function v56(v43) --[[ Line: 89 ]]
        -- upvalues: v29 (copy), v37 (copy), v42 (ref), v12 (ref), l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 (ref)
        if not v43 or not v43.isFriend then
            return false;
        elseif v29.excludedFriendsSet and v29.excludedFriendsSet[v43.id] then
            return false;
        elseif v37 == nil or v37 == "" then
            return true;
        else
            local v44 = v43.displayName or "";
            local v45 = v43.name or "";
            local v46 = "";
            local v47 = "";
            local v48 = "";
            if v42 and v42.data then
                local l_names_0 = v12.Selectors.getUserProfileFromId(v42.data, v43.id).names;
                if l_names_0 then
                    v46 = l_names_0.alias or "";
                    v44 = l_names_0.displayName or "";
                    v45 = l_names_0.username or "";
                    v47 = l_names_0.contactName or "";
                    v48 = l_names_0.platformName or "";
                end;
            end;
            local v50 = utf8.nfdnormalize(v44);
            local v51 = utf8.nfdnormalize(v46);
            local v52 = utf8.nfdnormalize(v47);
            local v53 = utf8.nfdnormalize(v48);
            local v54 = nil;
            if l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                pcall(function() --[[ Line: 126 ]]
                    -- upvalues: v54 (ref), v37 (ref)
                    v54 = utf8.nfdnormalize(v37);
                end);
            else
                v54 = utf8.nfdnormalize(v37);
            end;
            if l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                return v54 and (string.find(v51:lower(), v54:lower(), 1, true) ~= nil or string.find(v52:lower(), v54:lower(), 1, true) ~= nil or string.find(v53:lower(), v54:lower(), 1, true) ~= nil or string.find(v50:lower(), v54:lower(), 1, true) ~= nil) or string.find(v45:lower(), v37:lower(), 1, true) ~= nil;
            else
                local v55 = true;
                if string.find(v51:lower(), v54:lower(), 1, true) == nil then
                    v55 = true;
                    if string.find(v52:lower(), v54:lower(), 1, true) == nil then
                        v55 = true;
                        if string.find(v53:lower(), v54:lower(), 1, true) == nil then
                            v55 = true;
                            if string.find(v50:lower(), v54:lower(), 1, true) == nil then
                                v55 = string.find(v45:lower(), v37:lower(), 1, true) ~= nil;
                            end;
                        end;
                    end;
                end;
                return v55;
            end;
        end;
    end;
    local function _(v57) --[[ Line: 156 ]]
        -- upvalues: v42 (ref), v12 (ref)
        local v58 = nil;
        if v42 and v42.data then
            v58 = v12.Selectors.getCombinedNameFromId(v42.data, v57.id);
        end;
        if v58 == nil then
            return v57.displayName;
        else
            return v58;
        end;
    end;
    local function _(v60) --[[ Line: 168 ]]
        -- upvalues: v42 (ref), v12 (ref)
        local v61 = nil;
        if v42 and v42.data then
            v61 = v12.Selectors.getUsernameFromId(v42.data, v60.id);
        end;
        if v61 == nil then
            return v60.name;
        else
            return v61;
        end;
    end;
    v8.useEffect(function() --[[ Line: 180 ]]
        -- upvalues: l_Players_0 (ref), v31 (copy), v32 (copy), v34 (copy), l_DEPRECATED_UsersGetFriends_0 (ref), v30 (ref), l_UserSorts_0 (ref), l_UserModel_0 (ref), v41 (copy), l_UpdateUsers_0 (ref), v36 (copy), l_PreloadUsersThumbnail_0 (ref), v28 (ref), l_ApiFetchUsersPresences_0 (ref)
        local v63 = nil;
        if l_Players_0 and l_Players_0.LocalPlayer then
            v63 = tostring(l_Players_0.LocalPlayer.UserId);
        end;
        if not v31 and v63 then
            v32(true);
            v34(false);
            l_DEPRECATED_UsersGetFriends_0(v30, v63, l_UserSorts_0.StatusFrequents):andThen(function(v64) --[[ Line: 190 ]]
                -- upvalues: l_UserModel_0 (ref), v41 (ref), l_UpdateUsers_0 (ref), v36 (ref)
                local l_responseBody_0 = v64.responseBody;
                local v66 = {};
                local v67 = {};
                for v68, v69 in pairs(l_responseBody_0.data) do
                    local v70 = tostring(v69.id);
                    v69.isFriend = true;
                    v69.friendRank = v68;
                    v69.name = "";
                    v69.displayName = "";
                    local v71 = l_UserModel_0.fromDataTable(v69);
                    table.insert(v66, v70);
                    v67[v71.id] = v71;
                end;
                v41(l_UpdateUsers_0(v67));
                v36(v66);
                return v66;
            end, function(_) --[[ Line: 209 ]]
                -- upvalues: v32 (ref), v34 (ref)
                v32(false);
                v34(true);
                return {};
            end):andThen(function(v73) --[[ Line: 215 ]]
                -- upvalues: v41 (ref), l_PreloadUsersThumbnail_0 (ref), v28 (ref), l_ApiFetchUsersPresences_0 (ref), v30 (ref)
                v41(l_PreloadUsersThumbnail_0(v73, v28.ThumbnailRequest.InviteToGame, nil));
                return v41(l_ApiFetchUsersPresences_0(v30, v73));
            end):andThen(function(_) --[[ Line: 223 ]]
                -- upvalues: v32 (ref)
                v32(false);
            end, function(_) --[[ Line: 225 ]]
                -- upvalues: v32 (ref), v34 (ref)
                v32(false);
                v34(true);
            end);
        end;
    end, {});
    local v77 = l_useSelector_0(function(v76) --[[ Line: 232 ]]
        return v76.Users;
    end);
    v8.useEffect(function() --[[ Line: 236 ]]
        -- upvalues: v31 (copy), v40 (copy), v25 (ref), v77 (copy), v56 (copy), v42 (ref), v12 (ref), l_sortFriendsByCorrectedPresenceAndRank_0 (ref)
        if v31 then
            v40(v25(7));
            return;
        else
            local v78 = {};
            for _, v80 in pairs(v77) do
                if v56(v80) then
                    v78[#v78 + 1] = v80;
                    local v81 = nil;
                    if v42 and v42.data then
                        v81 = v12.Selectors.getCombinedNameFromId(v42.data, v80.id);
                    end;
                    v80.displayName = if v81 == nil then v80.displayName else v81;
                    v81 = nil;
                    if v42 and v42.data then
                        v81 = v12.Selectors.getUsernameFromId(v42.data, v80.id);
                    end;
                    v80.name = if v81 == nil then v80.name else v81;
                end;
            end;
            table.sort(v78, l_sortFriendsByCorrectedPresenceAndRank_0);
            v40(v78);
            return;
        end;
    end, {
        v77, 
        v37, 
        tostring(v31), 
        (tostring(v42 and v42.loading))
    });
    return v8.createElement(v24.Provider, {
        value = {
            friends = v39, 
            hasFriends = #v35 > 0, 
            isFetchingFriends = v31 or v29.isLoadingCustomParams, 
            isFriendsListFetchFailed = v33, 
            friendsNames = {
                loading = v42 and v42.loading
            }, 
            searchFriends = v38, 
            searchFriendsString = v37
        }
    }, v29.children);
end;