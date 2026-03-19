local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v1 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
return {
    MIN_TRACK_DETAILS_WIDTH = 48 / v1.ICON_CELL_WIDTH, 
    MAX_TRACK_DETAILS_WIDTH = 78 / v1.ICON_CELL_WIDTH, 
    MUSIC_WINDOW_MAX_SIZE = Vector2.new(400, 80), 
    AUDIO_REPORTING_WINDOW_MIN_HEIGHT = 420
};