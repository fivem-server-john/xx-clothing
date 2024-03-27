import { useState } from "react";
import "../../css/NumberSelector.css";

export interface Selector {
    min: number;
    max: number;
    value: number;
    onChange: (value: number) => void;
}

interface NumberSelectorProps {
    first: Selector;
    second: Selector;
    disableSecond: boolean;
}

export function NumberSelector(props: NumberSelectorProps) {

    function Selector(props: {selector: Selector, disable: boolean}) {
        if (props.disable) return null;
        
        function handleChange(event: React.ChangeEvent<HTMLInputElement>) {
            let value = parseInt(event.target.value);
            if (value < props.selector.min) value = props.selector.min;
            if (value > props.selector.max) value = props.selector.max;
            props.selector.onChange(value);
        }

        function decrease() {
            let newValue = props.selector.value - 1;
            if (newValue < props.selector.min) newValue = props.selector.min;
            props.selector.onChange(newValue);
        }

        function increase() {
            let newValue = props.selector.value + 1;
            if (newValue > props.selector.max) newValue = props.selector.max;
            props.selector.onChange(newValue);
        }

        return (
            <div className="selector">
                <div className="arrow left" onClick={decrease}>
                    <i className="fa-solid fa-chevron-left"></i>
                </div>

                <input type="number" defaultValue={props.selector.value} onChange={handleChange}></input>

                <div className="arrow right" onClick={increase}>
                    <i className="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        )
    }

    return (
        <div className="number-selector">
            <div className="selectors">
                <Selector selector={props.first} disable={false}/>
                <Selector selector={props.second} disable={props.disableSecond}/>
            </div>
            
        </div>
    )
}