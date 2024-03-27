import { useState } from "react";
import { NumberSelector, Selector } from "./number-selector";
import { fetchNui } from "../../utils/fetchNui";
import { ImageSelector } from "./image-selector";

interface ClothingElementProps {
    label: string;
    valueIdentifier: string;
    firstInterval: [number, number];
    secondInterval: [number, number];
    disableSecond: boolean;
    images: string[];
}


function Header(props: {label: string}) {
    return (
        <div className="header">
            <div className="label">{props.label}</div>
        </div>
    )
}

export function ClothingElement(props: ClothingElementProps) {
    const [componentSelector, setComponentSelector] = useState<Selector>(
        {min: props.firstInterval[0], max: props.firstInterval[1], value: props.firstInterval[0], 
            onChange: (value) => {
                setComponentSelector({...componentSelector, value})
                handleSelectorChange();
            }
        }
    );
    const [variantSelector, setVariantSelector] = useState<Selector>(
        {min: props.secondInterval[0], max: props.secondInterval[1], value: props.secondInterval[0], 
            onChange: (value) => {
                setVariantSelector({...variantSelector, value})
                handleSelectorChange();
            }
        }
    );

    function handleSelectorChange() {
        fetchNui<any>('selectorUpdated', {
            identifier: props.valueIdentifier,
            component: componentSelector.value,
            variant: variantSelector.value,
        }).then((response) => {
           
        })
    }

    function handleImageClick(index: number) {
        setComponentSelector({...componentSelector, value: index + 1});
        handleSelectorChange();
    }

    return (
        <div className="clothing-element">
            <Header label={props.label} />
            <ImageSelector images={props.images} show = {props.images.length > 0} onClick = {handleImageClick} />
            <NumberSelector 
                first = {componentSelector}
                second={variantSelector}
                disableSecond={props.disableSecond}
            />
           
        </div>
    );
}