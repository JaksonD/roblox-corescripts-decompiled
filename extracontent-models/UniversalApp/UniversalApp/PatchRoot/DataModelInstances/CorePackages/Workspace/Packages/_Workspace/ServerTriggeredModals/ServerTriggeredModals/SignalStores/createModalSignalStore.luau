local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.ServerDrivenUi);
local _ = require(l_script_FirstAncestor_0.EntryPoint);
return function() --[[ Line: 33 ]]
    -- upvalues: v2 (copy)
    local v5 = {};
    local function v12(v6) --[[ Line: 36 ]] --[[ Name: getOrCreateEntry ]]
        -- upvalues: v5 (copy), v2 (ref)
        local v7 = v5[v6];
        if v7 == nil then
            local v8, v9 = v2.createSignal(nil);
            local v10, v11 = v2.createSignal(false);
            v7 = {
                metadata = {
                    get = v8, 
                    set = v9
                }, 
                hasShown = {
                    get = v10, 
                    set = v11
                }
            };
            v5[v6] = v7;
        end;
        return v7;
    end;
    return {
        getMetadataGetter = function(v13) --[[ Line: 56 ]] --[[ Name: getMetadataGetter ]]
            -- upvalues: v12 (copy)
            return v12(v13).metadata.get;
        end, 
        setMetadata = function(v14, v15) --[[ Line: 60 ]] --[[ Name: setMetadata ]]
            -- upvalues: v12 (copy)
            v12(v14).metadata.set(v15);
        end, 
        getHasShownGetter = function(v16) --[[ Line: 64 ]] --[[ Name: getHasShownGetter ]]
            -- upvalues: v12 (copy)
            return v12(v16).hasShown.get;
        end, 
        setHasShown = function(v17, v18) --[[ Line: 68 ]] --[[ Name: setHasShown ]]
            -- upvalues: v12 (copy)
            v12(v17).hasShown.set(v18);
        end
    };
end;