local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local _ = require(script.Parent.Parent.UserSearchTile.useSearchTileButtons);
return function(v7) --[[ Line: 22 ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_ImageSetButton_0 (copy), l_ImageSetLabel_0 (copy)
    local v8 = l_useStyle_0();
    local l_searchTileButtonProps_0 = v7.searchTileButtonProps;
    local v10 = l_searchTileButtonProps_0.imageColor or v8.Theme.SystemPrimaryContent.Color;
    local v11 = l_searchTileButtonProps_0.backgroundColor or v8.Theme.SystemPrimaryDefault.Color;
    return v1.createElement(l_ImageSetButton_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v11, 
        BackgroundTransparency = if l_searchTileButtonProps_0.isDisabled then v8.Theme.Overlay.Transparency else v8.Theme.SystemPrimaryDefault.Transparency, 
        [v1.Event.Activated] = l_searchTileButtonProps_0.onActivated
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Layout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v8.Tokens.Global.Size_175, 0, v8.Tokens.Global.Size_175), 
            BackgroundTransparency = 1, 
            Image = l_searchTileButtonProps_0.icon, 
            ImageColor3 = v10, 
            ImageTransparency = if l_searchTileButtonProps_0.isDisabled then v8.Theme.Overlay.Transparency else v8.Theme.SystemPrimaryContent.Transparency
        })
    });
end;