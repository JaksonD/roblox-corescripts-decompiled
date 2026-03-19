local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local l_Element_0 = require(l_script_FirstAncestor_0.Dev.Rhodium).Element;
local v2 = require(script.Parent.findFirstInstance);
return function(v3, v4) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_Element_0 (copy)
    local v5 = v2(v3, v4);
    if v5 then
        return l_Element_0.new("game." .. v5:GetFullName());
    else
        return nil;
    end;
end;