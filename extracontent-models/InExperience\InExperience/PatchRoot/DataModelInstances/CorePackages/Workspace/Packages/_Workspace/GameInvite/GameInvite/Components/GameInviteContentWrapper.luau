local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Context_0.GameInviteContextProvider);
local v6 = require(l_Components_0.GameInviteContent);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local l_FFlagHideCloseButtonEdp_0 = require(l_Parent_0.SharedFlags).FFlagHideCloseButtonEdp;
return function(v9) --[[ Line: 23 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), l_FFlagHideCloseButtonEdp_0 (copy)
    return v4.createElement(v5, {
        options = v9.options, 
        serverType = v9.serverType, 
        gameDetails = v9.gameDetails, 
        isLoadingCustomParams = v9.isLoading, 
        isCoreScript = v9.isCoreScript
    }, {
        GameInviteContent = v4.createElement(v6, {
            isLoadingCustomParams = v9.isLoading, 
            disableSelectionParentManagement = v9.disableSelectionParentManagement, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v9.hideCloseButton else nil
        })
    });
end;