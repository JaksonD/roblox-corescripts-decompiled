return function(v0, v1) --[[ Line: 2 ]] --[[ Name: RotatePointAroundObject ]]
    local v2 = v1.AbsolutePosition + v1.AbsoluteSize / 2;
    return Vector2.new(math.cos((math.rad(v1.AbsoluteRotation))) * (v0 - v2).Magnitude + v2.X, math.sin((math.rad(v1.AbsoluteRotation))) * (v0 - v2).Magnitude + v2.Y);
end;