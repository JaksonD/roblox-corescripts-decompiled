local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local _ = require(l_Parent_0.AppChatNetworking);
return {
    default = {
        modal_variant = "none", 
        modal_layout = {
            id = "", 
            seen_record_action = "none", 
            dismissed_record_action = "none"
        }
    }
};