local v0 = require(script.Parent.DispatchBindableEvent);
return function(v1) --[[ Line: 3 ]] --[[ Name: createDispatchBindableEvent ]]
    -- upvalues: v0 (copy)
    v0.Event:Connect(function(v2) --[[ Line: 4 ]]
        -- upvalues: v1 (copy)
        v1:dispatch(v2);
    end);
    v0:SetAttribute("isConnected", true);
    return v0;
end;