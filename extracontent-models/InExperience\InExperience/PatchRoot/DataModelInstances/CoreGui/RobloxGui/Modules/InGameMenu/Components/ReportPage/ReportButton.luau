local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.GlobalConfig);
local v8 = require(l_Parent_0.Resources.Assets);
local v9 = require(l_Parent_0.Actions.OpenReportDialog);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v13 = l_t_0.strictInterface({
    userId = l_t_0.optional(l_t_0.integer), 
    userName = l_t_0.optional(l_t_0.string), 
    LayoutOrder = l_t_0.integer, 
    dispatchOpenReportDialog = l_t_0.callback
});
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v14) --[[ Line: 49 ]]
    -- upvalues: v9 (copy)
    return {
        dispatchOpenReportDialog = function(v15, v16) --[[ Line: 51 ]] --[[ Name: dispatchOpenReportDialog ]]
            -- upvalues: v14 (copy), v9 (ref)
            v14(v9(v15, v16));
        end
    };
end)(function(v17) --[[ Line: 28 ]] --[[ Name: ReportButton ]]
    -- upvalues: v7 (copy), v13 (copy), l_withSelectionCursorProvider_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v8 (copy), l_CursorKind_0 (copy)
    if v7.propValidation then
        assert(v13(v17));
    end;
    return l_withSelectionCursorProvider_0(function(v18) --[[ Line: 33 ]]
        -- upvalues: l_Roact_0 (ref), l_ImageSetButton_0 (ref), v8 (ref), v17 (copy), l_CursorKind_0 (ref)
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Selectable = false, 
            Image = v8.Images.ReportIcon, 
            Size = UDim2.new(0, 36, 0, 36), 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1, 
            LayoutOrder = v17.LayoutOrder, 
            SelectionImageObject = v18(l_CursorKind_0.RoundedRectNoInset), 
            [l_Roact_0.Event.Activated] = function() --[[ Line: 42 ]]
                -- upvalues: v17 (ref)
                v17.dispatchOpenReportDialog(v17.userId, v17.userName);
            end
        });
    end);
end);