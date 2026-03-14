local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v2.t;
local l_Roact_0 = v2.Roact;
local v5 = require(script.Parent.CloseMenuButton);
local v6 = require(script.Parent.GameIconButton);
local v7 = l_Roact_0.PureComponent:extend("SystemMenuButton");
v7.validateProps = l_t_0.strictInterface({
    on = l_t_0.optional(l_t_0.boolean), 
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    onClose = l_t_0.callback, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v7.defaultProps = {
    on = false, 
    canCaptureFocus = false
};
v7.tryCaptureFocus = function(v8, v9) --[[ Line: 28 ]] --[[ Name: tryCaptureFocus ]]
    -- upvalues: l_GuiService_0 (copy)
    if v8.props.canCaptureFocus and not v9.canCaptureFocus or v8.props.canCaptureFocus and v8.props.on ~= v9.on and v8.state.isIconFocused then
        l_GuiService_0.SelectedCoreObject = v8.iconRef:getValue();
    end;
end;
v7.init = function(v10) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v10.iconRef = l_Roact_0.createRef();
    v10:setState({
        isIconFocused = false
    });
    v10.onIconSelectionGained = function() --[[ Line: 44 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isIconFocused = true
        });
    end;
    v10.onIconSelectionLost = function() --[[ Line: 50 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isIconFocused = false
        });
    end;
end;
v7.didMount = function(v11) --[[ Line: 57 ]] --[[ Name: didMount ]]
    v11:tryCaptureFocus({
        canCaptureFocus = false
    });
end;
v7.didUpdate = function(v12, v13) --[[ Line: 62 ]] --[[ Name: didUpdate ]]
    v12:tryCaptureFocus(v13);
end;
v7.render = function(v14) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v5 (copy), v6 (copy)
    if v14.props.on then
        return l_Roact_0.createElement(v5, {
            onActivated = v14.props.onClose, 
            layoutOrder = v14.props.layoutOrder, 
            AnchorPoint = v14.props.anchorPoint, 
            Position = v14.props.position, 
            onSelectionGained = v14.onIconSelectionGained, 
            onSelectionLost = v14.onIconSelectionLost, 
            [l_Roact_0.Ref] = v14.iconRef
        });
    else
        return l_Roact_0.createElement(v6, {
            onActivated = v14.props.onActivated, 
            layoutOrder = v14.props.layoutOrder, 
            anchorPoint = v14.props.anchorPoint, 
            position = v14.props.position, 
            onSelectionGained = v14.onIconSelectionGained, 
            onSelectionLost = v14.onIconSelectionLost, 
            [l_Roact_0.Ref] = v14.iconRef
        });
    end;
end;
return v7;