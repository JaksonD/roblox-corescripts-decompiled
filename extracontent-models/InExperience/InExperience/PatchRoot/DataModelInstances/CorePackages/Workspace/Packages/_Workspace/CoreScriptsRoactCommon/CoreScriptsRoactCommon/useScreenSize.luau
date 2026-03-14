local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.useState(Vector2.new(0, 0));
    local v4, v5 = v1.useState(workspace.CurrentCamera);
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy)
        local v6 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 11 ]]
            -- upvalues: v5 (ref)
            v5(workspace.CurrentCamera);
        end);
        v5(workspace.CurrentCamera);
        return function() --[[ Line: 17 ]]
            -- upvalues: v6 (copy)
            v6:Disconnect();
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v4 (copy), v3 (copy)
        if not v4 then
            return;
        else
            v3(v4.ViewportSize);
            local v7 = v4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 28 ]]
                -- upvalues: v3 (ref), v4 (ref)
                v3(v4.ViewportSize);
            end);
            return function() --[[ Line: 32 ]]
                -- upvalues: v7 (copy)
                v7:Disconnect();
            end;
        end;
    end, {
        v4
    });
    return v2;
end;