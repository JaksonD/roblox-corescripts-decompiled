local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local _ = require(l_script_FirstAncestor_0.Persists.PersistManager.createInternalPersistManager);
local l_createPause_0 = require(l_script_FirstAncestor_0.Persists.Actions).createPause;
local l_createPersistAndUpdateState_0 = require(l_script_FirstAncestor_0.Persists.Actions).createPersistAndUpdateState;
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: l_createPersistAndUpdateState_0 (copy), l_createPause_0 (copy)
    if not v5 then
        return nil;
    else
        return {
            reset = function() --[[ Line: 21 ]] --[[ Name: reset ]]
                -- upvalues: v5 (copy)
                v5.update(nil);
            end, 
            persistAndUpdateState = function(v6) --[[ Line: 25 ]] --[[ Name: persistAndUpdateState ]]
                -- upvalues: l_createPersistAndUpdateState_0 (ref), v4 (copy)
                local v7 = l_createPersistAndUpdateState_0(v4);
                if v7 then
                    v6(v7());
                end;
            end, 
            pause = function(v8) --[[ Line: 32 ]] --[[ Name: pause ]]
                -- upvalues: l_createPause_0 (ref), v4 (copy)
                local v9 = l_createPause_0(v4);
                if v9 then
                    v8(v9());
                end;
            end
        };
    end;
end;