return function(v0, v1, v2, v3) --[[ Line: 1 ]] --[[ Name: calculateNextStepValue ]]
    return (math.clamp(v1 + (v0 > 0 and 1 or v0 < 0 and -1 or 0) * v2, v3.Min, v3.Max));
end;