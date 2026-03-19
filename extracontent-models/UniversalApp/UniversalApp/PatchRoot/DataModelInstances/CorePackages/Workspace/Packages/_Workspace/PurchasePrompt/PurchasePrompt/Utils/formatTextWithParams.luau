return function(v0, v1) --[[ Line: 1 ]] --[[ Name: formatTextWithParams ]]
    if v1 ~= nil then
        for v2, v3 in pairs(v1) do
            local v4 = ("{%s}"):format(v2);
            v0 = string.gsub(v0, v4, function() --[[ Line: 5 ]]
                -- upvalues: v3 (copy)
                return v3;
            end);
        end;
    end;
    return v0;
end;