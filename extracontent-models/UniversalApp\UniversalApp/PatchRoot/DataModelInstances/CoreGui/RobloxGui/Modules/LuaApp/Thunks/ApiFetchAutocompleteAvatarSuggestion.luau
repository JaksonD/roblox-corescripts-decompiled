local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteAvatarSuggest);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion);
local function _(v8) --[[ Line: 11 ]] --[[ Name: getFetchName ]]
    return "luaapp.autocomplete.avatar.suggestion." .. v8;
end;
return {
    Fetch = function(v10, v11) --[[ Line: 17 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v5 (copy), v7 (copy), v3 (copy), l_Logging_0 (copy)
        return l_PerformFetch_0.Single("luaapp.autocomplete.avatar.suggestion." .. v11, function(v12) --[[ Line: 18 ]]
            -- upvalues: v6 (ref), v10 (copy), v11 (copy), v5 (ref), v7 (ref), v3 (ref), l_Logging_0 (ref)
            return v6(v10, v11):andThen(function(v13) --[[ Line: 19 ]]
                -- upvalues: v11 (ref), v5 (ref), v12 (copy), v7 (ref), v3 (ref), l_Logging_0 (ref)
                if v13 and v13.responseBody then
                    local l_responseBody_0 = v13.responseBody;
                    local v15 = nil;
                    if l_responseBody_0.Args ~= nil and v11 == l_responseBody_0.Args.Prefix then
                        v15 = v5.fromJsonDataAvatar(l_responseBody_0);
                    end;
                    if v15 then
                        v15:match(function(v16) --[[ Line: 29 ]]
                            -- upvalues: v12 (ref), v7 (ref), v11 (ref)
                            v12:dispatch(v7(v11, v16));
                        end):matchError(function(v17) --[[ Line: 33 ]]
                            warn(v17);
                        end);
                        return v3.resolve(v13);
                    else
                        l_Logging_0.warn("Response from AutocompleteAvatarSuggest is malformed!");
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
    GetFetchingStatus = function(v18, v19) --[[ Line: 48 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v18, "luaapp.autocomplete.avatar.suggestion." .. v19);
    end
};