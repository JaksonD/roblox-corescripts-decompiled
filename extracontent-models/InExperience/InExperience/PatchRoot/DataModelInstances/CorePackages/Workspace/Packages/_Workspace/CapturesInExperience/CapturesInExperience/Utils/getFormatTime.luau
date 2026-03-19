return function(v0) --[[ Line: 1 ]] --[[ Name: getFormatTime ]]
    local v1 = math.floor(v0 / 60);
    local v2 = math.floor(v0 % 60);
    return string.format("%01d:%02d", v1, v2);
end;