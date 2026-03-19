local v0 = require(script.Parent.GetTextSize);
return function(v1, v2, v3, v4, v5) --[[ Line: 16 ]] --[[ Name: getWrappedTextWithIcon ]]
    -- upvalues: v0 (copy)
    local v6 = v0("  ", v2, v3, Vector2.new(0, 0)) - v0(" ", v2, v3, Vector2.new(0, 0));
    local v7 = math.ceil((v4 + v5) / v6.X);
    return string.rep(" ", v7) .. v1;
end;