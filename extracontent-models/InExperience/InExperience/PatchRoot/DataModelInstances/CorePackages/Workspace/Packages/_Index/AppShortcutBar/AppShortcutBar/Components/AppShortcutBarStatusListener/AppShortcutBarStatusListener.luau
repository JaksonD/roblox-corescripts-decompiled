local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagGuacStickyShortcutBarEnabled_0 = require(l_Parent_0.SharedFlags).FFlagGuacStickyShortcutBarEnabled;
return function(v6) --[[ Line: 14 ]] --[[ Name: AppShortcutBarStatusListener ]]
    -- upvalues: v3 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_useAppPolicy_0 (copy), v2 (copy)
    local v7 = v3.useAppShortcutBarHeight();
    local v8 = nil;
    v8 = if l_FFlagGuacStickyShortcutBarEnabled_0 then l_useAppPolicy_0(function(v9) --[[ Line: 19 ]]
        return v9.getStickyShortcutBarEnabled();
    end) else v3.useIsStickyShortcutBarEnabled();
    local v10 = v3.useShortcutBarVisible();
    local v11 = v8 and v10;
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v6 (copy), v11 (copy), v7 (copy)
        if v6.onHeightChanged then
            local v12 = if v11 then v7 else 0;
            v6.onHeightChanged(v12);
        end;
    end, {
        v11, 
        v7, 
        v6.onHeightChanged
    });
    return nil;
end;