local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
return function(v5) --[[ Line: 9 ]] --[[ Name: useScrollingFrameStore ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    local v6 = v3.useSignalState(v4);
    local v7 = v2.useRef(false);
    if not v7.current and v5 then
        v6.setScrollingFrame(v5);
        v7.current = true;
    end;
    v2.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v6 (copy)
        return function() --[[ Line: 19 ]]
            -- upvalues: v6 (ref)
            v6.cleanUp();
        end;
    end, {
        v6
    });
    return v6;
end;