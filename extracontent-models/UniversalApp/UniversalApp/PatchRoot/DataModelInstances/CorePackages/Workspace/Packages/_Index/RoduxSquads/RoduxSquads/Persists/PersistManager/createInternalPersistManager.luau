local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local _ = require(l_script_FirstAncestor_0.Persists.PersistStorage.PersistStorage);
return function(v2) --[[ Line: 11 ]]
    local l_storage_0 = v2.storage;
    if not l_storage_0 then
        return nil;
    else
        return {
            update = function(v4) --[[ Line: 18 ]] --[[ Name: update ]]
                -- upvalues: l_storage_0 (copy)
                return l_storage_0:setItem(v4);
            end, 
            get = function() --[[ Line: 22 ]] --[[ Name: get ]]
                -- upvalues: l_storage_0 (copy)
                return l_storage_0:getItem();
            end, 
            bindToStorage = function(v5) --[[ Line: 26 ]] --[[ Name: bindToStorage ]]
                -- upvalues: l_storage_0 (copy)
                return l_storage_0:bindAndFire(v5);
            end
        };
    end;
end;