local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy)
    local v3, v4 = v2.useState(l_GuiService_0.TopbarInset.Height);
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: l_GuiService_0 (ref), v4 (copy)
        local v5 = l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 13 ]]
            -- upvalues: v4 (ref), l_GuiService_0 (ref)
            v4(l_GuiService_0.TopbarInset.Height);
        end);
        return function() --[[ Line: 17 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    end, {});
    return v3;
end;