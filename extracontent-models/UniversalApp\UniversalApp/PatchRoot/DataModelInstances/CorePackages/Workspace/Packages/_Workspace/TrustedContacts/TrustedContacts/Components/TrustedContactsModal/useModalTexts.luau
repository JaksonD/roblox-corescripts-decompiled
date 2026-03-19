local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UserProfiles);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_FFlagTCParentChildAutoUpgrade_0 = require(l_Parent_0.SharedFlags).FFlagTCParentChildAutoUpgrade;
return function(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: useModalTexts ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v2 (copy), l_TrustedConnectionStatus_0 (copy), l_FFlagTCParentChildAutoUpgrade_0 (copy), l_Sources_0 (copy)
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v9
        }, 
        query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v17 and v17.data then
        v16 = v4.Selectors.getUsernameFromId(v17.data, v9) or "";
    end;
    local v18 = l_useLocalization_0({
        cancel = "CommonUI.Controls.Action.Cancel", 
        add = "Feature.Friends.Action.Add", 
        addViaLink = "Feature.Friends.Button.AddViaLink", 
        gotIt = "Feature.SettingsHub.Prompt.GotIt", 
        remove = "Feature.Chat.Action.Remove", 
        notTrustedFriendsHeader = "Feature.Friends.TrustedConnection.Upsell.Modal.Header", 
        notTrustedFriendsDescription = "Feature.Friends.TrustedConnection.Upsell.Modal.Description", 
        incomingRequestHeader = "Feature.Friends.TrustedConnection.AddBack.Header", 
        incomingRequestDescription = "Feature.Friends.TrustedConnection.AddBack.Description", 
        trustedFriendsHeader = "Feature.Friends.TrustedConnection.Info.Modal.Header", 
        trustedFriendsDescription = "Feature.Friends.TrustedConnection.Info.Modal.Description", 
        addViaLinkDescription = {
            "Feature.Friends.TrustedConnection.AddViaLink.Description"; 
            userName = v16
        }, 
        genericDescription = "Feature.Friends.TrustedConnection.GenericModal.Description", 
        addTrustedConnection = "Feature.Friends.TrustedConnection.Label.AddTrustedConnection", 
        acceptViaLinkDescription = l_FFlagTCShareLinkReceiverUI_0 and "Feature.Friends.TrustedConnection.AddReceivedLink.Description" or nil
    });
    local v19 = v2.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v11 (copy), v18 (copy), l_FFlagTCParentChildAutoUpgrade_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                header = if v11 then v18.addTrustedConnection else v18.notTrustedFriendsHeader, 
                description = if v11 then v18.genericDescription else v18.notTrustedFriendsDescription, 
                primaryButton = v18.add, 
                secondaryButton = v18.cancel
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                header = v18.incomingRequestHeader, 
                description = if v11 then v18.genericDescription else v18.incomingRequestDescription, 
                primaryButton = v18.add, 
                secondaryButton = v18.cancel
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                header = v18.trustedFriendsHeader, 
                description = if l_FFlagTCParentChildAutoUpgrade_0 and v11 then v18.genericDescription else v18.trustedFriendsDescription, 
                primaryButton = v18.gotIt, 
                secondaryButton = v18.remove
            }, 
            [l_Sources_0.ShareLinkSender] = {
                header = v18.addTrustedConnection, 
                description = v18.addViaLinkDescription, 
                primaryButton = v18.addViaLink, 
                secondaryButton = nil
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                header = v18.incomingRequestHeader, 
                description = v18.acceptViaLinkDescription, 
                primaryButton = v18.add, 
                secondaryButton = v18.cancel
            } else nil
        };
    end, {
        v9, 
        v16, 
        v11
    });
    if v19[v10] then
        v12 = v19[v10].header;
        v13 = v19[v10].description;
        v14 = v19[v10].primaryButton;
        v15 = v19[v10].secondaryButton;
    end;
    return {
        header = v12, 
        description = v13, 
        primaryButton = v14, 
        secondaryButton = v15
    };
end;