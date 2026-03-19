local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local v1 = require(l_script_FirstAncestor_0.Enums.ViewType);
local v2 = game:DefineFastInt("MobileBreakpointInspectAndBuy", 850);
return function(v3) --[[ Line: 13 ]] --[[ Name: getViewType ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Wide_0 = v1.Wide;
    if v3.X > v3.Y and v3.X < v2 then
        return v1.WideLandscape;
    else
        if v3.X < v2 then
            l_Wide_0 = v1.Compact;
        end;
        return l_Wide_0;
    end;
end;