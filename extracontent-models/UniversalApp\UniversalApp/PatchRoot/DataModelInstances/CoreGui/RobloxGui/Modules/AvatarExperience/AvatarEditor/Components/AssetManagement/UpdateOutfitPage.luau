local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v13 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v14 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v12.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit);
local l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateUpdateOutfitPageToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ActionBar_0 = v11.App.Button.ActionBar;
local l_withStyle_0 = v11.Style.withStyle;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local l_Focusable_0 = v10.Focusable;
local v35 = l_Images_0["icons/navigation/close"];
local v36 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.UpdateOutfit
};
local function v42(v37, v38) --[[ Line: 67 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v13 (copy), v36 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v14 (copy)
    local v39 = v13.useEventMap(v36, v37);
    local v41 = v3.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v38 (copy), v14 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.UpdateOutfit] = if v38 then {
                handler = v14.onRelease(function(_) --[[ Line: 73 ]]
                    -- upvalues: v38 (ref)
                    v38();
                end)
            } else nil
        };
    end, {
        v38
    });
    return v13.useEventHandlerMap(v41, v39);
end;
local v43 = v4.PureComponent:extend("UpdateOutfitPage");
v43.validateProps = v6.strictInterface({
    focusNavigationRef = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v6.table else nil, 
    selectedOutfit = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v6.optional(v6.string) else nil, 
    setSelectedOutfit = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v6.callback else nil, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.optional(v6.table), 
    networking = if l_FFlagAXModeratedItemsFlow_0 then v6.callback else nil, 
    navigation = v6.table, 
    avatarRoute = v6.table, 
    avatarEditorAnalytics = v6.table, 
    updateSavedOutfit = v6.callback
});
v43.init = function(v44) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v10 (copy), v4 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_withStyle_0 (copy), l_IconButton_0 (copy), v35 (copy), l_IconSize_0 (copy)
    if not l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then
        v44:setState({
            selectedOutfit = nil
        });
    end;
    v44.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v44.props.focusController or v10.createFocusController();
    v44.exitButtonRef = v4.createRef();
    v44.gridViewRef = v4.createRef();
    v44.actionBarRef = v4.createRef();
    v44.navigateBack = function() --[[ Line: 118 ]]
        -- upvalues: v44 (copy)
        v44.props.navigation.goBack();
    end;
    v44.selectedOutfitUpdated = function(v45) --[[ Line: 122 ]]
        -- upvalues: l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 (ref), v44 (copy), v4 (ref)
        if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then
            v44.props.setSelectedOutfit(v45[1] or nil);
            return;
        else
            v44:setState({
                selectedOutfit = v45[1] or v4.None
            });
            return;
        end;
    end;
    v44.updateOutfit = function() --[[ Line: 132 ]]
        -- upvalues: l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 (ref), v44 (copy), l_FFlagAXModeratedItemsFlow_0 (ref)
        local v46 = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v44.props.selectedOutfit else v44.state.selectedOutfit;
        if not v46 then
            return;
        else
            if l_FFlagAXModeratedItemsFlow_0 then
                v44.props.updateSavedOutfit(v44.props.avatarEditorAnalytics, v46, v44.props.networking);
            else
                v44.props.updateSavedOutfit(v44.props.avatarEditorAnalytics, v46);
            end;
            v44.navigateBack();
            return;
        end;
    end;
    v44.renderExitButton = function() --[[ Line: 150 ]]
        -- upvalues: l_withStyle_0 (ref), v4 (ref), l_IconButton_0 (ref), v35 (ref), l_IconSize_0 (ref), v44 (copy)
        return l_withStyle_0(function(v47) --[[ Line: 151 ]]
            -- upvalues: v4 (ref), l_IconButton_0 (ref), v35 (ref), l_IconSize_0 (ref), v44 (ref)
            local l_Theme_0 = v47.Theme;
            return v4.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v35, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v44.navigateBack, 
                buttonRef = v44.exitButtonRef, 
                NextSelectionDown = v44.gridViewRef
            });
        end);
    end;
