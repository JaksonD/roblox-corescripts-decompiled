local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v2 = require(l_Parent_0.AppBlox);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_Parent_0.Responsive);
local v8 = require(l_Parent_0.SharedFlags);
local l_getOverflowMenuSignalStore_0 = v2.getOverflowMenuSignalStore;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_GetInputModeStore_0 = v7.GetInputModeStore;
local l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 = v8.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry;
local v13 = {
    [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu
};
local v14 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v15, v16, v17, v18) --[[ Line: 31 ]] --[[ Name: useGameTileOverflowMenuFocusNavigation ]]
    -- upvalues: v5 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), l_getOverflowMenuSignalStore_0 (copy), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (copy), v6 (copy), v13 (copy), v14 (copy), l_GetInputModeStore_0 (copy), v7 (copy), l_GuiService_0 (copy)
    local v19, v20 = v5.useState(nil);
    local v21 = v5.useRef(false);
    local v22, v23 = v5.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), l_getOverflowMenuSignalStore_0 (ref), v15 (copy), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (ref), v18 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = {
                handler = v4.onRelease(function() --[[ Line: 43 ]]
                    -- upvalues: l_getOverflowMenuSignalStore_0 (ref), v15 (ref), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (ref), v18 (ref)
                    l_getOverflowMenuSignalStore_0().openMenu(v15);
                    if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 and v18 then
                        v18(false);
                    end;
                end)
            }
        }, {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(function() --[[ Line: 53 ]]
                    -- upvalues: l_getOverflowMenuSignalStore_0 (ref), v15 (ref), l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 (ref), v18 (ref)
                    l_getOverflowMenuSignalStore_0().closeMenu(v15);
                    if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 and v18 then
                        v18(true);
                    end;
                end)
            }
        };
    end, {
        v15, 
        if l_FFlagLuaAppFixExplicitFeedbackConsoleTelemetry_0 then v18 else nil
    });
    local v24 = v6.useEventMap(v13);
    local v25 = v6.useEventMap(v14);
    local v26 = v6.useEventHandlerMap(v22, v24);
    local v27 = v6.useEventHandlerMap(v23, v25);
    v5.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v26 (copy), v17 (copy)
        if v26 and v17 then
            v26(v17.current);
        end;
    end, {
        v26, 
        v17
    });
    v5.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v27 (copy), v19 (copy)
        if v27 then
            v27(v19);
        end;
    end, {
        v27, 
        v19
    });
    v5.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: l_GetInputModeStore_0 (ref), v7 (ref), v16 (copy), v19 (copy), l_GuiService_0 (ref)
        if l_GetInputModeStore_0(false).getLastInputType(false) == v7.Input.Directional and v16 and v19 then
            l_GuiService_0:Select(v19);
        end;
    end, {
        v19
    });
    local v28 = v5.useRef(v16);
    v5.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v28 (copy), v16 (copy), v21 (copy), l_getOverflowMenuSignalStore_0 (ref), v15 (copy)
        if v28.current ~= v16 then
            v28.current = v16;
            if not v16 and not v21.current then
                l_getOverflowMenuSignalStore_0().closeMenu(v15);
            end;
        end;
    end, {
        v16
    });
    local v29 = v5.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v19 (copy), l_GuiService_0 (ref), v21 (copy), l_getOverflowMenuSignalStore_0 (ref), v15 (copy)
        if v19 and l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v19) then
            v21.current = true;
            return;
        else
            if v21.current ~= false then
                v21.current = false;
                l_getOverflowMenuSignalStore_0().closeMenu(v15);
            end;
            return;
        end;
    end, {
        v19, 
        v15
    });
    v5.useLayoutEffect(function() --[[ Line: 111 ]]
        -- upvalues: l_GuiService_0 (ref), v29 (copy)
        local v30 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v29);
        v29();
        return function() --[[ Line: 115 ]]
            -- upvalues: v30 (copy)
            if v30 then
                v30:Disconnect();
            end;
        end;
    end, {
        v29
    });
    return v20;
end;