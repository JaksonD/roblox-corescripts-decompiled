local l_Parent_0 = script.Parent.Parent;
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
return function(v2) --[[ Line: 9 ]] --[[ Name: createDetachedEffect ]]
    -- upvalues: l_createEffect_0 (copy)
    local v3 = false;
    local v4 = nil;
    local function v5() --[[ Line: 13 ]] --[[ Name: disposeEffect ]]
        -- upvalues: v3 (ref), v4 (ref)
        if not v3 then
            v3 = true;
            if v4 ~= nil then
                v4:Fire();
            end;
        end;
    end;
    local v7 = l_createEffect_0(function(v6) --[[ Line: 22 ]]
        -- upvalues: v2 (copy), v5 (copy)
        v2(v6, v5);
    end);
    if v3 then
        v7();
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v4 = l_BindableEvent_0;
        l_BindableEvent_0.Event:Once(function() --[[ Line: 31 ]]
            -- upvalues: l_BindableEvent_0 (copy), v4 (ref), v7 (copy)
            l_BindableEvent_0:Destroy();
            v4 = nil;
            v7();
        end);
    end;
end;