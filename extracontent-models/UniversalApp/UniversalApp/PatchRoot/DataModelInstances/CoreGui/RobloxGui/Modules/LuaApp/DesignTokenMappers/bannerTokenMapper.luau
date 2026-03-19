local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = game:DefineFastFlag("StaticSMBannerTheme", false);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v7, v8) --[[ Line: 41 ]] --[[ Name: makeBannerTokens ]]
    -- upvalues: v5 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v4 (copy)
    local v9 = 0;
    local v10 = 0;
    local v11 = 0;
    local v12 = 0;
    local v13 = 0;
    local v14 = {
        autoButtonColor = true, 
        height = v8.Global.Size_500
    };
    local v15 = {
        autoButtonColor = true, 
        height = v8.Global.Size_200, 
        typography = v8.Semantic.Typography.Body, 
        textColor = if v5 then v8.Global.Color.White else v8.Semantic.Color.Text.Emphasis, 
        verticalPadding = 5, 
        horizontalPadding = 15, 
        backgroundColor = v8.Global.Color.Graphite
    };
    if v7.uiMode == l_UiMode_0.TenFoot and not l_FFlagEnableLeftNavOnConsole_0 then
        v14 = v4.Dictionary.join(v14, {
            autoButtonColor = false, 
            cornerRadius = UDim.new(0, v8.Semantic.Radius.Medium), 
            height = v8.Global.Size_600, 
            strokeColor = v8.Semantic.Color.Common.Divider
        });
        v15 = v4.Dictionary.join(v15, {
            autoButtonColor = false, 
            cornerRadius = UDim.new(0, v8.Semantic.Radius.Medium), 
            height = v8.Global.Size_400, 
            strokeColor = v8.Semantic.Color.Common.Badge, 
            verticalPadding = v8.Global.Space_50, 
            horizontalPadding = v8.Global.Space_100
        });
        v9 = v8.Global.Space_200;
        v10 = v8.Global.Space_300;
        v11 = v8.Global.Space_200;
        v12 = v8.Global.Space_800;
        v13 = v8.Global.Space_800;
    end;
    return {
        verticalPadding = v9, 
        topMargin = v10, 
        bottomMargin = v11, 
        leftMargin = v12, 
        rightMargin = v13, 
        siteMessageBanner = v15, 
        securityBanner = v14
    };
end;