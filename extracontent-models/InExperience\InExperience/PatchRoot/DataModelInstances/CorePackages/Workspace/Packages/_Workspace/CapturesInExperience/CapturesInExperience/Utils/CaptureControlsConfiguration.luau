local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_Parent_1.Cryo);
local l_getDeepValue_0 = require(l_Parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v7 = require(l_Parent_0.Utils.getLocalUserId);
local v8 = require(l_Parent_0.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature("CaptureControlsAppStorageEnabled");
local v10 = Vector2.new(1, 0.5);
local v11 = {};
local v12 = {};
local v13 = tostring(game.GameId);
local v14 = v7(l_Players_0);
local v15 = game:DefineFastInt("CaptureControlsStoredAnchorPoints", 100);
v11.getStoredSnapAnchorPoint = function() --[[ Line: 28 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v14 (copy), v10 (copy), l_AppStorageService_0 (copy), v8 (copy), l_HttpService_0 (copy), v12 (ref), l_getDeepValue_0 (copy), v13 (copy)
    if not l_game_EngineFeature_0 or not v14 then
        return v10;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
            -- upvalues: l_AppStorageService_0 (ref), v8 (ref)
            return l_AppStorageService_0:GetItem(v8.CaptureControlsPositionStorageKey);
        end);
        if not l_status_0 then
            return v10;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 41 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if not l_status_1 then
                return v10;
            else
                v12 = l_result_1;
                local v20 = l_getDeepValue_0(l_result_1, string.format("%s.%s", v14, v13));
                if not v20 then
                    return v10;
                else
                    return (Vector2.new(v20.X, v20.Y));
                end;
            end;
        end;
    end;
end;
v11.setStoredSnapAnchorPoint = function(v21) --[[ Line: 62 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v14 (copy), v12 (ref), v13 (copy), v5 (copy), v15 (copy), l_AppStorageService_0 (copy), v8 (copy), l_HttpService_0 (copy)
    if not l_game_EngineFeature_0 or not v14 then
        return;
    else
        local v22 = {
            X = v21.X, 
            Y = v21.Y, 
            timestamp = os.time()
        };
        local v23 = v12[v14] or {};
        v23[v13] = v22;
        local v24 = v5.Dictionary.keys(v23);
        if #v24 > v15 then
            local v27 = v5.List.sort(v24, function(v25, v26) --[[ Line: 79 ]]
                -- upvalues: v23 (ref)
                return v23[v25].timestamp > v23[v26].timestamp;
            end);
            local v28 = v5.List.toSet(v5.List.removeRange(v27, v15 + 1, #v27));
            v23 = v5.Dictionary.filter(v23, function(_, v30) --[[ Line: 86 ]]
                -- upvalues: v28 (copy)
                return v28[v30];
            end);
        end;
        local v31 = v5.Dictionary.union(v12, {
            [v14] = v23
        });
        l_AppStorageService_0:SetItem(v8.CaptureControlsPositionStorageKey, l_HttpService_0:JSONEncode(v31));
        v12 = v31;
        return;
    end;
end;
return v11;