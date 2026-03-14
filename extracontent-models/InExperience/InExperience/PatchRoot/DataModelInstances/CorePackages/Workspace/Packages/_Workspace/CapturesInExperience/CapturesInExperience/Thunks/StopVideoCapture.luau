local l_CaptureService_0 = game:GetService("CaptureService");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVideoCaptureApiLua");
return function() --[[ Line: 5 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_CaptureService_0 (copy)
    return function(_) --[[ Line: 6 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_CaptureService_0 (ref)
        if l_game_EngineFeature_0 then
            l_CaptureService_0:StopVideoCaptureInternal();
        end;
    end;
end;