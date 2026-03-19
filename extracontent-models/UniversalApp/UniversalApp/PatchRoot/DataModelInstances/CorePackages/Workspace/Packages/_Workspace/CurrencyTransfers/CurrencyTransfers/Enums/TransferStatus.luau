local v0 = {
    Initiated = "Initiated", 
    Pending = "Pending", 
    Cancelled = "Cancelled", 
    Failed = "Failed", 
    Completed = "Completed"
};
local v1 = {
    [0] = v0.Initiated, 
    [1] = v0.Pending, 
    [2] = v0.Cancelled, 
    [3] = v0.Failed, 
    [4] = v0.Completed
};
v0.fromValue = function(v2) --[[ Line: 21 ]] --[[ Name: fromValue ]]
    -- upvalues: v1 (copy), v0 (copy)
    if v2 == nil then
        return nil;
    elseif type(v2) == "number" then
        return v1[v2];
    else
        if type(v2) == "string" then
            for _, v4 in pairs(v0) do
                if v4 == v2 then
                    return v2;
                end;
            end;
        end;
        return nil;
    end;
end;
return v0;