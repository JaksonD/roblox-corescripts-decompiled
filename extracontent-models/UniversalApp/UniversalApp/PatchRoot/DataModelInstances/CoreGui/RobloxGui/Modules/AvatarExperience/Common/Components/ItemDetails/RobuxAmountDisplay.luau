local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_RoactFitComponents_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v10 = v1.PureComponent:extend("RobuxAmountDisplay");
local v11 = l_Images_0["icons/common/robux"];
v10.validateProps = v2.strictInterface({
    robuxAmountText = v2.string, 
    iconSize = v2.number, 
    textSize = v2.number, 
    padding = v2.number, 
    showRobuxIcon = v2.optional(v2.boolean)
});
v10.defaultProps = {
    showRobuxIcon = true
};
v10.render = function(v12) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_FitFrameHorizontal_0 (copy), l_ImageSetLabel_0 (copy), v11 (copy), l_FitTextLabel_0 (copy)
    return l_withStyle_0(function(v13) --[[ Line: 34 ]]
        -- upvalues: v1 (ref), l_FitFrameHorizontal_0 (ref), v12 (copy), l_ImageSetLabel_0 (ref), v11 (ref), l_FitTextLabel_0 (ref)
        local l_Theme_0 = v13.Theme;
        local l_Font_0 = v13.Font;
        return v1.createElement(l_FitFrameHorizontal_0, {
            height = UDim.new(1, 0), 
            contentPadding = UDim.new(0, v12.props.padding), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Icon = v1.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v12.props.iconSize, v12.props.iconSize), 
                Image = v11, 
                ImageColor3 = l_Theme_0.TextDefault.Color, 
                ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                Visible = v12.props.showRobuxIcon
            }), 
            Text = v1.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                LayoutOrder = 2, 
                Text = v12.props.robuxAmountText, 
                Font = l_Font_0.Body.Font, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v12.props.textSize, 
                BackgroundTransparency = 1
            })
        });
    end);
end;
return v10;