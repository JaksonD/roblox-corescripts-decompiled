local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
v0.useAfterFastRefresh = function(v5) --[[ Line: 16 ]] --[[ Name: useAfterFastRefresh ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy)
    if _G.__DEV__ then
        local v6 = l_useRef_0(false);
        l_useEffect_0(function() --[[ Line: 19 ]]
            -- upvalues: v6 (copy)
            return function() --[[ Line: 20 ]]
                -- upvalues: v6 (ref)
                v6.current = true;
            end;
        end, {});
        l_useEffect_0(function() --[[ Line: 24 ]]
            -- upvalues: v6 (copy), v5 (copy)
            if v6.current == true then
                v6.current = false;
                v5();
            end;
        end, {});
    end;
end;
return v0;