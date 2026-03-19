local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v9 = l_Images_0["icons/menu/home_on"];
local v10 = l_Images_0["icons/menu/home_off"];
local v11 = l_Roact_0.PureComponent:extend("HomeButton");
v11.validateProps = l_t_0.strictInterface({
    on = l_t_0.optional(l_t_0.boolean), 
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback
});
v11.defaultProps = {
    on = false
};
v11.renderWithSelectionCursor = function(v12, v13) --[[ Line: 34 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v9 (copy), v10 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), l_CursorKind_0 (copy)
    local v14 = v12.props.on and v9 or v10;
    return l_Roact_0.createElement("Frame", {
        AnchorPoint = v12.props.anchorPoint, 
        BackgroundTransparency = 1, 
        Position = v12.props.position, 
        Size = UDim2.fromOffset(64, 64), 
        LayoutOrder = v12.props.layoutOrder
    }, {
        HomeButton = l_Roact_0.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v14, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(32, 32), 
            SelectionImageObject = v13(l_CursorKind_0.RoundedRect), 
            [l_Roact_0.Event.Activated] = v12.props.onActivated
        })
    });
end;
v11.render = function(v15) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v16) --[[ Line: 56 ]]
        -- upvalues: v15 (copy)
        return v15:renderWithSelectionCursor(v16);
    end);
end;
return v11;