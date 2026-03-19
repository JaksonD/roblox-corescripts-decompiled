local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.Types);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v3.App.ImageSet.getIconSize;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local function _(v13) --[[ Line: 30 ]] --[[ Name: getIconForModerationStatus ]]
    -- upvalues: v7 (copy)
    if v13 == v7.ModerationStatus.PendingModeration then
        return "icons/status/pending_small";
    elseif v13 == v7.ModerationStatus.Moderated then
        return "icons/actions/info_small";
    else
        return nil;
    end;
end;
local function _(v15) --[[ Line: 40 ]] --[[ Name: getDangerStyleForModerationStatus ]]
    -- upvalues: v7 (copy)
    if v15 == v7.ModerationStatus.Moderated then
        return true;
    else
        return false;
    end;
end;
return function(v17) --[[ Line: 48 ]] --[[ Name: ModerationStatusPill ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v7 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v18 = l_useStyle_0();
    local l_Theme_0 = v18.Theme;
    local l_Space_150_0 = v18.Tokens.Global.Space_150;
    local l_Space_75_0 = v18.Tokens.Global.Space_75;
    local l_Space_75_1 = v18.Tokens.Global.Space_75;
    local l_Space_125_0 = v18.Tokens.Global.Space_125;
    local v24 = l_useLocalization_0({
        moderated = "Feature.Catalog.Message.AvatarModerationModerated", 
        underReview = "Feature.Catalog.Message.AvatarModerationPending"
    });
    local l_moderationStatus_0 = v17.moderationStatus;
    local v26 = l_moderationStatus_0 == v7.ModerationStatus.PendingModeration and "icons/status/pending_small" or l_moderationStatus_0 == v7.ModerationStatus.Moderated and "icons/actions/info_small" or nil;
    local v27 = l_moderationStatus_0 == v7.ModerationStatus.Moderated;
    local v28 = if l_moderationStatus_0 == v7.ModerationStatus.Moderated then v24.moderated else v24.underReview;
    if v26 == nil then
        return nil;
    else
        local l_Font_0 = v18.Font;
        local v30 = l_getIconSize_0(l_IconSize_0.Small);
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local v32 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BackgroundTransparency = v17.hideBackground and 1 or 0.5, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            Position = UDim2.new(0, 0, 0, l_Space_125_0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Space_150_0), 
                PaddingRight = UDim.new(0, l_Space_150_0), 
                PaddingTop = UDim.new(0, l_Space_75_0), 
                PaddingBottom = UDim.new(0, l_Space_75_0)
            }), 
            Content = v2.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, l_Space_75_1), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(v30, v30), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0[v26], 
                    ImageColor3 = if v27 then l_Theme_0.Alert.Color else l_Theme_0.IconEmphasis.Color, 
                    ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                }), 
                PillText = if v17.iconOnly then nil else v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextSize = v32, 
                    Text = v28, 
                    Font = l_Font_0.CaptionHeader.Font, 
                    BackgroundTransparency = 1, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextColor3 = if v27 then l_Theme_0.Alert.Color else l_Theme_0.IconEmphasis.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
    end;
end;