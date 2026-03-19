local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
return function() --[[ Line: 7 ]] --[[ Name: useScreenHeight ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v4 = v3();
    local v5, v6 = v2.useState(v4 and v4.AbsoluteSize.Y or 0);
    v2.useLayoutEffect(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v6 (copy)
        local v7 = nil;
        if v4 then
            v6(v4.AbsoluteSize.Y);
            v7 = v4:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 16 ]]
                -- upvalues: v6 (ref), v4 (ref)
                v6(v4.AbsoluteSize.Y);
            end);
        end;
        return function() --[[ Line: 21 ]]
            -- upvalues: v7 (ref)
            if v7 then
                v7:Disconnect();
            end;
        end;
    end, {
        v4
    });
    return v5;
end;