local l_Parent_0 = script:FindFirstAncestor("Utils").Parent;
local v1 = require(script.defaultTokenColors);
local _ = require(l_Parent_0.Types);
local v3 = {
    tokenColors = {}, 
    defaultColors = v1
};
v3.setColors = function(v4) --[[ Line: 11 ]] --[[ Name: setColors ]]
    -- upvalues: v3 (copy)
    assert(type(v4) == "table", "Theme.updateColors expects a table");
    for v5, v6 in v4 do
        v3.tokenColors[v5] = v6;
    end;
end;
v3.getColoredRichText = function(v7, v8) --[[ Line: 19 ]] --[[ Name: getColoredRichText ]]
    return "<font color=\"#" .. v7:ToHex() .. "\">" .. v8 .. "</font>";
end;
v3.getColor = function(v9) --[[ Line: 23 ]] --[[ Name: getColor ]]
    -- upvalues: v3 (copy)
    return v3.tokenColors[v9];
end;
v3.setColors(v1);
return v3;