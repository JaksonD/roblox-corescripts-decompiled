local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v9 = l_Images_0["icons/menu/friends_large"];
return function() --[[ Line: 21 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_getLocalizedStrings_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v9 (copy)
    local v10 = l_useStyle_0();
    local l_Theme_0 = v10.Theme;
    local l_Font_0 = v10.Font;
    local v13 = {
        noFriendsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.SettingsHub.Label.NoFriendsPageMessage" or "Feature.SettingsHub.Label.NoConnectionsPageMessage"
    };
    local v14 = l_getLocalizedStrings_0(v13);
    local v15 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, -20), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Name = "EmptyFriendsList"
    }, {
        listLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        }), 
        friendsIcon = v1.createElement(l_ImageSetLabel_0, {
            Image = v9, 
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        subtitle = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v14.noFriendsText, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextSize = v15, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v15), 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;