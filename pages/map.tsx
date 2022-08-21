import styles from "./Map.module.css";
import Image from "next/image";
import MenuBar from "../components/MenuBar";

const MapPage: React.FC = () => {
  return (
    <div>
      <div className={styles.loading}>loading...</div>
      <iframe
        src="https://my.atlistmaps.com/map/63473e89-4241-42d7-aad4-415857cd5b45?share=true"
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
