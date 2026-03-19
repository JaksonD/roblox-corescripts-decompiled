local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v5 = require(l_script_FirstAncestor_0.utils.getRenameFriendsToConnectionsEnabledFriendsMenu);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v10 = l_Images_0["icons/menu/friends_large"];
return function() --[[ Line: 20 ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), l_getLocalizedStrings_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v10 (copy)
    local v11 = l_useStyle_0();
    local l_Theme_0 = v11.Theme;
    local l_Font_0 = v11.Font;
    local v14 = {
        noFriendsText = v5() and "Feature.SettingsHub.Label.NoConnectionsPageMessage" or "Feature.SettingsHub.Label.NoFriendsPageMessage"
    };
    local v15 = l_getLocalizedStrings_0(v14);
    local v16 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, -20), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Name = "EmptyFriendsList"
    }, {
        listLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        friendsIcon = v2.createElement(l_ImageSetLabel_0, {
            Image = v10, 
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        subtitle = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v15.noFriendsText, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextSize = v16, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v16), 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;