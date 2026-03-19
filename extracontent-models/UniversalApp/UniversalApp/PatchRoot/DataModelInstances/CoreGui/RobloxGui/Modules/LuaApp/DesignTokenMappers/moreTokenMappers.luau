local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v4) --[[ Line: 10 ]]
    return {
        PageTopMargin = v4.Global.Space_150, 
        BackgroundGradientOffset = v4.Global.Space_800, 
        SafeAreaMargin = Vector2.new(v4.Global.Space_800, v4.Global.Space_300), 
        ContentMargin = Vector2.new(0, 136), 
        TitleHeight = v4.Global.Size_500, 
        TileSize = Vector2.new(400, 400), 
        ButtonSize = Vector2.new(1024, v4.Global.Size_600), 
        QrSize = 200, 
        LicensePanelWidthScale = 0.6, 
        UserIconSize = v4.Semantic.Icon.Size.Medium, 
        UsernameTextFont = v4.Semantic.Typography.Subheader, 
        UsernameTextStyle = {
            Color = v4.Semantic.Color.Text.Default.Color3, 
            Transparency = v4.Semantic.Color.Text.Default.Transparency
        }, 
        NavigationItemIconStyle = {
            Color = v4.Semantic.Color.Icon.Emphasis.Color3, 
            Transparency = v4.Semantic.Color.Icon.Emphasis.Transparency
        }, 
        NavigationItemTitleStyle = {
            Color = v4.Semantic.Color.Text.Emphasis.Color3, 
            Transparency = v4.Semantic.Color.Text.Emphasis.Transparency
        }, 
        NavigationItemTitleFont = v4.Semantic.Typography.Subheader, 
        DisconnectTextFont = v4.Semantic.Typography.Subheader
    };
end;