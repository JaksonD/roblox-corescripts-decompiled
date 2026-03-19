local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Shared).Symbol.named("Nil");
local v2 = {};
local function v5(v3, v4) --[[ Line: 33 ]] --[[ Name: tryPropertyName ]]
    return v3[v4];
end;
return function(v6, v7) --[[ Line: 37 ]] --[[ Name: getDefaultInstanceProperty ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (copy)
    local v8 = v2[v6];
    if v8 then
        local v9 = v8[v7];
        if v9 == v1 then
            return true, nil;
        elseif v9 ~= nil then
            return true, v9;
        end;
    else
        v8 = {};
        v2[v6] = v8;
    end;
    local v10 = Instance.new(v6);
    local l_status_0, l_result_0 = pcall(v5, v10, v7);
    v10:Destroy();
    if l_status_0 then
        if l_result_0 == nil then
            v8[v7] = v1;
            return l_status_0, l_result_0;
        else
            v8[v7] = l_result_0;
        end;
    end;
    return l_status_0, l_result_0;
end;