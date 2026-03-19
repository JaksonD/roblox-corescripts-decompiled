return function(v0, v1) --[[ Line: 2 ]]
    local v2 = nil;
    local function v3() --[[ Line: 5 ]]
        -- upvalues: v2 (ref)
        if v2 then
            v2:Disconnect();
            v2 = nil;
        end;
    end;
    local function v5(v4) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v0 (copy)
        if v2 and v2 then
            v2:Disconnect();
            v2 = nil;
        end;
        if v0 then
            v2 = v0.ShowLeaveConfirmation:Connect(v4);
        end;
    end;
    return {
        disconnect = v3, 
        connect = v5, 
        showExitDialog = function() --[[ Line: 21 ]]
            -- upvalues: v0 (copy), v1 (copy)
            if v0 and v1 then
                v0:BroadcastNotification("", v1.BACK_BUTTON_NOT_CONSUMED);
            end;
        end
    };
end;