local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v6 = require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.api);
local v7 = require(l_Modules_0.LuaApp.Components.ProfileQRCodePage.ProfileQRCodeUniversalAppWrapper);
local l_TitleKey_0 = v6.TitleKey;
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
return function(v11) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v10 (copy), v7 (copy), v9 (copy), l_TitleKey_0 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local v13 = {
        playEmote = true, 
        renderContent = function(v12) --[[ Line: 22 ]] --[[ Name: renderContent ]]
            -- upvalues: v3 (ref), v10 (ref), v7 (ref), v9 (ref), v11 (copy)
            return v3.createElement(v10, {
                includeStatusBar = true, 
                BackgroundTransparency = 1
            }, {
                QRCode = v3.createElement(v7, v9.Dictionary.join(v11, v12))
            });
        end, 
        title = l_TitleKey_0, 
        isTopBarVisible = false
    };
    return v5(l_AvatarScreen_0.AvatarBackground, "QRCode", v13);
end;