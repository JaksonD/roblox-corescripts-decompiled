local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.getSduiPageEntrySnackbarStore);
return function(v5) --[[ Line: 15 ]] --[[ Name: usePageEntrySnackbar ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v6 = v4().getSignal(v5);
    local v7 = v3.useSignalState(v6);
    local v8 = v2.useCallback(function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy), v4 (ref)
        if v5 then
            v4().hide(v5);
        end;
    end, {
        v5
    });
    v2.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: v7 (copy), v5 (copy), v4 (ref)
        if v7 == nil then
            return;
        else
            local v9 = v7.durationSeconds or 4;
            local v10 = task.delay(v9, function() --[[ Line: 33 ]]
                -- upvalues: v5 (ref), v4 (ref)
                if v5 then
                    v4().hide(v5);
                end;
            end);
            return function() --[[ Line: 39 ]]
                -- upvalues: v10 (copy)
                task.cancel(v10);
            end;
        end;
    end, {
        v7
    });
    return {
        snackbarConfig = v7, 
        dismissSnackbar = v8, 
        onDismiss = v8
    };
end;