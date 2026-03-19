local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_createInternalPersistManager_0 = require(l_script_FirstAncestor_0.Persists.PersistManager).createInternalPersistManager;
local l_createPersistManager_0 = require(l_script_FirstAncestor_0.Persists.PersistManager).createPersistManager;
local l_createPause_0 = require(l_script_FirstAncestor_0.Persists.Actions).createPause;
local l_createPersistAndUpdateState_0 = require(l_script_FirstAncestor_0.Persists.Actions).createPersistAndUpdateState;
local v7 = {
    isPaused = false
};
return function(v8, v9) --[[ Line: 13 ]]
    -- upvalues: l_createPause_0 (copy), l_createPersistAndUpdateState_0 (copy), l_createInternalPersistManager_0 (copy), l_createPersistManager_0 (copy), v7 (copy), v2 (copy)
    local v10 = false;
    local v11 = l_createPause_0(v8);
    local v12 = l_createPersistAndUpdateState_0(v8);
    local v13 = l_createInternalPersistManager_0(v8);
    local v14 = l_createPersistManager_0(v8, v13);
    local l_isPaused_0 = v7.isPaused;
    local v16 = nil;
    local v17 = nil;
    if v13 then
        v17 = v13.bindToStorage(function(v18) --[[ Line: 27 ]]
            -- upvalues: v16 (ref)
            v16 = v18;
        end);
        v16 = v13.get();
    end;
    return function(v19, v20) --[[ Line: 33 ]]
        -- upvalues: v13 (copy), v10 (ref), v16 (ref), v12 (copy), l_isPaused_0 (ref), v9 (copy)
        if v13 and not v10 then
            v19 = v16 or v19;
        end;
        v10 = true;
        local l_v19_0 = v19;
        if v12.name == v20.type then
            return v16;
        else
            if not l_isPaused_0 then
                l_v19_0 = v9(v19, v20);
                if v13 and l_v19_0 ~= v19 then
                    v13.update(l_v19_0);
                end;
            end;
            return l_v19_0;
        end;
    end, v2.createReducer(v7, {
        [v12.name] = function(_, _) --[[ Line: 55 ]]
            -- upvalues: l_isPaused_0 (ref)
            l_isPaused_0 = false;
            return {
                isPaused = l_isPaused_0
            };
        end, 
        [v11.name] = function(_, _) --[[ Line: 59 ]]
            -- upvalues: l_isPaused_0 (ref)
            l_isPaused_0 = true;
            return {
                isPaused = l_isPaused_0
            };
        end
    }), v14;
end;