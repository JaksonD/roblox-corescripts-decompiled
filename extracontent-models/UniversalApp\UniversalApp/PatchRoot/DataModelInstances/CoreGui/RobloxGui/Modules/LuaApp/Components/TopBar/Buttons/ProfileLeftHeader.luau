local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v7 = v3.App.ImageSet.Images["icons/logo/letterform"];
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.getIconButtonSize);
local v10 = require(l_Modules_0.LuaApp.Components.Home.HomeUserInfoWidget);
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v12 = game:DefineFastFlag("LuaAppEnableLogoHeaderByDefault", false);
return function(v13) --[[ Line: 32 ]]
    -- upvalues: l_useStyle_0 (copy), v9 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v12 (copy), v1 (copy), v10 (copy), l_ImageSetLabel_0 (copy), v7 (copy), l_StyledTextLabel_0 (copy)
    local v14 = l_useStyle_0();
    local l_Theme_0 = v14.Theme;
    local l_Font_0 = v14.Font;
    local v17 = v9(v13.formFactor);
    local v18 = l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 and l_VerticalEfficiencyExperimentation_0.getIsRobloxLogoHeaderEnabled() or v12;
    local v19 = v17 - v14.Tokens.Global.Space_100;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v17, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        HorizontalLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v14.Tokens.Global.Space_150)
        }), 
        UserAvatar = v1.createElement(v10, {
            sideMargin = 0, 
            shouldOnlyDisplayAvatarIcon = true, 
            onlyAvatarButtonRef = v13.buttonRef
        }), 
        LeftHeader = if v18 then v1.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Image = v7, 
            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
            ImageTransparency = 0, 
            Position = UDim2.fromOffset(24, 24), 
            Size = UDim2.fromOffset(v19 * 5.222222222222222, v19)
        }) else v13.titleText and v1.createElement(l_StyledTextLabel_0, {
            fluidSizing = true, 
            text = v13.titleText, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            fontStyle = l_Font_0.Title, 
            colorStyle = l_Theme_0.TextEmphasis, 
            layoutOrder = 2
        }) or nil
    });
end;