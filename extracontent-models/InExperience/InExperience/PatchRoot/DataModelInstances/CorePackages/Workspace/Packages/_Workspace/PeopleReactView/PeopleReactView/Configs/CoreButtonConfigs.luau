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
local v10 = require(l_script_FirstAncestor_0.Constants);
local l_useSignalBinding_0 = v6.useSignalBinding;
local l_useSignalState_0 = v6.useSignalState;
return function(v13) --[[ Line: 40 ]] --[[ Name: useCoreButtonConfigs ]]
    -- upvalues: l_useLocalization_0 (copy), v10 (copy), v5 (copy), l_useSignalState_0 (copy), l_useSignalBinding_0 (copy), v4 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_RunService_0 (copy), l_Players_0 (copy)
    local v14 = l_useLocalization_0({
        inviteFriends = v10.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.INVITE_CONNECTIONS, 
        muteAll = v10.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_ALL, 
        unmuteAll = v10.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_ALL, 
        muteSelf = v10.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.MUTE_SELF, 
        unmuteSelf = v10.PEOPLEPAGE.CORE_BUTTONS.LOCALIZED_STRINGS.UNMUTE_SELF
    });
    local v15 = v5.getService("PeopleVoiceChatStore");
    local v16 = v5.getService("PeopleAnalyticsManager");
    local v17 = v5.getService("SettingsHubService");
    local l_voiceChatServiceConnected_0 = v15.voiceChatServiceConnected;
    local v19 = l_useSignalState_0(v15.voiceUIVisible);
    local l_allPlayersMuted_0 = v15.allPlayersMuted;
    local v21 = l_useSignalBinding_0(l_allPlayersMuted_0);
    local l_localMuted_0 = v15.localMuted;
    local v23 = l_useSignalBinding_0(l_localMuted_0);
    local v25 = v21:map(function(v24) --[[ Line: 60 ]]
        -- upvalues: v14 (copy)
        return v24 and v14.unmuteAll or v14.muteAll;
    end);
    local v29 = v23:map(function(v26) --[[ Line: 64 ]]
        -- upvalues: v14 (copy)
        local v27 = false;
        local v28;
        if v26 ~= nil then
            if v26 then
                v28 = v14.unmuteSelf;
                v27 = v28;
            end;
            if not v27 then
                return v14.muteSelf;
            end;
        else
            v28 = v14.muteSelf;
        end;
        v27 = false;
        return v28;
    end);
    return (v4.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v14 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v10 (ref), l_RunService_0 (ref), l_Players_0 (ref), v17 (copy), v16 (copy), v25 (copy), l_allPlayersMuted_0 (copy), v19 (copy), v21 (copy), v15 (copy), v29 (copy), l_localMuted_0 (copy), v13 (copy), v23 (copy)
        local v30 = {};
        table.insert(v30, {
            id = "inviteFriends", 
            text = v14.inviteFriends, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v10.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_NEW else v10.PEOPLEPAGE.CORE_BUTTONS.ICON.INVITE_FRIENDS_LEGACY, 
            isNewIcon = l_GetFFlagNewPeoplePageIcons_0(), 
            shouldShow = function() --[[ Line: 82 ]] --[[ Name: shouldShow ]]
                -- upvalues: l_RunService_0 (ref), l_Players_0 (ref)
                return not l_RunService_0:IsStudio() and l_Players_0.LocalPlayer ~= nil and l_Players_0.LocalPlayer.UserId > 0;
            end, 
            onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                -- upvalues: v17 (ref), v16 (ref)
                local v31 = v17.hubRef();
                if v31 then
                    v16:trackGameInviteEntryPoint();
                    v31:InviteToGame();
                end;
            end, 
            layoutOrder = 1
        });
        table.insert(v30, {
            id = "muteAll", 
            text = v25, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v10.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_NEW else v10.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_LEGACY, 
            offIcon = if l_GetFFlagNewPeoplePageIcons_0() then v10.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_NEW else v10.PEOPLEPAGE.CORE_BUTTONS.ICON.HEADPHONE_MUTED_LEGACY, 
            buttonState = l_allPlayersMuted_0, 
            isNewIcon = l_GetFFlagNewPeoplePageIcons_0(), 
            shouldShow = function() --[[ Line: 109 ]] --[[ Name: shouldShow ]]
                -- upvalues: v19 (ref)
                return v19;
            end, 
            onActivated = function() --[[ Line: 112 ]] --[[ Name: onActivated ]]
                -- upvalues: v21 (ref), v16 (ref), v15 (ref)
                local v32 = v21:getValue();
                v16:trackToggleMuteAll(v32);
                v15.toggleMuteAll();
            end, 
            layoutOrder = 2
        });
        table.insert(v30, {
            id = "muteSelf", 
            text = v29, 
            onIcon = v10.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE, 
            offIcon = v10.PEOPLEPAGE.CORE_BUTTONS.ICON.MICROPHONE_MUTED, 
            animatedIcon = v15.getMuteSelfIcon(), 
            buttonState = l_localMuted_0, 
            isNewIcon = false, 
            shouldShow = function() --[[ Line: 131 ]] --[[ Name: shouldShow ]]
                -- upvalues: v19 (ref), v13 (ref)
                return v19 and not v13;
            end, 
            onActivated = function() --[[ Line: 134 ]] --[[ Name: onActivated ]]
                -- upvalues: v23 (ref), v16 (ref), v15 (ref)
                local v33 = v23:getValue() or false;
                v16:trackToggleMuteSelf(v33);
                v15.toggleMuteSelf();
            end, 
            layoutOrder = 3
        });
        return v30;
    end, {
        v19, 
        l_voiceChatServiceConnected_0
    }));
end;