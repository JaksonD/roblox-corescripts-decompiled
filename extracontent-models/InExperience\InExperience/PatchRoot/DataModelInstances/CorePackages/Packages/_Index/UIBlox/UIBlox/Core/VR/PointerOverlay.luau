local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.Roact);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local _ = require(l_Parent_0.Constants);
local v9 = {
    VRService = game:GetService("VRService"), 
    UpdateEvent = l_RunService_0.Heartbeat
};
local function v12(v10, v11) --[[ Line: 45 ]] --[[ Name: setLaserPointerModeBasedOnUserCFrame ]]
    if v11:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and v11:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v10.current:setMode(v10.current.Mode.DualPointer);
        return;
    elseif not v11:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and not v11:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v10.current:setMode(v10.current.Mode.Disabled);
        return;
    else
        v10.current:setMode(v10.current.Mode.Pointer);
        return;
    end;
end;
return function(v13) --[[ Line: 61 ]] --[[ Name: PointerOverlay ]]
    -- upvalues: l_Object_0 (copy), v9 (copy), v4 (copy), v12 (copy), l_ContextActionService_0 (copy), v5 (copy), l_EventConnection_0 (copy)
    local v14 = l_Object_0.assign({}, v9, v13);
    local l_LaserPointer_0 = v14.LaserPointer;
    local l_VRControllerModel_0 = v14.VRControllerModel;
    local l_VRService_0 = v14.VRService;
    local v18 = v4.useRef(nil);
    local v19 = v4.useRef(nil);
    local v20 = v4.useRef(nil);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
        -- upvalues: l_VRService_0 (copy)
        return l_VRService_0:GetPropertyChangedSignal("VRSessionState");
    end);
    local v23 = v4.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v18 (copy), l_LaserPointer_0 (copy), v12 (ref), l_VRService_0 (copy), v19 (copy), l_VRControllerModel_0 (copy), v20 (copy), l_ContextActionService_0 (ref)
        if not v18.current then
            v18.current = l_LaserPointer_0.new();
            v12(v18, l_VRService_0);
            v18.current:setEnableAmbidexterousPointer(true);
            v19.current = l_VRControllerModel_0.new(Enum.UserCFrame.LeftHand);
            v20.current = l_VRControllerModel_0.new(Enum.UserCFrame.RightHand);
        end;
        v19.current:setEnabled(l_VRService_0.VREnabled);
        v20.current:setEnabled(l_VRService_0.VREnabled);
        if l_VRService_0.VREnabled then
            l_ContextActionService_0:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        end;
    end, {
        v19, 
        v20, 
        v18, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v24 = nil;
    v24 = v4.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v19 (copy), v20 (copy), v18 (copy), l_ContextActionService_0 (ref)
        if v19.current then
            v19.current:setEnabled(false);
        end;
        if v20.current then
            v20.current:setEnabled(false);
        end;
        if v18.current then
            v18.current:disableComponent();
        end;
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
    end, {
        v19, 
        v20, 
        v18, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v27 = v4.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: l_VRService_0 (copy), v18 (copy), v12 (ref), v19 (copy), v20 (copy)
        local v25 = true;
        if l_VRService_0.VRSessionState ~= Enum.VRSessionState.Idle then
            v25 = l_VRService_0.VRSessionState == Enum.VRSessionState.Visible;
        end;
        local v26 = not v25;
        if v18.current then
            if v26 then
                v12(v18, l_VRService_0);
            else
                v18.current:setMode(v18.current.Mode.Disabled);
            end;
        end;
        if v19.current then
            v19.current:setEnabled(v26);
        end;
        if v20.current then
            v20.current:setEnabled(v26);
        end;
    end, {
        v19, 
        v20, 
        v18, 
        l_LaserPointer_0, 
        l_VRControllerModel_0
    });
    local v28 = v4.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v12 (ref), v18 (copy), l_VRService_0 (copy)
        v12(v18, l_VRService_0);
    end, {
        v18
    });
    v4.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: l_VRService_0 (copy), v23 (copy), v24 (ref)
        if l_VRService_0.VREnabled then
            v23();
        end;
        return v24;
    end, {});
    return v4.createElement(v5.Portal, {
        target = workspace
    }, {
        UserCFrameChangedConnection = v4.createElement(l_EventConnection_0, {
            event = v14.UpdateEvent, 
            callback = function() --[[ Line: 152 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy), v19 (copy), v20 (copy)
                if v18.current then
                    v18.current:update();
                end;
                if v19.current then
                    v19.current:update();
                end;
                if v20.current then
                    v20.current:update();
                end;
            end
        }), 
        VREnabledConnection = v4.createElement(l_EventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v23
        }), 
        VRUserCFrameEnabledConnection = v4.createElement(l_EventConnection_0, {
            event = l_VRService_0.UserCFrameEnabled, 
            callback = v28
        }), 
        VRSessionStateConnection = if l_status_0 then v4.createElement(l_EventConnection_0, {
            event = l_result_0, 
            callback = v27
        }) else nil
    });
end;