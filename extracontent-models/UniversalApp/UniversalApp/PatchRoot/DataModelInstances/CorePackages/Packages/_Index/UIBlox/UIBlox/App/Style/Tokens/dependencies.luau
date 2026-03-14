local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_1.RbxDesignFoundations);
local v4 = require(l_Parent_0.Constants);
local function v6(v5) --[[ Line: 13 ]] --[[ Name: getThemePackageIndex ]]
    -- upvalues: v4 (copy), v3 (copy)
    return {
        [v4.ThemeName.Light:lower()] = v3.tokens[v5].Light, 
        [v4.ThemeName.Dark:lower()] = v3.tokens[v5].Dark
    };
end;
return {
    TokenPackageIndexMap = {
        [v4.DeviceType.Console] = v6("Console"), 
        [v4.DeviceType.Desktop] = v6("Desktop"), 
        [v4.DeviceType.Tablet] = v6("Desktop"), 
        [v4.DeviceType.Phone] = v6("Desktop"), 
        [v4.DeviceType.VR] = v6("Desktop"), 
        [v4.DeviceType.Unknown] = v6("Desktop")
    }, 
    GetTokenGenerators = function(v7) --[[ Line: 30 ]] --[[ Name: GetTokenGenerators ]]
        -- upvalues: v4 (copy), v3 (copy)
        local v8 = v7:lower();
        if v8 == v4.ThemeName.Dark:lower() then
            return v3.tokens.Common.Builder.Dark;
        elseif v8 == v4.ThemeName.Light:lower() then
            return v3.tokens.Common.Builder.Light;
        else
            return nil;
        end;
    end, 
    GetFoundationTokens = function(v9) --[[ Line: 40 ]] --[[ Name: GetFoundationTokens ]]
        -- upvalues: l_Parent_1 (copy), v4 (copy)
        local l_Tokens_0 = require(l_Parent_1.RbxDesignFoundationsV2).Tokens;
        local v11 = v9:lower();
        if v11 == v4.ThemeName.Dark:lower() then
            return l_Tokens_0.Dark;
        elseif v11 == v4.ThemeName.Light:lower() then
            return l_Tokens_0.Light;
        else
            return nil;
        end;
    end, 
    SchemaPackage = {
        Validators = {
            Global = require(v3.tokens.Schema.Validators.validateGlobal)(v2), 
            Semantic = require(v3.tokens.Schema.Validators.validateSemantic)(v2), 
            Component = require(v3.tokens.Schema.Validators.validateComponent)(v2)
        }, 
        Types = {
            GlobalType = require(v3.tokens.Schema.Types.GlobalType), 
            SemanticType = require(v3.tokens.Schema.Types.SemanticType), 
            ComponentType = require(v3.tokens.Schema.Types.ComponentType)
        }
    }
};