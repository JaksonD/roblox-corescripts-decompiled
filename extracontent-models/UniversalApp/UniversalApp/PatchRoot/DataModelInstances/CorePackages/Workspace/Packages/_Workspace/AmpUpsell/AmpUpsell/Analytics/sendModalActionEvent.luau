return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    local v4 = {
        aType = v3, 
        origin = v2
    };
    v0.sendEventDeferred(v1, "modalAction", v4);
end;