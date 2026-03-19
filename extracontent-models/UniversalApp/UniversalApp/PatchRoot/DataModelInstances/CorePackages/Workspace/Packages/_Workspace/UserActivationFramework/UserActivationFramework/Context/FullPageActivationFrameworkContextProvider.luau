local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v4 = require(l_script_FirstAncestor_0.Reducers.ActivationFrameworkReducer);
local _ = require(l_script_FirstAncestor_0.Types.ActivationFrameworkContextTypes);
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
return function(v7) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local l_initialActivationWorkflowState_0 = v7.initialActivationWorkflowState;
    local v9 = {
        namespace = l_initialActivationWorkflowState_0.namespace, 
        currentState = l_initialActivationWorkflowState_0.state, 
        payloadTable = l_initialActivationWorkflowState_0.payload, 
        sessionId = "", 
        availableActions = l_initialActivationWorkflowState_0.availableActions, 
        history = l_initialActivationWorkflowState_0.history, 
        onClose = v7.onClose, 
        onWorkflowComplete = v7.onWorkflowComplete, 
        isLoading = false, 
        navigation = {}
    };
    local v10, v11 = v2.useReducer(v4, v9);
    return v2.createElement(v3.Provider, {
        value = {
            activationFrameworkState = v10, 
            dispatch = v11, 
            monoDeps = v7.monoDeps
        }
    }, v7.children);
end;