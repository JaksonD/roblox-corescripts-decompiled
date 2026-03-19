local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Focusable_0 = v4.Focusable;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v10 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v11 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v13 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v14 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v15 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v18 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates);
local v21 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings;
local function v27(v26) --[[ Line: 48 ]] --[[ Name: selectIsPortrait ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return v26.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
return (v9((v8(function(v28) --[[ Line: 53 ]] --[[ Name: AvatarRefinement ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v2 (copy), l_useSelector_0 (copy), v27 (copy), l_useDispatch_0 (copy), v15 (copy), v18 (copy), l_useLocalization_0 (copy), v13 (copy), l_AvatarScreen_0 (copy), v14 (copy), v20 (copy), v10 (copy), v3 (copy), v23 (copy), v21 (copy), v11 (copy), v12 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 (copy), v22 (copy)
    local v29 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.useRootFocusController();
    local v30 = v2.useRef(nil);
    local v31 = v2.useRef(nil);
    local v32 = l_useSelector_0(v27);
    local v33 = l_useDispatch_0();
    local v34 = v15(v18);
    local v35 = l_useLocalization_0({
        titleText = "Feature.Avatar.Title.AvatarRefinement"
    });
    v33(v13(v34, l_AvatarScreen_0.AvatarRefinement, v14.SceneFullView));
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v33 (copy), v20 (ref)
        return function() --[[ Line: 66 ]]
            -- upvalues: v33 (ref), v20 (ref)
            v33(v20());
        end;
    end, {});
    local v36 = {
        TopBar = v2.createElement(v10.Container, {
            titleText = v35.titleText, 
            NextSelectionDown = v30, 
            transparentBackground = true, 
            hideSiteMessageBanner = v32, 
            leftItem = v10.makeBackButton(function() --[[ Line: 78 ]]
                -- upvalues: v33 (copy), v20 (ref), v28 (copy)
                v33(v20());
                v28.navigation.pop();
            end), 
            [v3.Ref] = v31
        }), 
        RefinementNavBar = v2.createElement(if v23() then v21 else v11, {
            ref = v30, 
            NextSelectionUp = v31
        }), 
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v12, {
            focusController = v29, 
            captureFocusOnMount = true
        })
    };
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v29, 
        defaultChild = v30
    }, if l_FFlagAXMigrateSceneGamepadHandlerInputBindings_0 then v2.createElement(v22, nil, v36) else v36);
end))));