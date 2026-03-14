local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v3 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_createPersistenceMiddleware_0 = v3.Middlewares.createPersistenceMiddleware;
local l_FFlagTopBarSignalizeHealthBar_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local l_Parent_0 = script.Parent;
local v8 = require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux);
local v9 = require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux);
local v10 = require(script.DisplayOptions);
local v11 = require(script.CoreGuiEnabled);
local v12 = require(script.Health);
local v13 = require(script.MoreMenu);
local v14 = require(script.Chat);
local v15 = require(script.Respawn);
local v16 = require(script.GameInfo);
local v17 = {
    displayOptions = v10, 
    coreGuiEnabled = if v8 then nil else v11, 
    health = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v12, 
    moreMenu = v13, 
    chat = if v9 then nil else v14, 
    respawn = v15, 
    gameInfo = v16
};
if l_GetFFlagEnableCrossExpVoice_0() then
    local v18 = l_createPersistenceMiddleware_0({
        storeKey = v3.Constants.STORAGE_CEV_STORE_KEY
    });
    local v19 = nil;
    local v20 = v18.restore();
    if v20 and v20.Squad and v20.Squad.CrossExperienceVoice then
        v19 = v20.Squad.CrossExperienceVoice;
    end;
    v17.Squad = v1.combineReducers({
        CrossExperienceVoice = v2.installReducer(v19)
    });
end;
return (v1.combineReducers(v17));