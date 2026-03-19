local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: makeAppTokens ]]
    -- upvalues: l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v8 = v6.uiMode == l_UiMode_0.TenFoot;
    local v9 = if not v8 or l_FFlagEnableLeftNavOnConsole_0 then v7.Semantic.Color.Background.Default.Transparency else v7.Global.Opacity_0;
    local v10 = {
        dampingRatio = 1, 
        frequency = 3
    };
    local v11 = if v8 then Vector2.new(v7.Global.Space_800, v7.Global.Space_300) else Vector2.zero;
    return {
        Page = {
            BackgroundColor = v7.Semantic.Color.Background.Default.Color3, 
            BackgroundTransparency = v9, 
            SafeAreaMargin = v11, 
            ScrollAnimationConfig = v10
        }
    };
end;