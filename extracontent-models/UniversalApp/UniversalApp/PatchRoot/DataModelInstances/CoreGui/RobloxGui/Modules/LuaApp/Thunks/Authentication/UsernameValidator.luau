local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
if require(l_Modules_0.LuaApp.Flags.GetFFlagUsePackageUsernameValidation)() then
    return require(l_CorePackages_0.Workspace.Packages.AuthSignup).Thunks.UsernameValidator;
else
    local v2 = require(l_CorePackages_0.Packages.Cryo);
    local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
    local v4 = require(l_Modules_0.LuaApp.Promise);
    local v5 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameValid);
    local l_UsernameIssue_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.UsernameIssue;
    local l_IssueCondition_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.IssueCondition;
    local l_LocalSignUpUsernameValidator_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Util.LocalSignUpUsernameValidator;
    local l_GetFFlagFixUsernameValidationAlreadyInUse_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixUsernameValidationAlreadyInUse;
    local v10 = {
        [0] = l_UsernameIssue_0.None, 
        [1] = l_UsernameIssue_0.AlreadyInUse, 
        [2] = l_UsernameIssue_0.Inappropriate, 
        [3] = l_UsernameIssue_0.LengthTooShortOrTooLong, 
        [4] = l_UsernameIssue_0.BoundingUnderscore, 
        [5] = l_UsernameIssue_0.MultipleUnderscores, 
        [6] = l_UsernameIssue_0.ContainsSpaces, 
        [7] = l_UsernameIssue_0.ContainsInvalidCharacter, 
        [10] = l_UsernameIssue_0.ContainsPII
    };
    local v11 = {
        [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
        [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
        [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
        [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
        [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
        [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
        [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
    };
    local function v12() --[[ Line: 47 ]] --[[ Name: getIssueMessageList ]]
        -- upvalues: v11 (copy)
        return v11;
    end;
    local function v15() --[[ Line: 51 ]] --[[ Name: getDefaultIssues ]]
        -- upvalues: v11 (copy), l_UsernameIssue_0 (copy), l_IssueCondition_0 (copy)
        local v13 = {};
        for v14 in pairs(v11) do
            if v14 == l_UsernameIssue_0.ContainsInvalidCharacter or v14 == l_UsernameIssue_0.LengthTooShortOrTooLong or v14 == l_UsernameIssue_0.AlreadyInUse then
                v13[v14] = l_IssueCondition_0.Problematic;
            else
                v13[v14] = l_IssueCondition_0.Hidden;
            end;
        end;
        return v13;
    end;
    local function v20(v16) --[[ Line: 69 ]] --[[ Name: resetNonHiddenIssuesToProblematic ]]
        -- upvalues: v2 (copy), l_IssueCondition_0 (copy)
        local v17 = v2.Dictionary.join(v16);
        for v18, v19 in pairs(v17) do
            if v19 ~= l_IssueCondition_0.Hidden then
                v17[v18] = l_IssueCondition_0.Problematic;
            end;
        end;
        return v17;
    end;
    local _ = function(v21, v22, v23, v24, v25) --[[ Line: 81 ]] --[[ Name: validateFunction ]]
        -- upvalues: v3 (copy), v4 (copy), v20 (copy), v2 (copy), l_LocalSignUpUsernameValidator_0 (copy), l_IssueCondition_0 (copy), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (copy), v5 (copy), v10 (copy), l_UsernameIssue_0 (copy)
        return function(_) --[[ Line: 82 ]]
            -- upvalues: v3 (ref), v22 (copy), v23 (copy), v24 (copy), v4 (ref), v20 (ref), v2 (ref), l_LocalSignUpUsernameValidator_0 (ref), l_IssueCondition_0 (ref), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (ref), v5 (ref), v21 (copy), v25 (copy), v10 (ref), l_UsernameIssue_0 (ref)
            v3.isType(v22, "string", "username passed into UsernameValidator.validateFunction");
            v3.isType(v23, "string", "birthday passed into UsernameValidator.validateFunction");
            v3.isType(v24, "table", "previousIssues passed into UsernameValidator.validateFunction");
            if v22 == "" then
                return v4.resolve({
                    Input = v22, 
                    InputValid = false, 
                    IssueCondition = v20(v24)
                });
            else
                local v27 = v2.Dictionary.join(v24);
                local v28 = l_LocalSignUpUsernameValidator_0:locallyValidateUsername(v22);
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
                        elseif v33 ~= l_IssueCondition_0.Hidden and (not l_GetFFlagFixUsernameValidationAlreadyInUse_0() or v34 ~= nil) then
                            v27[v32] = v34 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                        end;
                    end;
                    return v4.resolve({
                        Input = v22, 
                        InputValid = false, 
                        IssueCondition = v27
                    });
                else
                    for v35, v36 in pairs(v27) do
                        v27[v35] = v36 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                    end;
                    return v5(v21, v22, v23, v25):andThen(function(v37) --[[ Line: 142 ]]
                        -- upvalues: v10 (ref), l_UsernameIssue_0 (ref), v27 (copy), l_IssueCondition_0 (ref), v4 (ref), v22 (ref)
                        local v38 = v37 and v37.responseBody and v37.responseBody.code;
                        local v39 = v10[v38];
                        if v39 then
                            if v39 == l_UsernameIssue_0.ContainsSpaces then
                                v27[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                            elseif v39 ~= l_UsernameIssue_0.None then
                                v27[v39] = l_IssueCondition_0.Problematic;
                            end;
                        else
                            warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v38);
                        end;
                        return v4.resolve({
                            Input = v22, 
                            InputValid = v39 == l_UsernameIssue_0.None, 
                            IssueCondition = v27
                        });
                    end, function(_) --[[ Line: 164 ]]
                        -- upvalues: v4 (ref), v22 (ref), v27 (copy)
                        return v4.resolve({
                            Input = v22, 
                            InputValid = true, 
                            IssueCondition = v27
                        });
                    end);
                end;
            end;
        end;
    end;
    return {
        validateFunction = function(v42, v43, v44, v45) --[[ Line: 175 ]] --[[ Name: validateFunctionRefactor ]]
            -- upvalues: v3 (copy), v4 (copy), v20 (copy), v2 (copy), l_LocalSignUpUsernameValidator_0 (copy), l_IssueCondition_0 (copy), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (copy), v5 (copy), v10 (copy), l_UsernameIssue_0 (copy)
            v45 = v45 or {};
            local l_birthday_0 = v45.birthday;
            local l_context_0 = v45.context;
            return function(_) --[[ Line: 82 ]]
                -- upvalues: v3 (ref), v43 (copy), l_birthday_0 (copy), v44 (copy), v4 (ref), v20 (ref), v2 (ref), l_LocalSignUpUsernameValidator_0 (ref), l_IssueCondition_0 (ref), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (ref), v5 (ref), v42 (copy), l_context_0 (copy), v10 (ref), l_UsernameIssue_0 (ref)
                v3.isType(v43, "string", "username passed into UsernameValidator.validateFunction");
                v3.isType(l_birthday_0, "string", "birthday passed into UsernameValidator.validateFunction");
                v3.isType(v44, "table", "previousIssues passed into UsernameValidator.validateFunction");
                if v43 == "" then
                    return v4.resolve({
                        Input = v43, 
                        InputValid = false, 
                        IssueCondition = v20(v44)
                    });
                else
                    local v49 = v2.Dictionary.join(v44);
                    local v50 = l_LocalSignUpUsernameValidator_0:locallyValidateUsername(v43);
                    local v51 = false;
                    for _, v53 in pairs(v50) do
                        if v53 then
                            v51 = true;
                            break;
                        end;
                    end;
                    if v51 then
                        for v54, v55 in pairs(v44) do
                            local v56 = v50[v54];
                            if v55 == l_IssueCondition_0.Hidden and v56 then
                                v49[v54] = l_IssueCondition_0.Problematic;
                            elseif v55 ~= l_IssueCondition_0.Hidden and (not l_GetFFlagFixUsernameValidationAlreadyInUse_0() or v56 ~= nil) then
                                v49[v54] = v56 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                            end;
                        end;
                        return v4.resolve({
                            Input = v43, 
                            InputValid = false, 
                            IssueCondition = v49
                        });
                    else
                        for v57, v58 in pairs(v49) do
                            v49[v57] = v58 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                        end;
                        return v5(v42, v43, l_birthday_0, l_context_0):andThen(function(v59) --[[ Line: 142 ]]
                            -- upvalues: v10 (ref), l_UsernameIssue_0 (ref), v49 (copy), l_IssueCondition_0 (ref), v4 (ref), v43 (ref)
                            local v60 = v59 and v59.responseBody and v59.responseBody.code;
                            local v61 = v10[v60];
                            if v61 then
                                if v61 == l_UsernameIssue_0.ContainsSpaces then
                                    v49[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                                elseif v61 ~= l_UsernameIssue_0.None then
                                    v49[v61] = l_IssueCondition_0.Problematic;
                                end;
                            else
                                warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v60);
                            end;
                            return v4.resolve({
                                Input = v43, 
                                InputValid = v61 == l_UsernameIssue_0.None, 
                                IssueCondition = v49
                            });
                        end, function(_) --[[ Line: 164 ]]
                            -- upvalues: v4 (ref), v43 (ref), v49 (copy)
                            return v4.resolve({
                                Input = v43, 
                                InputValid = true, 
                                IssueCondition = v49
                            });
                        end);
                    end;
                end;
            end;
        end, 
        getIssueMessageList = v12, 
        getDefaultIssues = v15
    };
end;