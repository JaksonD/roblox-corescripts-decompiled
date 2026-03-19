local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_useEffect_0 = require(l_script_FirstAncestor_0.Parent.React).useEffect;
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: useTimer ]]
    -- upvalues: l_useEffect_0 (copy), v1 (copy)
    l_useEffect_0(function() --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v4 (copy)
        local v6 = true;
        task.spawn(function() --[[ Line: 12 ]]
            -- upvalues: v6 (ref), v3 (ref), v4 (ref)
            while v6 do
                task.wait(v3);
                if v6 then
                    v4();
                else
                    break;
                end;
            end;
        end);
        return function() --[[ Line: 24 ]]
            -- upvalues: v6 (ref)
            v6 = false;
        end;
    end, v1.Dictionary.join({
        v3, 
        v4
    }, v5 or {}));
end;