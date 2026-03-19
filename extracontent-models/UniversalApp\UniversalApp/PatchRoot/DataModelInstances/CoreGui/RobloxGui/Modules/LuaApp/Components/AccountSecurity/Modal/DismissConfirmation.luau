local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.GetPromptAssignments);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalErrorText);
local v12 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v13 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v14 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v19 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent);
local v20 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local _ = function(_) --[[ Line: 27 ]]
    return {
        actionDismissForever = "Feature.AccountSecurityPrompt.Action.DismissForever", 
        actionDismissTemporary = "Feature.AccountSecurityPrompt.Action.DismissTemporary", 
        actionSecureAccount = "Feature.AccountSecurityPrompt.Action.SecureAccount", 
        description = "Feature.AccountSecurityPrompt.Description.AreYouSureDismissForeverChangePassword", 
        header = "Feature.AccountSecurityPrompt.Header.AreYouSure", 
        messageError = "Feature.AccountSecurityPrompt.Message.Error.PromptAssignments.Default"
    };
end;
local v24 = v2.PureComponent:extend(script.Name);
v24.init = function(v25) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v12 (copy)
    v25:setState({
        requestError = nil, 
        requestInFlightDismissForever = false, 
        requestInFlightDismissTemporary = false, 
        requestInFlightSecureAccount = false
    });
    v25.updatePromptAssignment = function(v26, v27) --[[ Line: 54 ]]
        -- upvalues: v25 (copy), v14 (ref)
        return function() --[[ Line: 55 ]]
            -- upvalues: v25 (ref), v14 (ref), v27 (copy), v26 (copy)
            v25:setState({
                requestInFlightDismissForever = true, 
                requestInFlightDismissTemporary = false, 
                requestInFlightSecureAccount = false
            });
            v25.props.updatePromptAssignment(v25.props.networking, v14.ChangePasswordSuspectedCompromise, v27):andThen(function() --[[ Line: 65 ]]
                -- upvalues: v25 (ref)
                v25.props.updatePromptType(v25.props.analytics, nil, nil, nil);
                v25.props.closeOverlay();
            end):catch(function(_) --[[ Line: 72 ]]
                -- upvalues: v25 (ref), v26 (ref)
                if not v25.isMounted then
                    return;
                else
                    v25:setState({
                        requestError = v26.messageError, 
                        requestInFlightDismissForever = false
                    });
                    return;
                end;
            end);
        end;
    end;
    v25.secureAccount = function() --[[ Line: 85 ]]
        -- upvalues: v25 (copy), v12 (ref)
        v25:setState({
            requestInFlightDismissForever = false, 
            requestInFlightDismissTemporary = false, 
            requestInFlightSecureAccount = true
        });
        v25.props.navigateToModalState(v12.ChangePasswordIntro);
    end;
end;
v24.didMount = function(v29) --[[ Line: 98 ]] --[[ Name: didMount ]]
    v29.isMounted = true;
end;
v24.willUnmount = function(v30) --[[ Line: 102 ]] --[[ Name: willUnmount ]]
    v30.isMounted = false;
end;
v24.render = function(v31) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v2 (copy), v8 (copy), v7 (copy), v9 (copy), v11 (copy), v10 (copy), l_ButtonType_0 (copy), v13 (copy)
    local l_requestError_0 = v31.state.requestError;
    local l_requestInFlightDismissForever_0 = v31.state.requestInFlightDismissForever;
    local l_requestInFlightDismissTemporary_0 = v31.state.requestInFlightDismissTemporary;
    local l_requestInFlightSecureAccount_0 = v31.state.requestInFlightSecureAccount;
    local v36 = l_requestInFlightDismissForever_0 or l_requestInFlightDismissTemporary_0 or l_requestInFlightSecureAccount_0;
    local _ = v31.props.modalState;
    return v20({
        actionDismissForever = "Feature.AccountSecurityPrompt.Action.DismissForever", 
        actionDismissTemporary = "Feature.AccountSecurityPrompt.Action.DismissTemporary", 
        actionSecureAccount = "Feature.AccountSecurityPrompt.Action.SecureAccount", 
        description = "Feature.AccountSecurityPrompt.Description.AreYouSureDismissForeverChangePassword", 
        header = "Feature.AccountSecurityPrompt.Header.AreYouSure", 
        messageError = "Feature.AccountSecurityPrompt.Message.Error.PromptAssignments.Default"
    })(function(v38) --[[ Line: 117 ]]
        -- upvalues: v2 (ref), v8 (ref), v7 (ref), v9 (ref), l_requestError_0 (copy), v11 (ref), v10 (ref), v36 (copy), l_requestInFlightSecureAccount_0 (copy), v31 (copy), l_ButtonType_0 (ref), l_requestInFlightDismissForever_0 (copy), v13 (ref), l_requestInFlightDismissTemporary_0 (copy)
        return v2.createElement(v8, {
            title = v38.header, 
            makeBodyFragment = function(v39) --[[ Line: 120 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v2 (ref), v7 (ref), v9 (ref), v38 (copy), l_requestError_0 (ref), v11 (ref)
                return v2.createFragment({
                    Lock = v2.createElement(v7, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v2.createElement(v9, {
                        layoutOrder = 2, 
                        contentWidth = v39, 
                        text = v38.description
                    }), 
                    ModalErrorText = l_requestError_0 and v2.createElement(v11, {
                        layoutOrder = 3, 
                        contentWidth = v39, 
                        errorText = l_requestError_0
                    })
                });
            end, 
            buttonConfig = v10({
                {
                    isDisabled = v36, 
                    isLoading = l_requestInFlightSecureAccount_0, 
                    onActivated = v31.secureAccount, 
                    text = v38.actionSecureAccount, 
                    type = l_ButtonType_0.PrimarySystem
                }, 
                {
                    isDisabled = v36, 
                    isLoading = l_requestInFlightDismissForever_0, 
                    onActivated = v31.updatePromptAssignment(v38, v13.DisablePrompt), 
                    text = v38.actionDismissForever, 
                    type = l_ButtonType_0.Secondary
                }, 
                {
                    isDisabled = v36, 
                    isLoading = l_requestInFlightDismissTemporary_0, 
                    onActivated = v31.updatePromptAssignment(v38, v13.DismissPrompt), 
                    text = v38.actionDismissTemporary, 
                    type = l_ButtonType_0.Secondary
                }
            })
        });
    end);
end;
v24 = v3.connect(nil, function(v40) --[[ Line: 164 ]]
    -- upvalues: v5 (copy), v6 (copy), v19 (copy), v18 (copy)
    return {
        closeOverlay = function() --[[ Line: 166 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v40 (copy), v5 (ref)
            return v40(v5());
        end, 
        getPromptAssignments = function(v41) --[[ Line: 169 ]] --[[ Name: getPromptAssignments ]]
            -- upvalues: v40 (copy), v6 (ref)
            return v40(v6(v41));
        end, 
        updatePromptType = function(v42, v43, v44, v45) --[[ Line: 172 ]] --[[ Name: updatePromptType ]]
            -- upvalues: v40 (copy), v19 (ref)
            return v40(v19(v42, v43, v44, v45));
        end, 
        updatePromptAssignment = function(v46, v47, v48) --[[ Line: 175 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v40 (copy), v18 (ref)
            return v40(v18(v46, v47, v48));
        end
    };
end)(v24);
return (l_RoactServices_0.connect({
    analytics = v15, 
    networking = v16
})(v24));