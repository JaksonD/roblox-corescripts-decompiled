local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local _ = require(l_script_FirstAncestor_0.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.TokenName);
local v3 = require(l_script_FirstAncestor_0.Parser.parseXmlAttributes);
local v4 = require(l_script_FirstAncestor_0.Utils.escapeRichFormatting);
local v5 = {
    Open = "OPEN", 
    Close = "CLOSE", 
    OpenClose = "OPEN_CLOSE"
};
local v6 = {
    {
        name = v5.OpenClose, 
        pattern = "^<([%w-]+)%s?([^>]*)/>"
    }, 
    {
        name = v5.Open, 
        pattern = "^<([%w-]+)%s?([^>]*)>"
    }, 
    {
        name = v5.Close, 
        pattern = "^</([%w-]+)%s?([^>]*)>"
    }
};
local v17 = {
    [v5.Open] = function(v7, v8, v9) --[[ Line: 32 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v10 = v3(v9);
        table.insert(v7, {
            name = v2.Open, 
            text = v8, 
            attributes = v10
        });
    end, 
    [v5.Close] = function(v11, v12) --[[ Line: 40 ]]
        -- upvalues: v2 (copy)
        table.insert(v11, {
            name = v2.Close, 
            text = v12, 
            attributes = {}
        });
    end, 
    [v5.OpenClose] = function(v13, v14, v15) --[[ Line: 47 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v16 = v3(v15);
        table.insert(v13, {
            name = v2.Open, 
            text = v14, 
            attributes = v16
        });
        table.insert(v13, {
            name = v2.Close, 
            text = v14, 
            attributes = {}
        });
    end
};
return function(v18) --[[ Line: 62 ]] --[[ Name: tokenize ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v5 (copy), v17 (copy)
    local v19 = 0;
    local v20 = 0;
    local v21 = {};
    local v22 = string.gsub(v18, "\n+", " ");
    for v23 in string.gmatch(v22, "()<") do
        if v23 >= v19 then
            v19 = v23;
            local v24 = false;
            for _, v26 in v6 do
                local l_name_0 = v26.name;
                local l_pattern_0 = v26.pattern;
                local v29, v30 = string.find(v22, l_pattern_0, v19);
                if v29 and v30 then
                    local v31 = {
                        string.match(v22, l_pattern_0, v19)
                    };
                    local v32 = v31[1];
                    local v33 = v31[2] or "";
                    if v32 then
                        if v19 ~= v20 then
                            table.insert(v21, {
                                name = v2.Text, 
                                text = v4((string.sub(v22, v20, v19 - 1))), 
                                attributes = {}
                            });
                        end;
                        if v32 == "br" then
                            if l_name_0 == v5.Open or l_name_0 == v5.OpenClose then
                                table.insert(v21, {
                                    name = v2.Break, 
                                    text = "", 
                                    attributes = {}
                                });
                            end;
                        else
                            v17[l_name_0](v21, v32, v33);
                        end;
                        v19 = v19 + (v30 - v29 + 1);
                        v20 = v19;
                        v24 = true;
                        break;
                    end;
                end;
            end;
            if not v24 then
                v19 = v19 + 1;
            end;
        end;
    end;
    v19 = #v22 + 1;
    if v19 ~= v20 then
        table.insert(v21, {
            name = v2.Text, 
            text = v4((string.sub(v22, v20, v19 - 1))), 
            attributes = {}
        });
    end;
    if v21[1] and v21[1].name == v2.Text and v21[1].text == "" then
        table.remove(v21, 1);
    end;
    return v21;
end;