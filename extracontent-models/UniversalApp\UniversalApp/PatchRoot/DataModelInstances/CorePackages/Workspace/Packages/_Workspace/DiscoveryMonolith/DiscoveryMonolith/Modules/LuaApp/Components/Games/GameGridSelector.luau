local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local _ = require(l_Parent_0.GameTile);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v8 = require(l_Modules_0.LuaApp.Components.Games.GameGrid);
local v9 = require(l_Modules_0.LuaApp.Components.Games.GameGridTable);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppEnableGameGridTable);
local v11 = {
    l_AppUserLayers_0.GridUILayer
};
local function v13(v12) --[[ Line: 60 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return (v12[l_AppUserLayers_0.GridUILayer] or {}).IsGameGridDesktopRefreshEnabled or false;
end;
return function(v14) --[[ Line: 65 ]]
    -- upvalues: l_useAppPolicy_0 (copy), v10 (copy), l_useUserExperiment_0 (copy), v11 (copy), v13 (copy), v2 (copy), v9 (copy), v8 (copy)
    local v15 = v14.currentSidePadding or 0;
    local v17 = l_useAppPolicy_0(function(v16) --[[ Line: 68 ]]
        return v16.useGridPageLayout();
    end);
    local v18 = v10 and true or l_useUserExperiment_0(v11, v13);
    if v17 and v18 then
        return v2.createElement("Frame", {
            Position = UDim2.fromOffset(-v15, 0), 
            Size = UDim2.new(1, v15 * 2, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v14.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            GridTable = v2.createElement(v9, v14)
        });
    else
        return v2.createElement(v8, v14);
    end;
end;