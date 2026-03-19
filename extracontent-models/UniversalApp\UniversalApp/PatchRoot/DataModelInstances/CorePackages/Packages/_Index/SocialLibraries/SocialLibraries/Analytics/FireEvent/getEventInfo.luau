local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 4 ]]
    return function(v2) --[[ Line: 5 ]]
        -- upvalues: v1 (copy)
        local v3 = v1[v2];
        assert(v3, "Invalid eventName used: " .. tostring(v2) .. " called");
        return v3;
    end;
end;