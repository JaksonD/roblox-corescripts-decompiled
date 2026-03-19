local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AuthCommon);
local l_isStringEmail_0 = v2.Utils.isStringEmail;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Enums.EmailIssue);
local l_IssueCondition_0 = v2.Enums.IssueCondition;
local v7 = {
    [v5.InvalidEmail] = "Authentication.AccountRecovery.Message.Error.InvalidEmail"
};
local function v8() --[[ Line: 15 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v7 (copy)
    return v7;
end;
local function v11() --[[ Line: 19 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v7 (copy), l_IssueCondition_0 (copy)
    local v9 = {};
    for v10 in pairs(v7) do
        v9[v10] = l_IssueCondition_0.Problematic;
    end;
    return v9;
end;
local _ = function(v12) --[[ Line: 29 ]] --[[ Name: validateFunctionHelper ]]
    -- upvalues: v5 (copy), l_IssueCondition_0 (copy), v4 (copy), l_isStringEmail_0 (copy)
    return function(_) --[[ Line: 30 ]]
        -- upvalues: v5 (ref), l_IssueCondition_0 (ref), v12 (copy), v4 (ref), l_isStringEmail_0 (ref)
        local v14 = {
            [v5.InvalidEmail] = l_IssueCondition_0.Resolved
        };
        if v12 == nil or v12 == "" or string.match(v12, "%S") == nil then
            for v15 in pairs(v14) do
                if v14[v15] == l_IssueCondition_0.Resolved then
                    v14[v15] = l_IssueCondition_0.Problematic;
                end;
            end;
            return v4.resolve({
                Input = v12, 
                InputValid = false, 
                IssueCondition = v14
            });
        else
            local v16 = {
                Input = v12
            };
            if not l_isStringEmail_0(v12) then
                v14[v5.InvalidEmail] = l_IssueCondition_0.Problematic;
            end;
            v16.InputValid = l_isStringEmail_0(v12);
            v16.IssueCondition = v14;
            return v4.resolve(v16);
        end;
    end;
end;
return {
    validateFunction = function(_, v19, _, _) --[[ Line: 60 ]] --[[ Name: validateFunction ]]
        -- upvalues: v5 (copy), l_IssueCondition_0 (copy), v4 (copy), l_isStringEmail_0 (copy)
        return function(_) --[[ Line: 30 ]]
            -- upvalues: v5 (ref), l_IssueCondition_0 (ref), v19 (copy), v4 (ref), l_isStringEmail_0 (ref)
            local v23 = {
                [v5.InvalidEmail] = l_IssueCondition_0.Resolved
            };
            if v19 == nil or v19 == "" or string.match(v19, "%S") == nil then
                for v24 in pairs(v23) do
                    if v23[v24] == l_IssueCondition_0.Resolved then
                        v23[v24] = l_IssueCondition_0.Problematic;
                    end;
                end;
                return v4.resolve({
                    Input = v19, 
                    InputValid = false, 
                    IssueCondition = v23
                });
            else
                local v25 = {
                    Input = v19
                };
                if not l_isStringEmail_0(v19) then
                    v23[v5.InvalidEmail] = l_IssueCondition_0.Problematic;
                end;
                v25.InputValid = l_isStringEmail_0(v19);
                v25.IssueCondition = v23;
                return v4.resolve(v25);
            end;
        end;
    end, 
    getIssueMessageList = v8, 
    getDefaultIssues = v11
};