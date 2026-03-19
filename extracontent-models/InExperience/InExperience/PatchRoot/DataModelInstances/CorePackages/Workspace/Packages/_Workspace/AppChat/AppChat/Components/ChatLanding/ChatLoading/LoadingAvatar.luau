local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_Skeleton_0 = v4.Skeleton;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v9 = v1.PureComponent:extend("LoadingAvatar");
local v10 = game:DefineFastFlag("AppChatLoadingIndicatorTransparency", false);
v9.defaultProps = {
    avatarImage = l_Images_0["component_assets/circle_49_mask"], 
    cellHeight = 64, 
    avatarSize = 36, 
    LayoutOrder = 0
};
v9.render = function(v11) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v10 (copy), l_ImageSetLabel_0 (copy)
    local v12 = v11.props.cellHeight / 2 - v11.props.avatarSize / 2;
    return l_withStyle_0(function(v13) --[[ Line: 28 ]]
        -- upvalues: v1 (ref), v11 (copy), l_Skeleton_0 (ref), v12 (copy), l_Radius_0 (ref), v10 (ref), l_ImageSetLabel_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(0, v11.props.cellHeight, 0, v11.props.cellHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v11.props.LayoutOrder, 
            BorderSizePixel = 0
        }, {
            avatarShimmer = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v11.props.avatarSize, v11.props.avatarSize), 
                Position = UDim2.fromOffset(v12, v12), 
                radius = l_Radius_0.Circle
            }), 
            avatarMask = if v10 then nil else v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(v11.props.avatarSize, v11.props.avatarSize), 
                Position = UDim2.fromOffset(v12, v12), 
                Image = v11.props.avatarImage, 
                BackgroundTransparency = 1, 
                ImageColor3 = v13.Theme.BackgroundDefault.Color
            })
        });
    end);
end;
return v9;