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
local l_useFocusNavigableSurfaceRegistryConnection_0 = v22.useFocusNavigableSurfaceRegistryConnection;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v27 = require(l_script_FirstAncestor_0.Utils.getVRSurfaceGui);
local v28 = require(l_Parent_0.InputHandlers);
local v29 = require(l_Parent_0.ReactFocusNavigation);
local v30 = require(l_script_FirstAncestor_0.Utils.useLogout);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v32 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return v3.memo(function(v33) --[[ Line: 59 ]] --[[ Name: HeaderPopoverMenu ]]
    -- upvalues: l_useTokens_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), v30 (copy), l_useRef_0 (copy), l_VRService_0 (copy), v27 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v29 (copy), v32 (copy), l_useMemo_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v28 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_OverlayProvider_0 (copy), l_Popover_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), l_Radius_0 (copy), l_View_0 (copy), l_Button_0 (copy)
    local v34 = l_useTokens_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v36, v37 = l_useState_0(false);
    local v38, v39 = l_useState_0(false);
    local v40 = v30(v37, v33.LogoutThunk);
    local v41 = l_useRef_0(nil);
    local v42 = if l_VRService_0.VREnabled then v27() else nil;
    l_useFocusNavigableSurfaceRegistryConnection_0(v41 and v41.current, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, v38);
    local v43 = v29.useEventMap(v32, v41);
    local v45 = l_useMemo_0(function() --[[ Line: 79 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v28 (ref), v39 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v28.onRelease(function(v44) --[[ Line: 82 ]]
                    -- upvalues: v39 (ref)
                    v44.cancelled = true;
                    v39(false);
                end)
            }
        };
    end, {
        v39
    });
    local v46 = v29.useEventHandlerMap(v45, v43);
    l_useEffect_0(function() --[[ Line: 92 ]]
        -- upvalues: v41 (copy)
        if v41 and v41.current then
            v41.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            v41.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            v41.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            v41.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            v41.current.SelectionGroup = true;
        end;
    end, {
        v38
    });
    local v48 = l_useCallback_0(function() --[[ Line: 102 ]]
        -- upvalues: v39 (copy)
        v39(function(v47) --[[ Line: 103 ]]
            return not v47;
        end);
    end, {});
    local v49 = l_useCallback_0(function() --[[ Line: 108 ]]
        -- upvalues: v39 (copy)
        v39(false);
    end, {});
    local v50 = l_useCallback_0(function() --[[ Line: 112 ]]
        -- upvalues: v49 (copy), v40 (copy)
        v49();
        v40();
    end, l_dependencyArray_0(v40, v49));
    return v3.createElement(l_OverlayProvider_0, {
        gui = v42
    }, {
        PopoverMenu = v3.createElement(l_Popover_0.Root, {
            isOpen = v38
        }, {
            Anchor = v3.createElement(l_Popover_0.Anchor, nil, {
                MenuButton = v3.createElement(l_IconButton_0, {
                    icon = l_IconName_0.ThreeDotsVertical, 
                    variant = l_ButtonVariant_0.Utility, 
                    onActivated = v48, 
                    size = l_ButtonSize_0.Medium, 
                    testId = "header-menu-button"
                })
            }), 
            Content = v3.createElement(l_Popover_0.Content, {
                side = {
                    position = l_PopoverSide_0.Bottom, 
                    offset = v34.Padding.Small
                }, 
                align = l_PopoverAlign_0.End, 
                backgroundStyle = v34.Color.Surface.Surface_100, 
                radius = l_Radius_0.Medium, 
                hasArrow = false, 
                onPressedOutside = v49
            }, {
                MenuContent = v3.createElement(l_View_0, {
                    tag = "auto-xy radius-medium bg-surface-100 stroke-standard stroke-default padding-small", 
                    ref = v46
                }, {
                    LogoutButton = v3.createElement(l_Button_0, {
                        text = l_translations_0.logoutButton, 
                        onActivated = v50, 
                        isDisabled = v36, 
                        isLoading = v36, 
                        variant = l_ButtonVariant_0.Utility, 
                        size = l_ButtonSize_0.Small
                    })
                })
            })
        })
    });
end);