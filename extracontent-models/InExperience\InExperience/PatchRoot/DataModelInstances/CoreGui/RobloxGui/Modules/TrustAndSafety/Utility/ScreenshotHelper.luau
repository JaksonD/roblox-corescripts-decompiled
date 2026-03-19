local v0 = nil;
if game:GetEngineFeature("ReportAnythingScreenshot") then
    game:GetService("SafetyService").ScreenshotContentReady:Connect(function(_, v2) --[[ Line: 7 ]]
        -- upvalues: v0 (ref)
        v0 = v2;
    end);
end;
local v3 = {};
v3.__index = v3;
v3.GetScreenshotContentId = function(_) --[[ Line: 17 ]] --[[ Name: GetScreenshotContentId ]]
    -- upvalues: v0 (ref)
    return v0;
end;
v3.SetScreenshotContentId = function(_, v6) --[[ Line: 22 ]] --[[ Name: SetScreenshotContentId ]]
    -- upvalues: v0 (ref)
    v0 = v6;
end;
return v3;