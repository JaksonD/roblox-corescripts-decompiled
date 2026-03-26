local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local l_useMemo_0 = require(l_Parent_0.React).useMemo;
local v2 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
local v4 = require(l_Parent_0.InputHandlers);
local l_useFocusedGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusedGuiObject;
local l_useFocusRoot_0 = v2.useFocusRoot;
local v7 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.PageUp] = l_FocusNavigationEventNameEnum_0.ScrollUp, 
    [Enum.KeyCode.LeftBracket] = l_FocusNavigationEventNameEnum_0.ScrollUp, 
    [Enum.KeyCode.PageDown] = l_FocusNavigationEventNameEnum_0.ScrollDown, 
    [Enum.KeyCode.RightBracket] = l_FocusNavigationEventNameEnum_0.ScrollDown
};
local function _(v8) --[[ Line: 31 ]] --[[ Name: getScrollableAncestor ]]
    if v8 == nil then
        return nil;
    elseif v8:IsA("ScrollingFrame") then
        return v8;
    else
        return v8:FindFirstAncestorWhichIsA("ScrollingFrame");
    end;
end;
local function _(v10, v11) --[[ Line: 44 ]] --[[ Name: scrollTo ]]
    if v10 ~= nil then
        local v12 = v10.AbsoluteCanvasSize.Y - v10.AbsoluteWindowSize.Y;
        if v11 > 0 and v10.CanvasPosition.Y >= v12 - 350 then
            v10.CanvasPosition = Vector2.new(0, v12);
            return;
        elseif v11 < 0 and v10.CanvasPosition.Y <= 350 then
            v10.CanvasPosition = Vector2.new(0, 0);
            return;
        else
            v10.CanvasPosition = v10.CanvasPosition + Vector2.new(0, v11);
        end;
    end;
end;
return function(v14) --[[ Line: 73 ]] --[[ Name: useInterventionFocusRoot ]]
    -- upvalues: l_useFocusedGuiObject_0 (copy), l_useMemo_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), l_useFocusRoot_0 (copy), v7 (copy)
    local v15 = l_useFocusedGuiObject_0();
    local v16 = if v15 == nil then nil else if v15:IsA("ScrollingFrame") then v15 else v15:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v25 = l_useMemo_0(function() --[[ Line: 77 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v16 (copy)
        local v18 = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onPress(function(v17) --[[ Line: 80 ]]
                    v17:cancel();
                end)
            }
        };
        if v16 then
            v18[l_FocusNavigationEventNameEnum_0.ScrollDown] = {
                handler = v4.onRelease(function(_) --[[ Line: 88 ]]
                    -- upvalues: v16 (ref)
                    local l_v16_0 = v16;
                    if l_v16_0 ~= nil then
                        local v21 = l_v16_0.AbsoluteCanvasSize.Y - l_v16_0.AbsoluteWindowSize.Y;
                        if l_v16_0.CanvasPosition.Y >= v21 - 350 then
                            l_v16_0.CanvasPosition = Vector2.new(0, v21);
                            return;
                        else
                            l_v16_0.CanvasPosition = l_v16_0.CanvasPosition + Vector2.new(0, 300);
                        end;
                    end;
                end)
            };
            v18[l_FocusNavigationEventNameEnum_0.ScrollUp] = {
                handler = v4.onRelease(function(_) --[[ Line: 93 ]]
                    -- upvalues: v16 (ref)
                    local l_v16_1 = v16;
                    if l_v16_1 ~= nil then
                        local _ = l_v16_1.AbsoluteCanvasSize.Y - l_v16_1.AbsoluteWindowSize.Y;
                        if l_v16_1.CanvasPosition.Y <= 350 then
                            l_v16_1.CanvasPosition = Vector2.new(0, 0);
                            return;
                        else
                            l_v16_1.CanvasPosition = l_v16_1.CanvasPosition + Vector2.new(0, -300);
                        end;
                    end;
                end)
            };
        end;
        return v18;
    end, {
        v16
    });
    return l_useFocusRoot_0({
        surfaceIdentifier = v14.surfaceIdentifier, 
        isAutoFocusRoot = v14.isAutoFocusRoot == nil or v14.isAutoFocusRoot, 
        eventMap = v7, 
        eventHandlers = v25
    });
end;