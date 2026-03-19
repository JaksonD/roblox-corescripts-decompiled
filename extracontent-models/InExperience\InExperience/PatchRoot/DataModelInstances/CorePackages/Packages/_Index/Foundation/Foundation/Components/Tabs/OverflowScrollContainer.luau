local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(l_script_FirstAncestor_0.Components.IconButton);
local v8 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v9 = require(l_script_FirstAncestor_0.Components.ScrollView);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0), 
    NumberSequenceKeypoint.new(0.8, 0), 
    NumberSequenceKeypoint.new(1, 1)
});
local v15 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1), 
    NumberSequenceKeypoint.new(0.2, 0), 
    NumberSequenceKeypoint.new(1, 0)
});
local function v17(v16) --[[ Line: 33 ]] --[[ Name: OverflowButton ]]
    -- upvalues: v4 (copy), v11 (copy), v13 (copy), v7 (copy), v8 (copy)
    return v4.createElement(v11, v13(v16, {
        tag = ("bg-surface-0 size-0-full auto-x col align-y-center %*"):format(v16.tag)
    }), {
        UIGradient = v4.createElement("UIGradient", {
            Transparency = v16.gradient
        }), 
        Button = v4.createElement(v7, {
            onActivated = v16.onActivated, 
            size = if not (v16.size ~= v8.Large) or v16.size == v8.Medium then v8.Small else v8.XSmall, 
            icon = {
                name = v16.icon
            }
        })
    });
end;
return function(v18) --[[ Line: 70 ]] --[[ Name: OverflowScrollContainer ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), v3 (copy), v11 (copy), v13 (copy), v9 (copy), v6 (copy), v12 (copy), v17 (copy), v14 (copy), v15 (copy)
    local v19, v20 = v4.useBinding(false);
    local v21, v22 = v4.useBinding(false);
    local v23 = v4.useRef(nil);
    local v26 = v5.useMotor(0, function(v24) --[[ Line: 74 ]]
        -- upvalues: v23 (copy)
        local l_current_0 = v23.current;
        if not l_current_0 then
            return;
        else
            l_current_0.CanvasPosition = Vector2.new(v24, 0);
            return;
        end;
    end);
    local v28 = v4.useCallback(v2.throttle(function(v27) --[[ Line: 83 ]]
        -- upvalues: v20 (copy), v22 (copy)
        if v27.AbsoluteWindowSize.X == 0 then
            return;
        else
            v20(v27.AbsoluteWindowSize.X + v27.CanvasPosition.X < v27.AbsoluteCanvasSize.X - 1);
            v22(v27.CanvasPosition.X ~= 0);
            return;
        end;
    end, 0.2), {});
    local v31 = v4.useCallback(function(v29) --[[ Line: 96 ]]
        -- upvalues: v23 (copy), v26 (copy), v3 (ref)
        local l_current_1 = v23.current;
        if not l_current_1 then
            return;
        else
            v26(v3.ease(l_current_1.CanvasPosition.X + v29, {
                duration = 0.2, 
                easingStyle = Enum.EasingStyle.Quad
            }));
            return;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v23 (copy), v28 (copy)
        if v23.current then
            v28(v23.current);
        end;
    end, {});
    local v32 = v4.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v31 (copy)
        v31(-90);
    end, {
        v31
    });
    local v33 = v4.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v31 (copy)
        v31(90);
    end, {
        v31
    });
    return v4.createElement(v11, v13(v18, {
        tag = "auto-y size-full-0"
    }), {
        Scroll = v4.createElement(v9, {
            LayoutOrder = 1, 
            tag = "size-full", 
            onCanvasPositionChanged = v28, 
            onAbsoluteWindowSizeChanged = v28, 
            scrollingFrameRef = v23, 
            selection = if v6.FoundationTabsDisableScrollSelection then {
                Selectable = false
            } else nil, 
            scroll = {
                AutomaticSize = Enum.AutomaticSize.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                scrollBarVisibility = v12.None
            }
        }, v18.children), 
        OverflowStart = v4.createElement(v17, {
            LayoutOrder = 3, 
            Position = UDim2.fromScale(0, 0), 
            size = v18.size, 
            isStart = true, 
            ZIndex = 2, 
            Visible = v21, 
            onActivated = v32, 
            gradient = v14, 
            tag = "padding-right-small", 
            icon = "chevron-large-left", 
            testId = ("%*--overflow-start"):format(v18.testId)
        }), 
        OverflowEnd = v4.createElement(v17, {
            LayoutOrder = 4, 
            Position = UDim2.fromScale(1, 0), 
            size = v18.size, 
            ZIndex = 2, 
            Visible = v19, 
            onActivated = v33, 
            gradient = v15, 
            tag = "padding-left-small anchor-top-right", 
            icon = "chevron-large-right", 
            testId = ("%*--overflow-end"):format(v18.testId)
        })
    });
end;