local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v6 = require(l_script_FirstAncestor_0.Components.SocialLinks.SocialLinksCarousel);
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_SocialMediaTypes_0 = v7.SocialMediaTypes;
local l_Images_0 = v3.App.ImageSet.Images;
local v11 = {
    [l_SocialMediaTypes_0.Twitter] = l_Images_0["icons/brands/x"], 
    [l_SocialMediaTypes_0.Facebook] = l_Images_0["icons/brands/facebook"], 
    [l_SocialMediaTypes_0.Discord] = l_Images_0["icons/brands/discord"], 
    [l_SocialMediaTypes_0.YouTube] = l_Images_0["icons/brands/youtube"], 
    [l_SocialMediaTypes_0.Twitch] = l_Images_0["icons/brands/twitch"], 
    [l_SocialMediaTypes_0.Guilded] = l_Images_0["icons/brands/guilded"], 
    [l_SocialMediaTypes_0.X] = l_Images_0["icons/brands/x"]
};
return function(v12) --[[ Line: 31 ]]
    -- upvalues: v5 (copy), v7 (copy), l_useLocalization_0 (copy), v8 (copy), v11 (copy), v2 (copy), v6 (copy)
    local v13 = v5(v7.Components.SocialLinks);
    local v14 = l_useLocalization_0({
        facebook = v8.Facebook, 
        twitter = v8.X, 
        youtube = v8.YouTube, 
        twitch = v8.Twitch, 
        guilded = v8.Guilded, 
        discord = v8.Discord, 
        x = v8.X
    });
    local function v21(v15) --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v11 (ref)
        local v16 = {};
        for v17, v18 in pairs(v15) do
            local v19 = v14[v17];
            local v20 = v11[v17];
            if v18 and v20 then
                table.insert(v16, {
                    key = v17, 
                    logo = v11[v17], 
                    url = v18.url, 
                    name = v19
                });
            end;
        end;
        return v16;
    end;
    local v22 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v21 (copy), v13 (copy)
        return (v21(v13));
    end, {
        v13, 
        v14
    });
    if #v22 > 0 then
        return v2.createElement(v6, {
            layoutOrder = v12.layoutOrder, 
            items = v22, 
            title = v12.title
        });
    else
        return v2.None;
    end;
end;