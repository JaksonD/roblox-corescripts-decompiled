local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local v1 = require(script.useIsStickyShortcutBarEnabled);
local v2 = require(script.useAppShortcutBarHeight);
local v3 = require(l_script_FirstAncestor_0.Stores.GetShortcutBarStatusStore)(false);
return {
    useIsStickyShortcutBarEnabled = v1, 
    useAppShortcutBarHeight = v2, 
    useShortcutBarVisible = v3.useShortcutBarVisible
};