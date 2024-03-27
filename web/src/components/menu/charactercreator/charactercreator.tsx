import { useEffect, useState } from "react";
import { fetchNui } from "../../../utils/fetchNui";
import { ClothingElement } from "../clothing-element";
import { json } from "stream/consumers";

let testData: CharacterCreaterData = {
    peds: ["a_m_m_genfat_01",  "a_m_m_acult_01"],
    customPeds: ["a_m_m_genfat_01"]
}


interface CharacterCreaterData {
    peds: string[]
    customPeds: string[]
}


export function CharacterCreator() {
    const [data, setData] = useState<CharacterCreaterData>(testData);

    useEffect(() => {
        fetchNui<any>('fetchMenuData', {
            type: 1,
        }).then((response) => {
            console.log(JSON.stringify(response));
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

    return (
        <div className="menu">
            <ClothingElement valueIdentifier="ped" label="Ped" firstInterval={[1, data.peds.length]} secondInterval={[0,0]} disableSecond = {true} images = {getPedImages()} />
            <ClothingElement valueIdentifier="custom-ped" label="Custom Ped" firstInterval={[1, data.customPeds.length]} secondInterval={[0,0]} disableSecond = {true} images = {getCustomPedImages()} />
        </div>
    )
}