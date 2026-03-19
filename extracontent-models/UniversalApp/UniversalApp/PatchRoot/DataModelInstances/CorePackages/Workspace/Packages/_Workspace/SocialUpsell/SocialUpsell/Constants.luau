local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local _ = require(l_script_FirstAncestor_0.Types);
return {
    UPSELL_BUTTON_ACTION = {
        Primary = "Primary", 
        Secondary = "Secondary", 
        Dismiss = "Dismiss"
    }, 
    UPSELL_OVERLAY_BUTTON_ACTION = {
        Primary = "Primary", 
        Dismiss = "Dismiss"
    }, 
    UPSELL_LABEL_ITEM_TYPE_COUNTDOWN = "countdown", 
    DEFAULT_FAE_ENTRY_POINT_EVENT_CTX = "CommsFae", 
    OVERLAY_TYPES = {
        SocialUpsell = "SocialUpsell"
    }, 
    OVERLAY_MENU_NAME = "SocialUpsell", 
    OVERLAY_CORE_ACTION_NAME = "SocialUpsell"
};