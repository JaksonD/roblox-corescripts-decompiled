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
return v5.memo(v5.forwardRef(function(_, v30) --[[ Line: 38 ]] --[[ Name: TraversalHistoryPage ]]
    -- upvalues: v5 (copy), l_FIntMaximumTraversalHistoryItemsFetch_0 (copy), l_useHistoryItems_0 (copy), l_Constants_0 (copy), v6 (copy), v11 (copy), l_FFlagTraversalRemoveLastInput_0 (copy), l_useLastInputMode_0 (copy), l_UserInputService_0 (copy), l_GetInputModeStore_0 (copy), l_Input_0 (copy), l_GuiService_0 (copy), v3 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_FFlagTraversalPerfFixes_0 (copy), l_default_0 (copy), l_View_0 (copy), l_FFlagTraversalExpPagePaddingFixes_0 (copy), l_HistoryPage_0 (copy), v12 (copy)
    local v31 = v5.useRef(nil);
    v5.useImperativeHandle(v30, function() --[[ Line: 40 ]]
        -- upvalues: v31 (copy)
        return v31.current;
    end, {});
    local v32, v33 = v5.useState(l_FIntMaximumTraversalHistoryItemsFetch_0);
    local v34 = l_useHistoryItems_0(v32);
    local v35, v36 = v5.useState(l_Constants_0.NO_UNIVERSE_ID);
    local v37 = v6.useSignalState(v11);
    local v38 = nil;
    if not l_FFlagTraversalRemoveLastInput_0 then
        v38 = l_useLastInputMode_0();
    end;
    local v40 = v5.useCallback(function(v39) --[[ Line: 52 ]]
        -- upvalues: v36 (copy)
        v36(v39);
    end, {
        v36
    });
    local v45 = v5.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v36 (copy), l_Constants_0 (ref), l_FFlagTraversalRemoveLastInput_0 (ref), l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v38 (ref), v31 (copy), l_GuiService_0 (ref)
        v36(l_Constants_0.NO_UNIVERSE_ID);
        local v41 = nil;
        if l_FFlagTraversalRemoveLastInput_0 then
            local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
            local v43 = l_GetInputModeStore_0().getLastInputType();
            local v44 = true;
            if v43 ~= l_Input_0.Directional then
                v44 = false;
                if v43 == l_Input_0.Pointer then
                    v44 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Keyboard;
                end;
            end;
            v41 = v44;
        else
            v41 = v38 == "Focus";
        end;
        if v41 and v31.current then
            l_GuiService_0.SelectedCoreObject = v31.current;
        end;
    end, if l_FFlagTraversalRemoveLastInput_0 then {} else {
        v36, 
        v38
    });
    local v47 = v5.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v3 (ref), v34 (copy), l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_ThumbnailSize_0 (ref)
        return (v3.List.map(v34, function(v46) --[[ Line: 72 ]]
            -- upvalues: l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), l_ThumbnailSize_0 (ref)
            return {
                placeId = v46.placeId, 
                universeId = v46.universeId, 
                name = v46.name, 
                image = l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, v46.universeId, l_ThumbnailSize_0.Medium), 
                rating = v46.rating
            };
        end));
    end, {
        v34
    });
    local v48 = nil;
    local v49 = nil;
    if not l_FFlagTraversalPerfFixes_0 then
        local v50, v51 = v5.useState(false);
        v48 = v50;
        v49 = v51;
        v5.useEffect(function() --[[ Line: 87 ]]
            -- upvalues: v34 (copy), v49 (ref)
            if v34 ~= nil then
                v49(false);
            end;
        end, {
            v34, 
            v49
        });
    end;
    local v53 = v5.useCallback(function(v52) --[[ Line: 93 ]]
        -- upvalues: l_FFlagTraversalPerfFixes_0 (ref), v32 (copy), l_default_0 (ref), v48 (ref), v49 (ref), v33 (copy)
        if l_FFlagTraversalPerfFixes_0 then
            if v32 >= #l_default_0:getUniverseHistory() then
                return;
            end;
        elseif v48 then
            return;
        else
            v49(true);
        end;
        v33(v32 + v52);
    end, if l_FFlagTraversalPerfFixes_0 then {
        v32
    } else {
        v32, 
        v33, 
        v48, 
        v49
    });
    local v54 = false;
    if next(v47) ~= nil then
        v54 = v5.createElement(l_View_0, {
            tag = "size-full " .. (l_FFlagTraversalExpPagePaddingFixes_0 and "padding-top-medium" or "padding-large")
        }, {
            HistoryPage = v5.createElement(l_HistoryPage_0, {
                historyItems = v47, 
                onHistoryClose = function() --[[ Line: 112 ]] --[[ Name: onHistoryClose ]]
                    -- upvalues: v37 (copy)
                    v37.setCurrentReactPage(nil);
                end, 
                onCardItemActivated = v40, 
                onLoadMoreHistory = v53, 
                ref = v31
            })
        }, {
            Dialog = v5.createElement(v12, {
                isDialogOpen = l_Constants_0.NO_UNIVERSE_ID < v35, 
                onCancel = v45, 
                onClose = v45, 
                universeId = v35, 
                source = "history_landing_page"
            })
        });
    end;
    return v54;
end));