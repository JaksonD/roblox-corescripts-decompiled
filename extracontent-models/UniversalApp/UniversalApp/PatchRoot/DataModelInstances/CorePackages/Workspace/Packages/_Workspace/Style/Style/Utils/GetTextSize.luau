local l_TextService_0 = game:GetService("TextService");
return function(...) --[[ Line: 8 ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(...) + Vector2.new(2, 2);
end;