local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.Banner.BannerContainer);
local v4 = require(l_Modules_0.LuaApp.Components.Banner.useShowSecurityBanner);
local v5 = require(l_Modules_0.LuaApp.Components.Banner.useShowSiteMessageBanner);
local v6 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAvailability);
local l_ApiFetchOmniRecommendations_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations;
local l_useClientCacheFallbackBannerConfig_0 = v6.useClientCacheFallbackBannerConfig;
return function(v9) --[[ Line: 13 ]] --[[ Name: useBannerContainer ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), l_useClientCacheFallbackBannerConfig_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), v3 (copy)
    local v10, v11 = v2.useState(Vector2.zero);
    local v12 = v4();
    local v13 = v5();
    local v14 = l_useClientCacheFallbackBannerConfig_0(l_ApiFetchOmniRecommendations_0);
    if v9 then
        v13 = false;
    end;
    return v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v3 (ref), v13 (ref), v12 (copy), v14 (copy), v11 (copy)
        return v2.createElement(v3, {
            showSiteMessageBanner = v13, 
            showSecurityBanner = v12, 
            clientCacheFallbackBannerConfig = v14, 
            onSizeChanged = v11
        });
    end, {
        v12, 
        v13, 
        v14, 
        v10
    }), v10.Y;
end;