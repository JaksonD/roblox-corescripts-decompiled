local v0 = require(script.dependencies);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.t);
local l_GetTokenGenerators_0 = v0.GetTokenGenerators;
local l_Validators_0 = v0.SchemaPackage.Validators;
local l_GetFoundationTokens_0 = v0.GetFoundationTokens;
local v7 = require(l_Parent_0.UIBloxConfig);
local v8 = require(script.Types);
local v9 = require(script.Parent.Constants);
local function _(v10, v11) --[[ Line: 19 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v7 (copy), v9 (copy)
    if v7.disableTokenScaling then
        return 1;
    else
        if v11 == nil then
            v11 = 1;
        end;
        v11 = math.clamp(v11, 0, 1e999);
        local v12 = 1;
        if v10 == v9.DeviceType.Console then
            v12 = 1.5;
        end;
        return v12 * v11;
    end;
end;
return {
    getTokens = function(v14, v15, v16) --[[ Line: 39 ]] --[[ Name: getTokens ]]
        -- upvalues: l_GetTokenGenerators_0 (copy), v9 (copy), v7 (copy)
        local v17 = l_GetTokenGenerators_0(v15) or l_GetTokenGenerators_0(v9.DefaultThemeName);
        local l_v16_0 = v16;
        local v19;
        if v7.disableTokenScaling then
            v19 = 1;
        else
            if l_v16_0 == nil then
                l_v16_0 = 1;
            end;
            l_v16_0 = math.clamp(l_v16_0, 0, 1e999);
            local v20 = 1;
            if v14 == v9.DeviceType.Console then
                v20 = 1.5;
            end;
            v19 = v20 * l_v16_0;
        end;
        return {
            Global = require(v17.Global)(v19), 
            Semantic = require(v17.Semantic)(v19), 
            Component = require(v17.Component)(v19)
        };
    end, 
    validateTokens = v3.strictInterface({
        Global = v3.strictInterface(l_Validators_0.Global), 
        Semantic = v3.strictInterface(l_Validators_0.Semantic), 
        Component = v3.strictInterface(l_Validators_0.Component)
    }), 
    Types = v8, 
    getFoundationTokens = function(v21, v22, v23) --[[ Line: 55 ]] --[[ Name: getFoundationTokens ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v9 (copy), v7 (copy)
        local v24 = l_GetFoundationTokens_0(v22) or l_GetFoundationTokens_0(v9.DefaultThemeName);
        local l_v23_0 = v23;
        local v26;
        if v7.disableTokenScaling then
            v26 = 1;
        else
            if l_v23_0 == nil then
                l_v23_0 = 1;
            end;
            l_v23_0 = math.clamp(l_v23_0, 0, 1e999);
            local v27 = 1;
            if v21 == v9.DeviceType.Console then
                v27 = 1.5;
            end;
            v26 = v27 * l_v23_0;
        end;
        return v24(v26);
    end, 
    getFoundationTokensDefaultScale = function(v28) --[[ Line: 61 ]] --[[ Name: getFoundationTokensDefaultScale ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v9 (copy)
        return (l_GetFoundationTokens_0(v28) or l_GetFoundationTokens_0(v9.DefaultThemeName))(1);
    end, 
    Mappers = require(script.mappers)
};