local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_CorePackages_0.Packages.RoactNavigation);
local v10 = require(l_CorePackages_0.Packages.t);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v14 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v18 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.scene");
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXPhotoboothReplacesFullview_0 = v19.FFlagAXPhotoboothReplacesFullview;
local l_FFlagAXPhotoboothAnalytics_0 = v19.FFlagAXPhotoboothAnalytics;
local l_sendUnifiedEventLogForInstance_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local function _(v25) --[[ Line: 42 ]] --[[ Name: splitInputType ]]
    local v26 = v25.UserInputType == Enum.UserInputType.Touch;
    local v27 = v25.UserInputType == Enum.UserInputType.MouseButton1;
    local v28 = v25.UserInputType == Enum.UserInputType.MouseButton2;
    return v26, v27 or v28, v27, v28;
end;
local function v32(v30) --[[ Line: 51 ]] --[[ Name: isDoubleTapToZoomEnabled ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXPhotoboothReplacesFullview_0 (copy), v20 (copy)
    local v31 = true;
    if v30 ~= l_AvatarScreen_0.AvatarEditor then
        v31 = true;
        if v30 ~= l_AvatarScreen_0.Catalog then
            v31 = true;
            if v30 ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
                v31 = true;
                if v30 ~= l_AvatarScreen_0.CatalogSearch then
                    v31 = true;
                    if v30 ~= l_AvatarScreen_0.MySharedAvatars then
                        v31 = l_FFlagAXPhotoboothReplacesFullview_0 and v30 == l_AvatarScreen_0.Photobooth or v20() and v30 == l_AvatarScreen_0.AvatarSwitcher or v20() and v30 == l_AvatarScreen_0.EditEmotes;
                    end;
                end;
            end;
        end;
    end;
    return v31;
end;
local v33 = nil;
if l_FFlagAXPhotoboothReplacesFullview_0 then
    v33 = function(v34) --[[ Line: 64 ]]
        -- upvalues: l_AvatarScreen_0 (copy), v20 (copy)
        local v35 = true;
        if v34 ~= l_AvatarScreen_0.AvatarEditor then
            v35 = true;
            if v34 ~= l_AvatarScreen_0.Photobooth then
                v35 = v20() and v34 == l_AvatarScreen_0.AvatarSwitcher;
            end;
        end;
        return v35;
    end;
end;
local v36 = v6.PureComponent:extend("SharedInteractionFrame");
v36.validateProps = v10.interface({
    panByPixels = v10.callback, 
    rotateByPixels = v10.callback, 
    setAngularVelocityByPixels = v10.callback, 
    zoomToPoint = v10.callback, 
    Size = v10.optional(v10.UDim2), 
    Position = v10.optional(v10.UDim2), 
    ZIndex = v10.optional(v10.number), 
    fullView = v10.optional(v10.userdata), 
    setFullView = v10.callback, 
    analytics = v10.table
});
v36.disconnectEvents = function(v37) --[[ Line: 91 ]] --[[ Name: disconnectEvents ]]
    v37.inputChangedConnection:Disconnect();
    v37.inputEndedConnection:Disconnect();
    v37.renderSteppedConnection:Disconnect();
    v37.inputChangedConnection = nil;
    v37.inputEndedConnection = nil;
    v37.renderSteppedConnection = nil;
end;
v36.getActiveInput = function(v38, v39) --[[ Line: 100 ]] --[[ Name: getActiveInput ]]
    local v40 = v39.UserInputType == Enum.UserInputType.Touch;
    local v41 = v39.UserInputType == Enum.UserInputType.MouseButton1;
    local v42 = v39.UserInputType == Enum.UserInputType.MouseButton2;
    local v43 = v41 or v42;
    local l_v40_0 = v40;
    local l_v43_0 = v43;
    v41 = v39.UserInputType == Enum.UserInputType.MouseMovement or l_v43_0;
    if not v41 and not l_v40_0 then
        return;
    else
        v42 = nil;
        if v41 then
            return v38.activeMouseInput;
        else
            if l_v40_0 then
                v42 = v38.activeTouchInputs[v39];
            end;
            return v42;
        end;
    end;
end;
v36.removeActivePointerInput = function(v46, v47, v48) --[[ Line: 119 ]] --[[ Name: removeActivePointerInput ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v48 then
        if not (l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
            v46.activeMouseInput = nil;
        else
            return;
        end;
    else
        v46.activeTouchInputs[v47] = nil;
        v46.numActiveTouchInputs = v46.numActiveTouchInputs - 1;
    end;
    v46.numActiveInputs = v46.numActiveInputs - 1;
    if v46.numActiveInputs == 0 then
        v46:disconnectEvents();
    end;
end;
v36.doubleTapToggleFullView = function(v49) --[[ Line: 142 ]] --[[ Name: doubleTapToggleFullView ]]
    -- upvalues: v32 (copy), l_FFlagAXPhotoboothReplacesFullview_0 (copy), v33 (ref), l_AvatarScreen_0 (copy), l_FFlagAXPhotoboothAnalytics_0 (copy), l_sendUnifiedEventLogForInstance_0 (copy), l_UnifiedEventLogEnums_0 (copy), v14 (copy)
    local l_name_0 = v49.props.avatarRoute.opaque.name;
    if not v32(l_name_0) then
        return;
    elseif l_FFlagAXPhotoboothReplacesFullview_0 and v33(l_name_0) then
        if l_name_0 == l_AvatarScreen_0.Photobooth then
            v49.props.navigation.goBack();
            return;
        else
            if l_FFlagAXPhotoboothAnalytics_0 and v49.frameRef and v49.frameRef.current then
                l_sendUnifiedEventLogForInstance_0(v49.frameRef.current, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "Photobooth_Opened"
                });
            end;
            v49.props.navigation.navigate(l_AvatarScreen_0.Photobooth);
            return;
        end;
    else
        local v51 = v49.props.fullView == v14.None and v14.SceneFullView or v14.None;
        v49.props.setFullView(v49.props.analytics, l_name_0, v51);
        return;
    end;
end;
v36.handleDoubleTap = function(v52, v53, v54) --[[ Line: 168 ]] --[[ Name: handleDoubleTap ]]
    if v52.lastPrimaryPointerInputBeganPosition then
        local v55 = v52.lastPrimaryPointerInputBeganPosition - v53.Position;
        local v56 = v54 - v52.lastPrimaryPointerInputBeganTime;
        if v55.Magnitude < 30 and v56 < 0.25 then
            v52:doubleTapToggleFullView();
        end;
    end;
    v52.lastPrimaryPointerInputBeganPosition = v53.Position;
    v52.lastPrimaryPointerInputBeganTime = v54;
end;
v36.addActivePointerInput = function(v57, v58, v59, v60) --[[ Line: 182 ]] --[[ Name: addActivePointerInput ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy)
    if v57:getActiveInput(v58) then
        return;
    else
        local v61 = {
            lastPosition = v58.Position, 
            lastTime = v60
        };
        if v59 then
            v57.activeMouseInput = v61;
        else
            v57.activeTouchInputs[v58] = v5.Dictionary.join(v61, {
                lastDeltaTime = 0, 
                lastDeltaPosition = Vector3.new(0, 0, 0, 0)
            });
            v57.numActiveTouchInputs = v57.numActiveTouchInputs + 1;
        end;
        v57.numActiveInputs = v57.numActiveInputs + 1;
        if v57.numActiveInputs == 1 then
            v57.props.setAngularVelocityByPixels(0);
            v57.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(v57.onInputChanged);
            v57.inputEndedConnection = l_UserInputService_0.InputEnded:Connect(v57.onInputEnded);
            v57.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(v57.setInputNotChanged);
        end;
        return;
    end;
end;
v36.init = function(v62) --[[ Line: 211 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy)
    v62.inputChangedConnection = nil;
    v62.inputEndedConnection = nil;
    v62.frameRef = v6.createRef();
    v62.lastPinchDistance = 1;
    v62.lastPanTime = 0;
    v62.lastPrimaryPointerInputBeganTime = 0;
    v62.lastPrimaryPointerInputBeganPosition = nil;
    v62.activeTouchInputs = {};
    v62.numActiveTouchInputs = 0;
    v62.activeMouseInput = nil;
    v62.numActiveInputs = 0;
    v62.handleScroll = function(_, v64) --[[ Line: 227 ]]
        -- upvalues: v62 (copy), l_UserInputService_0 (ref)
        if v64.UserInputType == Enum.UserInputType.MouseWheel then
            local v65 = -v64.Position.Z;
            v62.props.zoomToPoint(v65, l_UserInputService_0:GetMouseLocation());
        end;
    end;
    v62.setInputNotChanged = function(_) --[[ Line: 234 ]]
        -- upvalues: v62 (copy)
        for _, v68 in v62.activeTouchInputs do
            v68.changedThisFrame = false;
        end;
    end;
    v62.onInputChanged = function(v69, _) --[[ Line: 240 ]]
        -- upvalues: v62 (copy), l_UserInputService_0 (ref)
        local v71 = v69.UserInputType == Enum.UserInputType.MouseMovement;
        local v72 = v69.UserInputType == Enum.UserInputType.Touch;
        if not (v71 or v72) then
            return;
        else
            local v73 = v62:getActiveInput(v69);
            if not v73 then
                return;
            else
                local v74 = tick();
                local v75 = v74 - v73.lastTime;
                local v76 = v69.Position - v73.lastPosition;
                local v77 = Vector2.new(v76.X, v76.Y) * Vector2.new(-1, 1);
                local v78 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
                local v79 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
                local v80 = v74 - v62.lastPanTime > 0.1;
                if (v71 and v78 or v72 and v62.numActiveTouchInputs == 1) and v80 then
                    v62.props.rotateByPixels(-v77.X);
                end;
                if v71 and v79 or v72 and v62.numActiveTouchInputs == 2 then
                    local v81 = v77 / v62.numActiveInputs;
                    v62.props.panByPixels(v81);
                    v62.lastPanTime = v74;
                end;
                v73.lastPosition = v69.Position;
                v73.lastTime = v74;
                if v72 then
                    if v73.changedThisFrame then
                        v73.lastDeltaPosition = v76 + v73.lastDeltaPosition;
                        v73.lastDeltaTime = v75 + v73.lastDeltaTime;
                        return;
                    else
                        v73.lastDeltaPosition = v76;
                        v73.lastDeltaTime = v75;
                        v73.changedThisFrame = true;
                    end;
                end;
                return;
            end;
        end;
    end;
    v62.onInputEnded = function(v82, _) --[[ Line: 292 ]]
        -- upvalues: v62 (copy)
        local v84 = v82.UserInputType == Enum.UserInputType.Touch;
        local v85 = v82.UserInputType == Enum.UserInputType.MouseButton1;
        local v86 = v82.UserInputType == Enum.UserInputType.MouseButton2;
        local v87 = v85 or v86;
        local l_v84_0 = v84;
        local l_v87_0 = v87;
        local l_v85_0 = v85;
        if not (l_v84_0 or l_v87_0) then
            return;
        else
            v85 = v62:getActiveInput(v82);
            if not v85 then
                return;
            else
                v86 = tick();
                v87 = v86 - v62.lastPanTime;
                local v91 = l_v84_0 and v85.changedThisFrame;
                local v92 = false;
                if v62.numActiveInputs == 1 then
                    v92 = v87 > 0.1;
                end;
                if (v91 or l_v85_0) and v92 then
                    local v93 = nil;
                    local v94 = nil;
                    if l_v85_0 then
                        v93 = v82.Position - v85.lastPosition;
                        v94 = v86 - v85.lastTime;
                    else
                        v93 = v85.lastDeltaPosition;
                        v94 = v85.lastDeltaTime;
                    end;
                    v62.props.setAngularVelocityByPixels(v93.X / v94);
                end;
                v62:removeActivePointerInput(v82, l_v87_0);
                return;
            end;
        end;
    end;
    v62.onInputBegan = function(v95, v96) --[[ Line: 330 ]]
        -- upvalues: v62 (copy)
        v62.handleScroll(v95, v96);
        local v97 = v96.UserInputType == Enum.UserInputType.Touch;
        local v98 = v96.UserInputType == Enum.UserInputType.MouseButton1;
        local v99 = v96.UserInputType == Enum.UserInputType.MouseButton2;
        local v100 = v98 or v99;
        local l_v97_0 = v97;
        local l_v100_0 = v100;
        local l_v98_0 = v98;
        if not (l_v97_0 or l_v100_0) then
            return;
        else
            v98 = l_v97_0 or l_v98_0;
            v99 = tick();
            if v98 then
                v62:handleDoubleTap(v96, v99);
            end;
            v62:addActivePointerInput(v96, l_v100_0, v99);
            return;
        end;
    end;
    v62.onTouchPinch = function(_, v105, _, _, v108) --[[ Line: 350 ]]
        -- upvalues: v62 (copy)
        if v105[2] == nil then
            return;
        elseif v108 == Enum.UserInputState.Begin then
            v62.lastPinchDistance = (v105[1] - v105[2]).Magnitude;
            return;
        else
            local l_Magnitude_0 = (v105[1] - v105[2]).Magnitude;
            local v110 = l_Magnitude_0 - v62.lastPinchDistance;
            v62.lastPinchDistance = l_Magnitude_0;
            v62.props.zoomToPoint(v110 * -0.05, (v105[1] + v105[2]) / 2);
            return;
        end;
    end;
end;
v36.willUnmount = function(v111) --[[ Line: 367 ]] --[[ Name: willUnmount ]]
    if v111.inputChangedConnection then
        v111:disconnectEvents();
    end;
end;
v36.shouldBeVisible = function(v112) --[[ Line: 373 ]] --[[ Name: shouldBeVisible ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy)
    local v113 = l_AvatarScreenProperties_0[v112.props.avatarRoute.current.name];
    if v113 and v113.coversSceneWhenExpanded and v112.props.itemDetailsExpanded then
        return false;
    else
        return true;
    end;
end;
v36.render = function(v114) --[[ Line: 386 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v6 (copy)
    local v115 = v114:shouldBeVisible();
    v18:trace("SharedInteractionFrame visible: {}", v115);
    local v116 = v114.props.Size or UDim2.new(1, 0, 1, 0);
    local l_Position_0 = v114.props.Position;
    local l_ZIndex_0 = v114.props.ZIndex;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v116, 
        Position = l_Position_0, 
        ZIndex = l_ZIndex_0, 
        Visible = v115, 
        Active = true, 
        [v6.Event.InputBegan] = v114.onInputBegan, 
        [v6.Event.InputChanged] = v114.handleScroll, 
        [v6.Event.TouchPinch] = v114.onTouchPinch, 
        [v6.Ref] = v114.frameRef
    }, v114.props[v6.Children]);
end;
v36 = v7.connect(function(v119, v120) --[[ Line: 410 ]]
    -- upvalues: v16 (copy)
    local l_name_1 = v120.avatarRoute.opaque.name;
    return {
        fullView = v16(v119, l_name_1), 
        itemDetailsExpanded = v119.AvatarExperience.Common.ItemDetailsExpanded
    };
end, function(v122) --[[ Line: 417 ]]
    -- upvalues: v13 (copy)
    return {
        setFullView = function(v123, v124, v125) --[[ Line: 419 ]] --[[ Name: setFullView ]]
            -- upvalues: v122 (copy), v13 (ref)
            v122(v13(v123, v124, v125));
        end
    };
end)(v36);
v36 = v17((l_RoactServices_0.connect({
    analytics = v12
})(v36)));
if l_FFlagAXPhotoboothReplacesFullview_0 then
    v36 = v9.withNavigation(v36);
end;
return v36;