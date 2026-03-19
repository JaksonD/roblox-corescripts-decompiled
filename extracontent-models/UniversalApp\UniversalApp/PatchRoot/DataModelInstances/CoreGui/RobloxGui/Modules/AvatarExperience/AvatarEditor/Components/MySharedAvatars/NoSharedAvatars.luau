local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_FlexLayout_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(_) --[[ Line: 26 ]] --[[ Name: NoSharedAvatars ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_useNavigation_0 (copy), v3 (copy), v15 (copy), l_AvatarScreen_0 (copy), l_FlexLayout_0 (copy), l_Focusable_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v17 = l_useStyle_0();
    local v18 = l_useDesignTokens_0();
    local v19 = l_useLocalization_0({
        shareAvatarMsg = "Feature.Avatar.Message.ShareAvatarWithCommunity", 
        shareCurrentAvatar = "Feature.Avatar.Action.ShareCurrentAvatar"
    });
    local v21 = l_useSelector_0(function(v20) --[[ Line: 33 ]]
        return v20.Navigation.history;
    end);
    local v22 = l_useNavigation_0();
    local l_Font_0 = v17.Font;
    local l_Theme_0 = v17.Theme;
    local v25 = v3.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v15 (ref), v22 (copy), l_AvatarScreen_0 (ref), v21 (copy)
        v15.closeMySharedAvatars(v22);
        v22.navigate(l_AvatarScreen_0.LookComposerPage, {
            prevNavPage = l_AvatarScreen_0.AvatarEditor, 
            prevNavHistory = v21
        });
    end, {
        v22, 
        v21
    });
    return v3.createElement(l_FlexLayout_0, {
        padding = {
            top = v18.Global.Space_600
        }, 
        flexSlot = v3.createElement(l_Focusable_0.Frame, {
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v18.Global.Space_250)
            }), 
            NoSharedAvatarPrompt = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                Font = l_Font_0.Header1.Font, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextTransparency = l_Theme_0.IconEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = true, 
                Text = v19.shareAvatarMsg
            }), 
            CreateAvatarButton = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                BorderSizePixel = 0, 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = "", 
                LayoutOrder = 2, 
                [v3.Event.Activated] = v25
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v18.Global.Size_600)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v18.Global.Space_125)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v18.Global.Space_250), 
                    PaddingRight = UDim.new(0, v18.Global.Space_250), 
                    PaddingTop = UDim.new(0, v18.Global.Space_125), 
                    PaddingBottom = UDim.new(0, v18.Global.Space_125)
                }), 
                PlusIcon = v3.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_Images_0["icons/common/plus"], 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 36, 0, 36)
                }), 
                Text = v3.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 2, 
                    LayoutOrder = 2, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                    TextTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                    TextTruncate = Enum.TextTruncate.None, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextWrapped = false, 
                    Text = v19.shareCurrentAvatar
                })
            })
        })
    });
end;