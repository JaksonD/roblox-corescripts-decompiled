local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.ActivationFrameworkTokenMapper);
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v6 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local v7 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_authPageload_0 = require(l_Parent_0.AuthAnalytics).Events.authPageload;
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local v11 = require(l_script_FirstAncestor_0.Hooks.useUpdateActivationWorkflowAndNavigate);
return function(v12) --[[ Line: 23 ]] --[[ Name: NonInteractiveActivationFrameworkWrapper ]]
    -- upvalues: v2 (copy), v5 (copy), l_useDesignTokens_0 (copy), v11 (copy), l_authPageload_0 (copy), v6 (copy), v7 (copy), l_Text_0 (copy)
    local v13 = v2.useContext(v5);
    local l_activationFrameworkState_0 = v13.activationFrameworkState;
    local l_ActivationFramework_0 = l_useDesignTokens_0().LuaApps.ActivationFramework;
    local v16 = v11(v12.navigation);
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_authPageload_0 (ref), l_activationFrameworkState_0 (copy), v12 (copy), v13 (copy), v6 (ref), v16 (copy), v7 (ref)
        l_authPageload_0(l_activationFrameworkState_0.namespace, l_activationFrameworkState_0.currentState);
        local v17 = v12.step.onNonInteractiveStepExecution();
        local l_successPayloadAddendum_0 = v17.successPayloadAddendum;
        local _ = v17.errorOutput;
        if l_successPayloadAddendum_0 then
            v13.dispatch({
                type = v6.SetMergePayload, 
                data = {
                    payloadTable = l_successPayloadAddendum_0
                }
            });
            v16(v7.Next);
            return;
        else
            v16(v7.Back);
            return;
        end;
    end, {});
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 0.5
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingTop = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingLeft = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx), 
            PaddingRight = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx)
        }); 
        v2.createElement(l_Text_0, {
            Text = "LOADING...", 
            fontStyle = {
                LineHeight = 1
            }, 
            tag = "text-body-medium text-align-x-left auto-xy", 
            TextWrapped = true
        })
    });
end;