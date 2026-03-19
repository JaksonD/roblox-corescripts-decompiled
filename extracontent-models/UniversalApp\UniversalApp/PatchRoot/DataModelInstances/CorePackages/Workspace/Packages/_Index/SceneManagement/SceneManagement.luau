local v0 = require(script.Lighting);
local v1 = require(script.BackgroundScene);
local v2 = require(script.hooks.useCameraFacingGeometry);
return {
    ["jest.config"] = script["jest.config"], 
    SurfaceGuiWithAdornee = require(script.SurfaceGuiWithAdornee), 
    Lighting = v0, 
    BackgroundScene = v1, 
    useCameraFacingGeometry = v2
};