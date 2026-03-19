return function(v0) --[[ Line: 9 ]] --[[ Name: extractAndStyleRichTextLinks ]]
    if v0 == nil then
        return {}, "";
    else
        local v1 = {};
        return v1, (string.gsub(v0, "<a%s+href=\"([^\"]+)\">([^<]*)</a>", function(v2, v3) --[[ Line: 21 ]]
            -- upvalues: v1 (copy)
            table.insert(v1, v2);
            return (("<u><b>%*</b></u>"):format(v3));
        end));
    end;
end;