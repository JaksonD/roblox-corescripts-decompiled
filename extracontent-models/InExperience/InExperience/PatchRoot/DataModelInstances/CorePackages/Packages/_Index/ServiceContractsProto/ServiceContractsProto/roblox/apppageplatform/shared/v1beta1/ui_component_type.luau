local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
return {
    UiComponentType = ({
        UiComponentType = {
            fromNumber = function(v2) --[[ Line: 68 ]] --[[ Name: fromNumber ]]
                if v2 == 0 then
                    return "UI_COMPONENT_TYPE_INVALID";
                elseif v2 == 1 then
                    return "UI_COMPONENT_TYPE_FEED";
                elseif v2 == 10 then
                    return "UI_COMPONENT_TYPE_COLLECTION_CAROUSEL";
                elseif v2 == 11 then
                    return "UI_COMPONENT_TYPE_COLLECTION_GRID";
                elseif v2 == 12 then
                    return "UI_COMPONENT_TYPE_SINGLE_ITEM_COLLECTION";
                elseif v2 == 100 then
                    return "UI_COMPONENT_TYPE_TILE";
                elseif v2 == 101 then
                    return "UI_COMPONENT_TYPE_GAME_TILE";
                elseif v2 == 102 then
                    return "UI_COMPONENT_TYPE_SEE_ALL_TILE";
                elseif v2 == 103 then
                    return "UI_COMPONENT_TYPE_BADGE_TILE";
                elseif v2 == 200 then
                    return "UI_COMPONENT_TYPE_BUTTON";
                elseif v2 == 201 then
                    return "UI_COMPONENT_TYPE_IMAGE";
                elseif v2 == 202 then
                    return "UI_COMPONENT_TYPE_TEXT";
                elseif v2 == 203 then
                    return "UI_COMPONENT_TYPE_VIEW";
                elseif v2 == 204 then
                    return "UI_COMPONENT_TYPE_DIVIDER";
                elseif v2 == 205 then
                    return "UI_COMPONENT_TYPE_DIALOG";
                elseif v2 == 206 then
                    return "UI_COMPONENT_TYPE_TEXT_ICON_ROW";
                elseif v2 == 207 then
                    return "UI_COMPONENT_TYPE_TEXT_PILL";
                elseif v2 == 208 then
                    return "UI_COMPONENT_TYPE_SECTION_HEADER";
                elseif v2 == 209 then
                    return "UI_COMPONENT_TYPE_SLOT_OVERLAY";
                elseif v2 == 210 then
                    return "UI_COMPONENT_TYPE_TILE_FOOTER";
                elseif v2 == 211 then
                    return "UI_COMPONENT_TYPE_ATTRIBUTION_ROW";
                elseif v2 == 212 then
                    return "UI_COMPONENT_TYPE_GAME_TILE_ACTIVE_FRIENDS_FOOTER";
                elseif v2 == 213 then
                    return "UI_COMPONENT_TYPE_HERO_UNIT";
                elseif v2 == 214 then
                    return "UI_COMPONENT_TYPE_HOLD_TO_PLAY";
                elseif v2 == 215 then
                    return "UI_COMPONENT_TYPE_PLAY_BUTTON";
                elseif v2 == 216 then
                    return "UI_COMPONENT_TYPE_COUNTDOWN_TEXT_ICON_ROW";
                elseif v2 == 217 then
                    return "UI_COMPONENT_TYPE_INFO_TABLE";
                elseif v2 == 218 then
                    return "UI_COMPONENT_TYPE_INFO_TABLE_CELL";
                elseif v2 == 219 then
                    return "UI_COMPONENT_TYPE_CHIP";
                elseif v2 == 220 then
                    return "UI_COMPONENT_TYPE_DUAL_ACTION_CHIP";
                elseif v2 == 221 then
                    return "UI_COMPONENT_TYPE_EXPANDABLE_TEXT";
                elseif v2 == 222 then
                    return "UI_COMPONENT_TYPE_ASSOCIATED_ITEMS_ROW";
                elseif v2 == 223 then
                    return "UI_COMPONENT_TYPE_OVERFLOW_MENU";
                elseif v2 == 224 then
                    return "UI_COMPONENT_TYPE_DETAILS_PAGE_IMAGE_HEADER";
                elseif v2 == 225 then
                    return "UI_COMPONENT_TYPE_CARD";
                elseif v2 == 226 then
                    return "UI_COMPONENT_TYPE_TABS";
                elseif v2 == 227 then
                    return "UI_COMPONENT_TYPE_ACTION_BAR";
                elseif v2 == 228 then
                    return "UI_COMPONENT_TYPE_ICON";
                elseif v2 == 229 then
                    return "UI_COMPONENT_TYPE_CIRCLE_ICON";
                elseif v2 == 230 then
                    return "UI_COMPONENT_TYPE_CONTENT_RATING_LABEL";
                elseif v2 == 231 then
                    return "UI_COMPONENT_TYPE_PLAY_BUTTON_WITH_CONTEXTUAL_MESSAGE";
                elseif v2 == 300 then
                    return "UI_COMPONENT_TYPE_FOCUS_NAV_ACTIONS";
                elseif v2 == 400 then
                    return "UI_COMPONENT_TYPE_FRAGMENT";
                elseif v2 == 500 then
                    return "UI_COMPONENT_TYPE_VERTICAL_FEED";
                elseif v2 == 600 then
                    return "UI_COMPONENT_TYPE_CATALOG_VIRTUALIZED_FEED";
                elseif v2 == 601 then
                    return "UI_COMPONENT_TYPE_CATALOG_ITEM_GROUP";
                elseif v2 == 602 then
                    return "UI_COMPONENT_TYPE_CATALOG_ITEM_CAROUSEL";
                elseif v2 == 603 then
                    return "UI_COMPONENT_TYPE_CATALOG_CATEGORY_MENU";
                elseif v2 == 9999 then
                    return "UI_COMPONENT_TYPE_MOCK_COMPONENT";
                else
                    return nil;
                end;
            end, 
            toNumber = function(v3) --[[ Line: 172 ]] --[[ Name: toNumber ]]
                if v3 == "UI_COMPONENT_TYPE_INVALID" then
                    return 0;
                elseif v3 == "UI_COMPONENT_TYPE_FEED" then
                    return 1;
                elseif v3 == "UI_COMPONENT_TYPE_COLLECTION_CAROUSEL" then
                    return 10;
                elseif v3 == "UI_COMPONENT_TYPE_COLLECTION_GRID" then
                    return 11;
                elseif v3 == "UI_COMPONENT_TYPE_SINGLE_ITEM_COLLECTION" then
                    return 12;
                elseif v3 == "UI_COMPONENT_TYPE_TILE" then
                    return 100;
                elseif v3 == "UI_COMPONENT_TYPE_GAME_TILE" then
                    return 101;
                elseif v3 == "UI_COMPONENT_TYPE_SEE_ALL_TILE" then
                    return 102;
                elseif v3 == "UI_COMPONENT_TYPE_BADGE_TILE" then
                    return 103;
                elseif v3 == "UI_COMPONENT_TYPE_BUTTON" then
                    return 200;
                elseif v3 == "UI_COMPONENT_TYPE_IMAGE" then
                    return 201;
                elseif v3 == "UI_COMPONENT_TYPE_TEXT" then
                    return 202;
                elseif v3 == "UI_COMPONENT_TYPE_VIEW" then
                    return 203;
                elseif v3 == "UI_COMPONENT_TYPE_DIVIDER" then
                    return 204;
                elseif v3 == "UI_COMPONENT_TYPE_DIALOG" then
                    return 205;
                elseif v3 == "UI_COMPONENT_TYPE_TEXT_ICON_ROW" then
                    return 206;
                elseif v3 == "UI_COMPONENT_TYPE_TEXT_PILL" then
                    return 207;
                elseif v3 == "UI_COMPONENT_TYPE_SECTION_HEADER" then
                    return 208;
                elseif v3 == "UI_COMPONENT_TYPE_SLOT_OVERLAY" then
                    return 209;
                elseif v3 == "UI_COMPONENT_TYPE_TILE_FOOTER" then
                    return 210;
                elseif v3 == "UI_COMPONENT_TYPE_ATTRIBUTION_ROW" then
                    return 211;
                elseif v3 == "UI_COMPONENT_TYPE_GAME_TILE_ACTIVE_FRIENDS_FOOTER" then
                    return 212;
                elseif v3 == "UI_COMPONENT_TYPE_HERO_UNIT" then
                    return 213;
                elseif v3 == "UI_COMPONENT_TYPE_HOLD_TO_PLAY" then
                    return 214;
                elseif v3 == "UI_COMPONENT_TYPE_PLAY_BUTTON" then
                    return 215;
                elseif v3 == "UI_COMPONENT_TYPE_COUNTDOWN_TEXT_ICON_ROW" then
                    return 216;
                elseif v3 == "UI_COMPONENT_TYPE_INFO_TABLE" then
                    return 217;
                elseif v3 == "UI_COMPONENT_TYPE_INFO_TABLE_CELL" then
                    return 218;
                elseif v3 == "UI_COMPONENT_TYPE_CHIP" then
                    return 219;
                elseif v3 == "UI_COMPONENT_TYPE_DUAL_ACTION_CHIP" then
                    return 220;
                elseif v3 == "UI_COMPONENT_TYPE_EXPANDABLE_TEXT" then
                    return 221;
                elseif v3 == "UI_COMPONENT_TYPE_ASSOCIATED_ITEMS_ROW" then
                    return 222;
                elseif v3 == "UI_COMPONENT_TYPE_OVERFLOW_MENU" then
                    return 223;
                elseif v3 == "UI_COMPONENT_TYPE_DETAILS_PAGE_IMAGE_HEADER" then
                    return 224;
                elseif v3 == "UI_COMPONENT_TYPE_CARD" then
                    return 225;
                elseif v3 == "UI_COMPONENT_TYPE_TABS" then
                    return 226;
                elseif v3 == "UI_COMPONENT_TYPE_ACTION_BAR" then
                    return 227;
                elseif v3 == "UI_COMPONENT_TYPE_ICON" then
                    return 228;
                elseif v3 == "UI_COMPONENT_TYPE_CIRCLE_ICON" then
                    return 229;
                elseif v3 == "UI_COMPONENT_TYPE_CONTENT_RATING_LABEL" then
                    return 230;
                elseif v3 == "UI_COMPONENT_TYPE_PLAY_BUTTON_WITH_CONTEXTUAL_MESSAGE" then
                    return 231;
                elseif v3 == "UI_COMPONENT_TYPE_FOCUS_NAV_ACTIONS" then
                    return 300;
                elseif v3 == "UI_COMPONENT_TYPE_FRAGMENT" then
                    return 400;
                elseif v3 == "UI_COMPONENT_TYPE_VERTICAL_FEED" then
                    return 500;
                elseif v3 == "UI_COMPONENT_TYPE_CATALOG_VIRTUALIZED_FEED" then
                    return 600;
                elseif v3 == "UI_COMPONENT_TYPE_CATALOG_ITEM_GROUP" then
                    return 601;
                elseif v3 == "UI_COMPONENT_TYPE_CATALOG_ITEM_CAROUSEL" then
                    return 602;
                elseif v3 == "UI_COMPONENT_TYPE_CATALOG_CATEGORY_MENU" then
                    return 603;
                elseif v3 == "UI_COMPONENT_TYPE_MOCK_COMPONENT" then
                    return 9999;
                else
                    return v3;
                end;
            end, 
            fromName = function(v4) --[[ Line: 276 ]] --[[ Name: fromName ]]
                if v4 == "UI_COMPONENT_TYPE_INVALID" then
                    return "UI_COMPONENT_TYPE_INVALID";
                elseif v4 == "UI_COMPONENT_TYPE_FEED" then
                    return "UI_COMPONENT_TYPE_FEED";
                elseif v4 == "UI_COMPONENT_TYPE_COLLECTION_CAROUSEL" then
                    return "UI_COMPONENT_TYPE_COLLECTION_CAROUSEL";
                elseif v4 == "UI_COMPONENT_TYPE_COLLECTION_GRID" then
                    return "UI_COMPONENT_TYPE_COLLECTION_GRID";
                elseif v4 == "UI_COMPONENT_TYPE_SINGLE_ITEM_COLLECTION" then
                    return "UI_COMPONENT_TYPE_SINGLE_ITEM_COLLECTION";
                elseif v4 == "UI_COMPONENT_TYPE_TILE" then
                    return "UI_COMPONENT_TYPE_TILE";
                elseif v4 == "UI_COMPONENT_TYPE_GAME_TILE" then
                    return "UI_COMPONENT_TYPE_GAME_TILE";
                elseif v4 == "UI_COMPONENT_TYPE_SEE_ALL_TILE" then
                    return "UI_COMPONENT_TYPE_SEE_ALL_TILE";
                elseif v4 == "UI_COMPONENT_TYPE_BADGE_TILE" then
                    return "UI_COMPONENT_TYPE_BADGE_TILE";
                elseif v4 == "UI_COMPONENT_TYPE_BUTTON" then
                    return "UI_COMPONENT_TYPE_BUTTON";
                elseif v4 == "UI_COMPONENT_TYPE_IMAGE" then
                    return "UI_COMPONENT_TYPE_IMAGE";
                elseif v4 == "UI_COMPONENT_TYPE_TEXT" then
                    return "UI_COMPONENT_TYPE_TEXT";
                elseif v4 == "UI_COMPONENT_TYPE_VIEW" then
                    return "UI_COMPONENT_TYPE_VIEW";
                elseif v4 == "UI_COMPONENT_TYPE_DIVIDER" then
                    return "UI_COMPONENT_TYPE_DIVIDER";
                elseif v4 == "UI_COMPONENT_TYPE_DIALOG" then
                    return "UI_COMPONENT_TYPE_DIALOG";
                elseif v4 == "UI_COMPONENT_TYPE_TEXT_ICON_ROW" then
                    return "UI_COMPONENT_TYPE_TEXT_ICON_ROW";
                elseif v4 == "UI_COMPONENT_TYPE_TEXT_PILL" then
                    return "UI_COMPONENT_TYPE_TEXT_PILL";
                elseif v4 == "UI_COMPONENT_TYPE_SECTION_HEADER" then
                    return "UI_COMPONENT_TYPE_SECTION_HEADER";
                elseif v4 == "UI_COMPONENT_TYPE_SLOT_OVERLAY" then
                    return "UI_COMPONENT_TYPE_SLOT_OVERLAY";
                elseif v4 == "UI_COMPONENT_TYPE_TILE_FOOTER" then
                    return "UI_COMPONENT_TYPE_TILE_FOOTER";
                elseif v4 == "UI_COMPONENT_TYPE_ATTRIBUTION_ROW" then
                    return "UI_COMPONENT_TYPE_ATTRIBUTION_ROW";
                elseif v4 == "UI_COMPONENT_TYPE_GAME_TILE_ACTIVE_FRIENDS_FOOTER" then
                    return "UI_COMPONENT_TYPE_GAME_TILE_ACTIVE_FRIENDS_FOOTER";
                elseif v4 == "UI_COMPONENT_TYPE_HERO_UNIT" then
                    return "UI_COMPONENT_TYPE_HERO_UNIT";
                elseif v4 == "UI_COMPONENT_TYPE_HOLD_TO_PLAY" then
                    return "UI_COMPONENT_TYPE_HOLD_TO_PLAY";
                elseif v4 == "UI_COMPONENT_TYPE_PLAY_BUTTON" then
                    return "UI_COMPONENT_TYPE_PLAY_BUTTON";
                elseif v4 == "UI_COMPONENT_TYPE_COUNTDOWN_TEXT_ICON_ROW" then
                    return "UI_COMPONENT_TYPE_COUNTDOWN_TEXT_ICON_ROW";
                elseif v4 == "UI_COMPONENT_TYPE_INFO_TABLE" then
                    return "UI_COMPONENT_TYPE_INFO_TABLE";
                elseif v4 == "UI_COMPONENT_TYPE_INFO_TABLE_CELL" then
                    return "UI_COMPONENT_TYPE_INFO_TABLE_CELL";
                elseif v4 == "UI_COMPONENT_TYPE_CHIP" then
                    return "UI_COMPONENT_TYPE_CHIP";
                elseif v4 == "UI_COMPONENT_TYPE_DUAL_ACTION_CHIP" then
                    return "UI_COMPONENT_TYPE_DUAL_ACTION_CHIP";
                elseif v4 == "UI_COMPONENT_TYPE_EXPANDABLE_TEXT" then
                    return "UI_COMPONENT_TYPE_EXPANDABLE_TEXT";
                elseif v4 == "UI_COMPONENT_TYPE_ASSOCIATED_ITEMS_ROW" then
                    return "UI_COMPONENT_TYPE_ASSOCIATED_ITEMS_ROW";
                elseif v4 == "UI_COMPONENT_TYPE_OVERFLOW_MENU" then
                    return "UI_COMPONENT_TYPE_OVERFLOW_MENU";
                elseif v4 == "UI_COMPONENT_TYPE_DETAILS_PAGE_IMAGE_HEADER" then
                    return "UI_COMPONENT_TYPE_DETAILS_PAGE_IMAGE_HEADER";
                elseif v4 == "UI_COMPONENT_TYPE_CARD" then
                    return "UI_COMPONENT_TYPE_CARD";
                elseif v4 == "UI_COMPONENT_TYPE_TABS" then
                    return "UI_COMPONENT_TYPE_TABS";
                elseif v4 == "UI_COMPONENT_TYPE_ACTION_BAR" then
                    return "UI_COMPONENT_TYPE_ACTION_BAR";
                elseif v4 == "UI_COMPONENT_TYPE_ICON" then
                    return "UI_COMPONENT_TYPE_ICON";
                elseif v4 == "UI_COMPONENT_TYPE_CIRCLE_ICON" then
                    return "UI_COMPONENT_TYPE_CIRCLE_ICON";
                elseif v4 == "UI_COMPONENT_TYPE_CONTENT_RATING_LABEL" then
                    return "UI_COMPONENT_TYPE_CONTENT_RATING_LABEL";
                elseif v4 == "UI_COMPONENT_TYPE_PLAY_BUTTON_WITH_CONTEXTUAL_MESSAGE" then
                    return "UI_COMPONENT_TYPE_PLAY_BUTTON_WITH_CONTEXTUAL_MESSAGE";
                elseif v4 == "UI_COMPONENT_TYPE_FOCUS_NAV_ACTIONS" then
                    return "UI_COMPONENT_TYPE_FOCUS_NAV_ACTIONS";
                elseif v4 == "UI_COMPONENT_TYPE_FRAGMENT" then
                    return "UI_COMPONENT_TYPE_FRAGMENT";
                elseif v4 == "UI_COMPONENT_TYPE_VERTICAL_FEED" then
                    return "UI_COMPONENT_TYPE_VERTICAL_FEED";
                elseif v4 == "UI_COMPONENT_TYPE_CATALOG_VIRTUALIZED_FEED" then
                    return "UI_COMPONENT_TYPE_CATALOG_VIRTUALIZED_FEED";
                elseif v4 == "UI_COMPONENT_TYPE_CATALOG_ITEM_GROUP" then
                    return "UI_COMPONENT_TYPE_CATALOG_ITEM_GROUP";
                elseif v4 == "UI_COMPONENT_TYPE_CATALOG_ITEM_CAROUSEL" then
                    return "UI_COMPONENT_TYPE_CATALOG_ITEM_CAROUSEL";
                elseif v4 == "UI_COMPONENT_TYPE_CATALOG_CATEGORY_MENU" then
                    return "UI_COMPONENT_TYPE_CATALOG_CATEGORY_MENU";
                elseif v4 == "UI_COMPONENT_TYPE_MOCK_COMPONENT" then
                    return "UI_COMPONENT_TYPE_MOCK_COMPONENT";
                else
                    return nil;
                end;
            end
        }
    }).UiComponentType
};