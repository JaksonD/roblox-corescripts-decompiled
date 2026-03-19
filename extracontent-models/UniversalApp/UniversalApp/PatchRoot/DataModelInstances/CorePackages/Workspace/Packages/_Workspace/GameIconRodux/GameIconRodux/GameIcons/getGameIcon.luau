local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local v1 = require(l_script_FirstAncestor_0.GameIcons.GameIconReducer);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = v2[v1.key][v3];
    if v4 then
        return v4.url;
    else
        return "";
    end;
end;