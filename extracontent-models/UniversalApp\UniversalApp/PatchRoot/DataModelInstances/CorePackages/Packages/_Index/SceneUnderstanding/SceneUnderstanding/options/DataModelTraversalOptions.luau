local v0 = {
    instanceProcessingLimit = 1000
};
return {
    new = function(v1) --[[ Line: 24 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy)
        local v2 = table.clone(v0);
        if v1 then
            for v3, v4 in v1 do
                v2[v3] = v4;
            end;
        end;
        return v2;
    end
};