local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
return function(v5, v6, _) --[[ Line: 9 ]] --[[ Name: LoginStateReducer ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v8 = table.clone(v5);
    local l_type_0 = v6.type;
    if l_type_0 == v4.SetUserIdentifierAndType then
        v8.userIdentifier = v6.data.userIdentifier;
        v8.userIdentifierType = v6.data.userIdentifierType;
        return v8;
    elseif l_type_0 == v4.IncrementLoginAttempts then
        v8.numLoginAttempts = v8.numLoginAttempts + 1;
        return v8;
    elseif l_type_0 == v4.ResetLoginAttempts then
        v8.numLoginAttempts = 0;
        return v8;
    elseif l_type_0 == v4.SetAvailableLoginMethods then
        v8.availableLoginMethods = v6.data;
        return v8;
    elseif l_type_0 == v4.UpdateCredentialsProtocolStatus then
        v8.credentialsProtocolStatus = v2.Dictionary.join(v8.credentialsProtocolStatus, v6.data);
        v8.credentialsProtocolStatus.initialStateUpdated = true;
        return v8;
    elseif l_type_0 == v4.SetCredentialAutoPopupShown then
        v8.shouldAutoShowCredentialPopup = false;
        return v8;
    elseif l_type_0 == v4.SetComponentState then
        v8.componentState[v6.data.component] = v2.Dictionary.join(v8.componentState[v6.data.component], v6.data.payload);
        return v8;
    elseif l_type_0 == v4.ForceLoginByUsername then
        v8.forceLoginByUsername = true;
        return v8;
    else
        if l_type_0 == v4.ClearForcedUsernameOverride and v8.extraProps then
            v8.extraProps.forcedUsernameOverride = nil;
        end;
        return v8;
    end;
end;