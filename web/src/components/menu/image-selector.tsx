import "../../css/ImageSelector.css";
import { getImagePath } from "../../helpers/ImagePath";

function Image() {

    function getPath() {
        return getImagePath('a_m_m_genfat_01');
    }

    return (
        <div className="image">
            <img src={getPath()}></img>
        </div>
    )
}

interface ImageSelectorProps {
    images: string[];
    show: boolean;
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
                <Image key={index} />
            )
        })
    }

    return (
        <div className="image-selector" style={{maxHeight: getHeight()}}>

            {content()}
            
        </div>
    )
}