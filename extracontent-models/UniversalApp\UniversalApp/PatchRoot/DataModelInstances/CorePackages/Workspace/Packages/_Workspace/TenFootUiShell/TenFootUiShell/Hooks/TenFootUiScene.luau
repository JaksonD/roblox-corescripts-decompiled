local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.Constants);
local v2 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.SceneManagement);
local l_Lighting_0 = v4.Lighting;
local l_BackgroundScene_0 = v4.BackgroundScene;
local v7 = require(l_Parent_0.Otter);
local l_BACKGROUND_MODEL_NAME_0 = v1.BACKGROUND_MODEL_NAME;
local v9 = {
    BackgroundConfigs = {
        BackgroundModelName = l_BACKGROUND_MODEL_NAME_0, 
        PositionOffset = Vector3.new(10, 0, 0, 0), 
        RotationOffset = Vector3.new(0, 50, 0, 0), 
        DistanceToCamera = v2.DEFAULT_BACKGROUND_DISTANCE_TO_CAMERA
    }, 
    CameraConfigs = {
        FieldOfView = 50, 
        Position = v1.CAMERA_POSITION
    }
};
local v10 = {
    positionX = v7.createSingleMotor(0), 
    positionZ = v7.createSingleMotor(0)
};
local v11 = {};
local function v14() --[[ Line: 37 ]] --[[ Name: shutDownMotors ]]
    -- upvalues: v11 (ref)
    for _, v13 in v11 do
        v13();
    end;
    table.clear(v11);
end;
local function v21(v15) --[[ Line: 44 ]] --[[ Name: startUpMotors ]]
    -- upvalues: v11 (ref), v10 (ref), l_BackgroundScene_0 (copy), l_BACKGROUND_MODEL_NAME_0 (copy)
    for _, v17 in v11 do
        v17();
    end;
    table.clear(v11);
    local l_Position_0 = v15:GetPivot().Position;
    v11 = {
        v10.positionX:onStep(function(v19) --[[ Line: 50 ]]
            -- upvalues: l_BackgroundScene_0 (ref), l_BACKGROUND_MODEL_NAME_0 (ref), l_Position_0 (copy)
            l_BackgroundScene_0.updateXPosition(l_BACKGROUND_MODEL_NAME_0, l_Position_0.X + v19);
        end), 
        v10.positionZ:onStep(function(v20) --[[ Line: 53 ]]
            -- upvalues: l_BackgroundScene_0 (ref), l_BACKGROUND_MODEL_NAME_0 (ref), l_Position_0 (copy)
            l_BackgroundScene_0.updateZPosition(l_BACKGROUND_MODEL_NAME_0, l_Position_0.Z + v20);
        end)
    };
end;
local function v25(v22) --[[ Line: 59 ]] --[[ Name: initialize ]]
    -- upvalues: l_Lighting_0 (copy), v10 (ref), l_BackgroundScene_0 (copy), v9 (copy), v21 (copy)
    l_Lighting_0.configure();
    v10 = v22 or v10;
    local v23, v24 = l_BackgroundScene_0.initialize(v9);
    v21(v23);
    return v23, v24;
end;
local function v26() --[[ Line: 67 ]] --[[ Name: getBackgroundInstance ]]
    -- upvalues: l_BackgroundScene_0 (copy), l_BACKGROUND_MODEL_NAME_0 (copy)
    return l_BackgroundScene_0.getBackgroundInstance(l_BACKGROUND_MODEL_NAME_0);
end;
local function v28(v27) --[[ Line: 71 ]] --[[ Name: updateXPosition ]]
    -- upvalues: v10 (ref), v7 (copy), v2 (copy)
    v10.positionX:setGoal(v7.spring(v27, v2.X_DIRECTION_ANIMATION_SPRING_CONFIG));
end;
local function v30(v29) --[[ Line: 75 ]] --[[ Name: updateZPosition ]]
    -- upvalues: v10 (ref), v7 (copy), v2 (copy)
    v10.positionZ:setGoal(v7.spring(v29, v2.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
end;
return {
    initialize = v25, 
    deinitialize = v14, 
    updateXPosition = v28, 
    updateZPosition = v30, 
    getBackgroundInstance = v26
};