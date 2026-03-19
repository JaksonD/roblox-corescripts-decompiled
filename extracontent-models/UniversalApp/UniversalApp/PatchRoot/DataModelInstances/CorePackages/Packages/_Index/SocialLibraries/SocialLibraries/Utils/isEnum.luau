return function(v0) --[[ Line: 3 ]]
    if type(v0) == "userdata" and v0.rawValue then
        return true;
    else
        return false;
    end;
end;