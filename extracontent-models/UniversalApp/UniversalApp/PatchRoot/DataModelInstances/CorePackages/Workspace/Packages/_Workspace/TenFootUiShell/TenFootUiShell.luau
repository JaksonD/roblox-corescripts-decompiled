local v0 = require(script.Components.TenFootUiContainer);
local v1 = require(script.Components.TenFootUiGlobalEffects);
local v2 = require(script.Components.TenFootUiOverflowScreen);
local v3 = require(script.getOrCreateSurfaceGuiContainer);
local v4 = require(script.getOrCreateWorkSpaceContainer);
local v5 = require(script.Constants);
return {
    ["jest.config"] = script["jest.config"], 
    TenFootUiContainer = v0, 
    TenFootUiOverflowScreen = v2, 
    TenFootUiGlobalEffects = v1, 
    Constants = v5, 
    getOrCreateSurfaceGuiContainer = v3, 
    getOrCreateWorkSpaceContainer = v4, 
    Views = require(script.ReactNavigationExtend.Views)
};