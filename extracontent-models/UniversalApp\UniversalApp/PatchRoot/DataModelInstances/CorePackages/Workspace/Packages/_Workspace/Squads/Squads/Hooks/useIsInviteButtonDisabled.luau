local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v1.Cryo;
local l_React_0 = v1.React;
return function(v4, v5, v6) --[[ Line: 15 ]]
    -- upvalues: l_React_0 (copy), l_Cryo_0 (copy)
    return l_React_0.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v4 (copy), l_Cryo_0 (ref), v5 (copy)
        if v6 == nil then
            return v4 == 0;
        else
            local v7 = l_Cryo_0.List.toSet(v6);
            if v4 < #v6 then
                return false;
            else
                for v8, _ in v5 do
                    if not v7[tostring(v8)] then
                        return false;
                    end;
                end;
                return true;
            end;
        end;
    end, {
        v4, 
        v5, 
        v6
    });
end;