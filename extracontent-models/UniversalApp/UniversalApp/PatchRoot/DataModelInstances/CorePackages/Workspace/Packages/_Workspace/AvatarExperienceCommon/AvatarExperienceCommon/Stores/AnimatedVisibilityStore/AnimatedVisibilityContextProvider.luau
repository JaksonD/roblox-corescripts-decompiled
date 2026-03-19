local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.createAnimatedVisibilityStore);
local v3 = require(script.Parent.AnimatedVisibilityContext);
return function(v4) --[[ Line: 14 ]] --[[ Name: AnimatedVisibilityProvider ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5 = v1.useMemo(function() --[[ Line: 15 ]]
        -- upvalues: v2 (ref), v4 (copy)
        return v2(v4.initialRatio);
    end, {});
    v1.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: v5 (copy)
        return function() --[[ Line: 20 ]]
            -- upvalues: v5 (ref)
            v5.destroy();
        end;
    end, {
        v5
    });
    return v1.createElement(v3.Provider, {
        value = {
            animatedMenusStore = v5
        }
    }, v4.children);
end;