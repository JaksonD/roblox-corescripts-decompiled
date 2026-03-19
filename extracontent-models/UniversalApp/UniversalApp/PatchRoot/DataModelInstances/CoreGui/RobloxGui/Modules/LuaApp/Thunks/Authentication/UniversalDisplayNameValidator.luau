local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetDisplayNamesValid);
local v6 = game:DefineFastInt("FIntDisplayNameMaxLength", 20);
local v7 = game:DefineFastInt("FIntDisplayNameMinLength", 3);
local l_IssueCondition_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.IssueCondition;
local v9 = {
    ContainsInvalidCharacter = "ContainsInvalidCharacter", 
    Inappropriate = "Inappropriate", 
    LengthTooShortOrTooLong = "LengthTooShortOrTooLong", 
    MixedCharactersError = "MixedCharactersError", 
    None = "None", 
    TooManyCharacterSets = "TooManyCharacterSets", 
    ValidationFailed = "ValidationFailed"
};
local v10 = {
    [0] = v9.None, 
    [1] = v9.LengthTooShortOrTooLong, 
    [2] = v9.LengthTooShortOrTooLong, 
    [3] = v9.ContainsInvalidCharacter, 
    [4] = v9.Inappropriate, 
    [5] = v9.ValidationFailed, 
    [8] = v9.TooManyCharacterSets
};
local v11 = {
    [v9.ContainsInvalidCharacter] = "Feature.DisplayName.Label.ValidCharacters", 
    [v9.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [v9.MixedCharactersError] = "Feature.DisplayName.Label.MixedCharactersError", 
    [v9.Inappropriate] = "Feature.DisplayName.Label.ModeratedCheck", 
    [v9.ValidationFailed] = "Feature.DisplayName.Label.ValidationFailed"
};
local v12 = {
    [v9.LengthTooShortOrTooLong] = true, 
    [v9.ContainsInvalidCharacter] = true
};
local function v16() --[[ Line: 48 ]]
    -- upvalues: v11 (copy), v12 (copy), l_IssueCondition_0 (copy)
    local v13 = {};
    for v14, _ in v11 do
        if not v12[v14] then
            v13[v14] = l_IssueCondition_0.Hidden;
        end;
    end;
    return v13;
end;
isValidLength = function(v17) --[[ Line: 59 ]] --[[ Name: isValidLength ]]
    -- upvalues: v7 (copy), v6 (copy)
    local v18 = string.len(v17);
    local v19 = true;
    if v18 >= v7 then
        v19 = v6 < v18;
    end;
    return v19;
end;
locallyValidateDisplayName = function(v20) --[[ Line: 64 ]] --[[ Name: locallyValidateDisplayName ]]
    -- upvalues: v9 (copy), l_IssueCondition_0 (copy)
    local v21 = {
        [v9.LengthTooShortOrTooLong] = if isValidLength(v20) then l_IssueCondition_0.Problematic else l_IssueCondition_0.Resolved
    };
    return isValidLength(v20), v21;
end;
return {
    validateFunction = function(v22, v23, v24, v25) --[[ Line: 91 ]] --[[ Name: validateFunction ]]
        -- upvalues: v16 (copy), v9 (copy), l_IssueCondition_0 (copy), v3 (copy), v12 (copy), v4 (copy), v5 (copy), l_HttpService_0 (copy), v10 (copy)
        return function(_) --[[ Line: 100 ]]
            -- upvalues: v16 (ref), v23 (copy), v24 (copy), v9 (ref), l_IssueCondition_0 (ref), v3 (ref), v12 (ref), v4 (ref), v5 (ref), v22 (copy), v25 (copy), l_HttpService_0 (ref), v10 (ref)
            local v27 = v16();
            if v23 == "" then
                if v24[v9.ValidationFailed] == l_IssueCondition_0.Problematic then
                    return v3.resolve({
                        Input = v23, 
                        InputValid = false, 
                        IssueCondition = v24, 
                        hasRequestFailed = true
                    });
                else
                    return v3.resolve({
                        Input = v23, 
                        InputValid = false, 
                        IssueCondition = v27
                    });
                end;
            else
                local v28 = {};
                for v29 in v12 do
                    v28[v29] = l_IssueCondition_0.Resolved;
                end;
                local v30 = v4.Dictionary.join(v27, v28);
                local v31, v32 = locallyValidateDisplayName(v23);
                if v31 then
                    if v24[v9.ValidationFailed] == l_IssueCondition_0.Problematic then
                        return v3.resolve({
                            Input = v23, 
                            InputValid = false, 
                            IssueCondition = v24, 
                            hasRequestFailed = true
                        });
                    else
                        return v3.resolve({
                            Input = v23, 
                            InputValid = false, 
                            IssueCondition = v4.Dictionary.join(v30, v32)
                        });
                    end;
                else
                    return v5(v22, v23, v25.birthday):andThen(function() --[[ Line: 143 ]]
                        -- upvalues: v3 (ref), v23 (ref), v30 (copy)
                        return v3.resolve({
                            Input = v23, 
                            InputValid = true, 
                            IssueCondition = v30, 
                            hasRequestFailed = false
                        });
                    end, function(v33) --[[ Line: 150 ]]
                        -- upvalues: l_HttpService_0 (ref), v30 (copy), v4 (ref), v10 (ref), l_IssueCondition_0 (ref), v3 (ref), v23 (ref), v9 (ref)
                        if v33 and v33.StatusCode == 400 then
                            local v34 = if v33 and v33.Body then l_HttpService_0:JSONDecode(v33.Body) else nil;
                            local v35 = if v34 and v34.errors then v34.errors else {};
                            local l_v30_0 = v30;
                            v4.List.map(v35, function(v37) --[[ Line: 157 ]]
                                -- upvalues: v10 (ref), l_v30_0 (copy), l_IssueCondition_0 (ref)
                                l_v30_0[v10[v37.code]] = l_IssueCondition_0.Problematic;
                            end);
                            return v3.resolve({
                                Input = v23, 
                                InputValid = false, 
                                IssueCondition = l_v30_0, 
                                hasRequestFailed = false
                            });
                        else
                            local v38 = {};
                            for v39 in pairs(v30) do
                                v38[v39] = l_IssueCondition_0.Hidden;
                            end;
                            v38[v9.ValidationFailed] = l_IssueCondition_0.Problematic;
                            return v3.resolve({
                                Input = v23, 
                                InputValid = false, 
                                IssueCondition = v38, 
                                hasRequestFailed = true
                            });
                        end;
                    end);
                end;
            end;
        end;
    end, 
    getIssueMessageList = function() --[[ Line: 74 ]] --[[ Name: getIssueMessageList ]]
        -- upvalues: v11 (copy)
        return v11;
    end, 
    getDefaultIssues = function() --[[ Line: 78 ]] --[[ Name: getDefaultIssues ]]
        -- upvalues: v11 (copy), v12 (copy), l_IssueCondition_0 (copy)
        local v40 = {};
        for v41 in pairs(v11) do
            if v12[v41] then
                v40[v41] = l_IssueCondition_0.Problematic;
            else
                v40[v41] = l_IssueCondition_0.Hidden;
            end;
        end;
        return v40;
    end
};