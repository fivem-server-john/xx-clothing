import { useRef, useState } from "react";
import { getImagePath } from "../../helpers/ImagePath";
import { useIntersection } from '../../hooks/intersectionObserver';

interface ImageProps {
    image: string;
    onClick: Function;
}

export function Image(props: ImageProps) {
    const [isInView, setIsInView] = useState(false);
    const imgRef = useRef<HTMLDivElement | null>(null);
    useIntersection(imgRef, () => {
        setIsInView(true);
    });

    function getPath(image: string) {
        return getImagePath(image);
    }

    return (
        <div className="image" ref={imgRef} onClick={() => {props.onClick()}}>

            {isInView && (
                <img src={getPath(props.image)}></img>
            )}
            
        </div>
    )
}