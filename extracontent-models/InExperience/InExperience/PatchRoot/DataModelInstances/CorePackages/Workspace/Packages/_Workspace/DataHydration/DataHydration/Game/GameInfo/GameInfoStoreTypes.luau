local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v3 = require(l_Parent_0.t);
local l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
return {
    gameInfoResponseValidator = v3.interface({
        data = v3.array(v3.interface({
            id = v3.number, 
            rootPlaceId = v3.number, 
            name = v3.optional(v3.string), 
            description = v3.optional(v3.string), 
            creator = v3.optional(v3.interface({
                id = v3.optional(v3.number), 
                name = v3.optional(v3.string), 
                hasVerifiedBadge = v3.optional(v3.boolean)
            })), 
            playerCount = if l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 then v3.optional(v3.number) else nil, 
            totalUpVotes = if l_FFlagSduiExperienceDetailsSupport_0 then v3.optional(v3.string) else nil, 
            totalDownVotes = if l_FFlagSduiExperienceDetailsSupport_0 then v3.optional(v3.string) else nil
        }))
    })
};