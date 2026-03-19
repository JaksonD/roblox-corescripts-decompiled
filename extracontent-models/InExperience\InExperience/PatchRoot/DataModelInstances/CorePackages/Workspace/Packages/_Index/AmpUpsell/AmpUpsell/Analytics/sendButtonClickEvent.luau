return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    local v4 = {
        origin = v2, 
        btn = v3
    };
    v0.sendEventDeferred(v1, "buttonClick", v4);
end;