import React, {useState} from 'react';
import '../css/App.scss';
import { fetchNui } from "../utils/fetchNui";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { setTranslations } from '../utils/translation';
import { Menu } from '../pages/menu';


const App: React.FC = () => {
    useNuiEvent<any>('setTranslations', (data: any) => {
        console.log("Translations received");
        setTranslations(data);
    });

    return (
        <div className="App">
            <Menu />
        </div>
    );
  
}

export default App;

