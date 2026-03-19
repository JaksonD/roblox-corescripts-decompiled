local _ = require(script.Parent.ObjMap);
return {
    mapValue = function(v1, v2) --[[ Line: 15 ]] --[[ Name: mapValue ]]
        local v3 = {};
        for v4, v5 in pairs(v1) do
            v3[v4] = v2(v5, v4);
        end;
        return v3;
    end
};