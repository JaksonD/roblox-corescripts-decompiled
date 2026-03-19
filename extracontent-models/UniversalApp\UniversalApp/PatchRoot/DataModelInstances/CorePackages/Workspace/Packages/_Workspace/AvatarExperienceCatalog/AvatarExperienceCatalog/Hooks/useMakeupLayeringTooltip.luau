local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useMakeupFtux);
local v3 = game:DefineFastInt("AXMakeupLayeringTooltipShowDelayMS", 500);
local v4 = game:DefineFastInt("AXMakeupLayeringTooltipDismissTimeoutSeconds", 5);
return function(v5) --[[ Line: 11 ]] --[[ Name: useMakeupLayeringTooltip ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy)
    local v6 = v2();
    local v7, v8 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v6 (copy), v8 (copy), v3 (ref)
        if not v5 or not v6.shouldShowMakeupLayeringTooltip() then
            v8(false);
            return;
        else
            local v9 = task.delay(v3 / 1000, function() --[[ Line: 21 ]]
                -- upvalues: v8 (ref), v6 (ref)
                v8(true);
                v6.markMakeupLayeringTooltipSeen();
            end);
            return function() --[[ Line: 26 ]]
                -- upvalues: v9 (copy)
                if v9 then
                    task.cancel(v9);
                end;
            end;
        end;
    end, {
        v5
    });
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy), v4 (ref), v8 (copy)
        if not v7 then
            return;
        else
            local v10 = task.delay(v4, function() --[[ Line: 38 ]]
                -- upvalues: v8 (ref)
                v8(false);
            end);
            return function() --[[ Line: 42 ]]
                -- upvalues: v10 (copy)
                if v10 then
                    task.cancel(v10);
                end;
            end;
        end;
    end, {
        v7
    });
    local v11 = v1.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v8 (copy)
        v8(false);
    end, {});
    return {
        showTooltip = v7, 
        dismissTooltip = v11
    };
end;