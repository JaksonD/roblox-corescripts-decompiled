local l_Parent_0 = script:FindFirstAncestor("Utils").Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(script.Utility);
local v3 = require(script.Theme);
local v4 = require(script.Theme.defaultTokenColors);
local v5 = {
    defaultLexer = require(script.Lexer)
};
v5.highlight = function(v6, v7) --[[ Line: 14 ]] --[[ Name: highlight ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), v5 (copy)
    if v7 then
        v3.setColors(v7);
    else
        v3.setColors(v4);
    end;
    v6 = v2.convertTabsToSpaces(v2.removeControlChars(v6));
    local l_defaultLexer_0 = v5.defaultLexer;
    local v9 = v3.getColor("iden");
    local v10 = "";
    for v11, v12 in l_defaultLexer_0.scan(v6) do
        local v13 = v3.getColor(v11) or v9;
        v10 = v10 .. v3.getColoredRichText(v13, v2.sanitizeRichText(v12));
    end;
    return v10;
end;
v5.getTokenColor = function(v14) --[[ Line: 35 ]] --[[ Name: getTokenColor ]]
    -- upvalues: v3 (copy)
    return v3.getColor(v14);
end;
return v5;