local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {};
    setmetatable(v1, v0);
    v1.StoppedBindableEvent = Instance.new("BindableEvent");
    v1.Stopped = v1.StoppedBindableEvent.Event;
    v1.WeightCurrent = 1;
    v1.IsPlaying = false;
    return v1;
end;
v0.Play = function(v2, _) --[[ Line: 46 ]] --[[ Name: Play ]]
    v2.IsPlaying = true;
end;
v0.Stop = function(v4, _) --[[ Line: 50 ]] --[[ Name: Stop ]]
    if v4.IsPlaying then
        v4.IsPlaying = false;
        v4.StoppedBindableEvent:Fire();
    end;
end;
v0.AdjustWeight = function(v6, v7) --[[ Line: 57 ]] --[[ Name: AdjustWeight ]]
    v6.WeightCurrent = v7;
end;
v0.Destroy = function(_) --[[ Line: 61 ]] --[[ Name: Destroy ]]

end;
return v0;