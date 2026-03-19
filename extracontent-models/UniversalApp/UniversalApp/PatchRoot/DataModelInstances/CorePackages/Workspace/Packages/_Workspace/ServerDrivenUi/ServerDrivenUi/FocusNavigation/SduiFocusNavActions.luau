local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_Parent_0.SduiCoreSystem);
return v2.memo(function(v5) --[[ Line: 21 ]] --[[ Name: SduiFocusNavActions ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy), v3 (copy)
    local l_keys_0 = v5.focusNavActions.keys;
    local l_events_0 = v5.focusNavActions.events;
    local v8 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v5 (copy), l_GuiService_0 (ref)
        if v5.guiObject then
            return v5.guiObject;
        else
            return l_GuiService_0.SelectedCoreObject;
        end;
    end, {
        v5.guiObject
    });
    local v9 = v3.useEventMap(l_keys_0);
    local v10 = v3.useEventHandlerMap(l_events_0, v9);
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v10 (copy), v8 (copy)
        if v10 then
            v10(v8);
        end;
        return function() --[[ Line: 39 ]]
            -- upvalues: v10 (ref)
            v10(nil);
        end;
    end, {
        v10, 
        v8
    });
    return nil;
end);