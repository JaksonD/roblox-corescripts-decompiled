local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AuthCommon);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Enums.ConfirmPasswordIssue);
local l_IssueCondition_0 = v2.Enums.IssueCondition;
local v6 = {
    [v4.PasswordsNotMatch] = "Authentication.AccountRecovery.MessagePasswordsDoNotMatch"
};
local function v7() --[[ Line: 14 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v6 (copy)
    return v6;
end;
local function v10() --[[ Line: 18 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v6 (copy), l_IssueCondition_0 (copy)
    local v8 = {};
    for v9 in pairs(v6) do
        v8[v9] = l_IssueCondition_0.Problematic;
    end;
    return v8;
end;
local _ = function(v11, v12) --[[ Line: 28 ]] --[[ Name: validateFunctionHelper ]]
    -- upvalues: v4 (copy), l_IssueCondition_0 (copy), v3 (copy)
    return function(_) --[[ Line: 29 ]]
        -- upvalues: v4 (ref), l_IssueCondition_0 (ref), v11 (copy), v12 (copy), v3 (ref)
        local v14 = {
            [v4.PasswordsNotMatch] = l_IssueCondition_0.Resolved
        };
        if v11 == nil or v12 == nil or v11 == "" or v12 == "" or string.match(v12, "%S") == nil then
            for v15 in pairs(v14) do
                if v14[v15] == l_IssueCondition_0.Resolved then
                    v14[v15] = l_IssueCondition_0.Problematic;
                end;
            end;
            return v3.resolve({
                Input = v12, 
                InputValid = false, 
                IssueCondition = v14
            });
        else
            local v16 = {
                Input = v12
            };
            if v12 ~= v11 then
                v14[v4.PasswordsNotMatch] = l_IssueCondition_0.Problematic;
            end;
            v16.InputValid = v12 == v11;
            v16.IssueCondition = v14;
            return v3.resolve(v16);
        end;
    end;
end;
return {
    validateFunction = function(_, v19, _, v21) --[[ Line: 65 ]] --[[ Name: validateFunction ]]
        -- upvalues: v4 (copy), l_IssueCondition_0 (copy), v3 (copy)
        local l_password_0 = (v21 or {}).password;
        return function(_) --[[ Line: 29 ]]
            -- upvalues: v4 (ref), l_IssueCondition_0 (ref), l_password_0 (copy), v19 (copy), v3 (ref)
            local v24 = {
                [v4.PasswordsNotMatch] = l_IssueCondition_0.Resolved
            };
            if l_password_0 == nil or v19 == nil or l_password_0 == "" or v19 == "" or string.match(v19, "%S") == nil then
                for v25 in pairs(v24) do
                    if v24[v25] == l_IssueCondition_0.Resolved then
                        v24[v25] = l_IssueCondition_0.Problematic;
                    end;
                end;
                return v3.resolve({
                    Input = v19, 
                    InputValid = false, 
                    IssueCondition = v24
                });
            else
                local v26 = {
                    Input = v19
                };
                if v19 ~= l_password_0 then
                    v24[v4.PasswordsNotMatch] = l_IssueCondition_0.Problematic;
                end;
                v26.InputValid = v19 == l_password_0;
                v26.IssueCondition = v24;
                return v3.resolve(v26);
            end;
        end;
    end, 
    getIssueMessageList = v7, 
    getDefaultIssues = v10
};