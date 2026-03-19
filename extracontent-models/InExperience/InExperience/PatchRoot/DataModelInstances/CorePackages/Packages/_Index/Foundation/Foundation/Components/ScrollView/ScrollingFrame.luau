local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v7 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v11 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v12 = {
    frequency = 2
};
local v13 = {
    scrollBarVisibility = "Auto"
};
return v2.memo(v2.forwardRef(function(v14, v15) --[[ Line: 52 ]] --[[ Name: ScrollingFrame ]]
    -- upvalues: v5 (copy), v13 (copy), v6 (copy), v9 (copy), v8 (copy), v2 (copy), v10 (copy), v7 (copy), v3 (copy), v12 (copy), v11 (copy)
    local v16 = v5(v14, v13);
    local v17 = v6({
        selection = v16.selection
    }, {});
    local v18 = v9();
    local v19 = v8(v14.tag);
    local l_Shift_400_0 = v18.Color.Shift.Shift_400;
    local v21 = v2.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v10 (ref), v18 (copy)
        if v16.scrollBarVisibility == v10.None then
            return 0;
        else
            return v18.Size.Size_150;
        end;
    end, {
        v16.scrollBarVisibility
    });
    local v22 = v7();
    local v23 = v2.useRef(nil);
    local v24, v25 = v3.useAnimatedBinding(1);
    local v28 = v2.useCallback(function(v26, v27) --[[ Line: 69 ]]
        -- upvalues: v23 (copy), v25 (copy), v3 (ref), l_Shift_400_0 (copy), v12 (ref)
        if v23.current then
            task.cancel(v23.current);
        end;
        if v26 then
            v25(v3.spring(l_Shift_400_0.Transparency, v12));
        end;
        if v27 ~= nil then
            v23.current = task.delay(v27, function() --[[ Line: 79 ]]
                -- upvalues: v25 (ref), v3 (ref), v12 (ref)
                v25(v3.spring(1, v12));
            end);
        end;
    end, {
        l_Shift_400_0
    });
    v2.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v16 (copy), v28 (copy), v11 (ref)
        if v16.scrollBarVisibility == "None" then
            v28(false, 0);
            return;
        elseif v16.scrollBarVisibility == "Always" then
            v28(true);
            return;
        else
            local l_v28_0 = v28;
            local v30 = true;
            if v16.controlState ~= v11.Hover then
                v30 = true;
                if v16.controlState ~= v11.Selected then
                    v30 = v16.controlState == v11.Pressed;
                end;
            end;
            l_v28_0(v30, v16.controlState == v11.Default and 0 or nil);
            return;
        end;
    end, {
        v16.scrollBarVisibility, 
        v16.controlState
    });
    return v2.createElement("ScrollingFrame", {
        AutomaticCanvasSize = v16.AutomaticCanvasSize, 
        CanvasSize = v16.CanvasSize, 
        ClipsDescendants = v16.ClipsDescendants, 
        ScrollingDirection = v16.ScrollingDirection, 
        ScrollingEnabled = v16.ScrollingEnabled, 
        ScrollBarImageColor3 = l_Shift_400_0.Color3, 
        ScrollBarImageTransparency = v24, 
        ScrollBarThickness = v21, 
        VerticalScrollBarInset = v16.VerticalScrollBarInset, 
        HorizontalScrollBarInset = v16.HorizontalScrollBarInset, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = v16.AutomaticSize, 
        Size = UDim2.fromScale(1, 1), 
        Selectable = v17.Selectable, 
        NextSelectionUp = v17.NextSelectionUp, 
        NextSelectionDown = v17.NextSelectionDown, 
        NextSelectionLeft = v17.NextSelectionLeft, 
        NextSelectionRight = v17.NextSelectionRight, 
        SelectionImageObject = v17.SelectionImageObject or v22, 
        SelectionOrder = v17.SelectionOrder, 
        [v2.Change.CanvasPosition] = v16.scrollBarVisibility == "Auto" and function(v31) --[[ Line: 132 ]]
            -- upvalues: v28 (copy), v16 (copy)
            v28(true, 3);
            if v16.onCanvasPositionChanged then
                v16.onCanvasPositionChanged(v31);
            end;
        end or v16.onCanvasPositionChanged, 
        [v2.Change.AbsoluteCanvasSize] = v16.onAbsoluteCanvasSizeChanged, 
        [v2.Change.AbsoluteWindowSize] = v16.onAbsoluteWindowSizeChanged, 
        ref = v15, 
        [v2.Tag] = v19
    }, v16.children);
end));