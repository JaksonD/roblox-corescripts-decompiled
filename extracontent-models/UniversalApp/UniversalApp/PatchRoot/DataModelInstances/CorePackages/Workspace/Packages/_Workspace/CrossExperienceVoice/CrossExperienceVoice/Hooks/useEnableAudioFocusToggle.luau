local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SharedFlags_0 = v2.SharedFlags;
local v4 = l_SharedFlags_0.GetFFlagEnableCrossExperienceVoiceCaptureMute();
local v5 = l_SharedFlags_0.GetFFlagEnableVoiceChatMuteForVideoCaptures();
local v6 = if v5 then game:GetService("CaptureService") else nil;
local l_React_0 = v2.React;
local l_Cryo_0 = v2.Cryo;
local function v13() --[[ Line: 18 ]] --[[ Name: useIsCapturingVideo ]]
    -- upvalues: l_React_0 (copy), v6 (copy)
    local v9, v10 = l_React_0.useState(v6 and v6:IsCapturingVideo());
    l_React_0.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v6 (ref), v10 (copy)
        if not v6 then
            return;
        else
            local v12 = v6.VideoCaptureInProgress:Connect(function(v11) --[[ Line: 26 ]]
                -- upvalues: v10 (ref)
                v10(v11);
            end);
            return function() --[[ Line: 30 ]]
                -- upvalues: v6 (ref), v12 (copy)
                if v6 then
                    v12:Disconnect();
                end;
            end;
        end;
    end, {});
    return v9;
end;
return function() --[[ Line: 40 ]] --[[ Name: useEnableAudioFocusToggle ]]
    -- upvalues: l_React_0 (copy), v4 (copy), v5 (copy), v13 (copy), l_Cryo_0 (copy), l_game_EngineFeature_0 (copy)
    local v14, v15 = l_React_0.useState({});
    local v16 = false;
    if v4 and v5 then
        v16 = v13();
    end;
    local v19 = l_React_0.useCallback(function(v17) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), l_Cryo_0 (ref), v15 (copy)
        if not v14[v17] then
            local v18 = l_Cryo_0.Dictionary.join(v14, {
                [v17] = true
            });
            v15(v18);
        end;
    end, {
        v14
    });
    local v22 = l_React_0.useCallback(function(v20) --[[ Line: 57 ]]
        -- upvalues: v14 (copy), l_Cryo_0 (ref), v15 (copy)
        if v14[v20] then
            local v21 = l_Cryo_0.Dictionary.join(v14, {
                [v20] = nil
            });
            v15(v21);
        end;
    end, {
        v14
    });
    l_React_0.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v15 (copy), v19 (copy), v22 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 71 ]]
                return game:GetService("AudioFocusService");
            end);
            if not l_status_0 or not l_result_0 then
                return;
            else
                local v25 = {};
                local l_l_result_0_RegisteredContexts_0 = l_result_0:GetRegisteredContexts();
                for v27, _ in pairs(l_l_result_0_RegisteredContexts_0) do
                    v25[v27] = true;
                end;
                v15(v25);
                local v29 = l_result_0.OnContextRegistered:Connect(v19);
                local v30 = l_result_0.OnContextUnregistered:Connect(v22);
                return function() --[[ Line: 88 ]]
                    -- upvalues: v29 (copy), v30 (copy)
                    if v29 then
                        v29:Disconnect();
                    end;
                    if v30 then
                        v30:Disconnect();
                    end;
                end;
            end;
        end;
    end, {});
    return v14[1] and v14[2] and not v16;
end;