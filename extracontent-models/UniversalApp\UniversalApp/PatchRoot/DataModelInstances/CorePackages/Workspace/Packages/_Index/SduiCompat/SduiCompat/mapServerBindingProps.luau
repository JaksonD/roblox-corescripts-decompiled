local v0 = {};
local function _(v1) --[[ Line: 3 ]] --[[ Name: isPascalCase ]]
    -- upvalues: v0 (copy)
    if v0[v1] then
        return true;
    elseif typeof(v1) ~= "string" then
        return false;
    else
        local v2 = v1:sub(1, 1);
        local v3 = v2 == v2:upper();
        if v3 then
            v0[v1] = true;
        end;
        return v3;
    end;
end;
return function(v5, v6) --[[ Line: 30 ]] --[[ Name: mapServerBindingProps ]]
    -- upvalues: v0 (copy)
    local v7 = nil;
    local v8 = nil;
    for v9, v10 in v5 do
        local v11 = v6[v9];
        if v11 ~= nil then
            v7 = v7 or {};
            v7[v11] = v10;
        else
            local v12;
            if v0[v9] then
                v12 = true;
            elseif typeof(v9) ~= "string" then
                v12 = false;
            else
                local v13 = v9:sub(1, 1);
                local v14 = v13 == v13:upper();
                if v14 then
                    v0[v9] = true;
                end;
                v12 = v14;
            end;
            if v12 then
                v8 = v8 or {};
                table.insert(v8, v9);
            end;
        end;
    end;
    return v7, v8;
end;