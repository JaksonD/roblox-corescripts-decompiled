local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local v14 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v16 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v21 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks);
local l_CursorKind_0 = v12.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v12.App.SelectionImage.withSelectionCursorProvider;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v25 = {
    vertical = {
        key = "Feature.Avatar.Action.Zoom"
    }, 
    horizontal = {
        key = "Feature.Avatar.Action.Rotate"
    }
};
local v26 = v5.PureComponent:extend("SceneGamepadHandler");
v26.validateProps = v11.interface({
    [v5.Children] = v11.optional(v11.table), 
    panByDistance = v11.callback, 
    rotateByRadians = v11.callback, 
    zoomStraight = v11.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.table, 
    defaultChild = v11.optional(v11.table), 
    NextSelectionLeft = v11.optional(v11.table), 
    NextSelectionRight = v11.optional(v11.table), 
    NextSelectionUp = v11.optional(v11.table), 
    NextSelectionDown = v11.optional(v11.table), 
    isSceneFullView = v11.boolean, 
    focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v11.optional(v11.callback) else nil
});
v26.init = function(v27) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_GamepadUtils_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_GuiService_0 (copy), v16 (copy)
    v27.mainRef = v5.createRef();
    v27.isolateRef = v5.createRef();
    v27.rotateAndZoom = function(v28, v29) --[[ Line: 80 ]]
        -- upvalues: l_GamepadUtils_0 (ref), v27 (copy)
        l_GamepadUtils_0.rotateAndZoom(v28, v29, v27.props.setAngularVelocityByPixels, v27.props.rotateByRadians, v27.props.zoomStraight);
    end;
    v27.pan = function(v30, v31) --[[ Line: 90 ]]
        -- upvalues: l_GamepadUtils_0 (ref), v27 (copy)
        local v32 = l_GamepadUtils_0.normalizeStickByDeadzone(v30.Position);
        if v32 == Vector2.new(0, 0) then
            return;
        else
            v27.props.panByDistance(v31 * v32 * 5);
            return;
        end;
    end;
    v27.toggleFullView = function() --[[ Line: 99 ]]
        -- upvalues: v27 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_GuiService_0 (ref), v16 (ref)
        local l_name_0 = v27.props.avatarRoute.opaque.name;
        local v34 = true;
        if l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
            v34 = true;
            if l_name_0 ~= l_AvatarScreen_0.MySharedAvatars then
                v34 = true;
                if l_name_0 ~= l_AvatarScreen_0.Catalog then
                    v34 = true;
                    if l_name_0 ~= l_AvatarScreen_0.CatalogSearch then
                        v34 = l_name_0 == l_AvatarScreen_0.ProfilePictureEditorEmotes;
                    end;
                end;
            end;
        end;
        if not v34 then
            return;
        else
            if v27.props.isSceneFullView then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v27.props.focusGuiObject and v27.oldFocus.current then
                        v27.props.focusGuiObject(v27.oldFocus.current);
                    end;
                else
                    v27.props.focusController.moveFocusTo(v27.oldFocus.current);
                    v27.oldFocus = nil;
                end;
            elseif l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v27.oldFocus.current = l_GuiService_0.SelectedCoreObject;
                if v27.props.focusGuiObject and v27.isolateRef.current then
                    v27.props.focusGuiObject(v27.isolateRef.current);
                end;
            else
                v27.oldFocus = v27.props.focusController.getCurrentFocus();
                v27.props.focusController.moveFocusTo(v27.isolateRef);
            end;
            local l_setFullView_0 = v27.props.setFullView;
            local l_isSceneFullView_0 = v27.props.isSceneFullView;
            local v37 = nil;
            v37 = if l_isSceneFullView_0 then v16.None else v16.SceneFullView;
            l_setFullView_0(v27.props.analytics, v27.props.avatarRoute.opaque.name, v37);
            return;
        end;
    end;
    v27.renderWithCursorCallback = function(...) --[[ Line: 145 ]]
        -- upvalues: v27 (copy)
        return v27:renderWithCursor(...);
    end;
end;
v26.renderWithCursor = function(v38, v39) --[[ Line: 150 ]] --[[ Name: renderWithCursor ]]
    -- upvalues: v5 (copy), l_Focusable_0 (copy), v6 (copy), v18 (copy), v25 (copy), v4 (copy), l_CursorKind_0 (copy)
    local l_isSceneFullView_1 = v38.props.isSceneFullView;
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        inputBindings = {
            RotateAndZoom = v6.Input.onStep(Enum.KeyCode.Thumbstick2, v38.rotateAndZoom, {
                tag = v18.SceneGamepad.FullViewIndicatorTag, 
                axes = l_isSceneFullView_1 and v25 or nil
            }), 
            Pan = l_isSceneFullView_1 and v6.Input.onStep(Enum.KeyCode.Thumbstick1, v38.pan, {
                key = "Feature.Avatar.Action.Pan"
            }) or nil, 
            ToggleFullView = v6.Input.onBegin(Enum.KeyCode.ButtonR3, v38.toggleFullView, {
                tag = v18.SceneGamepad.FullViewIndicatorTag, 
                key = l_isSceneFullView_1 and "Feature.Avatar.Action.DefaultView" or nil
            }), 
            ExitFullView = if l_isSceneFullView_1 then v6.Input.onBegin(Enum.KeyCode.ButtonB, v38.toggleFullView) else nil
        }, 
        NextSelectionLeft = v38.props.NextSelectionLeft, 
        NextSelectionRight = v38.props.NextSelectionRight, 
        NextSelectionUp = v38.props.NextSelectionUp, 
        NextSelectionDown = v38.props.NextSelectionDown, 
        defaultChild = v38.props.defaultChild, 
        [v5.Ref] = v38.mainRef
    }, v4.Dictionary.join(v38.props[v5.Children], {
        FocusIsolate = v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            SelectionImageObject = v39(l_CursorKind_0.Invisible), 
            [v5.Ref] = v38.isolateRef
        })
    }));
end;
v26.render = function(v41) --[[ Line: 194 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(v41.renderWithCursorCallback);
end;
v26 = v8.connect(function(v42, v43) --[[ Line: 198 ]]
    -- upvalues: v19 (copy)
    return {
        isSceneFullView = v19.getIsSceneFullViewFromState(v42, v43.avatarRoute)
    };
end, function(v44) --[[ Line: 202 ]]
    -- upvalues: v15 (copy)
    return {
        setFullView = function(v45, v46, v47) --[[ Line: 204 ]] --[[ Name: setFullView ]]
            -- upvalues: v44 (copy), v15 (ref)
            v44(v15(v45, v46, v47));
        end
    };
end)(v26);
v26 = l_RoactServices_0.connect({
    analytics = v14
})(v26);
return (v20((v21(function(v48) --[[ Line: 214 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v5 (copy), v26 (ref), v6 (copy), v4 (copy)
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v48.focusGuiObject = l_useFocusGuiObject_0();
        return v5.createElement(v26, v48);
    else
        return v6.withFocusController(function(v49) --[[ Line: 221 ]]
            -- upvalues: v5 (ref), v26 (ref), v4 (ref), v48 (copy)
            return v5.createElement(v26, v4.Dictionary.join(v48, {
                focusController = v49
            }));
        end);
    end;
end))));