local v0 = require(script.Parent.Parent.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    clearLocalStorage = function(_, v3) --[[ Line: 6 ]] --[[ Name: clearLocalStorage ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            pcall(function() --[[ Line: 10 ]]
                -- upvalues: v3 (copy), v0 (ref)
                v3:SetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS, "");
                v3:Flush();
            end);
            return;
        end;
    end, 
    addUserToLocalStorage = function(_, v5, v6) --[[ Line: 16 ]] --[[ Name: addUserToLocalStorage ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
                -- upvalues: v5 (copy), v0 (ref)
                return v5:GetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS);
            end);
            if l_status_0 then
                local v9 = {
                    [1] = v6
                };
                if l_result_0 ~= nil and l_result_0 ~= "" then
                    local v10 = #v9 + 1;
                    for v11 in string.gmatch(l_result_0, "([^,]+)") do
                        if v11 == v6 then
                            return;
                        else
                            v9[v10] = v11;
                            v10 = v10 + 1;
                        end;
                    end;
                end;
                local v12 = table.concat(v9, ","):gsub("%s+", "");
                do
                    local l_v12_0 = v12;
                    pcall(function() --[[ Line: 41 ]]
                        -- upvalues: v5 (copy), v0 (ref), l_v12_0 (ref)
                        v5:SetItem(v0.LOCAL_STORAGE_KEY_OPTED_IN_USERS, l_v12_0);
                        v5:Flush();
                    end);
                end;
            end;
            return;
        end;
    end
};