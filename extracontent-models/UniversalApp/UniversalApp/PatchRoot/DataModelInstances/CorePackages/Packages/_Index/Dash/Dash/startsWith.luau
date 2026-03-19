return function(v0, v1) --[[ Line: 16 ]] --[[ Name: startsWith ]]
    return v0:sub(1, v1:len()) == v1;
end;