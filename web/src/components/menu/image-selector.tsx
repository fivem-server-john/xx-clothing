import "../../css/ImageSelector.scss";
import { Image } from "./image";

interface ImageSelectorProps {
    images: string[];
    show: boolean;
    onClick: (index: number) => void;
}

export function ImageSelector(props: ImageSelectorProps) {

    function getHeight() {
        if (props.show) {
            return "30vh";
        } else {
            return "0vh";
        }
    }

    function content() {
        if (!props.show) return null;
        return props.images.map((image, index) => {
            return (
                <Image key={index} image = {image} onClick = {() => {props.onClick(index)}}/>
            )
        })
    }

    return (
        <div className="image-selector" style={{maxHeight: getHeight()}}>

            {content()}
            
        </div>
    )
}