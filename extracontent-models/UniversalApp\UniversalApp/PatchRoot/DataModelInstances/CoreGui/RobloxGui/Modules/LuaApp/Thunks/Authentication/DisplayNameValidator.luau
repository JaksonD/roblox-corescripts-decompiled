local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetDisplayNamesValid);
local l_UsernameIssue_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.UsernameIssue;
local l_IssueCondition_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.IssueCondition;
local l_LocalSignUpDisplayNameValidator_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Util.LocalSignUpDisplayNameValidator;
local v11 = {
    [0] = l_UsernameIssue_0.None, 
    [1] = l_UsernameIssue_0.LengthTooShortOrTooLong, 
    [2] = l_UsernameIssue_0.LengthTooShortOrTooLong, 
    [3] = l_UsernameIssue_0.ContainsInvalidCharacter, 
    [4] = l_UsernameIssue_0.Inappropriate
};
local v12 = {
    [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
    [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
    [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
    [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
    [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
    [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
};
local function v13() --[[ Line: 36 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v12 (copy)
    return v12;
end;
local function v16() --[[ Line: 40 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v12 (copy), l_IssueCondition_0 (copy)
    local v14 = {};
    for v15 in pairs(v12) do
        v14[v15] = l_IssueCondition_0.Hidden;
    end;
    return v14;
end;
local function v21(v17) --[[ Line: 50 ]] --[[ Name: resetNonHiddenIssuesToProblematic ]]
    -- upvalues: v3 (copy), l_IssueCondition_0 (copy)
    local v18 = v3.Dictionary.join(v17);
    for v19, v20 in pairs(v18) do
        if v20 ~= l_IssueCondition_0.Hidden then
            v18[v19] = l_IssueCondition_0.Problematic;
        end;
    end;
    return v18;
end;
return {
    validateFunction = function(v22, v23, v24, v25) --[[ Line: 62 ]] --[[ Name: validateFunction ]]
        -- upvalues: v4 (copy), v5 (copy), v21 (copy), v3 (copy), l_LocalSignUpDisplayNameValidator_0 (copy), l_IssueCondition_0 (copy), v7 (copy), l_HttpService_0 (copy), v11 (copy), v6 (copy)
        return function(_) --[[ Line: 63 ]]
            -- upvalues: v4 (ref), v23 (copy), v24 (copy), v5 (ref), v21 (ref), v3 (ref), l_LocalSignUpDisplayNameValidator_0 (ref), l_IssueCondition_0 (ref), v25 (copy), v7 (ref), v22 (copy), l_HttpService_0 (ref), v11 (ref), v6 (ref)
            v4.isType(v23, "string", "displayName passed into DisplayNameValidator.validateFunction");
            v4.isType(v24, "table", "previousIssues passed into DisplayNameValidator.validateFunction");
            if v23 == "" then
                return v5.resolve({
                    Input = v23, 
                    InputValid = false, 
                    IssueCondition = v21(v24)
                });
            else
                local v27 = v3.Dictionary.join(v24);
                local v28 = l_LocalSignUpDisplayNameValidator_0:locallyValidateDisplayName(v23);
                local v29 = false;
                for _, v31 in pairs(v28) do
                    if v31 then
                        v29 = true;
                        break;
                    end;
                end;
                if v29 then
                    for v32, v33 in pairs(v24) do
                        local v34 = v28[v32];
                        if v33 == l_IssueCondition_0.Hidden and v34 then
                            v27[v32] = l_IssueCondition_0.Problematic;
                        elseif v33 ~= l_IssueCondition_0.Hidden then
                            v27[v32] = v34 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                        end;
                    end;
                    return v5.resolve({
                        Input = v23, 
                        InputValid = false, 
                        IssueCondition = v27
                    });
                else
                    for v35, v36 in pairs(v27) do
                        v27[v35] = v36 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                    end;
                    local l_birthday_0 = v25.birthday;
                    return v7(v22, v23, l_birthday_0):andThen(function(_) --[[ Line: 119 ]]
                        -- upvalues: v5 (ref), v23 (ref), v27 (copy)
                        return v5.resolve({
                            Input = v23, 
                            InputValid = true, 
                            IssueCondition = v27
                        });
                    end, function(v39) --[[ Line: 125 ]]
                        -- upvalues: l_HttpService_0 (ref), v11 (ref), v27 (copy), l_IssueCondition_0 (ref), v5 (ref), v23 (ref), v6 (ref)
                        local v40 = l_HttpService_0:JSONDecode(v39.Body);
                        local v41 = v40 and v40.errors or {};
                        local v42 = nil;
                        for _, v44 in pairs(v41) do
                            if v44.code then
                                v42 = v11[v44.code];
                                break;
                            end;
                        end;
                        if v42 then
                            v27[v42] = l_IssueCondition_0.Problematic;
                            return v5.resolve({
                                Input = v23, 
                                InputValid = false, 
                                IssueCondition = v27
                            });
                        else
                            v6("DisplayNameValidator_GetDisplayNamesValid_Failed", 1);
                            return v5.resolve({
                                Input = v23, 
                                InputValid = true, 
                                IssueCondition = v27
                            });
                        end;
                    end);
                end;
            end;
        end;
    end, 
    getIssueMessageList = v13, 
    getDefaultIssues = v16
};