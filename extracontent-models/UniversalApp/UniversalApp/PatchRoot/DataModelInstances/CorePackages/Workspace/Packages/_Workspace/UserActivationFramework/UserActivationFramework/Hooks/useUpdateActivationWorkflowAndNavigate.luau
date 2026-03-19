local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v4 = require(l_script_FirstAncestor_0.Thunks.UpdateActivationWorkflow);
local _ = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v6 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
local v7 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
return function(v10) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v7 (copy)
    local v11 = v2.useContext(v3);
    local l_activationFrameworkState_0 = v11.activationFrameworkState;
    local l_dispatch_0 = v11.dispatch;
    local l_namespace_0 = l_activationFrameworkState_0.namespace;
    return v2.useCallback(function(v15, v16) --[[ Line: 18 ]]
        -- upvalues: v4 (ref), l_namespace_0 (copy), l_activationFrameworkState_0 (copy), v6 (ref), l_dispatch_0 (copy), v7 (ref), v10 (copy)
        local v17 = v4(l_namespace_0, l_activationFrameworkState_0.currentState, l_activationFrameworkState_0.payloadTable, v15, l_activationFrameworkState_0.history, v16);
        if v17 == nil then
            l_activationFrameworkState_0.onClose();
            return;
        elseif v17.state == v6.Complete then
            l_activationFrameworkState_0.onWorkflowComplete(l_activationFrameworkState_0.payloadTable);
            return;
        else
            l_dispatch_0({
                type = v7.SetActivationFrameworkState, 
                data = {
                    currentState = v17.state, 
                    availableActions = v17.availableActions, 
                    history = v17.history
                }
            });
            v10.navigate(v17.state);
            return;
        end;
    end, {
        v10, 
        l_activationFrameworkState_0.currentState, 
        l_activationFrameworkState_0.payloadTable, 
        l_dispatch_0
    });
end;