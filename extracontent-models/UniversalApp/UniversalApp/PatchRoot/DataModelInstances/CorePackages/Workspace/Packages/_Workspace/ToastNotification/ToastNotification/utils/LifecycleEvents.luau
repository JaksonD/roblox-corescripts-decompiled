return {
    ToastEvents = {
        AttemptDisplay = "ToastNotifications.displayToastNotification", 
        Display = "ToastNotifications.displayedToastNotification", 
        Update = "ToastNotifications.updatedToastNotification", 
        UserAction = "ToastNotifications.UserActionOnToastNotification"
    }, 
    RegisteredCallbacks = {}, 
    DispatchEvent = function(v0, v1, v2, v3) --[[ Line: 12 ]] --[[ Name: DispatchEvent ]]
        local v4 = v0.RegisteredCallbacks[v2] and v0.RegisteredCallbacks[v2][v1];
        if v4 then
            for v5 in v4 do
                task.spawn(v5, v3);
            end;
        end;
    end, 
    RemoveCallback = function(v6, v7, v8, v9) --[[ Line: 22 ]] --[[ Name: RemoveCallback ]]
        local v10 = v6.RegisteredCallbacks[v8] and v6.RegisteredCallbacks[v8][v7];
        if not v10 then
            return;
        else
            v10[v9] = nil;
            if not next(v10) then
                v6.RegisteredCallbacks[v8][v7] = nil;
                if not next(v6.RegisteredCallbacks[v8]) then
                    v6.RegisteredCallbacks[v8] = nil;
                end;
            end;
            return;
        end;
    end, 
    RegisterCallback = function(v11, v12, v13, v14) --[[ Line: 37 ]] --[[ Name: RegisterCallback ]]
        if not v11.RegisteredCallbacks[v13] then
            v11.RegisteredCallbacks[v13] = {};
        end;
        if not v11.RegisteredCallbacks[v13][v12] then
            v11.RegisteredCallbacks[v13][v12] = {};
        end;
        v11.RegisteredCallbacks[v13][v12][v14] = true;
        return function() --[[ Line: 45 ]]
            -- upvalues: v11 (copy), v12 (copy), v13 (copy), v14 (copy)
            v11:RemoveCallback(v12, v13, v14);
        end;
    end
};