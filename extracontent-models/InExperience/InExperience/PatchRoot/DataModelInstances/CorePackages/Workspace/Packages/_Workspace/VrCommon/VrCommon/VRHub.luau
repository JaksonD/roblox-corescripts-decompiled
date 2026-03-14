local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v8 = require(script.Parent.LaserPointer);
local v9 = require(script.Parent.VRControllerModel);
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local v11 = require(script.Parent.SafetyBubble);
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = l_HttpService_0:GenerateGUID(true);
v12.LaserPointer = nil;
v12.ControllerModelsEnabled = false;
v12.LeftControllerModel = nil;
v12.RightControllerModel = nil;
v12.isFPSAtTarget = l_SplashScreenManager_0.isFPSAtTarget();
v12.SafetyBubble = nil;
v12.IsFirstPerson = false;
l_StarterGui_0:RegisterSetCore("VRLaserPointerMode", function(v16) --[[ Line: 44 ]]
    -- upvalues: v12 (copy), v8 (copy)
    if not v12.LaserPointer then
        return;
    elseif not v16 or not tostring(v16) then
        return;
    else
        v12.LaserPointer:setMode(v8.Mode[tostring(v16)] or v8.Mode.Disabled);
        return;
    end;
end);
local function v18(v17) --[[ Line: 54 ]] --[[ Name: enableControllerModels ]]
    -- upvalues: v12 (copy), v9 (copy)
    if v17 ~= v12.ControllerModelsEnabled then
        v12.ControllerModelsEnabled = v17;
        if v17 then
            if not v12.LeftControllerModel then
                v12.LeftControllerModel = v9.new(Enum.UserCFrame.LeftHand);
            end;
            v12.LeftControllerModel:setEnabled(true);
            if not v12.RightControllerModel then
                v12.RightControllerModel = v9.new(Enum.UserCFrame.RightHand);
            end;
            v12.RightControllerModel:setEnabled(true);
            return;
        else
            if v12.LeftControllerModel then
                v12.LeftControllerModel:setEnabled(false);
            end;
            if v12.RightControllerModel then
                v12.RightControllerModel:setEnabled(false);
            end;
        end;
    end;
end;
l_StarterGui_0:RegisterSetCore("VREnableControllerModels", function(v19) --[[ Line: 83 ]]
    -- upvalues: l_VRService_0 (copy)
    if v19 then
        l_VRService_0.ControllerModels = Enum.VRControllerModelMode.Transparent;
        return;
    else
        l_VRService_0.ControllerModels = Enum.VRControllerModelMode.Disabled;
        return;
    end;
end);
l_VRService_0:GetPropertyChangedSignal("ControllerModels"):Connect(function() --[[ Line: 91 ]]
    -- upvalues: v18 (copy), l_VRService_0 (copy)
    v18(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
end);
local v20 = tick();
local function v23() --[[ Line: 96 ]] --[[ Name: onRenderSteppedLast ]]
    -- upvalues: v20 (ref), v12 (copy)
    local v21 = tick();
    local v22 = v21 - v20;
    v20 = v21;
    if v12.LaserPointer then
        v12.LaserPointer:update(v22);
    end;
    if v12.LeftControllerModel then
        v12.LeftControllerModel:update(v22);
    end;
    if v12.RightControllerModel then
        v12.RightControllerModel:update(v22);
    end;
    if v12.SafetyBubble then
        v12.SafetyBubble:update(v22);
    end;
end;
local function v24() --[[ Line: 117 ]] --[[ Name: onCameraCFrameChanged ]]
    -- upvalues: v12 (copy)
    if v12.LaserPointer then
        v12.LaserPointer:update(0);
    end;
    if v12.LeftControllerModel then
        v12.LeftControllerModel:update(0);
    end;
    if v12.RightControllerModel then
        v12.RightControllerModel:update(0);
    end;
end;
local v25 = nil;
local function v26() --[[ Line: 135 ]] --[[ Name: onCurrentCameraChanged ]]
    -- upvalues: v25 (ref), v24 (copy)
    if v25 then
        v25:disconnect();
    end;
    if workspace.CurrentCamera then
        v25 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v24);
    end;
