local function v3(v0, v1) --[[ Line: 7 ]] --[[ Name: invalidKey ]]
    local v2 = ("%q (%s) is not a valid member of %s"):format(tostring(v1), typeof(v1), (tostring(v0)));
    error(v2, 2);
end;
return function(v4, v5) --[[ Line: 13 ]] --[[ Name: strict ]]
    -- upvalues: v3 (copy)
    return (setmetatable(v4, {
        __index = v3, 
        __newindex = v3, 
        __tostring = function() --[[ Line: 17 ]] --[[ Name: __tostring ]]
            -- upvalues: v5 (copy)
            return v5;
        end
    }));
end;