local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.GameMediaEntry);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetMedia);
local v6 = require(l_Modules_0.LuaApp.Actions.Games.UpdateGameMedia);
return {
    KeyMapper = function(v7) --[[ Line: 12 ]]
        return "luaapp.gamesapi.gamemedia." .. v7;
    end, 
    Fetch = function(v8, v9) --[[ Line: 18 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v4 (copy), v6 (copy)
        assert(typeof(v9) == "string", "universeId should be a string");
        assert(#v9 > 0, "universeId should not be empty");
        local v10 = "luaapp.gamesapi.gamemedia." .. v9;
        return l_PerformFetch_0.Single(v10, function(v11) --[[ Line: 24 ]]
            -- upvalues: v5 (ref), v8 (copy), v9 (copy), v4 (ref), v6 (ref)
            return v5(v8, v9):andThen(function(v12) --[[ Line: 25 ]]
                -- upvalues: v4 (ref), v11 (copy), v6 (ref), v9 (ref)
                assert(typeof(v12.responseBody.data) == "table", "Malformed response from server, missing 'data' object");
                local v13 = {};
                for _, v15 in ipairs(v12.responseBody.data) do
                    table.insert(v13, (v4.fromJsonData(v15)));
                end;
                if #v13 > 0 then
                    v11:dispatch(v6(v9, v13));
                end;
                return v13;
            end);
        end);
    end, 
    GetFetchingStatus = function(v16, v17) --[[ Line: 43 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v16, "luaapp.gamesapi.gamemedia." .. v17);
    end
};