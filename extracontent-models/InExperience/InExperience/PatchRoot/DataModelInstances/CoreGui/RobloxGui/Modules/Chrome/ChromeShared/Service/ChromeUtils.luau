local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_FFlagEnableConsoleExpControls_0 = v2.FFlagEnableConsoleExpControls;
local v5 = {
    Unavailable = 0, 
    Loading = 1, 
    Available = 2, 
    Pinned = 3
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_Signal_0 (copy), v6 (copy)
    return (setmetatable({
        _state = v7 or v5.Unavailable, 
        _forceUnavailable = not l_FFlagEnableConsoleExpControls_0 and nil, 
        _changeSignal = l_Signal_0.new()
    }, v6));
end;
v6.connect = function(v8, v9) --[[ Line: 42 ]] --[[ Name: connect ]]
    return v8._changeSignal:connect(v9);
end;
v6.set = function(v10, v11) --[[ Line: 46 ]] --[[ Name: set ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy)
    if v10._state ~= v11 then
        v10._state = v11;
        if not l_FFlagEnableConsoleExpControls_0 or not v10._forceUnavailable then
            v10._changeSignal:fire(v11);
        end;
    end;
end;
v6.get = function(v12) --[[ Line: 55 ]] --[[ Name: get ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v5 (copy)
    if l_FFlagEnableConsoleExpControls_0 and v12._forceUnavailable then
        return v5.Unavailable;
    else
        return v12._state;
    end;
end;
v6.available = function(v13) --[[ Line: 63 ]] --[[ Name: available ]]
    -- upvalues: v5 (copy)
    v13:set(v5.Available);
end;
v6.loading = function(v14) --[[ Line: 67 ]] --[[ Name: loading ]]
    -- upvalues: v5 (copy)
    v14:set(v5.Loading);
end;
v6.unavailable = function(v15) --[[ Line: 71 ]] --[[ Name: unavailable ]]
    -- upvalues: v5 (copy)
    v15:set(v5.Unavailable);
end;
v6.pinned = function(v16) --[[ Line: 75 ]] --[[ Name: pinned ]]
    -- upvalues: v5 (copy)
    v16:set(v5.Pinned);
end;
v6.forceUnavailable = function(v17) --[[ Line: 79 ]] --[[ Name: forceUnavailable ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v5 (copy)
    if l_FFlagEnableConsoleExpControls_0 and not v17._forceUnavailable then
        v17._forceUnavailable = true;
        if v17._state ~= v5.Unavailable then
            v17._changeSignal:fire(v5.Unavailable);
        end;
    end;
end;
v6.unforceUnavailable = function(v18) --[[ Line: 89 ]] --[[ Name: unforceUnavailable ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), v5 (copy)
    if l_FFlagEnableConsoleExpControls_0 and v18._forceUnavailable then
        v18._forceUnavailable = false;
        if v18._state ~= v5.Unavailable then
            v18._changeSignal:fire(v18._state);
        end;
    end;
end;
local v19 = {};
v19.__index = v19;
v19.new = function(v20) --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v19 (copy)
    return (setmetatable({
        _value = {
            type = "empty", 
            value = nil
        }, 
        _changeSignal = l_Signal_0.new(), 
        _excludeFromTotalCounts = v20 or false
    }, v19));
end;
v19.setExcludeFromTotalCounts = function(v21, v22) --[[ Line: 125 ]] --[[ Name: setExcludeFromTotalCounts ]]
    v21._excludeFromTotalCounts = v22;
end;
v19.excludeFromTotalCounts = function(v23) --[[ Line: 129 ]] --[[ Name: excludeFromTotalCounts ]]
    return v23._excludeFromTotalCounts;
end;
v19.connect = function(v24, v25) --[[ Line: 133 ]] --[[ Name: connect ]]
    return v24._changeSignal:connect(v25);
end;
v19.get = function(v26) --[[ Line: 137 ]] --[[ Name: get ]]
    return v26._value;
end;
v19.clear = function(v27) --[[ Line: 141 ]] --[[ Name: clear ]]
    if v27._value and v27._value.type ~= "empty" then
        v27._value = {
            type = "empty", 
            value = nil
        };
        v27._changeSignal:fire(v27._value);
    end;
end;
v19.fireCount = function(v28, v29) --[[ Line: 148 ]] --[[ Name: fireCount ]]
    local v30 = {
        type = "count", 
        value = v29
    };
    if v28._value ~= v30 then
        v28._value = v30;
        v28._changeSignal:fire(v28._value);
    end;
end;
v19.isEmpty = function(v31) --[[ Line: 156 ]] --[[ Name: isEmpty ]]
    return v31._value and v31._value.type == "empty";
end;
local v32 = {};
v32.__index = v32;
v32.new = function(v33) --[[ Line: 174 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v32 (copy)
    return (setmetatable({
        _value = v33, 
        _changeSignal = l_Signal_0.new()
    }, v32));
end;
v32.get = function(v34) --[[ Line: 181 ]] --[[ Name: get ]]
    return v34._value;
end;
v32.setMomentary = function(v35, v36, v37, v38) --[[ Line: 185 ]] --[[ Name: setMomentary ]]
    if v35._value ~= v36 then
        v35._value = v36;
        v35._changeSignal:fire(v36);
    end;
    local l__momentaryClearThread_0 = v35._momentaryClearThread;
    if l__momentaryClearThread_0 then
        task.cancel(l__momentaryClearThread_0);
    end;
    v35._momentaryClearThread = task.delay(v37, function() --[[ Line: 197 ]]
        -- upvalues: v35 (copy), v38 (copy)
        v35._momentaryClearThread = nil;
        v35.set(v35, v38);
    end);
end;
v32.set = function(v40, v41) --[[ Line: 204 ]] --[[ Name: set ]]
    local l__momentaryClearThread_1 = v40._momentaryClearThread;
    if l__momentaryClearThread_1 then
        task.cancel(l__momentaryClearThread_1);
        v40._momentaryClearThread = nil;
    end;
    if v40._value ~= v41 then
        v40._value = v41;
        v40._changeSignal:fire(v41);
    end;
end;
v32.signal = function(v43) --[[ Line: 217 ]] --[[ Name: signal ]]
    return v43._changeSignal;
end;
v32.connect = function(v44, v45, v46) --[[ Line: 221 ]] --[[ Name: connect ]]
    local v47 = v44._changeSignal:connect(v45);
    if v46 == true then
        v45(v44._value);
    end;
    return v47;
end;
local v48 = {};
v48.__index = v48;
v48.new = function(v49, v50, v51) --[[ Line: 253 ]] --[[ Name: new ]]
    -- upvalues: v48 (copy)
    if not v49 then
        error("No signal provided to MappedSignal");
    end;
    if not v50 then
        error("No fetchMapFunction provided to MappedSignal");
    end;
    return (setmetatable({
        _signal = v49, 
        _fetchMapFunction = v50, 
        _eventReceiver = v51
    }, v48));
end;
v48.connect = function(v52, v53) --[[ Line: 267 ]] --[[ Name: connect ]]
    if not v52._signal then
        warn("MappedSignal: Missing signal");
        return function() --[[ Line: 270 ]]

        end;
    else
        local v54 = v52._signal:connect(function() --[[ Line: 273 ]]
            -- upvalues: v52 (copy), v53 (copy)
            if v52._eventReceiver then
                v52._eventReceiver();
            end;
            v53(v52._fetchMapFunction());
        end);
        if v52._eventReceiver then
            v52._eventReceiver();
        end;
        v53(v52._fetchMapFunction());
        return v54;
    end;
end;
v48.get = function(v55) --[[ Line: 287 ]] --[[ Name: get ]]
    return v55._fetchMapFunction();
end;
setCoreGuiAvailability = function(v56, v57, v58) --[[ Line: 291 ]] --[[ Name: setCoreGuiAvailability ]]
    -- upvalues: l_StarterGui_0 (copy)
    local function v60() --[[ Line: 296 ]] --[[ Name: updateAvailable ]]
        -- upvalues: l_StarterGui_0 (ref), v57 (copy), v58 (copy), v56 (copy)
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(v57);
        if v58 then
            v58(l_l_StarterGui_0_CoreGuiEnabled_0);
            return;
        elseif l_l_StarterGui_0_CoreGuiEnabled_0 then
            v56.availability:available();
            return;
        else
            v56.availability:unavailable();
            return;
        end;
    end;
    local v61 = l_StarterGui_0.CoreGuiChangedSignal:Connect(v60);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(v57);
    if v58 then
        v58(l_l_StarterGui_0_CoreGuiEnabled_1);
        return v61;
    elseif l_l_StarterGui_0_CoreGuiEnabled_1 then
        v56.availability:available();
        return v61;
    else
        v56.availability:unavailable();
        return v61;
    end;
end;
return {
    MappedSignal = v48, 
    AvailabilitySignal = v6, 
    AvailabilitySignalState = v5, 
    NotifySignal = v19, 
    ObservableValue = v32, 
    setCoreGuiAvailability = setCoreGuiAvailability
};