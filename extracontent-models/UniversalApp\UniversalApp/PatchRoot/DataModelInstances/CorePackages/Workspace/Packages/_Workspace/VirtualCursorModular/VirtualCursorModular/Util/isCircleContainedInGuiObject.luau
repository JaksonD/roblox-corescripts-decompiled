return function(v0, v1, v2) --[[ Line: 3 ]]
    local v3 = 0.5 * v2.AbsoluteSize;
    local v4 = v0 - (v2.AbsolutePosition + v3);
    local l_Magnitude_0 = v4.Magnitude;
    local v6 = math.atan2(v4.Y, v4.X) - math.rad(v2.AbsoluteRotation);
    v4 = l_Magnitude_0 * Vector2.new(math.cos(v6), (math.sin(v6)));
    local v7 = false;
    if -v3.X <= v4.X - v1 then
        v7 = false;
        if v3.X >= v4.X + v1 then
            v7 = false;
            if -v3.Y <= v4.Y - v1 then
                v7 = v3.Y >= v4.Y + v1;
            end;
        end;
    end;
    return v7;
end;