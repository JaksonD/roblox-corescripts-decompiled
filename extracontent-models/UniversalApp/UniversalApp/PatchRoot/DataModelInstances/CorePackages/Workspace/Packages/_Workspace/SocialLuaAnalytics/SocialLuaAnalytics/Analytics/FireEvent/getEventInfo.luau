local _ = require(script.Parent.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    return function(v2, v3) --[[ Line: 4 ]]
        -- upvalues: v1 (copy)
        local v4 = v1[v2];
        assert(v4, "Invalid eventName used: " .. tostring(v2) .. " called");
        return v4, v3;
    end;
end;