local v0 = require(script.Parent.GetTextSize);
return function(v1, v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: getTextHeight ]]
    -- upvalues: v0 (copy)
    local v6 = v5 or 10000;
    local v7 = Vector2.new(v4, (math.min(10000, v6)));
    return v0(v1, v3, v2, v7).Y;
end;