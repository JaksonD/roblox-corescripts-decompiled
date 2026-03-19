return function(v0) --[[ Line: 3 ]] --[[ Name: getAssetIdAsNumeric ]]
    if typeof(v0) == "number" then
        return v0;
    else
        local v1 = tonumber(v0:match("(%d+)$"));
        if v1 then
            return v1;
        else
            return -1;
        end;
    end;
end;