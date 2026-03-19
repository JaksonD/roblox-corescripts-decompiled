local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v5 = require(script.Parent.isCompactUpsellBanner);
local l_ShieldCheck_0 = v2.Enums.IconName.ShieldCheck;
local l_SpeechBubbleAlignCenter_0 = v2.Enums.IconName.SpeechBubbleAlignCenter;
local function _(v8) --[[ Line: 16 ]] --[[ Name: getBannerIcon ]]
    -- upvalues: v4 (copy), v5 (copy), l_ShieldCheck_0 (copy), l_SpeechBubbleAlignCenter_0 (copy)
    if v8.image then
        return nil;
    elseif v8.icon then
        return v8.icon;
    elseif v8.type == v4.FacialAgeEstimation then
        if v5(v8) then
            return l_ShieldCheck_0;
        else
            return l_SpeechBubbleAlignCenter_0;
        end;
    elseif v8.type == v4.ConversationFacialAgeEstimation then
        return nil;
    else
        return nil;
    end;
end;
return function(v10) --[[ Line: 32 ]]
    -- upvalues: v4 (copy), v5 (copy), l_ShieldCheck_0 (copy), l_SpeechBubbleAlignCenter_0 (copy)
    v10.icon = if v10.image then nil else if v10.icon then v10.icon else if v10.type == v4.FacialAgeEstimation then if v5(v10) then l_ShieldCheck_0 else l_SpeechBubbleAlignCenter_0 else if v10.type == v4.ConversationFacialAgeEstimation then nil else nil;
    return v10;
end;