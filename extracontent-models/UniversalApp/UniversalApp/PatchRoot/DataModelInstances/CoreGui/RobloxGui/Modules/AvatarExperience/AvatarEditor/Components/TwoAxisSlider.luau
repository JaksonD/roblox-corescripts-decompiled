local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.ReactUtils);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Packages.Otter);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local l_Focusable_0 = v9.Focusable;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local v13 = require(l_CorePackages_0.Packages.t);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_useInitializedValue_0 = v4.useInitializedValue;
local v16 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v17 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v18 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v16.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_ImageSetLabel_0 = v12.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v12.App.ImageSet.Images;
local l_Colors_0 = v12.App.Style.Colors;
local l_CursorKind_0 = v12.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v12.App.SelectionImage.useSelectionCursor;
local l_withSelectionCursorProvider_0 = v12.App.SelectionImage.withSelectionCursorProvider;
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateTwoAxisSliderToContainer2", false);
local v29 = game:DefineFastFlag("AXFixMissingThumbstickInputObject", false);
local v30 = l_Images_0["component_assets/dropshadow_28"];
local v31 = l_Images_0["component_assets/circle_29"];
local l_White_0 = l_Colors_0.White;
local l_Pumice_0 = l_Colors_0.Pumice;
local l_Pumice_1 = l_Colors_0.Pumice;
local v35 = v27 and 0.5 or 0.7;
local v36 = v27 and 0.2 or 0.5;
local v37 = {
    frequency = 5
};
local v38 = {};
local function v44() --[[ Line: 70 ]] --[[ Name: getInputObjects ]]
    -- upvalues: l_UserInputService_0 (copy), v38 (ref)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if v38[l_l_UserInputService_0_LastInputType_0] == nil then
        local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(l_l_UserInputService_0_LastInputType_0);
        local v41 = {};
        for _, v43 in ipairs(l_l_UserInputService_0_GamepadState_0) do
            v41[v43.KeyCode] = v43;
        end;
        v38[l_l_UserInputService_0_LastInputType_0] = v41;
    end;
    return v38[l_l_UserInputService_0_LastInputType_0];
