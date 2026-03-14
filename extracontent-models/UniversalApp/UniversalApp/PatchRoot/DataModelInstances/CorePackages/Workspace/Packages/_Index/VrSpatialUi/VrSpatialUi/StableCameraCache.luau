local l_Parent_0 = script:FindFirstAncestor("VrSpatialUi").Parent;
local l_VRUtil_0 = require(l_Parent_0.VrCommon).VRUtil;
local v2 = game:DefineFastInt("SpatialUIHeadLookDotNoMovementThreshold", 990) / 1000;
local v3 = {};
v3.__index = v3;
v3.getCurrentStableCameraCFrame = function(v4) --[[ Line: 18 ]] --[[ Name: getCurrentStableCameraCFrame ]]
    return v4.lastCameraCFrame;
end;
v3.updateAndCheckCameraMoved = function(v5) --[[ Line: 22 ]] --[[ Name: updateAndCheckCameraMoved ]]
    -- upvalues: l_VRUtil_0 (copy), v2 (copy)
    local v6 = l_VRUtil_0.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
    if not v5.lastUserHeadCFrame then
        v5.lastUserHeadCFrame = v6;
        v5.lastCameraCFrame = workspace.CurrentCamera.CFrame;
        return true;
    else
        local v7 = workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable;
        local v8 = v5.lastUserHeadCFrame.LookVector:Dot(v6.LookVector) < v2;
        if not v7 or v8 then
            v5.lastUserHeadCFrame = v6;
            v5.lastCameraCFrame = workspace.CurrentCamera.CFrame;
            return true;
        else
            return false;
        end;
    end;
end;
v3.new = function() --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v9 = {
        lastUserHeadCFrame = nil, 
        lastCameraCFrame = nil
    };
    setmetatable(v9, v3);
    return v9;
end;
return v3;