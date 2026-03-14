local v0 = require(script.Components.AppShortcutBarContainer);
local v1 = require(script.Components.AppShortcutBarStatusListener);
local v2 = require(script.Components.AppShortcut);
local v3 = require(script.Hooks.AppShortcutBarContext);
local v4 = require(script.Hooks);
return {
    AppShortcutBarContainer = v0, 
    AppShortcutBarStatusListener = v1, 
    IconWithHoldAnimation = v2.IconWithHoldAnimation, 
    AppShortcutBarContext = v3, 
    Hooks = v4, 
    ["jest.config"] = script["jest.config"]
};