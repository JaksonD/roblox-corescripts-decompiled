local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.AppShortcutBar);
local v4 = require(l_script_FirstAncestor_0.Components.AppStickyShortcutBar);
local v5 = require(script.Parent.useAppShortcutBarProps);
local l_useIsStickyShortcutBarEnabled_0 = require(l_script_FirstAncestor_0.Hooks).useIsStickyShortcutBarEnabled;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v8 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v8.FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagGuacStickyShortcutBarEnabled_0 = v8.FFlagGuacStickyShortcutBarEnabled;
AppShortcutBarContainer = function() --[[ Line: 15 ]] --[[ Name: AppShortcutBarContainer ]]
    -- upvalues: v5 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_useAppPolicy_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v11 = v5();
    local v12 = nil;
    v12 = if l_FFlagGuacStickyShortcutBarEnabled_0 then l_useAppPolicy_0(function(v13) --[[ Line: 20 ]]
        return v13.getStickyShortcutBarEnabled();
    end) else if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    if (l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0) and v12 then
        return v2.createElement(v4, v11);
    else
        return v2.createElement(v3, v11);
    end;
end;
return AppShortcutBarContainer;