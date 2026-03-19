local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local v4 = require(l_script_FirstAncestor_0.Controllers.ViveController);
local v5 = require(l_script_FirstAncestor_0.Controllers.TouchController);
local v6 = require(l_script_FirstAncestor_0.Controllers.RiftController);
local v7 = require(l_script_FirstAncestor_0.Controllers.IndexController);
local v8 = require(l_script_FirstAncestor_0.VRUtil);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.Changed:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), l_VRService_0 (copy)
    local v12 = setmetatable({}, v10);
    v12.userCFrame = v11;
    v12.enabled = false;
    v12.currentModel = nil;
    v12.currentVRDeviceName = l_VRService_0.VRDeviceName;
    v12.modelIsInWorkspace = false;
    v12.onVRDeviceChangedConn = nil;
    v12.onCurrentCameraChangedConn = nil;
    v12.onUserCFrameEnabledChangedConn = nil;
    v12.onInputBeganConn = nil;
    v12.onInputChangedConn = nil;
    v12.onInputEndedConn = nil;
    v12.controllerModel = nil;
    return v12;
end;
v10.createControllerModel = function(v13) --[[ Line: 45 ]] --[[ Name: createControllerModel ]]
    -- upvalues: v8 (copy), v4 (copy), v6 (copy), v7 (copy), v5 (copy)
    local v14 = v8.getCurrentControllerType();
    if v14 == "Vive" then
        v13.controllerModel = v4.new(v13.userCFrame);
        return;
    elseif v14 == "Rift" then
        v13.controllerModel = v6.new(v13.userCFrame);
        return;
    elseif v14 == "Index" then
        v13.controllerModel = v7.new(v13.userCFrame);
        return;
    elseif v14 == "Touch" then
        v13.controllerModel = v5.new(v13.userCFrame);
        return;
    else
        v13.controllerModel = v6.new(v13.userCFrame);
        return;
    end;
end;
v10.setCurrentModel = function(v15) --[[ Line: 62 ]] --[[ Name: setCurrentModel ]]
    -- upvalues: l_VRService_0 (copy)
    if v15.currentModel then
        v15:setModelInWorkspace(false);
    end;
    if not v15.controllerModel then
        v15:createControllerModel();
    end;
    v15.currentModel = v15.controllerModel;
    if v15.enabled then
        v15:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v15.userCFrame));
    end;
end;
v10.setModelInWorkspace = function(v16, v17) --[[ Line: 79 ]] --[[ Name: setModelInWorkspace ]]
    if not v16.currentModel then
        return;
    else
        if v17 ~= v16.modelIsInWorkspace then
            v16.modelIsInWorkspace = v17;
            if v16.currentModel.model then
                if v16.modelIsInWorkspace then
                    v16.currentModel.model.Parent = workspace;
                    return;
                else
                    v16.currentModel.model.Parent = nil;
                    return;
                end;
            else
                v16.currentModel:setInWorkspace(v17);
            end;
        end;
        return;
    end;
end;
v10.setEnabled = function(v18, v19) --[[ Line: 98 ]] --[[ Name: setEnabled ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if v19 ~= v18.enabled then
        v18.enabled = v19;
        if v18.enabled then
            v18:setCurrentModel();
            v18.onCurrentCameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 105 ]]
                -- upvalues: v18 (copy), l_VRService_0 (ref)
                v18:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v18.userCFrame));
            end);
            v18.onUserCFrameEnabledChangedConn = l_VRService_0.UserCFrameEnabled:connect(function(v20, v21) --[[ Line: 109 ]]
                -- upvalues: v18 (copy)
                if v20 == v18.userCFrame then
                    v18:setModelInWorkspace(v21);
                end;
            end);
            v18.onInputBeganConn = l_UserInputService_0.InputBegan:connect(function(...) --[[ Line: 115 ]]
                -- upvalues: v18 (copy)
                v18:onInputBegan(...);
            end);
            v18.onInputChangedConn = l_UserInputService_0.InputChanged:connect(function(...) --[[ Line: 118 ]]
                -- upvalues: v18 (copy)
                v18:onInputChanged(...);
            end);
            v18.onInputEndedConn = l_UserInputService_0.InputEnded:connect(function(...) --[[ Line: 121 ]]
                -- upvalues: v18 (copy)
                v18:onInputEnded(...);
            end);
            v18:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v18.userCFrame));
            return;
        else
            if v18.onVRDeviceChangedConn then
                v18.onVRDeviceChangedConn:disconnect();
                v18.onVRDeviceChangedConn = nil;
            end;
            if v18.onCurrentCameraChangedConn then
                v18.onCurrentCameraChangedConn:disconnect();
                v18.onCurrentCameraChangedConn = nil;
            end;
            if v18.onUserCFrameEnabledChangedConn then
                v18.onUserCFrameEnabledChangedConn:disconnect();
                v18.onUserCFrameEnabledChangedConn = nil;
            end;
            if v18.onInputBeganConn then
                v18.onInputBeganConn:disconnect();
                v18.onInputBeganConn = nil;
            end;
            if v18.onInputChangedConn then
                v18.onInputChangedConn:disconnect();
                v18.onInputChangedConn = nil;
            end;
            if v18.onInputEndedConn then
                v18.onInputEndedConn:disconnect();
                v18.onInputEndedConn = nil;
            end;
            if v18.currentModel then
                v18:setModelInWorkspace(false);
            end;
        end;
    end;
end;
v10.update = function(v22, _) --[[ Line: 162 ]] --[[ Name: update ]]
    -- upvalues: v8 (copy)
    if not v22.enabled then
        return;
    else
        if v22.currentModel then
            local v24 = v8.GetUserCFrameWorldSpace(v22.userCFrame);
            v22.currentModel:setCFrameAndScale(v24, workspace.CurrentCamera.HeadScale);
        end;
        return;
    end;
end;
v10.onInputBegan = function(v25, v26, _) --[[ Line: 173 ]] --[[ Name: onInputBegan ]]
    if not v25.enabled or not v25.modelIsInWorkspace then
        return;
    else
        if v25.currentModel then
            v25.currentModel:onInputBegan(v26);
        end;
        return;
    end;
end;
v10.onInputChanged = function(v28, v29, _) --[[ Line: 182 ]] --[[ Name: onInputChanged ]]
    if not v28.enabled or not v28.modelIsInWorkspace then
        return;
    else
        if v28.currentModel then
            v28.currentModel:onInputChanged(v29);
        end;
        return;
    end;
end;
v10.onInputEnded = function(v31, v32, _) --[[ Line: 191 ]] --[[ Name: onInputEnded ]]
    if v31.currentModel then
        v31.currentModel:onInputEnded(v32);
    end;
end;
v10.getButtonPosition = function(v34, v35) --[[ Line: 197 ]] --[[ Name: getButtonPosition ]]
    if v34.currentModel and v34.currentModel.getButtonPart then
        local v36 = v34.currentModel:getButtonPart(v35);
        if v36 then
            return v36.Position;
        end;
    end;
end;
return v10;