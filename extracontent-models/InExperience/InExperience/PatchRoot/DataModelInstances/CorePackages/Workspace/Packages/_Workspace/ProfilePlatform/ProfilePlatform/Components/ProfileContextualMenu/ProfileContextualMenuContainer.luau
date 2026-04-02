local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.InputHandlers);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local v7 = require(script.Parent.ProfileContextualMenu);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
local v10 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useNavigation_0 = v4.useNavigation;
local l_FocusNavigableSurfaceWrapper_0 = v6.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v6.FocusNavigationEventNameEnum;
local l_useAppFocusRoot_0 = v6.useAppFocusRoot;
local v17 = require(l_script_FirstAncestor_0.Common.Constants);
local v18 = require(l_script_FirstAncestor_0.Common.Enums);
local l_FFlagProfilePlatformAddTC_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformAddTC;
local l_FFlagProfileContextualMenuDisableFix_0 = require(l_Parent_0.SharedFlags).FFlagProfileContextualMenuDisableFix;
local l_FFlagProfileFixMenuNavigation_0 = require(l_Parent_0.SharedFlags).FFlagProfileFixMenuNavigation;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(_) --[[ Line: 28 ]] --[[ Name: ProfileContextualMenuContainer ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), v17 (copy), v10 (copy), v18 (copy), v9 (copy), v2 (copy), l_FFlagProfileFixMenuNavigation_0 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v5 (copy), l_FFlagProfileContextualMenuDisableFix_0 (copy), l_FFlagProfilePlatformAddTC_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v7 (copy), l_FocusNavigableSurfaceWrapper_0 (copy)
    local v24 = l_useScreenSize_0();
    local v25 = l_useNavigation_0();
    local v26 = v25.getParam(v17.Navigation.ON_CLOSE);
    local v27 = v25.getParam(v17.Navigation.GET_ROOT_ELEMENT_REF);
    local v28 = v25.getParam(v17.Navigation.ON_DISMISS_REF);
    local v29 = v27();
    local v30 = if v29 then v29.AbsolutePosition else Vector2.new(0, 0);
    local v31 = v10(v18.Components.Actions) or {};
    local v32 = v9(v18.ButtonSurface.ContextualMenu);
    local l_contextual_0 = v31.contextual;
    local v34, v35 = v2.useState(true);
    local v36 = v2.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v35 (copy), v25 (copy), v26 (copy)
        v35(false);
        v25.pop();
        v26();
    end, {
        v25, 
        v26
    });
    local v37 = if l_FFlagProfileFixMenuNavigation_0 then l_useAppFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v5.onRelease(function() --[[ Line: 58 ]]
                    -- upvalues: v36 (copy)
                    v36();
                end)
            }
        }, 
        isAutoFocusRoot = true, 
        isFocusable = v34
    }) else nil;
    v2.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v28 (copy), v36 (copy)
        if not v28 then
            return;
        else
            v28.current = v36;
            return function() --[[ Line: 73 ]]
                -- upvalues: v28 (ref)
                v28.current = nil;
            end;
        end;
    end, {
        v36
    });
    local v42 = v2.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: l_contextual_0 (copy), v32 (copy), l_FFlagProfileContextualMenuDisableFix_0 (ref), l_FFlagProfilePlatformAddTC_0 (ref), v36 (copy)
        if not l_contextual_0 then
            return {};
        else
            local v38 = {};
            for _, v40 in l_contextual_0 do
                local v41 = v32[v40];
                if v41 then
                    table.insert(v38, {
                        text = v41.text, 
                        disabled = if l_FFlagProfileContextualMenuDisableFix_0 then nil else if l_FFlagProfilePlatformAddTC_0 then v41.isDisabled else nil, 
                        isDisabled = if l_FFlagProfileContextualMenuDisableFix_0 then v41.isDisabled else nil, 
                        onActivated = function() --[[ Line: 95 ]] --[[ Name: onActivated ]]
                            -- upvalues: v36 (ref), v41 (copy)
                            v36();
                            v41.onActivated();
                        end
                    });
                end;
            end;
            return v38;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_contextual_0, 
        v36, 
        v32
    } else l_dependencyArray_0(l_contextual_0, v36, v32));
    if l_FFlagProfileFixMenuNavigation_0 then
        return v2.createElement(v7, {
            buttonProps = v42, 
            screenSize = v24, 
            onDismiss = v36, 
            rootElementPosition = v30, 
            rootElementRef = {
                current = v29
            }, 
            isOpen = v34, 
            menuRef = v37
        });
    else
        return (v2.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v5.onRelease(function(v43) --[[ Line: 125 ]]
                        -- upvalues: v36 (copy)
                        v36();
                        v43:cancel();
                    end)
                }
            }
        }, {
            v2.createElement(v7, {
                buttonProps = v42, 
                screenSize = v24, 
                onDismiss = v36, 
                rootElementPosition = v30, 
                rootElementRef = {
                    current = v29
                }, 
                isOpen = v34
            })
        }));
    end;
end;