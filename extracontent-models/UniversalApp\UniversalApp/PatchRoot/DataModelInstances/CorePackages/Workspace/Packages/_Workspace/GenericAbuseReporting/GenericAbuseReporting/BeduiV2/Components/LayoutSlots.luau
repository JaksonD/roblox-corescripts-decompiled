local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_ScrollView_0 = v1.ScrollView;
local l_Sheet_0 = v1.Sheet;
local l_View_0 = v1.View;
local v8 = v2.forwardRef(function(v6, v7) --[[ Line: 26 ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy)
    return v2.createElement(l_Sheet_0.Content, {
        ref = v7
    }, v6.children);
end);
local v11 = v2.forwardRef(function(v9, v10) --[[ Line: 32 ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy)
    return v2.createElement(l_Sheet_0.Actions, {
        ref = v10
    }, v9.children);
end);
local v12 = {
    Body = v8, 
    Actions = v11
};
local v15 = v2.forwardRef(function(v13, v14) --[[ Line: 43 ]]
    -- upvalues: v2 (copy), l_ScrollView_0 (copy), l_View_0 (copy)
    return v2.createElement(l_ScrollView_0, {
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.fromScale(1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = true
        }, 
        scrollingFrameRef = v14, 
        tag = "size-full-0 auto-y fill"
    }, v2.createElement(l_View_0, {
        tag = "col size-full-0 auto-y margin-x-large gap-medium align-x-center"
    }, v13.children));
end);
local v18 = v2.forwardRef(function(v16, v17) --[[ Line: 62 ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        ref = v17, 
        tag = "size-full-0 auto-y row gap-medium"
    }, v16.children);
end);
local v19 = {
    Body = v15, 
    Actions = v18
};
local v20 = v2.createContext(v12);
return {
    sheetSlots = v12, 
    inlineSlots = v19, 
    LayoutSlotsProvider = function(v21) --[[ Line: 76 ]]
        -- upvalues: v2 (copy), v20 (copy)
        return v2.createElement(v20.Provider, {
            value = v21.slots
        }, v21.children);
    end, 
    useLayoutSlots = function() --[[ Line: 89 ]]
        -- upvalues: v2 (copy), v20 (copy)
        return v2.useContext(v20);
    end
};