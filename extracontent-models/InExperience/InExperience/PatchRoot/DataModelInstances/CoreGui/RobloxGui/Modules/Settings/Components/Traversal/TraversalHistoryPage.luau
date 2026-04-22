local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.SignalsReact);
local v7 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.ReactPageSignal);
local v12 = require(script.Parent.TraversalLeaveConfirmation);
local l_getRbxThumb_0 = v4.Utility.getRbxThumb;
local l_ThumbnailSize_0 = v4.Enums.ThumbnailSize;
local l_ThumbnailType_0 = v4.Enums.ThumbnailType;
local l_View_0 = v4.View;
local l_Traversal_0 = v7.Traversal;
local l_default_0 = l_Traversal_0.LocalTraversalHistory.default;
local l_useLastInputMode_0 = v8.useLastInputMode;
local l_GetInputModeStore_0 = v9.GetInputModeStore;
local l_Input_0 = v9.Input;
local l_Constants_0 = l_Traversal_0.Constants;
local l_HistoryPage_0 = l_Traversal_0.HistoryPage;
local l_useHistoryItems_0 = l_Traversal_0.useHistoryItems;
local l_FIntMaximumTraversalHistoryItemsFetch_0 = l_Traversal_0.Flags.FIntMaximumTraversalHistoryItemsFetch;
local l_FFlagTraversalExpPagePaddingFixes_0 = l_Traversal_0.Flags.FFlagTraversalExpPagePaddingFixes;
local l_FFlagTraversalPerfFixes_0 = l_Traversal_0.Flags.FFlagTraversalPerfFixes;
local l_FFlagTraversalRemoveLastInput_0 = l_Traversal_0.Flags.FFlagTraversalRemoveLastInput;
local l_FFlagFixTraversalHistoryMenuFixesV3_0 = l_Traversal_0.Flags.FFlagFixTraversalHistoryMenuFixesV3;
return v5.memo(v5.forwardRef(function(_, v31) --[[ Line: 39 ]] --[[ Name: TraversalHistoryPage ]]
    -- upvalues: v5 (copy), l_FIntMaximumTraversalHistoryItemsFetch_0 (copy), l_useHistoryItems_0 (copy), l_Constants_0 (copy), v6 (copy), v11 (copy), l_FFlagTraversalRemoveLastInput_0 (copy), l_useLastInputMode_0 (copy), l_FFlagFixTraversalHistoryMenuFixesV3_0 (copy), l_UserInputService_0 (copy), l_GetInputModeStore_0 (copy), l_Input_0 (copy), l_GuiService_0 (copy), v3 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_FFlagTraversalPerfFixes_0 (copy), l_default_0 (copy), l_View_0 (copy), l_FFlagTraversalExpPagePaddingFixes_0 (copy), l_HistoryPage_0 (copy), v12 (copy)
    local v32 = v5.useRef(nil);
    v5.useImperativeHandle(v31, function() --[[ Line: 41 ]]
        -- upvalues: v32 (copy)
        return v32.current;
    end, {});
    local v33, v34 = v5.useState(l_FIntMaximumTraversalHistoryItemsFetch_0);
    local v35 = l_useHistoryItems_0(v33);
    local v36, v37 = v5.useState(l_Constants_0.NO_UNIVERSE_ID);
    local v38 = v6.useSignalState(v11);
    local v39 = nil;
    if not l_FFlagTraversalRemoveLastInput_0 then
        v39 = l_useLastInputMode_0();
    end;
    if l_FFlagFixTraversalHistoryMenuFixesV3_0 then
        v5.useEffect(function() --[[ Line: 54 ]]
            -- upvalues: l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v32 (copy), l_GuiService_0 (ref)
            local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
            local v41 = l_GetInputModeStore_0().getLastInputType();
            local v42 = true;
            if v41 ~= l_Input_0.Directional then
                v42 = false;
                if v41 == l_Input_0.Pointer then
                    v42 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Keyboard;
                end;
            end;
            if v42 and v32.current then
                l_GuiService_0.SelectedCoreObject = v32.current;
            end;
        end, {});
    end;
    local v44 = v5.useCallback(function(v43) --[[ Line: 64 ]]
        -- upvalues: v37 (copy)
        v37(v43);
    end, {
        v37
    });
    local v49 = v5.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v37 (copy), l_Constants_0 (ref), l_FFlagTraversalRemoveLastInput_0 (ref), l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v39 (ref), v32 (copy), l_GuiService_0 (ref)
        v37(l_Constants_0.NO_UNIVERSE_ID);
        local v45 = nil;
        if l_FFlagTraversalRemoveLastInput_0 then
            local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
            local v47 = l_GetInputModeStore_0().getLastInputType();
            local v48 = true;
            if v47 ~= l_Input_0.Directional then
                v48 = false;
                if v47 == l_Input_0.Pointer then
                    v48 = l_l_UserInputService_0_LastInputType_1 == Enum.UserInputType.Keyboard;
                end;
            end;
            v45 = v48;
        else
            v45 = v39 == "Focus";
        end;
        if v45 and v32.current then
            l_GuiService_0.SelectedCoreObject = v32.current;
        end;
    end, if l_FFlagTraversalRemoveLastInput_0 then {} else {
        v37, 
        v39
    });
    local v51 = v5.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v3 (ref), v35 (copy), l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_ThumbnailSize_0 (ref)
        return (v3.List.map(v35, function(v50) --[[ Line: 84 ]]
            -- upvalues: l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_ThumbnailSize_0 (ref)
            return {
                placeId = v50.placeId, 
                universeId = v50.universeId, 
                name = v50.name, 
                image = l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, v50.universeId, l_ThumbnailSize_0.Medium), 
                rating = v50.rating
            };
        end));
    end, {
        v35
    });
    local v52 = nil;
    local v53 = nil;
    if not l_FFlagTraversalPerfFixes_0 then
        local v54, v55 = v5.useState(false);
        v52 = v54;
        v53 = v55;
        v5.useEffect(function() --[[ Line: 99 ]]
            -- upvalues: v35 (copy), v53 (ref)
            if v35 ~= nil then
                v53(false);
            end;
        end, {
            v35, 
            v53
        });
    end;
    local v57 = v5.useCallback(function(v56) --[[ Line: 105 ]]
        -- upvalues: l_FFlagTraversalPerfFixes_0 (ref), v33 (copy), l_default_0 (ref), v52 (ref), v53 (ref), v34 (copy)
        if l_FFlagTraversalPerfFixes_0 then
            if v33 >= #l_default_0:getUniverseHistory() then
                return;
            end;
        elseif v52 then
            return;
        else
            v53(true);
        end;
        v34(v33 + v56);
    end, if l_FFlagTraversalPerfFixes_0 then {
        v33
    } else {
        v33, 
        v34, 
        v52, 
        v53
    });
    local v58 = false;
    if next(v51) ~= nil then
        v58 = v5.createElement(l_View_0, {
            tag = "size-full " .. (l_FFlagTraversalExpPagePaddingFixes_0 and "padding-top-medium" or "padding-large")
        }, {
            HistoryPage = v5.createElement(l_HistoryPage_0, {
                historyItems = v51, 
                onHistoryClose = function() --[[ Line: 124 ]] --[[ Name: onHistoryClose ]]
                    -- upvalues: v38 (copy)
                    v38.setCurrentReactPage(nil);
                end, 
                onCardItemActivated = v44, 
                onLoadMoreHistory = v57, 
                ref = v32
            })
        }, {
            Dialog = v5.createElement(v12, {
                isDialogOpen = l_Constants_0.NO_UNIVERSE_ID < v36, 
                onCancel = v49, 
                onClose = v49, 
                universeId = v36, 
                source = "history_landing_page"
            })
        });
    end;
    return v58;
end));