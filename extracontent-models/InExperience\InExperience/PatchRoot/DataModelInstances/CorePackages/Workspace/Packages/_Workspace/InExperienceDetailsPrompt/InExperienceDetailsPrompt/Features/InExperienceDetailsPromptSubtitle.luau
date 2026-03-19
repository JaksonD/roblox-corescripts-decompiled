local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.VerifiedBadges);
local l_Text_0 = require(l_Parent_0.Foundation).Text;
return function(v5) --[[ Line: 16 ]] --[[ Name: InExperienceDetailsPromptSubtitle ]]
    -- upvalues: v1 (copy), v3 (copy), l_Text_0 (copy)
    if v5.creator.hasVerifiedBadge then
        return v1.createElement(v3.EmojiWrapper, {
            emoji = v3.emoji.verified, 
            layoutOrder = v5.layoutOrder
        }, {
            CreatorName = v1.createElement(l_Text_0, {
                Text = v5.creator.name, 
                tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall"
            })
        });
    else
        return v1.createElement(l_Text_0, {
            Text = v5.creator.name, 
            tag = "text-body-large content-default auto-xy text-truncate-split padding-right-xxsmall", 
            LayoutOrder = v5.layoutOrder
        });
    end;
end;