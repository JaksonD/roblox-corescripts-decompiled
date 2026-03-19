return function(v0) --[[ Line: 21 ]] --[[ Name: create ]]
    return function(v1) --[[ Line: 22 ]]
        -- upvalues: v0 (copy)
        local v2 = Instance.new(v0);
        local v3 = nil;
        for v4, v5 in pairs(v1) do
            if type(v4) == "number" and typeof(v5) == "Instance" then
                v5.Parent = v2;
            elseif type(v4) == "string" then
                if v4 == "Parent" then
                    v3 = v5;
                else
                    v2[v4] = v5;
                end;
            end;
        end;
        v2.Parent = v3;
        return v2;
    end;
end;