return function(v0) --[[ Line: 1 ]] --[[ Name: isWirable ]]
    return (pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local l_v0_0 = v0;
        l_v0_0:GetInputPins();
        l_v0_0:GetOutputPins();
        l_v0_0:GetConnectedWires("Foo");
    end));
end;