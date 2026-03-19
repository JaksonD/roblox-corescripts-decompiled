local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_sendAXCounterV2_0 = require(l_Parent_0.AvatarExperienceAnalytics).sendAXCounterV2;
local v6 = require(l_script_FirstAncestor_0.Constants);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_withMappedNavigationParams_0 = require(l_Parent_0.AvatarExperienceNavigation).withMappedNavigationParams;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_Parent_0.Foundation);
local l_View_0 = v10.View;
local l_Text_0 = v10.Text;
local l_Button_0 = v10.Button;
local l_ModalWindow_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.ModalWindow;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_FillBehavior_0 = v10.Enums.FillBehavior;
local l_InputSize_0 = v10.Enums.InputSize;
local l_FFlagAXInventoryDurablesSupport_0 = v4.FFlagAXInventoryDurablesSupport;
local l_FFlagAXLogItemsUnavailablePromptShown_0 = v4.FFlagAXLogItemsUnavailablePromptShown;
local function v21(v20) --[[ Line: 41 ]]
    return v20.ScreenSize;
end;
local v22 = {
    UnavailableItems = {
        TitleText = "Feature.Avatar.UnavailableItems.TitleText", 
        BodyText = "Feature.Avatar.UnavailableItems.BodyText", 
        BodyTextMultiple = "Feature.Avatar.UnavailableItems.BodyTextMultiple"
    }, 
    ItemsRemovedFromAvatar = {
        TitleText = "Feature.Avatar.ItemsRemovedFromAvatar.TitleText", 
        BodyText = "Feature.Avatar.UnavailableItems.BodyText", 
        BodyTextMultiple = "Feature.Avatar.UnavailableItems.BodyTextMultiple"
    }, 
    RevokedItems = {
        TitleText = "Feature.Avatar.ItemsRemovedFromAvatar.TitleText", 
        BodyText = "Feature.Avatar.RevokedItems.BodyText", 
        BodyTextMultiple = "Feature.Avatar.RevokedItems.BodyTextMultiple"
    }, 
    ItemDidNotMeetRobloxCommunityStandards = {
        TitleText = "Feature.Avatar.ItemDidNotMeetRobloxCommunityStandards.TitleText", 
        BodyText = "Feature.Avatar.ItemDidNotMeetRobloxCommunityStandards.BodyText"
    }, 
    PartiallyExpiredItems = if l_FFlagAXInventoryDurablesSupport_0 then {
        TitleText = "Feature.Durables.PartiallyExpiredItems.TitleText", 
        BodyText = "Feature.Durables.PartiallyExpiredItems.BodyText"
    } else nil
};
return (l_withMappedNavigationParams_0(function(v23) --[[ Line: 96 ]] --[[ Name: ItemsUnavailablePrompt ]]
    -- upvalues: l_FFlagAXLogItemsUnavailablePromptShown_0 (copy), v2 (copy), l_sendAXCounterV2_0 (copy), v6 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_useLocalization_0 (copy), v22 (copy), l_useSelector_0 (copy), v21 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), l_ModalWindow_0 (copy)
    if l_FFlagAXLogItemsUnavailablePromptShown_0 then
        v2.useEffect(function() --[[ Line: 98 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v6 (ref), v23 (copy)
            l_sendAXCounterV2_0(v6.COUNTERS.ItemsUnavailablePromptShown, {
                messageType = v23.messageType
            });
        end, {});
    end;
    local v24 = {};
    if l_FFlagAXInventoryDurablesSupport_0 then
        if v23.items then
            for _, v26 in v23.items do
                if v26.categoryLoc then
                    v24[v26.categoryLoc] = v26.categoryLoc;
                end;
            end;
        end;
    else
        for _, v28 in v23.items do
            if v28.categoryLoc then
                v24[v28.categoryLoc] = v28.categoryLoc;
            end;
        end;
    end;
    local v29 = l_useLocalization_0(v24);
    local function _(v30) --[[ Line: 124 ]] --[[ Name: localizeCategory ]]
        -- upvalues: v29 (copy)
        if v30.categoryLoc and v29[v30.categoryLoc] then
            return v29[v30.categoryLoc];
        else
            return v30.category or "";
        end;
    end;
    local function v36(v32) --[[ Line: 131 ]] --[[ Name: createItemListString ]]
        -- upvalues: v29 (copy)
        local v33 = "";
        for _, v35 in v32 do
            v33 = v33 .. "\226\128\162 " .. (if v35.categoryLoc and v29[v35.categoryLoc] then v29[v35.categoryLoc] else v35.category or "") .. " \"" .. v35.itemName .. "\"" .. (v35 ~= v32[#v32] and "\n" or "");
        end;
        return v33;
    end;
    local v37 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        if v23.items and #v23.items > 0 then
            if v22[v23.messageType].BodyTextMultiple and #v23.items > 1 then
                v37 = {
                    v22[v23.messageType].BodyTextMultiple; 
                    items = v36(v23.items), 
                    lineBreak = "\n\n"
                };
            else
                local v38 = {
                    v22[v23.messageType].BodyText; 
                    item = v23.items[1].itemName
                };
                local v39 = v23.items[1];
                v38.category = if v39.categoryLoc and v29[v39.categoryLoc] then v29[v39.categoryLoc] else v39.category or "";
                v38.lineBreak = "\n\n";
                v37 = v38;
            end;
        else
            v37 = v22[v23.messageType].BodyText;
        end;
    elseif v22[v23.messageType].BodyTextMultiple and #v23.items > 1 then
        v37 = {
            v22[v23.messageType].BodyTextMultiple; 
            items = v36(v23.items), 
            lineBreak = "\n\n"
        };
    else
        local v40 = {
            v22[v23.messageType].BodyText; 
            item = v23.items[1].itemName
        };
        local v41 = v23.items[1];
        v40.category = if v41.categoryLoc and v29[v41.categoryLoc] then v29[v41.categoryLoc] else v41.category or "";
        v40.lineBreak = "\n\n";
        v37 = v40;
    end;
    local v42 = l_useLocalization_0({
        ConfirmText = "Feature.Avatar.UnavailableItems.ConfirmText", 
        TitleText = v22[v23.messageType].TitleText, 
        BodyText = v37, 
        ViewInbox = "Feature.Avatar.RevokedItems.ViewInbox"
    });
    local v43 = l_useSelector_0(v21);
    local v44 = v2.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v23 (copy), v3 (ref)
        v23.navigation.dispatch(v3.Actions.back(nil));
    end, {
        v23.navigation
    });
    local v45 = v2.useCallback(function() --[[ Line: 194 ]]
        -- upvalues: v44 (copy), v23 (copy)
        v44();
        if v23.onConfirm then
            v23.onConfirm();
        end;
    end, {
        v23.onConfirm, 
        v44
    });
    local v46 = v2.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v44 (copy), v23 (copy)
        v44();
        if v23.navigateDown then
            v23.navigateDown();
        end;
    end, {
        v23.navigateDown, 
        v44
    });
    local function v47() --[[ Line: 210 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Text_0 (ref), v42 (copy)
        return v2.createElement(l_View_0, {
            tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
        }, {
            PromptBodyTitle = v2.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-truncate-end text-heading-small text-wrap", 
                Text = v42.TitleText, 
                LayoutOrder = 1, 
                padding = {
                    bottom = UDim.new(0, 8)
                }
            }), 
            PromptBodyText = v2.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-body-large text-wrap", 
                Text = v42.BodyText, 
                LayoutOrder = 2
            })
        });
    end;
    local function v48() --[[ Line: 230 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Button_0 (ref), v45 (copy), v42 (copy), l_ButtonVariant_0 (ref), l_FillBehavior_0 (ref), l_InputSize_0 (ref), v23 (copy), v46 (copy)
        return v2.createElement(l_View_0, {
            tag = "col gap-medium auto-y size-full-0 fill-x"
        }, {
            Buttons = v2.createElement(l_Button_0, {
                tag = "size-full-0 auto-y", 
                onActivated = v45, 
                text = v42.ConfirmText, 
                variant = l_ButtonVariant_0.Emphasis, 
                width = UDim.new(1, 0), 
                fillBehavior = l_FillBehavior_0.Fill, 
                size = l_InputSize_0.Medium, 
                LayoutOrder = 3
            }), 
            ViewDetailButton = if v23.messageType == "RevokedItems" then v2.createElement(l_Button_0, {
                tag = "size-full-0 auto-y", 
                onActivated = v46, 
                text = v42.ViewInbox, 
                variant = l_ButtonVariant_0.Standard, 
                width = UDim.new(1, 0), 
                LayoutOrder = 4
            }) else nil
        });
    end;
    return v2.createElement(l_ModalWindow_0, {
        screenSize = v43, 
        isFullHeight = false
    }, {
        ViewFrame = v2.createElement(l_View_0, {
            tag = "auto-y size-full-0 padding-xxlarge col align-x-left align-y-top"
        }, {
            ContentContainer = v47(), 
            ButtonContainer = v48()
        })
    });
end));