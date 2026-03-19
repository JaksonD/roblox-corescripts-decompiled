local v0 = {
    [Enum.NormalId.Front] = CFrame.identity, 
    [Enum.NormalId.Left] = CFrame.fromEulerAngles(0, 1.5707963267948966, 0), 
    [Enum.NormalId.Back] = CFrame.fromEulerAngles(0, 3.141592653589793, 0), 
    [Enum.NormalId.Right] = CFrame.fromEulerAngles(0, -1.5707963267948966, 0), 
    [Enum.NormalId.Top] = CFrame.fromEulerAnglesYXZ(1.5707963267948966, -1.5707963267948966, 0), 
    [Enum.NormalId.Bottom] = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, -1.5707963267948966, 0)
};
return function(v1, v2, v3) --[[ Line: 18 ]] --[[ Name: guiPositionToScreenPosition ]]
    -- upvalues: v0 (copy)
    local v4 = v2 / v1.AbsoluteSize;
    if v1:IsA("ScreenGui") then
        return v2;
    elseif v1:IsA("BillboardGui") then
        local l_v1_ScreenSpaceBounds_0 = v1:GetScreenSpaceBounds();
        if not l_v1_ScreenSpaceBounds_0 then
            return nil;
        else
            return l_v1_ScreenSpaceBounds_0.Min + v4 * Vector2.new(l_v1_ScreenSpaceBounds_0.Width, l_v1_ScreenSpaceBounds_0.Height);
        end;
    elseif v1:IsA("SurfaceGui") then
        local v6 = v1.Adornee or v1.Parent;
        if not v6 or not v6:IsA("BasePart") then
            return nil;
        else
            local v7 = v0[v1.Face];
            local v8, v9 = v3:WorldToScreenPoint(v6.CFrame * v7 * ((v7:Inverse() * v6.Size):Abs() * Vector3.new(0.5 - v4.X, 0.5 - v4.Y, -0.5)));
            if not v9 then
                return nil;
            else
                return Vector2.new(v8.X, v8.Y);
            end;
        end;
    else
        return nil;
    end;
end;