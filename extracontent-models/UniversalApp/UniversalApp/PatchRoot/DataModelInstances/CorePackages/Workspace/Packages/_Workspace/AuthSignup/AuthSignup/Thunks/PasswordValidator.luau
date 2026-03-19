local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.AuthCommon);
local l_PostPasswordValid_0 = v1.Http.Requests.PostPasswordValid;
local v3 = require(l_Parent_0.Promise);
local l_PasswordIssue_0 = v1.Enums.PasswordIssue;
local l_IssueCondition_0 = v1.Enums.IssueCondition;
local l_GetFFlagPasswordErrorLength_0 = require(l_Parent_0.SharedFlags).GetFFlagPasswordErrorLength;
local v7 = {
    [l_PasswordIssue_0.Length] = l_GetFFlagPasswordErrorLength_0() and "Authentication.SignUp.PasswordErrorLength" or "Authentication.SignUp.Label.PasswordError1", 
    [l_PasswordIssue_0.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2", 
    [l_PasswordIssue_0.Simple] = "Authentication.SignUp.Label.PasswordError3"
};
local function v8() --[[ Line: 19 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v7 (copy)
    return v7;
end;
local function v11() --[[ Line: 23 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v7 (copy), l_IssueCondition_0 (copy)
    local v9 = {};
    for v10 in pairs(v7) do
        v9[v10] = l_IssueCondition_0.Problematic;
    end;
    return v9;
end;
local _ = function(v12, v13, v14, v15) --[[ Line: 33 ]] --[[ Name: validateFunction ]]
    -- upvalues: l_PasswordIssue_0 (copy), l_IssueCondition_0 (copy), v3 (copy), l_PostPasswordValid_0 (copy)
    return function(_) --[[ Line: 34 ]]
        -- upvalues: l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v15 (copy), v13 (copy), v14 (copy), v3 (ref), l_PostPasswordValid_0 (ref), v12 (copy)
        local v17 = {
            [l_PasswordIssue_0.Length] = l_IssueCondition_0.Resolved, 
            [l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Resolved, 
            [l_PasswordIssue_0.Simple] = v15[l_PasswordIssue_0.Simple] ~= l_IssueCondition_0.Hidden and l_IssueCondition_0.Resolved or l_IssueCondition_0.Hidden
        };
        if v13 == nil or v14 == nil or v13 == "" or v14 == "" or string.match(v14, "%S") == nil then
            for v18 in pairs(v17) do
                if v17[v18] == l_IssueCondition_0.Resolved then
                    v17[v18] = l_IssueCondition_0.Problematic;
                end;
            end;
            return v3.resolve({
                Input = v14, 
                InputValid = false, 
                IssueCondition = v17
            });
        else
            return l_PostPasswordValid_0(v12, v13, v14):andThen(function(v19) --[[ Line: 63 ]]
                -- upvalues: v17 (copy), l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v14 (ref), v3 (ref)
                local v20 = {};
                local v21 = v19 and v19.responseBody and v19.responseBody.code;
                if type(v21) == "number" then
                    if v21 == 2 then
                        v17[l_PasswordIssue_0.Length] = l_IssueCondition_0.Problematic;
                    elseif v21 == 3 then
                        v17[l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Problematic;
                    elseif v21 == 4 or v21 == 5 then
                        v17[l_PasswordIssue_0.Simple] = l_IssueCondition_0.Problematic;
                    end;
                else
                    warn("JSON failure");
                end;
                v20.Input = v14;
                v20.InputValid = v21 == 0;
                v20.IssueCondition = v17;
                return v3.resolve(v20);
            end, function(_) --[[ Line: 85 ]]
                -- upvalues: v3 (ref), v14 (ref), v17 (copy)
                return v3.resolve({
                    Input = v14, 
                    InputValid = true, 
                    IssueCondition = v17
                });
            end);
        end;
    end;
end;
return {
    validateFunction = function(v24, v25, v26, v27) --[[ Line: 96 ]] --[[ Name: validateFunctionRefactor ]]
        -- upvalues: l_PasswordIssue_0 (copy), l_IssueCondition_0 (copy), v3 (copy), l_PostPasswordValid_0 (copy)
        local l_username_0 = (v27 or {}).username;
        return function(_) --[[ Line: 34 ]]
            -- upvalues: l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v26 (copy), l_username_0 (copy), v25 (copy), v3 (ref), l_PostPasswordValid_0 (ref), v24 (copy)
            local v30 = {
                [l_PasswordIssue_0.Length] = l_IssueCondition_0.Resolved, 
                [l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Resolved, 
                [l_PasswordIssue_0.Simple] = v26[l_PasswordIssue_0.Simple] ~= l_IssueCondition_0.Hidden and l_IssueCondition_0.Resolved or l_IssueCondition_0.Hidden
            };
            if l_username_0 == nil or v25 == nil or l_username_0 == "" or v25 == "" or string.match(v25, "%S") == nil then
                for v31 in pairs(v30) do
                    if v30[v31] == l_IssueCondition_0.Resolved then
                        v30[v31] = l_IssueCondition_0.Problematic;
                    end;
                end;
                return v3.resolve({
                    Input = v25, 
                    InputValid = false, 
                    IssueCondition = v30
                });
            else
                return l_PostPasswordValid_0(v24, l_username_0, v25):andThen(function(v32) --[[ Line: 63 ]]
                    -- upvalues: v30 (copy), l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v25 (ref), v3 (ref)
                    local v33 = {};
                    local v34 = v32 and v32.responseBody and v32.responseBody.code;
                    if type(v34) == "number" then
                        if v34 == 2 then
                            v30[l_PasswordIssue_0.Length] = l_IssueCondition_0.Problematic;
                        elseif v34 == 3 then
                            v30[l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Problematic;
                        elseif v34 == 4 or v34 == 5 then
                            v30[l_PasswordIssue_0.Simple] = l_IssueCondition_0.Problematic;
                        end;
                    else
                        warn("JSON failure");
                    end;
                    v33.Input = v25;
                    v33.InputValid = v34 == 0;
                    v33.IssueCondition = v30;
                    return v3.resolve(v33);
                end, function(_) --[[ Line: 85 ]]
                    -- upvalues: v3 (ref), v25 (ref), v30 (copy)
                    return v3.resolve({
                        Input = v25, 
                        InputValid = true, 
                        IssueCondition = v30
                    });
                end);
            end;
        end;
    end, 
    getIssueMessageList = v8, 
    getDefaultIssues = v11
};