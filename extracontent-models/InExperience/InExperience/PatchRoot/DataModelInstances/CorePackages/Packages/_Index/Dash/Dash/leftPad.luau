return function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: leftPad ]]
    local v3 = v2 or " ";
    local v4 = v1 - v0:len();
    local v5 = v4 % v3:len();
    local v6 = (v4 - v5) / v3:len();
    return string.rep(v3 or " ", v6) .. v3:sub(1, v5) .. v0;
end;