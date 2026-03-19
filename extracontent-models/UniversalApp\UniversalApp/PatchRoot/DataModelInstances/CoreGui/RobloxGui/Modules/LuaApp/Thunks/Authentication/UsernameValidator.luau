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
    local v9 = {
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
    local v10 = {
        [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
        [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
        [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
        [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
        [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
        [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
        [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
    };
    local function v11() --[[ Line: 44 ]] --[[ Name: getIssueMessageList ]]
        -- upvalues: v10 (copy)
        return v10;
    end;
    local function v14() --[[ Line: 48 ]] --[[ Name: getDefaultIssues ]]
        -- upvalues: v10 (copy), l_UsernameIssue_0 (copy), l_IssueCondition_0 (copy)
        local v12 = {};
        for v13 in pairs(v10) do
            if v13 == l_UsernameIssue_0.ContainsInvalidCharacter or v13 == l_UsernameIssue_0.LengthTooShortOrTooLong or v13 == l_UsernameIssue_0.AlreadyInUse then
                v12[v13] = l_IssueCondition_0.Problematic;
            else
                v12[v13] = l_IssueCondition_0.Hidden;
            end;
        end;
        return v12;
    end;
    local function v19(v15) --[[ Line: 66 ]] --[[ Name: resetNonHiddenIssuesToProblematic ]]
        -- upvalues: v2 (copy), l_IssueCondition_0 (copy)
        local v16 = v2.Dictionary.join(v15);
        for v17, v18 in pairs(v16) do
            if v18 ~= l_IssueCondition_0.Hidden then
                v16[v17] = l_IssueCondition_0.Problematic;
            end;
        end;
        return v16;
    end;
    local _ = function(v20, v21, v22, v23, v24) --[[ Line: 78 ]] --[[ Name: validateFunction ]]
        -- upvalues: v3 (copy), v4 (copy), v19 (copy), v2 (copy), l_LocalSignUpUsernameValidator_0 (copy), l_IssueCondition_0 (copy), v5 (copy), v9 (copy), l_UsernameIssue_0 (copy)
        return function(_) --[[ Line: 79 ]]
            -- upvalues: v3 (ref), v21 (copy), v22 (copy), v23 (copy), v4 (ref), v19 (ref), v2 (ref), l_LocalSignUpUsernameValidator_0 (ref), l_IssueCondition_0 (ref), v5 (ref), v20 (copy), v24 (copy), v9 (ref), l_UsernameIssue_0 (ref)
            v3.isType(v21, "string", "username passed into UsernameValidator.validateFunction");
            v3.isType(v22, "string", "birthday passed into UsernameValidator.validateFunction");
            v3.isType(v23, "table", "previousIssues passed into UsernameValidator.validateFunction");
            if v21 == "" then
                return v4.resolve({
                    Input = v21, 
                    InputValid = false, 
                    IssueCondition = v19(v23)
                });
            else
                local v26 = v2.Dictionary.join(v23);
                local v27 = l_LocalSignUpUsernameValidator_0:locallyValidateUsername(v21);
                local v28 = false;
                for _, v30 in pairs(v27) do
                    if v30 then
                        v28 = true;
                        break;
                    end;
                end;
                if v28 then
                    for v31, v32 in pairs(v23) do
                        local v33 = v27[v31];
                        if v32 == l_IssueCondition_0.Hidden and v33 then
                            v26[v31] = l_IssueCondition_0.Problematic;
                        elseif v32 ~= l_IssueCondition_0.Hidden then
                            v26[v31] = v33 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                        end;
                    end;
                    return v4.resolve({
                        Input = v21, 
                        InputValid = false, 
                        IssueCondition = v26
                    });
                else
                    for v34, v35 in pairs(v26) do
                        v26[v34] = v35 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                    end;
                    return v5(v20, v21, v22, v24):andThen(function(v36) --[[ Line: 134 ]]
                        -- upvalues: v9 (ref), l_UsernameIssue_0 (ref), v26 (copy), l_IssueCondition_0 (ref), v4 (ref), v21 (ref)
                        local v37 = v36 and v36.responseBody and v36.responseBody.code;
                        local v38 = v9[v37];
                        if v38 then
                            if v38 == l_UsernameIssue_0.ContainsSpaces then
                                v26[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                            elseif v38 ~= l_UsernameIssue_0.None then
                                v26[v38] = l_IssueCondition_0.Problematic;
                            end;
                        else
                            warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v37);
                        end;
                        return v4.resolve({
                            Input = v21, 
                            InputValid = v38 == l_UsernameIssue_0.None, 
                            IssueCondition = v26
                        });
                    end, function(_) --[[ Line: 156 ]]
                        -- upvalues: v4 (ref), v21 (ref), v26 (copy)
                        return v4.resolve({
                            Input = v21, 
                            InputValid = true, 
                            IssueCondition = v26
                        });
                    end);
                end;
            end;
        end;
    end;
    return {
        validateFunction = function(v41, v42, v43, v44) --[[ Line: 167 ]] --[[ Name: validateFunctionRefactor ]]
            -- upvalues: v3 (copy), v4 (copy), v19 (copy), v2 (copy), l_LocalSignUpUsernameValidator_0 (copy), l_IssueCondition_0 (copy), v5 (copy), v9 (copy), l_UsernameIssue_0 (copy)
            v44 = v44 or {};
            local l_birthday_0 = v44.birthday;
            local l_context_0 = v44.context;
            return function(_) --[[ Line: 79 ]]
                -- upvalues: v3 (ref), v42 (copy), l_birthday_0 (copy), v43 (copy), v4 (ref), v19 (ref), v2 (ref), l_LocalSignUpUsernameValidator_0 (ref), l_IssueCondition_0 (ref), v5 (ref), v41 (copy), l_context_0 (copy), v9 (ref), l_UsernameIssue_0 (ref)
                v3.isType(v42, "string", "username passed into UsernameValidator.validateFunction");
                v3.isType(l_birthday_0, "string", "birthday passed into UsernameValidator.validateFunction");
                v3.isType(v43, "table", "previousIssues passed into UsernameValidator.validateFunction");
                if v42 == "" then
                    return v4.resolve({
                        Input = v42, 
                        InputValid = false, 
                        IssueCondition = v19(v43)
                    });
                else
                    local v48 = v2.Dictionary.join(v43);
                    local v49 = l_LocalSignUpUsernameValidator_0:locallyValidateUsername(v42);
                    local v50 = false;
                    for _, v52 in pairs(v49) do
                        if v52 then
                            v50 = true;
                            break;
                        end;
                    end;
                    if v50 then
                        for v53, v54 in pairs(v43) do
                            local v55 = v49[v53];
                            if v54 == l_IssueCondition_0.Hidden and v55 then
                                v48[v53] = l_IssueCondition_0.Problematic;
                            elseif v54 ~= l_IssueCondition_0.Hidden then
                                v48[v53] = v55 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                            end;
                        end;
                        return v4.resolve({
                            Input = v42, 
                            InputValid = false, 
                            IssueCondition = v48
                        });
                    else
                        for v56, v57 in pairs(v48) do
                            v48[v56] = v57 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                        end;
                        return v5(v41, v42, l_birthday_0, l_context_0):andThen(function(v58) --[[ Line: 134 ]]
                            -- upvalues: v9 (ref), l_UsernameIssue_0 (ref), v48 (copy), l_IssueCondition_0 (ref), v4 (ref), v42 (ref)
                            local v59 = v58 and v58.responseBody and v58.responseBody.code;
                            local v60 = v9[v59];
                            if v60 then
                                if v60 == l_UsernameIssue_0.ContainsSpaces then
                                    v48[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                                elseif v60 ~= l_UsernameIssue_0.None then
                                    v48[v60] = l_IssueCondition_0.Problematic;
                                end;
                            else
                                warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v59);
                            end;
                            return v4.resolve({
                                Input = v42, 
                                InputValid = v60 == l_UsernameIssue_0.None, 
                                IssueCondition = v48
                            });
                        end, function(_) --[[ Line: 156 ]]
                            -- upvalues: v4 (ref), v42 (ref), v48 (copy)
                            return v4.resolve({
                                Input = v42, 
                                InputValid = true, 
                                IssueCondition = v48
                            });
                        end);
                    end;
                end;
            end;
        end, 
        getIssueMessageList = v11, 
        getDefaultIssues = v14
    };
end;