end;
v43.renderWithProviders = function(v49, v50, v51) --[[ Line: 168 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v10 (copy), v22 (copy), v23 (copy), v24 (copy), l_AvatarScreen_0 (copy), l_ActionBar_0 (copy)
    local l_Theme_1 = v51.Theme;
    local v53 = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v49.props.selectedOutfit else v49.state.selectedOutfit;
    return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v49.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v49.gridViewRef, 
        [v4.Ref] = if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then v49.props.focusNavigationRef else nil, 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then nil else {
            NavigateBack = v10.Input.onBegin(Enum.KeyCode.ButtonB, v49.navigateBack), 
            Update = if v53 then v10.Input.onBegin(Enum.KeyCode.ButtonX, v49.updateOutfit, {
                key = "Feature.Avatar.Action.Update"
            }) else nil
        }
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v22), 
        NavOverlayPageContainer = v4.createElement(v23, {
            headerBarProps = {
                title = v50.selectToUpdate, 
                renderLeft = v49.renderExitButton
            }, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v49.focusController, 
            onDismiss = v49.navigateBack
        }, {
            OutfitSelectionGrid = v4.createElement(v24, {
                selectedOutfits = {
                    v53
                }, 
                selectionUpdated = v49.selectedOutfitUpdated, 
                goBack = v49.navigateBack, 
                pageOwner = l_AvatarScreen_0.UpdateOutfitPage, 
                NextSelectionUp = v49.exitButtonRef, 
                NextSelectionDown = v49.actionBarRef, 
                [v4.Ref] = v49.gridViewRef
            }), 
            ActionBarBackgroundGapFiller = v53 ~= nil and v4.createElement("Frame", {
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                Size = UDim2.new(1, 0, 0, 48), 
                ZIndex = 2
            }) or nil, 
            ActionBarContainer = v53 ~= nil and v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                ActionBar = v4.createElement(l_ActionBar_0, {
                    button = {
                        props = {
                            text = v50.update, 
                            onActivated = v49.updateOutfit
                        }
                    }, 
                    NextSelectionUp = v49.gridViewRef, 
                    [v4.Ref] = v49.actionBarRef
                })
            }) or nil
        })
    });
end;
v43.render = function(v54) --[[ Line: 246 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    return l_withLocalization_0({
        selectToUpdate = "Feature.Avatar.Heading.SelectToUpdate", 
        update = "Feature.Avatar.Action.Update"
    })(function(v55) --[[ Line: 250 ]]
        -- upvalues: l_withStyle_0 (ref), v54 (copy)
        return l_withStyle_0(function(v56) --[[ Line: 251 ]]
            -- upvalues: v54 (ref), v55 (copy)
            return v54:renderWithProviders(v55, v56);
        end);
    end);
end;
v43 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v18, 
    networking = if l_FFlagAXModeratedItemsFlow_0 then v19 else nil
})(v43);
v43 = v20((v5.connect(nil, function(v57) --[[ Line: 262 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagAXModeratedItemsFlow_0 (copy), v25 (copy)
    return {
        updateSavedOutfit = function(v58, v59, v60) --[[ Line: 264 ]] --[[ Name: updateSavedOutfit ]]
            -- upvalues: l_FFlagAXModeratedItemsFlow_0 (ref), v57 (copy), v25 (ref)
            if l_FFlagAXModeratedItemsFlow_0 then
                v57(v25(v58, v59, nil, nil, v60));
                return;
            else
                v57(v25(v58, v59));
                return;
            end;
        end
    };
end)(v43)));
if l_FFlagAXMigrateUpdateOutfitPageToFocusNavigation_0 then
    return function(v61) --[[ Line: 279 ]]
        -- upvalues: v9 (copy), v18 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v19 (copy), l_useDispatch_0 (copy), v3 (copy), v25 (copy), v42 (copy), l_useTableWrappedCallbackRef_0 (copy), v43 (ref), v2 (copy)
        local v62 = v9(v18);
        local v63 = if l_FFlagAXModeratedItemsFlow_0 then v9(v19) else nil;
        local v64 = l_useDispatch_0();
        local v65, v66 = v3.useState(nil);
        local v67 = v3.useCallback(function() --[[ Line: 285 ]]
            -- upvalues: v65 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v64 (copy), v25 (ref), v62 (copy), v63 (copy), v61 (copy)
            if not v65 then
                return;
            else
                if l_FFlagAXModeratedItemsFlow_0 then
                    v64(v25(v62, v65, nil, nil, v63));
                else
                    v64(v25(v62, v65));
                end;
                v61.navigation.goBack();
                return;
            end;
        end, {
            v65, 
            v61.navigation, 
            v62, 
            v63
        });
        local v68 = v42(nil, if v65 then v67 else nil);
        local v69 = l_useTableWrappedCallbackRef_0(v68);
        return v3.createElement(v43, v2.Dictionary.join(v61, {
            focusNavigationRef = v69, 
            selectedOutfit = v65, 
            setSelectedOutfit = v66
        }));
    end;
else
    return v43;
end;