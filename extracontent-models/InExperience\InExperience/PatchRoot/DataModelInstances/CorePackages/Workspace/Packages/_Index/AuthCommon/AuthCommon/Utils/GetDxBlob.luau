return function(v0) --[[ Line: 1 ]]
    if v0 ~= nil and v0.errors ~= nil and v0.errors[1] and v0.errors[1].fieldData then
        return v0.errors[1].fieldData;
    else
        return "";
    end;
end;