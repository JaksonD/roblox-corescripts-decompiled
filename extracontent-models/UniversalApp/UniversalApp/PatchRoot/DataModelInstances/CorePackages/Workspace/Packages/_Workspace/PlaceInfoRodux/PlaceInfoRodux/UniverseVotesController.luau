local l_Parent_0 = script:FindFirstAncestor("PlaceInfoRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.HttpRequest);
local _ = require(l_Parent_0.LuauPolyfill);
local l_Url_0 = v2.Url;
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = {};
    local v12 = v3.config({
        requestFunction = function(v9, v10, v11) --[[ Line: 70 ]] --[[ Name: requestFunction ]]
            -- upvalues: v3 (ref)
            return v3.requestFunctions.HttpRbxApi(v9, v10, v11);
        end
    });
    v8._universeVotes = {};
    v8._requestImpl = v7 or v12;
    return (setmetatable(v8, v6));
end;
v6.upVotes = function(v13, v14) --[[ Line: 81 ]] --[[ Name: upVotes ]]
    return v13:_getVotes(v14, "upVotes");
end;
v6.downVotes = function(v15, v16) --[[ Line: 85 ]] --[[ Name: downVotes ]]
    return v15:_getVotes(v16, "downVotes");
end;
v6.rating = function(v17, v18) --[[ Line: 89 ]] --[[ Name: rating ]]
    return v17:_getVotes(v18, "rating");
end;
v6._fetchUniversesVotes = function(v19, v20) --[[ Line: 95 ]] --[[ Name: _fetchUniversesVotes ]]
    -- upvalues: l_Url_0 (copy)
    local v21 = {
        universeIds = v20
    };
    local v22 = l_Url_0:makeQueryString(v21);
    local v23 = string.format("%sv1/games/votes?%s", l_Url_0.GAME_URL, v22);
    return v19._requestImpl(v23, "GET");
end;
v6.getUniversesVotes = function(v24, v25) --[[ Line: 108 ]] --[[ Name: getUniversesVotes ]]
    -- upvalues: v1 (copy)
    local v36 = v1.new(function(v26, v27) --[[ Line: 111 ]]
        -- upvalues: v24 (copy), v25 (copy)
        v24:_fetchUniversesVotes(v25):andThen(function(v28) --[[ Line: 113 ]]
            -- upvalues: v26 (copy), v24 (ref)
            if not v28 or not v28.responseBody then
                v26(nil);
                return;
            else
                local l_responseBody_0 = v28.responseBody;
                local v30 = {};
                for _, v32 in l_responseBody_0.data do
                    local v33 = nil;
                    v33 = v32.upVotes + v32.downVotes == 0 and 0 or v32.upVotes / (v32.upVotes + v32.downVotes);
                    local v34 = {
                        universeId = v32.id, 
                        upVotes = v32.upVotes, 
                        downVotes = v32.downVotes, 
                        rating = v33
                    };
                    v30[v32.id] = v34;
                    v24._universeVotes[v32.id] = v34;
                end;
                v26(v30);
                return;
            end;
        end):catch(function(v35) --[[ Line: 140 ]]
            -- upvalues: v27 (copy)
            v27(v35);
        end);
    end);
    local v37 = {};
    for _, v39 in v25 do
        if v24._universeVotes[v39] then
            v37[v39] = v1.resolve(v24._universeVotes[v39]);
        else
            v24._universeVotes[v39] = v36:andThen(function(v40) --[[ Line: 152 ]]
                -- upvalues: v39 (copy)
                return v40[v39];
            end);
            v37[v39] = v24._universeVotes[v39];
        end;
    end;
    return v37;
end;
v6._getVotes = function(v41, v42, v43) --[[ Line: 162 ]] --[[ Name: _getVotes ]]
    -- upvalues: v1 (copy)
    if v41._universeVotes[v42] and v41._universeVotes[v42][v43] then
        return v1.resolve(v41._universeVotes[v42][v43]);
    elseif v41._universeVotes[v42] then
        return v41._universeVotes[v42]:andThen(function(_) --[[ Line: 169 ]]
            -- upvalues: v41 (copy), v42 (copy), v43 (copy)
            return v41._universeVotes[v42][v43];
        end);
    else
        return (v41:getUniversesVotes({
            v42
        })[v42]:andThen(function(v45) --[[ Line: 174 ]]
            -- upvalues: v43 (copy)
            return v45[v43];
        end));
    end;
end;
v6.default = v6.new();
return v6;