local v0 = {};
v0.Expt = function(_, v2, v3, v4, v5) --[[ Line: 5 ]] --[[ Name: Expt ]]
    -- upvalues: v0 (copy)
    if math.abs(v3 - v2) < 0.01 then
        return v3;
    else
        local v6 = v0:Expty(v2, v3, v4, v5);
        return v2 + (v3 - v2) * v6;
    end;
end;
v0.Expty = function(_, _, _, v10, v11) --[[ Line: 17 ]] --[[ Name: Expty ]]
    return 1 - math.exp(- -math.log(1 - v10) * v11);
end;
v0.Sign = function(_, v13) --[[ Line: 24 ]] --[[ Name: Sign ]]
    if v13 > 0 then
        return 1;
    elseif v13 < 0 then
        return -1;
    else
        return 0;
    end;
end;
v0.BezierValForT = function(_, v15, v16, v17, v18, v19) --[[ Line: 34 ]] --[[ Name: BezierValForT ]]
    local v20 = (1 - v19) * (1 - v19) * (1 - v19);
    local v21 = 3 * v19 * (1 - v19) * (1 - v19);
    local v22 = 3 * v19 * v19 * (1 - v19);
    local v23 = v19 * v19 * v19;
    return v20 * v15 + v21 * v16 + v22 * v17 + v23 * v18;
end;
v0._BezierPt2ForT = {
    x = 0, 
    y = 0
};
v0.BezierPt2ForT = function(_, v25, v26, v27, v28, v29, v30, v31, v32, v33) --[[ Line: 43 ]] --[[ Name: BezierPt2ForT ]]
    -- upvalues: v0 (copy)
    v0._BezierPt2ForT.x = v0:BezierValForT(v25, v27, v29, v31, v33);
    v0._BezierPt2ForT.y = v0:BezierValForT(v26, v28, v30, v32, v33);
    return v0._BezierPt2ForT;
end;
v0.YForPointOf2PtLine = function(_, v35, v36, v37) --[[ Line: 55 ]] --[[ Name: YForPointOf2PtLine ]]
    local v38 = (v35.y - v36.y) / (v35.x - v36.x);
    local v39 = v35.y - v38 * v35.x;
    return v38 * v37 + v39;
end;
v0.DeltaTimeToTimescale = function(_, v41) --[[ Line: 63 ]] --[[ Name: DeltaTimeToTimescale ]]
    return v41 / 0.016666666666666666;
end;
v0.SecondsToTick = function(_, v43) --[[ Line: 67 ]] --[[ Name: SecondsToTick ]]
    return 0.016666666666666666 / v43;
end;
v0.ExptValueInSeconds = function(_, v45, v46, v47) --[[ Line: 71 ]] --[[ Name: ExptValueInSeconds ]]
    return 1 - math.pow(v45 / v46, 1 / (60 * v47));
end;
v0.NormalizedDefaultExptValueInSeconds = function(v48, v49) --[[ Line: 75 ]] --[[ Name: NormalizedDefaultExptValueInSeconds ]]
    return v48:ExptValueInSeconds(0.01, 1, v49);
end;
return v0;