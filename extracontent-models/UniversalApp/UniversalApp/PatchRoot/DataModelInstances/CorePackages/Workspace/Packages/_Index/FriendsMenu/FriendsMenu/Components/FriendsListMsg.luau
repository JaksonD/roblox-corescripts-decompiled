local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v5 = require(l_script_FirstAncestor_0.utils.getRenameFriendsToConnectionsEnabledFriendsMenu);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
return function(v8) --[[ Line: 18 ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), l_getLocalizedStrings_0 (copy), v2 (copy)
    local v9 = l_useStyle_0();
    local l_Theme_0 = v9.Theme;
    local l_Font_0 = v9.Font;
    local v12 = {
        errorFriendsList = v5() and "Feature.SettingsHub.Label.ConnectionsListLoadErrorMessage" or "Feature.SettingsHub.Label.FriendsListLoadErrorMessage", 
        noResultFriendsList = "Feature.SettingsHub.Label.InviteSearchNoResults"
    };
    local v13 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v14 = l_getLocalizedStrings_0(v12);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Name = v8.msgType
    }, {
        subtitle = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v14[v8.msgType], 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextSize = v13, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            Size = UDim2.new(1, 0, 0, v13), 
            Position = UDim2.new(0, 0, 0.4, 0), 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;