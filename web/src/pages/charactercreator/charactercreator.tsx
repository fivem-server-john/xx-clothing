import { useEffect, useState } from "react";
import { fetchNui } from "../../utils/fetchNui";
import { ClothingElement } from "../../components/menu/clothing-element";
import CharacterProperties from "../../interfaces/CharacterData";

let testData: CharacterCreatorData = {
    peds: ["a_m_m_genfat_01",  "a_m_m_acult_01"],
    customPeds: ["u_m_o_dean"]
}


interface CharacterCreatorData {
    peds: string[]
    customPeds: string[]
}

let currentCharacterData: CharacterProperties = {pedModel: ""};
export function CharacterCreator() {
    const [data, setData] = useState<CharacterCreatorData>(testData);

    useEffect(() => {
        fetchNui<any>('fetchMenuData', {
            type: 1,
        }).then((response) => {
            setData(response);
        })
    }, []);

    if (!data) return null;

    function getPedImages() {
        return data.peds;
    }

    function getCustomPedImages() {
        return data.customPeds;
    }

    function handleElementChange(identifier: string, component: number, variant: number) {
        console.log(identifier, component, variant);
        fetchNui<any>('characterDataChanged', {
            identifier: identifier,
            component: component,
            variant: variant
        })
    }

    function handleSaveClick() {

    }

    return (
        <div className="menu">
            <div className="actions">
                <div className="action" onClick={handleSaveClick}>
                    <i className="fa-solid fa-floppy-disk"></i>
                </div>
            </div>
            <ClothingElement valueIdentifier="ped" label="Ped" firstInterval={[1, data.peds.length]} secondInterval={[0,0]} disableSecond = {true} images = {getPedImages()} handleElementChange = {handleElementChange} />
            <ClothingElement valueIdentifier="custom-ped" label="Custom Ped" firstInterval={[1, data.customPeds.length]} secondInterval={[0,0]} disableSecond = {true} images = {getCustomPedImages()} handleElementChange = {handleElementChange} />
        </div>
    )
}