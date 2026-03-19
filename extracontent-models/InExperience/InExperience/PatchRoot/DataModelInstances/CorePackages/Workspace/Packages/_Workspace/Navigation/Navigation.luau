local _ = require(script.types);
local v1 = require(script.ViewState);
return {
    canGoBack = require(script.canGoBack), 
    getActiveChildNavigationOptionsRecursively = require(script.getActiveChildNavigationOptionsRecursively), 
    getActiveRoutes = require(script.getActiveRoutes), 
    getCurrentNavigationState = require(script.getCurrentNavigationState), 
    getCurrentRouteKey = require(script.getCurrentRouteKey), 
    getCurrentRouteState = require(script.getCurrentRouteState), 
    getFocusedRoutes = require(script.getFocusedRoutes), 
    getRouteKeyIsInNavigationState = require(script.getRouteKeyIsInNavigationState), 
    getRouteIsActive = require(script.getRouteIsActive), 
    getRouteIsFocused = require(script.getRouteIsFocused), 
    useEarlyIsFocused = require(script.useEarlyIsFocused), 
    useNavigation = require(script.useNavigation), 
    useNavigationFocus = require(script.useNavigationFocus), 
    useRouteName = require(script.useRouteName), 
    useStackScreens = require(script.useStackScreens), 
    TestUtils = require(script.TestUtils), 
    inspectRouteEntry = require(script.inspectRouteEntry), 
    ViewState = v1, 
    ["jest.config"] = script["jest.config"]
};