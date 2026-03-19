return function(v0) --[[ Line: 9 ]] --[[ Name: getThumbSizeVectorFromParamString ]]
    local v1 = string.split(v0, "&");
    if #v1 == 2 then
        local v2 = string.match(v1[1], "%d[%d.]*");
        local v3 = string.match(v1[2], "%d[%d.]*");
        if v2 and v3 then
            return Vector2.new(tonumber(v2), (tonumber(v3)));
        end;
    end;
    return nil;
end;