local v0 = {
    maxDistance = 5000, 
    maxScreenDivisions = 16, 
    limit = 1e999
};
return {
    new = function(v1) --[[ Line: 44 ]] --[[ Name: new ]]
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