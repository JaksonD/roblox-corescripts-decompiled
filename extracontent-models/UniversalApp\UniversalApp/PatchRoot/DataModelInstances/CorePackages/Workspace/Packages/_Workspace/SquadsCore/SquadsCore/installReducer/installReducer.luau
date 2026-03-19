local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.SquadPromptReducer);
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v5 = require(l_script_FirstAncestor_0.RoduxSquads);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadLocation);
local v7 = require(l_script_FirstAncestor_0.Http.UserBlockingRodux);
local v8 = require(l_Parent_0.CrossExperience);
local v9 = require(l_Parent_0.CrossExperienceVoice);
local v10 = require(l_Parent_0.Rodux);
local v11 = require(l_Parent_0.SharedFlags);
local l_createPersistenceMiddleware_0 = v8.Middlewares.createPersistenceMiddleware;
local l_GetFFlagEnableCrossExpVoice_0 = v11.GetFFlagEnableCrossExpVoice;
local v14 = {
    NetworkStatus = v3.installReducer(), 
    Presence = v4.installReducer(), 
    Squad = v5.installReducer(), 
    SquadPrompt = v2, 
    UserBlocking = v7.installReducer()
};
if l_GetFFlagEnableCrossExpVoice_0() then
    local v15 = l_createPersistenceMiddleware_0({
        storeKey = v8.Constants.STORAGE_CEV_STORE_KEY
    });
    local v16 = nil;
    local v17 = v15.restore();
    if v17 and v17.Squad and v17.Squad.CrossExperienceVoice then
        v16 = v17.Squad.CrossExperienceVoice;
    end;
    v14.CrossExperienceVoice = v9.installReducer(v16);
end;
return function(v18) --[[ Line: 41 ]]
    -- upvalues: v14 (copy), v6 (copy), v2 (copy), v10 (copy)
    v14.SquadPrompt = if v18 == v6.InExperience then v2 else nil;
    return v10.combineReducers(v14);
end;