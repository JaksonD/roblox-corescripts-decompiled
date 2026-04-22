local l_Parent_0 = script.Parent;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
local l_FFlagEnableHomeRobloxLogo_0 = require(l_Parent_0.SharedFlags).FFlagEnableHomeRobloxLogo;
return {
    Components = {
        FlyoutSidePanelComponent = l_createLazyComponent_0(function() --[[ Line: 8 ]]
            return require(script.Components.FlyoutSidePanelComponent);
        end), 
        FlyoutProfileCard = l_createLazyComponent_0(function() --[[ Line: 11 ]]
            return require(script.Components.FlyoutProfileCard);
        end), 
        FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader), 
        FlyoutStatusListener = if l_FFlagEnableHomeRobloxLogo_0 then nil else require(script.Components.FlyoutStatusListener)
    }, 
    Utils = {
        shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
    }, 
    FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl)
};