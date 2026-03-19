local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Button_0 = v3.Button;
local l_InputSize_0 = v3.Enums.InputSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local v12 = {
    x = "icons/brands/x", 
    facebook = "icons/brands/facebook", 
    youtube = "icons/brands/youtube", 
    twitch = "icons/brands/twitch", 
    guilded = "icons/brands/guilded"
};
local v13 = {
    "facebook", 
    "x", 
    "youtube", 
    "twitch", 
    "guilded"
};
return function(v14) --[[ Line: 44 ]] --[[ Name: SocialLinks ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v13 (copy), v2 (copy), l_Button_0 (copy), v12 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v15 = l_useLocalization_0({
        socialLinks = v5.SocialLinks, 
        noSocialLink = v5.NoSocialLink
    });
    local v16 = {};
    if v14.socialLinks then
        for v17, v18 in ipairs(v13) do
            local v19 = v14.socialLinks[v18];
            if v19 and v19.target then
                v16[v18] = v2.createElement(l_Button_0, {
                    LayoutOrder = v17, 
                    Selectable = false, 
                    tag = "auto-y size-full-0 padding-left-small padding-right-small no-hover", 
                    text = v19.target, 
                    icon = v12[v18], 
                    size = l_InputSize_0.Small, 
                    variant = l_ButtonVariant_0.Utility, 
                    onActivated = function() --[[ Line: 60 ]] --[[ Name: onActivated ]]

                    end
                });
            end;
        end;
    end;
    return v2.createElement(l_View_0, {
        LayoutOrder = v14.layoutOrder, 
        tag = "col size-full-0 auto-y gap-small align-x-left"
    }, {
        SocialLinksTitle = v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            tag = "auto-y size-full-0 text-align-x-left text-heading-small", 
            Text = v15.socialLinks
        }), 
        LinksContainer = if v14.socialLinks then v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row wrap size-full-0 auto-xy gap-small align-x-left"
        }, v16) else v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            tag = "auto-y size-full-0 text-align-x-left text-body-medium", 
            Text = v15.noSocialLink
        })
    });
end;