import { useState } from "react";
import { useNuiEvent } from "../../hooks/useNuiEvent";
import "../../css/Clothing.css";
import { ClothingElement } from "./clothing-element";


export const Menu: React.FC = () => {
    const [menuVisible, setMenuVisible] = useState(true);

    useNuiEvent<boolean>('setMenuVisible', setMenuVisible);
    useNuiEvent<false>('closeMenu', () => {
        setMenuVisible(false);
    });

    if (!menuVisible) return null;

    return (
        <div className="menu">
            <ClothingElement valueIdentifier="ped" label="Ped" />
            <ClothingElement valueIdentifier="custom-ped" label="Custom Ped"/>
        </div>
    )
}
