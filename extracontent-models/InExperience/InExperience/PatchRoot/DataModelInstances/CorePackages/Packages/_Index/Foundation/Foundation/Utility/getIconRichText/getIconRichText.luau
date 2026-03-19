local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.BuilderIcons);
local l_Font_0 = v1.Font;
local l_IconVariant_0 = v1.IconVariant;
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: getIconRichText ]]
    -- upvalues: l_IconVariant_0 (copy), l_Font_0 (copy)
    local v6 = l_Font_0[v5 or l_IconVariant_0.Regular];
    return (("<font family=\"%*\" weight=\"%*\">%*</font>"):format(v6.Family, v6.Weight.Value, v4));
end;