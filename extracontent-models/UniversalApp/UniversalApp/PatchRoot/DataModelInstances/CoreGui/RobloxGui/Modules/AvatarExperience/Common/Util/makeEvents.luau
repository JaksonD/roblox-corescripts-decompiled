return function(v0) --[[ Line: 3 ]] --[[ Name: makeEvents ]]
    local v1 = {};
    local v2 = {};
    local v3 = {};
    for _, v5 in v0 do
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v1[v5] = l_BindableEvent_0.Event;
        v2[v5] = function(...) --[[ Line: 11 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire(...);
        end;
        v3[v5] = function() --[[ Line: 14 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Destroy();
        end;
    end;
    return v1, v2, v3;
end;