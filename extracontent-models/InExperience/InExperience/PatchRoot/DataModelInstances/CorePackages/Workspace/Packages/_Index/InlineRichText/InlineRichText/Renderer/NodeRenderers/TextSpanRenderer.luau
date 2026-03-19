local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_TextElement_0 = require(l_Parent_0.InlineLayout).Components.InlineLayoutElements.TextElement;
local _ = require(l_script_FirstAncestor_0.Types);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_TextElement_0 (copy)
    local v7 = v6.processChildren(v5, v6);
    return v2.List.map(v7, function(v8, v9) --[[ Line: 12 ]]
        -- upvalues: l_TextElement_0 (ref), v6 (copy)
        return l_TextElement_0.new({
            LayoutOrder = v9, 
            EngineTags = v8.engineTags, 
            Text = v8.text, 
            fontStyle = v6.styles.fontStyle, 
            textStyle = v6.styles.textStyle
        });
    end);
end;