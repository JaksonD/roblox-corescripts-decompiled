local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = v6.Focusable;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetails);
local l_DefaultMetricsGridView_0 = v8.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = v8.App.Grid.GridMetrics;
local l_useStyle_0 = v8.Core.Style.useStyle;
local v15 = {
    Color3.fromHex("#584D43"), 
    Color3.fromHex("#775D49"), 
    Color3.fromHex("#AB9585"), 
    Color3.fromHex("#C3916F"), 
    Color3.fromHex("#E2BA97"), 
    Color3.fromHex("#534338"), 
    Color3.fromHex("#63422C"), 
    Color3.fromHex("#B79C66"), 
    Color3.fromHex("#C2AD7F"), 
    Color3.fromHex("#D4C69F"), 
    Color3.fromHex("#917A78"), 
    Color3.fromHex("#98504E"), 
    Color3.fromHex("#CE8A7D"), 
    Color3.fromHex("#F7CBCA"), 
    Color3.fromHex("#F19DD9"), 
    Color3.fromHex("#77859B"), 
    Color3.fromHex("#5B7BAA"), 
    Color3.fromHex("#8DB9D9"), 
    Color3.fromHex("#AFA7F9"), 
    Color3.fromHex("#9D6298"), 
    Color3.fromHex("#3E8D9A"), 
    Color3.fromHex("#6A9855"), 
    Color3.fromHex("#829B70"), 
    Color3.fromHex("#A8C391"), 
    Color3.fromHex("#D89E52"), 
    Color3.fromHex("#EFCE53"), 
    Color3.fromHex("#F3DA7D"), 
    Color3.fromHex("#625F62"), 
    Color3.fromHex("#CDCDCD"), 
    Color3.fromHex("#F8F8F8")
};
return function() --[[ Line: 54 ]] --[[ Name: LookBackgroundPicker ]]
    -- upvalues: l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), v10 (copy), v2 (copy), v7 (copy), v11 (copy), l_Focusable_0 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), v15 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useStyle_0();
    local v18 = l_useDesignTokens_0();
    local v20 = l_useSelector_0(function(v19) --[[ Line: 59 ]]
        -- upvalues: v10 (ref)
        return v19.AvatarExperience.AvatarScene.Looks[v10.DraftLookId];
    end);
    local v25 = v2.useCallback(function(v21) --[[ Line: 64 ]]
        -- upvalues: v2 (ref), v20 (copy), v7 (ref), v16 (copy), v11 (ref), v10 (ref)
        return v2.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v21, 
            Text = "", 
            [v2.Event.Activated] = function() --[[ Line: 69 ]]
                -- upvalues: v21 (copy), v20 (ref), v7 (ref), v16 (ref), v11 (ref), v10 (ref)
                local v22 = v21:ToHex();
                local v23 = if v20 then v20.displayProperties else {};
                local v24 = v7.Dictionary.join(v23, {
                    backgroundType = "Hex", 
                    backgroundValue = v22
                });
                v16(v11(v10.DraftLookId, {
                    displayProperties = v24
                }));
            end
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        });
    end, {
        v20, 
        v16
    });
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Header = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v18.Global.Size_600), 
            BackgroundColor3 = v17.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            Text = "Select a background", 
            Font = v17.Font.Header2.Font, 
            TextSize = v17.Font.BaseSize * v17.Font.Header2.RelativeSize, 
            TextColor3 = v17.Theme.TextDefault.Color, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true, 
            ZIndex = 2
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v18.Global.Size_150)
            })
        }), 
        ScrollingFrame = v2.createElement(l_Focusable_0.ScrollingFrame, {
            BackgroundColor3 = v17.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            Position = UDim2.fromOffset(0, v18.Global.Size_600), 
            Size = UDim2.fromScale(1, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Container = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v18.Global.Size_150), 
                    PaddingBottom = UDim.new(0, v18.Global.Size_150), 
                    PaddingLeft = UDim.new(0, v18.Global.Size_150), 
                    PaddingRight = UDim.new(0, v18.Global.Size_150)
                }), 
                BackgroundColorsGrid = v2.createElement(l_DefaultMetricsGridView_0, {
                    renderItem = v25, 
                    getItemHeight = function(v26) --[[ Line: 130 ]] --[[ Name: getItemHeight ]]
                        return v26;
                    end, 
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter({
                        minimumItemsPerRow = 5, 
                        minimumItemWidth = 60
                    }), 
                    itemPadding = Vector2.new(v18.Global.Size_125, v18.Global.Size_125), 
                    items = v15, 
                    maxHeight = 1e999, 
                    defaultChildIndex = 1
                })
            })
        })
    });
end;