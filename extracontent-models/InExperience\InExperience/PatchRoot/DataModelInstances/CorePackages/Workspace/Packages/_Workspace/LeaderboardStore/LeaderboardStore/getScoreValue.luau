return function(v0) --[[ Line: 1 ]] --[[ Name: getScoreValue ]]
    if typeof(v0) == "boolean" then
        if v0 then
            return 1;
        else
            return 0;
        end;
    else
        return v0;
    end;
end;