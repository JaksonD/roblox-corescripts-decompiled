local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.TabBar.TabBarMainNavigation);
return function(v7) --[[ Line: 40 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_Focusable_0 (copy), v6 (copy)
    local v8 = l_useStyle_0();
    local l_layoutOrderMain_0 = v7.layoutOrderMain;
    local l_navHeightMain_0 = v7.navHeightMain;
    local l_tabs_0 = v7.tabs;
    local l_selectedTabIndex_0 = v7.selectedTabIndex;
    local l_selectTab_0 = v7.selectTab;
    local v14 = v3.useRef(nil);
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_layoutOrderMain_0
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v8.Tokens.Global.Space_150)
        }), 
        TabBarUnderlinedMainNavigation = v3.createElement(v6, {
            layoutOrder = l_layoutOrderMain_0, 
            navHeight = l_navHeightMain_0, 
            zIndex = 1, 
            tabs = l_tabs_0, 
            selectedTabIndex = l_selectedTabIndex_0, 
            selectTab = l_selectTab_0, 
            mainNavigationRef = v14, 
            NextSelectionDown = v7.NextSelectionDown, 
            NextSelectionUp = v7.NextSelectionUp
        })
    });
end;