local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: makeSeeAllTokenMapper ]]
    -- upvalues: l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    return {
        BackgroundTransparency = if not (v5.uiMode == l_UiMode_0.TenFoot) or l_FFlagEnableLeftNavOnConsole_0 then v6.Global.Opacity_100 else v6.Global.Opacity_0
    };
end;