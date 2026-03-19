local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.OpenOverlay);
local v4 = require(l_Parent_0.Actions.CloseOverlay);
local v5 = {
    overlay = nil, 
    overlayProps = {}
};
return v1.createReducer(v5, {
    [v3.name] = function(_, v7) --[[ Line: 25 ]]
        return {
            overlay = v7.overlay, 
            overlayProps = v7.overlayProps
        };
    end, 
    [v4.name] = function(_, _) --[[ Line: 33 ]]
        return {
            overlay = nil, 
            overlayProps = {}
        };
    end
});