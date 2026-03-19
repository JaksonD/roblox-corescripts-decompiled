local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.State.Actions;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.FriendsMenu);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local l_InviteFriendContext_0 = v4.InviteFriendContext;
local l_InviteStatus_0 = v4.InviteStatus;
local v9 = require(l_Parent_0.GameInviteDependencies);
local v10 = require(l_Parent_0.analytics.GameInviteAnalyticsManager);
local l_Throttle_0 = require(l_Parent_1.NotificationsCommon).Throttle;
local v12 = require(l_Actions_0.ReceivedUserInviteStatus);
local l_networkImpl_0 = v9.networkImpl;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local v15 = require(l_Parent_0.Requests.PostSendExperienceInvite);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = require(l_Parent_1.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix;
return function(v18) --[[ Line: 41 ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), l_useSelector_0 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (copy), l_InviteStatus_0 (copy), v12 (copy), v10 (copy), v15 (copy), l_networkImpl_0 (copy), l_Players_0 (copy), l_Throttle_0 (copy), l_InviteFriendContext_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = v5.useRef(0);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 46 ]]
        return v21.GameInvitesStatus;
    end);
    local function v23() --[[ Line: 50 ]]
        -- upvalues: v20 (copy)
        return v20.current;
    end;
    local v33 = l_Throttle_0(function(v24, v25) --[[ Line: 54 ]]
        -- upvalues: v20 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (ref), v22 (copy), l_InviteStatus_0 (ref), v18 (copy), v19 (copy), v12 (ref), v10 (ref), v15 (ref), l_networkImpl_0 (ref), l_Players_0 (ref)
        v20.current = math.max(v25, v20.current);
        if l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and (not v24 or v24 == "" or not tonumber(v24) or tonumber(v24) == 0) then
            return;
        elseif v22[v24] and (v22[v24] ~= l_InviteStatus_0.Failed or v22[v24] == l_InviteStatus_0.Pending) then
            return;
        else
            local v26 = nil;
            v26 = if v18.isCoreScript then tostring(game.PlaceId) else v18.rootPlaceId or tostring(game.PlaceId);
            if v26 == "0" then
                warn("Game Invite failed to send. Cannot send invite to unpublished Place.");
                v19(v12(v24, l_InviteStatus_0.Failed));
                return;
            else
                local v27 = false;
                if v18.launchData ~= nil then
                    v27 = v18.launchData ~= "";
                end;
                local v28 = false;
                if v18.promptMessage ~= nil then
                    v28 = v18.promptMessage ~= "";
                end;
                local v29 = false;
                if v18.inviteMessageId ~= nil then
                    v29 = v18.inviteMessageId ~= "";
                end;
                v10:sendGameInviteModalEvent(v18.trigger, {
                    action_type = v10.ActionType.InviteTriggered, 
                    is_launch_data_provided = v27, 
                    is_prompt_customized = v28, 
                    is_invite_message_id_provided = v29, 
                    recipient_user_id = v24, 
                    recipient_row_number = v25
                });
                v19(v12(v24, l_InviteStatus_0.Pending));
                v15(l_networkImpl_0, v24, v26, v18.trigger, v18.inviteMessageId, v18.launchData):andThen(function(v30) --[[ Line: 101 ]]
                    -- upvalues: l_Players_0 (ref), v24 (copy), v10 (ref), v18 (ref), v19 (ref), v12 (ref), l_InviteStatus_0 (ref)
                    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                    local v32 = {
                        v24
                    };
                    v10:onActivatedInviteSent(l_LocalPlayer_0.UserId, v30.conversationId, v32, v18.rootPlaceId, v18.universeId);
                    v19(v12(v24, l_InviteStatus_0.Success));
                end, function() --[[ Line: 113 ]]
                    -- upvalues: v10 (ref), v18 (ref), v27 (copy), v28 (copy), v29 (copy), v24 (copy), v25 (copy), v19 (ref), v12 (ref), l_InviteStatus_0 (ref)
                    v10:sendGameInviteModalEvent(v18.trigger, {
                        action_type = v10.ActionType.InviteFailure, 
                        is_launch_data_provided = v27, 
                        is_prompt_customized = v28, 
                        is_invite_message_id_provided = v29, 
                        recipient_user_id = v24, 
                        recipient_row_number = v25
                    });
                    v19(v12(v24, l_InviteStatus_0.Failed));
                end);
                return;
            end;
        end;
    end);
    return v5.createElement(l_InviteFriendContext_0.Provider, {
        value = {
            inviteSingleFriend = v33, 
            getMaxRecipientRowNum = v23
        }
    }, v18.children);
end;