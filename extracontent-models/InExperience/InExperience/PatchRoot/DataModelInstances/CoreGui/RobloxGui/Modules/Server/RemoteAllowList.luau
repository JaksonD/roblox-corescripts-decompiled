local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableModerateChatRemoteEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent;
return function() --[[ Line: 4 ]]
    -- upvalues: l_FFlagEnableModerateChatRemoteEvent_0 (copy)
    assert(game:FindService("NetworkServer") ~= nil);
    local l_NetworkServer_0 = game:GetService("NetworkServer");
    local v3 = {};
    table.insert(v3, "GetServerVersion");
    table.insert(v3, "GetServerChannel");
    table.insert(v3, "WhisperChat");
    table.insert(v3, "GetServerType");
    table.insert(v3, "ServerSideBulkPurchaseEvent");
    table.insert(v3, "CanChatWith");
    table.insert(v3, "SetPlayerBlockList");
    table.insert(v3, "UpdatePlayerBlockList");
    table.insert(v3, "NewPlayerGroupDetails");
    table.insert(v3, "NewPlayerCanManageDetails");
    table.insert(v3, "SendPlayerBlockList");
    table.insert(v3, "UpdateLocalPlayerBlockList");
    table.insert(v3, "SendPlayerProfileSettings");
    table.insert(v3, "UpdatePlayerProfileSettings");
    table.insert(v3, "ShowPlayerJoinedFriendsToast");
    table.insert(v3, "ShowFriendJoinedPlayerToast");
    table.insert(v3, "CreateOrJoinParty");
    if game:DefineFastFlag("RemoteAllowListAddSocial", false) then
        table.insert(v3, "RequestPlayerProfileSettings");
    end;
    if l_FFlagEnableModerateChatRemoteEvent_0 then
        table.insert(v3, "ModerateChatSettingUpdated");
    end;
    table.insert(v3, "SetDialogInUse");
    table.insert(v3, "ContactListInvokeIrisInvite");
    table.insert(v3, "ContactListIrisInviteTeleport");
    table.insert(v3, "UpdateCurrentCall");
    table.insert(v3, "RequestDeviceCameraOrientationCapability");
    table.insert(v3, "RequestDeviceCameraCFrame");
    table.insert(v3, "ReplicateDeviceCameraCFrame");
    table.insert(v3, "ReferredPlayerJoin");
    table.insert(v3, "SetUserActive");
    table.insert(v3, "SendLikelySpeakingUsers");
    table.insert(v3, "ReceiveLikelySpeakingUsers");
    if game:DefineFastFlag("RemoteAllowListAddVR", false) then
        table.insert(v3, "AvatarGesturesVRPlayer");
    end;
    l_NetworkServer_0:InitializeRemoteAllowList(v3);
end;