end;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v26);
if v25 then
    v25:disconnect();
end;
if workspace.CurrentCamera then
    v25 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v24);
end;
local function v27() --[[ Line: 149 ]] --[[ Name: onVREnabledChanged ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy), v12 (copy), v8 (copy), v18 (copy), l_RunService_0 (copy), v15 (copy), v23 (copy), v11 (copy), l_ContextActionService_0 (copy)
    if l_VRService_0.VREnabled then
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        if not v12.LaserPointer then
            v12.LaserPointer = v8.new();
        end;
        if v12.LaserPointer then
            if v12.isFPSAtTarget then
                v12.LaserPointer:setMode(v8.Mode.Navigation);
            else
                v12.LaserPointer:setMode(v8.Mode.Disabled);
            end;
        end;
        v18(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
        l_RunService_0:BindToRenderStep(v15, Enum.RenderPriority.Last.Value, v23);
        if v12.LaserPointer then
            v12.LaserPointer:setForcePointer(true);
        end;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        v12.SafetyBubble = v11.new();
        l_ContextActionService_0:BindCoreActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        return;
    else
        if v12.LaserPointer then
            v12.LaserPointer:setMode(v8.Mode.Disabled);
        end;
        l_RunService_0:UnbindFromRenderStep(v15);
        return;
    end;
end;
local function v28() --[[ Line: 188 ]] --[[ Name: onVRSessionStateChanged ]]
    -- upvalues: l_VRService_0 (copy), v12 (copy), v8 (copy), v18 (copy)
    if l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
        if v12.LaserPointer and v12.LaserPointer.Mode.Disabled then
            v12.LaserPointer:setMode(v8.Mode.Navigation);
            v18(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
        end;
        if not v12.ControllerModelsEnabled then
            v18(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
            return;
        end;
    else
        if v12.LaserPointer and v12.LaserPointer.Mode.Navigation then
            v12.LaserPointer:setMode(v8.Mode.Disabled);
        end;
        if v12.ControllerModelsEnabled then
            v18(false);
        end;
    end;
end;
local function v30(v29) --[[ Line: 207 ]] --[[ Name: onVRPropertyChanged ]]
    -- upvalues: v27 (copy), v28 (copy)
    if v29 == "VREnabled" then
        v27();
        return;
    else
        if v29 == "VRSessionState" then
            v28();
        end;
        return;
    end;
end;
v27();
l_VRService_0.Changed:connect(v30);
v12.RegisterModule = function(_, v32) --[[ Line: 219 ]] --[[ Name: RegisterModule ]]
    -- upvalues: v13 (copy)
    v13[v32.ModuleName] = v32;
end;
v12.GetModule = function(_, v34) --[[ Line: 223 ]] --[[ Name: GetModule ]]
    -- upvalues: v13 (copy)
    return v13[v34];
end;
v12.IsModuleOpened = function(_, v36) --[[ Line: 227 ]] --[[ Name: IsModuleOpened ]]
    -- upvalues: v14 (copy)
    return v14[v36] ~= nil;
end;
v12.GetOpenedModules = function(_) --[[ Line: 231 ]] --[[ Name: GetOpenedModules ]]
    -- upvalues: v14 (copy)
    local v38 = {};
    for _, v40 in pairs(v14) do
        table.insert(v38, v40);
    end;
    return v38;
end;
v12.ModuleOpened = l_Create_0("BindableEvent")({
    Name = "VRModuleOpened"
});
v12.FireModuleOpened = function(_, v42) --[[ Line: 245 ]] --[[ Name: FireModuleOpened ]]
    -- upvalues: v13 (copy), v14 (copy), v12 (copy)
    if not v13[v42] then
        error("Tried to open module that is not registered: " .. v42);
    end;
    if v14[v42] ~= v13[v42] then
        v14[v42] = v13[v42];
        v12.ModuleOpened:Fire(v42);
    end;
end;
v12.ModuleClosed = l_Create_0("BindableEvent")({
    Name = "VRModuleClosed"
});
v12.FireModuleClosed = function(_, v44) --[[ Line: 260 ]] --[[ Name: FireModuleClosed ]]
    -- upvalues: v13 (copy), v14 (copy), v12 (copy)
    if not v13[v44] then
        error("Tried to close module that is not registered: " .. v44);
    end;
    if v14[v44] ~= nil then
        v14[v44] = nil;
        v12.ModuleClosed:Fire(v44);
    end;
end;
v12.KeepVRTopbarOpen = function(_) --[[ Line: 271 ]] --[[ Name: KeepVRTopbarOpen ]]
    -- upvalues: v14 (copy)
    for _, v47 in pairs(v14) do
        if v47.KeepVRTopbarOpen then
            return true;
        end;
    end;
    return false;
end;
v12.ShowHighlightedLeaveGameIcon = false;
v12.ShowHighlightedLeaveGameIconToggled = l_Create_0("BindableEvent")({
    Name = "ShowHighlightedLeaveGameIconToggled"
});
v12.SetShowHighlightedLeaveGameIconToggled = function(_, v49) --[[ Line: 286 ]] --[[ Name: SetShowHighlightedLeaveGameIconToggled ]]
    -- upvalues: v12 (copy)
    if v12.ShowHighlightedLeaveGameIcon ~= v49 then
        v12.ShowHighlightedLeaveGameIcon = v49;
        v12.ShowHighlightedLeaveGameIconToggled:Fire();
    end;
end;
v12.ShowTopBar = true;
v12.ShowMoreMenu = false;
v12.ShowTopBarChanged = l_Create_0("BindableEvent")({
    Name = "ShowTopBarChanged"
});
v12.ShowMoreMenuChanged = l_Create_0("BindableEvent")({
    Name = "ShowMoreMenuChanged"
});
v12.SetShowTopBar = function(_, v51) --[[ Line: 304 ]] --[[ Name: SetShowTopBar ]]
    -- upvalues: v12 (copy)
    if v12.ShowTopBar ~= v51 then
        v12.ShowTopBar = v51;
        v12.ShowTopBarChanged:Fire();
    end;
end;
v12.SetShowMoreMenu = function(_, v53) --[[ Line: 311 ]] --[[ Name: SetShowMoreMenu ]]
    -- upvalues: v12 (copy)
    if v12.ShowMoreMenu ~= v53 then
        v12.ShowMoreMenu = v53;
        v12.ShowMoreMenuChanged:Fire();
    end;
end;
v12.ToggleSafetyBubble = function(_) --[[ Line: 318 ]] --[[ Name: ToggleSafetyBubble ]]
    -- upvalues: v12 (copy)
    if v12.SafetyBubble then
        v12.SafetyBubble:ToggleEnabled();
    end;
end;
v12.GetControllerModel = function(_, v56) --[[ Line: 324 ]] --[[ Name: GetControllerModel ]]
    -- upvalues: v12 (copy)
    if v56 == Enum.UserCFrame.LeftHand then
        return v12.LeftControllerModel;
    elseif v56 == Enum.UserCFrame.RightHand then
        return v12.RightControllerModel;
    else
        return nil;
    end;
end;
v12.GetControllerButtonPosition = function(_, v58) --[[ Line: 334 ]] --[[ Name: GetControllerButtonPosition ]]
    -- upvalues: v12 (copy)
    return v12.LeftControllerModel and v12.LeftControllerModel:getButtonPosition(v58), v12.RightControllerModel and v12.RightControllerModel:getButtonPosition(v58);
end;
l_SplashScreenManager_0.addStatusChangeListener(function(v59) --[[ Line: 341 ]]
    -- upvalues: v12 (copy), v27 (copy)
    v12.isFPSAtTarget = v59;
    v27();
end);
return v12;