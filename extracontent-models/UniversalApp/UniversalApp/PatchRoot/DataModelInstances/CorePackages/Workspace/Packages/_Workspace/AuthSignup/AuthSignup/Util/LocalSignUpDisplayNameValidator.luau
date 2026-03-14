local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.AuthCommon);
local v2 = require(l_Parent_0.ArgCheck);
local l_UsernameIssue_0 = v1.Enums.UsernameIssue;
return {
    isLengthTooShortOrTooLong = function(v4) --[[ Line: 10 ]] --[[ Name: isLengthTooShortOrTooLong ]]
        -- upvalues: v2 (copy)
        v2.isType(v4, "string", "displayName passed into isLengthTooShortOrTooLong");
        local v5 = string.len(v4);
        local v6 = true;
        if v5 >= 3 then
            v6 = v5 > 20;
        end;
        return v6;
    end, 
    hasBoundingUnderscore = function(v7) --[[ Line: 17 ]] --[[ Name: hasBoundingUnderscore ]]
        -- upvalues: v2 (copy)
        v2.isType(v7, "string", "displayName passed into hasBoundingUnderscore");
        local v8 = true;
        if string.sub(v7, 1, 1) ~= "_" then
            v8 = string.sub(v7, -1) == "_";
        end;
        return v8;
    end, 
    hasMultipleUnderscores = function(v9) --[[ Line: 23 ]] --[[ Name: hasMultipleUnderscores ]]
        -- upvalues: v2 (copy)
        v2.isType(v9, "string", "displayName passed into hasMultipleUnderscores");
        local _, v11 = string.gsub(v9, "_", "");
        return v11 > 1;
    end, 
    containsInvalidCharacter = function(v12) --[[ Line: 30 ]] --[[ Name: containsInvalidCharacter ]]
        -- upvalues: v2 (copy)
        v2.isType(v12, "string", "displayName passed into containsInvalidCharacter");
        return utf8.len(v12) == nil;
    end, 
    locallyValidateDisplayName = function(v13, v14) --[[ Line: 35 ]] --[[ Name: locallyValidateDisplayName ]]
        -- upvalues: v2 (copy), l_UsernameIssue_0 (copy)
        v2.isType(v14, "string", "username passed into locallyValidateDisplayName");
        return {
            [l_UsernameIssue_0.LengthTooShortOrTooLong] = v13.isLengthTooShortOrTooLong(v14), 
            [l_UsernameIssue_0.BoundingUnderscore] = v13.hasBoundingUnderscore(v14), 
            [l_UsernameIssue_0.MultipleUnderscores] = v13.hasMultipleUnderscores(v14), 
            [l_UsernameIssue_0.ContainsInvalidCharacter] = v13.containsInvalidCharacter(v14)
        };
    end
};