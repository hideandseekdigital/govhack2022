import styles from "./Map.module.css";
import Image from "next/image";
import MenuBar from "../components/MenuBar";

const MapPage: React.FC = () => {
  return (
    <div>
      <div className={styles.loading}>loading...</div>
      <iframe
        src="https://my.atlistmaps.com/map/585cdeba-ecfe-4bb9-a9fe-cc1c29b5c067?share=true"
        allow="geolocation"
        width="100%"
        height="700px"
        frameBorder="0"
        scrolling="no"
        allowFullScreen
        className={styles.map}
      ></iframe>

    </div>
  );
};
export default MapPage;
