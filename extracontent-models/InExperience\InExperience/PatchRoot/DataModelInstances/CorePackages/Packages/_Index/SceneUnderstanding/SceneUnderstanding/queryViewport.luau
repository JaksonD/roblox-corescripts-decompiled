local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.options.ViewportQueryOptions);
return function(v2, v3, v4) --[[ Line: 8 ]] --[[ Name: queryViewport ]]
    -- upvalues: v1 (copy)
    local v5 = v1.new(v4);
    local v6 = 0;
    local v7 = 1;
    local v8 = 0;
    local v9 = 0;
    local v10 = 1;
    local v11 = 0;
    local l_maxScreenDivisions_0 = v5.maxScreenDivisions;
    local v13 = math.ceil(l_maxScreenDivisions_0 / 2) - 1;
    local v14 = {};
    for _ = 1, l_maxScreenDivisions_0 * l_maxScreenDivisions_0 do
        local v16 = Vector2.new((v6 + 0.5 + v13) * (v2.ViewportSize.X / l_maxScreenDivisions_0), (v8 + 0.5 + v13) * (v2.ViewportSize.Y / l_maxScreenDivisions_0));
        local v17 = v2:ScreenPointToRay(v16.X, v16.Y);
        local v18 = workspace:Raycast(v17.Origin, v17.Direction * v5.maxDistance, v5.raycastParams);
        if v18 and v18.Instance and not table.find(v14, v18.Instance) and v3(v18.Instance) then
            table.insert(v14, v18.Instance);
            if #v14 >= v5.limit then
                return v14;
            end;
        end;
        v6 = v6 + v7;
        v8 = v8 + v9;
        v11 = v11 + 1;
        if v11 == v10 then
            v11 = 0;
            local l_v7_0 = v7;
            v7 = -v9;
            v9 = l_v7_0;
            if v9 == 0 then
                v10 = v10 + 1;
            end;
        end;
    end;
    return v14;
end;