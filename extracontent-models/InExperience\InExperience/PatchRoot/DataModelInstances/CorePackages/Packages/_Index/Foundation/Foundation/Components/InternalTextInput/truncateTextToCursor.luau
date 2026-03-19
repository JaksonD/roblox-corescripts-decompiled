local function _(v0, v1) --[[ Line: 10 ]] --[[ Name: charAt ]]
    return v0:sub(v1, v1);
end;
return function(v3) --[[ Line: 27 ]] --[[ Name: truncateTextToCursor ]]
    local l_CursorPosition_0 = v3.CursorPosition;
    if l_CursorPosition_0 == -1 then
        return "";
    else
        local l_Text_0 = v3.Text;
        local v6 = v3.TextSize * v3.LineHeight / 1.4;
        local v7 = l_CursorPosition_0 + v3.AbsoluteSize.X / v6;
        local v8 = string.find(l_Text_0, "\n", l_CursorPosition_0) or 1e999;
        local v9 = string.find(l_Text_0, "[ \t\f\v]", l_CursorPosition_0) or 1e999;
        local v10 = math.min(v8 - 1, v9, #l_Text_0);
        local v11 = l_Text_0:sub(l_CursorPosition_0, l_CursorPosition_0):match("\n");
        if v11 then
            local v12 = l_CursorPosition_0 - 1;
            v11 = l_Text_0:sub(v12, v12):match("\n") or l_CursorPosition_0 == 1;
        end;
        if v11 then
            v10 = l_CursorPosition_0 - 1;
        elseif v7 < v10 then
            v10 = l_CursorPosition_0;
        end;
        return utf8.char(utf8.codepoint(l_Text_0, 1, v10));
    end;
end;