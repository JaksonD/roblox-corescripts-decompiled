local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = {
    frequency = 3, 
    dampingRatio = 1
};
return function() --[[ Line: 18 ]] --[[ Name: useImageLoadFade ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v4, v5 = v1.useState(true);
    local v6, v7 = v2.useAnimatedBinding(0, function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy)
        v5(false);
    end);
    return {
        onLoaded = v1.useCallback(function(v8) --[[ Line: 25 ]]
            -- upvalues: v7 (copy), v2 (ref), v3 (ref)
            if v8 == Enum.AssetFetchStatus.Success then
                v7((v2.spring(1, v3)));
            end;
        end, {}), 
        skeletonVisible = v4, 
        overlayTransparency = v6
    };
end;