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
local function _(v13) --[[ Line: 21 ]] --[[ Name: getScrollableAncestor ]]
    if v13 == nil then
        return nil;
    elseif v13:IsA("ScrollingFrame") then
        return v13;
    else
        return v13:FindFirstAncestorWhichIsA("ScrollingFrame");
    end;
end;
local function _(v15, v16) --[[ Line: 32 ]] --[[ Name: scrollTo ]]
    if v15 ~= nil then
        local v17 = v15.AbsoluteCanvasSize.Y - v15.AbsoluteWindowSize.Y;
        if v16 > 0 and v15.CanvasPosition.Y >= v17 - 350 then
            v15.CanvasPosition = Vector2.new(0, v17);
            return;
        elseif v16 < 0 and v15.CanvasPosition.Y <= 350 then
            v15.CanvasPosition = Vector2.new(0, 0);
            return;
        else
            v15.CanvasPosition = v15.CanvasPosition + Vector2.new(0, v16);
        end;
    end;
end;
useDefaultAppEventHandlers = function() --[[ Line: 51 ]] --[[ Name: useDefaultAppEventHandlers ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRegistryEntry_0 (copy), v10 (copy), l_useFocusRegistryEntry_0 (copy), v11 (copy), l_useSelector_0 (copy), v3 (copy), v2 (copy), v8 (copy), v4 (copy), l_canGoBack_0 (copy)
    local v19 = l_useNavigation_0();
    local v20 = l_useRegistryEntry_0(v10.SearchBar);
    local v21 = l_useFocusRegistryEntry_0(v10.SearchBar);
    local v22 = l_useFocusRegistryEntry_0(v10.NavBar);
    local v23 = l_useRegistryEntry_0(v10.NavBar);
    local v24 = v11(v23);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 58 ]]
        return v25.TabBarVisible;
    end);
    local v27 = v3.useFocusedGuiObject();
    local v28 = if v27 == nil then nil else if v27:IsA("ScrollingFrame") then v27 else v27:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v29 = v28 ~= nil;
    return (v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy), v8 (ref), v4 (ref), l_canGoBack_0 (ref), v19 (copy), v26 (copy), v22 (copy), v21 (copy), v20 (copy), v29 (copy), v28 (copy)
        local v30 = {};
        if not v24 then
            v30[v8.NavigateBack] = {
                handler = v4.onRelease(function(_) --[[ Line: 71 ]]
                    -- upvalues: l_canGoBack_0 (ref), v19 (ref), v26 (ref), v22 (ref)
                    if l_canGoBack_0(v19) then
                        v19.goBack(false);
                        return;
                    else
                        if v26 then
                            v22();
                        end;
                        return;
                    end;
                end)
            };
        end;
        if v21 and v20 ~= nil then
            v30[v8.Search] = {
                handler = v4.onRelease(function(_) --[[ Line: 83 ]]
                    -- upvalues: v21 (ref), v20 (ref)
                    v21();
                    if v20 ~= nil then
                        local v33 = if v20:IsA("TextBox") then v20 else v20:FindFirstChildWhichIsA("TextBox", true);
                        if v33 then
                            v33:CaptureFocus();
                        end;
                    end;
                end)
            };
        end;
        if v29 then
            v30[v8.ScrollDown] = {
                handler = v4.onRelease(function(_) --[[ Line: 100 ]]
                    -- upvalues: v28 (ref)
                    local l_v28_0 = v28;
                    if l_v28_0 ~= nil then
                        local v36 = l_v28_0.AbsoluteCanvasSize.Y - l_v28_0.AbsoluteWindowSize.Y;
                        if l_v28_0.CanvasPosition.Y >= v36 - 350 then
                            l_v28_0.CanvasPosition = Vector2.new(0, v36);
                            return;
                        else
                            l_v28_0.CanvasPosition = l_v28_0.CanvasPosition + Vector2.new(0, 300);
                        end;
                    end;
                end)
            };
            v30[v8.ScrollUp] = {
                handler = v4.onRelease(function(_) --[[ Line: 105 ]]
                    -- upvalues: v28 (ref)
                    local l_v28_1 = v28;
                    if l_v28_1 ~= nil then
                        local _ = l_v28_1.AbsoluteCanvasSize.Y - l_v28_1.AbsoluteWindowSize.Y;
                        if l_v28_1.CanvasPosition.Y <= 350 then
                            l_v28_1.CanvasPosition = Vector2.new(0, 0);
                            return;
                        else
                            l_v28_1.CanvasPosition = l_v28_1.CanvasPosition + Vector2.new(0, -300);
                        end;
                    end;
                end)
            };
        end;
        return v30;
    end, {
        v19, 
        v20, 
        v21, 
        v22, 
        v24, 
        v26, 
        v29
    }));
end;
return useDefaultAppEventHandlers;