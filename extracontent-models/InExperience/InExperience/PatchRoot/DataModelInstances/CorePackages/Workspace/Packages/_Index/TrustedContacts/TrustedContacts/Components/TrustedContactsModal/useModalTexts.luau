local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UserProfiles);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_FFlagTCParentChildAutoUpgrade_0 = require(l_Parent_0.SharedFlags).FFlagTCParentChildAutoUpgrade;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v10, v11, v12) --[[ Line: 23 ]] --[[ Name: useModalTexts ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v2 (copy), l_TrustedConnectionStatus_0 (copy), l_FFlagTCParentChildAutoUpgrade_0 (copy), l_Sources_0 (copy)
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v10
        }, 
        query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v18 and v18.data then
        v17 = v4.Selectors.getUsernameFromId(v18.data, v10) or "";
    end;
    local v19 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        add = "Feature.Friends.Action.Add", 
        addViaLink = "Feature.Friends.Button.AddViaLink", 
        gotIt = "Feature.SettingsHub.Prompt.GotIt", 
        remove = "Feature.Chat.Action.Remove", 
        notTrustedFriendsHeader = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Upsell.Modal.Header" or "Feature.Friends.TrustedConnection.Upsell.Modal.Header", 
        notTrustedFriendsDescription = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Upsell.Modal.Description" or "Feature.Friends.TrustedConnection.Upsell.Modal.Description", 
        incomingRequestHeader = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddBack.Header" or "Feature.Friends.TrustedConnection.AddBack.Header", 
        incomingRequestDescription = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddBack.Description" or "Feature.Friends.TrustedConnection.AddBack.Description", 
        trustedFriendsHeader = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Info.Modal.Header" or "Feature.Friends.TrustedConnection.Info.Modal.Header", 
        trustedFriendsDescription = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Info.Modal.Description" or "Feature.Friends.TrustedConnection.Info.Modal.Description", 
        addViaLinkDescription = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddViaLink.Description" or "Feature.Friends.TrustedConnection.AddViaLink.Description"; 
            userName = v17
        }, 
        genericDescription = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.GenericModal.Description" or "Feature.Friends.TrustedConnection.GenericModal.Description", 
        addTrustedConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Label.AddTrustedFriend" or "Feature.Friends.TrustedConnection.Label.AddTrustedConnection", 
        acceptViaLinkDescription = if l_FFlagTCShareLinkReceiverUI_0 then l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddReceivedLink.Description" or "Feature.Friends.TrustedConnection.AddReceivedLink.Description" else nil
    });
    local v20 = v2.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v12 (copy), v19 (copy), l_FFlagTCParentChildAutoUpgrade_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                header = if v12 then v19.addTrustedConnection else v19.notTrustedFriendsHeader, 
                description = if v12 then v19.genericDescription else v19.notTrustedFriendsDescription, 
                primaryButton = v19.add, 
                secondaryButton = v19.cancel
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                header = v19.incomingRequestHeader, 
                description = if v12 then v19.genericDescription else v19.incomingRequestDescription, 
                primaryButton = v19.add, 
                secondaryButton = v19.cancel
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                header = v19.trustedFriendsHeader, 
                description = if l_FFlagTCParentChildAutoUpgrade_0 and v12 then v19.genericDescription else v19.trustedFriendsDescription, 
                primaryButton = v19.gotIt, 
                secondaryButton = v19.remove
            }, 
            [l_Sources_0.ShareLinkSender] = {
                header = v19.addTrustedConnection, 
                description = v19.addViaLinkDescription, 
                primaryButton = v19.addViaLink, 
                secondaryButton = nil
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                header = v19.incomingRequestHeader, 
                description = v19.acceptViaLinkDescription, 
                primaryButton = v19.add, 
                secondaryButton = v19.cancel
            } else nil
        };
    end, {
        v10, 
        v17, 
        v12
    });
    if v20[v11] then
        v13 = v20[v11].header;
        v14 = v20[v11].description;
        v15 = v20[v11].primaryButton;
        v16 = v20[v11].secondaryButton;
    end;
    return {
        header = v13, 
        description = v14, 
        primaryButton = v15, 
        secondaryButton = v16
    };
end;