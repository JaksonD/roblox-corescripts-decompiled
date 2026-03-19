local _ = require(script.Parent.Constants);
return function(v1, v2, v3, v4, v5) --[[ Line: 3 ]]
    local v6 = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", v2, tostring(v1), v3, v3);
    if v4 then
        v6 = v6 .. "&filters=circular";
    end;
    if v5 then
        v6 = v6 .. "&timestamp=" .. os.time();
    end;
    return v6;
end;