return function(v0, v1) --[[ Line: 3 ]] --[[ Name: getDiffBetweenOrientations ]]
    local _, v3 = (v0 * v1:Inverse()):ToAxisAngle();
    return (math.deg(v3));
end;