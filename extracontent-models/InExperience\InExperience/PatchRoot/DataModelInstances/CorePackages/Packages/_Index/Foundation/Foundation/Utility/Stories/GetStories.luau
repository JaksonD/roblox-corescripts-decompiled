local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0);
local l_Children_0 = l_script_FirstAncestor_0.Components:GetChildren();
local l_Children_1 = l_script_FirstAncestor_0.Providers:GetChildren();
local l_Children_2 = l_script_FirstAncestor_0.Utility:GetChildren();
return function(v5) --[[ Line: 7 ]] --[[ Name: GetStories ]]
    -- upvalues: l_Children_0 (copy), v1 (copy), l_Children_1 (copy), l_Children_2 (copy)
    local v6 = {};
    for _, v8 in l_Children_0 do
        local l_status_0, _ = pcall(function() --[[ Line: 10 ]]
            -- upvalues: v1 (ref), v8 (copy)
            return v1[v8.Name];
        end);
        if l_status_0 == v5 then
            table.insert(v6, v8);
        end;
    end;
    for _, v12 in l_Children_1 do
        local l_status_1, _ = pcall(function() --[[ Line: 19 ]]
            -- upvalues: v1 (ref), v12 (copy)
            return v1[v12.Name .. "Provider"];
        end);
        if l_status_1 == v5 then
            table.insert(v6, v12);
        end;
    end;
    for _, v16 in l_Children_2 do
        local l_status_2, _ = pcall(function() --[[ Line: 28 ]]
            -- upvalues: v1 (ref), v16 (copy)
            return v1.Utility[v16.Name];
        end);
        if v5 and l_status_2 == v5 then
            table.insert(v6, v16);
        end;
    end;
    return v6;
end;