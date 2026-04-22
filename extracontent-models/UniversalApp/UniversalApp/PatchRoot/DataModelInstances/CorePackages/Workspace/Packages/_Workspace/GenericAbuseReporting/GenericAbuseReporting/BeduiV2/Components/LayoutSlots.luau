local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.BeduiV2.Components.SlideTransitionContext);
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_useIsSlideAnimating_0 = v4.useIsSlideAnimating;
local v10 = v3.forwardRef(function(v8, v9) --[[ Line: 37 ]]
    -- upvalues: v3 (copy), l_Sheet_0 (copy)
    return v3.createElement(l_Sheet_0.Content, {
        ref = v9
    }, v8.children);
end);
local v13 = v3.forwardRef(function(v11, v12) --[[ Line: 43 ]]
    -- upvalues: v3 (copy), l_Sheet_0 (copy)
    return v3.createElement(l_Sheet_0.Actions, {
        ref = v12
    }, v11.children);
end);
local v14 = {
    Body = v10, 
    Actions = v13
};
local v19 = v3.forwardRef(function(v15, v16) --[[ Line: 57 ]]
    -- upvalues: l_useIsSlideAnimating_0 (copy), v3 (copy), l_View_0 (copy)
    local v18 = l_useIsSlideAnimating_0():map(function(v17) --[[ Line: 59 ]]
        if v17 then
            return 1;
        else
            return 0;
        end;
    end);
    return v3.createElement(l_View_0, {
        tag = "fill size-full-0", 
        ref = v16
    }, v3.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        ZIndex = 2, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = false, 
        ScrollBarThickness = 1, 
        ScrollBarImageTransparency = v18
    }, v3.createElement(l_View_0, {
        tag = "align-x-center size-full-0 auto-y"
    }, v3.createElement(l_View_0, {
        tag = "col gap-medium size-full-0 auto-y"
    }, v15.children))));
end);
local v22 = v3.forwardRef(function(v20, v21) --[[ Line: 99 ]]
    -- upvalues: v3 (copy), l_View_0 (copy)
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y align-x-center padding-bottom-small", 
        ref = v21
    }, v3.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-medium position-bottom-center", 
        ZIndex = 2
    }, v20.children));
end);
local v25 = v3.forwardRef(function(v23, _) --[[ Line: 117 ]]
    -- upvalues: v3 (copy)
    return v3.createElement(v3.Fragment, nil, v23.children);
end);
local v28 = v3.forwardRef(function(v26, v27) --[[ Line: 125 ]]
    -- upvalues: v3 (copy), l_View_0 (copy)
    return v3.createElement(l_View_0, {
        tag = "col gap-medium size-full-0 auto-y", 
        ref = v27
    }, v26.children);
end);
local v31 = v3.forwardRef(function(v29, v30) --[[ Line: 133 ]]
    -- upvalues: v3 (copy), l_View_0 (copy)
    return v3.createElement(l_View_0, {
        tag = "auto-xy padding-bottom-small padding-top-small", 
        ref = v30
    }, v29.children);
end);
local v36 = v3.forwardRef(function(v32, v33) --[[ Line: 144 ]]
    -- upvalues: l_useIsSlideAnimating_0 (copy), v3 (copy), l_View_0 (copy)
    local v35 = l_useIsSlideAnimating_0():map(function(v34) --[[ Line: 146 ]]
        if v34 then
            return 1;
        else
            return 0;
        end;
    end);
    return v3.createElement(l_View_0, {
        tag = "fill size-full-0", 
        ref = v33
    }, v3.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        ZIndex = 2, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = false, 
        ScrollBarThickness = 1, 
        ScrollBarImageTransparency = v35
    }, v3.createElement(l_View_0, {
        tag = "align-x-center size-full-0 auto-y"
    }, v3.createElement(l_View_0, {
        Size = UDim2.new(0, 468, 0, 0), 
        tag = "col gap-medium auto-y"
    }, v32.children))));
end);
local v37 = {
    Body = v19, 
    Actions = v22, 
    InlineContainer = v25
};
local v38 = {
    Body = v28, 
    Actions = v31, 
    InlineContainer = v36
};
local v39 = v3.createContext(v14);
return {
    sheetSlots = v14, 
    inlinePortraitSlots = v37, 
    inlineLandscapeSlots = v38, 
    LayoutSlotsProvider = function(v40) --[[ Line: 197 ]]
        -- upvalues: v3 (copy), v39 (copy)
        return v3.createElement(v39.Provider, {
            value = v40.slots
        }, v40.children);
    end, 
    useLayoutSlots = function() --[[ Line: 208 ]]
        -- upvalues: v3 (copy), v39 (copy)
        return v3.useContext(v39);
    end
};