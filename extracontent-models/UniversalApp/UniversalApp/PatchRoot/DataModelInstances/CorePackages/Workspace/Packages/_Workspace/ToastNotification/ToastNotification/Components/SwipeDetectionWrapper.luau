local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy)
    local v4 = v2.createRef();
    local v5, v6 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v3 (copy), l_UserInputService_0 (ref), v4 (copy), v6 (copy), v5 (copy)
        if v3.swipeEnabled and v3.swipeCallback then
            local v10 = l_UserInputService_0.TouchStarted:Connect(function(v7) --[[ Line: 29 ]]
                -- upvalues: v4 (ref), v6 (ref)
                local v8 = v4 and v4.current;
                if not v8 then
                    return;
                else
                    local v9 = Vector2.new(v7.Position.X, v7.Position.Y) - v8.AbsolutePosition;
                    if v9.X >= 0 and v9.Y >= 0 and v9.X <= v8.AbsoluteSize.X and v9.Y <= v8.AbsoluteSize.Y then
                        v6(true);
                    end;
                    return;
                end;
            end);
            local v11 = l_UserInputService_0.TouchEnded:Connect(function() --[[ Line: 46 ]]
                -- upvalues: v6 (ref)
                v6(false);
            end);
            local v13 = if v5 then l_UserInputService_0.TouchSwipe:Connect(function(v12) --[[ Line: 50 ]]
                -- upvalues: v5 (ref), v3 (ref)
                if v5 then
                    v3.swipeCallback(v12);
                end;
            end) else nil;
            return function() --[[ Line: 57 ]]
                -- upvalues: v10 (copy), v11 (copy), v13 (copy)
                v10:Disconnect();
                v11:Disconnect();
                if v13 then
                    v13:Disconnect();
                end;
            end;
        else
            v6(false);
            return nil;
        end;
    end, {
        v3.swipeEnabled, 
        v3.swipeCallback, 
        v4, 
        v5
    });
    return v2.createElement("Frame", {
        Size = v3.Size, 
        AutomaticSize = v3.AutomaticSize, 
        BackgroundTransparency = 1, 
        Active = true, 
        ref = v4
    }, v3.children);
end;