local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_Signal_0 = v3.Signal;
local l_Connection_0 = v3.Connection;
return function(v6) --[[ Line: 10 ]] --[[ Name: usePointerPosition ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy), l_Connection_0 (copy)
    local v7, v8 = v2.useBinding(Vector2.zero);
    v2.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v8 (copy), l_Signal_0 (ref), l_Connection_0 (ref)
        if not v6 then
            return;
        else
            local function v10(v9) --[[ Line: 18 ]] --[[ Name: setPositionFromInput ]]
                -- upvalues: v8 (ref)
                if v9.Position.X > 0 or v9.Position.Y > 0 then
                    v8(Vector2.new(v9.Position.X, v9.Position.Y));
                end;
            end;
            local v11 = {
                l_Signal_0.Connect(v6.InputBegan, v10), 
                l_Signal_0.Connect(v6.InputChanged, v10), 
                l_Signal_0.Connect(v6.InputEnded, v10)
            };
            return function() --[[ Line: 30 ]]
                -- upvalues: v11 (copy), l_Connection_0 (ref)
                for _, v13 in v11 do
                    l_Connection_0.Disconnect(v13);
                end;
            end;
        end;
    end, {
        v6
    });
    return v7;
end;