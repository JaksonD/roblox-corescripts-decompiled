local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(script.Parent.SetNicknameModal);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RobloxAppHooks);
local v5 = require(l_Parent_0.Networking.FriendsNetworking);
local v6 = require(l_Parent_1.UserProfiles);
local l_useScreenSize_0 = v4.useScreenSize;
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_1.RobloxAppHooks).useLocalUserId;
local v10 = require(l_Parent_1.RobloxAppNavigation);
local l_useNavigation_0 = require(l_Parent_1.Navigation).useNavigation;
local l_useUserProfilesFetch_0 = v6.Hooks.useUserProfilesFetch;
local l_userProfilesDisplayNameAndUsernameByUserIds_0 = v6.Queries.userProfilesDisplayNameAndUsernameByUserIds;
return function() --[[ Line: 30 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), v10 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesDisplayNameAndUsernameByUserIds_0 (copy), v6 (copy), v5 (copy), v3 (copy), v2 (copy)
    local v14 = l_useScreenSize_0();
    local v15 = l_useDispatch_0();
    local v16 = l_useLocalUserId_0();
    local v17 = l_useNavigation_0();
    local l_friendRequestParams_0 = v10.useNavigationProps(function(_, v19) --[[ Line: 36 ]]
        return {
            friendRequestParams = v19.friendRequestParams
        };
    end).friendRequestParams;
    local v21 = l_useUserProfilesFetch_0({
        userIds = {
            l_friendRequestParams_0.targetUserId
        }, 
        query = l_userProfilesDisplayNameAndUsernameByUserIds_0
    });
    local v22 = nil;
    v22 = if l_friendRequestParams_0 and v21 and v21.data then v6.Selectors.getDisplayNameFromId(v21.data, l_friendRequestParams_0.targetUserId) else nil;
    local function v25(v23) --[[ Line: 57 ]]
        -- upvalues: v16 (copy), v15 (copy), v5 (ref)
        local v24 = {
            senderNickname = v23, 
            currentUserId = v16
        };
        return v15(v5.ValidateFriendRequestNickname.API(v24));
    end;
    local v26, v27 = v3.useState(false);
    local v28, v29 = v3.useState(false);
    local function v31() --[[ Line: 68 ]]
        -- upvalues: v16 (copy), l_friendRequestParams_0 (copy), v15 (copy), v5 (ref)
        local v30 = {
            currentUserId = v16, 
            targetUserId = l_friendRequestParams_0.targetUserId, 
            friendshipOriginSourceType = l_friendRequestParams_0.source
        };
        return v15(v5.RequestFriendshipFromUserId.API(v30));
    end;
    local function v34(v32) --[[ Line: 77 ]]
        -- upvalues: v16 (copy), l_friendRequestParams_0 (copy), v15 (copy), v5 (ref)
        local v33 = {
            currentUserId = v16, 
            targetUserId = l_friendRequestParams_0.targetUserId, 
            friendshipOriginSourceType = l_friendRequestParams_0.source, 
            senderNickname = v32
        };
        return v15(v5.RequestFriendshipFromUserId.API(v33));
    end;
    return v3.createElement(v2, {
        friendRequestSource = l_friendRequestParams_0.source, 
        recipientDisplayName = v22, 
        screenSize = v14, 
        navigateBack = v17.goBack, 
        sendFriendRequest = v31, 
        sendFriendRequestWithNickname = v34, 
        validateNickname = v25, 
        onTextInput = v26, 
        setOnTextInput = v27, 
        isSaveButtonEnabled = v28, 
        setSaveButtonEnabled = v29, 
        source = l_friendRequestParams_0.source
    });
end;