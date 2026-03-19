local l_TeleportService_0 = game:GetService("TeleportService");
local l_game_EngineFeature_0 = game:GetEngineFeature("UseTeleportedPlacesBackHistory2");
local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local l_isRunningInStudio_0 = require(l_Parent_0.AppCommonLib).isRunningInStudio;
local l_FFlagUseLocalTraversalHistory_0 = require(script.Parent.Flags).FFlagUseLocalTraversalHistory;
local v5 = game:DefineFastInt("TeleportBackAttemptLimit", 5);
local v6 = game:DefineFastInt("TeleportBackRetryDelay", 1);
return function(v7) --[[ Line: 17 ]] --[[ Name: TeleportBack ]]
    -- upvalues: l_isRunningInStudio_0 (copy), l_FFlagUseLocalTraversalHistory_0 (copy), l_game_EngineFeature_0 (copy), l_TeleportService_0 (copy), v6 (copy), v5 (copy)
    if l_isRunningInStudio_0() then
        warn("Teleporting is not supported in Studio");
        return;
    else
        local v8 = 0;
        local v9 = nil;
        local v10 = nil;
        repeat
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
                -- upvalues: l_FFlagUseLocalTraversalHistory_0 (ref), l_game_EngineFeature_0 (ref), v7 (copy), l_TeleportService_0 (ref)
                if (l_FFlagUseLocalTraversalHistory_0 or l_game_EngineFeature_0) and v7 then
                    return l_TeleportService_0:TeleportTrustedBackHistory(v7);
                else
                    return l_TeleportService_0:TeleportTrustedBackForth(false);
                end;
            end);
            v9 = l_status_0;
            v10 = l_result_0;
            v8 = v8 + 1;
            if not v9 then
                task.wait(v6);
            end;
        until v9 or v8 == v5;
        if not v9 then
            warn(v10);
        end;
        return v9, v10;
    end;
end;