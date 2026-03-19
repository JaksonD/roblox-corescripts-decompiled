local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.AnimationConstants);
return function(v4) --[[ Line: 15 ]] --[[ Name: useSubcategoryPillAnimation ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5, v6 = v2.useState({});
    local v7 = v2.useRef(nil);
    local v8, v9 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v7 (copy)
        return function() --[[ Line: 23 ]]
            -- upvalues: v7 (ref)
            if v7.current then
                task.cancel(v7.current);
            end;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v4 (copy), v7 (copy), v6 (copy), v9 (copy), v3 (ref)
        local v10 = if v4 and v4.Subcategories then v4.Subcategories else {};
        if v7.current then
            task.cancel(v7.current);
        end;
        if next(v10) then
            v6(v10);
            v9(false);
        else
            v9(true);
        end;
        v7.current = task.delay(v3.FIntAXSubcategoryPillFadeAnimationDurationMs / 1000, function() --[[ Line: 54 ]]
            -- upvalues: v10 (copy), v6 (ref), v9 (ref), v7 (ref)
            if not next(v10) then
                v6({});
            end;
            v9(false);
            v7.current = nil;
        end);
    end, {
        v4
    });
    return {
        subcategoriesState = v5, 
        isFadingOut = v8
    };
end;