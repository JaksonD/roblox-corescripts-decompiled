local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local l_FFlagChatLineReportingFocusFixesEnabled_0 = require(l_Parent_0.SharedFlags).FFlagChatLineReportingFocusFixesEnabled;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
return function(v11) --[[ Line: 32 ]] --[[ Name: ChatLineReportInfo ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_useLocalization_0 (copy), v9 (copy), v3 (copy), v10 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), l_View_0 (copy)
    local v12 = l_useTokens_0();
    local v13, v14 = v2.useState(false);
    local v15 = l_useLocalization_0(v9.ChatLineLocalizationKeys);
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v11 (copy)
        v14(v11.visible);
    end, {
        v11.visible
    });
    local v16, v17 = v3.useAnimatedBinding(1, function() --[[ Line: 42 ]]

    end);
    local v18 = v2.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy)
        if v13 then
            return 0;
        else
            return 1;
        end;
    end, {
        v13
    });
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v17 (copy), v3 (ref), v18 (copy), v10 (ref)
        v17(v3.spring(v18, v10));
    end, {
        v18
    });
    return v2.createElement("TextButton", {
        Active = v16:map(function(v19) --[[ Line: 53 ]]
            return v19 == 0;
        end), 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Selectable = not l_FFlagChatLineReportingFocusFixesEnabled_0 and nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        Text = "", 
        [v2.Event.Activated] = function() --[[ Line: 62 ]]
            -- upvalues: v14 (copy)
            v14(false);
        end, 
        ZIndex = v16:map(function(v20) --[[ Line: 66 ]]
            return (1 - v20) * 4;
        end)
    }, {
        InfoTextFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = v16:map(function(v21) --[[ Line: 74 ]]
                return UDim2.new(1, 0, 0, 60):Lerp(UDim2.new(1, 0, 0, 0), v21);
            end), 
            ClipsDescendants = true, 
            ZIndex = 2
        }, {
            InfoTextContainer = v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 1, -8), 
                tag = "bg-over-media-0 radius-medium anchor-bottom-left position-bottom-left"
            }, {
                InfoText = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v12.Typography.BodySmall.Font, 
                    Text = v15.InfoTextKey, 
                    TextColor3 = v12.Color.Content.Default.Color3, 
                    TextSize = v12.Typography.BodySmall.FontSize, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 1, 0)
                })
            })
        })
    });
end;