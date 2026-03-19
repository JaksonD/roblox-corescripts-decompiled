local v0 = require(script.AppStartupSequence);
local v1 = require(script.Components.PlatformAccountRouter);
local v2 = require(script.Components.StartupMessage.StartupMessageContainer);
local v3 = require(script.navigateWithPlatformAccount);
local v4 = require(script.Reducers);
local v5 = require(script.Actions);
local v6 = require(script.Enums);
local v7 = require(script.Hooks);
return {
    AppStartupSequence = v0, 
    PlatformAccountRouter = v1, 
    StartupMessageContainer = v2, 
    PostAppInteractiveContainer = require(script.Components.PostAppInteractiveContainer), 
    navigateWithPlatformAccount = v3, 
    Reducers = v4, 
    Actions = v5, 
    Hooks = v7, 
    Enums = v6, 
    ["jest.config"] = script["jest.config"]
};