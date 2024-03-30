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


function Header(props: {label: string, isExpandable: boolean, isExpanded: boolean, onClick: Function}) {
    return (
        <div className="header" onClick={() => {props.onClick()}}>
            <div className="label">{props.label}</div>

            {props.isExpandable && 
                <div className="expand-arrow">
                    <i className={props.isExpanded ? "fa-solid fa-chevron-up" : "fa-solid fa-chevron-down"}></i>
                </div>
            }

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

    const [isExpanded, setIsExpanded] = useState<boolean>(false);

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

    function isExpandable() {
        return props.images.length > 0;
    }

    function handleClick() {
        if (isExpandable() === false) return;

        setIsExpanded(!isExpanded);
    }

    return (
        <div className="clothing-element" >
            <Header onClick={handleClick} label={props.label} isExpandable = {isExpandable()} isExpanded = {isExpanded}/>
            <ImageSelector images={props.images} show = {props.images.length > 0 && isExpanded} onClick = {handleImageClick} />
            <NumberSelector 
                first = {componentSelector}
                second={variantSelector}
                disableSecond={props.disableSecond}
            />
           
        </div>
    );
}