local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.PeopleService);
local v6 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.Signals);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_GetFFlagNewPeoplePageIcons_0 = v5.getService("Flags").GetFFlagNewPeoplePageIcons;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v11 = require(l_script_FirstAncestor_0.Constants);
local l_useSignalBinding_0 = v6.useSignalBinding;
local l_useSignalState_0 = v6.useSignalState;
return function(v14) --[[ Line: 42 ]] --[[ Name: useCoreButtonConfigs ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v11 (copy), v5 (copy), l_useSignalState_0 (copy), l_useSignalBinding_0 (copy), v4 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_RunService_0 (copy), l_Players_0 (copy)
    local v15 = l_useLocalization_0({
        inviteFriends = if l_FFlagConnectionsToFriendsRename_0 then v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_FRIENDS else v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_CONNECTIONS, 
        muteAll = v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_ALL, 
        unmuteAll = v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_ALL, 
        muteSelf = v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_SELF, 
        unmuteSelf = v11.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_SELF
    });
    local v16 = v5.getService("PeopleVoiceChatStore");
    local v17 = v5.getService("PeopleAnalyticsManager");
    local v18 = v5.getService("SettingsHubService");
    local l_voiceChatServiceConnected_0 = v16.voiceChatServiceConnected;
    local v20 = l_useSignalState_0(v16.voiceUIVisible);
    local l_allPlayersMuted_0 = v16.allPlayersMuted;
    local v22 = l_useSignalBinding_0(l_allPlayersMuted_0);
    local l_localMuted_0 = v16.localMuted;
    local v24 = l_useSignalBinding_0(l_localMuted_0);
    local v26 = v22:map(function(v25) --[[ Line: 64 ]]
        -- upvalues: v15 (copy)
        return v25 and v15.unmuteAll or v15.muteAll;
    end);
    local v30 = v24:map(function(v27) --[[ Line: 68 ]]
        -- upvalues: v15 (copy)
        local v28 = false;
        local v29;
        if v27 ~= nil then
            if v27 then
                v29 = v15.unmuteSelf;
                v28 = v29;
            end;
            if not v28 then
                return v15.muteSelf;
            end;
        else
            v29 = v15.muteSelf;
        end;
        v28 = false;
        return v29;
    end);
    return (v4.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v15 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v11 (ref), l_RunService_0 (ref), l_Players_0 (ref), v18 (copy), v17 (copy), v26 (copy), l_allPlayersMuted_0 (copy), v20 (copy), v22 (copy), v16 (copy), v30 (copy), l_localMuted_0 (copy), v14 (copy), v24 (copy)
        local v31 = {};
        table.insert(v31, {
            id = "inviteFriends", 
            text = v15.inviteFriends, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v11.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else v11.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY, 
            isNewIcon = l_GetFFlagNewPeoplePageIcons_0(), 
            shouldShow = function() --[[ Line: 86 ]] --[[ Name: shouldShow ]]
                -- upvalues: l_RunService_0 (ref), l_Players_0 (ref)
                return not l_RunService_0:IsStudio() and l_Players_0.LocalPlayer ~= nil and l_Players_0.LocalPlayer.UserId > 0;
            end, 
            onActivated = function() --[[ Line: 89 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (ref), v17 (ref)
                local v32 = v18.hubRef();
                if v32 then
                    v17:trackGameInviteEntryPoint();
                    v32:InviteToGame();
                end;
            end, 
            layoutOrder = 1
        });
        table.insert(v31, {
            id = "muteAll", 
            text = v26, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v11.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else v11.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY, 
            offIcon = if l_GetFFlagNewPeoplePageIcons_0() then v11.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else v11.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY, 
            buttonState = l_allPlayersMuted_0, 
            isNewIcon = l_GetFFlagNewPeoplePageIcons_0(), 
            shouldShow = function() --[[ Line: 113 ]] --[[ Name: shouldShow ]]
                -- upvalues: v20 (ref)
                return v20;
            end, 
            onActivated = function() --[[ Line: 116 ]] --[[ Name: onActivated ]]
                -- upvalues: v22 (ref), v17 (ref), v16 (ref)
                local v33 = v22:getValue();
                v17:trackToggleMuteAll(v33);
                v16.toggleMuteAll();
            end, 
            layoutOrder = 2
        });
        table.insert(v31, {
            id = "muteSelf", 
            text = v30, 
            onIcon = v11.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE, 
            offIcon = v11.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED, 
            animatedIcon = v16.getMuteSelfIcon(), 
            buttonState = l_localMuted_0, 
            isNewIcon = false, 
            shouldShow = function() --[[ Line: 135 ]] --[[ Name: shouldShow ]]
                -- upvalues: v20 (ref), v14 (ref)
                return v20 and not v14;
            end, 
            onActivated = function() --[[ Line: 138 ]] --[[ Name: onActivated ]]
                -- upvalues: v24 (ref), v17 (ref), v16 (ref)
                local v34 = v24:getValue() or false;
                v17:trackToggleMuteSelf(v34);
                v16.toggleMuteSelf();
            end, 
            layoutOrder = 3
        });
        return v31;
    end, {
        v20, 
        l_voiceChatServiceConnected_0
    }));
end;