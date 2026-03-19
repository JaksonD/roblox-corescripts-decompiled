local _ = require(script.Parent.Parent.Stores.types);
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: mergeTTIEventMetadata ]]
    local v3 = table.clone(v1);
    for v4, v5 in v2 do
        v3[v4] = v5;
    end;
    return v3;
end;