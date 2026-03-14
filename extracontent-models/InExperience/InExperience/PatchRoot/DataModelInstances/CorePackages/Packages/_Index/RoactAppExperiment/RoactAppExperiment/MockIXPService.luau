local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = {
        _browserTrackerLoadingStatus = Enum.IXPLoadingStatus.Initialized, 
        _userLoadingStatus = v3 and Enum.IXPLoadingStatus.Initialized or Enum.IXPLoadingStatus.None, 
        _userId = v5 or 0, 
        _browserTrackerLayerData = v1, 
        _userLayerData = v2, 
        _initializeDelay = v4 or 0.1, 
        _exposureEventsFired = {}, 
        _browserTrackerBindableEvent = Instance.new("BindableEvent")
    };
    v6.OnBrowserTrackerLayerLoadingStatusChanged = v6._browserTrackerBindableEvent.Event;
    v6._userBindableEvent = Instance.new("BindableEvent");
    v6.OnUserLayerLoadingStatusChanged = v6._userBindableEvent.Event;
    setmetatable(v6, v0);
    return v6;
end;
v0._SetBrowserTrackerIXPLoadingStatus = function(v7, v8) --[[ Line: 32 ]] --[[ Name: _SetBrowserTrackerIXPLoadingStatus ]]
    if v7._browserTrackerLoadingStatus ~= v8 then
        v7._browserTrackerLoadingStatus = v8;
        v7._browserTrackerBindableEvent:Fire(v8);
    end;
end;
v0._SetUserIXPLoadingStatus = function(v9, v10, v11) --[[ Line: 39 ]] --[[ Name: _SetUserIXPLoadingStatus ]]
    if v9._userLoadingStatus ~= v10 or v9._userId ~= v11 then
        v9._userLoadingStatus = v10;
        v9._userId = v11;
        v9._userBindableEvent:Fire(v9._userLoadingStatus, v9._userId);
    end;
end;
v0.RegisterUserLayers = function(_, _) --[[ Line: 47 ]] --[[ Name: RegisterUserLayers ]]

end;
v0.InitializeUserLayers = function(v14, v15) --[[ Line: 49 ]] --[[ Name: InitializeUserLayers ]]
    if v14._userLoadingStatus ~= Enum.IXPLoadingStatus.Initialized or v14._userId ~= 0 and v15 ~= v14._userId then
        v14:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Pending, v15);
        spawn(function() --[[ Line: 56 ]]
            -- upvalues: v14 (copy), v15 (copy)
            wait(v14._initializeDelay);
            v14:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Initialized, v15);
        end);
    end;
end;
v0.GetBrowserTrackerLayerVariables = function(v16, v17) --[[ Line: 63 ]] --[[ Name: GetBrowserTrackerLayerVariables ]]
    if v16._browserTrackerLoadingStatus == Enum.IXPLoadingStatus.Initialized then
        return v16._browserTrackerLayerData[v17];
    else
        return {};
    end;
end;
v0.GetUserLayerVariables = function(v18, v19) --[[ Line: 70 ]] --[[ Name: GetUserLayerVariables ]]
    if v18._userLoadingStatus == Enum.IXPLoadingStatus.Initialized then
        return v18._userLayerData[v19];
    else
        return {};
    end;
end;
v0.ClearUserLayers = function(v20) --[[ Line: 77 ]] --[[ Name: ClearUserLayers ]]
    v20._userLoadingStatus = Enum.IXPLoadingStatus.None;
    v20._userId = 0;
    v20._userBindableEvent:Fire(v20._userLoadingStatus, v20._userId);
end;
v0.GetBrowserTrackerLayerLoadingStatus = function(v21) --[[ Line: 83 ]] --[[ Name: GetBrowserTrackerLayerLoadingStatus ]]
    return v21._browserTrackerLoadingStatus;
end;
v0.GetUserLayerLoadingStatus = function(v22) --[[ Line: 87 ]] --[[ Name: GetUserLayerLoadingStatus ]]
    return v22._userLoadingStatus;
end;
v0.GetBrowserTrackerStatusForLayer = function(v23, _) --[[ Line: 91 ]] --[[ Name: GetBrowserTrackerStatusForLayer ]]
    return v23._browserTrackerLoadingStatus;
end;
v0.GetUserStatusForLayer = function(v25, _) --[[ Line: 95 ]] --[[ Name: GetUserStatusForLayer ]]
    return v25._userLoadingStatus;
end;
v0.LogUserLayerExposure = function(v27, v28) --[[ Line: 99 ]] --[[ Name: LogUserLayerExposure ]]
    table.insert(v27._exposureEventsFired, v28);
end;
v0.LogBrowserTrackerLayerExposure = function(v29, v30) --[[ Line: 103 ]] --[[ Name: LogBrowserTrackerLayerExposure ]]
    table.insert(v29._exposureEventsFired, v30);
end;
return v0;