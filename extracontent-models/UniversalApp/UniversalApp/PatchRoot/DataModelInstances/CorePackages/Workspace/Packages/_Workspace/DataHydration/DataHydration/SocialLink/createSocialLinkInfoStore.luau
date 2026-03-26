local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.SocialLinkInfoStoreTypes);
local v6 = require(l_script_FirstAncestor_0.createDataResolver);
return function() --[[ Line: 10 ]] --[[ Name: createSocialLinkInfoStore ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy)
    local v7 = v3();
    local v9 = v6({
        cache = v7, 
        fetchFn = function(_) --[[ Line: 14 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end
    });
    return {
        getSocialLinkInfo = v9.getCachedItem, 
        getSocialLinkInfos = v9.getCachedItems, 
        updateSocialLinkInfo = v7.updateItem, 
        updateSocialLinkInfos = v7.updateItems, 
        clear = v7.clear, 
        dispose = v7.dispose
    };
end;