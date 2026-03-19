local l_Parent_0 = script.Parent;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
return {
    Components = {
        FlyoutSidePanelComponent = l_createLazyComponent_0(function() --[[ Line: 6 ]]
            return require(script.Components.FlyoutSidePanelComponent);
        end), 
        FlyoutProfileCard = l_createLazyComponent_0(function() --[[ Line: 9 ]]
            return require(script.Components.FlyoutProfileCard);
        end), 
        FlyoutLeftHeader = require(script.Components.FlyoutLeftHeader), 
        FlyoutStatusListener = require(script.Components.FlyoutStatusListener)
    }, 
    Utils = {
        shouldShowLeftHeader = require(script.Utils.shouldShowLeftHeader)
    }, 
    FlyoutScrollAwayControl = require(script.FlyoutScrollAwayControl)
};