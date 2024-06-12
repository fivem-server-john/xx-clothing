import { useEffect, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import "../css/Clothing.scss"
import { CharacterCreator } from "./charactercreator/charactercreator";
import { ClothingMenu } from "./clothing/clothing";
import { fetchNui } from "../utils/fetchNui";

// Menu Types
//1: Character Creator
//2: Clothing


export const Menu: React.FC = () => {
    const [menuVisible, setMenuVisible] = useState(true);
    const [menuType, setMenuType] = useState(1);

    useNuiEvent<any>('setMenuVisible', (data) => {
        setMenuVisible(data.visible);
        setMenuType(data.menuType);
    });
    useNuiEvent<false>('closeMenu', () => {
        setMenuVisible(false);
    });

    function handleCloseMenu() {
        setMenuVisible(false);

        fetchNui<any>('closeMenu', {});
    }

    if (!menuVisible) return null;


    if (menuType === 1) {
        return <CharacterCreator closeMenu = {handleCloseMenu} />
    }
    if (menuType === 2) {
        return <ClothingMenu />
    }

    return null;
}