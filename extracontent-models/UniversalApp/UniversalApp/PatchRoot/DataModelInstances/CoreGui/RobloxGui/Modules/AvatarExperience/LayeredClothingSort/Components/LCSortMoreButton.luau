local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v10 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = UDim.new(0, 10);
local v13 = l_Images_0["icons/menu/more_off"];
local v14 = v3.PureComponent:extend("LCSortMoreButton");
v14.validateProps = v4.strictInterface({
    Visible = v4.union(v4.boolean, v4.table), 
    ZIndex = v4.number, 
    asset = v4.table, 
    onUnequip = v4.optional(v4.callback), 
    navigation = v4.table
});
v14.init = function(v15) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy)
    v15.menuRef = v3.createRef();
    v15.contextMenuOpen = function() --[[ Line: 43 ]]
        -- upvalues: v15 (copy), l_AvatarScreen_0 (ref)
        v15.props.navigation.navigate(l_AvatarScreen_0.LCSortContextMenu, {
            asset = v15.props.asset, 
            tilePositionY = v15.menuRef:getValue() and v15.menuRef:getValue().AbsolutePosition.Y or 0, 
            onUnequip = v15.props.onUnequip
        });
    end;
end;
v14.render = function(v16) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v10 (copy), v12 (copy), l_ImageSetLabel_0 (copy), v13 (copy)
    return l_withStyle_0(function(v17) --[[ Line: 53 ]]
        -- upvalues: v3 (ref), v10 (ref), v16 (copy), v12 (ref), l_ImageSetLabel_0 (ref), v13 (ref)
        local l_Theme_0 = v17.Theme;
        return v3.createElement("TextButton", {
            Text = "", 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromOffset(v10.Tile.ContextWidth - v10.Tile.ShownContextWidth, 0), 
            Size = UDim2.new(0, v10.Tile.ContextWidth, 1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            ZIndex = v16.props.ZIndex, 
            Visible = v16.props.Visible, 
            [v3.Event.Activated] = v16.contextMenuOpen, 
            [v3.Ref] = v16.menuRef
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v12
            }), 
            ImageSetLabel = v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(v10.Tile.MoreIconSize, v10.Tile.MoreIconSize), 
                Position = UDim2.new(0.5, -4, 0.5, 0), 
                BackgroundTransparency = 1, 
                Image = v13, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            })
        });
    end);
end;
return (l_withNavigation_0(v14));