local l_Parent_0 = script:FindFirstAncestor("Drawer").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return (v1.forwardRef(function(v3, v4) --[[ Line: 14 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v5 = l_useTokens_0();
    return v1.createElement("TextButton", {
        ref = v4, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v3.transparencyBinding, 
        BackgroundColor3 = v5.Semantic.Color.Common.Overlay.Color3, 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        ZIndex = v3.zIndex, 
        [v1.Change.AbsoluteSize] = v3.onSizeChanged, 
        [v1.Event.Activated] = v3.onActivated, 
        BorderSizePixel = 0
    }, v3.children);
end));