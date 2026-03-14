return function(v0, v1, v2) --[[ Line: 6 ]] --[[ Name: calculateSliderValueFromDelta ]]
    return (math.clamp(v0 + v1 * (v2.Max - v2.Min), v2.Min, v2.Max));
end;