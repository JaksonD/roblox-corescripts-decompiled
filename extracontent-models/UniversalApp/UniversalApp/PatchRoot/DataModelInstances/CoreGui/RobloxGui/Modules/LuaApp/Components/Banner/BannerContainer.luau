local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local l_useUiModeInfo_0 = v5.useUiModeInfo;
local l_UiMode_0 = v4.UiMode;
local v9 = require(l_Modules_0.LuaApp.Components.SiteMessageBanner);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.PromptBannerV2);
local l_ClientCacheFallbackBanner_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAvailability).ClientCacheFallbackBanner;
local function v16(...) --[[ Line: 32 ]] --[[ Name: hasMultipleBanners ]]
    local v12 = {
        ...
    };
    local v13 = 0;
    for _, v15 in v12 do
        if v15 then
            v13 = v13 + 1;
        end;
    end;
    return v13 > 1;
end;
return function(v17) --[[ Line: 43 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v16 (copy), v2 (copy), l_useProperty_0 (copy), v9 (copy), v10 (copy), l_ClientCacheFallbackBanner_0 (copy)
    local v18 = l_useDesignTokens_0();
    local v19 = l_useUiModeInfo_0().uiMode ~= l_UiMode_0.TenFoot;
    local l_Banner_0 = v18.LuaApps.Banner;
    local l_showSecurityBanner_0 = v17.showSecurityBanner;
    local l_showSiteMessageBanner_0 = v17.showSiteMessageBanner;
    local v23 = v17.clientCacheFallbackBannerConfig and v17.clientCacheFallbackBannerConfig.shouldShowBanner or false;
    local l_securityBanner_0 = l_Banner_0.securityBanner;
    local l_siteMessageBanner_0 = l_Banner_0.siteMessageBanner;
    local v26 = if l_showSecurityBanner_0 then l_securityBanner_0.height or 0 else 0;
    local v27 = l_siteMessageBanner_0.height or 0;
    local v28 = if v16(l_showSecurityBanner_0, l_showSiteMessageBanner_0, v23) then l_Banner_0.verticalPadding else 0;
    local v29 = v2.useRef(nil);
    local v30 = l_useProperty_0(v29, "AbsoluteSize");
    local l_onSizeChanged_0 = v17.onSizeChanged;
    v2.useLayoutEffect(function() --[[ Line: 69 ]]
        -- upvalues: l_onSizeChanged_0 (copy), v30 (copy)
        if l_onSizeChanged_0 and v30 then
            l_onSizeChanged_0(v30);
        end;
    end, {
        v30, 
        l_onSizeChanged_0
    });
    return v2.createElement("Frame", {
        Size = v17.Size or UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v17.Position, 
        BackgroundTransparency = 1, 
        ref = v29
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v28)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Banner_0.leftMargin), 
            PaddingRight = UDim.new(0, l_Banner_0.rightMargin), 
            PaddingTop = UDim.new(0, l_Banner_0.topMargin), 
            PaddingBottom = UDim.new(0, l_Banner_0.bottomMargin)
        }), 
        SiteMessageBanner = if l_showSiteMessageBanner_0 then v2.createElement(v9, {
            Size = UDim2.new(1, 0, 0, v27), 
            LayoutOrder = 1
        }) else nil, 
        AccountSecurityPromptBanner = v2.createElement(v10, {
            isInteractive = v19, 
            Size = UDim2.new(1, 0, 0, v26), 
            LayoutOrder = 2
        }), 
        ClientCacheFallbackBanner = if v23 and v17.clientCacheFallbackBannerConfig then v2.createElement(l_ClientCacheFallbackBanner_0, {
            LayoutOrder = 3, 
            onRefreshButtonClick = v17.clientCacheFallbackBannerConfig.onRefreshButtonClick
        }) else nil
    });
end;