local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getDeepValue_0 = require(l_Parent_0.SocialCommon).Utils.getDeepValue;
local v3 = require(script.Parent.createCommonSocialUpsellBannerConfig);
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v7 = {
    OpenFaeUpsell = v5.UPSELL_BUTTON_ACTION.Primary, 
    OpenFaeViewDetails = v5.UPSELL_BUTTON_ACTION.Secondary, 
    Dismiss = v5.UPSELL_BUTTON_ACTION.Dismiss
};
local v8 = {
    Fae = v6.FacialAgeEstimation
};
local function _(v9) --[[ Line: 60 ]] --[[ Name: getButtonAction ]]
    -- upvalues: v7 (copy)
    if v9.action and v9.action.type then
        return v7[v9.action.type];
    else
        return nil;
    end;
end;
return function(v11) --[[ Line: 67 ]]
    -- upvalues: v8 (copy), v6 (copy), v5 (copy), v7 (copy), v3 (copy), l_getDeepValue_0 (copy)
    local v12 = v8[v11.upsellCardType] or v6.Unknown;
    local l_upsellCardV2Config_0 = v11.upsellCardV2Config;
    local v14 = {};
    local v15 = {};
    if l_upsellCardV2Config_0.label_items then
        for _, v17 in l_upsellCardV2Config_0.label_items do
            if v17.type == "Countdown" and v17.metadata and v17.metadata.countdown_text then
                table.insert(v14, {
                    type = v5.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN, 
                    text = v17.metadata.countdown_text
                });
            end;
        end;
    end;
    if l_upsellCardV2Config_0.buttons then
        for _, v19 in l_upsellCardV2Config_0.buttons do
            local v20 = if v19.action and v19.action.type then v7[v19.action.type] else nil;
            if v20 then
                table.insert(v15, {
                    text = v19.text, 
                    action = v20
                });
            end;
        end;
    end;
    return v3({
        type = v12, 
        title = l_getDeepValue_0(l_upsellCardV2Config_0, "header.text"), 
        body = l_getDeepValue_0(l_upsellCardV2Config_0, "body.text"), 
        image = l_getDeepValue_0(l_upsellCardV2Config_0, "image"), 
        isDismissable = l_getDeepValue_0(l_upsellCardV2Config_0, "dismissable"), 
        labelItems = v14, 
        buttons = v15
    });
end;