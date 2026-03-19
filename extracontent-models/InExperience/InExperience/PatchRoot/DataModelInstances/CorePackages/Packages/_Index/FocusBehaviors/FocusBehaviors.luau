local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.composeFocusBehaviors);
local function v4(v3) --[[ Line: 8 ]] --[[ Name: defaultDescendantBehavior ]]
    return {
        getTargets = function() --[[ Line: 10 ]] --[[ Name: getTargets ]]
            -- upvalues: v3 (copy)
            if v3 then
                return {
                    v3
                };
            else
                return {};
            end;
        end
    };
end;
local function v7() --[[ Line: 16 ]] --[[ Name: mostRecentDescendantBehavior ]]
    local v5 = nil;
    return {
        onDescendantFocusChanged = function(v6) --[[ Line: 20 ]] --[[ Name: onDescendantFocusChanged ]]
            -- upvalues: v5 (ref)
            v5 = v6 or v5;
        end, 
        getTargets = function() --[[ Line: 23 ]] --[[ Name: getTargets ]]
            -- upvalues: v5 (ref)
            if v5 then
                return {
                    v5
                };
            else
                return {};
            end;
        end
    };
end;
return {
    default = v4, 
    mostRecent = v7, 
    mostRecentOrDefault = function(v8) --[[ Line: 29 ]] --[[ Name: mostRecentDescendantOrDefaultBehavior ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2(v7(), {
            getTargets = function() --[[ Line: 10 ]] --[[ Name: getTargets ]]
                -- upvalues: v8 (copy)
                if v8 then
                    return {
                        v8
                    };
                else
                    return {};
                end;
            end
        });
    end, 
    composeFocusBehaviors = v2
};