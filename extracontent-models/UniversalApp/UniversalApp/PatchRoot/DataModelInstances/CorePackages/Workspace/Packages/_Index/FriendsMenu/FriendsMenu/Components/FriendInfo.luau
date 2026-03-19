local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_Skeleton_0 = v4.Skeleton;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local _ = require(l_Parent_0.NotificationsCommon);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v17 = {
    online = "Common.Presence.Label.Online", 
    inStudio = "Common.Presence.Label.RobloxStudio"
};
local v18 = l_Images_0["icons/logo/studiologo_small"];
local function _(v19, v20) --[[ Line: 34 ]]
    -- upvalues: l_UserModel_0 (copy)
    if v19.presence == l_UserModel_0.PresenceType.IN_GAME then
        return v19.lastLocation;
    elseif v19.presence == l_UserModel_0.PresenceType.ONLINE then
        return v20.online;
    elseif v19.presence == l_UserModel_0.PresenceType.IN_STUDIO then
        return v20.inStudio;
    else
        return "@" .. v19.name;
    end;
end;
return function(v22) --[[ Line: 55 ]]
    -- upvalues: l_useStyle_0 (copy), l_getLocalizedStrings_0 (copy), v17 (copy), l_UserModel_0 (copy), v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), v18 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v23 = l_useStyle_0();
    local l_Theme_0 = v23.Theme;
    local l_Font_0 = v23.Font;
    local v26 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v27 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
    local v28 = l_getLocalizedStrings_0(v17);
    local l_friend_0 = v22.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v30 = l_friend_0.presence == l_UserModel_0.PresenceType.IN_STUDIO;
    return v2.createElement("Frame", {
        Position = v22.position, 
        Size = v22.size, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIFlexItem = v2.createElement("UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Shrink
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12)
        }), 
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        DisplayName = v22.isFetchingFriendsNames and v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(0, 120, 0, 10), 
            radius = l_Radius_0.Small, 
            LayoutOrder = 1
        }) or v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v26), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = l_friend_0.displayName, 
            TextSize = v26, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            Font = l_Font_0.Header2.Font, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            LayoutOrder = 1
        }), 
        UserContextContainer = v22.isFetchingFriendsNames and v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(0, 80, 0, 10), 
            radius = l_Radius_0.Small, 
            LayoutOrder = 2
        }) or v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, v27), 
            ClipsDescendants = true
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            StudioImage = v30 and v2.createElement(l_ImageSetLabel_0, {
                Image = v18, 
                ImageColor3 = l_Theme_0.TextDefault.Color, 
                ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v27, 0, v27), 
                LayoutOrder = 1
            }), 
            UserContext = v2.createElement("TextLabel", {
                Size = UDim2.new(1, -v27, 0, v27), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = if l_friend_0.presence == l_UserModel_0.PresenceType.IN_GAME then l_friend_0.lastLocation else if l_friend_0.presence == l_UserModel_0.PresenceType.ONLINE then v28.online else if l_friend_0.presence == l_UserModel_0.PresenceType.IN_STUDIO then v28.inStudio else "@" .. l_friend_0.name, 
                TextSize = v27, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.CaptionBody.Font, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                LayoutOrder = 2, 
                OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            })
        })
    });
end;