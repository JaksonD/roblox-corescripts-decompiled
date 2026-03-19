local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(script.Parent.dependencyArray);
return function(v4, v5) --[[ Line: 16 ]] --[[ Name: useSignal ]]
    -- upvalues: v1 (copy), v3 (copy)
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if not v4 then
            return;
        else
            assert(v4 ~= nil, "signal is not nil");
            local v6 = v4:connect(v5);
            return function() --[[ Line: 24 ]]
                -- upvalues: v6 (copy)
                v6:disconnect();
            end;
        end;
    end, v3(v4, v5));
end;