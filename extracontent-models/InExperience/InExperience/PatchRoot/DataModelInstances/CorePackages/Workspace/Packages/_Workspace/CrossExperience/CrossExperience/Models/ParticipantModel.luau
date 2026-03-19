local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v1.SharedFlags.FFlagEnablePartyVoiceChangersInLua;
local l_t_0 = v1.t;
local v4 = {};
v4.new = function(v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.format = function(v6) --[[ Line: 22 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    return (v4.new({
        userId = v6.userId, 
        isLocalUser = v6.isLocalUser, 
        username = v6.username, 
        displayname = v6.displayname, 
        isMuted = v6.isMuted, 
        isMutedLocally = v6.isMutedLocally, 
        isVoiceChangerActive = if l_FFlagEnablePartyVoiceChangersInLua_0 then v6.isVoiceChangerActive else nil, 
        isVoiceChangerHearMyselfActive = if l_FFlagEnablePartyVoiceChangersInLua_0 then v6.isVoiceChangerHearMyselfActive else nil, 
        selectedVoicePack = if l_FFlagEnablePartyVoiceChangersInLua_0 then v6.selectedVoicePack else nil
    }));
end;
v4.isValid = if l_FFlagEnablePartyVoiceChangersInLua_0 then l_t_0.strictInterface({
    userId = l_t_0.number, 
    isLocalUser = l_t_0.boolean, 
    username = l_t_0.string, 
    displayname = l_t_0.string, 
    isMuted = l_t_0.boolean, 
    isMutedLocally = l_t_0.boolean, 
    isVoiceChangerActive = l_t_0.boolean, 
    isVoiceChangerHearMyselfActive = l_t_0.boolean, 
    selectedVoicePack = l_t_0.string
}) else l_t_0.strictInterface({
    userId = l_t_0.number, 
    isLocalUser = l_t_0.boolean, 
    username = l_t_0.string, 
    displayname = l_t_0.string, 
    isMuted = l_t_0.boolean, 
    isMutedLocally = l_t_0.boolean
});
return v4;