local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
return function(v3) --[[ Line: 14 ]] --[[ Name: SocialCountsRow ]]
    -- upvalues: v1 (copy), l_HorizontalPageMargin_0 (copy)
    return v1.createElement(l_HorizontalPageMargin_0, {
        backgroundTransparency = 1, 
        layoutOrder = v3.layoutOrder, 
        useAutomaticSizing = true, 
        size = v3.size
    }, v3.children);
end;