local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local v1 = require(l_Parent_0.MockableProxyServices);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVRUpdate3");
local l_VRService_0 = v1.VRService;
return {
    RayPlaneIntersection = function(v4, v5, v6) --[[ Line: 17 ]] --[[ Name: RayPlaneIntersection ]]
        v5 = v5.unit;
        v4 = v4.Unit;
        local v7 = v5:Dot(v4.Direction);
        if v7 == 0 then
            return nil;
        else
            local v8 = v5:Dot(v6 - v4.Origin) / v7;
            if v8 < 0 then
                return nil;
            else
                return v4.Origin + v4.Direction * v8;
            end;
        end;
    end, 
    GetUserCFrameWorldSpace = function(v9) --[[ Line: 35 ]] --[[ Name: GetUserCFrameWorldSpace ]]
        -- upvalues: l_VRService_0 (copy)
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(v9);
        if not workspace.CurrentCamera.HeadLocked then
            l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_l_VRService_0_UserCFrame_0;
        end;
        return workspace.CurrentCamera.CFrame * (CFrame.new(l_l_VRService_0_UserCFrame_0.p * workspace.CurrentCamera.HeadScale) * (l_l_VRService_0_UserCFrame_0 - l_l_VRService_0_UserCFrame_0.p));
    end, 
    getCurrentControllerType = function() --[[ Line: 47 ]] --[[ Name: getCurrentControllerType ]]
        -- upvalues: l_game_EngineFeature_0 (copy), l_VRService_0 (copy)
        local v11 = l_game_EngineFeature_0 and l_VRService_0.VRDeviceName or nil;
        local v12 = v11:match("Oculus") or v11:match("Meta") or v11:match("OpenXr") or v11:match("OpenXR");
        if v11:match("Vive") then
            return "Vive";
        elseif v11:match("Rift") then
            return "Rift";
        elseif v11:match("Index") then
            return "Index";
        elseif v12 then
            return "Touch";
        else
            return "Rift";
        end;
    end
};