return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: calculateSliderStepValue ]]
    if v1 > 0 then
        local v3 = math.floor((v0 - v2.Min) / v1 + 0.5);
        return (math.clamp(v2.Min + v3 * v1, v2.Min, v2.Max));
    else
        return v0;
    end;
end;