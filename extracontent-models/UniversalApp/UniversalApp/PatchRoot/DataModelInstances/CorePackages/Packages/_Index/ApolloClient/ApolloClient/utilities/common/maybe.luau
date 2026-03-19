return {
    maybe = function(v0) --[[ Line: 10 ]] --[[ Name: maybe ]]
        local _, v2, v3 = xpcall(function() --[[ Line: 12 ]]
            -- upvalues: v0 (copy)
            return v0(), true;
        end, function() --[[ Line: 14 ]]

        end);
        if v3 then
            return v2;
        else
            return nil;
        end;
    end
};