local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 5 ]] --[[ Name: useDialogSize ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useBinding(Vector2.new(0, 0));
    v1.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v4 (copy)
        local l_current_0 = v2.current;
        if not l_current_0 then
            return;
        else
            local function v7() --[[ Line: 14 ]] --[[ Name: updateDialogSize ]]
                -- upvalues: l_current_0 (copy), v4 (ref)
                local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
                if l_AbsoluteSize_0.X == 0 or l_AbsoluteSize_0.Y == 0 then
                    return;
                else
                    v4(l_AbsoluteSize_0);
                    return;
                end;
            end;
            local l_AbsoluteSize_1 = l_current_0.AbsoluteSize;
            if l_AbsoluteSize_1.X ~= 0 and l_AbsoluteSize_1.Y ~= 0 then
                v4(l_AbsoluteSize_1);
            end;
            l_AbsoluteSize_1 = l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v7);
            return function() --[[ Line: 26 ]]
                -- upvalues: l_AbsoluteSize_1 (copy)
                l_AbsoluteSize_1:Disconnect();
            end;
        end;
    end, {});
    return v3;
end;