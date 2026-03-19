local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = v1.strictInterface({
    model = v1.instanceIsA("Model"), 
    cameraFieldOfView = v1.optional(v1.numberConstrained(1, 120)), 
    upVector = v1.optional(v1.Vector3), 
    lookVector = v1.optional(v1.Vector3), 
    bottomOffset = v1.optional(v1.numberMin(0)), 
    topOffset = v1.optional(v1.numberMin(0))
});
return function(v3) --[[ Line: 28 ]] --[[ Name: getCameraSettingsToFitModel ]]
    -- upvalues: v2 (copy)
    assert(v2(v3));
    local v4 = v3.model:Clone();
    local v5 = v3.cameraFieldOfView or 70;
    local v6 = v3.upVector.Unit or Vector3.fromAxis(Enum.Axis.Y);
    local v7 = v3.lookVector.Unit or Vector3.fromAxis(Enum.Axis.Z);
    local v8 = v6:Cross(v7);
    local v9 = v3.bottomOffset or 0;
    local v10 = v3.topOffset or 0;
    assert(math.abs((v6:Dot(v7))) < 1.0E-5, "upVector and lookVector must be perpendicular");
    local l_PrimaryPart_0 = v4.PrimaryPart;
    local v12 = l_PrimaryPart_0 and l_PrimaryPart_0.CFrame.Position or Vector3.new();
    local v13 = CFrame.fromMatrix(Vector3.new(), v8, v6);
    local v14 = Instance.new("Part", v4);
    v14.Size = Vector3.new(0, 0, 0, 0);
    v4.PrimaryPart = v14;
    v14.CFrame = v13 * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos(v5 * 3.141592653589793 / 360), (math.sin(v5 * 3.141592653589793 / 360))))) + v12;
    local l_v4_BoundingBox_0, v16 = v4:GetBoundingBox();
    l_v4_BoundingBox_0 = l_v4_BoundingBox_0 + v13 * Vector3.new(0, -v9, 0);
    local v17 = l_v4_BoundingBox_0:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(v12 - l_v4_BoundingBox_0.Position) + v16.Y / 2;
    local v18 = v14.Position - v17 * l_v4_BoundingBox_0.UpVector;
    local l_LookVector_0 = l_v4_BoundingBox_0.LookVector;
    v14.CFrame = v13 * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos(v5 * 3.141592653589793 / 360), -math.sin(v5 * 3.141592653589793 / 360)))) + v12;
    local l_v4_BoundingBox_1, v21 = v4:GetBoundingBox();
    l_v4_BoundingBox_1 = l_v4_BoundingBox_1 + v13 * Vector3.new(0, v10, 0);
    local v22 = l_v4_BoundingBox_1:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(l_v4_BoundingBox_1.Position - v12) + v21.Y / 2;
    local v23 = v14.Position + v22 * l_v4_BoundingBox_1.UpVector;
    local l_LookVector_1 = l_v4_BoundingBox_1.LookVector;
    v4:Destroy();
    local v25 = v18 + l_LookVector_0 * l_LookVector_1:Cross(v23 - v18).Magnitude / l_LookVector_1:Cross(l_LookVector_0).Magnitude;
    local v26 = (v12 - v25):Dot(v7);
    local v27 = v25 + v26 * v7;
    return {
        distance = v26, 
        focusPoint = v27
    };
end;