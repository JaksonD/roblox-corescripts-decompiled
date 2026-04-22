local l_TextService_0 = game:GetService("TextService");
local v1 = {
    PADDING = Vector2.new(2, 2)
};
v1.GetTextBounds = function(v2, v3, v4, v5) --[[ Line: 12 ]] --[[ Name: GetTextBounds ]]
    -- upvalues: l_TextService_0 (copy), v1 (copy)
    return l_TextService_0:GetTextSize(v2, v4, v3, v5) + v1.PADDING;
end;
v1.GetTextWidth = function(v6, v7, v8) --[[ Line: 16 ]] --[[ Name: GetTextWidth ]]
    -- upvalues: v1 (copy)
    return v1.GetTextBounds(v6, v7, v8, Vector2.new(10000, 10000)).X;
end;
v1.GetTextHeight = function(v9, v10, v11, v12) --[[ Line: 20 ]] --[[ Name: GetTextHeight ]]
    -- upvalues: v1 (copy)
    return v1.GetTextBounds(v9, v10, v11, Vector2.new(v12, 10000)).Y;
end;
v1.Truncate = function(v13, v14, v15, v16, v17) --[[ Line: 25 ]] --[[ Name: Truncate ]]
    -- upvalues: v1 (copy)
    v17 = v17 or "";
    if v16 < v1.GetTextWidth(v13, v14, v15) then
        local v18 = "";
        for _, v20 in utf8.graphemes(v13) do
            local v21 = string.sub(v13, 1, v20) .. v17;
            if v16 < v1.GetTextWidth(v21, v14, v15) then
                return v18;
            else
                v18 = v21;
            end;
        end;
        return "";
    else
        return v13;
    end;
end;
v1.TruncateTextLabel = function(v22, v23) --[[ Line: 45 ]] --[[ Name: TruncateTextLabel ]]
    -- upvalues: v1 (copy)
    v22.Text = v1.Truncate(v22.Text, v22.Font, v22.TextSize, v22.AbsoluteSize.X, v23);
end;
v1.Trim = function(v24) --[[ Line: 51 ]] --[[ Name: Trim ]]
    if type(v24) ~= "string" then
        error(string.format("Text.Trim called on non-string type %s.", (type(v24))), 2);
    end;
    return (v24:gsub("^%s*(.-)%s*$", "%1"));
end;
v1.RightTrim = function(v25) --[[ Line: 59 ]] --[[ Name: RightTrim ]]
    if type(v25) ~= "string" then
        error(string.format("Text.RightTrim called on non-string type %s.", (type(v25))), 2);
    end;
    return (v25:gsub("%s+$", ""));
end;
v1.LeftTrim = function(v26) --[[ Line: 67 ]] --[[ Name: LeftTrim ]]
    if type(v26) ~= "string" then
        error(string.format("Text.LeftTrim called on non-string type %s.", (type(v26))), 2);
    end;
    return (v26:gsub("^%s+", ""));
end;
v1.SpaceNormalize = function(v27) --[[ Line: 75 ]] --[[ Name: SpaceNormalize ]]
    if type(v27) ~= "string" then
        error(string.format("Text.SpaceNormalize called on non-string type %s.", (type(v27))), 2);
    end;
    return (v27:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""));
end;
v1.Split = function(v28, v29) --[[ Line: 83 ]] --[[ Name: Split ]]
    if type(v28) ~= "string" then
        error(string.format("Text.Split called on non-string type %s.", (type(v28))), 2);
    elseif type(v29) ~= "string" then
        error(string.format("Text.Split called with a pattern that is non-string type %s.", (type(v29))), 2);
    elseif v29 == "" then
        error("Text.Split called with an empty pattern.", 2);
    end;
    local v30 = {};
    local v31 = 1;
    while true do
        local v32, v33 = string.find(v28, v29, v31, true);
        if v32 and v33 then
            table.insert(v30, (string.sub(v28, v31, v32 - 1)));
            v31 = v33 + 1;
        else
            break;
        end;
    end;
    table.insert(v30, (string.sub(v28, v31, (string.len(v28)))));
    return v30;
end;
return v1;