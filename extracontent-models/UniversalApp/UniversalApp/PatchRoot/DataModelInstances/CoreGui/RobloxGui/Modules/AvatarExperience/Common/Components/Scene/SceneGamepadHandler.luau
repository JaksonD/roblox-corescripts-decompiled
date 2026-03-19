local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_CursorKind_0 = v10.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v10.App.SelectionImage.useSelectionCursor;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v16 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v16.useFocusGuiObject;
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v18.FocusNavigationEventNameEnum;
local l_useFocusRegistryEntry_0 = v18.FocusNavigableSurfaceRegistry.useFocusRegistryEntry;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local v23 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v23.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v23.Enums.AvatarScreen;
local v26 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v28 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v29 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v30 = require(l_Modules_0.AvatarExperience.Common.Context.useSceneInteractionCallbacks);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v32 = game:DefineFastFlag("AXAdjustmentFullscreenFix", false);
local v33 = game:DefineFastFlag("AXDisableGamepadPanning", false);
local v34 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXRemoveExtraButtonText", false);
local v35 = game:DefineFastFlag("AXSceneGamepadHandlerOnlySelectDescendantOfGame", false);
local function v47(v36, v37) --[[ Line: 54 ]] --[[ Name: useSceneGamepadHandlerFocusNavigationBindings ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v22 (copy), v16 (copy)
    v6.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: l_RunService_0 (ref), v36 (copy), l_UserInputService_0 (ref)
        local v38 = nil;
        local v40 = l_RunService_0.Heartbeat:Connect(function(v39) --[[ Line: 57 ]]
            -- upvalues: v38 (ref), v36 (ref)
            if v38 then
                if v38.KeyCode == Enum.KeyCode.Thumbstick1 and v36.onPanAvatar then
                    v36.onPanAvatar(v38, v39);
                    return;
                elseif v38.KeyCode == Enum.KeyCode.Thumbstick2 then
                    v36.onRotateAndZoomAvatar(v38, v39);
                end;
            end;
        end);
        local v43 = l_UserInputService_0.InputChanged:Connect(function(v41, _) --[[ Line: 66 ]]
            -- upvalues: v38 (ref)
            if v41.KeyCode == Enum.KeyCode.Thumbstick1 or v41.KeyCode == Enum.KeyCode.Thumbstick2 then
                if v41.UserInputState == Enum.UserInputState.Change then
                    v38 = v41;
                    return;
                elseif v41.UserInputState == Enum.UserInputState.End then
                    v38 = nil;
                end;
            end;
        end);
        return function() --[[ Line: 76 ]]
            -- upvalues: v40 (copy), v43 (copy)
            v40:Disconnect();
            v43:Disconnect();
        end;
    end, {
        v36.onPanAvatar, 
        v36.onRotateAndZoomAvatar
    });
    local v44 = v6.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v36 (copy)
        return {
            [Enum.KeyCode.Thumbstick2] = l_FocusNavigationEventNameEnum_0.RotateAndZoomAvatar, 
            [Enum.KeyCode.Thumbstick1] = l_FocusNavigationEventNameEnum_0.PanAvatar, 
            [Enum.KeyCode.ButtonR3] = if v36.onEnterAvatarFullView then l_FocusNavigationEventNameEnum_0.EnterAvatarFullView else if v36.onExitAvatarFullView then l_FocusNavigationEventNameEnum_0.ExitAvatarFullView else nil, 
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
        };
    end, {
        v36.onEnterAvatarFullView, 
        v36.onExitAvatarFullView
    });
    local v45 = v6.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v22 (ref), v36 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.RotateAndZoomAvatar] = {
                handler = v22.onRelease(function() --[[ Line: 99 ]]

                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.PanAvatar] = if v36.onPanAvatar then {
                handler = v22.onRelease(function() --[[ Line: 106 ]]

                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.EnterAvatarFullView] = if v36.onEnterAvatarFullView then {
                handler = v22.onRelease(v36.onEnterAvatarFullView)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ExitAvatarFullView] = if v36.onExitAvatarFullView then {
                handler = v22.onRelease(v36.onExitAvatarFullView)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = if v36.onGoBack then {
                handler = v22.onRelease(v36.onGoBack)
            } else nil
        };
    end, {
        v36.onRotateAndZoomAvatar, 
        v36.onPanAvatar, 
        v36.onEnterAvatarFullView, 
        v36.onExitAvatarFullView, 
        v36.onGoBack
    });
    local v46 = v16.useEventMap(v44, v37);
    return v16.useEventHandlerMap(v45, v46);
end;
return function(v48) --[[ Line: 146 ]] --[[ Name: SceneGamepadHandler ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useAvatarRoute_0 (copy), l_useRoactService_0 (copy), v26 (copy), v6 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v30 (copy), v29 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_GamepadUtils_0 (copy), l_AvatarScreen_0 (copy), l_useFocusGuiObject_0 (copy), v35 (copy), l_useFocusRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_GuiService_0 (copy), v28 (copy), v27 (copy), v47 (copy), v32 (copy), v33 (copy), v5 (copy), l_Focusable_0 (copy), v34 (copy)
    local v49 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
    local v50 = l_useAvatarRoute_0();
    local l_name_0 = v50.opaque.name;
    local v52 = l_useRoactService_0(v26);
    local v53 = v6.useRef(nil);
    local v54 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v55 = v30();
    local v57 = v6.useCallback(function(v56) --[[ Line: 154 ]]
        -- upvalues: v29 (ref), v50 (copy)
        return v29.getIsSceneFullViewFromState(v56, v50);
    end, {
        v50
    });
    local v58 = l_useSelector_0(v57);
    local v59 = l_useDispatch_0();
    local v62 = v6.useCallback(function(v60, v61) --[[ Line: 161 ]]
        -- upvalues: l_GamepadUtils_0 (ref), v55 (copy)
        l_GamepadUtils_0.rotateAndZoom(v60, v61, v55.setAngularVelocityByPixels, v55.rotateByRadians, v55.zoomStraight);
    end, {
        v55.setAngularVelocityByPixels, 
        v55.rotateByRadians, 
        v55.zoomStraight
    });
    local v67 = v6.useCallback(function(v63, v64) --[[ Line: 177 ]]
        -- upvalues: l_GamepadUtils_0 (ref), v55 (copy)
        local v65 = l_GamepadUtils_0.normalizeStickByDeadzone(Vector2.new(v63.Position.X, v63.Position.Y));
        if v65 == Vector2.new(0, 0) then
            return;
        else
            if v55.panByDistance then
                local v66 = v64 * v65 * 5;
                v55.panByDistance(v66);
            end;
            return;
        end;
    end, {
        v55.panByDistance
    });
    local v68 = true;
    if l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
        v68 = true;
        if l_name_0 ~= l_AvatarScreen_0.MySharedAvatars then
            v68 = true;
            if l_name_0 ~= l_AvatarScreen_0.Catalog then
                v68 = true;
                if l_name_0 ~= l_AvatarScreen_0.CatalogSearch then
                    v68 = l_name_0 == l_AvatarScreen_0.ProfilePictureEditorEmotes;
                end;
            end;
        end;
    end;
    local v69 = v6.useRef(nil);
    local v70 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v71 = if v35 then l_useFocusRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView) else nil;
    local v73 = v6.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v58 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v70 (copy), v69 (copy), v35 (ref), v71 (copy), v49 (copy), l_GuiService_0 (ref), v53 (copy), v28 (ref), v59 (copy), v27 (ref), v52 (copy), l_name_0 (copy)
        if v58 then
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v70 and v69.current and (not v35 or v69.current:IsDescendantOf(game)) then
                    v70(v69.current);
                elseif v35 and v71 then
                    v71();
                end;
            else
                v49.moveFocusTo(v69.current);
            end;
            v69.current = nil;
        elseif l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v69.current = l_GuiService_0.SelectedCoreObject;
            if v70 and v53.current then
                v70(v53.current);
            end;
        else
            v69.current = v49.getCurrentFocus();
            v49.moveFocusTo(v53);
        end;
        local v72 = if v58 then v28.None else v28.SceneFullView;
        v59(v27(v52, l_name_0, v72));
    end, {
        v58, 
        v59, 
        l_name_0, 
        v52, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v70 else v49, 
        if v35 then v71 else nil
    });
    local v74 = v47({
        onGoBack = if v58 then v73 else nil, 
        onEnterAvatarFullView = if not v58 and v68 then v73 else nil, 
        onExitAvatarFullView = if v32 then if v58 and v68 then v73 else nil else if v58 then v73 else nil, 
        onPanAvatar = if v33 then nil else if v58 then v67 else nil, 
        onRotateAndZoomAvatar = v62
    });
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ref = v74
    }, v5.Dictionary.join(v48.children, {
        FocusIsolate = v6.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "TextButton" or l_Focusable_0.Frame, {
            Text = v34 and "" or nil, 
            BackgroundTransparency = 1, 
            SelectionImageObject = v54, 
            ref = v53, 
            SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            SelectionBehaviorLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then Enum.SelectionBehavior.Stop else nil
        })
    }));
end;