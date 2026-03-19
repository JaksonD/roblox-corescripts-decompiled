local v0 = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants);
local v1 = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMaxCount);
local v2 = require(script.Parent.Parent.Flags.getFIntContactImporterModalDisplayMinDays);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    isUserOptedInLocalStorage = function(_, v5, v6) --[[ Line: 18 ]] --[[ Name: isUserOptedInLocalStorage ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
                -- upvalues: v5 (copy), v0 (ref)
                return v5:GetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS);
            end);
            if l_status_0 then
                for v9 in string.gmatch(l_result_0 or "", "([^,]+)") do
                    if v6 == v9 then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, 
    shouldUserSeeModalPotentiallyAgain = function(_, v11, v12) --[[ Line: 43 ]] --[[ Name: shouldUserSeeModalPotentiallyAgain ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy), v1 (copy), v2 (copy)
        if not l_game_EngineFeature_0 then
            return true;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 49 ]]
                -- upvalues: v11 (copy), v0 (ref)
                return v11:GetItem(v0.LOCAL_STORAGE_KEY_MODAL_DISPLAY_COUNT);
            end);
            if not l_status_1 then
                return true;
            else
                local v15 = 0;
                for v16 in string.gmatch(l_result_1 or "", "([^,]+)") do
                    local v17 = string.split(v16, ":");
                    if v17[1] == v12 then
                        v15 = tonumber(v17[2]) or 0;
                        break;
                    end;
                end;
                if v15 <= v1() then
                    return true;
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 69 ]]
                        -- upvalues: v11 (copy), v0 (ref)
                        return v11:GetItem(v0.LOCAL_STORAGE_KEY_MODAL_TIMESTAMP);
                    end);
                    if not l_status_2 then
                        return true;
                    else
                        local v20 = 0;
                        for v21 in string.gmatch(l_result_2 or "", "([^,]+)") do
                            local v22 = string.split(v21, ":");
                            if v22[1] == v12 then
                                v20 = tonumber(v22[2]) or 0;
                                break;
                            end;
                        end;
                        local v23 = v2() * 86400000;
                        return DateTime.now().UnixTimestampMillis >= v20 + v23;
                    end;
                end;
            end;
        end;
    end
};