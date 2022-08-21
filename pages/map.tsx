import styles from "./Map.module.css";
import Image from "next/image";

const MapPage: React.FC = () => {
  return (
    <div className={styles.mapframe}>
      <iframe
        src="https://my.atlistmaps.com/map/63473e89-4241-42d7-aad4-415857cd5b45?share=true"
        allow="geolocation"
        width="100%"
        height="800px"
        frameborder="0"
        scrolling="no"
        allowfullscreen
      ></iframe>
    </div>
  );
};
export default MapPage;
