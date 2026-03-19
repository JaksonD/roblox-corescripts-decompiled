local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.FocusNavigation);
local v2 = require(script.FocusNavigationContext);
local v3 = require(script.useActiveEventMap);
local v4 = require(script.useFocusedGuiObject);
local v5 = require(script.useFocusGuiObject);
local v6 = require(script.useEventMap);
local v7 = require(script.useEventHandler);
local v8 = require(script.useEventHandlerMap);
local v9 = require(script.useContainerFocusBehavior);
local v10 = require(script.useDispatchSyntheticEvent);
local v11 = require(script.FocusBehaviorHooks);
return {
    FocusNavigationService = v1.FocusNavigationService, 
    EngineInterface = v1.EngineInterface, 
    FocusNavigationContext = v2, 
    useActiveEventMap = v3, 
    useFocusedGuiObject = v4, 
    useFocusGuiObject = v5, 
    useEventMap = v6, 
    useEventHandler = v7, 
    useEventHandlerMap = v8, 
    useContainerFocusBehavior = v9, 
    useDefaultFocusBehavior = v11.useDefaultFocusBehavior, 
    useMostRecentFocusBehavior = v11.useMostRecentFocusBehavior, 
    useMostRecentOrDefaultFocusBehavior = v11.useMostRecentOrDefaultFocusBehavior, 
    useDispatchSyntheticEvent = v10
};