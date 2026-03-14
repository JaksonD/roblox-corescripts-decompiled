local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
return function(v3) --[[ Line: 13 ]] --[[ Name: InterventionOverlay ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy)
    local v4 = l_useStyle_0();
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v4.Tokens.Semantic.Color.Common.Overlay.Color3, 
        BackgroundTransparency = v4.Tokens.Semantic.Color.Common.Overlay.Transparency, 
        BorderSizePixel = 0, 
        Text = "", 
        [v1.Event.Activated] = v3.onDismiss
    }, v3.children);
end;