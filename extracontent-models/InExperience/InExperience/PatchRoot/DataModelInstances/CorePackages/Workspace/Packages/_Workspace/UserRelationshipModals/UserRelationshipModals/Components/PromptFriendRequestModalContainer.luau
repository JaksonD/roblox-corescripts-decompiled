local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserRelationshipModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsReact);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v8 = require(l_Parent_0.UserProfiles);
local v9 = require(l_Parent_0.FriendsNetworking);
local v10 = require(l_script_FirstAncestor_0.Networking.myFriendsNetworking);
local l_FriendshipOriginSourceType_0 = v9.Enums.FriendshipOriginSourceType;
local v12 = require(script.Parent.PromptFriendRequestModal);
local v13 = v8.Stores.UserProfileStore.get();
return function(v14) --[[ Line: 30 ]] --[[ Name: PromptFriendRequestModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v3 (copy), v4 (copy), v13 (copy), v5 (copy), l_Players_0 (copy), v10 (copy), l_FriendshipOriginSourceType_0 (copy), v12 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useLocalUserId_0();
    local v21 = v3.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v4 (ref), v13 (ref), v14 (copy)
        return v4.createComputed(function(v17) --[[ Line: 35 ]]
            -- upvalues: v13 (ref), v14 (ref)
            local v18 = v13.fetchNamesByUserIds({
                (tostring(v14.userId))
            })(v17);
            local v19 = v18 and v18.data and v18.data[1];
            local v20 = v19 and v19.names;
            return {
                combinedName = if v20 then v20.getCombinedName(v17) else "", 
                username = if v20 then v20.getUsername() else ""
            };
        end);
    end, {
        v14.userId
    });
    local v22 = v5.useSignalState(v21);
    local v25 = v3.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: l_Players_0 (ref), v14 (copy), v15 (copy), v10 (ref), v16 (copy), l_FriendshipOriginSourceType_0 (ref)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v14.userId);
        if l_Players_0.LocalPlayer ~= nil and l_l_Players_0_PlayerByUserId_0 ~= nil then
            l_Players_0.LocalPlayer:RequestFriendship(l_l_Players_0_PlayerByUserId_0);
        else
            v15(v10.RequestFriendshipFromUserId.API({
                currentUserId = v16, 
                targetUserId = tostring(v14.userId), 
                friendshipOriginSourceType = l_FriendshipOriginSourceType_0.InGame.rawValue()
            })):andThen(function() --[[ Line: 64 ]]

            end):catch(function(_) --[[ Line: 67 ]]

            end);
        end;
        v14.onClose();
    end, {
        v16, 
        v14.userId, 
        v15, 
        v14.onClose
    });
    return v3.createElement(v12, {
        userId = v14.userId, 
        displayName = v22.combinedName, 
        username = v22.username, 
        onClose = v14.onClose, 
        onSendClicked = v25, 
        inputDelay = v14.inputDelay
    });
end;