local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local _ = require(l_Parent_1.App.Style.StyleTypes);
local v3 = require(l_Parent_0.Enum.IconSize);
local v4 = {
    [v3.Small] = 16, 
    [v3.Medium] = 36, 
    [v3.Large] = 48, 
    [v3.XLarge] = 96, 
    [v3.XXLarge] = 192
};
return function(v5, v6) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v4 (copy)
    assert(v3.isEnumValue(v5));
    if v6 ~= nil and v6.Tokens ~= nil then
        if v5 == v3.Small then
            return v6.Tokens.Semantic.Icon.Size.Small;
        elseif v5 == v3.Medium then
            return v6.Tokens.Semantic.Icon.Size.Medium;
        elseif v5 == v3.Large then
            return v6.Tokens.Semantic.Icon.Size.Large;
        elseif v5 == v3.XLarge then
            return v6.Tokens.Semantic.Icon.Size.XLarge;
        elseif v5 == v3.XXLarge then
            return v6.Tokens.Semantic.Icon.Size.XxLarge;
        else
            return nil;
        end;
    else
        return v4[v5];
    end;
end;