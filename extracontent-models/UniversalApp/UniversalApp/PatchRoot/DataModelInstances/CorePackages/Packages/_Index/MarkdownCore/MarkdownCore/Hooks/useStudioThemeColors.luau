local l_Parent_0 = script:FindFirstAncestor("Hooks").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Utils.Highlighter.Theme);
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.Utils.isCli);
return function() --[[ Line: 8 ]] --[[ Name: useStudioThemeColors ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy)
    local v5, v6 = v1.useState(v2.defaultColors);
    v1.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v2 (ref), v6 (copy)
        local function v9() --[[ Line: 12 ]] --[[ Name: getTokens ]]
            -- upvalues: v4 (ref), v2 (ref)
            if v4() then
                return v2.defaultColors;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
                    return settings().Studio.Theme;
                end);
                if not l_status_0 then
                    return {};
                else
                    return {
                        background = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptBackground), 
                        iden = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptText), 
                        keyword = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword), 
                        builtin = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction), 
                        string = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptString), 
                        number = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptNumber), 
                        comment = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptComment), 
                        operator = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptOperator), 
                        custom = l_result_0:GetColor(Enum.StudioStyleGuideColor.ScriptBool)
                    };
                end;
            end;
        end;
        v6((v9()));
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 40 ]]
            -- upvalues: v6 (ref), v9 (copy)
            return settings().Studio.ThemeChanged:Connect(function() --[[ Line: 41 ]]
                -- upvalues: v6 (ref), v9 (ref)
                v6((v9()));
            end);
        end);
        return function() --[[ Line: 46 ]]
            -- upvalues: l_status_1 (copy), l_result_1 (copy)
            if l_status_1 and l_result_1 then
                l_result_1:Disconnect();
            end;
        end;
    end, {});
    return v5;
end;