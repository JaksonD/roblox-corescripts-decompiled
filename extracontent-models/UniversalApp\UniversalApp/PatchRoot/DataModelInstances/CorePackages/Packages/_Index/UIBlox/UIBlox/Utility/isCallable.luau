return function(v0) --[[ Line: 9 ]] --[[ Name: isCallable ]]
    local v1 = true;
    if type(v0) ~= "function" then
        v1 = type(v0) == "table" and (getmetatable(v0) and getmetatable(v0).__call ~= nil or false);
    end;
    return v1;
end;