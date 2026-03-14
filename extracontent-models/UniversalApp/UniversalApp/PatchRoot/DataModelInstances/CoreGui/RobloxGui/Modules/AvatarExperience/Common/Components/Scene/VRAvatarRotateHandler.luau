local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
return (require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks)(function(v8) --[[ Line: 24 ]] --[[ Name: VRAvatarRotateHandler ]]
    -- upvalues: l_RunService_0 (copy), l_GamepadUtils_0 (copy), l_ContextActionService_0 (copy), v5 (copy), v6 (copy)
    local v9 = false;
    local function v14(_, _, v12) --[[ Line: 27 ]] --[[ Name: rotate ]]
        -- upvalues: v9 (ref), l_RunService_0 (ref), l_GamepadUtils_0 (ref), v8 (copy)
        if not v9 then
            v9 = true;
            l_RunService_0:BindToRenderStep("VRAvatarEditorJoystickRotate", Enum.RenderPriority.Input.Value, function(v13) --[[ Line: 33 ]]
                -- upvalues: l_GamepadUtils_0 (ref), v12 (copy), v8 (ref)
                l_GamepadUtils_0.rotateAndZoom(v12, v13, v8.setAngularVelocityByPixels, v8.rotateByRadians);
            end);
        end;
        return Enum.ContextActionResult.Pass;
    end;
    local function v15() --[[ Line: 47 ]] --[[ Name: unbindRotate ]]
        -- upvalues: l_ContextActionService_0 (ref), l_RunService_0 (ref), v9 (ref)
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
        l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
        v9 = false;
    end;
    local function v16() --[[ Line: 55 ]] --[[ Name: bindRotate ]]
        -- upvalues: l_ContextActionService_0 (ref), l_RunService_0 (ref), v9 (ref), v14 (copy)
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
        l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
        l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
        v9 = false;
        l_ContextActionService_0:BindCoreAction("RotateAvatarWithGamepadVR_R", v14, false, Enum.KeyCode.Thumbstick2);
        l_ContextActionService_0:BindCoreAction("RotateAvatarWithGamepadVR_L", v14, false, Enum.KeyCode.Thumbstick1);
    end;
    v5.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: l_ContextActionService_0 (ref), l_RunService_0 (ref), v9 (ref)
        return function() --[[ Line: 63 ]]
            -- upvalues: l_ContextActionService_0 (ref), l_RunService_0 (ref), v9 (ref)
            l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_R");
            l_ContextActionService_0:UnbindCoreAction("RotateAvatarWithGamepadVR_L");
            l_RunService_0:UnbindFromRenderStep("VRAvatarEditorJoystickRotate");
            v9 = false;
        end;
    end, {});
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v6.Event.MouseEnter] = v16, 
        [v6.Event.MouseLeave] = v15
    });
end));