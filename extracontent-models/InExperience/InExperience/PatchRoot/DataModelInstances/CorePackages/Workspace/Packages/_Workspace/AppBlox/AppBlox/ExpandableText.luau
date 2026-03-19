local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_useTokens_0 = v2.Hooks.useTokens;
local v8 = require(l_Parent_0.SignalsReact);
local v9 = require(l_Parent_0.TextSize);
local v10 = require(l_Parent_0.Cryo);
local v11 = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true);
local function v15(v12) --[[ Line: 33 ]] --[[ Name: getCompactLineMeasureText ]]
    if v12 <= 0 then
        return "";
    else
        local v13 = {};
        for _ = 1, v12 do
            table.insert(v13, "A");
        end;
        return (table.concat(v13, "\n"));
    end;
end;
return v1.memo(function(v16) --[[ Line: 45 ]] --[[ Name: ExpandableText ]]
    -- upvalues: v11 (copy), v8 (copy), v9 (copy), l_useTokens_0 (copy), v10 (copy), v1 (copy), l_useLocalization_0 (copy), l_useProperty_0 (copy), l_View_0 (copy), l_Text_0 (copy), v15 (copy)
    local v17 = if v11 then (v16.text or ""):gsub("[\r\n]+$", "") else v16.text;
    local v19 = v8.useSignalState(function(v18) --[[ Line: 49 ]]
        -- upvalues: v9 (ref)
        return v9.getTextSizeStore(v18).getTextSizeOffset(v18);
    end);
    local v20 = l_useTokens_0();
    local v21 = v16.fontStyle or v20.Typography.CaptionLarge;
    local v22 = v10.Dictionary.join(v21, {
        FontSize = v21.FontSize + v19
    });
    local v23 = v16.textColor or v20.Color.Content.Default.Color3;
    local v24 = v16.compactNumberOfLines or 3;
    local v25, v26 = v1.useState(v16.expandedInitially or false);
    local v29 = v1.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v26 (copy), v16 (copy)
        v26(function(v27) --[[ Line: 65 ]]
            -- upvalues: v16 (ref)
            local v28 = not v27;
            if v16.onExpandChanged then
                v16.onExpandChanged(v28);
            end;
            return v28;
        end);
    end, {
        v16.onExpandChanged
    });
    local v30 = l_useLocalization_0({
        moreText = "CommonUI.Features.Action.MoreLowercase", 
        lessText = "CommonUI.Features.Action.LessLowercase"
    });
    local v31 = v1.useRef(nil);
    local v32 = l_useProperty_0(v31, "AbsoluteSize");
    local v33 = v1.useRef(nil);
    local v34 = l_useProperty_0(v33, "AbsoluteSize");
    local v35 = v1.useRef(nil);
    local v36 = l_useProperty_0(v35, "AbsoluteSize");
    local v37 = v32 and v32.X > 0;
    local v38 = v34 and v34.Y or 0;
    local v39 = v36 and v36.Y or 0;
    local v40 = not v16.expandedInitially and v38 + 1 < v39;
    local v41 = v25 or not v40;
    local l_v39_0 = v39;
    local l_lessText_0 = v30.lessText;
    if v40 and not v25 then
        l_v39_0 = v38;
        l_lessText_0 = v30.moreText;
    end;
    if v17 == "" then
        return nil;
    else
        local v44 = if v41 then {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        } else {
            Size = UDim2.new(1, 0, 0, (math.ceil(l_v39_0)))
        };
        return v1.createElement(l_View_0, {
            tag = "col size-full-0 auto-y", 
            LayoutOrder = v16.LayoutOrder, 
            ref = v31
        }, {
            TextContent = if v37 and (v41 or l_v39_0 > 0) then v1.createElement(l_Text_0, v10.Dictionary.join({
                LayoutOrder = 1, 
                Text = v17, 
                fontStyle = v22, 
                textColor = v23, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }, v44)) else nil, 
            ToggleExpandButton = if v40 then v1.createElement(l_Text_0, {
                LayoutOrder = 2, 
                tag = "auto-xy radius-small", 
                Text = ("<u><b>%*</b></u>"):format(l_lessText_0), 
                fontStyle = v22, 
                textColor = v20.Color.Content.Emphasis.Color3, 
                onActivated = v29, 
                RichText = true
            }) else nil, 
            CompactTextMeasure = v1.createElement(l_Text_0, {
                Visible = false, 
                IgnoreLayout = true, 
                ref = v33, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3, 
                Text = v15(v24), 
                fontStyle = v22, 
                textColor = v23, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            FullTextMeasure = v1.createElement(l_Text_0, {
                Visible = false, 
                IgnoreLayout = true, 
                ref = v35, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 4, 
                Text = v17, 
                fontStyle = v22, 
                textColor = v23, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end;
end);