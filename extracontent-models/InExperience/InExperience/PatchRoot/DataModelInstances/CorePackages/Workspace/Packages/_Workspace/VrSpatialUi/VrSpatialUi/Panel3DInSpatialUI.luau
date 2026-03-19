local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.React);
local l_Constants_0 = v3.Core.VR.Constants;
local l_Panel3D_0 = v3.Core.VR.Panel3D;
local v7 = require(l_script_FirstAncestor_0.UIManager);
local _ = require(l_script_FirstAncestor_0.Constants);
local v9 = require(l_script_FirstAncestor_0.registerRoactPanel);
local v10 = require(l_script_FirstAncestor_0.Hooks.useHeadScale);
local l_InExperienceUIVRIXP_0 = require(l_Parent_0.SharedExperimentDefinition).InExperienceUIVRIXP;
return v4.memo(function(v12) --[[ Line: 25 ]] --[[ Name: Panel3DInSpatialUI ]]
    -- upvalues: v7 (copy), l_InExperienceUIVRIXP_0 (copy), v4 (copy), v10 (copy), l_Panel3D_0 (copy), l_Constants_0 (copy), l_GuiService_0 (copy), v9 (copy)
    local v13 = v7.getInstance():getScaledPartSizeInPixel(v12.panelType);
    local v14 = v7.getInstance():getPanelSizeInPixel(v12.panelType);
    local v15 = if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then v4.useRef(nil) else nil;
    local v16, _ = v10(v15, v13);
    return v4.createElement(l_Panel3D_0, {
        panelName = v12.panelType, 
        partRef = v15, 
        partSize = if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then v13 else v13 * v16, 
        virtualScreenSize = if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then v14 else v14 * v16, 
        offset = CFrame.new(0, 0, 0), 
        lerp = true, 
        tilt = 0, 
        anchoring = l_Constants_0.AnchoringTypes.PanelManaged, 
        faceCamera = true, 
        curvature = 0, 
        parent = l_GuiService_0.CoreGuiFolder, 
        connectPanelManagerFunction = function(v18) --[[ Line: 43 ]] --[[ Name: connectPanelManagerFunction ]]
            -- upvalues: v9 (ref), v12 (copy), v7 (ref)
            if v18 then
                v9(v18, v12.panelType, v12.visibilityObservable);
                return;
            else
                v7.getInstance():removeRoactPanel(v12.panelType);
                return;
            end;
        end, 
        zOffset = v12.zOffset or 1
    }, {
        ContentContainer = if v12.requireCanvasGroup then v4.createElement("CanvasGroup", {
            BackgroundTransparency = 1, 
            Name = "AnimatablePanelManagedContent", 
            BorderSizePixel = 0, 
            GroupTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            Content = v12.renderFunction(if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then v14 else v14 * v16)
        }) else v12.renderFunction(if l_InExperienceUIVRIXP_0:isSpatialUIScalingFixEnabled() then v14 else v14 * v16)
    });
end);