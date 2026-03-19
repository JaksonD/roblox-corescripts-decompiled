local v6 = {
    CalculateTargetCFrame = function(v0) --[[ Line: 9 ]]
        local v1 = nil;
        v1 = if math.abs(v0.LookVector.Y) > 0.9 then v0.UpVector else v0.LookVector;
        v1 = Vector3.new(v1.X, 0, v1.Z).Unit;
        return CFrame.lookAt(v0.Position, v0.Position + v1);
    end, 
    AdjustTargetCFrameWithExtents = function(v2, v3, v4) --[[ Line: 24 ]]
        local v5 = (v3 + v4) / 2;
        return v2 + (v2 - v2.Position) * v5;
    end
};
v6.CalculateTargetCFrameWithExtents = function(v7, v8, v9) --[[ Line: 47 ]]
    -- upvalues: v6 (copy)
    local v10 = v6.CalculateTargetCFrame(v7);
    return v6.AdjustTargetCFrameWithExtents(v10, v8, v9);
end;
return v6;