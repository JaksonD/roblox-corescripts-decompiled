local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {};
    setmetatable(v1, v0);
    v1.StoppedBindableEvent = Instance.new("BindableEvent");
    v1.EndedBindableEvent = Instance.new("BindableEvent");
    v1.DidLoopBindableEvent = Instance.new("BindableEvent");
    v1.Stopped = v1.StoppedBindableEvent.Event;
    v1.Ended = v1.EndedBindableEvent.Event;
    v1.DidLoop = v1.DidLoopBindableEvent.Event;
    v1.IsPlaying = false;
    return v1;
end;
v0.Play = function(v2, _) --[[ Line: 55 ]] --[[ Name: Play ]]
    v2.IsPlaying = true;
    task.spawn(function() --[[ Line: 57 ]]
        -- upvalues: v2 (copy)
        task.wait(1);
        if v2.IsPlaying then
            v2.IsPlaying = false;
            v2.StoppedBindableEvent:Fire();
            task.wait(0.2);
            v2.EndedBindableEvent:Fire();
        end;
    end);
end;
v0.Stop = function(v4, _) --[[ Line: 68 ]] --[[ Name: Stop ]]
    if v4.IsPlaying then
        task.spawn(function() --[[ Line: 70 ]]
            -- upvalues: v4 (copy)
            v4.IsPlaying = false;
            v4.StoppedBindableEvent:Fire();
            task.wait(0.2);
            v4.EndedBindableEvent:Fire();
        end);
    end;
end;
v0.Destroy = function(_) --[[ Line: 79 ]] --[[ Name: Destroy ]]

end;
return v0;