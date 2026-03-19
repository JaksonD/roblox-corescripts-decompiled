local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Constants);
local v2 = require(script.Parent.MicroProfilerPanel);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = v3.Component:extend("RecentlyCapturedDumpsView");
v5.render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    if not v6.props.RecentDumpPaths then
        local _ = {};
    end;
    local v8 = {};
    for _, v10 in ipairs(v6.props.RecentDumpPaths) do
        table.insert(v8, {
            DumpPathLabel = v3.createElement("TextBox", {
                Font = v1.Font.Log, 
                Text = v10, 
                TextColor3 = v1.Color.Text, 
                TextSize = 14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                TextEditable = false, 
                ClearTextOnFocus = false, 
                ClipsDescendants = true
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v1.MicroProfilerFormatting.RecentDumpPathPadding), 
                    PaddingRight = UDim.new(0, v1.MicroProfilerFormatting.RecentDumpPathPadding)
                })
            })
        });
    end;
    if #v8 == 0 then
        table.insert(v8, {
            NoDumpsLabel = v3.createElement("TextLabel", {
                Font = v1.Font.MainWindow, 
                Text = "No recently captured MicroProfiler dumps.", 
                TextColor3 = v1.Color.Text, 
                TextSize = v1.MicroProfilerFormatting.OptionTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v1.MicroProfilerFormatting.OptionTextPadding)
                })
            })
        });
    end;
    return v3.createElement(v2, {
        Title = "Recently captured MicroProfiler dumps", 
        LayoutOrder = v6.props.LayoutOrder, 
        Sections = {
            {
                Name = "RecentlyCapturedDumps", 
                Rows = v8
            }
        }
    });
end;
return v4.connect(function(v11, _) --[[ Line: 67 ]] --[[ Name: mapStateToProps ]]
    return {
        RecentDumpPaths = v11.MicroProfiler.recentDumpPaths
    };
end, nil)(v5);