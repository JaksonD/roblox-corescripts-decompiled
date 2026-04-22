local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.UIBlox);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: generateRichSystemMessageTextFormat ]]
    -- upvalues: v1 (copy)
    return string.format("<font color=\"#%s\">%s</font>", if v3 then v1.App.Style.Colors.Red:ToHex() else v1.App.Style.Colors.LightGrey:ToHex(), v2);
end;