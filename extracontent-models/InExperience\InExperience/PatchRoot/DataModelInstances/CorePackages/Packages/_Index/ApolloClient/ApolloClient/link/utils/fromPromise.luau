local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
v0.fromPromise = function(v4) --[[ Line: 21 ]] --[[ Name: fromPromise ]]
    -- upvalues: l_Observable_0 (copy)
    return l_Observable_0.new(function(v5) --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        v4:andThen(function(v6) --[[ Line: 24 ]]
            -- upvalues: v5 (copy)
            v5:next(v6);
            v5:complete();
        end):catch(function(v7) --[[ Line: 28 ]]
            -- upvalues: v5 (copy)
            v5.error(v5, v7);
        end);
    end);
end;
return v0;