local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.OpenPlayerDropDown);
local v5 = require(l_Actions_0.ClosePlayerDropDown);
local v6 = require(l_Actions_0.RemovePlayer);
local v7 = require(l_Actions_0.SetPlayerListVisibility);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v2.Flags.FFlagAddNewPlayerListMobileFocusNav;
local v9 = {
    isVisible = false, 
    selectedPlayer = nil
};
return (v1.createReducer(v9, {
    [v7.name] = function(v10, v11) --[[ Line: 21 ]]
        -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
        if not v11.isVisible then
            return {
                isVisible = false, 
                selectedPlayer = if l_FFlagAddNewPlayerListMobileFocusNav_0 then nil else v10.selectedPlayer
            };
        else
            return v10;
        end;
    end, 
    [v4.name] = function(_, v13) --[[ Line: 31 ]]
        return {
            isVisible = true, 
            selectedPlayer = v13.selectedPlayer
        };
    end, 
    [v5.name] = function(v14, _) --[[ Line: 38 ]]
        return {
            isVisible = false, 
            selectedPlayer = v14.selectedPlayer
        };
    end, 
    [v6.name] = function(v16, v17) --[[ Line: 45 ]]
        if v17.player == v16.selectedPlayer then
            return {
                isVisible = false, 
                selectedPlayer = nil
            };
        else
            return v16;
        end;
    end
}));