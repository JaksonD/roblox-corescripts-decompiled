local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local v1 = require(l_script_FirstAncestor_0.Resources.GameSettingsConstants);
return {
    GAMESETTINGS = {
        PAGE_ID = "gamesettings", 
        TAB_HEADER = {
            NAME = "GameSettingsTab", 
            TEXT = "Settings", 
            ICON = "icons/common/settings"
        }, 
        LAYOUT_ORDER = v1.SETTINGS_MENU_LAYOUT_ORDER
    }
};