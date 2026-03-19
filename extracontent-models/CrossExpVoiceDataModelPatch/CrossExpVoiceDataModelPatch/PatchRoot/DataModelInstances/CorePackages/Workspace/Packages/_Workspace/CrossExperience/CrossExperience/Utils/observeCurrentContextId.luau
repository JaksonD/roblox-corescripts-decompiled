local v0 = nil;
local v1 = false;
local function _() --[[ Line: 3 ]]
    -- upvalues: v1 (ref), v0 (ref)
    if not v1 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            v0 = l_result_0;
        end;
        v1 = true;
    end;
    return v0;
end;
return function(v5) --[[ Line: 16 ]]
    -- upvalues: v1 (ref), v0 (ref)
    if not v1 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 5 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_1 and l_result_1 then
            v0 = l_result_1;
        end;
        v1 = true;
    end;
    local l_v0_0 = v0;
    if l_v0_0 then
        local l_l_v0_0_FocusedContextId_0 = l_v0_0:GetFocusedContextId();
        v5(l_l_v0_0_FocusedContextId_0);
        do
            local l_l_l_v0_0_FocusedContextId_0_0 = l_l_v0_0_FocusedContextId_0;
            local function v12() --[[ Line: 21 ]]
                -- upvalues: l_v0_0 (copy), l_l_l_v0_0_FocusedContextId_0_0 (ref), v5 (copy)
                local l_l_v0_0_FocusedContextId_1 = l_v0_0:GetFocusedContextId();
                if l_l_l_v0_0_FocusedContextId_0_0 ~= l_l_v0_0_FocusedContextId_1 then
                    l_l_l_v0_0_FocusedContextId_0_0 = l_l_v0_0_FocusedContextId_1;
                    v5(l_l_l_v0_0_FocusedContextId_0_0);
                end;
            end;
            l_v0_0.OnContextRegistered:Connect(v12);
            l_v0_0.OnContextUnregistered:Connect(v12);
            l_v0_0.OnDeafenVoiceAudio:Connect(v12);
            l_v0_0.OnUndeafenVoiceAudio:Connect(v12);
        end;
    end;
end;