local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
return function(v7) --[[ Line: 19 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_getLocalizedStrings_0 (copy), v1 (copy)
    local v8 = l_useStyle_0();
    local l_Theme_0 = v8.Theme;
    local l_Font_0 = v8.Font;
    local v11 = {
        errorFriendsList = l_FFlagConnectionsToFriendsRename_0 and "Feature.SettingsHub.Label.FriendsListLoadErrorMessage" or "Feature.SettingsHub.Label.ConnectionsListLoadErrorMessage", 
        noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults"
    };
    local v12 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v13 = l_getLocalizedStrings_0(v11);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Name = v7.msgType
    }, {
        subtitle = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v13[v7.msgType], 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextSize = v12, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            Size = UDim2.new(1, 0, 0, v12), 
            Position = UDim2.new(0, 0, 0.4, 0), 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;