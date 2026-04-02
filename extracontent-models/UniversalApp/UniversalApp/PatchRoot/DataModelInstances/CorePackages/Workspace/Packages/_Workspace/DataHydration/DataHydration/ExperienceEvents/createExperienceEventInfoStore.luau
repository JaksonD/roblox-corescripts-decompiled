local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.ExperienceEventTypes);
local v6 = require(l_script_FirstAncestor_0.createDataResolver);
return function() --[[ Line: 19 ]] --[[ Name: createExperienceEventInfoStore ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy)
    local v7 = v3();
    local v9 = v6({
        cache = v7, 
        supportsMultiGet = false, 
        fetchFn = function(_) --[[ Line: 24 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end
    });
    return {
        getExperienceEventInfo = v9.getCachedItem, 
        getExperienceEventInfos = v9.getCachedItems, 
        updateExperienceEventInfo = v7.updateItem, 
        updateExperienceEventInfos = v7.updateItems, 
        clear = v9.clear, 
        dispose = v9.dispose
    };
end;