local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_canGoBack_0 = require(l_Parent_0.Navigation).canGoBack;
local v8 = require(l_script_FirstAncestor_0.FocusNavigationEventNameEnum);
local l_useFocusRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useFocusRegistryEntry;
local v10 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v11 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local v13 = require(l_script_FirstAncestor_0.FocusNavigationDefaultEventMap);
local function _(v14) --[[ Line: 23 ]] --[[ Name: getScrollableAncestor ]]
    if v14 == nil then
        return nil;
    elseif v14:IsA("ScrollingFrame") then
        return v14;
    else
        return v14:FindFirstAncestorWhichIsA("ScrollingFrame");
    end;
end;
local function v19(v16, v17) --[[ Line: 34 ]] --[[ Name: scrollTo ]]
    if v16 ~= nil then
        local v18 = v16.AbsoluteCanvasSize.Y - v16.AbsoluteWindowSize.Y;
        if v17 > 0 and v16.CanvasPosition.Y >= v18 - 350 then
            v16.CanvasPosition = Vector2.new(0, v18);
            return;
        elseif v17 < 0 and v16.CanvasPosition.Y <= 350 then
            v16.CanvasPosition = Vector2.new(0, 0);
            return;
        else
            v16.CanvasPosition = v16.CanvasPosition + Vector2.new(0, v17);
        end;
    end;
end;
useDefaultFocusNavigationBindings = function(v20) --[[ Line: 53 ]] --[[ Name: useDefaultFocusNavigationBindings ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRegistryEntry_0 (copy), v10 (copy), l_useFocusRegistryEntry_0 (copy), v11 (copy), l_useSelector_0 (copy), v3 (copy), v13 (copy), v2 (copy), v8 (copy), v4 (copy), l_canGoBack_0 (copy), v19 (copy)
    local v21 = l_useNavigation_0();
    local v22 = l_useRegistryEntry_0(v10.SearchBar);
    local v23 = l_useFocusRegistryEntry_0(v10.SearchBar);
    local v24 = l_useFocusRegistryEntry_0(v10.NavBar);
    local v25 = l_useRegistryEntry_0(v10.NavBar);
    local v26 = v11(v25);
    local v28 = l_useSelector_0(function(v27) --[[ Line: 60 ]]
        return v27.TabBarVisible;
    end);
    local v29 = v3.useFocusedGuiObject();
    local v30 = if v29 == nil then nil else if v29:IsA("ScrollingFrame") then v29 else v29:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v31 = v30 ~= nil;
    local v32 = v3.useEventMap(v13, v20);
    local v39 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v26 (copy), v8 (ref), v4 (ref), l_canGoBack_0 (ref), v21 (copy), v28 (copy), v24 (copy), v23 (copy), v22 (copy), v31 (copy), v19 (ref), v30 (copy)
        local v33 = {};
        if not v26 then
            v33[v8.NavigateBack] = {
                handler = v4.onRelease(function(_) --[[ Line: 74 ]]
                    -- upvalues: l_canGoBack_0 (ref), v21 (ref), v28 (ref), v24 (ref)
                    if l_canGoBack_0(v21) then
                        v21.goBack(false);
                        return;
                    else
                        if v28 then
                            v24();
                        end;
                        return;
                    end;
                end)
            };
        end;
        if v23 and v22 ~= nil then
            v33[v8.Search] = {
                handler = v4.onRelease(function(_) --[[ Line: 86 ]]
                    -- upvalues: v23 (ref), v22 (ref)
                    v23();
                    if v22 ~= nil then
                        local v36 = if v22:IsA("TextBox") then v22 else v22:FindFirstChildWhichIsA("TextBox", true);
                        if v36 then
                            v36:CaptureFocus();
                        end;
                    end;
                end)
            };
        end;
        if v31 then
            v33[v8.ScrollDown] = {
                handler = v4.onRelease(function(_) --[[ Line: 103 ]]
                    -- upvalues: v19 (ref), v30 (ref)
                    v19(v30, 300);
                end)
            };
            v33[v8.ScrollUp] = {
                handler = v4.onRelease(function(_) --[[ Line: 108 ]]
                    -- upvalues: v19 (ref), v30 (ref)
                    v19(v30, -300);
                end)
            };
        end;
        return v33;
    end, {
        v21, 
        v22, 
        v23, 
        v24, 
        v26, 
        v28, 
        v31
    });
    return (v3.useEventHandlerMap(v39, v32));
end;
return useDefaultFocusNavigationBindings;