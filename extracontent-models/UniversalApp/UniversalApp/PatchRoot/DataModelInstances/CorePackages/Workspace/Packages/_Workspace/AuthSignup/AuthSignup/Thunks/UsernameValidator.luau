local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AuthCommon);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Promise);
local l_UsernameIssue_0 = v2.Enums.UsernameIssue;
local l_IssueCondition_0 = v2.Enums.IssueCondition;
local l_PostUsernameValid_0 = v2.Http.Requests.PostUsernameValid;
local v9 = require(l_script_FirstAncestor_0.Util.LocalSignUpUsernameValidator);
local l_GetFFlagFixUsernameValidationAlreadyInUse_0 = require(l_Parent_0.SharedFlags).GetFFlagFixUsernameValidationAlreadyInUse;
local v11 = {
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
local v12 = {
    [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
    [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
    [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
    [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
    [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
    [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
};
local function v13() --[[ Line: 40 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v12 (copy)
    return v12;
end;
local function v16() --[[ Line: 44 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v12 (copy), l_UsernameIssue_0 (copy), l_IssueCondition_0 (copy)
    local v14 = {};
    for v15 in pairs(v12) do
        if v15 == l_UsernameIssue_0.ContainsInvalidCharacter or v15 == l_UsernameIssue_0.LengthTooShortOrTooLong or v15 == l_UsernameIssue_0.AlreadyInUse then
            v14[v15] = l_IssueCondition_0.Problematic;
        else
            v14[v15] = l_IssueCondition_0.Hidden;
        end;
    end;
    return v14;
end;
local function v21(v17) --[[ Line: 62 ]] --[[ Name: resetNonHiddenIssuesToProblematic ]]
    -- upvalues: v3 (copy), l_IssueCondition_0 (copy)
    local v18 = v3.Dictionary.join(v17);
    for v19, v20 in pairs(v18) do
        if v20 ~= l_IssueCondition_0.Hidden then
            v18[v19] = l_IssueCondition_0.Problematic;
        end;
    end;
    return v18;
end;
local _ = function(v22, v23, v24, v25, v26) --[[ Line: 74 ]] --[[ Name: validateFunction ]]
    -- upvalues: v4 (copy), v5 (copy), v21 (copy), v3 (copy), v9 (copy), l_IssueCondition_0 (copy), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (copy), l_PostUsernameValid_0 (copy), v11 (copy), l_UsernameIssue_0 (copy)
    return function(_) --[[ Line: 75 ]]
        -- upvalues: v4 (ref), v23 (copy), v24 (copy), v25 (copy), v5 (ref), v21 (ref), v3 (ref), v9 (ref), l_IssueCondition_0 (ref), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (ref), l_PostUsernameValid_0 (ref), v22 (copy), v26 (copy), v11 (ref), l_UsernameIssue_0 (ref)
        v4.isType(v23, "string", "username passed into UsernameValidator.validateFunction");
        v4.isType(v24, "string", "birthday passed into UsernameValidator.validateFunction");
        v4.isType(v25, "table", "previousIssues passed into UsernameValidator.validateFunction");
        if v23 == "" then
            return v5.resolve({
                Input = v23, 
                InputValid = false, 
                IssueCondition = v21(v25)
            });
        else
            local v28 = v3.Dictionary.join(v25);
            local v29 = v9:locallyValidateUsername(v23);
            local v30 = false;
            for _, v32 in pairs(v29) do
                if v32 then
                    v30 = true;
                    break;
                end;
            end;
            if v30 then
                for v33, v34 in pairs(v25) do
                    local v35 = v29[v33];
                    if v34 == l_IssueCondition_0.Hidden and v35 then
                        v28[v33] = l_IssueCondition_0.Problematic;
                    elseif v34 ~= l_IssueCondition_0.Hidden and (not l_GetFFlagFixUsernameValidationAlreadyInUse_0() or v35 ~= nil) then
                        v28[v33] = v35 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                    end;
                end;
                return v5.resolve({
                    Input = v23, 
                    InputValid = false, 
                    IssueCondition = v28
                });
            else
                for v36, v37 in pairs(v28) do
                    v28[v36] = v37 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                end;
                return l_PostUsernameValid_0(v22, v23, v24, v26):andThen(function(v38) --[[ Line: 135 ]]
                    -- upvalues: v11 (ref), l_UsernameIssue_0 (ref), v28 (copy), l_IssueCondition_0 (ref), v5 (ref), v23 (ref)
                    local v39 = v38 and v38.responseBody and v38.responseBody.code;
                    local v40 = v11[v39];
                    if v40 then
                        if v40 == l_UsernameIssue_0.ContainsSpaces then
                            v28[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                        elseif v40 ~= l_UsernameIssue_0.None then
                            v28[v40] = l_IssueCondition_0.Problematic;
                        end;
                    else
                        warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v39);
                    end;
                    return v5.resolve({
                        Input = v23, 
                        InputValid = v40 == l_UsernameIssue_0.None, 
                        IssueCondition = v28
                    });
                end, function(_) --[[ Line: 157 ]]
                    -- upvalues: v5 (ref), v23 (ref), v28 (copy)
                    return v5.resolve({
                        Input = v23, 
                        InputValid = true, 
                        IssueCondition = v28
                    });
                end);
            end;
        end;
    end;
end;
return {
    validateFunction = function(v43, v44, v45, v46) --[[ Line: 168 ]] --[[ Name: validateFunctionRefactor ]]
        -- upvalues: v4 (copy), v5 (copy), v21 (copy), v3 (copy), v9 (copy), l_IssueCondition_0 (copy), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (copy), l_PostUsernameValid_0 (copy), v11 (copy), l_UsernameIssue_0 (copy)
        v46 = v46 or {};
        local l_birthday_0 = v46.birthday;
        local l_context_0 = v46.context;
        return function(_) --[[ Line: 75 ]]
            -- upvalues: v4 (ref), v44 (copy), l_birthday_0 (copy), v45 (copy), v5 (ref), v21 (ref), v3 (ref), v9 (ref), l_IssueCondition_0 (ref), l_GetFFlagFixUsernameValidationAlreadyInUse_0 (ref), l_PostUsernameValid_0 (ref), v43 (copy), l_context_0 (copy), v11 (ref), l_UsernameIssue_0 (ref)
            v4.isType(v44, "string", "username passed into UsernameValidator.validateFunction");
            v4.isType(l_birthday_0, "string", "birthday passed into UsernameValidator.validateFunction");
            v4.isType(v45, "table", "previousIssues passed into UsernameValidator.validateFunction");
            if v44 == "" then
                return v5.resolve({
                    Input = v44, 
                    InputValid = false, 
                    IssueCondition = v21(v45)
                });
            else
                local v50 = v3.Dictionary.join(v45);
                local v51 = v9:locallyValidateUsername(v44);
                local v52 = false;
                for _, v54 in pairs(v51) do
                    if v54 then
                        v52 = true;
                        break;
                    end;
                end;
                if v52 then
                    for v55, v56 in pairs(v45) do
                        local v57 = v51[v55];
                        if v56 == l_IssueCondition_0.Hidden and v57 then
                            v50[v55] = l_IssueCondition_0.Problematic;
                        elseif v56 ~= l_IssueCondition_0.Hidden and (not l_GetFFlagFixUsernameValidationAlreadyInUse_0() or v57 ~= nil) then
                            v50[v55] = v57 == false and l_IssueCondition_0.Resolved or l_IssueCondition_0.Problematic;
                        end;
                    end;
                    return v5.resolve({
                        Input = v44, 
                        InputValid = false, 
                        IssueCondition = v50
                    });
                else
                    for v58, v59 in pairs(v50) do
                        v50[v58] = v59 == l_IssueCondition_0.Hidden and l_IssueCondition_0.Hidden or l_IssueCondition_0.Resolved;
                    end;
                    return l_PostUsernameValid_0(v43, v44, l_birthday_0, l_context_0):andThen(function(v60) --[[ Line: 135 ]]
                        -- upvalues: v11 (ref), l_UsernameIssue_0 (ref), v50 (copy), l_IssueCondition_0 (ref), v5 (ref), v44 (ref)
                        local v61 = v60 and v60.responseBody and v60.responseBody.code;
                        local v62 = v11[v61];
                        if v62 then
                            if v62 == l_UsernameIssue_0.ContainsSpaces then
                                v50[l_UsernameIssue_0.ContainsInvalidCharacter] = l_IssueCondition_0.Problematic;
                            elseif v62 ~= l_UsernameIssue_0.None then
                                v50[v62] = l_IssueCondition_0.Problematic;
                            end;
                        else
                            warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v61);
                        end;
                        return v5.resolve({
                            Input = v44, 
                            InputValid = v62 == l_UsernameIssue_0.None, 
                            IssueCondition = v50
                        });
                    end, function(_) --[[ Line: 157 ]]
                        -- upvalues: v5 (ref), v44 (ref), v50 (copy)
                        return v5.resolve({
                            Input = v44, 
                            InputValid = true, 
                            IssueCondition = v50
                        });
                    end);
                end;
            end;
        end;
    end, 
    getIssueMessageList = v13, 
    getDefaultIssues = v16
};