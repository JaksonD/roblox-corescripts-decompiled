local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Milestones.constants);
local _ = require(l_script_FirstAncestor_0.Milestones.types);
return function(v5) --[[ Line: 25 ]] --[[ Name: createUseTTIRenderAndMountedTracking ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 26 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref)
        local v7 = v2.useRef(false);
        if not v7.current then
            v7.current = true;
            v5(v6, v3.RenderStarted);
        end;
        v2.useEffect(function() --[[ Line: 34 ]]
            -- upvalues: v5 (ref), v6 (copy), v3 (ref)
            v5(v6, v3.SurfaceMounted);
        end, {});
    end;
end;