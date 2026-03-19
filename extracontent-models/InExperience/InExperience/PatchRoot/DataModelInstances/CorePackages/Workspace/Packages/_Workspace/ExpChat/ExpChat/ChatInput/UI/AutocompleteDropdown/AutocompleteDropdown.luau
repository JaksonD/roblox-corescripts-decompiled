local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_List_0 = require(l_Parent_0.llama).List;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v7 = require(l_script_FirstAncestor_0.Config);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v9 = require(script.Parent.AutocompleteEntry);
return v3.memo(function(v10) --[[ Line: 20 ]] --[[ Name: AutoCompleteDropdown ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), l_Dictionary_0 (copy), v9 (copy), l_List_0 (copy), v7 (copy), l_TextChatService_0 (copy), v8 (copy)
    local v11 = v3.useRef(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v17 = v3.useCallback(function(v13) --[[ Line: 26 ]]
        -- upvalues: l_Dictionary_0 (ref), v3 (ref), v9 (ref), v10 (copy), l_List_0 (ref)
        local v16 = l_Dictionary_0.map(v13, function(v14, v15) --[[ Line: 27 ]]
            -- upvalues: v3 (ref), v9 (ref), v10 (ref), l_List_0 (ref), v13 (copy)
            return v3.createElement(v9, {
                result = v14, 
                layoutOrder = v15, 
                chatInputBarSettings = v10.chatInputBarSettings, 
                setTransparency = v10.setTransparency, 
                transparencyValue = v10.transparencyValue, 
                isDividerVisible = l_List_0.count(v13) ~= v15, 
                selectedIndex = v10.selectedIndex, 
                autocompleteType = v10.autocompleteType, 
                onAutocompleteDropdownHover = v10.onAutocompleteDropdownHover, 
                onAutocompleteSelected = v10.onAutocompleteSelected
            }), v14;
        end);
        v16["$layout"] = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v16;
    end);
    local function v29() --[[ Line: 51 ]] --[[ Name: setCanvasPosition ]]
        -- upvalues: v11 (copy), v10 (copy), v7 (ref)
        if v11.current then
            local l_current_0 = v10.autocompleteDropdownRef.current;
            local v19 = l_current_0 and l_current_0.AbsoluteSize.Y or v7.AutocompleteFrameDefaultSizeY;
            local v20 = v10.chatInputBarSettings.TextSize + 16;
            local v21 = 0;
            if l_current_0 and l_current_0:FindFirstChild("ScrollBarFrame") and l_current_0.ScrollBarFrame:FindFirstChild("ScrollViewFrame") and l_current_0.ScrollBarFrame.ScrollViewFrame:FindFirstChild("ScrollView") and l_current_0.ScrollBarFrame.ScrollViewFrame.ScrollView:FindFirstChild("OffsetFrame") then
                local l_OffsetFrame_0 = l_current_0.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                for _, v24 in ipairs(l_OffsetFrame_0:GetChildren()) do
                    if v24.ClassName == "Frame" and v24.LayoutOrder <= v10.selectedIndex then
                        v21 = v21 + v24.AbsoluteSize.Y;
                        if v24.LayoutOrder == v10.selectedIndex then
                            v20 = v24.AbsoluteSize.Y;
                        end;
                    end;
                end;
            end;
            local l_Y_0 = v11.current.CanvasPosition.Y;
            local v26 = l_Y_0 + v19;
            local v27 = v21 - v20;
            local l_l_Y_0_0 = l_Y_0;
            if v26 < v21 then
                l_l_Y_0_0 = v21 - v19;
            end;
            if v27 < l_Y_0 then
                l_l_Y_0_0 = v27;
            end;
            return Vector2.new(0, l_l_Y_0_0);
        else
            return Vector2.new(0, 0);
        end;
    end;
    local v30 = nil;
    local v31 = false;
    local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
    if l_ChatWindowConfiguration_0 then
        v30 = l_ChatWindowConfiguration_0.VerticalAlignment;
        v31 = l_ChatWindowConfiguration_0.Enabled;
    end;
    local v33 = false;
    if v30 == Enum.VerticalAlignment.Top then
        v33 = not v31;
    end;
    local v34 = v10.textBoxRef.current and v10.textBoxRef.current.AbsoluteSize.Y + 20;
    local v35 = v10.autocompleteDropdownRef.current and v10.autocompleteDropdownRef.current:FindFirstAncestor("appLayout") and v10.autocompleteDropdownRef.current:FindFirstAncestor("appLayout"):FindFirstChild("chatWindow") or nil;
    return v3.createElement("Frame", {
        AnchorPoint = v33 and Vector2.new(0, 0) or Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.95, 0, 0, #v10.results > 3 and v7.AutocompleteFrameDefaultSizeY or #v10.results * v7.AutocompleteEntryDefaultSizeY), 
        Position = UDim2.new(0, 0, 0, v33 and v34 or 0), 
        ZIndex = 2, 
        Visible = v10.activated and #v10.results > 0, 
        ref = v10.autocompleteDropdownRef
    }, {
        UISizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v7.ChatWindowMaxWidth, not (not v35 or v33) and v35.AbsoluteSize.Y or 1e999)
        }), 
        ScrollBarFrame = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v10.setTransparency(0, v10.transparencyValue), 
            BackgroundColor3 = v10.chatInputBarSettings.BackgroundColor3, 
            ZIndex = 2
        }, {
            Border = v3.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = v7.ChatInputBarBorderColor3, 
                Transparency = v10.setTransparency(v7.ChatInputBarBorderTransparency, v10.transparencyValue)
            }), 
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }), 
            ScrollViewFrame = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                ZIndex = 2
            }, {
                ScrollView = v3.createElement("ScrollingFrame", {
                    Size = UDim2.new(1, -4, 1, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(0, 0, 0, #v10.results * v7.AutocompleteEntryDefaultSizeY), 
                    CanvasPosition = v29(), 
                    BackgroundTransparency = 1, 
                    ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                    ScrollBarImageTransparency = v10.setTransparency(0, v10.transparencyValue), 
                    BorderSizePixel = 0, 
                    ScrollBarThickness = 4, 
                    VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                    ClipsDescendants = false, 
                    Selectable = not v8 or false, 
                    ZIndex = 2, 
                    ref = v11
                }, {
                    OffsetFrame = v3.createElement("Frame", {
                        Size = UDim2.new(1, 8, 1, 0), 
                        BackgroundTransparency = 1
                    }, v17(v10.results))
                })
            })
        })
    });
end);