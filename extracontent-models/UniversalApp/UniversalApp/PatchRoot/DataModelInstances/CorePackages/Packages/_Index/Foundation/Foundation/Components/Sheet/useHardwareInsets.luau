local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.getHardwareSafeAreaInsets);
return function(v3) --[[ Line: 7 ]] --[[ Name: useHardwareInsets ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4, v5 = v1.useState(v2);
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v5 (copy), v2 (ref)
        local v6 = nil;
        if v3 then
            v6 = v3:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 14 ]]
                -- upvalues: v5 (ref), v2 (ref)
                v5(function(v7) --[[ Line: 15 ]]
                    -- upvalues: v2 (ref)
                    local v8 = v2();
                    if v8.bottom ~= v7.bottom or v8.top ~= v7.top or v8.left ~= v7.left or v8.right ~= v7.right then
                        return v8;
                    else
                        return v7;
                    end;
                end);
            end);
        end;
        return function() --[[ Line: 31 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:Disconnect();
            end;
        end;
    end, {
        v3
    });
    return v4;
end;