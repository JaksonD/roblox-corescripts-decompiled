local l_Parent_0 = script:FindFirstAncestor("SystemScrim").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SignalsReact);
return function(v3) --[[ Line: 23 ]] --[[ Name: SystemScrim ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.useSignalState(v3.store.autoDismiss);
    local v5 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3.store.backgroundScrimActivated:Fire();
        if v4 then
            v3.store.setVisibility(false);
        end;
    end, {
        v4
    });
    local v6 = v2.useSignalState(v3.store.visible);
    local v7 = v2.useSignalBinding(v3.store.transparency);
    if not v6 then
        return nil;
    else
        return (v1.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            Visible = true, 
            BackgroundTransparency = v7, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Text = "", 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            [v1.Event.Activated] = v5
        }));
    end;
end;