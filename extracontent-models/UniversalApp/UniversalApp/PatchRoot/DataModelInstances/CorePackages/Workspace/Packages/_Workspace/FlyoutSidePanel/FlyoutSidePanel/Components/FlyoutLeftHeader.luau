local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_Parent_0.NavigationRodux);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v7 = require(script.Parent.FlyoutHamburgerButton);
local v8 = require(script.Parent.Parent.Constants);
local v9 = game:DefineFastFlag("EnableHomeBetaBadge", false);
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagAppIaHomeSubTab_0 = v10.FFlagAppIaHomeSubTab;
local l_FFlagEnableCoreContentBadge_0 = v10.FFlagEnableCoreContentBadge;
local l_FFlagEnableHomeRobloxLogo_0 = v10.FFlagEnableHomeRobloxLogo;
return function(v14) --[[ Line: 32 ]] --[[ Name: FlyoutLeftHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagEnableCoreContentBadge_0 (copy), l_useAppPolicy_0 (copy), l_AppPage_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v5 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), v1 (copy), v2 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v15 = l_useTokens_0();
    local l_Size_500_0 = v15.Size.Size_500;
    local v18 = if l_FFlagEnableCoreContentBadge_0 then l_useAppPolicy_0(function(v17) --[[ Line: 37 ]]
        return v17.getCoreContentBadgeText();
    end) else nil;
    local v19 = if l_FFlagEnableCoreContentBadge_0 then v18 and v18 ~= "" else false;
    local v20 = true;
    if v14.routeName ~= l_AppPage_0.Home then
        v20 = l_FFlagAppIaHomeSubTab_0 and v14.routeName == v5.Constants.HomeContainerName;
    end;
    local v21 = "auto-xy row align-x-left align-y-center";
    if l_FFlagEnableHomeRobloxLogo_0 or v14.isAlternateEntryPointEnabled then
        v21 = v21 .. " gap-small";
    end;
    return v1.createElement(v2.View, {
        tag = v21
    }, {
        FlyoutHamburgerButton = if not l_FFlagEnableHomeRobloxLogo_0 or v14.isFlyoutEntrypointEnabled then v1.createElement(v7, {
            titleText = v14.titleText, 
            LayoutOrder = 1, 
            isAlternateEntryPointEnabled = v14.isAlternateEntryPointEnabled
        }) else nil, 
        TitleOrRobloxLogoFrame = if (not not l_FFlagEnableHomeRobloxLogo_0 or v14.isRobloxLogoEnabled) and v20 then v1.createElement(v2.Image, {
            LayoutOrder = 2, 
            tag = "size-full-full", 
            Image = "icons/logo/letterform", 
            imageStyle = v15.Color.Content.Emphasis, 
            Size = UDim2.fromOffset(l_Size_500_0 * v8.ROBLOX_LOGO_ASPECT_RATIO, l_Size_500_0)
        }) else if v14.titleText then v1.createElement(v2.Text, {
            tag = "auto-xy text-heading-large content-emphasis", 
            LayoutOrder = 2, 
            Text = v14.titleText
        }) else nil, 
        CoreContentBadge = if l_FFlagEnableCoreContentBadge_0 and (l_FFlagEnableHomeRobloxLogo_0 or v14.isRobloxLogoEnabled) and v20 and v19 then v1.createElement(v2.View, {
            tag = "auto-xy bg-system-contrast padding-x-xsmall padding-y-xxsmall radius-small", 
            LayoutOrder = 3
        }, {
            Text = v1.createElement(v2.Text, {
                Text = v18, 
                tag = "auto-xy text-title-small", 
                textStyle = v15.Color.Surface.Surface_0
            })
        }) else nil, 
        BetaBadge = if v9 and v14.isRobloxLogoEnabled and v20 then v1.createElement(v2.View, {
            LayoutOrder = 4, 
            tag = "auto-xy padding-xxsmall stroke-standard stroke-emphasis radius-small"
        }, {
            Text = v1.createElement(v2.Text, {
                Text = "Beta", 
                tag = "auto-xy text-body-small content-emphasis"
            })
        }) else nil
    });
end;