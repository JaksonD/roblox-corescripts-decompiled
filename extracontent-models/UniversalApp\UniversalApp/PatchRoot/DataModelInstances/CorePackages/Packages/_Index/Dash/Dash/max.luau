local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.reduce);
local function v4(v2, v3) --[[ Line: 8 ]]
    return v3 < v2;
end;
return function(v5, v6, v7) --[[ Line: 46 ]] --[[ Name: max ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v8 = v7 or v4;
    if v6 then
        return v1(v5, function(v9, v10, v11) --[[ Line: 50 ]]
            -- upvalues: v6 (copy), v8 (copy)
            local v12 = v6(v10, v11);
            if not v9 then
                return {
                    value = v12, 
                    original = v10
                };
            elseif v8(v12, v9.value) then
                return {
                    value = v12, 
                    original = v10
                };
            else
                return v9;
            end;
        end, nil).original;
    else
        return v1(v5, function(v13, v14) --[[ Line: 60 ]]
            -- upvalues: v8 (copy)
            if not v13 then
                return v14;
            elseif v8(v14, v13) then
                return v14;
            else
                return v13;
            end;
        end, nil);
    end;
end;