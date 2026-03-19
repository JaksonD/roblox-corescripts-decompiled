local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UserProfiles);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
return function(v8, v9, v10) --[[ Line: 20 ]] --[[ Name: useModalTexts ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v2 (copy), l_TrustedConnectionStatus_0 (copy), l_Sources_0 (copy)
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v8
        }, 
        query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v16 and v16.data then
        v15 = v4.Selectors.getUsernameFromId(v16.data, v8) or "";
    end;
    local v17 = l_useLocalization_0({
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
            userName = v15
        }, 
        genericDescription = "Feature.Friends.TrustedConnection.GenericModal.Description", 
        addTrustedConnection = "Feature.Friends.TrustedConnection.Label.AddTrustedConnection", 
        acceptViaLinkDescription = l_FFlagTCShareLinkReceiverUI_0 and "Feature.Friends.TrustedConnection.AddReceivedLink.Description" or nil
    });
    local v18 = v2.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v10 (copy), v17 (copy), l_Sources_0 (ref), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                header = if v10 then v17.addTrustedConnection else v17.notTrustedFriendsHeader, 
                description = if v10 then v17.genericDescription else v17.notTrustedFriendsDescription, 
                primaryButton = v17.add, 
                secondaryButton = v17.cancel
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                header = v17.incomingRequestHeader, 
                description = if v10 then v17.genericDescription else v17.incomingRequestDescription, 
                primaryButton = v17.add, 
                secondaryButton = v17.cancel
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                header = v17.trustedFriendsHeader, 
                description = v17.trustedFriendsDescription, 
                primaryButton = v17.gotIt, 
                secondaryButton = v17.remove
            }, 
            [l_Sources_0.ShareLinkSender] = {
                header = v17.addTrustedConnection, 
                description = v17.addViaLinkDescription, 
                primaryButton = v17.addViaLink, 
                secondaryButton = nil
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                header = v17.incomingRequestHeader, 
                description = v17.acceptViaLinkDescription, 
                primaryButton = v17.add, 
                secondaryButton = v17.cancel
            } else nil
        };
    end, {
        v8, 
        v15, 
        v10
    });
    if v18[v9] then
        v11 = v18[v9].header;
        v12 = v18[v9].description;
        v13 = v18[v9].primaryButton;
        v14 = v18[v9].secondaryButton;
    end;
    return {
        header = v11, 
        description = v12, 
        primaryButton = v13, 
        secondaryButton = v14
    };
end;