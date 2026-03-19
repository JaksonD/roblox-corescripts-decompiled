local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_VRConstants_0 = require(l_Parent_0.VrCompatibility).VRConstants;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local l_Constants_0 = v3.Core.VR.Constants;
local v7 = game:DefineFastFlag("RepositionInExperienceVRToasts", false);
return function(v8) --[[ Line: 28 ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy), l_VRConstants_0 (copy), v7 (copy), l_Constants_0 (copy), l_Panel3D_0 (copy)
    local l_isConfirmModalOpen_0 = v8.isConfirmModalOpen;
    local l_isToastOpen_0 = v8.isToastOpen;
    local l_isCoreScript_0 = v8.isCoreScript;
    local l_ToastComponent_0 = v8.ToastComponent;
    local l_ConfirmationModalComponent_0 = v8.ConfirmationModalComponent;
    local v14 = v2.useRef(nil);
    local v15 = l_GuiService_0.CoreGuiFolder and l_GuiService_0.CoreGuiFolder:FindFirstChild(l_VRConstants_0.PositionLockedPanelName);
    if v15 then
        v14.current = v15;
    else
        v15 = v14.current;
    end;
    local v16 = if v15 then v15.Size.Y else 2.45;
    local v17 = {
        partSize = l_VRConstants_0.ToastSize, 
        offset = CFrame.lookAt(l_VRConstants_0.ToastPosition, l_VRConstants_0.DefaultCameraPosition), 
        virtualScreenSize = l_VRConstants_0.ToastResolution, 
        curvature = l_VRConstants_0.ToastCurvature, 
        panelName = "ToastNotifications", 
        hidden = not l_isToastOpen_0
    };
    if l_isCoreScript_0 then
        local v19 = v2.useCallback(function(v18) --[[ Line: 62 ]]
            -- upvalues: v15 (ref), v7 (ref), v16 (copy)
            if v15 then
                if v7 then
                    return v15.CFrame * CFrame.new(0, v16 * -0.53, v16 * -0.15) * CFrame.Angles(0.25, 0, 0);
                else
                    return v15.CFrame * CFrame.new(0, v16 * -0.45, v16 * -0.15) * CFrame.Angles(0.2, 0, 0);
                end;
            else
                return v18.panelCFrame;
            end;
        end, {
            v15, 
            v16
        });
        v17 = {
            panelName = "ToastNotifications", 
            partSize = if v7 then Vector3.new(1, 0.5, 0, 0) else Vector3.new(1.2000000476837158, 0.6000000238418579, 0, 0), 
            virtualScreenSize = Vector2.new(300, 150), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isToastOpen_0, 
            tiltCallback = v19
        };
    end;
    local v21 = v2.useCallback(function(v20) --[[ Line: 93 ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15.CFrame * CFrame.new(0, 0, -0.1);
        else
            return v20.panelCFrame;
        end;
    end, {
        v15
    });
    return v2.createElement(v2.Fragment, nil, {
        v2.createElement(l_Panel3D_0, v17, {
            Toast = l_ToastComponent_0
        }), 
        v2.createElement(l_Panel3D_0, {
            panelName = "ConfirmationModal", 
            partSize = Vector3.new(3, 3, 0, 0), 
            virtualScreenSize = Vector2.new(600, 600), 
            lerp = false, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = 0, 
            alwaysOnTop = true, 
            parent = l_GuiService_0.CoreGuiFolder, 
            hidden = not l_isConfirmModalOpen_0, 
            tiltCallback = v21
        }, {
            DeeplinkConfirmationModal = l_ConfirmationModalComponent_0
        })
    });
end;