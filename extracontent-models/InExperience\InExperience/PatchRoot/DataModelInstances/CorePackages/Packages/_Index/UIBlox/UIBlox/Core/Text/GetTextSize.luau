local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Logger);
local v3 = Vector2.new(2, 2);
return function(v4, v5, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: getTextSize ]]
    -- upvalues: l_TextService_0 (copy), v3 (copy), v2 (copy)
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = Font.fromEnum(v6);
    l_GetTextBoundsParams_0.Size = v5;
    l_GetTextBoundsParams_0.Text = v4;
    l_GetTextBoundsParams_0.Width = v7.X;
    l_GetTextBoundsParams_0.RichText = v8 or false;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
        -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (copy)
        return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
    end);
    if l_status_0 then
        return Vector2.new(l_result_0.X, (math.min(l_result_0.Y, v7.Y))) + v3;
    else
        v2:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", l_result_0);
        return v7;
    end;
end;