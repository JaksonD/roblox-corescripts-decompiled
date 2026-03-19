local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Common.TextKeys);
local v2 = require(l_Parent_0.Common.Types);
local v3 = {
    [v2.DefaultError] = {
        toastTitle = v1.DefaultErrorTitle, 
        toastSubtitle = v1.DefaultErrorSubtitle
    }
};
return function(v4, v5) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4 == v2.Custom and v5 then
        return v5;
    else
        return v3[v4];
    end;
end;