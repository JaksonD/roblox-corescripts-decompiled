local v0 = require(script.Reducers);
local v1 = require(script.Actions);
local v2 = require(script.Models);
local v3 = require(script.Enums);
local v4 = require(script.Hooks);
local v5 = require(script.Logger);
local v6 = require(script.RoduxSquadsTypes);
local l_Parent_0 = script.Parent;
local v8 = require(l_Parent_0.Rodux);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.RoduxNetworking);
local v11 = require(l_Parent_0.NetworkingSquads);
return {
    ["jest.config"] = script["jest.config"], 
    config = function(v12) --[[ Line: 21 ]] --[[ Name: config ]]
        -- upvalues: v9 (copy), v11 (copy), v10 (copy), v0 (copy), v8 (copy), v1 (copy), v2 (copy), v3 (copy)
        v12 = v9.Dictionary.join(v12, {
            NetworkingSquads = v11.config({
                roduxNetworking = v10.mock()
            })
        });
        local v13, v14, v15 = v0.currentSquad(v12);
        return {
            installReducer = function() --[[ Line: 30 ]] --[[ Name: installReducer ]]
                -- upvalues: v8 (ref), v13 (copy), v14 (copy), v0 (ref), v12 (ref)
                return v8.combineReducers({
                    currentSquad = v13, 
                    currentSquadPersist = v14, 
                    currentExperienceInvite = v0.currentExperienceInvite(v12), 
                    currentExperienceInviteStatus = v0.currentExperienceInviteStatus(), 
                    partialSquads = v0.partialSquads()
                });
            end, 
            PersistManagers = {
                currentSquadPersistManager = v15
            }, 
            Actions = v1, 
            Models = v2, 
            Enums = v3
        };
    end, 
    Hooks = v4, 
    Logger = v5, 
    RoduxSquadsTypes = v6
};