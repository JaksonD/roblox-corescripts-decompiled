return function(v0, v1, v2) --[[ Line: 6 ]] --[[ Name: calculateSliderValueFromPosition ]]
    local l_AbsoluteRotation_0 = v1.AbsoluteRotation;
    local l_Magnitude_0 = v1.AbsoluteSize.Magnitude;
    local v5 = v1.AbsolutePosition + v1.AbsoluteSize * 0.5;
    local v6 = math.rad(l_AbsoluteRotation_0);
    local v7 = Vector2.new(math.cos(v6), (math.sin(v6)));
    return (math.clamp(math.clamp((v0 - v5):Dot(v7) / l_Magnitude_0 + 0.5, 0, 1) * (v2.Max - v2.Min) + v2.Min, v2.Min, v2.Max));
end;