local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_withNavigationFocus_0 = v9.withNavigationFocus;
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local v13 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_Focusable_0 = v12.Focusable;
local v15 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v18.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local v21 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v18.FocusNavigationEventNameEnum;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_useFocusGuiObject_0 = v21.useFocusGuiObject;
local v27 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad");
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusRecovery);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GetFFlagLuafiedReportEntryPoints_0 = v4.GetFFlagLuafiedReportEntryPoints;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v37 = game:DefineFastFlag("AXOverlayShouldNotAutofocusForNonDirectionalInput", false);
local v38 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v44(v39, v40) --[[ Line: 60 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v21 (copy), v38 (copy), v8 (copy), l_FocusNavigationEventNameEnum_0 (copy), v22 (copy)
    local v41 = v21.useEventMap(v38, v39);
    local v43 = v8.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v22 (ref), v40 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v22.onRelease(function(v42) --[[ Line: 65 ]]
                    -- upvalues: v40 (ref)
                    v42.cancelled = true;
                    v40();
                end)
            }
        };
    end, {
        v40
    });
    return v21.useEventHandlerMap(v43, v41);
end;
local v45 = v7.PureComponent:extend("OverlayFocusHandler");
v45.validateProps = v15.strictInterface({
    overlayComponent = v15.union(v15.table, v15.callback), 
    arguments = v15.table, 
    focusNavigationRef = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v15.table else nil, 
    navigation = v15.table, 
    isFocused = v15.boolean, 
    forwardRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v15.optional(v15.any) else nil
});
v45.init = function(v46) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v12 (copy), v7 (copy), v24 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        v46:setState({
            gamepadFocused = false, 
            lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
        });
    end;
    v46.mounted = false;
    v46.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v12.createFocusController();
    v46.defaultChildRef = v7.createRef();
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v46.onFocusChanged = function(v48) --[[ Line: 107 ]]
            -- upvalues: v46 (copy)
            if v46.mounted then
                v46:setState({
                    gamepadFocused = v48
                });
            end;
        end;
    end;
    v46.closePrompt = function() --[[ Line: 116 ]]
        -- upvalues: v24 (ref), v46 (copy)
        v24.closeOverlay(v46.props.navigation);
    end;
