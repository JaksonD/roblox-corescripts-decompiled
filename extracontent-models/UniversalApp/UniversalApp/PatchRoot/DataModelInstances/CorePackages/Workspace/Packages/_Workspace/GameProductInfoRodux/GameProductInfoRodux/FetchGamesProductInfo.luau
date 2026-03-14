local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameProductInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Result);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v6 = require(l_script_FirstAncestor_0.SetGamesProductInfo);
local v7 = require(l_script_FirstAncestor_0.GamesGetProductInfo);
local v8 = require(l_script_FirstAncestor_0.GameProductInfo);
local v9 = {};
local function v11(v10) --[[ Line: 16 ]]
    return "luaapp.gamesapi.games-product-info." .. v10;
end;
v9.KeyMapper = v11;
v9.Fetch = function(v12, v13) --[[ Line: 22 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v11 (copy), v7 (copy), v3 (copy), v8 (copy), l_Logging_0 (copy), v6 (copy), v2 (copy)
    assert(type(v13) == "table", "FetchGamesProductInfo thunk expects universeIds to be a table");
    assert(#v13 > 0, "FetchGamesProductInfo thunk expects universeIds count to be greater than 0");
    assert(#v13 <= 100, "FetchGamesProductInfo thunk expects universeIds count to not exceed " .. 100);
    return l_PerformFetch_0.Batch(v13, v11, function(v14, v15) --[[ Line: 30 ]]
        -- upvalues: v7 (ref), v12 (copy), v3 (ref), v8 (ref), l_Logging_0 (ref), v6 (ref), v2 (ref)
        return v7(v12, v15):andThen(function(v16) --[[ Line: 31 ]]
            -- upvalues: v15 (copy), v3 (ref), v8 (ref), l_Logging_0 (ref), v14 (copy), v6 (ref), v2 (ref)
            local v17 = {};
            for _, v19 in ipairs(v15) do
                v17["luaapp.gamesapi.games-product-info." .. v19] = v3.new(false, nil);
            end;
            local v20 = v16 and v16.responseBody and v16.responseBody.data;
            if v20 ~= nil then
                local v21 = {};
                for _, v23 in ipairs(v20) do
                    v8.fromJsonData(v23):match(function(v24) --[[ Line: 42 ]]
                        -- upvalues: v21 (copy), v17 (copy), v3 (ref)
                        v21[v24.universeId] = v24;
                        v17["luaapp.gamesapi.games-product-info." .. v24.universeId] = v3.new(true, nil);
                    end):matchError(function(v25) --[[ Line: 46 ]]
                        -- upvalues: l_Logging_0 (ref)
                        l_Logging_0.warn(v25);
                    end);
                end;
                if next(v21) then
                    v14:dispatch(v6(v21));
                end;
            else
                l_Logging_0.warn("Response from GamesGetProductInfo is malformed!");
            end;
            return v2.resolve(v17);
        end, function(_) --[[ Line: 59 ]]
            -- upvalues: v15 (copy), v3 (ref), v2 (ref)
            local v27 = {};
            for _, v29 in ipairs(v15) do
                v27["luaapp.gamesapi.games-product-info." .. v29] = v3.new(false, nil);
            end;
            return v2.resolve(v27);
        end);
    end);
end;
v9.GetFetchingStatus = function(v30, v31) --[[ Line: 69 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v30, "luaapp.gamesapi.games-product-info." .. v31);
end;
return v9;