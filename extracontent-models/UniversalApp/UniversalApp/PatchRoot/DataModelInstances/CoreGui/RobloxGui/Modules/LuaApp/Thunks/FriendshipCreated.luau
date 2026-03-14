local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserService_0 = game:GetService("UserService");
local l_ApiFetchUsersPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences;
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
local l_PreloadUsersThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail;
local l_USER_CAROUSEL_HEAD_SHOT_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests.USER_CAROUSEL_HEAD_SHOT;
local function v19(v8, v9, v10, v11) --[[ Line: 13 ]] --[[ Name: AddNewFriend ]]
    -- upvalues: l_UserService_0 (copy), l_UserModel_0 (copy), l_UpdateUsers_0 (copy), l_PreloadUsersThumbnail_0 (copy), l_USER_CAROUSEL_HEAD_SHOT_0 (copy), l_ApiFetchUsersPresences_0 (copy), v4 (copy)
    local v12 = v11 and v11.UserService or l_UserService_0;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
        -- upvalues: v12 (copy), v10 (copy)
        return v12:GetUserInfosByUserIdsAsync({
            (tonumber(v10))
        })[1];
    end);
    if not l_status_0 then
        return;
    elseif not l_result_0 or not l_result_0.Username or not l_result_0.DisplayName then
        return;
    else
        local v15 = l_UserModel_0.fromDataTable({
            id = v10, 
            isFriend = true, 
            friendRank = 0, 
            name = l_result_0.Username, 
            displayName = l_result_0.DisplayName, 
            hasVerifiedBadge = l_result_0.HasVerifiedBadge
        });
        v8:dispatch(l_UpdateUsers_0({
            v15
        }));
        local v16 = {
            v10
        };
        local v17 = v8:dispatch(l_PreloadUsersThumbnail_0(v16, l_USER_CAROUSEL_HEAD_SHOT_0, nil));
        local v18 = {
            v8:dispatch(l_ApiFetchUsersPresences_0(v9, v16)), 
            v17
        };
        v4.all(v18);
        return;
    end;
end;
return function(v20, v21) --[[ Line: 52 ]]
    -- upvalues: v19 (copy)
    return function(v22, v23) --[[ Line: 53 ]]
        -- upvalues: v19 (ref), v20 (copy), v21 (copy)
        v19(v22, v20, v21, v23);
    end;
end;