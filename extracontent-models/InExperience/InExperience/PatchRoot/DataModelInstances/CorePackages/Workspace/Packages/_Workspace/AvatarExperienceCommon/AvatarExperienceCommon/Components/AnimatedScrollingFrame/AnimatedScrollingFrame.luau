local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useAXAnimateScrollFrame);
return v1.forwardRef(function(v3, v4) --[[ Line: 8 ]] --[[ Name: AnimatedScrollingFrame ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.useRef(nil);
    v2(v5);
    local v7 = v1.useCallback(function(v6) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.current = v6;
        if typeof(v4) == "table" then
            v4.current = v6;
            return;
        else
            if typeof(v4) == "function" then
                v4(v6);
            end;
            return;
        end;
    end, {
        v4
    });
    local v8 = table.clone(v3);
    v8.children = nil;
    v8.ref = v7;
    return v1.createElement("ScrollingFrame", v8, v3.children);
end);