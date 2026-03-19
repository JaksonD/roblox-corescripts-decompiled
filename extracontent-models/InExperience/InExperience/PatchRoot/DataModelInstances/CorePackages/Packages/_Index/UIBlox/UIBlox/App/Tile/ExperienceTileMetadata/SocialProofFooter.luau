local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_1.Indicator.StatGroup);
local v5 = require(l_Parent_0.FooterFrame);
return function(v6) --[[ Line: 19 ]] --[[ Name: SocialProofFooter ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    return v3.createElement(v5, v6, {
        Stats = v3.createElement(v4, {
            ratingText = v6.ratingText, 
            playingText = v6.playingText
        })
    });
end;