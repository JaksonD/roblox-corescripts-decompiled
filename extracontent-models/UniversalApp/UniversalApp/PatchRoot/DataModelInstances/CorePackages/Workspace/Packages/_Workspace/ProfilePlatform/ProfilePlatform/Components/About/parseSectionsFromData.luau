local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(script.Parent.Sections);
local l_AboutDescription_0 = v4.AboutDescription;
local l_SocialLinks_0 = v4.SocialLinks;
local l_NameHistory_0 = v4.NameHistory;
local l_JoinYear_0 = v4.JoinYear;
local v9 = {
    Description = "description", 
    SocialLinks = "socialLinks", 
    NameHistory = "nameHistory", 
    JoinDateTime = "joinDateTime"
};
local v10 = {
    [v9.Description] = l_AboutDescription_0, 
    [v9.SocialLinks] = l_SocialLinks_0, 
    [v9.NameHistory] = l_NameHistory_0, 
    [v9.JoinDateTime] = l_JoinYear_0
};
local v11 = {
    v9.Description, 
    v9.SocialLinks, 
    v9.NameHistory, 
    v9.JoinDateTime
};
local v12 = {
    v9.Description
};
return function(v13, v14, v15) --[[ Line: 37 ]]
    -- upvalues: v3 (copy), v12 (copy), v11 (copy), v10 (copy), v2 (copy)
    local v16 = if v14 == v3.ProfileTypes.Contact then v12 else v11;
    local v17 = {};
    for v18, v19 in ipairs(v16) do
        local v20 = v10[v19];
        local v21 = v13[v19];
        if v20 then
            table.insert(v17, v2.createElement(v20, {
                layoutOrder = v18, 
                [v19] = v21, 
                name = v15
            }));
        end;
    end;
    return v17;
end;