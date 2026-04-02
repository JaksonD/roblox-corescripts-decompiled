local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_Parent_0.React);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useMemo_0 = v3.useMemo;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local v9 = require(l_Parent_0.Foundation);
local l_Button_0 = v9.Button;
local l_ButtonSize_0 = v9.Enums.ButtonSize;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_IconButton_0 = v9.IconButton;
local l_IconName_0 = v9.Enums.IconName;
local l_OverlayProvider_0 = v9.OverlayProvider;
local l_PopoverSide_0 = v9.Enums.PopoverSide;
local l_PopoverAlign_0 = v9.Enums.PopoverAlign;
local l_Popover_0 = v9.Popover;
local l_Radius_0 = v9.Enums.Radius;
local l_useTokens_0 = v9.Hooks.useTokens;
local l_View_0 = v9.View;
local v22 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v22.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v22.FocusNavigationEventNameEnum;
local l_useAppFocusRoot_0 = v22.useAppFocusRoot;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v22.useFocusNavigableSurfaceRegistryConnection;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v28 = require(l_script_FirstAncestor_0.Utils.getVRSurfaceGui);
local v29 = require(l_Parent_0.InputHandlers);
local v30 = require(l_Parent_0.ReactFocusNavigation);
local v31 = require(l_script_FirstAncestor_0.Utils.useLogout);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagNapLogoutFocusFix);
local v35 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return v3.memo(function(v36) --[[ Line: 64 ]] --[[ Name: HeaderPopoverMenu ]]
    -- upvalues: l_useTokens_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), v31 (copy), l_useRef_0 (copy), l_VRService_0 (copy), v28 (copy), l_useMemo_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy), v34 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useCallback_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), v30 (copy), v35 (copy), l_useEffect_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_OverlayProvider_0 (copy), l_Popover_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), l_Radius_0 (copy), l_View_0 (copy), l_Button_0 (copy)
    local v37 = l_useTokens_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v39, v40 = l_useState_0(false);
    local v41, v42 = l_useState_0(false);
    local v43 = v31(v40, v36.LogoutThunk);
    local v44 = l_useRef_0(nil);
    local v45 = if l_VRService_0.VREnabled then v28() else nil;
    local v47 = l_useMemo_0(function() --[[ Line: 76 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v42 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v46) --[[ Line: 79 ]]
                    -- upvalues: v42 (ref)
                    v46.cancelled = true;
                    v42(false);
                end)
            }
        };
    end, {
        v42
    });
    local v48 = nil;
    local v49 = nil;
    if v34 then
        local v50 = l_useAppFocusRoot_0({
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
            isFocusable = v41, 
            customEventHandlers = v47
        });
        local l_v50_0 = v50 --[[ copy: 13 -> 16 ]];
        v48 = l_useCallback_0(function(v52) --[[ Line: 102 ]]
            -- upvalues: v44 (copy), l_v50_0 (copy)
            v44.current = v52;
            if type(l_v50_0) == "function" then
                l_v50_0(v52);
            end;
        end, {
            v50
        });
    else
        l_useFocusNavigableSurfaceRegistryConnection_0(v44 and v44.current, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, v41);
        local v53 = v30.useEventMap(v35, v44);
        v49 = v30.useEventHandlerMap(v47, v53);
    end;
    l_useEffect_0(function() --[[ Line: 121 ]]
        -- upvalues: v44 (copy)
        if v44 and v44.current then
            v44.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            v44.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            v44.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            v44.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            v44.current.SelectionGroup = true;
        end;
    end, {
        v41
    });
    local v55 = l_useCallback_0(function() --[[ Line: 131 ]]
        -- upvalues: v42 (copy)
        v42(function(v54) --[[ Line: 132 ]]
            return not v54;
        end);
    end, {});
    local v56 = l_useCallback_0(function() --[[ Line: 137 ]]
        -- upvalues: v42 (copy)
        v42(false);
    end, {});
    local v57 = l_useCallback_0(function() --[[ Line: 142 ]]
        -- upvalues: v56 (copy), v43 (copy)
        v56();
        v43();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v43, 
        v56
    } else l_dependencyArray_0(v43, v56));
    return v3.createElement(l_OverlayProvider_0, {
        gui = v45
    }, {
        PopoverMenu = v3.createElement(l_Popover_0.Root, {
            isOpen = v41
        }, {
            Anchor = v3.createElement(l_Popover_0.Anchor, nil, {
                MenuButton = v3.createElement(l_IconButton_0, {
                    icon = l_IconName_0.ThreeDotsVertical, 
                    variant = l_ButtonVariant_0.Utility, 
                    onActivated = v55, 
                    size = l_ButtonSize_0.Medium, 
                    testId = "header-menu-button"
                })
            }), 
            Content = v3.createElement(l_Popover_0.Content, {
                side = {
                    position = l_PopoverSide_0.Bottom, 
                    offset = v37.Padding.Small
                }, 
                align = l_PopoverAlign_0.End, 
                backgroundStyle = v37.Color.Surface.Surface_100, 
                radius = l_Radius_0.Medium, 
                hasArrow = false, 
                onPressedOutside = v56
            }, {
                MenuContent = v3.createElement(l_View_0, {
                    tag = "auto-xy radius-medium bg-surface-100 stroke-standard stroke-default padding-small", 
                    ref = if v34 then v48 else v49
                }, {
                    LogoutButton = v3.createElement(l_Button_0, {
                        text = l_translations_0.logoutButton, 
                        onActivated = v57, 
                        isDisabled = v39, 
                        isLoading = v39, 
                        variant = l_ButtonVariant_0.Utility, 
                        size = l_ButtonSize_0.Small
                    })
                })
            })
        })
    });
end);