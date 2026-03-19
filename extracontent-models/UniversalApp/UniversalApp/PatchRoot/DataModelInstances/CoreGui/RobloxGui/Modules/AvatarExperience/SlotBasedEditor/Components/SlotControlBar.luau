local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = v8.FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = v9.AXEnableAccessoryAdjustmentDuringTryOnIXP;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v13 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_ContextualActionButton_0 = v12.Components.ContextualActionButton;
local l_ColorGradientCircle_0 = v12.Components.ColorGradientCircle;
local v16 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v12.State.Selectors.selectShowColorQuickButton else require(l_Modules_0.AvatarExperience.Common.Selectors.selectShowColorQuickButton);
local l_selectColorAdjustmentButtonColor_0 = v12.State.Selectors.selectColorAdjustmentButtonColor;
local l_Constants_0 = v13.Utils.Constants;
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v20 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v22.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v22.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarEditorCategories_0 = v7.Enums.AvatarEditorCategories;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v13.Utils.getRbxthumbWithTypeSizeAndOptions;
local v27 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_useNavigationFocus_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigationFocus;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v34 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSlotBasedEditorContext_0 = v7.Context.useSlotBasedEditorContext;
local v36 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn);
local v37 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableSlotsFtux);
local v38 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect);
local v39 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v40 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions);
local l_ItemView_0 = v7.Enums.ItemView;
local l_NavigationParams_0 = v7.Enums.NavigationParams;
local l_CustomizeControlBar_0 = v6.CustomizeControlBar;
local l_UndoRedoBar_0 = v6.UndoRedoBar;
local l_FFlagAXResetAvatarButton_0 = v8.FFlagAXResetAvatarButton;
local l_FFlagAXMoveContextualActionButtons_0 = v8.FFlagAXMoveContextualActionButtons;
local l_FFlagAXFixContextualActionVisibility_0 = v8.FFlagAXFixContextualActionVisibility;
local l_FFlagAXMigrateSlotsSignals_0 = v8.FFlagAXMigrateSlotsSignals;
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local function v51(v50) --[[ Line: 76 ]] --[[ Name: selectUserId ]]
    return v50.LocalUserId;
