import { isEnvBrowser } from "../utils/misc";

export function getImagePath(name: string, type: string = 'webp') {

    if (isEnvBrowser()) {
        return '/images/' + name + '.'+ type;
    }

    return 'nui://xx-clothing/web/public/images/' + name + '.' + type;
}