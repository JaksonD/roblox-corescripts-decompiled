local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2) --[[ Line: 6 ]] --[[ Name: GetSegmentIndexFromPosition ]]
    -- upvalues: v1 (copy)
    local v3 = math.deg((math.atan2(v2.X, v2.Y)));
    if v3 < 0 then
        v3 = v3 + 360;
    end;
    local v4 = 360 / v1.EmotesPerPage;
    local v5 = math.ceil(math.ceil(math.fmod(v3 + math.ceil(v4 / 2), 360) / v4) + (v1.SegmentsStartRotation + 90) / v4);
    if v1.EmotesPerPage < v5 then
        return v5 - v1.EmotesPerPage;
    else
        if v5 < 1 then
            v5 = v5 + v1.EmotesPerPage;
        end;
        return v5;
    end;
end;