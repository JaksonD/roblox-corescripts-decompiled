local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v4 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v5 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local v6 = require(l_script_FirstAncestor_0.Enums.CallbackStatus);
local v7 = require(l_script_FirstAncestor_0.Hooks.useUpdateActivationWorkflowAndNavigate);
local _ = require(l_script_FirstAncestor_0.Types);
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
return function(v10) --[[ Line: 13 ]]
    -- upvalues: v7 (copy), v2 (copy), v3 (copy), v5 (copy), v6 (copy), v4 (copy)
    local v11 = v7(v10);
    local v12 = v2.useContext(v3);
    return v2.useCallback(function(v13) --[[ Line: 18 ]]
        -- upvalues: v12 (copy), v5 (ref), v6 (ref), v11 (copy), v4 (ref)
        if v13 and not v12.activationFrameworkState.isLoading then
            v12.dispatch({
                type = v5.SetIsLoading, 
                data = {
                    isLoading = true
                }
            });
            local v14 = v13.onButtonClicked();
            if v14 ~= nil then
                local l_payloadAddendum_0 = v14.payloadAddendum;
                local l_status_0 = v14.status;
                if l_status_0 == v6.Success then
                    if l_payloadAddendum_0 ~= nil then
                        v12.dispatch({
                            type = v5.SetMergePayload, 
                            data = {
                                payloadTable = l_payloadAddendum_0
                            }
                        });
                    end;
                    v11(v4.Next, l_payloadAddendum_0);
                elseif l_status_0 == v6.NeedsReset then
                    v12.dispatch({
                        type = v5.ClearPayload
                    });
                    v11(v4.Reset);
                end;
            end;
            v12.dispatch({
                type = v5.SetIsLoading, 
                data = {
                    isLoading = false
                }
            });
        end;
    end, {
        v10, 
        v11, 
        v12
    });
end;