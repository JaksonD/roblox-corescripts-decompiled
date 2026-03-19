local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestionTable);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteGetLocalCache);
local v5 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestionTable);
local v6 = require(l_Modules_0.LuaApp.Promise);
local function _(v7, v8) --[[ Line: 10 ]] --[[ Name: getFetchName ]]
    return "luaapp.autocomplete.getlocalcache." .. v7 .. "." .. (v8 or "none");
end;
local v10 = {};
v10.Fetch = function(v11, v12, v13, v14) --[[ Line: 16 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v3 (copy), v5 (copy), v10 (copy), v6 (copy)
    return l_PerformFetch_0.Single("luaapp.autocomplete.getlocalcache." .. v12 .. "." .. (v13 or "none"), function(v15) --[[ Line: 17 ]]
        -- upvalues: v4 (ref), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v3 (ref), v5 (ref), v10 (ref), v6 (ref)
        return v4(v11, v12, v13, v14):andThen(function(v16) --[[ Line: 18 ]]
            -- upvalues: v3 (ref), v15 (copy), v5 (ref), v10 (ref), v11 (ref), v13 (ref), v14 (ref), v6 (ref)
            if v16 and v16.responseBody then
                local l_responseBody_0 = v16.responseBody;
                v3.fromJsonData(l_responseBody_0):match(function(v18) --[[ Line: 23 ]]
                    -- upvalues: v15 (ref), v5 (ref)
                    v15:dispatch(v5(v18));
                end):matchError(function(v19) --[[ Line: 26 ]]
                    warn(v19);
                end);
                if l_responseBody_0.hasNextPage and l_responseBody_0.pageNumber then
                    v15:dispatch(v10.Fetch(v11, l_responseBody_0.pageNumber + 1, v13, v14));
                end;
                return v6.resolve();
            else
                return v6.reject();
            end;
        end, function(v20) --[[ Line: 39 ]]
            -- upvalues: v6 (ref)
            return v6.reject(v20);
        end);
    end);
end;
return v10;