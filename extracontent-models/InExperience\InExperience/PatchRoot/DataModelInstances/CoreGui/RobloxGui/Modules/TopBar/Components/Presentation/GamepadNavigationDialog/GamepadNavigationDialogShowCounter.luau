local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(script.Parent.GamepadNavigationDialog);
local _ = v3.PureComponent:extend("GamepadNavigationDialogShowCounter");
local function v14(v7, v8) --[[ Line: 20 ]] --[[ Name: shouldShowBasedOnCountInAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v7);
    local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("UserId");
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
        -- upvalues: l_HttpService_0 (ref), l_l_AppStorageService_0_Item_0 (copy)
        return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
    end);
    if not l_status_0 or type(l_result_0) ~= "table" then
        l_result_0 = {};
    end;
    local v13 = l_result_0[l_l_AppStorageService_0_Item_1];
    if type(v13) ~= "number" then
        v13 = 0;
    end;
    l_result_0[l_l_AppStorageService_0_Item_1] = v13 + 1;
    return v13 < v8, l_HttpService_0:JSONEncode(l_result_0);
end;
local function v16(v15) --[[ Line: 43 ]] --[[ Name: GamepadNavigationDialogTextButton ]]
    -- upvalues: v3 (copy), v5 (copy)
    v3.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v15 (copy)
        return v15.onCleanup;
    end, {});
    return v3.createElement("TextButton", {
        Text = "", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Event.Activated] = v15.onDismissed
    }, {
        GamepadNavigationDialog = v3.createElement(v5, {
            selectButtonDismissesGamepadNavigationDialog = v15.selectButtonDismissesGamepadNavigationDialog, 
            onDismissed = v15.onDismissed
        })
    });
end;
return function(v17) --[[ Line: 62 ]] --[[ Name: GamepadNavigationDialogShowCounter ]]
    -- upvalues: v14 (copy), v3 (copy), v16 (copy), l_AppStorageService_0 (copy)
    if not v17.isGamepadNavigationDialogEnabled or not v17.isGamepadNavigationDialogOpen then
        return nil;
    else
        local v18, v19 = v14(v17.appStorageKey, v17.maxShownCount);
        if not v18 then
            return nil;
        else
            return v3.createElement(v16, {
                selectButtonDismissesGamepadNavigationDialog = v17.selectButtonDismissesGamepadNavigationDialog, 
                onDismissed = function() --[[ Line: 74 ]] --[[ Name: onDismissed ]]
                    -- upvalues: v17 (copy)
                    v17.SetGamepadNavigationDialogOpen(false);
                end, 
                onCleanup = function() --[[ Line: 77 ]] --[[ Name: onCleanup ]]
                    -- upvalues: l_AppStorageService_0 (ref), v17 (copy), v19 (copy)
                    l_AppStorageService_0:SetItem(v17.appStorageKey, v19);
                    l_AppStorageService_0:Flush();
                end
            });
        end;
    end;
end;