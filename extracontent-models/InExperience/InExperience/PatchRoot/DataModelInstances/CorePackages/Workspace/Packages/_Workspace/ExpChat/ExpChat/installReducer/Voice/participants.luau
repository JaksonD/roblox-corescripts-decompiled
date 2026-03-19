local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v4 = require(l_Parent_0.Rodux);
local l_VOICE_STATE_0 = require(l_Parent_0.VoiceChat).Constants.VOICE_STATE;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.VoiceParticipantAdded);
local v8 = require(l_Actions_0.VoiceParticipantRemoved);
local v9 = require(l_Actions_0.VoiceStateChanged);
local v10 = require(l_Actions_0.VoiceParticipantsChanged);
return v4.createReducer({}, {
    [v7.name] = function(v11, v12) --[[ Line: 22 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local l_userId_0 = v12.userId;
        local v14 = v11[l_userId_0] or "Hidden";
        return l_Dictionary_0.join(v11, {
            [l_userId_0] = v14
        });
    end, 
    [v8.name] = function(v15, v16) --[[ Line: 32 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.join(v15, {
            [v16.userId] = l_None_0
        });
    end, 
    [v10.name] = function(v17, v18) --[[ Line: 39 ]]
        -- upvalues: l_VOICE_STATE_0 (copy)
        local l_newParticipants_0 = v18.newParticipants;
        local v20 = table.clone(v17);
        for v21, v22 in l_newParticipants_0 do
            local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
            if not v22.subscriptionCompleted then
                l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
            elseif v22.isMutedLocally then
                l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
            elseif v22.isMuted then
                l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
            elseif v22.isSignalActive then
                l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
            end;
            v20[tostring(v21)] = l_INACTIVE_0;
        end;
        return v20;
    end, 
    [v9.name] = function(v24, v25) --[[ Line: 59 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v24[v25.userId] then
            return l_Dictionary_0.join(v24, {
                [v25.userId] = v25.newState
            });
        else
            return v24;
        end;
    end
});