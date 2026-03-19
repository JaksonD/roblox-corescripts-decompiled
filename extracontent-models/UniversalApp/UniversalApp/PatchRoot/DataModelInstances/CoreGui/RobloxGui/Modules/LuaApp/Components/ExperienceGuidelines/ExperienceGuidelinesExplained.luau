local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v3 = require(script.Parent.ExperienceGuidelinesExplainedModal);
return function(v4) --[[ Line: 18 ]] --[[ Name: ExperienceGuidelinesExplained ]]
    -- upvalues: l_useDispatch_0 (copy), v1 (copy), v3 (copy)
    local v5 = l_useDispatch_0();
    return v1.createElement(v3, {
        universeId = v4.universeId, 
        hideCloseButton = v4.hideCloseButton, 
        closeModal = v4.closeCentralOverlayThunk and function() --[[ Line: 24 ]]
            -- upvalues: v5 (copy), v4 (copy)
            v5(v4.closeCentralOverlayThunk());
        end or nil
    });
end;