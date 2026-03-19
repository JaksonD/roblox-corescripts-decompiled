local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_Parent_0.NavigationRodux);
local v6 = require(script.Parent.FlyoutHamburgerButton);
local v7 = require(script.Parent.Parent.Constants);
local l_FFlagAppIaHomeSubTab_0 = require(l_Parent_0.SharedFlags).FFlagAppIaHomeSubTab;
return function(v9) --[[ Line: 26 ]] --[[ Name: FlyoutLeftHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_AppPage_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v5 (copy), v1 (copy), v2 (copy), v6 (copy), v7 (copy)
    local v10 = l_useTokens_0();
    local l_Size_500_0 = v10.Size.Size_500;
    local v12 = true;
    if v9.routeName ~= l_AppPage_0.Home then
        v12 = l_FFlagAppIaHomeSubTab_0 and v9.routeName == v5.Constants.HomeContainerName;
    end;
    local v13 = "auto-xy row align-x-left align-y-center";
    if v9.isAlternateEntryPointEnabled then
        v13 = v13 .. " gap-small";
    end;
    return v1.createElement(v2.View, {
        tag = v13
    }, {
        FlyoutHamburgerButton = v1.createElement(v6, {
            titleText = v9.titleText, 
            LayoutOrder = 1, 
            isAlternateEntryPointEnabled = v9.isAlternateEntryPointEnabled
        }), 
        TitleOrRobloxLogoFrame = if v9.isRobloxLogoEnabled and v12 then v1.createElement(v2.Image, {
            LayoutOrder = 2, 
            tag = "size-full-full", 
            Image = "icons/logo/letterform", 
            imageStyle = v10.Color.Content.Emphasis, 
            Size = UDim2.fromOffset(l_Size_500_0 * v7.ROBLOX_LOGO_ASPECT_RATIO, l_Size_500_0)
        }) else if v9.titleText then v1.createElement(v2.Text, {
            tag = "auto-xy text-heading-large content-emphasis", 
            LayoutOrder = 2, 
            Text = v9.titleText
        }) else nil
    });
end;