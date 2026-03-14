local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useEffect_0 = v4.useEffect;
local l_useMemo_0 = v4.useMemo;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_Enum_0 = v5.App.Button.Enum;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v12 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v15 = {
    bodyText = "Placeholder body", 
    onHeightChanged = function(_) --[[ Line: 43 ]] --[[ Name: onHeightChanged ]]

    end, 
    onAccepted = nil, 
    onDenied = nil
};
return function(v16) --[[ Line: 51 ]] --[[ Name: ConversationModal ]]
    -- upvalues: v3 (copy), v15 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v13 (copy), v12 (copy), l_useEffect_0 (copy), l_useMemo_0 (copy), l_Enum_0 (copy), v4 (copy), l_ButtonStack_0 (copy)
    local v17 = v3.Dictionary.join(v15, v16);
    local v18 = l_useStyle_0();
    local v19 = v17.style or v18;
    local v20 = l_useTokens_0();
    local v21 = v13();
    local l_Size_500_0 = v19.Tokens.Global.Size_500;
    local l_Space_250_0 = v19.Tokens.Global.Space_250;
    local v24 = v12();
    l_useEffect_0(function() --[[ Line: 62 ]]
        -- upvalues: v17 (copy)
        return function() --[[ Line: 63 ]]
            -- upvalues: v17 (ref)
            v17.onHeightChanged(0);
        end;
    end, {});
    local v26 = l_useMemo_0(function() --[[ Line: 68 ]]
        -- upvalues: v17 (copy), l_Enum_0 (ref)
        local v25 = {};
        if v17.denyText then
            table.insert(v25, {
                buttonType = l_Enum_0.ButtonType.Secondary, 
                props = {
                    onActivated = v17.onDenied, 
                    text = v17.denyText, 
                    isDisabled = v17.loading
                }
            });
        end;
        if v17.acceptText then
            table.insert(v25, {
                buttonType = l_Enum_0.ButtonType.PrimarySystem, 
                props = {
                    onActivated = v17.onAccepted, 
                    text = v17.acceptText, 
                    isDisabled = v17.loading
                }
            });
        end;
        return v25;
    end, {
        v17.acceptText, 
        v17.denyText, 
        v17.loading, 
        v17.onDenied, 
        v17.onAccepted
    });
    return v4.createElement("Frame", {
        Name = "ConversationModal", 
        BackgroundTransparency = if v21 then v20.Color.OverMedia.OverMedia_100.Transparency else v19.Theme.SystemPrimaryContent.Transparency, 
        BackgroundColor3 = if v21 then v20.Color.OverMedia.OverMedia_100.Color3 else v19.Theme.SystemPrimaryContent.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v17.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v4.Change.AbsoluteSize] = function(v27) --[[ Line: 105 ]]
            -- upvalues: v17 (copy)
            v17.onHeightChanged(v27.AbsoluteSize.Y);
        end
    }, {
        ContentPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, if v17.paddingTop ~= nil then v17.paddingTop else l_Space_250_0), 
            PaddingBottom = UDim.new(0, if v17.paddingBottom ~= nil then v17.paddingBottom else l_Space_250_0), 
            PaddingLeft = UDim.new(0, v24.left), 
            PaddingRight = UDim.new(0, v24.right)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, if v17.verticalSpacing ~= nil then v17.verticalSpacing else l_Space_250_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Body = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            TextSize = v19.Tokens.Global.FontSize_75, 
            Font = v19.Font.Body.Font, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v17.bodyText, 
            TextWrapped = true, 
            TextColor3 = v19.Theme.TextDefault.Color, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Buttons = if #v26 > 0 then v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_Size_500_0)
        }, {
            ButtonStack = v4.createElement(l_ButtonStack_0, {
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = v26
            })
        }) else nil
    });
end;