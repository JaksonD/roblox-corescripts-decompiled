local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local l_useEffect_0 = require(l_script_FirstAncestor_0.Parent.React).useEffect;
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: useTimedLoop ]]
    -- upvalues: l_useEffect_0 (copy)
    l_useEffect_0(function() --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v3 (copy)
        local v4 = true;
        task.spawn(function() --[[ Line: 11 ]]
            -- upvalues: v4 (ref), v2 (ref), v3 (ref)
            while v4 do
                task.wait(v2);
                if v4 then
                    v3();
                else
                    break;
                end;
            end;
        end);
        return function() --[[ Line: 23 ]]
            -- upvalues: v4 (ref)
            v4 = false;
        end;
    end, {
        v2, 
        v3
    });
end;