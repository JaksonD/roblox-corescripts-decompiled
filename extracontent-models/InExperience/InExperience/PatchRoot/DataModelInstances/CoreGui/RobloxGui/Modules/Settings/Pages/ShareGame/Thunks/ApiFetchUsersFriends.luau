local l_CorePackages_0 = game:GetService("CorePackages");
local l_Requests_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_ApiFetchUsersPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences;
local l_DEPRECATED_UsersGetFriends_0 = l_Requests_0.DEPRECATED_UsersGetFriends;
local l_FetchUserFriendsStarted_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsStarted;
local l_FetchUserFriendsFailed_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsFailed;
local l_FetchUserFriendsCompleted_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsCompleted;
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
return function(v11, v12, _, v14) --[[ Line: 16 ]]
    -- upvalues: l_FetchUserFriendsStarted_0 (copy), l_DEPRECATED_UsersGetFriends_0 (copy), l_GetFFlagInviteListRerank_0 (copy), l_UserModel_0 (copy), l_UpdateUsers_0 (copy), l_ApiFetchUsersPresences_0 (copy), l_FetchUserFriendsCompleted_0 (copy), v2 (copy), l_FetchUserFriendsFailed_0 (copy)
    return function(v15) --[[ Line: 17 ]]
        -- upvalues: l_FetchUserFriendsStarted_0 (ref), v12 (copy), l_DEPRECATED_UsersGetFriends_0 (ref), v11 (copy), v14 (copy), l_GetFFlagInviteListRerank_0 (ref), l_UserModel_0 (ref), l_UpdateUsers_0 (ref), l_ApiFetchUsersPresences_0 (ref), l_FetchUserFriendsCompleted_0 (ref), v2 (ref), l_FetchUserFriendsFailed_0 (ref)
        v15:dispatch(l_FetchUserFriendsStarted_0(v12));
        return l_DEPRECATED_UsersGetFriends_0(v11, v12, v14):andThen(function(v16) --[[ Line: 21 ]]
            -- upvalues: l_GetFFlagInviteListRerank_0 (ref), l_UserModel_0 (ref), v15 (copy), l_UpdateUsers_0 (ref)
            local l_responseBody_0 = v16.responseBody;
            local v18 = {};
            local v19 = {};
            for v20, v21 in pairs(l_responseBody_0.data) do
                local v22 = tostring(v21.id);
                v21.isFriend = true;
                if l_GetFFlagInviteListRerank_0() then
                    v21.friendRank = v20;
                end;
                local v23 = l_UserModel_0.fromDataTable(v21);
                table.insert(v18, v22);
                v19[v23.id] = v23;
            end;
            v15:dispatch(l_UpdateUsers_0(v19));
            return v18;
        end):andThen(function(v24) --[[ Line: 43 ]]
            -- upvalues: v15 (copy), l_ApiFetchUsersPresences_0 (ref), v11 (ref)
            return v15:dispatch(l_ApiFetchUsersPresences_0(v11, v24));
        end):andThen(function(v25) --[[ Line: 46 ]]
            -- upvalues: v15 (copy), l_FetchUserFriendsCompleted_0 (ref), v12 (ref), v2 (ref)
            v15:dispatch(l_FetchUserFriendsCompleted_0(v12));
            return v2.resolve(v25);
        end, function(v26) --[[ Line: 50 ]]
            -- upvalues: v15 (copy), l_FetchUserFriendsFailed_0 (ref), v12 (ref), v2 (ref)
            v15:dispatch(l_FetchUserFriendsFailed_0(v12, v26));
            return v2.reject(v26);
        end);
    end;
end;