end;
if v28 then
    local function v52(v45, v46, v47, v48) --[[ Line: 88 ]] --[[ Name: useFocusNavigationBindings ]]
        -- upvalues: v17 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v18 (copy)
        local v49 = v17.useEventMap(v46, v45);
        local v51 = v7.useMemo(function() --[[ Line: 95 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v47 (copy), v18 (ref), v48 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = if v47 then {
                    handler = v18.onRelease(function(v50) --[[ Line: 99 ]]
                        -- upvalues: v47 (ref)
                        v50.cancelled = true;
                        v47();
                    end)
                } else nil, 
                [l_FocusNavigationEventNameEnum_0.ToggleGamepadInput] = {
                    handler = v18.onRelease(v48)
                }
            };
        end, {
            v47, 
            v48
        });
        return v17.useEventHandlerMap(v51, v49);
    end;
    return function(v53) --[[ Line: 142 ]]
        -- upvalues: v7 (copy), v6 (copy), l_useInitializedValue_0 (copy), v37 (copy), l_UserInputService_0 (copy), v29 (copy), l_GamepadUtils_0 (copy), v14 (copy), l_FocusNavigationEventNameEnum_0 (copy), v52 (copy), l_useTableWrappedCallbackRef_0 (copy), l_RunService_0 (copy), v44 (copy), v38 (ref), l_Focusable_0 (copy), l_ImageSetLabel_0 (copy), v31 (copy), l_Pumice_1 (copy), l_White_0 (copy), l_Pumice_0 (copy), v8 (copy), v28 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v27 (copy), v30 (copy), v35 (copy), v36 (copy)
        local v54, v55 = v7.useState(false);
        local v56 = v7.useRef(nil);
        local v57 = v7.useRef(nil);
        local v58 = v7.useRef(nil);
        local v59 = v7.useRef(0);
        local v60 = v7.useRef(0);
        local v61 = v7.useRef(true);
        local v62 = v7.useRef(v6.createSingleMotor(0));
        local v63 = v7.useRef(v6.createSingleMotor(0));
        local v64, v65 = v7.useBinding(0);
        local v66, v67 = v7.useBinding(0);
        local v68 = l_useInitializedValue_0(function() --[[ Line: 156 ]]
            -- upvalues: v7 (ref), v64 (copy), v66 (copy)
            return v7.joinBindings({
                pressed = v64, 
                hovered = v66
            });
        end);
        local v69 = v7.useCallback(function() --[[ Line: 163 ]]
            -- upvalues: v57 (copy), v58 (copy)
            if v57.current then
                v57.current:Disconnect();
                v57.current = nil;
            end;
            if v58.current then
                v58.current:Disconnect();
                v58.current = nil;
            end;
        end, {});
        local v70 = v7.useCallback(function() --[[ Line: 174 ]]
            -- upvalues: v63 (copy), v6 (ref), v37 (ref)
            v63.current:setGoal(v6.spring(1, v37));
        end, {});
        local v71 = v7.useCallback(function() --[[ Line: 178 ]]
            -- upvalues: v63 (copy), v6 (ref), v37 (ref)
            v63.current:setGoal(v6.spring(0, v37));
        end, {});
        local v77 = v7.useCallback(function(v72) --[[ Line: 182 ]]
            -- upvalues: v53 (copy)
            if v72.UserInputType ~= Enum.UserInputType.MouseMovement and v72.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                local v73 = v53.getBackgroundAbsolutePosition();
                local v74 = v53.getBackgroundAbsoluteSize();
                if v73 and v74 then
                    local l_Position_0 = v72.Position;
                    local v76 = Vector2.new((l_Position_0.X - v73.X) / v74.X, (l_Position_0.Y - v73.Y) / v74.Y);
                    v53.setScales(v53.mapPositionToScales(v76));
                end;
                return;
            end;
        end, {
            v53.getBackgroundAbsolutePosition, 
            v53.getBackgroundAbsoluteSize, 
            v53.setScales, 
            v53.mapPositionToScales
        });
        local v79 = v7.useCallback(function(v78) --[[ Line: 210 ]]
            -- upvalues: v53 (copy), v69 (copy), v62 (copy), v6 (ref), v37 (ref)
            if v78.UserInputType ~= Enum.UserInputType.MouseButton1 and v78.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                if v53.onDragEnd then
                    v53.onDragEnd();
                end;
                v69();
                v62.current:setGoal(v6.spring(0, v37));
                return;
            end;
        end, {
            v53.onDragEnd, 
            v69
        });
        local v83 = v7.useCallback(function(_, v81) --[[ Line: 228 ]]
            -- upvalues: v53 (copy), v57 (copy), l_UserInputService_0 (ref), v77 (copy), v58 (copy), v79 (copy), v62 (copy), v6 (ref), v37 (ref)
            local v82 = false;
            if v81.UserInputState == Enum.UserInputState.Begin then
                v82 = true;
                if v81.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v82 = v81.UserInputType == Enum.UserInputType.Touch;
                end;
            end;
            if v53.isDisabled or v57.current or not v82 then
                return;
            else
                if v53.onDragStart then
                    v53.onDragStart();
                end;
                v57.current = l_UserInputService_0.InputChanged:connect(v77);
                v58.current = l_UserInputService_0.InputEnded:connect(v79);
                v62.current:setGoal(v6.spring(1, v37));
                return;
            end;
        end, {
            v53.isDisabled, 
            v53.onDragStart, 
            v77, 
            v79
        });
        local v84 = v7.useCallback(function() --[[ Line: 247 ]]
            -- upvalues: v55 (copy)
            v55(false);
        end, {});
        local v86 = v7.useCallback(function(_) --[[ Line: 251 ]]
            -- upvalues: v54 (copy), v55 (copy), v53 (copy)
            if v54 then
                v55(false);
                return;
            else
                if not v53.isDisabled then
                    v55(true);
                end;
                return;
            end;
        end, {
            v54, 
            v53.isDisabled
        });
        local v117 = v7.useCallback(function(v87, v88) --[[ Line: 259 ]]
            -- upvalues: v29 (ref), l_GamepadUtils_0 (ref), v53 (copy), v59 (copy), v60 (copy), v61 (copy), v14 (ref)
            local v89 = v87[Enum.KeyCode.Thumbstick1];
            local v90 = if v29 then if v89 then l_GamepadUtils_0.normalizeStickByDeadzone(v89.Position) else Vector2.new(0, 0) else l_GamepadUtils_0.normalizeStickByDeadzone(v87[Enum.KeyCode.Thumbstick1].Position);
            local v91 = v90 ~= Vector2.new(0, 0);
            local v92 = nil;
            local v93 = nil;
            local v94 = nil;
            local v95 = nil;
            if v29 then
                local v96 = v87[Enum.KeyCode.DPadLeft];
                local v97 = v87[Enum.KeyCode.DPadRight];
                local v98 = v87[Enum.KeyCode.DPadUp];
                local v99 = v87[Enum.KeyCode.DPadDown];
                v92 = v96 and v96.Position.z == 1 and -1 or 0;
                v93 = v97 and v97.Position.z == 1 and 1 or 0;
                v94 = v98 and v98.Position.z == 1 and 1 or 0;
                v95 = v99 and v99.Position.z == 1 and -1 or 0;
            else
                v92 = v87[Enum.KeyCode.DPadLeft].Position.z == 1 and -1 or 0;
                v93 = v87[Enum.KeyCode.DPadRight].Position.z == 1 and 1 or 0;
                v94 = v87[Enum.KeyCode.DPadUp].Position.z == 1 and 1 or 0;
                v95 = v87[Enum.KeyCode.DPadDown].Position.z == 1 and -1 or 0;
            end;
            local v100 = Vector2.new(v92 + v93, v94 + v95);
            local l_xScale_0 = v53.xScale;
            local l_yScale_0 = v53.yScale;
            local l_l_xScale_0_0 = l_xScale_0;
            local l_l_yScale_0_0 = l_yScale_0;
            if v91 then
                v59.current = v59.current + v88;
                local v105 = v53.mapScalesToPosition(l_xScale_0, l_yScale_0);
                local v106 = Vector2.new(v90.x, -v90.y);
                local v107, v108 = v53.mapPositionToScales(v105 + v106 * 1 * v88);
                l_l_xScale_0_0 = v107;
                l_l_yScale_0_0 = v108;
                v60.current = 0;
                v61.current = false;
            elseif v100 ~= Vector2.new(0, 0) then
                v59.current = v59.current + v88;
                local v109 = nil;
                if v61.current then
                    v109 = 1;
                    v60.current = 0;
                    v61.current = false;
                elseif v59.current > 0.2 then
                    local v110 = v88 - math.max(0.2 - (v59.current - v88), 0) + v60.current;
                    v109 = math.floor(8 * v110);
                    v60.current = v110 - v109 / 8;
                else
                    v109 = 0;
                    v60.current = 0;
                end;
                local v111 = Vector2.new(v53.invertDPadX and -1 or 1, v53.invertDPadY and -1 or 1);
                local v112 = v109 - 1 + 0.51;
                if v100.x == 0 then
                    l_l_xScale_0_0 = l_xScale_0;
                else
                    local l_xScaleRules_0 = v53.xScaleRules;
                    local v114 = l_xScale_0 + v100.x * v111.x * l_xScaleRules_0.increment * v112;
                    l_l_xScale_0_0 = math.clamp(l_xScaleRules_0.min + v14.Round(v114 - l_xScaleRules_0.min, l_xScaleRules_0.increment), l_xScaleRules_0.min, l_xScaleRules_0.max);
                end;
                if v100.y == 0 then
                    l_l_yScale_0_0 = l_yScale_0;
                else
                    local l_yScaleRules_0 = v53.yScaleRules;
                    local v116 = l_yScale_0 + v100.y * v111.y * l_yScaleRules_0.increment * v112;
                    l_l_yScale_0_0 = math.clamp(l_yScaleRules_0.min + v14.Round(v116 - l_yScaleRules_0.min, l_yScaleRules_0.increment), l_yScaleRules_0.min, l_yScaleRules_0.max);
                end;
            else
                v59.current = 0;
                v60.current = 0;
                v61.current = true;
            end;
            if l_l_xScale_0_0 ~= l_xScale_0 or l_l_yScale_0_0 ~= l_yScale_0 then
                v53.setScales(l_l_xScale_0_0, l_l_yScale_0_0);
            end;
        end, {
            v53.xScale, 
            v53.yScale, 
            v53.mapScalesToPosition, 
            v53.mapPositionToScales, 
            v53.invertDPadX, 
            v53.invertDPadY, 
            v53.xScaleRules, 
            v53.yScaleRules, 
            v53.setScales
        });
        local v118 = v7.useMemo(function() --[[ Line: 375 ]]
            -- upvalues: v54 (copy), l_FocusNavigationEventNameEnum_0 (ref)
            return {
                [Enum.KeyCode.ButtonB] = if v54 then l_FocusNavigationEventNameEnum_0.NavigateBack else nil, 
                [Enum.KeyCode.Escape] = if v54 then l_FocusNavigationEventNameEnum_0.NavigateBack else nil, 
                [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.ToggleGamepadInput
            };
        end, {
            v54
        });
        local v119 = v52(v56, v118, if v54 then v84 else nil, v86);
        local v120 = l_useTableWrappedCallbackRef_0(v119);
        v7.useEffect(function() --[[ Line: 391 ]]
            -- upvalues: l_RunService_0 (ref), v54 (copy), v117 (copy), v44 (ref), v38 (ref)
            local v122 = l_RunService_0.Heartbeat:Connect(function(v121) --[[ Line: 392 ]]
                -- upvalues: v54 (ref), v117 (ref), v44 (ref)
                if v54 then
                    v117(v44(), v121);
                end;
            end);
            return function() --[[ Line: 398 ]]
                -- upvalues: v122 (copy), v38 (ref)
                v122:Disconnect();
                v38 = {};
            end;
        end, {
            v54, 
            v117
        });
        v7.useEffect(function() --[[ Line: 404 ]]
            -- upvalues: v62 (copy), v65 (copy), v63 (copy), v67 (copy), v69 (copy)
            v62.current:onStep(v65);
            v63.current:onStep(v67);
            return function() --[[ Line: 408 ]]
                -- upvalues: v69 (ref), v62 (ref), v63 (ref)
                v69();
                v62.current:destroy();
                v63.current:destroy();
            end;
        end, {
            v69
        });
        local l_isDisabled_0 = v53.isDisabled;
        local l_xScale_1 = v53.xScale;
        local l_yScale_1 = v53.yScale;
        local v126 = v53.mapScalesToPosition(l_xScale_1, l_yScale_1);
        return v7.createElement(v7.Fragment, nil, {
            Knob = v7.createElement(l_Focusable_0[l_ImageSetLabel_0], {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v126.X, 0, v126.Y, 0), 
                Size = UDim2.fromOffset(30, 30), 
                Image = v31, 
                ImageColor3 = l_isDisabled_0 and l_Pumice_1 or v64:map(function(v127) --[[ Line: 426 ]]
                    -- upvalues: l_White_0 (ref), l_Pumice_0 (ref)
                    return l_White_0:lerp(l_Pumice_0, v127);
                end), 
                ImageTransparency = l_isDisabled_0 and 0.5 or 0, 
                Active = true, 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                [v8.Event.InputBegan] = v83, 
                [v8.Event.MouseEnter] = v70, 
                [v8.Event.MouseLeave] = v71, 
                [v8.Ref] = v120, 
                onFocusLost = v84, 
                NextSelectionLeft = v54 and v56 or nil, 
                NextSelectionRight = v54 and v56 or nil, 
                NextSelectionUp = v54 and v56 or nil, 
                NextSelectionDown = v54 and v56 or nil, 
                Selectable = v28 and true or nil, 
                SelectionImageObject = l_useSelectionCursor_0(v54 and l_CursorKind_0.SelectedKnob or l_CursorKind_0.UnselectedKnob)
            }), 
            KnobShadow = v8.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v126.X, 0, v126.Y, 0), 
                Size = if v27 then UDim2.new(0, 52, 0, 52) else UDim2.new(0, 48, 0, 48), 
                Image = v30, 
                ImageTransparency = l_isDisabled_0 and 1 or v68:map(function(v128) --[[ Line: 458 ]]
                    -- upvalues: v14 (ref), v35 (ref), v36 (ref)
                    local v129 = v14.lerp(v35, v36, v128.hovered);
                    return v14.lerp(v129, 1, v128.pressed);
                end), 
                Active = true, 
                BackgroundTransparency = 1, 
                ZIndex = 1
            })
        });
    end;
