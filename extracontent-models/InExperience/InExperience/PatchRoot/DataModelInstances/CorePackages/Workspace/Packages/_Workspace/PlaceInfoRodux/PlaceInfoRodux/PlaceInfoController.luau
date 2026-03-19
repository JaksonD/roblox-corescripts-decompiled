local l_Parent_0 = script:FindFirstAncestor("PlaceInfoRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.HttpRequest);
local _ = require(l_Parent_0.LuauPolyfill);
local l_Url_0 = v2.Url;
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = {};
    local v12 = v3.config({
        requestFunction = function(v9, v10, v11) --[[ Line: 63 ]] --[[ Name: requestFunction ]]
            -- upvalues: v3 (ref)
            return v3.requestFunctions.HttpRbxApi(v9, v10, v11);
        end
    });
    v8._placeInfo = {};
    v8._requestImpl = v7 or v12;
    return (setmetatable(v8, v6));
end;
v6.name = function(v13, v14) --[[ Line: 74 ]] --[[ Name: name ]]
    return v13:_getInfo(v14, "name");
end;
v6.description = function(v15, v16) --[[ Line: 78 ]] --[[ Name: description ]]
    return v15:_getInfo(v16, "description");
end;
v6.universeId = function(v17, v18) --[[ Line: 82 ]] --[[ Name: universeId ]]
    return v17:_getInfo(v18, "universeId");
end;
v6._fetchPlacesInfo = function(v19, v20) --[[ Line: 88 ]] --[[ Name: _fetchPlacesInfo ]]
    -- upvalues: l_Url_0 (copy)
    local v21 = {
        placeIds = v20
    };
    local v22 = l_Url_0:makeQueryString(v21);
    local v23 = string.format("%sv1/games/multiget-place-details?%s", l_Url_0.GAME_URL, v22);
    return v19._requestImpl(v23, "GET");
end;
v6.getPlacesInfo = function(v24, v25) --[[ Line: 101 ]] --[[ Name: getPlacesInfo ]]
    -- upvalues: v1 (copy)
    local v35 = v1.new(function(v26, v27) --[[ Line: 102 ]]
        -- upvalues: v24 (copy), v25 (copy)
        v24:_fetchPlacesInfo(v25):andThen(function(v28) --[[ Line: 104 ]]
            -- upvalues: v26 (copy), v24 (ref)
            if not v28 or not v28.responseBody then
                v26(nil);
                return;
            else
                local l_responseBody_0 = v28.responseBody;
                local v30 = {};
                for _, v32 in l_responseBody_0 do
                    local v33 = {
                        universeId = v32.universeId, 
                        name = v32.name, 
                        description = v32.description
                    };
                    v30[v32.placeId] = v33;
                    v24._placeInfo[v32.placeId] = v33;
                end;
                v26(v30);
                return;
            end;
        end):catch(function(v34) --[[ Line: 124 ]]
            -- upvalues: v27 (copy)
            v27(v34);
        end);
    end);
    local v36 = {};
    for _, v38 in v25 do
        if v24._placeInfo[v38] then
            v36[v38] = v1.resolve(v24._placeInfo[v38]);
        else
            v24._placeInfo[v38] = v35:andThen(function(v39) --[[ Line: 135 ]]
                -- upvalues: v38 (copy)
                return v39[v38];
            end);
            v36[v38] = v24._placeInfo[v38];
        end;
    end;
    return v36;
end;
v6._getInfo = function(v40, v41, v42) --[[ Line: 144 ]] --[[ Name: _getInfo ]]
    -- upvalues: v1 (copy)
    if v40._placeInfo[v41] and v40._placeInfo[v41][v42] then
        return v1.resolve(v40._placeInfo[v41][v42]);
    elseif v40._placeInfo[v41] then
        return v40._placeInfo[v41]:andThen(function(_) --[[ Line: 151 ]]
            -- upvalues: v40 (copy), v41 (copy), v42 (copy)
            return v40._placeInfo[v41][v42];
        end);
    else
        return (v40:getPlacesInfo({
            v41
        })[v41]:andThen(function(v44) --[[ Line: 156 ]]
            -- upvalues: v42 (copy)
            return v44[v42];
        end));
    end;
end;
v6.default = v6.new();
return v6;