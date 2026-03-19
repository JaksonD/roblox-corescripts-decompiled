local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_1.Style.useStyle);
local v7 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v8 = require(l_Parent_0.Interactable);
local v9 = require(l_Parent_0.Enum.ControlState);
local v10 = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.fromScale(0.5, 0.5), 
    size = UDim2.fromScale(1, 1), 
    isDisabled = false, 
    selectable = true, 
    affordance = "Background", 
    stateStyle = "Standard", 
    outset = {
        top = UDim.new(0, 0), 
        right = UDim.new(0, 0), 
        bottom = UDim.new(0, 0), 
        left = UDim.new(0, 0)
    }
};
local v11 = v9.Initialize.rawValue();
local v31 = v4.forwardRef(function(v12, v13) --[[ Line: 76 ]]
    -- upvalues: v5 (copy), v10 (copy), v6 (copy), v11 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v14 = v5.Dictionary.join(v10, v12);
    local l_StateLayer_0 = v6().Tokens.Component.StateLayer;
    local l_Color_0 = l_StateLayer_0[v14.stateStyle][v11].Color;
    local v17, v18 = v4.useBinding(l_Color_0.Color3);
    local v19, v20 = v4.useBinding(l_Color_0.Transparency);
    local v21 = v7(v14.cornerRadius);
    local v22 = {
        ref = v13, 
        AnchorPoint = v14.anchorPoint, 
        Position = v14.position, 
        Size = v14.size, 
        LayoutOrder = v14.layoutOrder, 
        ZIndex = v14.zIndex, 
        BackgroundTransparency = 1
    };
    local v23 = {};
    if v14.cornerRadius ~= nil then
        v23.UICorner = v4.createElement("UICorner", {
            CornerRadius = v14.cornerRadius
        });
    end;
    if v14.affordance == "Border" then
        v23.UIStroke = v4.createElement("UIStroke", {
            Thickness = l_StateLayer_0.Base.BorderWidth, 
            Color = v17, 
            Transparency = v19
        });
        v22.BackgroundTransparency = 1;
    elseif v14.affordance == "Background" then
        v22.BackgroundColor3 = v17;
        v22.BackgroundTransparency = v19;
    end;
    local l_outset_0 = v14.outset;
    local v25 = UDim2.new(1 + l_outset_0.left.Scale + l_outset_0.right.Scale, l_outset_0.left.Offset + l_outset_0.right.Offset, 1 + l_outset_0.top.Scale + l_outset_0.bottom.Scale, l_outset_0.top.Offset + l_outset_0.bottom.Offset);
    local v26 = UDim2.new(-l_outset_0.left.Scale, -l_outset_0.left.Offset, -l_outset_0.top.Scale, -l_outset_0.top.Offset);
    local v30 = v4.useCallback(function(v27, v28) --[[ Line: 122 ]]
        -- upvalues: l_StateLayer_0 (copy), v14 (copy), v18 (copy), v20 (copy)
        local l_Color_1 = l_StateLayer_0[v14.stateStyle][v28.rawValue()].Color;
        v18(l_Color_1.Color3);
        v20(l_Color_1.Transparency);
        if v14.onStateChanged then
            v14.onStateChanged(v27, v28);
        end;
    end, {
        l_StateLayer_0, 
        v18, 
        v20, 
        v14.stateStyle, 
        v14.onStateChanged
    });
    v23.Button = v4.createElement(v8, {
        Size = v25, 
        Position = v26, 
        BackgroundTransparency = 1, 
        Selectable = not v14.isDisabled and v14.selectable, 
        SelectionImageObject = v21, 
        [v4.Event.Activated] = v14.onActivated, 
        onStateChanged = v30, 
        isDisabled = v14.isDisabled, 
        userInteractionEnabled = not v14.isDisabled
    });
    return v4.createElement("Frame", v22, v23);
end);
return v4.memo(v31);