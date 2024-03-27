import { useState } from "react";
import { NumberSelector, Selector } from "./number-selector";
import { fetchNui } from "../../utils/fetchNui";
import { ImageSelector } from "./image-selector";

interface ClothingElementProps {
    label: string;
    valueIdentifier: string;
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
        {min: 0, max: 10, value: 0, 
            onChange: (value) => {
                setComponentSelector({...componentSelector, value})
                handleSelectorChange();
            }
        }
    );
    const [variantSelector, setVariantSelector] = useState<Selector>(
        {min: 0, max: 5, value: 0, 
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

    return (
        <div className="clothing-element">
            <Header label={props.label} />
            <ImageSelector images={["", "", "", "", "", ""]} show = {true} />
            <NumberSelector 
                first = {componentSelector}
                second={variantSelector}
                disableSecond={false}
            />
           
        </div>
    );
}