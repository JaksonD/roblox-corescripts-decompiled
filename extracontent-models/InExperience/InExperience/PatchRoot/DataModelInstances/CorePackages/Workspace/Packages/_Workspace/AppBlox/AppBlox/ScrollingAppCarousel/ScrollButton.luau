local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.t);
local l_withStyle_0 = v2.Core.Style.withStyle;
local l_getIconSize_0 = v2.App.ImageSet.getIconSize;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v9 = v1.PureComponent:extend("ScrollButton");
v9.validateProps = v3.strictInterface({
    icon = v3.table, 
    callback = v3.callback
});
v9.render = function(v10) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v11) --[[ Line: 25 ]]
        -- upvalues: v1 (ref), l_Interactable_0 (ref), v10 (copy), l_ImageSetLabel_0 (ref), l_getIconSize_0 (ref), l_IconSize_0 (ref)
        return v1.createElement(l_Interactable_0, {
            AutoButtonColor = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v11.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v11.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            [v1.Event.Activated] = v10.props.callback, 
            onStateChanged = function() --[[ Line: 34 ]] --[[ Name: onStateChanged ]]

            end
        }, {
            Icon = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(l_getIconSize_0(l_IconSize_0.Medium), l_getIconSize_0(l_IconSize_0.Medium)), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v10.props.icon, 
                ImageColor3 = v11.Theme.IconEmphasis.Color, 
                ImageTransparency = v11.Theme.IconEmphasis.Transparency
            })
        });
    end);
end;
return v9;