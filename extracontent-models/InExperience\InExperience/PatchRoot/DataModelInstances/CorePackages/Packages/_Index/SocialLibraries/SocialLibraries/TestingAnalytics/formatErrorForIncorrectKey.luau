return function(v0) --[[ Line: 1 ]]
    return function(v1, v2) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local v3, v4 = v0(v1);
        if v3 == false then
            return v3, v4 .. ". Issue with: " .. v2;
        else
            return v3;
        end;
    end;
end;