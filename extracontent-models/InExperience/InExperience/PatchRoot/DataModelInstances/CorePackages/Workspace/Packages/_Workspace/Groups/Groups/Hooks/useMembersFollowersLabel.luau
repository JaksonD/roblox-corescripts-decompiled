local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v5) --[[ Line: 31 ]] --[[ Name: useMembersFollowersLabel ]]
    -- upvalues: v2 (copy), v4 (copy), l_useLocalization_0 (copy)
    local l_hasSocialModules_0 = v5.hasSocialModules;
    local l_count_0 = v5.count;
    local l_truncatedCount_0 = v5.truncatedCount;
    local v9 = v5.capitalize or false;
    local v11 = v2.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: l_count_0 (copy), l_hasSocialModules_0 (copy), v9 (copy), v4 (ref)
        local v10 = l_count_0 == 1;
        if l_hasSocialModules_0 then
            if v10 then
                if v9 then
                    return v4.LabelMember;
                else
                    return v4.LabelMemberLowerCase;
                end;
            elseif v9 then
                return v4.LabelMemberCapitalPlural;
            else
                return v4.LabelMemberLowerCasePlural;
            end;
        elseif v10 then
            if v9 then
                return v4.LabelFollowerCapital;
            else
                return v4.LabelFollower;
            end;
        elseif v9 then
            return v4.LabelFollowerCapitalPlural;
        else
            return v4.LabelFollowerPlural;
        end;
    end, {
        l_count_0, 
        v9, 
        l_hasSocialModules_0
    });
    local v12 = l_useLocalization_0({
        noun = v11
    });
    return (v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: l_truncatedCount_0 (copy), l_count_0 (copy), v12 (copy)
        return (("%* %*"):format(if l_truncatedCount_0 and l_truncatedCount_0 ~= "" then l_truncatedCount_0 else tostring(l_count_0), v12.noun));
    end, {
        l_truncatedCount_0, 
        l_count_0, 
        v12.noun
    }));
end;