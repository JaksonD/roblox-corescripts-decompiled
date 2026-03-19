local l_UserService_0 = game:GetService("UserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.UserLib);
local l_USER_CAROUSEL_HEAD_SHOT_0 = v5.Utils.AvatarThumbnailRequests.USER_CAROUSEL_HEAD_SHOT;
local l_GetConversationMetadata_0 = v3.rodux.GetConversationMetadata;
local l_PreloadUsersThumbnail_0 = v5.Thunks.PreloadUsersThumbnail;
local l_UpdateUsers_0 = v5.Thunks.UpdateUsers;
local l_UserModel_0 = v5.Models.UserModel;
local l_receiveUsersPresence_0 = v5.Utils.receiveUsersPresence;
local v12 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local function v26(v13, v14, v15) --[[ Line: 23 ]] --[[ Name: AddNewFriend ]]
    -- upvalues: l_UserService_0 (copy), l_UserModel_0 (copy), l_UpdateUsers_0 (copy), l_PreloadUsersThumbnail_0 (copy), l_USER_CAROUSEL_HEAD_SHOT_0 (copy), v12 (copy), l_receiveUsersPresence_0 (copy), l_GetConversationMetadata_0 (copy), v4 (copy)
    local v16 = v15 and v15.UserService or l_UserService_0;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
        -- upvalues: v16 (copy), v14 (copy)
        return v16:GetUserInfosByUserIdsAsync({
            (tonumber(v14))
        })[1];
    end);
    if not l_status_0 then
        return;
    elseif not l_result_0 or not l_result_0.Username or not l_result_0.DisplayName then
        return;
    else
        local v19 = l_UserModel_0.fromDataTable({
            id = v14, 
            isFriend = true, 
            friendRank = 0, 
            name = l_result_0.Username, 
            displayName = l_result_0.DisplayName, 
            hasVerifiedBadge = l_result_0.HasVerifiedBadge
        });
        v13:dispatch(l_UpdateUsers_0({
            v19
        }));
        local v20 = {
            v14
        };
        local v21 = v13:dispatch(l_PreloadUsersThumbnail_0(v20, l_USER_CAROUSEL_HEAD_SHOT_0, nil));
        local v25 = {
            v13:dispatch(v12.GetPresencesFromUserIds.API(v20)):andThen(function(v22) --[[ Line: 60 ]]
                -- upvalues: l_receiveUsersPresence_0 (ref), v13 (copy)
                local l_userPresences_0 = v22.responseBody.userPresences;
                l_receiveUsersPresence_0(l_userPresences_0, v13);
                return v22;
            end):catch(function(v24) --[[ Line: 65 ]]
                warn("NetworkingPresence failure in ChatFriendshipCreated, Status: " .. tostring(v24));
            end), 
            v21
        };
        v13:dispatch(l_GetConversationMetadata_0.API());
        v4.all(v25);
        return;
    end;
end;
return function(v27) --[[ Line: 77 ]]
    -- upvalues: v26 (copy)
    return function(v28, v29) --[[ Line: 78 ]]
        -- upvalues: v26 (ref), v27 (copy)
        v26(v28, v27, v29);
    end;
end;