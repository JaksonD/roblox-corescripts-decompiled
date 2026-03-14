return function(v0, v1) --[[ Line: 14 ]] --[[ Name: endsWith ]]
    return v0:sub(-v1:len()) == v1;
end;