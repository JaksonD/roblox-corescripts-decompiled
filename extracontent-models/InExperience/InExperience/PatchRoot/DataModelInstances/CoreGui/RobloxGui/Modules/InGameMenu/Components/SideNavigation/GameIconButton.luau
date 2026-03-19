local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local l_UIBlox_0 = v1.UIBlox;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Components.GameIcon);
local v10 = UDim.new(0, 8);
local v11 = l_Roact_0.PureComponent:extend("GameIconButton");
v11.validateProps = l_t_0.strictInterface({
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
v11.renderWithSelectionCursor = function(v12, v13) --[[ Line: 30 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_Roact_0 (copy), l_CursorKind_0 (copy), v9 (copy), v10 (copy)
    return l_Roact_0.createElement("TextButton", {
        Text = "", 
        AnchorPoint = v12.props.anchorPoint, 
        BackgroundTransparency = 1, 
        Position = v12.props.position, 
        Size = UDim2.fromOffset(32, 32), 
        LayoutOrder = v12.props.layoutOrder, 
        SelectionImageObject = v13(l_CursorKind_0.RoundedRect), 
        [l_Roact_0.Event.Activated] = v12.props.onActivated, 
        [l_Roact_0.Event.SelectionGained] = v12.props.onSelectionGained, 
        [l_Roact_0.Event.SelectionLost] = v12.props.onSelectionLost, 
        [l_Roact_0.Ref] = v12.props.forwardRef
    }, {
        GameIconButton = l_Roact_0.createElement(v9, {
            gameId = game.GameId, 
            iconSize = 32, 
            cornerRadius = v10
        })
    });
end;
v11.render = function(v14) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v15) --[[ Line: 54 ]]
        -- upvalues: v14 (copy)
        return v14:renderWithSelectionCursor(v15);
    end);
end;
return l_Roact_0.forwardRef(function(v16, v17) --[[ Line: 59 ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v11, l_Cryo_0.Dictionary.join(v16, {
        forwardRef = v17
    }));
end);