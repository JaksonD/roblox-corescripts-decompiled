local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local l_VOICE_STATE_0 = require(l_Parent_0.VoiceChat).Constants.VOICE_STATE;
return function() --[[ Line: 26 ]] --[[ Name: createVoiceStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), l_VOICE_STATE_0 (copy)
    local v5, v6 = l_createSignal_0({});
    local v7 = {};
    local function _(v8) --[[ Line: 32 ]] --[[ Name: getKey ]]
        return (tostring(v8));
    end;
    local function v13(v10) --[[ Line: 36 ]] --[[ Name: getOrCreateVoiceState ]]
        -- upvalues: v7 (copy), l_createComputed_0 (ref), v5 (copy)
        local v11 = tostring(v10);
        if not v7[v11] then
            v7[v11] = l_createComputed_0(function(v12) --[[ Line: 39 ]]
                -- upvalues: v5 (ref), v11 (copy)
                return v5(v12)[v11];
            end);
        end;
        return v7[v11];
    end;
    local function v18(v14) --[[ Line: 48 ]] --[[ Name: handleVoiceParticipantAdded ]]
        -- upvalues: v6 (copy), l_VOICE_STATE_0 (ref)
        local v15 = tostring(v14);
        v6(function(v16) --[[ Line: 51 ]]
            -- upvalues: v15 (copy), l_VOICE_STATE_0 (ref)
            local v17 = table.clone(v16);
            v17[v15] = v17[v15] or l_VOICE_STATE_0.HIDDEN;
            return v17;
        end);
    end;
    local function v23(v19) --[[ Line: 61 ]] --[[ Name: handleVoiceParticipantRemoved ]]
        -- upvalues: v6 (copy), v7 (copy)
        local v20 = tostring(v19);
        v6(function(v21) --[[ Line: 64 ]]
            -- upvalues: v7 (ref), v20 (copy)
            if v7[v20] then
                v7[v20] = nil;
            end;
            local v22 = table.clone(v21);
            v22[v20] = nil;
            return v22;
        end);
    end;
    local function v30(v24) --[[ Line: 75 ]] --[[ Name: handleVoiceParticipantsChanged ]]
        -- upvalues: v6 (copy), l_VOICE_STATE_0 (ref)
        v6(function(v25) --[[ Line: 76 ]]
            -- upvalues: v24 (copy), l_VOICE_STATE_0 (ref)
            local v26 = table.clone(v25);
            for v27, v28 in v24 do
                local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
                if not v28.subscriptionCompleted then
                    l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
                elseif v28.isMutedLocally then
                    l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
                elseif v28.isMuted then
                    l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
                elseif v28.isSignalActive then
                    l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
                end;
                v26[tostring(v27)] = l_INACTIVE_0;
            end;
            return v26;
        end);
    end;
    return {
        getOrCreateVoiceState = v13, 
        getVoiceParticipants = v5, 
        handleVoiceParticipantAdded = v18, 
        handleVoiceParticipantRemoved = v23, 
        handleVoiceParticipantsChanged = v30, 
        handleVoiceStateChanged = function(v31, v32) --[[ Line: 96 ]] --[[ Name: handleVoiceStateChanged ]]
            -- upvalues: v6 (copy)
            local v33 = tostring(v31);
            v6(function(v34) --[[ Line: 99 ]]
                -- upvalues: v33 (copy), v32 (copy)
                if v34[v33] then
                    local v35 = table.clone(v34);
                    v35[v33] = v32;
                    return v35;
                else
                    return v34;
                end;
            end);
        end
    };
end;