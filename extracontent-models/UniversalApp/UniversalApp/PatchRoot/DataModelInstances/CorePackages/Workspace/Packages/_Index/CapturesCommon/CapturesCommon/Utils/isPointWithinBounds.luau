return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: isPointWithinBounds ]]
    local v3 = false;
    if math.clamp(v0.X, v1.X, v1.X + v2.X) == v0.X then
        v3 = math.clamp(v0.Y, v1.Y, v1.Y + v2.Y) == v0.Y;
    end;
    return v3;
end;