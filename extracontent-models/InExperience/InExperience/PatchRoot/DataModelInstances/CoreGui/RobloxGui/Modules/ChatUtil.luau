return {
    Signal = function() --[[ Line: 4 ]] --[[ Name: Signal ]]
        local v0 = {};
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v2 = nil;
        local v3 = nil;
        v0.fire = function(_, ...) --[[ Line: 12 ]] --[[ Name: fire ]]
            -- upvalues: v2 (ref), v3 (ref), l_BindableEvent_0 (copy)
            v2 = {
                ...
            };
            v3 = select("#", ...);
            l_BindableEvent_0:Fire();
        end;
        v0.connect = function(_, v6) --[[ Line: 18 ]] --[[ Name: connect ]]
            -- upvalues: l_BindableEvent_0 (copy), v2 (ref), v3 (ref)
            if not v6 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_0.Event:connect(function() --[[ Line: 20 ]]
                -- upvalues: v6 (copy), v2 (ref), v3 (ref)
                v6(unpack(v2, 1, v3));
            end);
        end;
        v0.wait = function(_) --[[ Line: 25 ]] --[[ Name: wait ]]
            -- upvalues: l_BindableEvent_0 (copy), v2 (ref), v3 (ref)
            l_BindableEvent_0.Event:wait();
            assert(v2, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
            return unpack(v2, 1, v3);
        end;
        return v0;
    end
};