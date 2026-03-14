local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
return {
    Dash = require(l_Parent_0.Dash), 
    Roact = require(l_Parent_0.Roact), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Rodux = require(l_Parent_0.Rodux), 
    t = require(l_Parent_0.t), 
    UIBlox = require(l_Parent_0.UIBlox), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    llama = v1.llama
};