else
    local v130 = v8.PureComponent:extend("TwoAxisSlider");
    v130.validateProps = v13.strictInterface({
        mapPositionToScales = v13.callback, 
        mapScalesToPosition = v13.callback, 
        setScales = v13.callback, 
        xScaleRules = v13.table, 
        yScaleRules = v13.table, 
        xScale = v13.number, 
        yScale = v13.number, 
        getBackgroundAbsolutePosition = v13.callback, 
        getBackgroundAbsoluteSize = v13.callback, 
        invertDPadX = v13.optional(v13.boolean), 
        invertDPadY = v13.optional(v13.boolean), 
        isDisabled = v13.optional(v13.boolean), 
        onDragStart = v13.optional(v13.callback), 
        onDragEnd = v13.optional(v13.callback)
    });
    v130.disconnectDragConnections = function(v131) --[[ Line: 499 ]] --[[ Name: disconnectDragConnections ]]
        if v131.dragChangeListen then
            v131.dragChangeListen:Disconnect();
            v131.dragChangeListen = nil;
        end;
        if v131.dragEndListen then
            v131.dragEndListen:Disconnect();
            v131.dragEndListen = nil;
        end;
    end;
    v130.init = function(v132) --[[ Line: 510 ]] --[[ Name: init ]]
        -- upvalues: v8 (copy), l_White_0 (copy), l_Pumice_0 (copy), v14 (copy), v35 (copy), v36 (copy), v6 (copy), v37 (copy), l_UserInputService_0 (copy), l_GamepadUtils_0 (copy)
        v132.dragChangeListen = nil;
        v132.dragEndListen = nil;
        v132.knobRef = v8.createRef();
        v132.selectionObjectRef = v8.createRef();
        v132.totalMoveTime = 0;
        v132.unhandledTime = 0;
        v132.firstMove = true;
        v132.state = {
            gamepadActive = false
        };
        local v133, v134 = v8.createBinding(0);
        local v135, v136 = v8.createBinding(0);
        local v137 = v8.joinBindings({
            pressed = v133, 
            hovered = v135
        });
        v132.knobColorMapping = v133:map(function(v138) --[[ Line: 532 ]]
            -- upvalues: l_White_0 (ref), l_Pumice_0 (ref)
            return l_White_0:lerp(l_Pumice_0, v138);
        end);
        v132.knobShadowTransparencyMapping = v137:map(function(v139) --[[ Line: 535 ]]
            -- upvalues: v14 (ref), v35 (ref), v36 (ref)
            local v140 = v14.lerp(v35, v36, v139.hovered);
            return v14.lerp(v140, 1, v139.pressed);
        end);
        v132.pressedMotor = v6.createSingleMotor(0);
        v132.pressedMotor:onStep(v134);
        v132.hoveredMotor = v6.createSingleMotor(0);
        v132.hoveredMotor:onStep(v136);
        v132.mouseEnter = function() --[[ Line: 546 ]]
            -- upvalues: v132 (copy), v6 (ref), v37 (ref)
            v132.hoveredMotor:setGoal(v6.spring(1, v37));
        end;
        v132.mouseLeave = function() --[[ Line: 550 ]]
            -- upvalues: v132 (copy), v6 (ref), v37 (ref)
            v132.hoveredMotor:setGoal(v6.spring(0, v37));
        end;
        v132.nonGamepadInputChanged = function(v141) --[[ Line: 554 ]]
            -- upvalues: v132 (copy)
            if v141.UserInputType ~= Enum.UserInputType.MouseMovement and v141.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                local v142 = v132.props.getBackgroundAbsolutePosition();
                local v143 = v132.props.getBackgroundAbsoluteSize();
                if v142 and v143 then
                    local l_Position_1 = v141.Position;
                    local v145 = Vector2.new((l_Position_1.X - v142.X) / v143.X, (l_Position_1.Y - v142.Y) / v143.Y);
                    v132.props.setScales(v132.props.mapPositionToScales(v145));
                end;
                return;
            end;
        end;
        v132.nonGamepadInputEnded = function(v146) --[[ Line: 577 ]]
            -- upvalues: v132 (copy), v6 (ref), v37 (ref)
            if v146.UserInputType ~= Enum.UserInputType.MouseButton1 and v146.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                if v132.props.onDragEnd then
                    v132.props.onDragEnd();
                end;
                v132:disconnectDragConnections();
                v132.pressedMotor:setGoal(v6.spring(0, v37));
                return;
            end;
        end;
        v132.nonGamepadInputBegan = function(_, v148) --[[ Line: 595 ]]
            -- upvalues: v132 (copy), l_UserInputService_0 (ref), v6 (ref), v37 (ref)
            local v149 = false;
            if v148.UserInputState == Enum.UserInputState.Begin then
                v149 = true;
                if v148.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v149 = v148.UserInputType == Enum.UserInputType.Touch;
                end;
            end;
            if v132.props.isDisabled or v132.dragChangeListen or not v149 then
                return;
            else
                if v132.props.onDragStart then
                    v132.props.onDragStart();
                end;
                v132.dragChangeListen = l_UserInputService_0.InputChanged:connect(v132.nonGamepadInputChanged);
                v132.dragEndListen = l_UserInputService_0.InputEnded:connect(v132.nonGamepadInputEnded);
                v132.pressedMotor:setGoal(v6.spring(1, v37));
                return;
            end;
        end;
        v132.disableGamepadInput = function() --[[ Line: 614 ]]
            -- upvalues: v132 (copy)
            v132:setState({
                gamepadActive = false
            });
        end;
        v132.onAPressed = function(_) --[[ Line: 618 ]]
            -- upvalues: v132 (copy)
            if v132.state.gamepadActive then
                v132:setState({
                    gamepadActive = false
                });
                return;
            else
                if not v132.props.isDisabled then
                    v132:setState({
                        gamepadActive = true
                    });
                end;
                return;
            end;
        end;
        v132.moveSlider = function(v151, v152) --[[ Line: 626 ]]
            -- upvalues: l_GamepadUtils_0 (ref), v132 (copy), v14 (ref)
            local v153 = l_GamepadUtils_0.normalizeStickByDeadzone(v151[Enum.KeyCode.Thumbstick1].Position);
            local v154 = v153 ~= Vector2.new(0, 0);
            local v155 = v151[Enum.KeyCode.DPadLeft].Position.z == 1 and -1 or 0;
            local v156 = v151[Enum.KeyCode.DPadRight].Position.z == 1 and 1 or 0;
            local v157 = v151[Enum.KeyCode.DPadUp].Position.z == 1 and 1 or 0;
            local v158 = v151[Enum.KeyCode.DPadDown].Position.z == 1 and -1 or 0;
            local v159 = Vector2.new(v155 + v156, v157 + v158);
            local l_xScale_2 = v132.props.xScale;
            local l_yScale_2 = v132.props.yScale;
            local l_l_xScale_2_0 = l_xScale_2;
            local l_l_yScale_2_0 = l_yScale_2;
            if v154 then
                v132.totalMoveTime = v132.totalMoveTime + v152;
                local v164 = v132.props.mapScalesToPosition(l_xScale_2, l_yScale_2);
                local v165 = Vector2.new(v153.x, -v153.y);
                local v166, v167 = v132.props.mapPositionToScales(v164 + v165 * 1 * v152);
                l_l_xScale_2_0 = v166;
                l_l_yScale_2_0 = v167;
                v132.unhandledTime = 0;
                v132.firstMove = false;
            elseif v159 ~= Vector2.new(0, 0) then
                v132.totalMoveTime = v132.totalMoveTime + v152;
                local v168 = nil;
                if v132.firstMove then
                    v168 = 1;
                    v132.unhandledTime = 0;
                    v132.firstMove = false;
                elseif v132.totalMoveTime > 0.2 then
                    local v169 = v152 - math.max(0.2 - (v132.totalMoveTime - v152), 0) + v132.unhandledTime;
                    v168 = math.floor(8 * v169);
                    v132.unhandledTime = v169 - v168 / 8;
                else
                    v168 = 0;
                    v132.unhandledTime = 0;
                end;
                local v170 = Vector2.new(v132.props.invertDPadX and -1 or 1, v132.props.invertDPadY and -1 or 1);
                local v171 = v168 - 1 + 0.51;
                if v159.x == 0 then
                    l_l_xScale_2_0 = l_xScale_2;
                else
                    local l_xScaleRules_1 = v132.props.xScaleRules;
                    local v173 = l_xScale_2 + v159.x * v170.x * l_xScaleRules_1.increment * v171;
                    l_l_xScale_2_0 = math.clamp(l_xScaleRules_1.min + v14.Round(v173 - l_xScaleRules_1.min, l_xScaleRules_1.increment), l_xScaleRules_1.min, l_xScaleRules_1.max);
                end;
                if v159.y == 0 then
                    l_l_yScale_2_0 = l_yScale_2;
                else
                    local l_yScaleRules_1 = v132.props.yScaleRules;
                    local v175 = l_yScale_2 + v159.y * v170.y * l_yScaleRules_1.increment * v171;
                    l_l_yScale_2_0 = math.clamp(l_yScaleRules_1.min + v14.Round(v175 - l_yScaleRules_1.min, l_yScaleRules_1.increment), l_yScaleRules_1.min, l_yScaleRules_1.max);
                end;
            else
                v132.totalMoveTime = 0;
                v132.unhandledTime = 0;
                v132.firstMove = true;
            end;
            if l_l_xScale_2_0 ~= l_xScale_2 or l_l_yScale_2_0 ~= l_yScale_2 then
                v132.props.setScales(l_l_xScale_2_0, l_l_yScale_2_0);
            end;
        end;
    end;
    v130.render = function(v176) --[[ Line: 710 ]] --[[ Name: render ]]
        -- upvalues: l_withSelectionCursorProvider_0 (copy), v8 (copy), l_Focusable_0 (copy), l_ImageSetLabel_0 (copy), v31 (copy), l_Pumice_1 (copy), v9 (copy), l_CursorKind_0 (copy), v27 (copy), v30 (copy)
        local l_gamepadActive_0 = v176.state.gamepadActive;
        local l_isDisabled_1 = v176.props.isDisabled;
        local l_xScale_3 = v176.props.xScale;
        local l_yScale_3 = v176.props.yScale;
        local v181 = v176.props.mapScalesToPosition(l_xScale_3, l_yScale_3);
        return l_withSelectionCursorProvider_0(function(v182) --[[ Line: 717 ]]
            -- upvalues: v8 (ref), l_Focusable_0 (ref), l_ImageSetLabel_0 (ref), v181 (copy), v31 (ref), l_isDisabled_1 (copy), l_Pumice_1 (ref), v176 (copy), v9 (ref), l_gamepadActive_0 (copy), l_CursorKind_0 (ref), v27 (ref), v30 (ref)
            return v8.createFragment({
                Knob = v8.createElement(l_Focusable_0[l_ImageSetLabel_0], {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(v181.X, 0, v181.Y, 0), 
                    Size = UDim2.fromOffset(30, 30), 
                    Image = v31, 
                    ImageColor3 = l_isDisabled_1 and l_Pumice_1 or v176.knobColorMapping, 
                    ImageTransparency = l_isDisabled_1 and 0.5 or 0, 
                    Active = true, 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    [v8.Event.InputBegan] = v176.nonGamepadInputBegan, 
                    [v8.Event.MouseEnter] = v176.mouseEnter, 
                    [v8.Event.MouseLeave] = v176.mouseLeave, 
                    [v8.Ref] = v176.knobRef, 
                    onFocusLost = v176.disableGamepadInput, 
                    inputBindings = {
                        ToggleGamepadInput = v9.Input.onBegin(Enum.KeyCode.ButtonA, v176.onAPressed), 
                        DisableGamepadInput = if l_gamepadActive_0 then v9.Input.onBegin(Enum.KeyCode.ButtonB, v176.disableGamepadInput) else nil, 
                        MoveSlider = l_gamepadActive_0 and v9.Input.onMoveStep(v176.moveSlider) or nil
                    }, 
                    NextSelectionLeft = l_gamepadActive_0 and v176.knobRef or nil, 
                    NextSelectionRight = l_gamepadActive_0 and v176.knobRef or nil, 
                    NextSelectionUp = l_gamepadActive_0 and v176.knobRef or nil, 
                    NextSelectionDown = l_gamepadActive_0 and v176.knobRef or nil, 
                    SelectionImageObject = v182(l_gamepadActive_0 and l_CursorKind_0.SelectedKnob or l_CursorKind_0.UnselectedKnob)
                }), 
                KnobShadow = v8.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(v181.X, 0, v181.Y, 0), 
                    Size = if v27 then UDim2.new(0, 52, 0, 52) else UDim2.new(0, 48, 0, 48), 
                    Image = v30, 
                    ImageTransparency = l_isDisabled_1 and 1 or v176.knobShadowTransparencyMapping, 
                    Active = true, 
                    BackgroundTransparency = 1, 
                    ZIndex = 1
                })
            });
        end);
    end;
    v130.willUnmount = function(v183) --[[ Line: 771 ]] --[[ Name: willUnmount ]]
        v183:disconnectDragConnections();
        v183.pressedMotor:destroy();
        v183.hoveredMotor:destroy();
    end;
    return v130;
end;