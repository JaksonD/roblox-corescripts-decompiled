return function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: floatEquals ]]
    return (v2 or 1.0E-12) >= math.abs(v0 - v1);
end;