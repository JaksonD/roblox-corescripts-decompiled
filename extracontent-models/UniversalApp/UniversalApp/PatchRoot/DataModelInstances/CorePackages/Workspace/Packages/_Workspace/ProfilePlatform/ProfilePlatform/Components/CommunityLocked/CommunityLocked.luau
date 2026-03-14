local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(_) --[[ Line: 13 ]] --[[ Name: CommunityLocked ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v2 (copy), l_Text_0 (copy)
    local v7 = l_useLocalization_0({
        groupLocked = v3.GroupLocked
    });
    return v2.createElement(l_Text_0, {
        Text = v7.groupLocked, 
        tag = "padding-top-xlarge"
    });
end;