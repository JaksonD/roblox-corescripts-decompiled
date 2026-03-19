local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = nil;
v5 = if v2() then require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants.VOICE_STATE else require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE;
local v6 = require(script.Parent.Parent.Actions.ParticipantAdded);
local v7 = require(script.Parent.Parent.Actions.ParticipantRemoved);
local v8 = require(script.Parent.Parent.Actions.VoiceStateChanged);
local v9 = require(script.Parent.Parent.Actions.VoiceEnabledChanged);
local v10 = require(script.Parent.Parent.Actions.ParticipantsChanged);
return (v4.createReducer({}, {
    [v9.name] = function(v11, v12) --[[ Line: 26 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v11, {
            voiceEnabled = v12.enabled
        });
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 32 ]]
        -- upvalues: v5 (ref), v3 (copy)
        local l_userId_0 = v14.userId;
        local v16 = v13[l_userId_0] or v5.HIDDEN;
        return v3.Dictionary.join(v13, {
            [l_userId_0] = v16
        });
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 42 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v17, {
            [v18.userId] = v3.None
        });
    end, 
    [v10.name] = function(v19, v20) --[[ Line: 49 ]]
        -- upvalues: v5 (ref)
        local l_newParticipants_0 = v20.newParticipants;
        local v22 = table.clone(v19);
        for v23, v24 in l_newParticipants_0 do
            local l_INACTIVE_0 = v5.INACTIVE;
            if not v24.subscriptionCompleted then
                l_INACTIVE_0 = v5.CONNECTING;
            elseif v24.isMutedLocally then
                l_INACTIVE_0 = v5.LOCAL_MUTED;
            elseif v24.isMuted then
                l_INACTIVE_0 = v5.MUTED;
            elseif v24.isSignalActive then
                l_INACTIVE_0 = v5.TALKING;
            end;
            v22[tostring(v23)] = l_INACTIVE_0;
        end;
        return v22;
    end, 
    [v8.name] = function(v26, v27) --[[ Line: 69 ]]
        -- upvalues: v3 (copy)
        if v26[v27.userId] then
            return v3.Dictionary.join(v26, {
                [v27.userId] = v27.newState
            });
        else
            return v26;
        end;
    end
}));