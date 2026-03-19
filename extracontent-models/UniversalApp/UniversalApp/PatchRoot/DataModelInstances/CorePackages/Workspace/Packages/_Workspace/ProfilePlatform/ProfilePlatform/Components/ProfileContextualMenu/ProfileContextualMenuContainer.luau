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
return function(_) --[[ Line: 26 ]] --[[ Name: ProfileContextualMenuContainer ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), v17 (copy), v10 (copy), v18 (copy), v9 (copy), v2 (copy), l_FFlagProfileFixMenuNavigation_0 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v5 (copy), l_FFlagProfileContextualMenuDisableFix_0 (copy), l_FFlagProfilePlatformAddTC_0 (copy), l_dependencyArray_0 (copy), v7 (copy), l_FocusNavigableSurfaceWrapper_0 (copy)
    local v23 = l_useScreenSize_0();
    local v24 = l_useNavigation_0();
    local v25 = v24.getParam(v17.Navigation.ON_CLOSE);
    local v26 = v24.getParam(v17.Navigation.GET_ROOT_ELEMENT_REF);
    local v27 = v24.getParam(v17.Navigation.ON_DISMISS_REF);
    local v28 = v26();
    local v29 = if v28 then v28.AbsolutePosition else Vector2.new(0, 0);
    local v30 = v10(v18.Components.Actions) or {};
    local v31 = v9(v18.ButtonSurface.ContextualMenu);
    local l_contextual_0 = v30.contextual;
    local v33, v34 = v2.useState(true);
    local v35 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v34 (copy), v24 (copy), v25 (copy)
        v34(false);
        v24.pop();
        v25();
    end, {
        v24, 
        v25
    });
    local v36 = if l_FFlagProfileFixMenuNavigation_0 then l_useAppFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v5.onRelease(function() --[[ Line: 56 ]]
                    -- upvalues: v35 (copy)
                    v35();
                end)
            }
        }, 
        isAutoFocusRoot = true, 
        isFocusable = v33
    }) else nil;
    v2.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v27 (copy), v35 (copy)
        if not v27 then
            return;
        else
            v27.current = v35;
            return function() --[[ Line: 71 ]]
                -- upvalues: v27 (ref)
                v27.current = nil;
            end;
        end;
    end, {
        v35
    });
    local v41 = v2.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: l_contextual_0 (copy), v31 (copy), l_FFlagProfileContextualMenuDisableFix_0 (ref), l_FFlagProfilePlatformAddTC_0 (ref), v35 (copy)
        if not l_contextual_0 then
            return {};
        else
            local v37 = {};
            for _, v39 in l_contextual_0 do
                local v40 = v31[v39];
                if v40 then
                    table.insert(v37, {
                        text = v40.text, 
                        disabled = if l_FFlagProfileContextualMenuDisableFix_0 then nil else if l_FFlagProfilePlatformAddTC_0 then v40.isDisabled else nil, 
                        isDisabled = if l_FFlagProfileContextualMenuDisableFix_0 then v40.isDisabled else nil, 
                        onActivated = function() --[[ Line: 92 ]] --[[ Name: onActivated ]]
                            -- upvalues: v35 (ref), v40 (copy)
                            v35();
                            v40.onActivated();
                        end
                    });
                end;
            end;
            return v37;
        end;
    end, l_dependencyArray_0(l_contextual_0, v35, v31));
    if l_FFlagProfileFixMenuNavigation_0 then
        return v2.createElement(v7, {
            buttonProps = v41, 
            screenSize = v23, 
            onDismiss = v35, 
            rootElementPosition = v29, 
            rootElementRef = {
                current = v28
            }, 
            isOpen = v33, 
            menuRef = v36
        });
    else
        return (v2.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v5.onRelease(function(v42) --[[ Line: 118 ]]
                        -- upvalues: v35 (copy)
                        v35();
                        v42:cancel();
                    end)
                }
            }
        }, {
            v2.createElement(v7, {
                buttonProps = v41, 
                screenSize = v23, 
                onDismiss = v35, 
                rootElementPosition = v29, 
                rootElementRef = {
                    current = v28
                }, 
                isOpen = v33
            })
        }));
    end;
end;