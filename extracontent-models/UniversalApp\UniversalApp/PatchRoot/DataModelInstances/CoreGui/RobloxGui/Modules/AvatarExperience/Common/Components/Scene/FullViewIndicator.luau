local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Otter);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local l_Images_0 = v8.App.ImageSet.Images;
local l_withStyle_0 = v8.Style.withStyle;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v14.Enums.AvatarScreen;
local l_AvatarRoute_0 = v14.AvatarRoute.AvatarRoute;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local v20 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v22 = l_Images_0["icons/actions/zoomIn"];
local v23 = Vector2.new(36, 36);
local v24 = l_Images_0["icons/controls/keys/xboxRS"];
local v25 = Vector2.new(36, 36);
local v26 = l_Images_0["component_assets/circle_49"];
local v27 = Vector2.new(49 + v25.X, (math.max(49, v25.Y)));
local v28 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v29) --[[ Line: 51 ]] --[[ Name: isGamepad ]]
    -- upvalues: l_isGamepadInput_0 (copy)
    return l_isGamepadInput_0(v29.UserInputType);
end;
local function _(v31, v32) --[[ Line: 55 ]] --[[ Name: keyBindingHasToggleMeta ]]
    -- upvalues: v17 (copy)
    local v33 = v32[v31];
    local v34 = false;
    if typeof(v33) == "table" then
        v34 = v33.tag == v17.SceneGamepad.FullViewIndicatorTag;
    end;
    return v34;
end;
local function _(v36) --[[ Line: 60 ]] --[[ Name: getMotorGoal ]]
    if v36 then
        return 0;
    else
        return 1;
    end;
