return function(v0, v1) --[[ Line: 1 ]] --[[ Name: strict ]]
    local v2 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v4) --[[ Line: 5 ]] --[[ Name: __index ]]
            -- upvalues: v2 (copy)
            local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(v4), typeof(v4), v2);
            error(v5, 2);
        end, 
        __newindex = function(_, v7) --[[ Line: 11 ]] --[[ Name: __newindex ]]
            -- upvalues: v2 (copy)
            local v8 = ("%q (%s) is not a valid member of %s"):format(tostring(v7), typeof(v7), v2);
            error(v8, 2);
        end
    }));
end;