local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks);
return function(v4) --[[ Line: 11 ]] --[[ Name: AppShortcutBarStatusListener ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3.useAppShortcutBarHeight();
    local v6 = v3.useIsStickyShortcutBarEnabled();
    local v7 = v3.useShortcutBarVisible();
    local v8 = v6 and v7;
    v2.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v8 (copy), v5 (copy)
        if v4.onHeightChanged then
            local v9 = if v8 then v5 else 0;
            v4.onHeightChanged(v9);
        end;
    end, {
        v8, 
        v5, 
        v4.onHeightChanged
    });
    return nil;
end;