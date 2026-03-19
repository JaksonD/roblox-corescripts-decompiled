local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v5, v6) --[[ Line: 7 ]] --[[ Name: ActivationFrameworkReducer ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v7 = table.clone(v5);
    if v6.type == v3.SetActivationFrameworkState then
        return (v2.Dictionary.join(v7, v6.data));
    elseif v6.type == v3.SetSessionId then
        v7.sessionId = v6.data.sessionId;
        return v7;
    elseif v6.type == v3.SetAvailableActions then
        v7.availableActions = v6.data.availableActions;
        return v7;
    elseif v6.type == v3.SetOnClose then
        v7.onClose = v6.data.onClose;
        return v7;
    elseif v6.type == v3.SetIsLoading then
        v7.isLoading = v6.data.isLoading;
        return v7;
    elseif v6.type == v3.SetMergePayload then
        v7.payloadTable = v2.Dictionary.join(v7.payloadTable, v6.data.payloadTable);
        return v7;
    else
        if v6.type == v3.ClearPayload then
            v7.payloadTable = {};
        end;
        return v7;
    end;
end;