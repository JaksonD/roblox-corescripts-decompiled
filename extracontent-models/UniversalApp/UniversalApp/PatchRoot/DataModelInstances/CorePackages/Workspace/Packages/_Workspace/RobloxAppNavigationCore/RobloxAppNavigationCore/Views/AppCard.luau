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
local v13 = game:DefineFastFlag("OnlyActivePageInteractible", false);
local v14 = v1.createContext({});
local function _(v15, v16) --[[ Line: 38 ]] --[[ Name: getIsSelectionFocusable ]]
    -- upvalues: l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy)
    local v17 = l_getCurrentRouteKey_0(v15);
    if v16.options.hasSubNavigation and v17 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v17, v16.state));
    else
        return v17 == v16.key;
    end;
end;
return function(v19) --[[ Line: 46 ]] --[[ Name: AppCard ]]
    -- upvalues: l_useEarlyIsFocused_0 (copy), l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy), v1 (copy), l_ReactProfiler_0 (copy), v14 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v13 (copy), l_FFlagLuaAppEnablePageLoadTracker_0 (copy), l_ComponentTracker_0 (copy), l_SceneView_0 (copy)
    local l_descriptor_0 = v19.descriptor;
    local l_navigation_0 = l_descriptor_0.navigation;
    local v22 = l_useEarlyIsFocused_0() and v19.isActive;
    local v23 = l_getCurrentRouteKey_0(l_navigation_0);
    local v24 = if l_descriptor_0.options.hasSubNavigation and v23 ~= nil then l_getRouteKeyIsInNavigationState_0(v23, l_descriptor_0.state) else v23 == l_descriptor_0.key;
    v23 = l_navigation_0.state.routeName or "UnknownRoute";
    return v1.createElement(l_ReactProfiler_0, {
        id = v23
    }, {
        DescriptorContext = v1.createElement(v14.Provider, {
            value = v19.descriptor
        }, {
            FocusRoot = v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
                isFocusable = v22 and v24, 
                surfaceIdentifier = v3.FocusNavigableSurfaceIdentifierEnum.RouterView, 
                shouldRestoreFocus = true, 
                frameProps = {
                    SelectionGroup = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v19.descriptor.options.hasSelectionGroup else nil, 
                    Visible = v19.isVisible, 
                    ZIndex = v19.ZIndex, 
                    Interactable = not v13 or v19.isActive
                }
            }, if l_FFlagLuaAppEnablePageLoadTracker_0 then {
                ComponentTracker = v1.createElement(l_ComponentTracker_0, {
                    componentName = ("Page-%*"):format(v23), 
                    isActive = v19.isActive
                }, {
                    SceneView = v1.createElement(l_SceneView_0, {
                        navigation = l_navigation_0, 
                        component = l_descriptor_0.getComponent(), 
                        screenProps = v19.screenProps
                    })
                })
            } else {
                SceneView = v1.createElement(l_SceneView_0, {
                    navigation = l_navigation_0, 
                    component = l_descriptor_0.getComponent(), 
                    screenProps = v19.screenProps
                })
            })
        })
    });
end;