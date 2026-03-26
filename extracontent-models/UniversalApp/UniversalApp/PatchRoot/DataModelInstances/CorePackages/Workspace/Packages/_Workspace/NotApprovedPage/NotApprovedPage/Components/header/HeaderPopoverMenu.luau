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
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagNapLogoutFocusFix);
local v34 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return v3.memo(function(v35) --[[ Line: 62 ]] --[[ Name: HeaderPopoverMenu ]]
    -- upvalues: l_useTokens_0 (copy), l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), v31 (copy), l_useRef_0 (copy), l_VRService_0 (copy), v28 (copy), l_useMemo_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy), v33 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useCallback_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), v30 (copy), v34 (copy), l_useEffect_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_OverlayProvider_0 (copy), l_Popover_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), l_Radius_0 (copy), l_View_0 (copy), l_Button_0 (copy)
    local v36 = l_useTokens_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v38, v39 = l_useState_0(false);
    local v40, v41 = l_useState_0(false);
    local v42 = v31(v39, v35.LogoutThunk);
    local v43 = l_useRef_0(nil);
    local v44 = if l_VRService_0.VREnabled then v28() else nil;
    local v46 = l_useMemo_0(function() --[[ Line: 74 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v41 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v45) --[[ Line: 77 ]]
                    -- upvalues: v41 (ref)
                    v45.cancelled = true;
                    v41(false);
                end)
            }
        };
    end, {
        v41
    });
    local v47 = nil;
    local v48 = nil;
    if v33 then
        local v49 = l_useAppFocusRoot_0({
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
            isFocusable = v40, 
            customEventHandlers = v46
        });
        local l_v49_0 = v49 --[[ copy: 13 -> 16 ]];
        v47 = l_useCallback_0(function(v51) --[[ Line: 100 ]]
            -- upvalues: v43 (copy), l_v49_0 (copy)
            v43.current = v51;
            if type(l_v49_0) == "function" then
                l_v49_0(v51);
            end;
        end, {
            v49
        });
    else
        l_useFocusNavigableSurfaceRegistryConnection_0(v43 and v43.current, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, v40);
        local v52 = v30.useEventMap(v34, v43);
        v48 = v30.useEventHandlerMap(v46, v52);
    end;
    l_useEffect_0(function() --[[ Line: 119 ]]
        -- upvalues: v43 (copy)
        if v43 and v43.current then
            v43.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
            v43.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
            v43.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
            v43.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
            v43.current.SelectionGroup = true;
        end;
    end, {
        v40
    });
    local v54 = l_useCallback_0(function() --[[ Line: 129 ]]
        -- upvalues: v41 (copy)
        v41(function(v53) --[[ Line: 130 ]]
            return not v53;
        end);
    end, {});
    local v55 = l_useCallback_0(function() --[[ Line: 135 ]]
        -- upvalues: v41 (copy)
        v41(false);
    end, {});
    local v56 = l_useCallback_0(function() --[[ Line: 139 ]]
        -- upvalues: v55 (copy), v42 (copy)
        v55();
        v42();
    end, l_dependencyArray_0(v42, v55));
    return v3.createElement(l_OverlayProvider_0, {
        gui = v44
    }, {
        PopoverMenu = v3.createElement(l_Popover_0.Root, {
            isOpen = v40
        }, {
            Anchor = v3.createElement(l_Popover_0.Anchor, nil, {
                MenuButton = v3.createElement(l_IconButton_0, {
                    icon = l_IconName_0.ThreeDotsVertical, 
                    variant = l_ButtonVariant_0.Utility, 
                    onActivated = v54, 
                    size = l_ButtonSize_0.Medium, 
                    testId = "header-menu-button"
                })
            }), 
            Content = v3.createElement(l_Popover_0.Content, {
                side = {
                    position = l_PopoverSide_0.Bottom, 
                    offset = v36.Padding.Small
                }, 
                align = l_PopoverAlign_0.End, 
                backgroundStyle = v36.Color.Surface.Surface_100, 
                radius = l_Radius_0.Medium, 
                hasArrow = false, 
                onPressedOutside = v55
            }, {
                MenuContent = v3.createElement(l_View_0, {
                    tag = "auto-xy radius-medium bg-surface-100 stroke-standard stroke-default padding-small", 
                    ref = if v33 then v47 else v48
                }, {
                    LogoutButton = v3.createElement(l_Button_0, {
                        text = l_translations_0.logoutButton, 
                        onActivated = v56, 
                        isDisabled = v38, 
                        isLoading = v38, 
                        variant = l_ButtonVariant_0.Utility, 
                        size = l_ButtonSize_0.Small
                    })
                })
            })
        })
    });
end);