end;
local v38 = v5.PureComponent:extend("FullViewIndicator");
v38.validateProps = v7.strictInterface({
    AnchorPoint = v7.Vector2, 
    Position = v7.UDim2, 
    LayoutOrder = v7.optional(v7.number), 
    boundInputs = v7.table, 
    isSceneFullView = v7.boolean, 
    avatarRoute = l_AvatarRoute_0.Interface
});
v38.getDerivedStateFromProps = function(v39, v40) --[[ Line: 80 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v17 (copy)
    local l_boundInputs_0 = v39.boundInputs;
    local l_lastGamepadKeyCode_0 = v40.lastGamepadKeyCode;
    local v43 = l_boundInputs_0[Enum.KeyCode.Thumbstick2];
    local v44 = false;
    if typeof(v43) == "table" then
        v44 = v43.tag == v17.SceneGamepad.FullViewIndicatorTag;
    end;
    local v45 = not v44;
    local v46 = l_boundInputs_0[Enum.KeyCode.ButtonR3];
    local v47 = false;
    if typeof(v46) == "table" then
        v47 = v46.tag == v17.SceneGamepad.FullViewIndicatorTag;
    end;
    v44 = not v47;
    v47 = nil;
    v47 = not v39.isSceneFullView and (not v45 and not (l_lastGamepadKeyCode_0 ~= Enum.KeyCode.Thumbstick2) or not v44 and l_lastGamepadKeyCode_0 == Enum.KeyCode.ButtonR3);
    if v47 ~= v40.isVisible then
        return {
            isVisible = v47
        };
    else
        return nil;
    end;
end;
v38.setStateIfChanged = function(v48, v49) --[[ Line: 108 ]] --[[ Name: setStateIfChanged ]]
    local v50 = {};
    for v51, v52 in v49 do
        if v48.state[v51] ~= v52 then
            v50[v51] = v52;
        end;
    end;
    if next(v50) then
        v48:setState(v50);
    end;
end;
v38.init = function(v53) --[[ Line: 121 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_isGamepadInput_0 (copy), l_GamepadUtils_0 (copy)
    v53:setState({
        lastGamepadKeyCode = nil
    });
    local v54, v55 = v5.createBinding(v53.state.isVisible and 0 or 1);
    v53.transparencyBinding = v54;
    v53.updateTransparencyBinding = v55;
    v53.onInputBegan = function(v56) --[[ Line: 128 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v53 (copy)
        if not l_isGamepadInput_0(v56.UserInputType) then
            return;
        else
            local v57 = false;
            if v56.KeyCode == Enum.KeyCode.ButtonR3 then
                v57 = not v53.props.isSceneFullView and not v53.state.isR3BindingOverridden;
            end;
            if v57 then
                return;
            else
                v53:setStateIfChanged({
                    lastGamepadKeyCode = v56.KeyCode
                });
                return;
            end;
        end;
    end;
    v53.onInputChanged = function(v58) --[[ Line: 148 ]]
        -- upvalues: l_isGamepadInput_0 (ref), l_GamepadUtils_0 (ref), v53 (copy)
        if not l_isGamepadInput_0(v58.UserInputType) then
            return;
        else
            local v59 = true;
            if v58.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                v59 = v58.KeyCode == Enum.KeyCode.Thumbstick2;
            end;
            if not v59 or l_GamepadUtils_0.normalizeStickByDeadzone(v58.Position) == Vector2.new(0, 0) then
                return;
            else
                v53:setStateIfChanged({
                    lastGamepadKeyCode = v58.KeyCode
                });
                return;
            end;
        end;
    end;
end;
v38.didMount = function(v60) --[[ Line: 168 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy)
    v60.transparencyMotor = v4.createSingleMotor(v60.state.isVisible and 0 or 1);
    v60.transparencyMotor:onStep(function(v61) --[[ Line: 171 ]]
        -- upvalues: v60 (copy)
        v60.updateTransparencyBinding(v61);
    end);
    v60.transparencyMotor:start();
end;
v38.willUpdate = function(v62, _, v64) --[[ Line: 178 ]] --[[ Name: willUpdate ]]
    -- upvalues: v4 (copy), v28 (copy)
    local l_isVisible_0 = v64.isVisible;
    if l_isVisible_0 ~= v62.state.isVisible then
        v62.transparencyMotor:setGoal(v4.spring(l_isVisible_0 and 0 or 1, v28));
    end;
end;
v38.render = function(v66) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: l_AvatarScreen_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v10 (copy), l_withStyle_0 (copy), v27 (copy), l_ImageSetLabel_0 (copy), v25 (copy), v24 (copy), v26 (copy), v23 (copy), v22 (copy)
    if v66.props.avatarRoute.opaque.name == l_AvatarScreen_0.AvatarExperienceLandingPage then
        return nil;
    else
        return v5.createFragment({
            InputBeganConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = v66.onInputBegan
            }, {
                InputChangedConnection = if v10 then nil else v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputChanged, 
                    callback = v66.onInputChanged
                })
            }), 
            InputChangedConnection = if v10 then v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputChanged, 
                callback = v66.onInputChanged
            }) else nil, 
            Indicator = l_withStyle_0(function(v67) --[[ Line: 213 ]]
                -- upvalues: v5 (ref), v66 (copy), v27 (ref), l_ImageSetLabel_0 (ref), v25 (ref), v24 (ref), v26 (ref), v23 (ref), v22 (ref)
                local l_Theme_0 = v67.Theme;
                return v5.createElement("Frame", {
                    AnchorPoint = v66.props.AnchorPoint, 
                    Position = v66.props.Position, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v27.X, 0, v27.Y)
                }, {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    ControllerButtonImage = v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v25.X, 0, v25.Y), 
                        BackgroundTransparency = 1, 
                        Image = v24, 
                        ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                        ImageTransparency = v66.transparencyBinding, 
                        LayoutOrder = 1
                    }), 
                    CircleBackground = v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, 49, 0, 49), 
                        BackgroundTransparency = 1, 
                        Image = v26, 
                        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        ImageTransparency = v66.transparencyBinding, 
                        LayoutOrder = 2
                    }, {
                        IndicatorImage = v5.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0, v23.X, 0, v23.Y), 
                            BackgroundTransparency = 1, 
                            Image = v22, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = v66.transparencyBinding
                        })
                    })
                });
            end)
        });
    end;
end;
v38.willUnmount = function(v69) --[[ Line: 261 ]] --[[ Name: willUnmount ]]
    v69.transparencyMotor:destroy();
end;
return (v21((v6.connect(function(v70, v71) --[[ Line: 265 ]]
    -- upvalues: v20 (copy)
    return {
        boundInputs = v70.GamepadBottomBar.boundInputs, 
        isSceneFullView = v20.getIsSceneFullViewFromState(v70, v71.avatarRoute)
    };
end)(v38))));