end;
return v4.memo(v4.forwardRef(function(v52, v53) --[[ Line: 92 ]] --[[ Name: SlotControlBar ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigationFocus_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v34 (copy), v28 (copy), l_useSlotBasedEditorContext_0 (copy), l_FFlagAXMigrateSlotsSignals_0 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), l_useSelector_0 (copy), v39 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v16 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v36 (copy), v51 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v4 (copy), v27 (copy), v21 (copy), l_AvatarEditorCategories_0 (copy), v19 (copy), v38 (copy), l_AvatarScreen_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), l_CustomizeControlBar_0 (copy), v37 (copy), l_FFlagAXResetAvatarButton_0 (copy), l_UndoRedoBar_0 (copy), l_FFlagAXFixContextualActionVisibility_0 (copy), v40 (copy), l_ContextualActionButton_0 (copy), l_ColorGradientCircle_0 (copy), v20 (copy), v5 (copy)
    local v54 = l_useTokens_0();
    local v55 = l_useNavigationFocus_0();
    local v56 = l_useAvatarRoute_0();
    local v57 = l_useNavigation_0();
    local v58 = l_useDispatch_0();
    local v59 = v34(v28);
    local v60 = l_useSlotBasedEditorContext_0();
    local v61 = if v60 then if l_FFlagAXMigrateSlotsSignals_0 then v60.signalStore.setSlotCategory else v60.setSlotCategory else nil;
    local v62 = if l_FFlagAXMoveContextualActionButtons_0 then l_useSelector_0(v39) else nil;
    local v63 = if l_FFlagAXMoveContextualActionButtons_0 then nil else l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v64 = if l_FFlagAXMoveContextualActionButtons_0 then nil else l_useSelector_0(v16);
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    if not l_FFlagAXMoveContextualActionButtons_0 and l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then
        local v68 = v36();
        v65 = v68.shouldEnableAccessoryAdjustmentDuringTryOn;
        v66 = v68.adjustableLastTryOnItemId;
        v67 = v68.accessoryAdjustmentQuickButtonFtux;
    end;
    local v69 = l_useSelector_0(v51);
    local v70 = l_getRbxthumbWithTypeSizeAndOptions_0(v69, l_AvatarHeadShot_0, 150);
    local v71 = v4.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v52 (copy), v27 (ref), v56 (copy), v55 (copy), v57 (copy)
        return v52.showControlBar and v27.isAvatarSceneButtonsVisible(v56, v55, v52.isUIFullView, v52.isSceneFullView, v57);
    end, {
        v56, 
        v55, 
        v52.isUIFullView, 
        v52.isSceneFullView, 
        v57, 
        v52.showControlBar
    });
    local v78 = v4.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v21 (ref), l_AvatarEditorCategories_0 (ref), v61 (copy), v58 (copy), v19 (ref), v59 (copy), v60 (copy), v56 (copy), v38 (ref), v57 (copy), l_AvatarScreen_0 (ref), l_NavigationParams_0 (ref), l_ItemView_0 (ref)
        for _, v73 in (v21()) do
            if v73.NavigationKey == l_AvatarEditorCategories_0.All then
                if v61 then
                    v61(v73.NavigationKey);
                end;
                v58(v19(v73.Category, nil, v59));
                break;
            end;
        end;
        local v74 = if v60 then nil else v56.opaque.name;
        local v75 = if v38 then v57.state and v57.state.params else nil;
        local v76 = v56.current.name == l_AvatarScreen_0.LookDetails;
        local v77 = v56.opaque.name == l_AvatarScreen_0.AvatarEditor;
        v57.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.AllItems, 
            [l_NavigationParams_0.fromScreen] = v74, 
            [l_NavigationParams_0.params] = if v38 then v75 or {} else nil
        });
        if v77 and v76 then
            v57.navigate(l_AvatarScreen_0.LookDetails);
        end;
    end, {
        v58, 
        v59, 
        v60, 
        v57, 
        v56
    });
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        ref = v53, 
        NextSelectionLeft = v52.NextSelectionLeft, 
        LayoutOrder = v52.LayoutOrder
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v54.Gap.Small)
        }), 
        ControlBar = if v71 then v4.createElement(l_CustomizeControlBar_0, {
            onActiveMenuItemChanged = v52.onActiveMenuItemChanged, 
            onInventoryActivated = v78, 
            thumbnailUrl = v70, 
            LayoutOrder = 1, 
            focusAnimation = if v37 then v52.focusAnimation else nil, 
            showUndoRedo = if l_FFlagAXResetAvatarButton_0 then v52.showUndoRedo else nil
        }) else nil, 
        UndoRedoBar = if not v52.showUndoRedo or l_FFlagAXResetAvatarButton_0 then nil else v4.createElement(l_UndoRedoBar_0, {
            direction = "vertical", 
            LayoutOrder = 2
        }), 
        ContextualActions = if not (l_FFlagAXMoveContextualActionButtons_0 and (not l_FFlagAXFixContextualActionVisibility_0 or v71)) or v62 then nil else v4.createElement(v40, {
            LayoutOrder = 3
        }), 
        SkinColorButton = if not l_FFlagAXMoveContextualActionButtons_0 and v64 and v63 then v4.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v54.Size.Size_1100), 
            onActivated = function() --[[ Line: 226 ]] --[[ Name: onActivated ]]
                -- upvalues: v57 (copy), l_AvatarScreen_0 (ref)
                v57.navigate(l_AvatarScreen_0.ColorAdjustment);
            end, 
            LayoutOrder = 3, 
            Selectable = true
        }, v4.createElement(l_ColorGradientCircle_0, {
            Colors = {
                v63
            }, 
            Size = UDim2.fromOffset(v54.Size.Size_500, v54.Size.Size_500), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })) else nil, 
        AccessoryAdjustmentButton = if not l_FFlagAXMoveContextualActionButtons_0 and v65 and v56.opaque.name == l_AvatarScreen_0.Catalog and v66 then v4.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v54.Size.Size_1100), 
            onActivated = function() --[[ Line: 246 ]] --[[ Name: onActivated ]]
                -- upvalues: v67 (ref), v57 (copy), l_AvatarScreen_0 (ref), v56 (copy), v58 (copy), v20 (ref), v66 (ref)
                if v67 and v67.shouldShowFirstTimeGlow() then
                    v67.completeFirstTimeGlow();
                end;
                v57.navigate(l_AvatarScreen_0.AdjustAccessoryView, {
                    fromRoute = v56.opaque.name
                });
                v58(v20(v66));
            end, 
            enableFocusAnimation = v67 and v67.shouldShowFirstTimeGlow(), 
            LayoutOrder = 4, 
            Selectable = true, 
            GroupTransparencyOverwrite = 0
        }, {
            Icon = v4.createElement(v5.View, {
                Size = UDim2.fromScale(1, 1), 
                Visible = true, 
                tag = "radius-circle position-center-center anchor-center-center clip"
            }, {
                IconImage = v4.createElement(v5.Image, {
                    Image = "icons/menu/transform", 
                    Size = UDim2.fromOffset(v54.Size.Size_800, v54.Size.Size_800), 
                    imageStyle = {
                        Color3 = v54.Color.Content.Emphasis.Color3, 
                        Transparency = v54.Color.Content.Emphasis.Transparency
                    }, 
                    tag = "position-center-center anchor-center-center radius-circle content-emphasis"
                })
            })
        }) else nil
    });
end));