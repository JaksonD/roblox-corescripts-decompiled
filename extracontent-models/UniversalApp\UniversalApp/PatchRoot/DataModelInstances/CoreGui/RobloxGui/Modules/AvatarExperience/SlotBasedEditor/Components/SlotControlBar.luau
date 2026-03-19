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
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local function v50(v49) --[[ Line: 71 ]] --[[ Name: selectUserId ]]
    return v49.LocalUserId;
end;
return v4.memo(v4.forwardRef(function(v51, v52) --[[ Line: 87 ]] --[[ Name: SlotControlBar ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigationFocus_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v34 (copy), v28 (copy), l_useSlotBasedEditorContext_0 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), l_useSelector_0 (copy), v39 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v16 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v36 (copy), v50 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v4 (copy), v27 (copy), v21 (copy), l_AvatarEditorCategories_0 (copy), v19 (copy), v38 (copy), l_AvatarScreen_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), l_CustomizeControlBar_0 (copy), v37 (copy), l_FFlagAXResetAvatarButton_0 (copy), l_UndoRedoBar_0 (copy), l_FFlagAXFixContextualActionVisibility_0 (copy), v40 (copy), l_ContextualActionButton_0 (copy), l_ColorGradientCircle_0 (copy), v20 (copy), v5 (copy)
    local v53 = l_useTokens_0();
    local v54 = l_useNavigationFocus_0();
    local v55 = l_useAvatarRoute_0();
    local v56 = l_useNavigation_0();
    local v57 = l_useDispatch_0();
    local v58 = v34(v28);
    local v59 = l_useSlotBasedEditorContext_0();
    local v60 = if v59 then v59.setSlotCategory else nil;
    local v61 = if l_FFlagAXMoveContextualActionButtons_0 then l_useSelector_0(v39) else nil;
    local v62 = if l_FFlagAXMoveContextualActionButtons_0 then nil else l_useSelector_0(l_selectColorAdjustmentButtonColor_0);
    local v63 = if l_FFlagAXMoveContextualActionButtons_0 then nil else l_useSelector_0(v16);
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    if not l_FFlagAXMoveContextualActionButtons_0 and l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then
        local v67 = v36();
        v64 = v67.shouldEnableAccessoryAdjustmentDuringTryOn;
        v65 = v67.adjustableLastTryOnItemId;
        v66 = v67.accessoryAdjustmentQuickButtonFtux;
    end;
    local v68 = l_useSelector_0(v50);
    local v69 = l_getRbxthumbWithTypeSizeAndOptions_0(v68, l_AvatarHeadShot_0, 150);
    local v70 = v4.useMemo(function() --[[ Line: 122 ]]
        -- upvalues: v51 (copy), v27 (ref), v55 (copy), v54 (copy), v56 (copy)
        return v51.showControlBar and v27.isAvatarSceneButtonsVisible(v55, v54, v51.isUIFullView, v51.isSceneFullView, v56);
    end, {
        v55, 
        v54, 
        v51.isUIFullView, 
        v51.isSceneFullView, 
        v56, 
        v51.showControlBar
    });
    local v77 = v4.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v21 (ref), l_AvatarEditorCategories_0 (ref), v60 (copy), v57 (copy), v19 (ref), v58 (copy), v59 (copy), v55 (copy), v38 (ref), v56 (copy), l_AvatarScreen_0 (ref), l_NavigationParams_0 (ref), l_ItemView_0 (ref)
        for _, v72 in (v21()) do
            if v72.NavigationKey == l_AvatarEditorCategories_0.All then
                if v60 then
                    v60(v72.NavigationKey);
                end;
                v57(v19(v72.Category, nil, v58));
                break;
            end;
        end;
        local v73 = if v59 then nil else v55.opaque.name;
        local v74 = if v38 then v56.state and v56.state.params else nil;
        local v75 = v55.current.name == l_AvatarScreen_0.LookDetails;
        local v76 = v55.opaque.name == l_AvatarScreen_0.AvatarEditor;
        v56.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.AllItems, 
            [l_NavigationParams_0.fromScreen] = v73, 
            [l_NavigationParams_0.params] = if v38 then v74 or {} else nil
        });
        if v76 and v75 then
            v56.navigate(l_AvatarScreen_0.LookDetails);
        end;
    end, {
        v57, 
        v58, 
        v59, 
        v56, 
        v55
    });
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        ref = v52, 
        NextSelectionLeft = v51.NextSelectionLeft, 
        LayoutOrder = v51.LayoutOrder
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v53.Gap.Small)
        }), 
        ControlBar = if v70 then v4.createElement(l_CustomizeControlBar_0, {
            onActiveMenuItemChanged = v51.onActiveMenuItemChanged, 
            onInventoryActivated = v77, 
            thumbnailUrl = v69, 
            LayoutOrder = 1, 
            focusAnimation = if v37 then v51.focusAnimation else nil, 
            showUndoRedo = if l_FFlagAXResetAvatarButton_0 then v51.showUndoRedo else nil
        }) else nil, 
        UndoRedoBar = if not v51.showUndoRedo or l_FFlagAXResetAvatarButton_0 then nil else v4.createElement(l_UndoRedoBar_0, {
            direction = "vertical", 
            LayoutOrder = 2
        }), 
        ContextualActions = if not (l_FFlagAXMoveContextualActionButtons_0 and (not l_FFlagAXFixContextualActionVisibility_0 or v70)) or v61 then nil else v4.createElement(v40, {
            LayoutOrder = 3
        }), 
        SkinColorButton = if not l_FFlagAXMoveContextualActionButtons_0 and v63 and v62 then v4.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v53.Size.Size_1100), 
            onActivated = function() --[[ Line: 217 ]] --[[ Name: onActivated ]]
                -- upvalues: v56 (copy), l_AvatarScreen_0 (ref)
                v56.navigate(l_AvatarScreen_0.ColorAdjustment);
            end, 
            LayoutOrder = 3, 
            Selectable = true
        }, v4.createElement(l_ColorGradientCircle_0, {
            Colors = {
                v62
            }, 
            Size = UDim2.fromOffset(v53.Size.Size_500, v53.Size.Size_500), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })) else nil, 
        AccessoryAdjustmentButton = if not l_FFlagAXMoveContextualActionButtons_0 and v64 and v55.opaque.name == l_AvatarScreen_0.Catalog and v65 then v4.createElement(l_ContextualActionButton_0, {
            size = UDim.new(0, v53.Size.Size_1100), 
            onActivated = function() --[[ Line: 237 ]] --[[ Name: onActivated ]]
                -- upvalues: v66 (ref), v56 (copy), l_AvatarScreen_0 (ref), v55 (copy), v57 (copy), v20 (ref), v65 (ref)
                if v66 and v66.shouldShowFirstTimeGlow() then
                    v66.completeFirstTimeGlow();
                end;
                v56.navigate(l_AvatarScreen_0.AdjustAccessoryView, {
                    fromRoute = v55.opaque.name
                });
                v57(v20(v65));
            end, 
            enableFocusAnimation = v66 and v66.shouldShowFirstTimeGlow(), 
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
                    Size = UDim2.fromOffset(v53.Size.Size_800, v53.Size.Size_800), 
                    imageStyle = {
                        Color3 = v53.Color.Content.Emphasis.Color3, 
                        Transparency = v53.Color.Content.Emphasis.Transparency
                    }, 
                    tag = "position-center-center anchor-center-center radius-circle content-emphasis"
                })
            })
        }) else nil
    });
end));