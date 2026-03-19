local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.Messages.AvatarsUnsupportedMessage);
local v5 = require(l_script_FirstAncestor_0.Components.Messages.PendingAvatarSwitchMessage);
local v6 = require(l_script_FirstAncestor_0.Components.OutfitsGrid.OutfitsGridContainer);
return function() --[[ Line: 17 ]] --[[ Name: OutfitsGridWithMessage ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    return (v2.createElement(v3.View, {
        tag = "size-full-full col gap-large"
    }, {
        AvatarsUnsupportedMessage = v2.createElement(v4, {
            LayoutOrder = 1
        }), 
        PendingAvatarSwitchMessage = v2.createElement(v5, {
            LayoutOrder = 2
        }), 
        GridContainer = v2.createElement(v3.View, {
            tag = "size-full-0 grow", 
            LayoutOrder = 3
        }, {
            OutfitsGridContainer = v2.createElement(v6)
        })
    }));
end;