local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AppCard);
return function(v3) --[[ Line: 13 ]] --[[ Name: AppStackCard ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        v3.onAnimationComplete();
    end, {
        v3.onAnimationComplete
    });
    return v1.createElement(v2, {
        isActive = v3.isActive, 
        descriptor = v3.descriptor, 
        screenProps = v3.screenProps, 
        isVisible = v3.isVisible, 
        ZIndex = v3.ZIndex
    });
end;