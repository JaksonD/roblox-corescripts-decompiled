local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Sheet_0 = v1.Sheet;
local l_View_0 = v1.View;
local v7 = v2.forwardRef(function(v5, v6) --[[ Line: 28 ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy)
    return v2.createElement(l_Sheet_0.Content, {
        ref = v6
    }, v5.children);
end);
local v10 = v2.forwardRef(function(v8, v9) --[[ Line: 34 ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy)
    return v2.createElement(l_Sheet_0.Actions, {
        ref = v9
    }, v8.children);
end);
local v11 = {
    Body = v7, 
    Actions = v10
};
local v14 = v2.forwardRef(function(v12, v13) --[[ Line: 48 ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-0 fill", 
        ref = v13
    }, v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        ZIndex = 2, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = false, 
        ScrollBarThickness = 1
    }, v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y align-x-center"
    }, v2.createElement(l_View_0, {
        tag = "col size-full-0 auto-y gap-medium"
    }, v12.children))));
end);
local v17 = v2.forwardRef(function(v15, v16) --[[ Line: 85 ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-0 fill", 
        ref = v16
    }, v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        ZIndex = 2, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = false, 
        ScrollBarThickness = 1
    }, v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y align-x-center"
    }, v2.createElement(l_View_0, {
        Size = UDim2.new(0, 468, 0, 0), 
        tag = "col auto-y gap-medium"
    }, v15.children))));
end);
local v20 = v2.forwardRef(function(v18, v19) --[[ Line: 122 ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y align-x-center padding-bottom-small", 
        ref = v19
    }, v2.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-medium position-bottom-center", 
        ZIndex = 2
    }, v18.children));
end);
local v23 = v2.forwardRef(function(v21, v22) --[[ Line: 140 ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y align-x-center padding-bottom-small", 
        ref = v22
    }, v2.createElement(l_View_0, {
        tag = "row auto-y gap-medium position-bottom-center", 
        Size = UDim2.new(0, 468, 0, 0), 
        ZIndex = 2
    }, v21.children));
end);
local v24 = {
    Body = v14, 
    Actions = v20
};
local v25 = {
    Body = v17, 
    Actions = v23
};
local v26 = v2.createContext(v11);
return {
    sheetSlots = v11, 
    inlinePortraitSlots = v24, 
    inlineLandscapeSlots = v25, 
    LayoutSlotsProvider = function(v27) --[[ Line: 169 ]]
        -- upvalues: v2 (copy), v26 (copy)
        return v2.createElement(v26.Provider, {
            value = v27.slots
        }, v27.children);
    end, 
    useLayoutSlots = function() --[[ Line: 182 ]]
        -- upvalues: v2 (copy), v26 (copy)
        return v2.useContext(v26);
    end
};