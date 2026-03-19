return {
    CreateSignal = function() --[[ Line: 2 ]] --[[ Name: CreateSignal ]]
        local v0 = {};
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v2 = nil;
        local v3 = nil;
        v0.fire = function(_, ...) --[[ Line: 10 ]] --[[ Name: fire ]]
            -- upvalues: v2 (ref), v3 (ref), l_BindableEvent_0 (copy)
            v2 = {
                ...
            };
            v3 = select("#", ...);
            l_BindableEvent_0:Fire();
        end;
        v0.connect = function(_, v6) --[[ Line: 16 ]] --[[ Name: connect ]]
            -- upvalues: l_BindableEvent_0 (copy), v2 (ref), v3 (ref)
            if not v6 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_0.Event:Connect(function() --[[ Line: 20 ]]
                -- upvalues: v6 (copy), v2 (ref), v3 (ref)
                v6(unpack(v2, 1, v3));
            end);
        end;
        return v0;
    end
};