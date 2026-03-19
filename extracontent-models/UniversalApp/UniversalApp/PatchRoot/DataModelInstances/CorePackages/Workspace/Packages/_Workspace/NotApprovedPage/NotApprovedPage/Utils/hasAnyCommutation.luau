local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v2) --[[ Line: 10 ]] --[[ Name: hasAnyCommutation ]]
    if not v2 then
        return false;
    else
        for _, v4 in v2 do
            if v4 == true then
                return true;
            end;
        end;
        return false;
    end;
end;