end;
v45.didMount = function(v49) --[[ Line: 121 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy)
    v49.mounted = true;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v49:handleUpdate(v6.Dictionary.join(v49.props, {
            isFocused = false
        }), v49.state);
    end;
end;
v45.willUnmount = function(v50) --[[ Line: 134 ]] --[[ Name: willUnmount ]]
    v50.mounted = false;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v45.didUpdate = function(v51, v52, v53) --[[ Line: 138 ]] --[[ Name: didUpdate ]]
        v51:handleUpdate(v52, v53);
    end;
    v45.cancelCaptureFocus = function(v54) --[[ Line: 142 ]] --[[ Name: cancelCaptureFocus ]]
        if v54.captureFocusPromise then
            v54.captureFocusPromise:cancel();
            v54.captureFocusPromise = nil;
        end;
    end;
    v45.captureFocusAfterDelay = function(v55, v56) --[[ Line: 149 ]] --[[ Name: captureFocusAfterDelay ]]
        -- upvalues: v5 (copy)
        v55:cancelCaptureFocus();
        v55.captureFocusPromise = v5.delay(v56):andThen(v55.focusController.captureFocus);
    end;
    v45.handleUpdate = function(v57, v58, v59) --[[ Line: 154 ]] --[[ Name: handleUpdate ]]
        -- upvalues: v27 (copy)
        local l_lastInputIsGamepad_0 = v57.state.lastInputIsGamepad;
        local l_lastInputIsGamepad_1 = v59.lastInputIsGamepad;
        local v62 = l_lastInputIsGamepad_0 and v57.props.isFocused;
        local v63 = not l_lastInputIsGamepad_1 and l_lastInputIsGamepad_0;
        local v64 = l_lastInputIsGamepad_1 and not l_lastInputIsGamepad_0;
        local v65 = not v58.isFocused and v57.props.isFocused;
        if v62 and (v65 or v63) then
            v27:trace("captureFocus [Overlay], navigatedToPage: {}, acquiredGamepadInput: {}", v65, v63);
            v57.focusController.captureFocus();
            return;
        else
            if v64 then
                v27:trace("releaseFocus [Overlay]");
                v57.focusController.releaseFocus();
            end;
            return;
        end;
    end;
end;
v45.getChildren = function(v66) --[[ Line: 176 ]] --[[ Name: getChildren ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v7 (copy), v17 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_IsVRAppBuild_0 (copy), v29 (copy), v30 (copy)
    local l_overlayComponent_0 = v66.props.overlayComponent;
    local l_arguments_0 = v66.props.arguments;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        l_arguments_0 = if l_arguments_0.focusController then v6.Dictionary.join(l_arguments_0, {
            defaultChildRef = v66.defaultChildRef
        }) else v6.Dictionary.join(l_arguments_0, {
            defaultChildRef = v66.defaultChildRef, 
            focusController = v66.focusController
        });
    end;
    local v69 = v7.createElement(l_overlayComponent_0, l_arguments_0);
    return {
        NavigationEventsLogger = v7.createElement(v17, {
            pageName = "[Overlay]"
        }), 
        LastInputTypeChangedConnection = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v70) --[[ Line: 202 ]] --[[ Name: callback ]]
                -- upvalues: l_isGamepadInput_0 (ref), v66 (copy)
                local v71 = l_isGamepadInput_0(v70);
                if v71 ~= v66.state.lastInputIsGamepad then
                    v66:setState({
                        lastInputIsGamepad = v71
                    });
                end;
            end
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_IsVRAppBuild_0() then nil else v7.createElement(v29), 
        GamepadFocusRecovery = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.createElement(v30, {
            focusController = v66.focusController, 
            isGamepadInput = v66.state.lastInputIsGamepad, 
            debugName = "[Overlay]"
        }), 
        OverlayScreen = v69
    };
end;
v45.render = function(v72) --[[ Line: 225 ]] --[[ Name: render ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v7 (copy), v31 (copy), l_AvatarScreenProperties_0 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v12 (copy)
    if l_IsVRAppBuild_0() then
        local l_routeName_0 = v72.props.navigation.state.routeName;
        return v7.createElement(v31, {
            panelPlacement = l_AvatarScreenProperties_0[l_routeName_0].VRPanelPlacement, 
            roundedCornersFrame = if l_GetFFlagLuafiedReportEntryPoints_0() then l_AvatarScreenProperties_0[l_routeName_0].VRPanelRoundedCorners else false
        }, v72:getChildren());
    else
        return v7.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            [v7.Ref] = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v72.props.forwardRef else nil, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            SelectionBehaviorLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.focusController, 
            onFocusChanged = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.onFocusChanged, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.defaultChildRef, 
            [v7.Ref] = v72.props.focusNavigationRef, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then nil else {
                closePrompt = v12.Input.onBegin(Enum.KeyCode.ButtonB, v72.closePrompt)
            }
        }, v72:getChildren());
    end;
end;
if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then
    v45 = l_withNavigationFocus_0(v45);
    return function(v74) --[[ Line: 263 ]]
        -- upvalues: l_useNavigation_0 (copy), v8 (copy), v24 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v44 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useFocusGuiObject_0 (copy), v37 (copy), v13 (copy), v45 (ref), v6 (copy)
        local v75 = l_useNavigation_0();
        local v76 = v8.useCallback(function() --[[ Line: 265 ]]
            -- upvalues: v24 (ref), v75 (copy)
            v24.closeOverlay(v75);
        end, {
            v75
        });
        local v77 = v8.useRef(nil);
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            l_useFocusNavigableSurfaceRegistryConnection_0(v77.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
        end;
        local v78 = v44(v77, v76);
        local v79 = l_useTableWrappedCallbackRef_0(v78);
        local v80 = l_useFocusGuiObject_0();
        local v81 = if v37 then v13.usePreferredInput() == v13.Input.Directional else nil;
        v8.useEffect(function() --[[ Line: 282 ]]
            -- upvalues: v37 (ref), v77 (copy), v81 (copy), v80 (copy)
            if if v37 then v77.current and v81 else v77.current then
                task.delay(0.1, function() --[[ Line: 287 ]]
                    -- upvalues: v80 (ref), v77 (ref)
                    v80(v77.current);
                end);
            end;
        end, {
            v80, 
            if v37 then v81 else nil
        });
        return v8.createElement(v45, v6.Dictionary.join(v74, {
            focusNavigationRef = v79
        }));
    end;
else
    return l_withNavigationFocus_0(v45);
end;