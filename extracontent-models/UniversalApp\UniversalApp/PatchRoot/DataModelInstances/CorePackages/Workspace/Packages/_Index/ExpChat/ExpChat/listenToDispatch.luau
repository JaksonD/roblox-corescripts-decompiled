return function(v0) --[[ Line: 1 ]]
    return function(v1) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        v0.Event:Connect(v1);
    end;
end;