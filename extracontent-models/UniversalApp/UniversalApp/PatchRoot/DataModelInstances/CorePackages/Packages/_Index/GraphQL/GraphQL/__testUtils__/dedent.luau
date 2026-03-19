local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
dedent = function(v4, ...) --[[ Line: 18 ]] --[[ Name: dedent ]]
    -- upvalues: l_Array_0 (copy)
    local v5 = {
        ...
    };
    local v6 = "";
    if l_Array_0.isArray(v4) then
        for v7 = 1, #v4 do
            v6 = v6 .. v4[v7];
            if v7 <= #v5 then
                v6 = v6 .. v5[v7];
            end;
        end;
    else
        v6 = v4;
    end;
    local v8 = removeTrailingSpacesAndTabs(removeLeadingNewLines(v6));
    local v9 = "";
    for v10 = 1, string.len(v8) do
        local v11 = string.sub(v8, v10, v10);
        if v11 == " " or v11 == "\t" then
            v9 = v9 .. v11;
        else
            break;
        end;
    end;
    return removeCommonIndent(v8, v9);
end;
removeLeadingNewLines = function(v12) --[[ Line: 50 ]] --[[ Name: removeLeadingNewLines ]]
    -- upvalues: l_String_0 (copy)
    local v13 = l_String_0.findOr(v12, {
        "\n*"
    });
    if v13 ~= nil and v13.index == 1 then
        v12 = string.sub(v12, string.len(v13.match) + 1);
    end;
    return v12;
end;
removeTrailingSpacesAndTabs = function(v14) --[[ Line: 59 ]] --[[ Name: removeTrailingSpacesAndTabs ]]
    -- upvalues: l_String_0 (copy)
    local v15 = nil;
    local v16 = nil;
    local v17 = 1;
    repeat
        v15 = l_String_0.findOr(v14, {
            " +", 
            "\t+"
        }, v17);
        if v15 ~= nil then
            if v16 ~= nil and v16.index + string.len(v16.match) == v15.index then
                v16 = {
                    index = v16.index, 
                    match = v16.match .. v15.match
                };
            else
                v16 = v15;
            end;
            v17 = v15.index + string.len(v15.match);
        end;
    until v15 == nil or string.len(v14) < v17;
    if v16 ~= nil and v16.index + string.len(v16.match) == string.len(v14) + 1 then
        return (string.sub(v14, 1, v16.index - 1));
    else
        return v14;
    end;
end;
removeCommonIndent = function(v18, v19) --[[ Line: 90 ]] --[[ Name: removeCommonIndent ]]
    local v20 = string.gsub(v18, v19, "", 1);
    return (string.gsub(v20, "\n" .. v19, "\n"));
end;
return {
    dedent = dedent
};