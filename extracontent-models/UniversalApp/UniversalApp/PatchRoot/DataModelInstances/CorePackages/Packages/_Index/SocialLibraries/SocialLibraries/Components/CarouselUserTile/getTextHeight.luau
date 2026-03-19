local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Text_0 = require(l_script_FirstAncestor_0.dependencies).Text;
local _ = require(script.Parent.StyleTypes);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_Text_0 (copy)
    return l_Text_0.GetTextHeight(v3, v4, v5);
end;