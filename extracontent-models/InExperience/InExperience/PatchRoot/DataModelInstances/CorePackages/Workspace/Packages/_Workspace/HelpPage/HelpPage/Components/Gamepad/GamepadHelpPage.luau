local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.Display);
local v6 = require(l_Parent_0.Components.Gamepad.GamepadList);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Hooks.useKeybinds);
local v9 = require(l_Parent_1.SignalsReact);
local v10 = require(l_Parent_1.RobloxAppHooks);
local v11 = require(l_Parent_1.RobloxAppEnums);
local l_useDeviceOrientation_0 = v10.useDeviceOrientation;
local l_DeviceOrientationMode_0 = v11.DeviceOrientationMode;
local l_View_0 = v4.View;
local l_useTokens_0 = v4.Hooks.useTokens;
return v3.memo(function(v16) --[[ Line: 29 ]] --[[ Name: GamepadHelpPage ]]
    -- upvalues: l_UserInputService_0 (copy), l_useDeviceOrientation_0 (copy), v8 (copy), l_useTokens_0 (copy), v3 (copy), v9 (copy), v5 (copy), v7 (copy), l_DeviceOrientationMode_0 (copy), l_View_0 (copy), v6 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v18 = l_useDeviceOrientation_0();
    local l_controls_0 = v8().controls;
    local v20 = l_useTokens_0();
    local v21, v22 = v3.useState(1e999);
    local v23, v24 = v3.useState(nil);
    local v25, v26 = v3.useState(nil);
    local v27 = v9.useSignalState(v5.GetDisplayStore);
    local v28 = v9.useSignalState(v27.getViewportSize);
    local v37, v38, v39 = v3.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: l_controls_0 (copy), v16 (copy), v7 (ref), l_l_UserInputService_0_Platform_0 (copy)
        local v29 = {};
        local v30 = {};
        local v31 = {};
        for v32, v33 in l_controls_0 do
            if v33.gamepadInput ~= nil then
                local l_gamepadInput_0 = v33.gamepadInput;
                local l_input_0 = l_gamepadInput_0.input;
                if l_input_0 == nil then
                    l_input_0 = if v16.isSpatial then l_gamepadInput_0.spatialGamepadInput else if v7.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[l_l_UserInputService_0_Platform_0] then l_gamepadInput_0.playstationInput else l_gamepadInput_0.xboxInput;
                end;
                if l_input_0 ~= nil and #l_input_0 > 0 then
                    local v36 = v7.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[l_input_0[1]];
                    if v36 <= v7.HELP_PAGE.GAMEPAD_CUTOFFS.LEFT_COL then
                        v29[v32] = v33;
                    elseif v36 <= v7.HELP_PAGE.GAMEPAD_CUTOFFS.BOTTOM_RIGHT_COL and v7.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[l_l_UserInputService_0_Platform_0] then
                        v30[v32] = v33;
                    else
                        v31[v32] = v33;
                    end;
                end;
            end;
        end;
        return v29, v30, v31;
    end, {
        l_controls_0
    });
    local v40 = v3.createElement("ImageLabel", {
        Name = "GamepadImage", 
        Size = UDim2.fromScale(1, 1), 
        ScaleType = Enum.ScaleType.Fit, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Image = v16.isSpatial and "rbxasset://textures/ui/Gamepad/VRController.png" or "rbxasset://textures/ui/Gamepad/Controller@3x.png", 
        BackgroundTransparency = 1
    });
    local v41 = v3.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v16 (copy), v28 (copy), v7 (ref), v20 (copy)
        if not v16.isSpatial and (v28.X < v7.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or v28.Y < v7.HELP_PAGE.GAMEPAD_SIZES.NO_PADDING_CUTOFF_Y) then
            return UDim.new(0, 0);
        else
            return UDim.new(0, v20.Size.Size_2400);
        end;
    end, {
        v28
    });
    local v45, v46, v47, v48, v49, v50 = v3.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: v16 (copy), v7 (ref), v21 (copy), v28 (copy), v18 (copy), l_DeviceOrientationMode_0 (ref), v23 (copy), v25 (copy)
        if v16.isSpatial then
            return Vector2.new(1, 0.5), UDim2.new(v7.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0, 0, v21 * v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(0, 0.5), UDim2.new(v7.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE_VR, 0, 0, v21 * v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR * 0.5 / v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), v7.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_VR, v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_VR;
        elseif (v28.X < v7.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or v28.Y < v7.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y) and v18 == l_DeviceOrientationMode_0.Portrait then
            return Vector2.new(0, 0), UDim2.fromOffset(0, v21 * v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), Vector2.new(1, 0), UDim2.new(1, 0, 0, v21 * v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT / v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), v7.HELP_PAGE.GAMEPAD_SIZES.COL_SCALE_PORTRAIT, v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_PORTRAIT;
        else
            local v42 = v21 * v7.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE;
            local v43 = v21 * (1 - v7.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE);
            local v44 = 1;
            if v23 ~= nil and v25 ~= nil and v23.X > 0 and v25.X > 0 and (v42 < v23.X or v43 < v25.X) then
                v44 = math.min(v42 / v23.X, v43 / v25.X);
            end;
            return Vector2.new(1, 0), UDim2.fromScale(v7.HELP_PAGE.GAMEPAD_SIZES.LEFT_COL_SCALE, 0), Vector2.new(0, 0), UDim2.fromScale(v7.HELP_PAGE.GAMEPAD_SIZES.RIGHT_COL_SCALE, 0), v44, v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_MULTIPLIER_DEFAULT;
        end;
    end, {
        v28, 
        v21, 
        v16.isSpatial
    });
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        padding = {
            top = v41
        }, 
        onAbsoluteSizeChanged = function(v51) --[[ Line: 193 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v22 (copy)
            v22(v51.AbsoluteSize.X);
        end
    }, {
        LeftColContainer = v3.createElement(l_View_0, {
            tag = "auto-xy padding-top-large", 
            AnchorPoint = v45, 
            Position = v46, 
            scale = v49, 
            onAbsoluteSizeChanged = function(v52) --[[ Line: 202 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v23 (copy), v24 (copy)
                if v23 == nil then
                    v24(v52.AbsoluteSize);
                end;
            end
        }, {
            LeftCol = v3.createElement(v6, {
                controls = v37, 
                layoutOrderReversed = false, 
                addBlankIcon = false, 
                isSpatial = v16.isSpatial, 
                platform = l_l_UserInputService_0_Platform_0
            })
        }), 
        ImageComponentContainer = v3.createElement(l_View_0, {
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.fromOffset(v21 * v50, v21 * v50 / v7.HELP_PAGE.GAMEPAD_SIZES.IMAGE_ASPECT_RATIO), 
            testId = "VRGamepadInstructions"
        }, {
            ImageComponent = v40
        }), 
        RightColContainer = v3.createElement(l_View_0, {
            tag = "auto-xy padding-top-large", 
            AnchorPoint = v47, 
            Position = v48, 
            scale = v49, 
            onAbsoluteSizeChanged = function(v53) --[[ Line: 233 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v25 (copy), v26 (copy)
                if v25 == nil then
                    v26(v53.AbsoluteSize);
                end;
            end
        }, {
            RightCol = v3.createElement(l_View_0, {
                tag = "col auto-xy"
            }, {
                TopRightColContainer = v3.createElement(l_View_0, {
                    tag = "auto-xy", 
                    LayoutOrder = 1
                }, {
                    TopRightCol = v3.createElement(v6, {
                        controls = v39, 
                        layoutOrderReversed = true, 
                        addBlankIcon = false, 
                        isSpatial = v16.isSpatial, 
                        platform = l_l_UserInputService_0_Platform_0
                    })
                }), 
                BottomRightColContainer = v3.createElement(l_View_0, {
                    tag = "auto-xy", 
                    LayoutOrder = 2
                }, {
                    BottomRightCol = v3.createElement(v6, {
                        controls = v38, 
                        layoutOrderReversed = true, 
                        addBlankIcon = true, 
                        isSpatial = v16.isSpatial, 
                        platform = l_l_UserInputService_0_Platform_0
                    })
                })
            })
        })
    });
end);