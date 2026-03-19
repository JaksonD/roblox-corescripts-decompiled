local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = require(l_Parent_0.Otter);
local l_useAnimatedBinding_0 = v2.useAnimatedBinding;
local v5 = {
    easeIn = 1, 
    easeOut = 10
};
local v6 = {
    easeOut = 1, 
    easeIn = 0
};
local v7 = {
    frequency = 10, 
    dampingRatio = 1
};
return function(v8) --[[ Line: 53 ]] --[[ Name: usePulseAnimationBinding ]]
    -- upvalues: v1 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), l_useAnimatedBinding_0 (copy)
    local v9 = v1.useRef(nil);
    local v11 = v1.useCallback(function(v10) --[[ Line: 56 ]]
        -- upvalues: v9 (copy), v8 (copy), v5 (ref), v3 (ref), v6 (ref), v7 (ref)
        if v9.current and v8 then
            if v10.thickness == v5.easeOut then
                v9.current({
                    thickness = v3.instant(v5.easeIn), 
                    transparency = v3.instant(v6.easeIn)
                });
                return;
            elseif v10.thickness == v5.easeIn then
                v9.current({
                    thickness = v3.ease(v5.easeOut, v7), 
                    transparency = v3.ease(v6.easeOut, v7)
                });
            end;
        end;
    end, {
        v8
    });
    local v12, v13 = l_useAnimatedBinding_0({
        thickness = 0, 
        transparency = 0
    }, v11);
    v1.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v8 (copy), v9 (copy), v13 (copy), v3 (ref), v5 (ref), v7 (ref), v6 (ref)
        if v8 then
            if not v9.current then
                v9.current = v13;
            end;
            v13({
                thickness = v3.ease(v5.easeOut, v7), 
                transparency = v3.ease(v6.easeOut, v7)
            });
        end;
        return function() --[[ Line: 87 ]]
            -- upvalues: v13 (ref), v3 (ref)
            v13({
                thickness = v3.instant(0), 
                transparency = v3.instant(0)
            });
        end;
    end, {
        v8
    });
    return v12;
end;