local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(script.Parent.dependencyArray);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v5, v6) --[[ Line: 18 ]] --[[ Name: useSignal ]]
    -- upvalues: v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), v3 (copy)
    v1.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy), v6 (copy)
        if not v5 then
            return;
        else
            assert(v5 ~= nil, "signal is not nil");
            local v7 = v5:connect(v6);
            return function() --[[ Line: 27 ]]
                -- upvalues: v7 (copy)
                v7:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v5, 
        v6
    } else v3(v5, v6));
end;