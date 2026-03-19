return function(v0) --[[ Line: 1 ]] --[[ Name: parseBooleanString ]]
    if v0 == nil then
        return nil;
    else
        local v1 = true;
        if v0 ~= "true" then
            v1 = true;
            if v0 ~= "True" then
                v1 = v0 == "1";
            end;
        end;
        return v1;
    end;
end;