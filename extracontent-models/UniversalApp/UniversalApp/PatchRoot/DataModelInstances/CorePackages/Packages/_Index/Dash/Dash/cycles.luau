local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.includes);
local v3 = require(l_Parent_0.keys);
local l_sort_0 = table.sort;
local function v5() --[[ Line: 19 ]] --[[ Name: getDefaultCycles ]]
    return {
        visited = {}, 
        refs = {}, 
        nextRef = 1, 
        omit = {}
    };
end;
local function v6(v7, v8, v9) --[[ Line: 41 ]] --[[ Name: cycles ]]
    -- upvalues: v5 (copy), v3 (copy), l_sort_0 (copy), v2 (copy), v6 (copy)
    if v8 == -1 then
        return v9;
    elseif typeof(v7) == "table" then
        local v10 = v9 or v5();
        if v10.visited[v7] then
            if not v10.refs[v7] then
                v10.refs[v7] = v10.nextRef;
                v10.nextRef = v10.nextRef + 1;
            end;
            return nil;
        else
            v10.visited[v7] = true;
            local v11 = v3(v7);
            l_sort_0(v11, function(v12, v13) --[[ Line: 62 ]]
                if typeof(v12) == "number" and typeof(v13) == "number" then
                    return v12 < v13;
                else
                    return tostring(v12) < tostring(v13);
                end;
            end);
            for _, v15 in ipairs(v11) do
                local v16 = v7[v15];
                if not v2(v10.omit, v15) then
                    if v8 then
                        v6(v15, v8 - 1, v10);
                        v6(v16, v8 - 1, v10);
                    else
                        v6(v15, nil, v10);
                        v6(v16, nil, v10);
                    end;
                end;
            end;
            return v10;
        end;
    else
        return nil;
    end;
end;
return v6;