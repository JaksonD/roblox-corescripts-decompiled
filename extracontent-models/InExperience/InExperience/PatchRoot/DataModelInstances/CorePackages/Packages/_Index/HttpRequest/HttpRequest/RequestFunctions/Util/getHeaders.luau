return function(v0, v1) --[[ Line: 1 ]]
    local v2 = v0 or {};
    if (v1 == "POST" or v1 == "PATCH") and not v2["Content-Type"] then
        v2["Content-Type"] = "application/json";
    end;
    return v2;
end;