local l_Parent_0 = script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PhotoboothContext);
local v3 = require(script.Parent.Parent.Stores.createPhotoboothStore);
local v4 = require(script.Parent.Parent.PhotoboothStoreBridge);
return function(v5) --[[ Line: 18 ]] --[[ Name: PhotoboothContextProvider ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v2 (copy)
    local v6 = v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v3 (ref)
        return v3();
    end, {});
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v4 (ref), v6 (copy)
        v4.setStore(v6);
        return function() --[[ Line: 27 ]]
            -- upvalues: v4 (ref)
            v4.clearStore();
        end;
    end, {
        v6
    });
    local v7 = v1.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy)
        return {
            photoboothStore = v6
        };
    end, {
        v6
    });
    return v1.createElement(v2.Provider, {
        value = v7
    }, v5.children);
end;