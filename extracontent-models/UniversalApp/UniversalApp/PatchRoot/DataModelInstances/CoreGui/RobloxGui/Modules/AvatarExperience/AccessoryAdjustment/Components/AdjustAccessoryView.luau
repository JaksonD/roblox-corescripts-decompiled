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
local v40 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 = v40.FFlagAXMigrateSceneGamepadHandlerInputBindings;
local l_FFlagAvatarJointUpgradeInUA_0 = v40.FFlagAvatarJointUpgradeInUA;
local v43 = if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local l_flaggedMutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).flaggedMutedError;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v46 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v48 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAdjustmentViewShortcutBarUpdate);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAdjustAccessoryViewToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v52 = {
    toastMessage = "Feature.Avatar.Generic.Error", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v53 = {
    toastMessage = "Feature.Avatar.Label.AccessoryCannotBeAdjustedWarning", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v54 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset
};
local function v61(v55, v56, v57) --[[ Line: 105 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v22 (copy), v54 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v23 (copy)
    local v58 = v22.useEventMap(v54, v55);
    local v60 = v4.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v23 (ref), v56 (copy), v57 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v23.onRelease(function(v59) --[[ Line: 110 ]]
                    -- upvalues: v56 (ref)
                    v59.cancelled = true;
                    v56();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.AdjustAccessoryViewReset] = {
                handler = v23.onRelease(v57)
            }
        };
    end, {
        v56, 
        v57
    });
    return v22.useEventHandlerMap(v60, v58);
end;
local function v63(v62) --[[ Line: 132 ]] --[[ Name: mapTokens ]]
    return {
        smallIconSize = v62.Semantic.Icon.Size.Small, 
        buttonSize = v62.Global.Size_400, 
        portraitPadding = v62.Global.Size_100, 
        landscapePadding = v62.Global.Size_150, 
        sidePadding = v62.Global.Size_150, 
        cornerRadius = v62.Semantic.Radius.Medium, 
        panelMargin = v62.Global.Size_450
    };
end;
local function v65(v64) --[[ Line: 144 ]] --[[ Name: selectAdjustmentTypeSelected ]]
    return v64.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
end;
local function v67(v66) --[[ Line: 148 ]] --[[ Name: selectTopBarHeight ]]
    return v66.TopBar.topBarHeight;
end;
local function v69(v68) --[[ Line: 152 ]] --[[ Name: selectSelectedAccessory ]]
    return v68.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
end;
local function v71(v70) --[[ Line: 157 ]] --[[ Name: selectEquippedAssets ]]
    return v70.AvatarExperience.AvatarEditor.Character.EquippedAssets;
end;
local function v73(v72) --[[ Line: 161 ]] --[[ Name: selectTryOns ]]
    return v72.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
return (v27((v26(function(v74) --[[ Line: 165 ]] --[[ Name: AdjustAccessoryView ]]
    -- upvalues: l_useDesignTokens_0 (copy), v63 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v9 (copy), v10 (copy), l_useSelector_0 (copy), v69 (copy), v71 (copy), v73 (copy), v11 (copy), v38 (copy), v4 (copy), v16 (copy), v17 (copy), l_useLocalization_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v29 (copy), v3 (copy), v20 (copy), l_flaggedMutedError_0 (copy), v65 (copy), v67 (copy), v12 (copy), l_useNavigation_0 (copy), l_AvatarScreen_0 (copy), v39 (copy), v28 (copy), v61 (copy), l_useTableWrappedCallbackRef_0 (copy), l_InsertService_0 (copy), v31 (copy), v46 (copy), l_SetCurrentToastMessage_0 (copy), v52 (copy), l_FFlagAvatarJointUpgradeInUA_0 (copy), v53 (copy), v19 (copy), v18 (copy), v35 (copy), v48 (copy), l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 (copy), v30 (copy), v34 (copy), v33 (copy), l_Focusable_0 (copy), v43 (copy), v32 (copy)
    local v75 = l_useDesignTokens_0(v63);
    local v76 = l_useDispatch_0();
    local v77 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRootFocusController();
    local v78 = v9();
    local v79 = v10();
    local v80 = v79.appliedDescriptionBinding:getValue();
    local v81 = l_useSelector_0(v69);
    assert(v81, "Assert selectedAccessory exists");
    local v82 = l_useSelector_0(v71);
    local v83 = l_useSelector_0(v73);
    local v84 = v11(v38);
    local v85 = v4.useRef(false);
    local v86 = l_useSelector_0(v16);
    local v87 = l_useSelector_0(v17);
    local v88 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply", 
        topBarTitle = l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() and "Feature.Avatar.Heading.AccessoryAdjustmentTitle" or nil
    });
    local v89, v90 = v4.useState(v29.getSliderValuesWithDefault(v82, v83, v81));
    local v91 = v4.useRef(v29.getSliderValuesWithDefault(v82, v83, v81));
    v4.useEffect(function() --[[ Line: 197 ]]
        -- upvalues: v91 (copy), v89 (copy)
        v91.current = v89;
    end, {
        v89
    });
    local v95 = v4.useCallback(function(v92, v93) --[[ Line: 201 ]]
        -- upvalues: v3 (ref), v91 (copy), v90 (copy)
        local v94 = v3.Dictionary.join(v91.current, {
            [v93] = v92
        });
        v90(v94);
    end, {
        v91
    });
    local v102 = v4.useCallback(function(v96, v97) --[[ Line: 208 ]]
        -- upvalues: v3 (ref), v91 (copy), v29 (ref), v78 (copy)
        local v98 = v3.Dictionary.join(v91.current, {
            [v97] = v96
        });
        local v99, v100, v101 = v29.sliderInfoToVector3s(v98);
        v78.setAdjustments(v99, v100, v101);
    end, {
        v91
    });
    local v103, v104 = v4.useState(false);
    local v105 = nil;
    local v106, v107 = v4.useState(nil);
    v4.useEffect(function() --[[ Line: 220 ]]
        -- upvalues: v79 (copy), v81 (copy), v105 (ref), v20 (ref), v107 (copy), l_flaggedMutedError_0 (ref)
        local v108 = v79.appliedDescriptionBinding:getValue();
        if v108 and v81 then
            v105 = v20.getSelectedAccessoryDescription(v108, v81);
            if v105 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 227 ]]
                    -- upvalues: v105 (ref)
                    return v105:GetAppliedInstance();
                end);
                if l_status_0 then
                    v107(l_result_0);
                    return;
                else
                    l_flaggedMutedError_0("AdjustAccessoryView", "AdjustAccessoryView accessoryDescription:GetAppliedInstance error: " .. tostring(l_result_0));
                end;
            end;
        end;
    end, {
        v80, 
        v81
    });
    local v111 = l_useSelector_0(v65);
    local v112 = l_useSelector_0(v67);
    local v113, v114 = v4.useState(nil);
    local v115 = v4.useRef(nil);
    local v116 = v4.useRef(nil);
    local v117 = v4.useRef(nil);
    local v118 = v4.useRef(nil);
    local v119 = v4.useRef(nil);
    local v120 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v12.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v121 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then l_useNavigation_0().state.params else nil;
    local function v126() --[[ Line: 263 ]]
        -- upvalues: v29 (ref), v82 (copy), v83 (copy), v81 (copy), v91 (copy), v74 (copy), l_AvatarScreen_0 (ref), v78 (copy), v120 (copy), v121 (copy)
        local v122 = v29.getSliderValuesWithDefault(v82, v83, v81);
        if v29.checkSliderValuesChanged(v91.current, v122) then
            v74.navigation.navigate(l_AvatarScreen_0.AccessoryAdjustmentUnsavedPrompt, {
                exitCallback = function() --[[ Line: 268 ]] --[[ Name: exitCallback ]]
                    -- upvalues: v29 (ref), v122 (copy), v78 (ref), v120 (ref), v121 (ref), v74 (ref)
                    local v123, v124, v125 = v29.sliderInfoToVector3s(v122);
                    v78.setAdjustments(v123, v124, v125);
                    if v120 and v121 and v121.fromRoute then
                        v74.navigation.popToTop();
                        v74.navigation.navigate(v121.fromRoute);
                        return;
                    else
                        v74.navigation.pop();
                        return;
                    end;
                end
            });
            return;
        elseif v120 and v121 and v121.fromRoute then
            v74.navigation.popToTop();
            v74.navigation.navigate(v121.fromRoute);
            return;
        else
            v74.navigation.pop();
            return;
        end;
    end;
    local v127 = v4.useCallback(v126, {
        v82, 
        v83, 
        v81, 
        v78, 
        v74.navigation
    });
    local function v131() --[[ Line: 299 ]]
        -- upvalues: v74 (copy), l_AvatarScreen_0 (ref), v76 (copy), v39 (ref), v84 (copy), v29 (ref), v28 (ref), v78 (copy), v90 (copy)
        v74.navigation.navigate(l_AvatarScreen_0.AccessoryAdjustmentResetPrompt, {
            resetCallback = function() --[[ Line: 301 ]] --[[ Name: resetCallback ]]
                -- upvalues: v76 (ref), v39 (ref), v84 (ref), v29 (ref), v28 (ref), v78 (ref), v90 (ref)
                v76(v39(v84.avatarRefineAccessoryResetConfirm));
                local v128, v129, v130 = v29.sliderInfoToVector3s(v28.DefaultSliderValues);
                v78.setAdjustments(v128, v129, v130);
                v90(v28.DefaultSliderValues);
            end
        });
    end;
    local v132 = v4.useCallback(v131, {
        v74.navigation, 
        v78, 
        v90, 
        v84
    });
    local v133 = v4.useMemo(function() --[[ Line: 316 ]]
        -- upvalues: v5 (ref), v127 (copy), v132 (copy)
        return {
            Back = v5.Input.onBegin(Enum.KeyCode.ButtonB, v127), 
            OpenResetPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonY, v132, {
                key = "CommonUI.Messages.Action.Reset"
            })
        };
    end, {
        v127, 
        v132
    });
    local v134 = v61(nil, v127, v132);
    local v135 = l_useTableWrappedCallbackRef_0(v134);
    v4.useEffect(function() --[[ Line: 328 ]]
        -- upvalues: v114 (copy), l_InsertService_0 (ref), v76 (copy), v31 (ref), v46 (ref), v113 (copy), v85 (copy), v29 (ref), v82 (copy), v83 (copy), v81 (copy), v78 (copy)
        v114(l_InsertService_0:LoadLocalAsset("rbxasset://models/AccessoryAdjustment/Ring.rbxm"));
        return function() --[[ Line: 330 ]]
            -- upvalues: v76 (ref), v31 (ref), v46 (ref), v113 (ref), v85 (ref), v29 (ref), v82 (ref), v83 (ref), v81 (ref), v78 (ref)
            v76(v31(v46.Position));
            if v113 then
                v113:Destroy();
            end;
            if not v85.current then
                local v136 = v29.getSliderValuesWithDefault(v82, v83, v81);
                local v137, v138, v139 = v29.sliderInfoToVector3s(v136);
                v78.setAdjustments(v137, v138, v139);
            end;
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 348 ]]
        -- upvalues: v113 (copy), v76 (copy), l_SetCurrentToastMessage_0 (ref), v104 (copy), v74 (copy), v106 (copy), v52 (ref), l_FFlagAvatarJointUpgradeInUA_0 (ref), v20 (ref), v53 (ref), v19 (ref), v111 (copy), v46 (ref), v75 (copy), v86 (copy), v87 (copy)
        if not v113 then
            return;
        else
            local function _(v140) --[[ Line: 354 ]] --[[ Name: exitWithToast ]]
                -- upvalues: v76 (ref), l_SetCurrentToastMessage_0 (ref), v104 (ref), v74 (ref)
                v76(l_SetCurrentToastMessage_0(v140));
                v104(false);
                v74.navigation.pop();
            end;
            if not v106 then
                v76(l_SetCurrentToastMessage_0(v52));
                v104(false);
                v74.navigation.pop();
                return;
            else
                local l_Handle_0 = v106:FindFirstChild("Handle");
                if not l_Handle_0 then
                    v76(l_SetCurrentToastMessage_0(v52));
                    v104(false);
                    v74.navigation.pop();
                    return;
                else
                    local v143 = nil;
                    local v144 = nil;
                    local v145 = nil;
                    local l_Weld_0 = l_Handle_0:FindFirstChildOfClass("Weld");
                    local v147 = if l_FFlagAvatarJointUpgradeInUA_0 then l_Handle_0:FindFirstChildOfClass("RigidConstraint") else nil;
                    if l_FFlagAvatarJointUpgradeInUA_0 then
                        if v147 then
                            v143 = if v147.Attachment0 then v147.Attachment0:FindFirstAncestorWhichIsA("BasePart") else nil;
                            v144 = if v147.Attachment1 then v147.Attachment1:FindFirstAncestorWhichIsA("BasePart") else nil;
                            v145 = if v147.Attachment1 then v20.getRecursiveAttachmentCFrame(v147.Attachment1) else nil;
                        elseif l_Weld_0 then
                            v143 = l_Weld_0.Part0;
                            v144 = l_Weld_0.Part1;
                            v145 = l_Weld_0.C1;
                        end;
                        if not v143 or not v144 or not v145 then
                            v76(l_SetCurrentToastMessage_0(v52));
                            v104(false);
                            v74.navigation.pop();
                            return;
                        end;
                    elseif not l_Weld_0 then
                        v76(l_SetCurrentToastMessage_0(v52));
                        v104(false);
                        v74.navigation.pop();
                        return;
                    end;
                    if l_Handle_0:IsA("MeshPart") and l_Handle_0.HasSkinnedMesh then
                        v76(l_SetCurrentToastMessage_0(v53));
                        v104(false);
                        v74.navigation.pop();
                        return;
                    else
                        v104(true);
                        local v148 = v19.getLargestAxisSize(l_Handle_0.Size);
                        local l_Folder_0 = Instance.new("Folder");
                        if v111 == v46.Position then
                            v19.createPositionAxis(l_Folder_0, v75.smallIconSize, v148, v86.position, v87.position);
                            v19.createBillboardRing(l_Handle_0, l_Folder_0, "rbxasset://textures/ui/AvatarExperience/SelectionRing.png", "Selection");
                        elseif v111 == v46.Rotation then
                            assert(v113:IsA("MeshPart"), "Assert ringPart is a MeshPart");
                            v19.createRotationAxis(l_Folder_0, v148, v75.smallIconSize, v113);
                        elseif v111 == v46.Scale then
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
                        l_Weld_1.Part1 = if l_FFlagAvatarJointUpgradeInUA_0 then v144 else l_Weld_0.Part1;
                        l_Weld_1.C1 = CFrame.new(if l_FFlagAvatarJointUpgradeInUA_0 then v145.Position else l_Weld_0.C1.Position);
                        if v111 == v46.Position then
                            v19.setPositionAdornee(l_Folder_0, l_Handle_0, l_Part_0);
                        elseif v111 == v46.Rotation then
                            local l_Part1_0 = l_Weld_1.Part1;
                            local v153 = if l_FFlagAvatarJointUpgradeInUA_0 then v143 else l_Weld_0.Part0;
                            assert(l_Part1_0, "Assert head not nil");
                            assert(v153, "Accessory not nil");
                            l_Weld_1.C1 = CFrame.new((l_Part1_0.CFrame:Inverse() * v153.CFrame).Position);
                            v19.setRotationAdornee(l_Folder_0, l_Part_0);
                        elseif v111 == v46.Scale then
                            v19.setScaleAdornee(l_Folder_0, l_Handle_0);
                        end;
                        l_Weld_1.Parent = l_Part_0;
                        local v154 = {};
                        table.insert(v154, v19.setUpSizeConnection(l_Handle_0, l_Folder_0));
                        table.insert(v154, v19.setUpCameraConnection(l_Handle_0, l_Folder_0));
                        return function() --[[ Line: 456 ]]
                            -- upvalues: l_Folder_0 (copy), v154 (copy)
                            if l_Folder_0 then
                                l_Folder_0:Destroy();
                            end;
                            for _, v156 in v154 do
                                v156:Disconnect();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, {
        v111, 
        v81, 
        v106, 
        v113, 
        v86, 
        v87, 
        v74.navigation, 
        v76
    });
    local v157 = {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v18, {
            focusController = v77, 
            captureFocusOnMount = true
        }), 
        TopBar = v4.createElement(v35.Container, {
            titleText = if v120 then v88.topBarTitle else "", 
            transparentBackground = true, 
            leftItem = v35.makeBackButton(v127), 
            ref = v116, 
            NextSelectionDown = v119, 
            NextSelectionRight = if v48 then nil else v118, 
            ZIndex = 1
        }), 
        PageContainer = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v112), 
            Position = UDim2.fromOffset(0, v112), 
            BackgroundTransparency = 1, 
            ref = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then v135 else nil
        }, {
            SceneInteractionFrame = v4.createElement(v30), 
            ResetButton = v4.createElement(v34, {
                resetRef = if v48 then nil else v118, 
                onResetButtonPressed = v132, 
                NextSelectionLeft = v116
            }), 
            ControlPanel = if v103 then v4.createElement(v33, {
                setSliderValuesCallback = v95, 
                updateCharacterCallback = v102, 
                adjustmentTypeFrameRef = v119, 
                sliderFrameRef = v115, 
                topBarRef = v116, 
                resetRef = v118, 
                applyButtonRef = v117, 
                sliderValues = v89, 
                isApplyingAdjustment = v85
            }) else nil
        })
    };
    return v4.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v77, 
        defaultChild = v119, 
        inputBindings = if l_FFlagAXMigrateAdjustAccessoryViewToFocusNavigation_0 then nil else v133
    }, {
        SceneGamepadHandler = v4.createElement(v43, nil, v157), 
        BoundInputsUpdater = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then v4.createElement(v32) else nil
    });
end))));