return function(v0, v1, v2) --[[ Line: 30 ]]
    local v3 = {};
    v3.__index = v3;
    v3.__tostring = function(v4) --[[ Line: 33 ]]
        -- upvalues: v0 (copy)
        return getmetatable(v0).__tostring(v4);
    end;
    local v5 = {};
    v3.new = function(...) --[[ Line: 39 ]]
        -- upvalues: v2 (copy), v3 (copy)
        local v6 = {};
        v2(v6, ...);
        return (setmetatable(v6, v3));
    end;
    if typeof((getmetatable(v0))) == "table" and getmetatable(v0).__call then
        v5.__call = function(_, ...) --[[ Line: 46 ]]
            -- upvalues: v3 (copy)
            return v3.new(...);
        end;
    end;
    v5.__index = v0;
    v5.__tostring = function(v8) --[[ Line: 52 ]]
        -- upvalues: v3 (copy), v1 (copy), v0 (copy)
        if v8 == v3 then
            return (tostring(v1));
        else
            return getmetatable(v0).__tostring(v8);
        end;
    end;
    setmetatable(v3, v5);
    return v3;
end;