local _ = script.Parent.Parent;
local l_TextService_0 = game:GetService("TextService");
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_TextService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
        -- upvalues: l_TextService_0 (ref), v2 (copy)
        return l_TextService_0:GetTextSize("", 0, v2, Vector2.new(1e999, 1e999)).Y;
    end);
    return l_status_0, l_result_0;
end;