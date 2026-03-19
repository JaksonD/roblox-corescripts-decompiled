local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.GetDuplicateOutfit);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v16 = v15() and game:DefineFastFlag("AXOutfitMenuUpdatesForSlotBasedEditor2", false);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local l_FFlagAXAddManageOutfitClickTracking_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking;
local v19 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveCreateOrUpdateOutfitMenuGamepadBindings);
local v20 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextualMenu_0 = v20.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v20.App.Menu.MenuDirection;
local v23 = v4.PureComponent:extend("CreateOrUpdateOutfitMenu");
v23.validateProps = v2.strictInterface({
    screenSize = v2.Vector2, 
    duplicateOutfitId = v2.optional(v2.string), 
    navigation = v2.table, 
    focusController = v2.optional(v2.table), 
    onOverlayClosed = v2.optional(v2.callback), 
    saveTilePosition = v2.Vector2, 
    defaultChildRef = v2.optional(v2.table)
});
v23.init = function(v24) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), v4 (copy)
    v24.saveOutfitAsNew = function() --[[ Line: 69 ]]
        -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (copy), v10 (ref), l_AvatarScreen_0 (ref)
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackAddNewAvatarClick();
        end;
        if v24.props.duplicateOutfitId then
            v10.navigateToNextOverlay(v24.props.navigation, l_AvatarScreen_0.DuplicateOutfitInfoPrompt, {
                duplicateOutfitId = v24.props.duplicateOutfitId, 
                saveAsNew = true
            });
            return;
        else
            v10.navigateToNextOverlay(v24.props.navigation, l_AvatarScreen_0.SaveOutfitPrompt);
            return;
        end;
    end;
    v24.updateExistingOutfit = function() --[[ Line: 85 ]]
        -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v24 (copy), v10 (ref), l_AvatarScreen_0 (ref)
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackUpdateAvatarClick();
        end;
        if v24.props.duplicateOutfitId then
            v10.navigateToNextOverlay(v24.props.navigation, l_AvatarScreen_0.DuplicateOutfitInfoPrompt, {
                duplicateOutfitId = v24.props.duplicateOutfitId, 
                saveAsNew = false
            });
            return;
        else
            v10.navigateFromOverlay(v24.props.navigation, l_AvatarScreen_0.UpdateOutfitPage);
            return;
        end;
    end;
    v24.manageCharacters = function() --[[ Line: 101 ]]
        -- upvalues: v10 (ref), v24 (copy), l_AvatarScreen_0 (ref)
        v10.navigateFromOverlay(v24.props.navigation, l_AvatarScreen_0.ManageOutfitPage);
    end;
    v24.closePrompt = function() --[[ Line: 105 ]]
        -- upvalues: v10 (ref), v24 (copy)
        v10.closeOverlay(v24.props.navigation);
    end;
    v24:setState({
        useFullWidth = false
    });
    v24.onNavOverlaySizeChanged = function(v25) --[[ Line: 113 ]]
        -- upvalues: v24 (copy)
        if v25.AbsoluteSize.X < 640 then
            if not v24.state.useFullWidth then
                v24:setState({
                    useFullWidth = true
                });
                return;
            end;
        elseif v24.state.useFullWidth then
            v24:setState({
                useFullWidth = false
            });
        end;
    end;
    local v26, v27 = v4.createBinding(UDim2.fromOffset(0, 0));
    v24.positionOffset = v26;
    v24.updatePositionOffset = v27;
    v24.onNavOverlayPositionChanged = function(v28) --[[ Line: 131 ]]
        -- upvalues: v24 (copy)
        v24.updatePositionOffset(UDim2.fromOffset(-v28.AbsolutePosition.X, -v28.AbsolutePosition.Y));
    end;
end;
v23.renderLocalized = function(v29, v30) --[[ Line: 136 ]] --[[ Name: renderLocalized ]]
    -- upvalues: l_MenuDirection_0 (copy), v4 (copy), v14 (copy), l_Focusable_0 (copy), v19 (copy), v6 (copy), l_ContextualMenu_0 (copy)
    local v31 = {};
    table.insert(v31, {
        text = v30.saveAsNew, 
        inputBindingKey = "CommonUI.Controls.Action.Confirm", 
        onActivated = v29.saveOutfitAsNew
    });
    table.insert(v31, {
        text = v30.updateExistingCharacter, 
        inputBindingKey = "CommonUI.Controls.Action.Confirm", 
        onActivated = v29.updateExistingOutfit
    });
    table.insert(v31, {
        text = v30.manageCharacters, 
        inputBindingKey = "CommonUI.Controls.Action.Confirm", 
        onActivated = v29.manageCharacters
    });
    local v32 = v29.props.saveTilePosition.Y + 25;
    local l_Down_0 = l_MenuDirection_0.Down;
    if v32 + #v31 * 56 + 12 > v29.props.screenSize.Y then
        v32 = v29.props.saveTilePosition.Y - 25;
        l_Down_0 = l_MenuDirection_0.Up;
    end;
    local v34 = UDim2.fromOffset(v29.props.saveTilePosition.X - 42, 0);
    local v35 = UDim2.new(0, 324, 1, 0);
    if v29.state.useFullWidth then
        v34 = UDim2.fromOffset(0, 0);
        v35 = UDim2.fromScale(1, 1);
    end;
    return v4.createElement(v14, {
        onAbsoluteSizeChanged = v29.onNavOverlaySizeChanged, 
        onAbsolutePositionChanged = v29.onNavOverlayPositionChanged
    }, {
        SizeFrame = v4.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Position = v34, 
            Size = v35, 
            [v4.Ref] = v29.props.defaultChildRef, 
            inputBindings = if v19 then nil else {
                NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, v29.closePrompt)
            }
        }, {
            PositionOffsetFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = not v29.state.useFullWidth and v29.positionOffset or nil, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ContextMenu = v4.createElement(l_ContextualMenu_0, {
                    buttonProps = v31, 
                    open = true, 
                    menuDirection = l_Down_0, 
                    openPositionY = UDim.new(0, v32), 
                    closeBackgroundVisible = true, 
                    screenSize = v29.props.screenSize, 
                    onDismiss = v29.closePrompt
                })
            })
        })
    });
end;
v23.render = function(v36) --[[ Line: 210 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v16 (copy), v15 (copy)
    return l_withLocalization_0({
        saveAsNew = v16 and "Feature.Avatar.Label.Title.AddNewAvatar" or "Feature.Avatar.Action.SaveAsNew", 
        updateExistingCharacter = v16 and "Feature.Avatar.Label.Title.UpdateAvatar" or "Feature.Avatar.Action.UpdateExistingCharacter", 
        manageCharacters = v15() and "Feature.Avatar.Label.Title.ManageAvatars" or "Feature.Avatar.Action.ManageCharacters"
    })(function(v37) --[[ Line: 221 ]]
        -- upvalues: v36 (copy)
        return v36:renderLocalized(v37);
    end);
end;
return (v9((v13((v5.connect(function(v38, _) --[[ Line: 226 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v12 (copy)
    return {
        duplicateOutfitId = v12(v38), 
        screenSize = v38.ScreenSize
    };
end, nil)(v23))))));