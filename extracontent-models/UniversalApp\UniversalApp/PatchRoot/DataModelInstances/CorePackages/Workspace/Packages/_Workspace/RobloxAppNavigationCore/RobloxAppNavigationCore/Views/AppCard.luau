local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local l_SceneView_0 = require(l_Parent_0.RoactNavigation).SceneView;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v3.FocusNavigableSurfaceWrapper;
local v5 = require(l_Parent_0.Navigation);
local l_useEarlyIsFocused_0 = v5.useEarlyIsFocused;
local l_getCurrentRouteKey_0 = v5.getCurrentRouteKey;
local l_getRouteKeyIsInNavigationState_0 = v5.getRouteKeyIsInNavigationState;
local l_ReactProfiler_0 = require(l_Parent_0.RoactUtils).Profiling.ReactProfiler;
local l_FFlagLuaAppEnablePageLoadTracker_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePageLoadTracker;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_ComponentTracker_0 = require(l_Parent_0.PageLoadTracker).ComponentTracker;
local v13 = v1.createContext({});
local function _(v14, v15) --[[ Line: 36 ]] --[[ Name: getIsSelectionFocusable ]]
    -- upvalues: l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy)
    local v16 = l_getCurrentRouteKey_0(v14);
    if v15.options.hasSubNavigation and v16 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v16, v15.state));
    else
        return v16 == v15.key;
    end;
end;
return function(v18) --[[ Line: 44 ]] --[[ Name: AppCard ]]
    -- upvalues: l_useEarlyIsFocused_0 (copy), l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy), v1 (copy), l_ReactProfiler_0 (copy), v13 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagLuaAppEnablePageLoadTracker_0 (copy), l_ComponentTracker_0 (copy), l_SceneView_0 (copy)
    local l_descriptor_0 = v18.descriptor;
    local l_navigation_0 = l_descriptor_0.navigation;
    local v21 = l_useEarlyIsFocused_0() and v18.isActive;
    local v22 = l_getCurrentRouteKey_0(l_navigation_0);
    local v23 = if l_descriptor_0.options.hasSubNavigation and v22 ~= nil then l_getRouteKeyIsInNavigationState_0(v22, l_descriptor_0.state) else v22 == l_descriptor_0.key;
    v22 = l_navigation_0.state.routeName or "UnknownRoute";
    return v1.createElement(l_ReactProfiler_0, {
        id = v22
    }, {
        DescriptorContext = v1.createElement(v13.Provider, {
            value = v18.descriptor
        }, {
            FocusRoot = v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
                isFocusable = v21 and v23, 
                surfaceIdentifier = v3.FocusNavigableSurfaceIdentifierEnum.RouterView, 
                shouldRestoreFocus = true, 
                frameProps = {
                    SelectionGroup = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v18.descriptor.options.hasSelectionGroup else nil, 
                    Visible = v18.isVisible, 
                    ZIndex = v18.ZIndex
                }
            }, if l_FFlagLuaAppEnablePageLoadTracker_0 then {
                ComponentTracker = v1.createElement(l_ComponentTracker_0, {
                    componentName = ("Page-%*"):format(v22), 
                    isActive = v18.isActive
                }, {
                    SceneView = v1.createElement(l_SceneView_0, {
                        navigation = l_navigation_0, 
                        component = l_descriptor_0.getComponent(), 
                        screenProps = v18.screenProps
                    })
                })
            } else {
                SceneView = v1.createElement(l_SceneView_0, {
                    navigation = l_navigation_0, 
                    component = l_descriptor_0.getComponent(), 
                    screenProps = v18.screenProps
                })
            })
        })
    });
end;