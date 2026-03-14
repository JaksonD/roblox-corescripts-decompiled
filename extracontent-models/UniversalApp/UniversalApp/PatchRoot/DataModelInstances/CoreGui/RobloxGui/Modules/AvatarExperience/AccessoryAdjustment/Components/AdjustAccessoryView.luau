local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v9 = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.useAdjustmentDataCallbacksContext);
local v10 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v12 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v16 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Selectors.selectLowerAdjustmentLimits);
local v17 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Selectors.selectUpperAdjustmentLimits);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v19 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.GimbalUtils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v21 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v22 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v23 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v21.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v28 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v29 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v31 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v33 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.ControlPanel);
local v34 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentResetButton);
local v35 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_ToastType_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Enums.ToastType;
local v38 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Services.Analytics);
local v39 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics);
local v40 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local l_flaggedMutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).flaggedMutedError;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v43 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v45 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAdjustmentViewShortcutBarUpdate);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAdjustAccessoryViewToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v49 = {
    toastMessage = "Feature.Avatar.Generic.Error", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v50 = {
    toastMessage = "Feature.Avatar.Label.AccessoryCannotBeAdjustedWarning", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v51 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset
};
local function v58(v52, v53, v54) --[[ Line: 104 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v22 (copy), v51 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v23 (copy)
    local v55 = v22.useEventMap(v51, v52);
    local v57 = v4.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v23 (ref), v53 (copy), v54 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v23.onRelease(function(v56) --[[ Line: 109 ]]
                    -- upvalues: v53 (ref)
                    v56.cancelled = true;
                    v53();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset] = {
                handler = v23.onRelease(v54)
            }
        };
    end, {
        v53, 
        v54
    });
    return v22.useEventHandlerMap(v57, v55);
end;
local function v60(v59) --[[ Line: 131 ]] --[[ Name: mapTokens ]]
    return {
        smallIconSize = v59.Semantic.Icon.Size.Small, 
        buttonSize = v59.Global.Size_400, 
        portraitPadding = v59.Global.Size_100, 
        landscapePadding = v59.Global.Size_150, 
        sidePadding = v59.Global.Size_150, 
        cornerRadius = v59.Semantic.Radius.Medium, 
        panelMargin = v59.Global.Size_450
    };
end;
local function v62(v61) --[[ Line: 143 ]] --[[ Name: selectAdjustmentTypeSelected ]]
    return v61.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
end;
local function v64(v63) --[[ Line: 147 ]] --[[ Name: selectTopBarHeight ]]
    return v63.TopBar.topBarHeight;
end;
local function v66(v65) --[[ Line: 151 ]] --[[ Name: selectSelectedAccessory ]]
    return v65.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
end;
local function v68(v67) --[[ Line: 156 ]] --[[ Name: selectEquippedAssets ]]
    return v67.AvatarExperience.AvatarEditor.Character.EquippedAssets;
end;
local function v70(v69) --[[ Line: 160 ]] --[[ Name: selectTryOns ]]
    return v69.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
return (v27((v26(function(v71) --[[ Line: 164 ]] --[[ Name: AdjustAccessoryView ]]
    -- upvalues: l_useDesignTokens_0 (copy), v60 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v9 (copy), v10 (copy), l_useSelector_0 (copy), v66 (copy), v68 (copy), v70 (copy), v11 (copy), v38 (copy), v4 (copy), v16 (copy), v17 (copy), l_useLocalization_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v29 (copy), v3 (copy), v20 (copy), l_flaggedMutedError_0 (copy), v62 (copy), v64 (copy), v12 (copy), l_useNavigation_0 (copy), l_AvatarScreen_0 (copy), v39 (copy), v28 (copy), v58 (copy), l_useTableWrappedCallbackRef_0 (copy), l_InsertService_0 (copy), v31 (copy), v43 (copy), l_SetCurrentToastMessage_0 (copy), v49 (copy), v50 (copy), v19 (copy), v18 (copy), v35 (copy), v45 (copy), l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 (copy), v30 (copy), v34 (copy), v33 (copy), l_Focusable_0 (copy), v40 (copy), v32 (copy)
    local v72 = l_useDesignTokens_0(v60);
    local v73 = l_useDispatch_0();
    local v74 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRootFocusController();
    local v75 = v9();
    local v76 = v10();
    local v77 = v76.appliedDescriptionBinding:getValue();
    local v78 = l_useSelector_0(v66);
    assert(v78, "Assert selectedAccessory exists");
    local v79 = l_useSelector_0(v68);
    local v80 = l_useSelector_0(v70);
    local v81 = v11(v38);
    local v82 = v4.useRef(false);
    local v83 = l_useSelector_0(v16);
    local v84 = l_useSelector_0(v17);
    local v85 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply", 
        topBarTitle = l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() and "Feature.Avatar.Heading.AccessoryAdjustmentTitle" or nil
    });
    local v86, v87 = v4.useState(v29.getSliderValuesWithDefault(v79, v80, v78));
    local v88 = v4.useRef(v29.getSliderValuesWithDefault(v79, v80, v78));
    v4.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v88 (copy), v86 (copy)
        v88.current = v86;
    end, {
        v86
    });
    local v92 = v4.useCallback(function(v89, v90) --[[ Line: 200 ]]
        -- upvalues: v3 (ref), v88 (copy), v87 (copy)
        local v91 = v3.Dictionary.join(v88.current, {
            [v90] = v89
        });
        v87(v91);
    end, {
        v88
    });
    local v99 = v4.useCallback(function(v93, v94) --[[ Line: 207 ]]
        -- upvalues: v3 (ref), v88 (copy), v29 (ref), v75 (copy)
        local v95 = v3.Dictionary.join(v88.current, {
            [v94] = v93
        });
        local v96, v97, v98 = v29.sliderInfoToVector3s(v95);
        v75.setAdjustments(v96, v97, v98);
    end, {
        v88
    });
    local v100, v101 = v4.useState(false);
    local v102 = nil;
    local v103, v104 = v4.useState(nil);
    v4.useEffect(function() --[[ Line: 219 ]]
        -- upvalues: v76 (copy), v78 (copy), v102 (ref), v20 (ref), v104 (copy), l_flaggedMutedError_0 (ref)
        local v105 = v76.appliedDescriptionBinding:getValue();
        if v105 and v78 then
            v102 = v20.getSelectedAccessoryDescription(v105, v78);
            if v102 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 226 ]]
                    -- upvalues: v102 (ref)
                    return v102:GetAppliedInstance();
                end);
                if l_status_0 then
                    v104(l_result_0);
                    return;
                else
                    l_flaggedMutedError_0("AdjustAccessoryView", "AdjustAccessoryView accessoryDescription:GetAppliedInstance error: " .. tostring(l_result_0));
                end;
            end;
        end;
    end, {
        v77, 
        v78
    });
    local v108 = l_useSelector_0(v62);
    local v109 = l_useSelector_0(v64);
    local v110, v111 = v4.useState(nil);
    local v112 = v4.useRef(nil);
    local v113 = v4.useRef(nil);
    local v114 = v4.useRef(nil);
    local v115 = v4.useRef(nil);
    local v116 = v4.useRef(nil);
    local v117 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v12.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v118 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then l_useNavigation_0().state.params else nil;
    local function v123() --[[ Line: 262 ]]
        -- upvalues: v29 (ref), v79 (copy), v80 (copy), v78 (copy), v88 (copy), v71 (copy), l_AvatarScreen_0 (ref), v75 (copy), v117 (copy), v118 (copy)
        local v119 = v29.getSliderValuesWithDefault(v79, v80, v78);
        if v29.checkSliderValuesChanged(v88.current, v119) then
            v71.navigation.navigate(l_AvatarScreen_0.AccessoryAdjustmentUnsavedPrompt, {
                exitCallback = function() --[[ Line: 267 ]] --[[ Name: exitCallback ]]
                    -- upvalues: v29 (ref), v119 (copy), v75 (ref), v117 (ref), v118 (ref), v71 (ref)
                    local v120, v121, v122 = v29.sliderInfoToVector3s(v119);
                    v75.setAdjustments(v120, v121, v122);
                    if v117 and v118 and v118.fromRoute then
                        v71.navigation.popToTop();
                        v71.navigation.navigate(v118.fromRoute);
                        return;
                    else
                        v71.navigation.pop();
                        return;
                    end;
                end
            });
            return;
        elseif v117 and v118 and v118.fromRoute then
            v71.navigation.popToTop();
            v71.navigation.navigate(v118.fromRoute);
            return;
        else
            v71.navigation.pop();
            return;
        end;
    end;
    local v124 = v4.useCallback(v123, {
        v79, 
        v80, 
        v78, 
        v75, 
        v71.navigation
    });
    local function v128() --[[ Line: 298 ]]
        -- upvalues: v71 (copy), l_AvatarScreen_0 (ref), v73 (copy), v39 (ref), v81 (copy), v29 (ref), v28 (ref), v75 (copy), v87 (copy)
        v71.navigation.navigate(l_AvatarScreen_0.AccessoryAdjustmentResetPrompt, {
            resetCallback = function() --[[ Line: 300 ]] --[[ Name: resetCallback ]]
                -- upvalues: v73 (ref), v39 (ref), v81 (ref), v29 (ref), v28 (ref), v75 (ref), v87 (ref)
                v73(v39(v81.avatarRefineAccessoryResetConfirm));
                local v125, v126, v127 = v29.sliderInfoToVector3s(v28.DefaultSliderValues);
                v75.setAdjustments(v125, v126, v127);
                v87(v28.DefaultSliderValues);
            end
        });
    end;
    local v129 = v4.useCallback(v128, {
        v71.navigation, 
        v75, 
        v87, 
        v81
    });
    local v130 = v4.useMemo(function() --[[ Line: 315 ]]
        -- upvalues: v5 (ref), v124 (copy), v129 (copy)
        return {
            Back = v5.Input.onBegin(Enum.KeyCode.ButtonB, v124), 
            OpenResetPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonY, v129, {
                key = "CommonUI.Messages.Action.Reset"
            })
        };
    end, {
        v124, 
        v129
    });
    local v131 = v58(nil, v124, v129);
    local v132 = l_useTableWrappedCallbackRef_0(v131);
    v4.useEffect(function() --[[ Line: 327 ]]
        -- upvalues: v111 (copy), l_InsertService_0 (ref), v73 (copy), v31 (ref), v43 (ref), v110 (copy), v82 (copy), v29 (ref), v79 (copy), v80 (copy), v78 (copy), v75 (copy)
        v111(l_InsertService_0:LoadLocalAsset("rbxasset://models/AccessoryAdjustment/Ring.rbxm"));
        return function() --[[ Line: 329 ]]
            -- upvalues: v73 (ref), v31 (ref), v43 (ref), v110 (ref), v82 (ref), v29 (ref), v79 (ref), v80 (ref), v78 (ref), v75 (ref)
            v73(v31(v43.Position));
            if v110 then
                v110:Destroy();
            end;
            if not v82.current then
                local v133 = v29.getSliderValuesWithDefault(v79, v80, v78);
                local v134, v135, v136 = v29.sliderInfoToVector3s(v133);
                v75.setAdjustments(v134, v135, v136);
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 347 ]]
        -- upvalues: v110 (copy), v73 (copy), l_SetCurrentToastMessage_0 (ref), v101 (copy), v71 (copy), v103 (copy), v49 (ref), v50 (ref), v19 (ref), v108 (copy), v43 (ref), v72 (copy), v83 (copy), v84 (copy)
        if not v110 then
            return;
        else
            local function _(v137) --[[ Line: 353 ]] --[[ Name: exitWithToast ]]
                -- upvalues: v73 (ref), l_SetCurrentToastMessage_0 (ref), v101 (ref), v71 (ref)
                v73(l_SetCurrentToastMessage_0(v137));
                v101(false);
                v71.navigation.pop();
            end;
            if not v103 then
                v73(l_SetCurrentToastMessage_0(v49));
                v101(false);
                v71.navigation.pop();
                return;
            else
                local l_Handle_0 = v103:FindFirstChild("Handle");
                if not l_Handle_0 then
                    v73(l_SetCurrentToastMessage_0(v49));
                    v101(false);
                    v71.navigation.pop();
                    return;
                else
                    local l_Weld_0 = l_Handle_0:FindFirstChildOfClass("Weld");
                    if not l_Weld_0 then
                        v73(l_SetCurrentToastMessage_0(v49));
                        v101(false);
                        v71.navigation.pop();
                        return;
                    elseif l_Handle_0:IsA("MeshPart") and l_Handle_0.HasSkinnedMesh then
                        v73(l_SetCurrentToastMessage_0(v50));
                        v101(false);
                        v71.navigation.pop();
                        return;
                    else
                        v101(true);
                        local v141 = v19.getLargestAxisSize(l_Handle_0.Size);
                        local l_Folder_0 = Instance.new("Folder");
                        if v108 == v43.Position then
                            v19.createPositionAxis(l_Folder_0, v72.smallIconSize, v141, v83.position, v84.position);
                            v19.createBillboardRing(l_Handle_0, l_Folder_0, "rbxasset://textures/ui/AvatarExperience/SelectionRing.png", "Selection");
                        elseif v108 == v43.Rotation then
                            assert(v110:IsA("MeshPart"), "Assert ringPart is a MeshPart");
                            v19.createRotationAxis(l_Folder_0, v141, v72.smallIconSize, v110);
                        elseif v108 == v43.Scale then
                            v19.createBillboardRing(l_Handle_0, l_Folder_0, "rbxasset://textures/ui/AvatarExperience/GlowRing.png", "Scale");
                            v19.createSelectionDot(l_Folder_0, "rbxasset://textures/ui/AvatarExperience/CenterPoint.png", "SelectionDot");
                        end;
                        l_Folder_0.Parent = workspace;
                        local l_Part_0 = Instance.new("Part");
                        l_Part_0.Transparency = 1;
                        l_Part_0.Name = "Anchor";
                        l_Part_0.Parent = l_Folder_0;
                        local l_Weld_1 = Instance.new("Weld");
                        l_Weld_1.Part0 = l_Part_0;
                        l_Weld_1.Part1 = l_Weld_0.Part1;
                        l_Weld_1.C1 = CFrame.new(l_Weld_0.C1.Position);
                        if v108 == v43.Position then
                            v19.setPositionAdornee(l_Folder_0, l_Handle_0, l_Part_0);
                        elseif v108 == v43.Rotation then
                            local l_Part1_0 = l_Weld_1.Part1;
                            local l_Part0_0 = l_Weld_0.Part0;
                            assert(l_Part1_0, "Assert head not nil");
                            assert(l_Part0_0, "Accessory not nil");
                            l_Weld_1.C1 = CFrame.new((l_Part1_0.CFrame:Inverse() * l_Part0_0.CFrame).Position);
                            v19.setRotationAdornee(l_Folder_0, l_Part_0);
                        elseif v108 == v43.Scale then
                            v19.setScaleAdornee(l_Folder_0, l_Handle_0);
                        end;
                        l_Weld_1.Parent = l_Part_0;
                        local v147 = {};
                        table.insert(v147, v19.setUpSizeConnection(l_Handle_0, l_Folder_0));
                        table.insert(v147, v19.setUpCameraConnection(l_Handle_0, l_Folder_0));
                        return function() --[[ Line: 428 ]]
                            -- upvalues: l_Folder_0 (copy), v147 (copy)
                            if l_Folder_0 then
                                l_Folder_0:Destroy();
                            end;
                            for _, v149 in v147 do
                                v149:Disconnect();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, {
        v108, 
        v78, 
        v103, 
        v110, 
        v83, 
        v84, 
        v71.navigation, 
        v73
    });
    local v150 = {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v18, {
            focusController = v74, 
            captureFocusOnMount = true
        }), 
        TopBar = v4.createElement(v35.Container, {
            titleText = if v117 then v85.topBarTitle else "", 
            transparentBackground = true, 
            leftItem = v35.makeBackButton(v124), 
            ref = v113, 
            NextSelectionDown = v116, 
            NextSelectionRight = if v45 then nil else v115, 
            ZIndex = 1
        }), 
        PageContainer = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v109), 
            Position = UDim2.fromOffset(0, v109), 
            BackgroundTransparency = 1, 
            ref = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v132 else nil
        }, {
            SceneInteractionFrame = v4.createElement(v30), 
            ResetButton = v4.createElement(v34, {
                resetRef = if v45 then nil else v115, 
                onResetButtonPressed = v129, 
                NextSelectionLeft = v113
            }), 
            ControlPanel = if v100 then v4.createElement(v33, {
                setSliderValuesCallback = v92, 
                updateCharacterCallback = v99, 
                adjustmentTypeFrameRef = v116, 
                sliderFrameRef = v112, 
                topBarRef = v113, 
                resetRef = v115, 
                applyButtonRef = v114, 
                sliderValues = v86, 
                isApplyingAdjustment = v82
            }) else nil
        })
    };
    return v4.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v74, 
        defaultChild = v116, 
        inputBindings = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then nil else v130
    }, {
        SceneGamepadHandler = v4.createElement(v40, nil, v150), 
        BoundInputsUpdater = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then v4.createElement(v32) else nil
    });
end))));