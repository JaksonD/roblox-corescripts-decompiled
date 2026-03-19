local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Otter_0 = v1.Otter;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.Utility.divideTransparency);
local v11 = require(script.Parent.AssetImage);
local v12 = UDim2.new(0, -3, 0.5, 0);
local v13 = UDim2.new(1, -39, 0.5, 0);
local v14 = {
    frequency = 4
};
local v15 = l_Roact_0.PureComponent:extend("ToggleSwitch");
v15.validateProps = l_t_0.strictInterface({
    checked = l_t_0.boolean, 
    onToggled = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    buttonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table)), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    NextSelectionUp = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    onSelectionGained = l_t_0.optional(l_t_0.callback)
});
v15.init = function(v16) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), v12 (copy), v13 (copy), l_Otter_0 (copy)
    local v17 = v16.props.checked and 1 or 0;
    local v18, v19 = l_Roact_0.createBinding(v17);
    v16.progress = v18;
    v16.setProgress = v19;
    v16.fillTransparency = v16.progress:map(function(v20) --[[ Line: 46 ]]
        -- upvalues: v10 (ref), v16 (copy)
        return v10(1 - v20, v16.props.disabled and 4 or 1);
    end);
    v16.knobPosition = v16.progress:map(function(v21) --[[ Line: 50 ]]
        -- upvalues: v12 (ref), v13 (ref)
        return v12:lerp(v13, v21);
    end);
    v16.motor = l_Otter_0.createSingleMotor(v17);
    v16.motor:onStep(v16.setProgress);
end;
v15.renderWithSelectionCursor = function(v22, v23) --[[ Line: 58 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v11 (copy), v10 (copy), l_CursorKind_0 (copy)
    return l_withStyle_0(function(v24) --[[ Line: 59 ]]
        -- upvalues: l_Roact_0 (ref), v11 (ref), v22 (copy), v10 (ref), v23 (copy), l_CursorKind_0 (ref)
        return l_Roact_0.createElement(v11.Button, {
            Size = UDim2.new(0, 60, 0, 36), 
            BackgroundTransparency = 1, 
            Position = v22.props.Position, 
            LayoutOrder = v22.props.LayoutOrder, 
            imageKey = "ToggleOutline", 
            AnchorPoint = v22.props.AnchorPoint, 
            ImageColor3 = v24.Theme.SecondaryDefault.Color, 
            ImageTransparency = v10(v24.Theme.SecondaryDefault.Transparency, v22.props.disabled and 4 or 1), 
            NextSelectionUp = v22.props.NextSelectionUp, 
            [l_Roact_0.Event.Activated] = v22.props.onToggled, 
            [l_Roact_0.Ref] = v22.props.buttonRef, 
            [l_Roact_0.Event.SelectionLost] = v22.props.onSelectionLost, 
            [l_Roact_0.Event.SelectionGained] = v22.props.onSelectionGained, 
            SelectionImageObject = v23(l_CursorKind_0.Toggle)
        }, {
            Fill = l_Roact_0.createElement(v11.Label, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                imageKey = "ToggleFill", 
                ImageColor3 = v24.Theme.Success.Color, 
                ImageTransparency = v22.fillTransparency
            }), 
            Knob = l_Roact_0.createElement(v11.Label, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 42, 0, 42), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = v22.knobPosition, 
                imageKey = "ToggleKnob", 
                ImageTransparency = v10(0, v22.props.disabled and 4 or 1), 
                ZIndex = 2
            })
        });
    end);
end;
v15.render = function(v25) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v26) --[[ Line: 100 ]]
        -- upvalues: v25 (copy)
        return v25:renderWithSelectionCursor(v26);
    end);
end;
v15.didUpdate = function(v27) --[[ Line: 105 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Otter_0 (copy), v14 (copy)
    local v28 = v27.props.checked and 1 or 0;
    v27.motor:setGoal(l_Otter_0.spring(v28, v14));
end;
v15.willUnmount = function(v29) --[[ Line: 110 ]] --[[ Name: willUnmount ]]
    v29.motor:destroy();
end;
return v15;