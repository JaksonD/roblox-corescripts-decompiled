local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteGameGetSuggestion);
local v7 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestion);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local function _(v9) --[[ Line: 11 ]] --[[ Name: getFetchName ]]
    return "luaapp.autocomplete.game.suggestion." .. v9;
end;
return {
    Fetch = function(v11, v12, v13) --[[ Line: 17 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v5 (copy), v7 (copy), l_ApiFetchGameIcons_0 (copy), v3 (copy), l_Logging_0 (copy)
        return l_PerformFetch_0.Single("luaapp.autocomplete.game.suggestion." .. v12, function(v14) --[[ Line: 18 ]]
            -- upvalues: v6 (ref), v11 (copy), v12 (copy), v13 (copy), v5 (ref), v7 (ref), l_ApiFetchGameIcons_0 (ref), v3 (ref), l_Logging_0 (ref)
            return v6(v11, v12, v13):andThen(function(v15) --[[ Line: 19 ]]
                -- upvalues: v12 (ref), v5 (ref), v14 (copy), v7 (ref), l_ApiFetchGameIcons_0 (ref), v11 (ref), v3 (ref), l_Logging_0 (ref)
                if v15 and v15.responseBody then
                    local l_responseBody_0 = v15.responseBody;
                    local v17 = nil;
                    if v12 == l_responseBody_0.prefix then
                        v17 = v5.fromJsonData(l_responseBody_0);
                    end;
                    if v17 then
                        v17:match(function(v18) --[[ Line: 29 ]]
                            -- upvalues: v14 (ref), v7 (ref), v12 (ref), v5 (ref), l_ApiFetchGameIcons_0 (ref), v11 (ref)
                            v14:dispatch(v7(v12, v18));
                            local v19 = {};
                            for v20 = 1, #v18.entries do
                                local v21 = v18.entries[v20];
                                if v21.type == v5.EntryType.Rich then
                                    table.insert(v19, v21.universeId);
                                end;
                            end;
                            if #v19 > 0 then
                                v14:dispatch(l_ApiFetchGameIcons_0(v11, v19));
                            end;
                        end):matchError(function(v22) --[[ Line: 43 ]]
                            warn(v22);
                        end);
                        return v3.resolve(v15);
                    else
                        l_Logging_0.warn("Response from AutocompleteGameGetSuggestion is malformed!");
                        return v3.reject({
                            HttpError = Enum.HttpError.OK
                        });
                    end;
                else
                    return v3.reject();
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v23, v24) --[[ Line: 58 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v23, "luaapp.autocomplete.game.suggestion." .. v24);
    end
};