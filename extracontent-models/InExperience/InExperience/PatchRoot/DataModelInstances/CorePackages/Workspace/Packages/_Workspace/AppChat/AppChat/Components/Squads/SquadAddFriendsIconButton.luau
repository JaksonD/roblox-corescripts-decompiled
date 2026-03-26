local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Squads);
local v6 = require(l_Parent_0.SquadsCore);
local v7 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useCurrentSquadParentChannelId_0 = v6.Hooks.useCurrentSquadParentChannelId;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_Images_0 = v7.App.ImageSet.Images;
local l_EventNames_0 = v6.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v6.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadInvitePageNavSourceEnum_0 = v5.Enums.SquadInvitePageNavSourceEnum;
return function(v18) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v9 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v3 (copy), v1 (copy), l_EventNames_0 (copy), l_SquadInvitePageNavSourceEnum_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy)
    local v19 = v4.useContext(l_SquadExternalContractContext_0);
    local v20 = l_useCurrentSquadParentChannelId_0() or "";
    local v21 = v9(v20);
    local v22 = v21 and v21.participants or {};
    local v23 = l_useLocalization_0({
        tooManyPeopleText = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimit" or "Feature.Chat.Message.AddConnectionsPartyLimit"; 
            friendNum = v3.MAX_PARTICIPANT_COUNT, 
            connectionsNum = v3.MAX_PARTICIPANT_COUNT
        }
    });
    local v24 = v4.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v22 (copy), v3 (ref), v18 (copy), v1 (ref), v23 (copy), v19 (copy), l_EventNames_0 (ref), l_SquadInvitePageNavSourceEnum_0 (ref), v20 (copy)
        if #v22 > v3.MAX_PARTICIPANT_COUNT then
            v18.navigation.navigate(v1.RoactChatToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v23.tooManyPeopleText
                    }
                }
            });
            return;
        else
            v19.fireSquadAnalytics(l_EventNames_0.SquadInvitePageNavSource, {
                inviteNavSource = l_SquadInvitePageNavSourceEnum_0.SquadLobbyAddFriendsIconButtonClicked, 
                parentChannelId = v20
            });
            v18.navigation.navigate(v1.SquadInviteFriends, {
                conversationId = v20
            });
            return;
        end;
    end, {
        v20, 
        v18.navigation, 
        v22
    });
    return v4.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/actions/friends/friendAdd"], 
        iconSize = l_IconSize_0.Medium, 
        layoutOrder = 0, 
        onActivated = v24
    });
end;