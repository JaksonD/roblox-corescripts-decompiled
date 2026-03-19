local function v7(v0) --[[ Line: 14 ]] --[[ Name: getSortedDescendantUIReadoutInfo ]]
    local l_v0_Descendants_0 = v0:GetDescendants();
    table.insert(l_v0_Descendants_0, v0);
    local v2 = {};
    for _, v4 in ipairs(l_v0_Descendants_0) do
        if v4:IsA("TextLabel") or v4:IsA("TextButton") then
            if #v4.Text > 0 then
                table.insert(v2, {
                    UIType = "Text", 
                    text = v4.Text, 
                    absPosition = v4.AbsolutePosition
                });
            end;
        elseif not v4:IsA("ImageLabel") and not v4:IsA("ImageButton") then
            if v4:IsA("TextBox") then
                table.insert(v2, {
                    UIType = "Text box", 
                    text = if v4.Text == "" then v4.PlaceholderText else v4.Text, 
                    absPosition = v4.AbsolutePosition
                });
            elseif v4:IsA("VideoFrame") then

            end;
        end;
    end;
    table.sort(v2, function(v5, v6) --[[ Line: 53 ]]
        if v5.absPosition.Y == v6.absPosition.Y then
            return v5.absPosition.X < v6.absPosition.X;
        else
            return v5.absPosition.Y < v6.absPosition.Y;
        end;
    end);
    return v2;
end;
return function(v8) --[[ Line: 64 ]]
    -- upvalues: v7 (copy)
    local v9 = v7(v8);
    local v10 = {};
    for _, v12 in ipairs(v9) do
        table.insert(v10, v12.text);
    end;
    return (table.concat(v10, "\n"));
end;