local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Services.CaptureService);
local v2 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local l_game_EngineFeature_0 = game:GetEngineFeature("CaptureServiceGetScreenshotCaptureObject");
return function(v5) --[[ Line: 9 ]] --[[ Name: getCaptureObject ]]
    -- upvalues: v2 (copy), l_game_EngineFeature_0 (copy), v1 (copy)
    if v5.CaptureType ~= nil then
        return v5;
    elseif v5.type == v2.Video then
        return v5.videoCapture;
    elseif v5.capture ~= nil then
        return v5.capture;
    elseif l_game_EngineFeature_0 then
        return (v1:GetScreenshotCaptureObject(v5.filePath));
    else
        return nil;
    end;
end;