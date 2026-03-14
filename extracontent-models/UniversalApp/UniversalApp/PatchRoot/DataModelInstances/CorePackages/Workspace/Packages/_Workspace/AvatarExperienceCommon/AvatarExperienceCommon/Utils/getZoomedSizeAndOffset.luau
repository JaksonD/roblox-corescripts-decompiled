return function(v0, v1, v2) --[[ Line: 7 ]] --[[ Name: getZoomedSizeAndOffset ]]
    local v3 = if v2 then v2.X else 0.5;
    local v4 = if v2 then v2.Y else 0.5;
    local v5 = if v1 == 0 then v0.X else v0.X / v1;
    local v6 = if v1 == 0 then v0.Y else v0.Y / v1;
    return {
        offset = Vector2.new((v0.X - v5) * v3, (v0.Y - v6) * v4), 
        size = Vector2.new(v5, v6)
    };
end;