local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = script.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.ControlStateEvent);
local _ = require(l_Parent_0.StateTable.StateTable);
return {
    Initialize = {
        Idle = {
            nextState = v2.Default
        }, 
        Enabled = {
            nextState = v2.Default
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    Default = {
        PrimaryPressed = {
            nextState = v2.Pressed
        }, 
        PointerHover = {
            nextState = v2.Hover
        }, 
        SelectionGained = {
            nextState = v2.Selected
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    Hover = {
        SelectionGained = {
            nextState = v2.Selected
        }, 
        PrimaryPressed = {
            nextState = v2.Pressed
        }, 
        PointerHoverEnd = {
            nextState = v2.Default
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    Pressed = {
        SelectionGained = {
            nextState = v2.SelectedPressed
        }, 
        PrimaryReleasedHover = {
            nextState = v2.Hover
        }, 
        PrimaryReleased = {
            nextState = v2.Default
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    Selected = {
        SelectionLost = {
            nextState = v2.Default
        }, 
        PrimaryPressed = {
            nextState = v2.SelectedPressed
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    SelectedPressed = {
        SelectionLost = {
            nextState = v2.Default
        }, 
        PrimaryReleasedHover = {
            nextState = v2.Selected
        }, 
        PrimaryReleased = {
            nextState = v2.Selected
        }, 
        Disabled = {
            nextState = v2.Disabled
        }
    }, 
    Disabled = {
        Enabled = {
            nextState = v2.Default
        }
    }
};