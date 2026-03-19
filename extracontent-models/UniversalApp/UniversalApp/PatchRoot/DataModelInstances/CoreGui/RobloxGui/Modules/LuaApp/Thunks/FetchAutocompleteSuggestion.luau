local l_CorePackages_0 = game:GetService("CorePackages");
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteGameSuggestion);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteAvatarSuggestion);
return {
    Fetch = function(v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: Fetch ]]
        -- upvalues: l_SearchTypes_0 (copy), v4 (copy), v3 (copy)
        if v8 == l_SearchTypes_0.Catalog then
            return v4.Fetch(v5, v6);
        elseif v8 == l_SearchTypes_0.Games or v8 == l_SearchTypes_0.Auto or v8 == l_SearchTypes_0.TopResults then
            return v3.Fetch(v5, v6, v7);
        elseif v8 == l_SearchTypes_0.Players then
            return v3.Fetch(v5, v6, v7);
        else
            error((("Unrecognized search type for fetching autocomplete suggestions: %*"):format(v8)));
            return;
        end;
    end, 
    GetFetchingStatus = function(v9, v10, v11) --[[ Line: 29 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_SearchTypes_0 (copy), v4 (copy), v3 (copy)
        if v11 == l_SearchTypes_0.Catalog then
            return v4.GetFetchingStatus(v9, v10);
        elseif v11 == l_SearchTypes_0.Games or v11 == l_SearchTypes_0.Auto or v11 == l_SearchTypes_0.TopResults then
            return v3.GetFetchingStatus(v9, v10);
        elseif v11 == l_SearchTypes_0.Players then
            return v3.GetFetchingStatus(v9, v10);
        else
            error((("Unrecognized search type for fetching status for autocomplete suggestions: %*"):format(v11)));
            return;
        end;
    end
};