local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
return {
    ELEVATION_LAYERS = {
        [v1.Popover] = {
            start = 4, 
            finish = 99, 
            step = 1
        }, 
        [v1.Drawer] = {
            start = 100, 
            finish = 199, 
            step = 10
        }, 
        [v1.Sheet] = {
            start = 200, 
            finish = 299, 
            step = 10
        }, 
        [v1.Dialog] = {
            start = 300, 
            finish = 399, 
            step = 10
        }, 
        [v1.Notification] = {
            start = 400, 
            finish = 499, 
            step = 1
        }
    }
};