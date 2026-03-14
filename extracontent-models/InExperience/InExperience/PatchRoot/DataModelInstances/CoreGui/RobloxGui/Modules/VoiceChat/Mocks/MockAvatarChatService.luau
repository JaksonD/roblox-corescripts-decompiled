local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        IsEnabled = v1, 
        EnableVoice = v2, 
        GetPropertyChangedSignal = v3, 
        GetClientFeaturesAsync = v4
    }, v0));
end;
return v0;