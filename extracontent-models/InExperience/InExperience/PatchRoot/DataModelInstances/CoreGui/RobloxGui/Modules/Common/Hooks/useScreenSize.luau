local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function() --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v2 = nil;
    local v3 = nil;
    local v4, v5 = v1.useState(Vector2.new(0, 0));
    local function v7() --[[ Line: 9 ]]
        -- upvalues: v5 (copy)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            v5(Vector2.new(l_CurrentCamera_0.ViewportSize.X, l_CurrentCamera_0.ViewportSize.Y));
        end;
    end;
    local function v9() --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v7 (copy)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if v3 then
            pcall(function() --[[ Line: 20 ]]
                -- upvalues: v3 (ref)
                v3:Disconnect();
            end);
            v3 = nil;
        end;
        if l_CurrentCamera_1 then
            v3 = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(v7);
        end;
    end;
    v1.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v2 (ref), v9 (copy), v5 (copy), v3 (ref)
        v2 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v9);
        v9();
        local l_CurrentCamera_2 = workspace.CurrentCamera;
        if l_CurrentCamera_2 then
            v5(Vector2.new(l_CurrentCamera_2.ViewportSize.X, l_CurrentCamera_2.ViewportSize.Y));
        end;
        return function() --[[ Line: 36 ]]
            -- upvalues: v2 (ref), v3 (ref)
            if v2 then
                v2:Disconnect();
            end;
            if v3 then
                v3:Disconnect();
            end;
        end;
    end, {});
    return v4;
end;