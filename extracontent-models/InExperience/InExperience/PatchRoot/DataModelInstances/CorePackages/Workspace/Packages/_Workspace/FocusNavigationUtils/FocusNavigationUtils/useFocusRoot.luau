local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v6 = require(l_script_FirstAncestor_0.useFocusNavigableSurfaceRegistryConnection);
local v7 = require(l_script_FirstAncestor_0.useAutoFocus);
local v8 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local v9 = require(l_script_FirstAncestor_0.useLastInputMode);
local v10 = {};
return function(v11) --[[ Line: 44 ]] --[[ Name: useFocusRoot ]]
    -- upvalues: v3 (copy), v10 (copy), v4 (copy), v6 (copy), v8 (copy), v7 (copy), v9 (copy), l_GuiService_0 (copy)
    local v12 = nil;
    local _ = nil;
    local v14 = nil;
    local v15, v16 = v3.useState(nil);
    v12 = v15;
    v14 = v16;
    v15 = v11.eventMap or v10;
    v16 = v4.useEventMap(v15, v14);
    local v17 = v11.eventHandlers or v10;
    local v18 = v4.useEventHandlerMap(v17, v16);
    local v19 = v11.isFocusable == nil or v11.isFocusable;
    local v20 = v11.shouldRestoreFocus == nil or v11.shouldRestoreFocus;
    local v21 = v4.useMostRecentFocusBehavior(v18);
    local v22 = if v20 then v21 else v18;
    v6(v12, v11.surfaceIdentifier, v19);
    local v23 = v8(v12);
    local v24 = v7({
        v12
    }, 0.1);
    local v25 = v9() == "Focus";
    local v26 = v11.isAutoFocusRoot and v19 and v25 and v12 and not v23;
    v3.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v26 (copy), v24 (copy)
        local v27 = nil;
        if v26 then
            v27 = v24();
        end;
        return function() --[[ Line: 78 ]]
            -- upvalues: v27 (ref)
            if v27 then
                v27.cancel();
            end;
        end;
    end, {
        v26, 
        v24
    });
    local v28 = v3.useRef(v12);
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v12 (ref), v28 (copy)
        if v12 then
            v28.current = v12;
        end;
    end, {
        v12
    });
    v3.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v28 (copy), l_GuiService_0 (ref)
        return function() --[[ Line: 93 ]]
            -- upvalues: v28 (ref), l_GuiService_0 (ref)
            if not v28.current then
                return;
            else
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_0 then
                    return;
                else
                    if l_SelectedCoreObject_0:IsDescendantOf(v28.current) or not l_SelectedCoreObject_0:IsDescendantOf(game) then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    return;
                end;
            end;
        end;
    end, {});
    return v22;
end;