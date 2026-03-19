local l_Parent_0 = script:FindFirstAncestor("PlayabilityRodux").Parent;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_FFlagLuaAppUnplayableDisplayText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnplayableDisplayText;
local l_FFlagLuaAppPlayableUxTreatment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayableUxTreatment;
local v4 = require(l_Parent_0.Result);
local v5 = {
    new = function() --[[ Line: 47 ]] --[[ Name: new ]]
        return {};
    end
};
v5.mock = function() --[[ Line: 53 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy), l_PlayabilityStatusEnum_0 (copy)
    local v6 = v5.new();
    v6.universeId = "149757";
    v6.isPlayable = true;
    v6.playabilityStatus = l_PlayabilityStatusEnum_0.Playable;
    return v6;
end;
v5.fromJsonData = function(v7) --[[ Line: 62 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v4 (copy), v5 (copy), l_FFlagLuaAppUnplayableDisplayText_0 (copy), l_FFlagLuaAppPlayableUxTreatment_0 (copy)
    if type(v7.universeId) ~= "number" and type(v7.universeId) ~= "string" then
        return v4.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string");
    elseif type(v7.isPlayable) ~= "boolean" then
        return v4.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean");
    elseif type(v7.playabilityStatus) ~= "string" then
        return v4.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string");
    else
        local v8 = v5.new();
        v8.universeId = tostring(v7.universeId);
        v8.isPlayable = v7.isPlayable;
        v8.playabilityStatus = v7.playabilityStatus;
        v8.unplayableDisplayText = if l_FFlagLuaAppUnplayableDisplayText_0 then v7.unplayableDisplayText else nil;
        if l_FFlagLuaAppPlayableUxTreatment_0 then
            local l_playableUxTreatment_0 = v7.playableUxTreatment;
            if l_playableUxTreatment_0 and type(l_playableUxTreatment_0) == "table" and type(l_playableUxTreatment_0.treatment) == "string" then
                v8.playableUxTreatment = {
                    treatment = l_playableUxTreatment_0.treatment, 
                    data = l_playableUxTreatment_0.data
                };
            end;
        end;
        return v4.success(v8);
    end;
end;
return v5;